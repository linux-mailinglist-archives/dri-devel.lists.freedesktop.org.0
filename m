Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F908492C20
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 18:17:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD1D10E239;
	Tue, 18 Jan 2022 17:17:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A246010E239
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 17:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642526230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dResXzjP2VPrdVGJBheY5Q1u5tKiIYy/e1I4h6FSN7w=;
 b=E0/XPWpcIhgywIiyOXRCniKPb2G1Om0SBj7lzIZFIyPmlWf/YdxfinTQ9cugxqFuznQTG6
 /f7GLBAGmqRRGWL/yrTGfchEJ80tMie7DuvHp3e4QSWKm/X8U6Ap5uVRUcqRRXdi0VSorU
 Y/EKYbKJD+aSAZGI37zEfNkIAIGCzc4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-410-3x7I4ki2MWa_wPaL3KqwCg-1; Tue, 18 Jan 2022 12:17:09 -0500
X-MC-Unique: 3x7I4ki2MWa_wPaL3KqwCg-1
Received: by mail-wm1-f71.google.com with SMTP id
 a3-20020a05600c348300b0034a0dfc86aaso2299382wmq.6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 09:17:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dResXzjP2VPrdVGJBheY5Q1u5tKiIYy/e1I4h6FSN7w=;
 b=m0ka95MFlPzxK3M9YmW2q42D5u9zvwGf4gb0xJwU83XaaWmDGbnLaONgw6P9BeXPob
 0Uj120tdsYv0x/gr60cjxb+cWEGxcYeRVLbWD2SxP+TaKcooIunGEkpwiXrS57QRR8bz
 omduqDb6pbEmM/BFB+pDVni/0qHEn/3cVFv/NKUdb6uEmtuPshGS69qinfKdP6YUuyM3
 OvPe4d4elDjZwwYyZJNKpg/9kS6Trp8/PKtOJ6yxmSImbVdimdBVFTBj+Kh9PS60bpfM
 L/Bb7HDqswCn9yNj7d0dqtCbKW3Fk/fk/md1FfVgEo00fvQbAr1483taI+peiFhzE4PC
 GaDw==
X-Gm-Message-State: AOAM53214SyyGWbgHW/2p1OI6ul7atE6HFXYSXHPcc0RNrovKqBbIhAL
 6IZ3BEEz6OLCMT+RStpvey4RaWTln7clKnutl3v1/gqxn0xy4GLQzz8FN+7W8TCRbzANdYa9BOs
 yws43CmnbNTq4SMlLB8xD/vs33HQ9
X-Received: by 2002:adf:f6c8:: with SMTP id y8mr24312939wrp.91.1642526227935; 
 Tue, 18 Jan 2022 09:17:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQ+t8Uy8X2akXh4Tx7C2ltpv6nq6HGFhZtwHGax0TkJfwqhCw0OWpg6qy3Asd5opcy58Fh0A==
X-Received: by 2002:adf:f6c8:: with SMTP id y8mr24312924wrp.91.1642526227711; 
 Tue, 18 Jan 2022 09:17:07 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id r19sm2910012wmh.42.2022.01.18.09.17.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 09:17:07 -0800 (PST)
Message-ID: <8a8bbee0-1be8-5daa-fc86-dcaae4b78f8c@redhat.com>
Date: Tue, 18 Jan 2022 18:17:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] mgag200 fix memmapsl configuration in GCTL6 register
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org
References: <20220114094754.522401-1-jfalempe@redhat.com>
 <20220114094754.522401-2-jfalempe@redhat.com>
 <b6526036-fcfb-734a-b45f-9ceec8aa656f@redhat.com>
 <fd5773a1-d780-4155-16fb-1c8f7fb73999@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <fd5773a1-d780-4155-16fb-1c8f7fb73999@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: michel@daenzer.net, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/18/22 17:52, Jocelyn Falempe wrote:
> On 18/01/2022 17:38, Javier Martinez Canillas wrote:
>> Hello Jocelyn,
>>
>> On 1/14/22 10:47, Jocelyn Falempe wrote:
> 
>>
>> My worry is if this could cause other issues so I would only do this change
>> if (is_kdump_kernel()), to make it as non intrusive as possible. And also
>> add a verbose comment about why this is needed.
> 
> This change must be done in the "first" kernel, so that when kdump 
> starts, it doesn't hang the machine by writing to the VGA interface, in 
> the early boot code.
> 

Ah, got it. The patch then makes sense to me as is in that case.

My comment about documenting why this is needed still applies though.  

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

