Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FCF511BE4
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 17:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ECF910F5E5;
	Wed, 27 Apr 2022 15:29:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD2B10F5E8
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 15:29:19 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id m20so4108436ejj.10
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 08:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=3cBviZz3q70FXsDK6Pj1JdnEGmCPg6mI5zD0RZKDTEY=;
 b=WLWwH3ssCLmcWNZ33bt9H7KImp7hphdU2v9gSO8zxLJhUMGhXT4QeWvm/Q7TnpXJrM
 cMk8EhpN8CCSdeZYX2qyprbRN0OAYoTZ12K6aFpYBW1cCNwEAHj2sgr/eAM2tTXnJyvj
 iLGa8jWGrTTQFLSeWJo5MGHC5fPZO2iMU8W8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=3cBviZz3q70FXsDK6Pj1JdnEGmCPg6mI5zD0RZKDTEY=;
 b=mH7nb/FuItdbRcfViOxn9wVVYbNd2cWQq4uzIQZI0x3e/ZMnbLj55KVeCPXU+eRg8H
 AidZJa1RSSrdl+8FsZlHtsQUvvMQHuR7XdW2oNddY1A9qkO+4zXXm0/pCc+J/TYlka8d
 NN36+HylIY+JWBGhfmIuLtUrc35zJtExof0GlVYJZ1mSUtDTsvk/SnTLpKJ7jsuxvypR
 P7WVWnMceJiywqfiiIm0Bj+lLPHt3wcvGMemkF0OVm/EbSGR/N/Lnj7pN27MTgXL4Jto
 PJ+LQ7Q/GxAO4mTf6jnPYUjLdszpCiIC7GCieijEF+qgvEza8hC6U/65xV3tyZegNkwQ
 qPuA==
X-Gm-Message-State: AOAM530GlCZDZ8Cqw6DsOHA7dzlKOYoL8EgKfSAfUMrcvj+0oxRrAHlX
 JW3ddqwRueVcIytPRyJ2Owyw/w==
X-Google-Smtp-Source: ABdhPJxXXY4DNiqJmyyWuTbHk9BD3Ld/bvNZHbHUZ0P3YcRixcsu/nk/7xBwqKh+V7a1bfsISAFw/A==
X-Received: by 2002:a17:907:86a3:b0:6ec:aaa:7f82 with SMTP id
 qa35-20020a17090786a300b006ec0aaa7f82mr27262059ejc.651.1651073358267; 
 Wed, 27 Apr 2022 08:29:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 gk20-20020a17090790d400b006f3a85db71csm3241190ejb.49.2022.04.27.08.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 08:29:17 -0700 (PDT)
Date: Wed, 27 Apr 2022 17:29:15 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v3] drm/doc: Add sections about tiny drivers and external
 refs to intro page
Message-ID: <YmlhS3m6se0sqhnn@phenom.ffwll.local>
Mail-Followup-To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
References: <20220420072411.15104-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220420072411.15104-1-javierm@redhat.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 20, 2022 at 09:24:11AM +0200, Javier Martinez Canillas wrote:
> Learning about the DRM subsystem could be quite overwhelming for newcomers
> but there are lots of useful talks, slides and articles available that can
> help to understand the needed concepts and ease the learning curve.
> 
> There are also simple DRM drivers that can be used as example about how a
> DRM driver should look like.
> 
> Add sections to the introduction page, that contains references to these.
> 
> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Maybe needs more acks to land?

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Would be good we can hand out links to pretty htmldocs instead of lore
links to this patch, the latter is rather hard on the eyes :-)

Cheers, Daniel

> ---
> 
> Changes in v3:
> - Fix typos and grammar errors that found when re-reading the changes.
> 
> Changes in v2:
> - Remove paragraph that gave wrong impression that DRM is complex (Pekka Paalanen).
> - Add Thomas Zimmermann's and Pekka Paalanen's Acked-by tags.
> - Replace "Learning material" title with "External References" (Thomas Zimmermann).
> - Add a section about tiny DRM drivers being a good first example (Daniel Vetter).
> - Add some more external references that I found interesting since v1 was posted.
> 
>  Documentation/gpu/introduction.rst | 60 ++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 
> diff --git a/Documentation/gpu/introduction.rst b/Documentation/gpu/introduction.rst
> index 25a56e9c0cfd..f05eccd2c07c 100644
> --- a/Documentation/gpu/introduction.rst
> +++ b/Documentation/gpu/introduction.rst
> @@ -112,3 +112,63 @@ Please conduct yourself in a respectful and civilised manner when
>  interacting with community members on mailing lists, IRC, or bug
>  trackers. The community represents the project as a whole, and abusive
>  or bullying behaviour is not tolerated by the project.
> +
> +Simple DRM drivers to use as examples
> +=====================================
> +
> +The DRM subsystem contains a lot of helper functions to ease writing drivers for
> +simple graphic devices. For example, the `drivers/gpu/drm/tiny/` directory has a
> +set of drivers that are simple enough to be implemented in a single source file.
> +
> +These drivers make use of the `struct drm_simple_display_pipe_funcs`, that hides
> +any complexity of the DRM subsystem and just requires drivers to implement a few
> +functions needed to operate the device. This could be used for devices that just
> +need a display pipeline with one full-screen scanout buffer feeding one output.
> +
> +The tiny DRM drivers are good examples to understand how DRM drivers should look
> +like. Since are just a few hundreds lines of code, they are quite easy to read.
> +
> +External References
> +===================
> +
> +Delving into a Linux kernel subsystem for the first time can be an overwhelming
> +experience, one needs to get familiar with all the concepts and learn about the
> +subsystem's internals, among other details.
> +
> +To shallow the learning curve, this section contains a list of presentations
> +and documents that can be used to learn about DRM/KMS and graphics in general.
> +
> +There are different reasons why someone might want to get into DRM: porting an
> +existing fbdev driver, write a DRM driver for a new hardware, fixing bugs that
> +could face when working on the graphics user-space stack, etc. For this reason,
> +the learning material covers many aspects of the Linux graphics stack. From an
> +overview of the kernel and user-space stacks to very specific topics.
> +
> +The list is sorted in reverse chronological order, to keep the most up-to-date
> +material at the top. But all of them contain useful information, and it can be
> +valuable to go through older material to understand the rationale and context
> +in which the changes to the DRM subsystem were made.
> +
> +Conference talks
> +----------------
> +
> +* `An Overview of the Linux and Userspace Graphics Stack <https://www.youtube.com/watch?v=wjAJmqwg47k>`_ - Paul Kocialkowski (2020)
> +* `Getting pixels on screen on Linux: introduction to Kernel Mode Setting <https://www.youtube.com/watch?v=haes4_Xnc5Q>`_ - Simon Ser (2020)
> +* `Everything Great about Upstream Graphics <https://www.youtube.com/watch?v=kVzHOgt6WGE>`_ - Daniel Vetter (2019)
> +* `An introduction to the Linux DRM subsystem <https://www.youtube.com/watch?v=LbDOCJcDRoo>`_ - Maxime Ripard (2017)
> +* `Embrace the Atomic (Display) Age <https://www.youtube.com/watch?v=LjiB_JeDn2M>`_ - Daniel Vetter (2016)
> +* `Anatomy of an Atomic KMS Driver <https://www.youtube.com/watch?v=lihqR9sENpc>`_ - Laurent Pinchart (2015)
> +* `Atomic Modesetting for Drivers <https://www.youtube.com/watch?v=kl9suFgbTc8>`_ - Daniel Vetter (2015)
> +* `Anatomy of an Embedded KMS Driver <https://www.youtube.com/watch?v=Ja8fM7rTae4>`_ - Laurent Pinchart (2013)
> +
> +Slides and articles
> +-------------------
> +
> +* `Understanding the Linux Graphics Stack <https://bootlin.com/doc/training/graphics/graphics-slides.pdf>`_ - Bootlin (2022)
> +* `DRM KMS overview <https://wiki.st.com/stm32mpu/wiki/DRM_KMS_overview>`_ - STMicroelectronics (2021)
> +* `Linux graphic stack <https://studiopixl.com/2017-05-13/linux-graphic-stack-an-overview>`_ - Nathan Gauër (2017)
> +* `Atomic mode setting design overview, part 1 <https://lwn.net/Articles/653071/>`_ - Daniel Vetter (2015)
> +* `Atomic mode setting design overview, part 2 <https://lwn.net/Articles/653466/>`_ - Daniel Vetter (2015)
> +* `The DRM/KMS subsystem from a newbie’s point of view <https://bootlin.com/pub/conferences/2014/elce/brezillon-drm-kms/brezillon-drm-kms.pdf>`_ - Boris Brezillon (2014)
> +* `A brief introduction to the Linux graphics stack <https://blogs.igalia.com/itoral/2014/07/29/a-brief-introduction-to-the-linux-graphics-stack/>`_ - Iago Toral (2014)
> +* `The Linux Graphics Stack <https://blog.mecheye.net/2012/06/the-linux-graphics-stack/>`_ - Jasper St. Pierre (2012)
> -- 
> 2.35.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
