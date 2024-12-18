Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C46A69F67AC
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 14:51:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5392A10E31D;
	Wed, 18 Dec 2024 13:51:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="d7xJD5OH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F3F610E31D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 13:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734529889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CBRqOwC98UAa3SaYMdmEgqwI4ubnu6hJAFqJAz83z+o=;
 b=d7xJD5OHRW2oX1ViimswMqv3lq2//+rjUvf2BggAVUseSmDyt1X74i4fXxKxwS2E2pJ458
 AxstCnuUftbExoXKoMwDMFIuKMxysFLWdYjSQWHA3osf2rKP2cofSshNWxAq4UoxFOEgMz
 iEErZ6iSPlUX7xXuqhgeSYi4NQwpKVk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-HvBL6BFXMFWrEpWTbh_MSw-1; Wed, 18 Dec 2024 08:51:27 -0500
X-MC-Unique: HvBL6BFXMFWrEpWTbh_MSw-1
X-Mimecast-MFC-AGG-ID: HvBL6BFXMFWrEpWTbh_MSw
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-aa622312962so659456466b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 05:51:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734529886; x=1735134686;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CBRqOwC98UAa3SaYMdmEgqwI4ubnu6hJAFqJAz83z+o=;
 b=MTm80xJ0z5yoD2YydV4EU/RMbOJqfnSR2XotDA5zUMjhcuRWPnUhzLGqIkFo6fZsov
 pj7EtzcYgbXgdRxOGa9KxM65RxRaUisXXkdkYgQhxl9pfwA1c8t1PGvFdoBMUNcCsvqR
 VUAGti72yiz2cwYgqJyq9zNSSj3nCHi/uPVsKg2FmxaqH8uD1F5vjyMPBsCtpHdFC3tl
 GqkY4Ci44zMD84o1p1XgBD6ELaxseCNqDWW4K8G5M1V8X+kwu3QmrmE4q9NqtFNuO41e
 lC5/CgbHI1Y+9JB0/l5bG1hLexfF2+LDHksbhPAkQ4WuS5bViPrh8zDCdZ7Ilw6TP849
 x/mA==
X-Gm-Message-State: AOJu0YwDgEOXSDz//OhBG8DQVPpiY8z0GagVHULtJRak+g1kb3CELE6X
 6DeKj+MkRm5mGluw9YIg+o0s9evRisU5MoCJ9Mg34VjTlpLEMnSSEe2gk/m4SyZkfWEb6URaDod
 GXpAyZDfJGQTY9dhSXklH7RloArqV3Rj9MBCzz+lO5bSmtWs5QMMmAucuTYUHov2rO85IaPajUh
 KGu+xEECiu/l/R+0XMCamgRvyet6ZLa1jPV9gUIUqLjwte49JqXw==
X-Gm-Gg: ASbGncubGKN2Ujf64fkSrcMufjIC9e8Jr9K0QgbEKN8uoflJvx2YOkjZloPwPu5oWTP
 Vz33TI5XLHJoBPujS2yHkSdzhflclKUaBPVyQSKurAIm4a5511OMSl5C1GKY2DoYJ2bXp+gVrkQ
 BQ5pHfEDjh9T7otttcY/DQyPXA6+2+gHcHIh8TYdd+VAgSUsprs2pZV03QvELvU3IRViXCDGH36
 86ieaDX8Bb13Ko/3y/niqmyDmTTiOeU3RQxl80gZ7DoV+u0ZtCOtf9MAHfjF7vZiG60v6bYkvhH
 BXusi4+oREy7v7zu2c0Q
X-Received: by 2002:a17:906:30ca:b0:aa6:5385:90ef with SMTP id
 a640c23a62f3a-aabf49a55a8mr205437466b.61.1734529886230; 
 Wed, 18 Dec 2024 05:51:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmyh7auueECthJ3kBRU4j2gzdSHEYyNkqePasiyvj525R8OL44ainqPOjNdq4CTy8r4c3tZg==
X-Received: by 2002:a17:906:30ca:b0:aa6:5385:90ef with SMTP id
 a640c23a62f3a-aabf49a55a8mr205435366b.61.1734529885745; 
 Wed, 18 Dec 2024 05:51:25 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab9606839csm571270366b.61.2024.12.18.05.51.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2024 05:51:25 -0800 (PST)
Message-ID: <6660b69e-4cd3-4d94-8617-365b043aece5@redhat.com>
Date: Wed, 18 Dec 2024 14:51:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/6] drm/log: Introduce a new boot logger to draw the
 kmsg on the screen
To: dri-devel@lists.freedesktop.org
References: <20241204160014.1171469-3-jfalempe@redhat.com>
 <feb72a8c-06c1-48d9-abb0-d680c11922a7@web.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <feb72a8c-06c1-48d9-abb0-d680c11922a7@web.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: A42qGXOy13ZoFBs9KLD_ksmBdjXhUD_7lJVkLFlPEMk_1734529887
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/12/2024 13:25, Markus Elfring wrote:
> …
>> +++ b/drivers/gpu/drm/clients/drm_log.c
>> @@ -0,0 +1,370 @@
> …
>> +static int drm_log_count_modeset(struct drm_client_dev *client)
>> +{
>> +	struct drm_mode_set *mode_set;
>> +	int count = 0;
>> +
>> +	mutex_lock(&client->modeset_mutex);
>> +	drm_client_for_each_modeset(mode_set, client)
>> +		count++;
>> +	mutex_unlock(&client->modeset_mutex);
>> +	return count;
>> +}
> …
> 
> Under which circumstances would you become interested to apply a statement
> like “guard(mutex)(&client->modeset_mutex);”?
> https://elixir.bootlin.com/linux/v6.13-rc3/source/include/linux/mutex.h#L201

Ok, I didn't know about this new syntax, thanks for pointing this to me.
Regarding drm_log, I kept the mutex usage simple, as there is only one 
mutex_lock() and one mutex_unlock() in each function, which means there 
is not much benefit to use the guard syntax.
I will keep that in mind, and if there is a need to have more complex 
mutex handling, I will probably use this.

Best regards,

-- 

Jocelyn
> 
> Regards,
> Markus
> 

