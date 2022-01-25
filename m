Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2F449B7AE
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 16:34:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C8710E3BD;
	Tue, 25 Jan 2022 15:34:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 786F710E565
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 15:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643124849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gYJM0P1mp5NgX5FuvA0vc0pACL34+rgEJ9Vi+JjrcqU=;
 b=ezqerXJ02Pz3etYKGYh0hyTjhCfzr4h4fgWOTbhUvQ/B5Ev5RsXTe0mvRonziFKw6U4uoZ
 dMwot4Y3eSHHO/op42wzT8tKm+Jj9j3QeCRtTTlqUcmi2+S+xoST0M8xJQroVLhQyunA9l
 sai3cs8my0BEHIFLCkXarOOy3QtNRjo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-360-A_h_9vkzONquX3dFg1IksQ-1; Tue, 25 Jan 2022 10:34:08 -0500
X-MC-Unique: A_h_9vkzONquX3dFg1IksQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 p17-20020aa7c891000000b004052d1936a5so10895162eds.7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 07:34:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gYJM0P1mp5NgX5FuvA0vc0pACL34+rgEJ9Vi+JjrcqU=;
 b=mnWKyZzBJEV1BpTKNCgHe41BOxhCOy59PhRpD3pKdAhEVlw1oIMyR4ziuClsz6mFCc
 98m5D3Q0yR30FSDcnH3VsIZGyZaxwhxFDJ5WIec5gfp+BKVH4GWC8ai1Th2B7RTWKuSP
 iL9EbaORpHJ2bhAPtM+x7c+oQy2Tt7fVCNZhqkhy6jRtvwcwBUWFML6rnPTFSNgl7APH
 S0qjPsR5odnSI2qOGRRMQWn/wX4LQkPuDII9U9GlJix3Xzsaw/kiLplnF2hy7KSJU0vQ
 zuYjNDIaUeSdCRTFD0lXTkqdgc2ga11mqyhMDp89rcpAeyobqV4Ju9nx9h0A9lNTPitN
 S9vA==
X-Gm-Message-State: AOAM53283CkwNpMmx/SrjeqKfofNalHEcRIyGvH/65BNFiT4w+/iaNcx
 LLQ97NyAn1ZM8UnzkRJLJxO5WKaS+Kx7RahgpI3leJS7RkbmGgRiJDNElaKraAU18g2Q04DI5vI
 oR49DLJwUV8pEWdEuCAlBHpHxQW+v
X-Received: by 2002:a17:907:94d4:: with SMTP id
 dn20mr1803384ejc.77.1643124846823; 
 Tue, 25 Jan 2022 07:34:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxWVbzv4cJi6N1cXVjMID/2VItL7lLUsXMZqk6fcGrT+747KuQr+V0NKS0IMkQOYCGfVsrZEg==
X-Received: by 2002:a17:907:94d4:: with SMTP id
 dn20mr1803357ejc.77.1643124846605; 
 Tue, 25 Jan 2022 07:34:06 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id c5sm8455216edk.43.2022.01.25.07.34.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 07:34:06 -0800 (PST)
Message-ID: <16f9e064-99cc-4205-d03e-ae41ed034309@redhat.com>
Date: Tue, 25 Jan 2022 16:34:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 0/5] sysfb: Fix memory-region management
To: Thomas Zimmermann <tzimmermann@suse.de>, zackr@vmware.com,
 javierm@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@linux.ie, daniel@ffwll.ch, deller@gmx.de
References: <20220125091222.21457-1-tzimmermann@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220125091222.21457-1-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On 1/25/22 10:12, Thomas Zimmermann wrote:
> Request framebuffer memory in simpledrm and simplefb. Do a hot-unplug
> operation when removing fbdev firmware drivers.
> 
> After being unloaded by a hardware driver, simplefb leaves behind the
> firmware framebuffer's platform device. This prevents other drivers
> from acquiring the memory as reported at [1].
> 
> Patch 1 changes the removal code of remove_conflicting_framebuffers()
> to remove the underlying device and the rsp memory region.
> 
> Patches 2 to 4 update sysfb and its drivers. The sysfb code does no
> longer mark the framebuffer memory with IORESOURCE_BUSY. Instead, the
> device drivers acquire the memory when they probe the device.
> 
> Patch 5 adds a todo item to acquire memory regions in all DRM drivers.
> 
> Tested with simpledrm and simplefb.
> 
> [1] https://lore.kernel.org/dri-devel/20220117180359.18114-1-zack@kde.org/
> 
> v2:
> 	* fix possible NULL deref in simpledrm (Jocelyn)
> 	* various style fixes (Javier)


The entire series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

Regards,

Hans


> 
> Javier Martinez Canillas (1):
>   drivers/firmware: Don't mark as busy the simple-framebuffer IO
>     resource
> 
> Thomas Zimmermann (4):
>   fbdev: Hot-unplug firmware fb devices on forced removal
>   drm/simpledrm: Request memory region in driver
>   fbdev/simplefb: Request memory region in driver
>   drm: Add TODO item for requesting memory regions
> 
>  Documentation/gpu/todo.rst        | 15 +++++++
>  drivers/firmware/sysfb_simplefb.c |  2 +-
>  drivers/gpu/drm/tiny/simpledrm.c  | 22 ++++++++---
>  drivers/video/fbdev/core/fbmem.c  | 29 ++++++++++++--
>  drivers/video/fbdev/simplefb.c    | 65 +++++++++++++++++++++----------
>  include/linux/fb.h                |  1 +
>  6 files changed, 105 insertions(+), 29 deletions(-)
> 
> 
> base-commit: 0bb81b5d6db5f689b67f9d8b35323235c45e890f
> prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
> prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
> prerequisite-patch-id: 8e52143a6cd7b8fb789e656208f6edde71d0f499
> 

