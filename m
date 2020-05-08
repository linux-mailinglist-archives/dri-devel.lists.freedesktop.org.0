Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C0F1CA7E1
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 12:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5B86EAD1;
	Fri,  8 May 2020 10:03:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD8966EAD1
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 10:03:57 +0000 (UTC)
Received: by mail-vk1-xa44.google.com with SMTP id p139so266386vkd.7
 for <dri-devel@lists.freedesktop.org>; Fri, 08 May 2020 03:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aJUJtwe25k5Z22r2ALt7pA9D7pwZ4eoPQdVB6UOsn1g=;
 b=nOqCHPk82fJWWJN98O5j7uJ5VB8SCd/JSWGyoUmDBySDjc3bRir8sxlBYfAeQtXZRh
 V110rh3QbCsVuhTnr0WazZ11EtfzShyQ4uUtVvmYetAzEGPfflz13ledE0d73k1hGWRJ
 6sGB6W9zJygXSpfG1QAgIjd99RznGzjMIghwyEAcehNYVZhpod19MPnm2f8mjjx4b4LT
 97oFM+BJm/ziLGAlxAYr0zk7T7UYFNc8733IAI3gyLKHlzSnfF6Daxh135SW+4bi0xyK
 ddDEhhnPMl/yKNFAYxgJ7yBG87UFmHPA6M2y3vUTpJFzU679mHlxCV0tbAe08K8shvpT
 dsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aJUJtwe25k5Z22r2ALt7pA9D7pwZ4eoPQdVB6UOsn1g=;
 b=eyDahmuj3h8Cw4bCUxt5fXHjQcZOCODFRTCavXlTodhpnooZ4+OWf487xFrQSxr5bj
 xxJjlQf7ZQaMtBCGSa7kdRHW6oX6Jbh+G8T7Jl8yvrbL9zrhcQYHfKr0Xssv7ciHmDBg
 FJZOQy7RIHyB4WZuPQ1aC5cGGdbtgTvJ8ErTy8+oK61S4sOTQIaw8GaJDZ+BbAmdQ+RU
 spqfBP11Gxk6tqgqDCNa9p+cpdpYEOdeMBEh6VDZKFn/ph4UdozvlxU7jIPc5GSmHUiC
 99c+9P/8Bq822tIMLjn3eBSbOqi8ue5QXpMtbyQR4pz2f/Z3aG/4AZja/hgJgrgydHT3
 Ik3g==
X-Gm-Message-State: AGi0PuamrIV5+jZSDlU4Y071v6Zn/0YP8/GcfUbGZDI2fyVgXACFhLpy
 weS16KUqnG7bhFIaxHhkIoZs1uGqJrAdWt6TahO07A==
X-Google-Smtp-Source: APiQypKO/UX3D+RqBWGrk52zNJySnQcbRQjZddu80cNmjb2sYBIlYhkqzgKLgcxPiLJeCBDvbYQOtWjBZjjJiQUXlFU=
X-Received: by 2002:a1f:a454:: with SMTP id n81mr1125522vke.6.1588932236920;
 Fri, 08 May 2020 03:03:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
 <20200507150822.114464-5-emil.l.velikov@gmail.com>
 <20200507180141.GB13247@ravnborg.org>
In-Reply-To: <20200507180141.GB13247@ravnborg.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 8 May 2020 11:01:25 +0100
Message-ID: <CACvgo5147kyZV1Wj6oaX4eHEZqzpyAPZAEGQS3mAJ8QN5nnOLQ@mail.gmail.com>
Subject: Re: [PATCH 04/36] drm/doc: drop struct_mutex references
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Thu, 7 May 2020 at 19:01, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Emil.
>
> On Thu, May 07, 2020 at 04:07:50PM +0100, Emil Velikov wrote:
> > From: Emil Velikov <emil.velikov@collabora.com>
> >
> > There's little point in providing partial and ancient information about
> > the struct_mutex. Some drivers are using it, new ones should not.
> >
> > As-it this only provides for confusion.
> >
> > Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> > ---
> >  Documentation/gpu/drm-mm.rst | 7 ++-----
> >  1 file changed, 2 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> > index 1839762044be..5ba2ead8f317 100644
> > --- a/Documentation/gpu/drm-mm.rst
> > +++ b/Documentation/gpu/drm-mm.rst
> > @@ -178,11 +178,8 @@ GEM Objects Lifetime
> >  --------------------
> >
> >  All GEM objects are reference-counted by the GEM core. References can be
> > -acquired and release by calling drm_gem_object_get() and drm_gem_object_put()
> > -respectively. The caller must hold the :c:type:`struct drm_device <drm_device>`
> > -struct_mutex lock when calling drm_gem_object_get(). As a convenience, GEM
> > -provides drm_gem_object_put_unlocked() functions that can be called without
> > -holding the lock.
> > +acquired and release by calling drm_gem_object_get() and drm_gem_object_put_unlocked()
> > +respectively.
>
> Nice to get rid of struct_mutex lock stuff.
> But no need to s/drm_gem_object_put/drm_gem_object_put_unlocked()/ as this will
> be renamed a bit later.
>
This patch fixes the documentation, for people looking it today.

While I would love to see the s/_unlocked//g part of the series land,
it is rather invasive albeit mechanical.
So driver maintainers are in their right to request that we push it at
a later point.

Thus it makes perfect sense to address the two things in separate patches.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
