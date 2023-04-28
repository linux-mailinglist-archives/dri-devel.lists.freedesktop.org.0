Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D932A6F1A80
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 16:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A22A10E134;
	Fri, 28 Apr 2023 14:32:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E7510E297
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 14:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682692349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T6nMtf6Gzq3uJ6hYj+VP/gNrA7S63KDC0HhAUOQNVRE=;
 b=e1p/qXvPgu4ZsCyS5iuNO1yky27cGDerDjHxrZo+oPWqhw9iX9d4GGsiM7VkMh2xqwJ1o+
 gwlKZJcF3qYwCG0omc6WgooGgJbjWPcW29qfHngmZ8n302VsXyXGgr0Zmy2mI/YAIvxdA+
 Z8tEYPTXXiZN/9JrrHUV1w79888FYCA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-ppG8RSuCO4W3qEc91DEVhA-1; Fri, 28 Apr 2023 10:32:20 -0400
X-MC-Unique: ppG8RSuCO4W3qEc91DEVhA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f168827701so38546595e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 07:32:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682692327; x=1685284327;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T6nMtf6Gzq3uJ6hYj+VP/gNrA7S63KDC0HhAUOQNVRE=;
 b=SJHMeYwmupdKGSTQqUMQXRERFGwxYAdZ0aJWRJ6udNN1eyznYET8tTXe9/WLnsHBAa
 vXb//Q7SuEX8+waxbbZVxhWQTru1ZMYWFU7k2z4r+CE6ZrzC4Zowxpo1gY0GBN8SPlS+
 K26MI/X/2ork0FBm4t2ui9h8nVDt274Tky/2FlPcbS009qvaZoArgTv4Ao/W5tF/QKbi
 Einojuux5c5ca1hvq21vNKtYpz9ebhmiyN2DOxqCb/X4RKSShW2eKefLSl15YWYhWZil
 zfRq4syrOWtMOjG6dDpnBvdJgu2cY3fj4CbUw60NcjOES3MBSSyI1onL/ngb/rrL62LB
 C0Ww==
X-Gm-Message-State: AC+VfDwx1NpemXwACdd6pQRHJYWXA0e8ein0Z8cU0zTsGNGA/XY8Y/Rt
 TbvXEO8OtkG4mpNrdd6ZFCxdeaL7XGXWI2z9PAIq7TD+4m29CVvZx6o4ioV4U4j+z1GLzMhzsEz
 LHUBxuj2DGw5cWcU4oEX2XIh5EOZy
X-Received: by 2002:a1c:7502:0:b0:3ed:88f5:160a with SMTP id
 o2-20020a1c7502000000b003ed88f5160amr4234508wmc.11.1682692327542; 
 Fri, 28 Apr 2023 07:32:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6QwXnjgMravkmyjGU380q1EMostTJ3ocVKQHTXqvI7txqSAd4DxPGTwQhDuUSXMyhPd4gnAQ==
X-Received: by 2002:a1c:7502:0:b0:3ed:88f5:160a with SMTP id
 o2-20020a1c7502000000b003ed88f5160amr4234490wmc.11.1682692327225; 
 Fri, 28 Apr 2023 07:32:07 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f15-20020a7bcd0f000000b003f182cc55c4sm24510462wmj.12.2023.04.28.07.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 07:32:06 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, deller@gmx.de, geert@linux-m68k.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com
Subject: Re: [PATCH v2 07/19] fbdev/hecubafb: Use struct fb_info.screen_buffer
In-Reply-To: <20230428122452.4856-8-tzimmermann@suse.de>
References: <20230428122452.4856-1-tzimmermann@suse.de>
 <20230428122452.4856-8-tzimmermann@suse.de>
Date: Fri, 28 Apr 2023 16:32:06 +0200
Message-ID: <871qk4gjrt.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Use info->screen_buffer when reading and writing framebuffers in
> system memory. It's the correct pointer for this address space.
>
> The struct fb_info has a union to store the framebuffer memory. This can
> either be info->screen_base if the framebuffer is stored in I/O memory,
> or info->screen_buffer if the framebuffer is stored in system memory.
>
> As the driver operates on the latter address space, it is wrong to use
> .screen_base and .screen_buffer must be used instead. This also gets
> rid of casting needed due to not using the correct data type.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

