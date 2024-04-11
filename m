Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5768A0908
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 09:01:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E46310EEDA;
	Thu, 11 Apr 2024 07:01:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DWQrz9kB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E5310EED4
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 07:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712818908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9ivstmx9lR/obUjl+Y2PdWfRdGzPaR7pZ5qY2XCvju8=;
 b=DWQrz9kBHWN/OUm/49lPXV+WYGRegWnflRer6bgwG+etGNGdwZqfGIyI0t3BVQ4mXHMR1b
 6g6YmUAqhcIgx7ghbWiMpVJ+7Plm+CSJoYyiUixdtnmJvYoPnBnKkcfNiod8+NmzTU6lfV
 yZcRtbX0eD4n1mFWzuwl5fv3Lw5De3c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-76jtristPvugxmGn6NRYDQ-1; Thu, 11 Apr 2024 03:01:46 -0400
X-MC-Unique: 76jtristPvugxmGn6NRYDQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4169d69ce6bso13605975e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 00:01:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712818905; x=1713423705;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9ivstmx9lR/obUjl+Y2PdWfRdGzPaR7pZ5qY2XCvju8=;
 b=XoYGig/FdhNH1TeFXcRUjfGh5R9ZYNi0UgF9AhM3L82sBlIOfQz2IVwbkOvPL+uSvf
 tx58Nss2jbrDRAWPHpvatNQyhRSht/Ljrafpq4kuq/iBvp3gR4GhqofsKRtXT7rL918C
 szrwNZm2zzzBb8HLcdP4sugE9YUmQwnGBNvnBIkrRR3vrV8hpwCHNDgrYxegzQX92bNM
 Qz6t9YKQWgQLnDfa9yyuLkyyqyYQwcqHHZ4DpvPmcoGvy6XuMYSMu9ae9aKy8kytvori
 ssbi5AC8BRvNcB9N0jadZc5GYwMo/Qhuu+SkukCcF8Vhj6KH1FGMq3metiZ2tjUbajFT
 dFJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTBqTcp71z+6iYR+FR51Zj3aGnJL4enEBjGIgxIpLy4Bk/OrOY88m/R7S2aTN0ERzDiAHexywVhXX3ksjDJMczTlKi0oCfZi28zxmbxlAH
X-Gm-Message-State: AOJu0YzArv5kk0g8hL31thjzOd4DKs9MhBN/zpeu/vQZgEUgiKdLYVaL
 LxDQRx2E/zMAy3WoKxsAE5k3BZSxWW6/mBEHAiOUfFeDYgxO4xRfMsSWk7HFSBIApVJZF/LfCT2
 KOkwPM2nYfemwomrzKNJEP5UrEPaEFDoyK62ESEnCyEkgF2IomgYddKbKcL9ir6d1lA==
X-Received: by 2002:a05:600c:54e5:b0:416:b8c9:e77a with SMTP id
 jb5-20020a05600c54e500b00416b8c9e77amr3276986wmb.16.1712818905305; 
 Thu, 11 Apr 2024 00:01:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIkX7ovyX/jiCzOShkI4BouYlXk6bpRc4za/eMedbIqDSmMiPTFzIq94d6S3ns+OF27vZRFQ==
X-Received: by 2002:a05:600c:54e5:b0:416:b8c9:e77a with SMTP id
 jb5-20020a05600c54e500b00416b8c9e77amr3276968wmb.16.1712818904963; 
 Thu, 11 Apr 2024 00:01:44 -0700 (PDT)
Received: from localhost (63.pool85-54-53.dynamic.orange.es. [85.54.53.63])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a5d4808000000b0034599eca6c9sm1038697wrq.41.2024.04.11.00.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Apr 2024 00:01:44 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: neil.armstrong@linaro.org, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Russell King <linux@armlinux.org.uk>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH RESEND] drm/armada: drop unneeded MODULE_ALIAS
In-Reply-To: <7c612f63-fd7d-4f5a-ace6-05b2bc29f3eb@linaro.org>
References: <20240410082218.46525-1-krzysztof.kozlowski@linaro.org>
 <7c612f63-fd7d-4f5a-ace6-05b2bc29f3eb@linaro.org>
Date: Thu, 11 Apr 2024 09:01:43 +0200
Message-ID: <874jc8s7qg.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Neil Armstrong <neil.armstrong@linaro.org> writes:

Hello Neal,

> On 10/04/2024 10:22, Krzysztof Kozlowski wrote:
>> The MODULE_DEVICE_TABLE already creates proper alias for platform
>> driver.  Having another MODULE_ALIAS causes the alias to be duplicated.
>> 
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> 
>> ---
>> 
>> Resent third time
>> https://lore.kernel.org/all/20220407202443.23000-1-krzysztof.kozlowski@linaro.org/
>> 
>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/gpu/drm/armada/armada_drv.c | 1 -
>>   1 file changed, 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
>> index e51ecc4f7ef4..f48e2cf8de43 100644
>> --- a/drivers/gpu/drm/armada/armada_drv.c
>> +++ b/drivers/gpu/drm/armada/armada_drv.c
>> @@ -283,4 +283,3 @@ module_exit(armada_drm_exit);
>>   MODULE_AUTHOR("Russell King <rmk+kernel@armlinux.org.uk>");
>>   MODULE_DESCRIPTION("Armada DRM Driver");
>>   MODULE_LICENSE("GPL");
>> -MODULE_ALIAS("platform:armada-drm");
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>
> I think we'll need maxime or thomas ack to apply this via drm-misc-next
>

I don't think you need an explicit ack for them to commit it:

https://drm.pages.freedesktop.org/maintainer-tools/committer-drm-misc.html#merge-criteria

BTW, the patch looks good to me as well.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

