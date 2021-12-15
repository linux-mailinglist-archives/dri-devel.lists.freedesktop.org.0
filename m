Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31372475522
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 10:25:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCBFC10E29D;
	Wed, 15 Dec 2021 09:25:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C2A10E29D
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 09:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639560343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GWH+xxBIXK7uXDC+5XTD46Bbs2W0QAgr8qSLmMPvMB4=;
 b=D9H2YebHPr994LcxVUoPyRIjnQTS8XumcJBc1MsuYZIN66ev/9PRPeKS6fXI3kwy+L02y0
 gpUU+eI1Vw3Q8KIbR2Phuru+Gjr7flz5KGf10JFPDwzIvePXV2+xLrHVTYRbrhGYPNdcaV
 umbAHXv5e1jQGu9NVY10TGolqPfCwa8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-cZAkoiy0Mq62A9Tdaz2uUQ-1; Wed, 15 Dec 2021 04:25:39 -0500
X-MC-Unique: cZAkoiy0Mq62A9Tdaz2uUQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 q17-20020adfcd91000000b0017bcb12ad4fso5685990wrj.12
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:25:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GWH+xxBIXK7uXDC+5XTD46Bbs2W0QAgr8qSLmMPvMB4=;
 b=WuiuTueWnP4WKyTA7Ht0TlIZ7VZjnIKvhpsGI4DNPO1IiIWGCTe2ZJnrr+TdSyUOAd
 LYMdje98xSIdjKwBEjcWcY+w+6pQMiexLJ5ir7RJe10P9/r1k65QwuoCafgArmrBIPLh
 7ncTSvIoRKKVekVpC0+1FtRSHQLBbbe+AW4h7Ir0GwRYqoTH5y07e6szhuk3vq70TZJL
 0pYhZCbhv2PttdWybpL804DKSARODVUNRNfC5Tc3VAAriOwHHcPgkGPP4i2JqPCpyT/9
 qU9aR55pxMYYyj08LDTG7hCjFzUnub9b1WfQJLNIAyeL6jQiQnklAD8bfafeF/taH5h5
 nNTw==
X-Gm-Message-State: AOAM533DVuhPBt9epFN3trflMy3V+Hh8gkSESg4DjjGNu4psvdak0Urf
 Fr4bYJKY/J6Q4Hoy7kp1fBbhthBFSxKGjvznuAUpe7VgyJ3zX5Zfr8QmN5oqtWPS0jfHshFaMzR
 RD019GZyUex0vP/suIWCsUMb2muud
X-Received: by 2002:a05:600c:4153:: with SMTP id
 h19mr3741060wmm.142.1639560338404; 
 Wed, 15 Dec 2021 01:25:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzm3KgsNdogzi/34h6/tWCF6TMRJ5gF1EudlIDOAGP99J594NcdLVqRr6tP8liP1XSytzZKhw==
X-Received: by 2002:a05:600c:4153:: with SMTP id
 h19mr3741046wmm.142.1639560338121; 
 Wed, 15 Dec 2021 01:25:38 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id c8sm1418362wmq.34.2021.12.15.01.25.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 01:25:37 -0800 (PST)
Message-ID: <612eadcf-7b12-6609-9397-5c3cb7064f6b@redhat.com>
Date: Wed, 15 Dec 2021 10:25:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 00/60] drm: Make all drivers to honour the nomodeset
 parameter
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20211215010008.2545520-1-javierm@redhat.com>
 <58d00cac-dbf1-9704-3c0b-16fd837a5b6b@suse.de>
 <2e76bd93-a65e-094c-15a4-77375906a1b0@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <2e76bd93-a65e-094c-15a4-77375906a1b0@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 12/15/21 10:12, Thomas Zimmermann wrote:

[snip]

>>
>> In each of the USB-based DRM drivers, replace module_usb_driver with 
>> drm_module_usb_driver.
>>
>> And then there's PCI [3] and platform drivers, [4] which can be handled 
>> similarly. Many PCI drivers open-code the module init and device 
>> registering with the driver-specific enable parameter. Maybe adding a 
>> driver-specific register function would make sense.
> 
> Just want to point out that the next time we add a new driver, it will 
> call drm_firmware_drivers_only() automatically if it uses such a macro.
> 

Yes, and it could also be used as an extension point in case we need more
logic like the drm_firmware_drivers_only() check for all drivers in the
future. So your suggestion is certainly the way to go.

I'll post a v2 when I get some time to work on this again.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

