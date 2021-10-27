Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD1743CAC7
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 15:36:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 186566E899;
	Wed, 27 Oct 2021 13:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A628E6E899
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 13:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635341778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HGAgU8sFMkBfN+ogQRdoDOKIrf4t8BDQtiu9bep9LTI=;
 b=hQoeRy+jN7oVuC/v41gMde8H9K8u5d8NGCY5ZvsOxsC7wfufnDJg9Fr8LfF5ZETXbEK2MX
 sT1GXAF+KEmOU5j+Z1TDuv+PRFmH2KNuWA2KgNZG/OY3OYXzZlcnIiuzKQSUGcRuscVUEH
 PYx0WACj2OtiAjPnFU5FTTauxtHx6xQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-Lyo7Y9KvMoy8OFathT9pKA-1; Wed, 27 Oct 2021 09:36:17 -0400
X-MC-Unique: Lyo7Y9KvMoy8OFathT9pKA-1
Received: by mail-wm1-f70.google.com with SMTP id
 b79-20020a1c1b52000000b0032328337393so1781042wmb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 06:36:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HGAgU8sFMkBfN+ogQRdoDOKIrf4t8BDQtiu9bep9LTI=;
 b=IBKKIGgn2Jm+DFv1eiT4/Zsot9f09G3zosRMf0ONWApwSWB4H8cZNmseUKIDCRcM5U
 b/g+v0DgGBpDofNLbMt2214sEuk+Uv1PGXpw2mbXOqR2RR4fxSRzOEc+eYj3Tc20+fwG
 pp3ev4BGyQiSaX+DJuFP6WIHvrphSAnp2kadb3hJ/7oUm58JQUFlMLWyNerfcjVXk/nS
 FFGNzn2DDAn+do3/77sYRgkGfU356QxiKPsl/Hq1/V81TZts1nbiCR+kGQpGOHWp/RS8
 kPi+qWRrVnQb7xG3g0/HrtlIqlahH3q9T/fOzqZ8FEWQlByo/SP6ysCCg3lmTC6iDqJZ
 xKOQ==
X-Gm-Message-State: AOAM53326KUmQm4CeTXfl+BRAgZOzwEnkE2r5oTZ1d0K6WqT51WRZACR
 Nu4VQfrnRyxscRv/4GbvUbmdBhTcO/itBA4xRwhs5ydQ7DGTTDmtwGnJpQ1TD6UV0O3yaxAiY0K
 x5Ybw11pIm6BNyfycS7RtrIzFIt3j
X-Received: by 2002:a05:600c:1912:: with SMTP id
 j18mr5705918wmq.173.1635341776204; 
 Wed, 27 Oct 2021 06:36:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbmPrH9Z0DjjdY9RmSwXuXV5NSvYIJTaNRAESht+qDYjmHT9FSA7ryojF0uBa4uPXN3oLe2w==
X-Received: by 2002:a05:600c:1912:: with SMTP id
 j18mr5705891wmq.173.1635341775997; 
 Wed, 27 Oct 2021 06:36:15 -0700 (PDT)
Received: from [192.168.1.128] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id k63sm3534742wme.22.2021.10.27.06.36.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 06:36:15 -0700 (PDT)
Message-ID: <d243edae-9d3d-1a00-3dcd-c4c2d1fb02cd@redhat.com>
Date: Wed, 27 Oct 2021 15:36:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] [RESEND] drm: fb_helper: fix CONFIG_FB dependency
To: Arnd Bergmann <arnd@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Kees Cook <keescook@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Arnd Bergmann <arnd@arndb.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210927142816.2069269-1-arnd@kernel.org>
 <202109270923.97AFDE89DB@keescook> <YVXJLE8UqgcUNIKl@phenom.ffwll.local>
 <878ryeit9i.fsf@intel.com>
 <CAK8P3a0EG_C6OvG00Dg8SQacirNztLFjVonb5t2xQj9aFZ47Vg@mail.gmail.com>
 <3604fb90-f6c3-0fa2-c864-7f1795caee1e@redhat.com>
 <CAK8P3a0_9U0MDLcNG8GL_ZDCGQAsB=G7DBC0k1BYB1HNQTbu4Q@mail.gmail.com>
 <87tuh2hb17.fsf@intel.com>
 <CAK8P3a0KHwaSNqg_dz8-w6e_EJBrsQw_ti+5aErsSr+8AfV9cA@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAK8P3a0KHwaSNqg_dz8-w6e_EJBrsQw_ti+5aErsSr+8AfV9cA@mail.gmail.com>
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

On 10/27/21 15:25, Arnd Bergmann wrote:

[snip]

> That's not going to help in this case, the way the helper functions work is that
> you select them as needed, and you avoid the other dependencies. This part
> works fine.
> 
> We could probably get rid of this symbol by just making it an unconditional
> part of drm.ko, as almost every driver ends up using it anyway.
> 
> Arguably, this would make the end result worse, as you'd again get drm.ko
> itself to link against the old framebuffer code.
> 
> What I'm not sure about is whether drivers/video/fbdev/core/fb.ko could
> be split up into smaller parts so DRM_FBDEV_EMULATION could
> only depend on a set of common code without the bits that are needed
> for the classic fbdev drivers.
>

I attempted to do something like that but the changes were nacked:

https://patchwork.kernel.org/project/linux-fbdev/list/?series=538227
 
>       Arnd
> 

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

