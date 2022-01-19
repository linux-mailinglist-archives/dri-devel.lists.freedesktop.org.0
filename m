Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA14493E66
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 17:36:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C780510E281;
	Wed, 19 Jan 2022 16:36:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 181C510E281
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 16:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642610202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wFfzavDQx936gew1yKc6L3xdvrq4AiuVOm3iTQKqyl4=;
 b=gQkGdCol2uMai0BfucUQwJg93u66C33cpv1f0cxp9Jf0GZYgHvT8PdPMLrDz9l+JVaT0+x
 wOL8Ts32fjbVAvZ9WVhyD43oZQBn01ck7L5e8TJ61WO4Pf/wC6hjV8RZghb8Gr0oqkhs5T
 f+uxWYe2ZbJaKkBNcsETDdgn2CccCco=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-ITVAj8WUNX-jQ15TKHy05Q-1; Wed, 19 Jan 2022 11:36:40 -0500
X-MC-Unique: ITVAj8WUNX-jQ15TKHy05Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 j18-20020a05600c1c1200b0034aeea95dacso4523138wms.8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 08:36:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wFfzavDQx936gew1yKc6L3xdvrq4AiuVOm3iTQKqyl4=;
 b=NCZA5p00eYZ1iHHmHafoqcztHeFxrLPIEZ1l/b5m20oMC6Dvh/BHMafPKUSdYu+UV9
 QYfwCRgPaec6K+XeiAY01iAz2eFKGGRbSiGaGvIe7fjuEwaSBJ1hpaTX43dRFMce+lDq
 mttvAjiNxLTLzdhMDmkELMfhX30AOocBpcK40I2q7hGvpyizLVdhKOqnC2mOSaPAbB/b
 LIY/4XmGbdqV7GKLVFQPh5Hh4nM+DQ0gPd6sGRXbalsRYkzHIG9ik2TM7ktAlRrCFL/v
 DiaujuDR8QVMLbROHXpA9iuTswsxZ4bI6x7PkX+sEBaYgdOf6SAUSe5F73RfER9txZi+
 cZDQ==
X-Gm-Message-State: AOAM532VWGXTrFdvtBXocu8lM/asgJFgKtusELVxeJxauele3qbex0Eb
 Qp516K4DWn4TEHD+tdSF5gt9aZZjFsnN3G38L8fbGOtG4aXleawHy0HLoX8N/LjoaggByvxj+nX
 iAQBKqAmoAyfqXYJ9Oeyi+L62ZExA
X-Received: by 2002:a1c:7205:: with SMTP id n5mr3366823wmc.35.1642610199065;
 Wed, 19 Jan 2022 08:36:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjpQZRz85zHAYLtcOcLkHWqH3M6z5p0KSsS8eVX+uv169vc3M1z5+Tw15bnLGL99eZxN3fog==
X-Received: by 2002:a1c:7205:: with SMTP id n5mr3366799wmc.35.1642610198778;
 Wed, 19 Jan 2022 08:36:38 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id v5sm367492wrx.114.2022.01.19.08.36.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 08:36:38 -0800 (PST)
Message-ID: <e1861bd2-f59d-bfba-2a07-2e4359a6774a@redhat.com>
Date: Wed, 19 Jan 2022 17:36:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] drm/vmwgfx: Stop requesting the pci regions
To: Thomas Zimmermann <tzimmermann@suse.de>, Zack Rusin <zackr@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20220117180359.18114-1-zack@kde.org>
 <1c177e79-d28a-e896-08ec-3cd4cd2fb823@redhat.com>
 <da4e34772a9557cf4c4733ce6ee2a2ad47615044.camel@vmware.com>
 <5292edf8-0e60-28e1-15d3-6a1779023f68@suse.de>
 <afc4c659-b92e-3227-634f-7c171b7a74b3@suse.de>
 <80fc6b88d659dd7281364daccfed1fd294e785dc.camel@vmware.com>
 <89f1b9df-6ace-d59c-86a4-571cd92d0a4c@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <89f1b9df-6ace-d59c-86a4-571cd92d0a4c@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: Martin Krastev <krastevm@vmware.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/19/22 16:50, Thomas Zimmermann wrote:

[snip]

>>>> IMHO the best solution is to drop IORESOURCE_BUSY from sysfb and have
>>>> drivers register/release the range with _BUSY. That would signal the
>>>> memory belongs to the sysfb device but is not busy unless a driver
>>>> has
>>>> been bound. After simplefb released the range, it should be 'non-
>>>> busy'
>>>> again and available for vmwgfx. Simpledrm does a hot-unplug of the
>>>> sysfb
>>>> device, so the memory range gets released entirely. If you want, I'll
>>>> prepare some patches for this scenario.
>>>
>>> Attached is a patch that implements this. Doing
>>>
>>>    cat /proc/iomem
>>>     ...
>>>     e0000000-efffffff : 0000:00:02.0
>>>
>>>       e0000000-e07e8fff : BOOTFB
>>>
>>>         e0000000-e07e8fff : simplefb
>>>
>>>     ...
>>>
>>> shows the memory. 'BOOTFB' is the simple-framebuffer device and
>>> 'simplefb' is the driver. Only the latter uses _BUSY. Same for
>>> and the memory canbe acquired by vmwgfx.
>>>
>>> Zack, please test this patch. If it works, I'll send out the real
>>> patchset.
>>
>> Hmm, the patch looks good but it doesn't work. After boot: /proc/iomem
>> 50000000-7fffffff : pcie@0x40000000
>>    78000000-7fffffff : 0000:00:0f.0
>>      78000000-782fffff : BOOTFB
>>
>> and vmwgfx fails on pci_request_regions:
>>
>> kernel: fb0: switching to vmwgfx from simple
>> kernel: Console: switching to colour dummy device 80x25
>> kernel: vmwgfx 0000:00:0f.0: BAR 2: can't reserve [mem 0x78000000-
>> 0x7fffffff 64bit pref]
>> kernel: vmwgfx: probe of 0000:00:0f.0 failed with error -16
>>
>> leaving the system without a fb driver.
> 
> OK, I suspect that it would work if you use simpledrm instead of 
> simplefb. Could you try please? You'd have to build DRM and simpledrm 
> into the kernel binary.
>

Yes, I believe that should work.
 Zack, could you please try if just the following [0] make it works ?

That is, dropping the IORESOURCE_BUSY but not doing the memory region
request / release in simplefb and keeping it in the vmwgfx driver.

[0]:
From da6de1430b9dc252eccf2d6fee0446d33375fa6d Mon Sep 17 00:00:00 2001
From: Javier Martinez Canillas <javierm@redhat.com>
Date: Wed, 19 Jan 2022 14:41:25 +0100
Subject: [PATCH] drivers/firmware: Don't mark as busy the simple-framebuffer
 IO resource

The sysfb_create_simplefb() function requests a IO memory resource for the
simple-framebuffer platform device, but it also marks it as busy which led
to drivers requesting the same memory resource to fail.

Let's drop the IORESOURCE_BUSY flag and let drivers to request it as busy
instead.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/firmware/sysfb_simplefb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/sysfb_simplefb.c b/drivers/firmware/sysfb_simplefb.c
index 303a491e520d..76c4abc42a30 100644
--- a/drivers/firmware/sysfb_simplefb.c
+++ b/drivers/firmware/sysfb_simplefb.c
@@ -99,7 +99,7 @@ __init int sysfb_create_simplefb(const struct screen_info *si,
 
 	/* setup IORESOURCE_MEM as framebuffer memory */
 	memset(&res, 0, sizeof(res));
-	res.flags = IORESOURCE_MEM | IORESOURCE_BUSY;
+	res.flags = IORESOURCE_MEM;
 	res.name = simplefb_resname;
 	res.start = base;
 	res.end = res.start + length - 1;
-- 
2.33.1

