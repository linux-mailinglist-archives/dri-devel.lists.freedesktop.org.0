Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 602F039237D
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 01:58:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B226E898;
	Wed, 26 May 2021 23:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC176E88B;
 Wed, 26 May 2021 23:58:05 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id k14so5198955eji.2;
 Wed, 26 May 2021 16:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Vw//m7Ix7E5DeRfJ+ysGKNt9weNBoFc1XN8VRnt8JTA=;
 b=uaQ4UQjhVXPlAIrU1lJoHQbgWwtpE+aLsqZs/mC2eXrWyr7Iy1ggEf/Dg4zIiPWPSj
 8R7PIzzFLlMO53rSbbmvQ0O01w+CygGexQ4Pco+1E9R1K1WSBHg/hMr9cxGRUs1sKYbX
 HhQH3H14kzui81qiWhLCuJ6eJ54YNgr7eI50muCD3WNw+XYTz9D3urnecGfLWPWn6Lev
 MyAShi81eOvQ1f1H2jaFQ5SGlSNymu418HOQ6dJIQuuaPe913Kp1dm7V3mU0qqTVp8O2
 rEwAMTx7G8EkegurtAfDHoQ+jJ9ZpqWur2wEsY3ZOBUyV4ebFkgptKFe8AIGo0NBW9KF
 Uohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Vw//m7Ix7E5DeRfJ+ysGKNt9weNBoFc1XN8VRnt8JTA=;
 b=NdPPkVhF2Nlm5/ZXO7nGCZK1l9MmIKPLPcX96KckYmbDha/qqBiGBj4BEO+aMdPkws
 2kAkSiX2dQ6atOr+JnN253ebPqrjYe526WchJtP/sURIStXcFh4m3BIv9/MK3deF2T0s
 O49vqIK/cQAGAOt+e+hCbOLPuMFppQpFIRDo/Z0Ks75P16YOxaRw5aqSzvd7lvt/cnSN
 YL7z70npr/sd2iXPjtgMAtE9c3GC0pMGAPNkligPWaRjmBTBMdlb4C6Z4rUKkkIN9G0s
 jFQ1bZ1N0fCRcl5tWpeH9JNOuvnnKChZ2KvKhK2iGZC1c6VlFoR9TIHdNC2jGR9WObXG
 QyOg==
X-Gm-Message-State: AOAM531bzoHQ82Lx9R2U986UdwG60vnb19u2ELdgp0lnrjj42Ah61pTO
 kS3EcMFUZw2vb71fmmuoRWHAIuE6FhZuCmLIZ6Q=
X-Google-Smtp-Source: ABdhPJwR7+XBtCr7mkeHm/mOlfQ8MXGu/pcFbVuLPBG7JM1JFo1IdpCcrgRwd7WiFurKWAUkrGB8xASlFEufvFhQaRs=
X-Received: by 2002:a17:906:9258:: with SMTP id
 c24mr820470ejx.101.1622073483915; 
 Wed, 26 May 2021 16:58:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210526163730.3423181-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20210526163730.3423181-1-daniel.vetter@ffwll.ch>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 27 May 2021 09:57:52 +1000
Message-ID: <CAPM=9tymmx=_1ukqG5x_EOQGHBo6wYNoD8KfuV+6AHBwd_XNBw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Disable gpu relocations
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 27 May 2021 at 02:37, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> Media userspace was the last userspace to still use them, and they
> converted now too:
>
> https://github.com/intel/media-driver/commit/144020c37770083974bedf59902b=
70b8f444c799
>
> This means no reason anymore to make relocations faster than they've
> been for the first 9 years of gem. This code was added in
>
> commit 7dd4f6729f9243bd7046c6f04c107a456bda38eb
> Author: Chris Wilson <chris@chris-wilson.co.uk>
> Date:   Fri Jun 16 15:05:24 2017 +0100
>
>     drm/i915: Async GPU relocation processing
>
> Furthermore there's pretty strong indications it's buggy, since the
> code to use it by default as the only option had to be reverted:
>
> commit ad5d95e4d538737ed3fa25493777decf264a3011
> Author: Dave Airlie <airlied@redhat.com>
> Date:   Tue Sep 8 15:41:17 2020 +1000
>
>     Revert "drm/i915/gem: Async GPU relocations only"
>
> This code just disables gpu relocations, leaving the garbage
> collection for later patches and more importantly, much less confusing
> diff. Also given how much headaches this code has caused in the past,
> letting this soak for a bit seems justified.
>
> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: "Thomas Hellstr=C3=B6m" <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Dave Airlie <airlied@redhat.com>

Acked-by: Dave Airlie <airlied@redhat.com>

Thanks for making this happen, hope the softpin world is a happier future.

Dave.
