Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D847843E53E
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 17:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC08B6E04E;
	Thu, 28 Oct 2021 15:34:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB8EC6E99A
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 15:34:03 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id k7so10869172wrd.13
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 08:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jfRQ7gqTgtW5CxclF2UX/vdahfjwAzPo2pv5xSj+kuY=;
 b=SBiBdKq8M35+b6d7HtjcPxhaKgAE3E2Lf4i9qGQ3ZDxRCe3AY8/SmbmqY/S3LVm1nt
 bchZVb1KXGcdmy2Refht/Bi4atd9Qy2GNvF8xI2ReDjg7WL4MmLLGApHYIMiHMWGTfO4
 B5ouWWGVrVSd4nHbj7hqAeYkcZNBY2soBX9rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jfRQ7gqTgtW5CxclF2UX/vdahfjwAzPo2pv5xSj+kuY=;
 b=wQv+bsiuL+LAKeuP7Do0Y/DjMgBE5AcVqkugIZD4UAGkrCEiJPsWP/V82Eqz+RMJ3M
 QoD21HuURfFUXjLCxFAXnIyoKNs8XsqNPTI6+A/QDEhs/Y0lVHaSN2PfZZnwxloYuwDb
 BUznY9IkayWQSFs1w7rk33Io6yLMd3kHnbqYyHx2KOsGYFlRllj/sG3gJrwAP2UOVh5M
 svM2Fld4H6bcJ8nbPxRCw+OE8dlziizB1UI5o7QrxToZRORpxmUtZN+iy68uvn3A3GjV
 rzpjAGxd/ktPai1Yy9ElUcqSYornUlMvQ033piyZfhKGiKywoLv6DMdJZvnZzg3EcMqu
 WQ7Q==
X-Gm-Message-State: AOAM5318NUSXwPXznlf889UF1/2N4RwwYEdRZSrsQfWmLdOhzgLBw8i2
 fkW86nbDfWx8ESxAD9B5w+N+JA==
X-Google-Smtp-Source: ABdhPJxe49qpQBfDUQ93/UJIrDmQvKmbP5Jhka7fKF3kjs/+wDMbKN33HdoQ05gq7iTGuVED7TECGQ==
X-Received: by 2002:a05:6000:1a86:: with SMTP id
 f6mr6714697wry.343.1635435242440; 
 Thu, 28 Oct 2021 08:34:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f20sm3644437wmq.38.2021.10.28.08.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 08:34:01 -0700 (PDT)
Date: Thu, 28 Oct 2021 17:33:59 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Auld <matthew.william.auld@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i195: Remove some dead struct fwd decl
 from i915_drv.h
Message-ID: <YXrC5xl+kB0PhOMX@phenom.ffwll.local>
References: <20211022082200.2684194-1-daniel.vetter@ffwll.ch>
 <CAM0jSHOm-fhS_ANcoU+_vOa2=9ewFk+mqPr0XKU5jxQB6WxonQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAM0jSHOm-fhS_ANcoU+_vOa2=9ewFk+mqPr0XKU5jxQB6WxonQ@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 22, 2021 at 09:39:13AM +0100, Matthew Auld wrote:
> On Fri, 22 Oct 2021 at 09:22, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > Gone with userptr rewrite by Maarten in ed29c2691188 ("drm/i915: Fix
> > userptr so we do not have to worry about obj->mm.lock, v7.")
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> 
> s/i195/i915/

Fixed&merged, thanks for taking a look.
-Daniel

> 
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> 
> > ---
> >  drivers/gpu/drm/i915/i915_drv.h | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> > index 12256218634f..2321f895cdea 100644
> > --- a/drivers/gpu/drm/i915/i915_drv.h
> > +++ b/drivers/gpu/drm/i915/i915_drv.h
> > @@ -191,8 +191,6 @@ struct i915_hotplug {
> >          I915_GEM_DOMAIN_VERTEX)
> >
> >  struct drm_i915_private;
> > -struct i915_mm_struct;
> > -struct i915_mmu_object;
> >
> >  struct drm_i915_file_private {
> >         struct drm_i915_private *dev_priv;
> > --
> > 2.33.0
> >

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
