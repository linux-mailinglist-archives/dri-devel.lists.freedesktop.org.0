Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7468E3BA44A
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 21:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E00B6E1D7;
	Fri,  2 Jul 2021 19:13:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2126289FC5
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 19:13:30 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 a5-20020a7bc1c50000b02901e3bbe0939bso7056708wmj.0
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jul 2021 12:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=tOED2tOn9Yikj/x6fd7iQbXa0KJvo7UgiFUTomabzw8=;
 b=HdA9gmucLzYEKND75jvyacfRrkZBIkStBcSxyi6o7RBQiaQqPaoJVNJXihaZ/gI5jV
 KAyaLt8THf3Q5jzkMuzUcKC3gwArPZTTljZAQJVyefyTm4QAv/fJuUpqn44j2m539ZSl
 xRtZCoz+/N3AXY9Qfo4uDDjEAszzVVAqTqcRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tOED2tOn9Yikj/x6fd7iQbXa0KJvo7UgiFUTomabzw8=;
 b=b+CAFUFpm2p/h0nBoKMvykXIAgojxZKwlVzMmKpV3nppZ6p2OmIa9sLOTVr0jz+cC6
 LM7XbWdn0L9G7WlpnCEGGTGpjVD++TkaMVO61CD7uc0COrPzcydI9K4QwBeHRAs4JQV6
 AzjQdPVyGr/OBGVyTXxIbun4wSIO3m+ilckKlsBWkkV5NV4WcwT6bj0+zyMP3q3vK7PR
 2vPlMz06C6sOj0D0MqxcuzJOfM14MJUA2M09pg3mE5c/zrjiSJjBTrrqh81hTH6m/JSn
 6u7u3jgx8R/zadVfp8tlX2n65+/8JtYUWJIoAUSnaedV0kL/hHNCk76jR6C8eZqJOHbI
 lq3w==
X-Gm-Message-State: AOAM531Hc3dH8VoPdLGo4H+eiWAvWrqQWNwr4d54OO/KZXDvX3C44d1B
 Psj53FloIDBgUlhC6lagE/zGMQ==
X-Google-Smtp-Source: ABdhPJwzq+hP0xcM2dtmk33H9pQOqmM5DtdsbG4HImwWDXJKxpUpomGFpFG6cg0VaO05LnOZ0JWECg==
X-Received: by 2002:a05:600c:19d1:: with SMTP id
 u17mr1394268wmq.40.1625253208805; 
 Fri, 02 Jul 2021 12:13:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y66sm3946886wmy.39.2021.07.02.12.13.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 12:13:28 -0700 (PDT)
Date: Fri, 2 Jul 2021 21:13:26 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 0/2] drm/i915: IRQ fixes
Message-ID: <YN9lVtVDtM7PPlqW@phenom.ffwll.local>
References: <20210701085833.26566-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210701085833.26566-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: matthew.brost@intel.com, airlied@linux.ie, mika.kuoppala@linux.intel.com,
 intel-gfx@lists.freedesktop.org, chris@chris-wilson.co.uk,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 01, 2021 at 10:58:31AM +0200, Thomas Zimmermann wrote:
> Fix a bug in the usage of IRQs and cleanup references to the DRM
> IRQ midlayer.
> 
> Preferably this patchset would be merged through drm-misc-next.
> 
> v4:
> 	* switch IRQ code to intel_synchronize_irq() (Daniel)
> v3:
> 	* also use intel_synchronize_hardirq() from other callsite
> v2:
> 	* split patch
> 	* also fix comment
> 	* add intel_synchronize_hardirq() (Ville)
> 	* update Fixes tag (Daniel)
> 
> Thomas Zimmermann (2):
>   drm/i915: Use the correct IRQ during resume
>   drm/i915: Drop all references to DRM IRQ midlayer

Both pushed to drm-intel-gt-next, thanks for your patches.
-Daniel

> 
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c       | 2 +-
>  drivers/gpu/drm/i915/gt/intel_ring_submission.c | 2 +-
>  drivers/gpu/drm/i915/i915_drv.c                 | 1 -
>  drivers/gpu/drm/i915/i915_irq.c                 | 5 -----
>  4 files changed, 2 insertions(+), 8 deletions(-)
> 
> 
> base-commit: 67f5a18128770817e4218a9e496d2bf5047c51e8
> --
> 2.32.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
