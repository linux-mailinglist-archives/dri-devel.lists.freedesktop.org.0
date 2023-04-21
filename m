Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 851996EA98A
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 13:45:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1B810EE0A;
	Fri, 21 Apr 2023 11:45:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606CE10EDF6;
 Fri, 21 Apr 2023 11:45:42 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-b97ec4bbc5aso665345276.3; 
 Fri, 21 Apr 2023 04:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682077541; x=1684669541;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cpExu34liiyV+GAi+/eT3EAKnCiqG6Ffpw4DRQDPAno=;
 b=X357dpjFwt18aofQ0wDrq5xS25zQymH1kkZ7nx1QoezkPpsctPIFFhRm7lHDtLaWU/
 leznEkIpKE+UutrPj+vIDvHUvepfMSVv2O/FhGzpxfyxrGyc2Se+g0FTJt15uLyo1l5m
 hQ8VnTH7tb9c4cu9NcS0tiw6kxJvV/6MWP0Dwm2Pg0gQ1bM6gi0DQUUOmITt/jBRS0UH
 cJVNYj7C2D/uCIZrngQ/8ubwO/63Va8rs4mpyr1W+aQBfPIAmvZP8lZlqxM7GqjAWTJX
 e1yqWbDs2olaaSsMgp2AL3mmpHPl2LbdU/oqkTz0pkbm2Y/x+13Bm4DQ5j3P9Nsxe5bU
 Z+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682077541; x=1684669541;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cpExu34liiyV+GAi+/eT3EAKnCiqG6Ffpw4DRQDPAno=;
 b=IVKJtJGL6R/FXtwhOYTxU+YhqpYCAbQN40JPTFAsWZetYluAJ3q8dspAjRY/USzKaY
 sFgB9h/MuRd4DvEhkIkgg0yAt56XAG1u82bNX7JXtkEe8yPtgYudmUXb5CfgSE32jZXy
 g+3WxZEXEpKLIFXAlcxgQtDF8Nau8Pl0XYmfIR6srGTdNLJIF6oWrPvo0eJMPnNvKkHd
 a5ZD2OKyG99srI7ol31dpFeyiTneAptu958/+CbU2Qsq663Qdu7cKObrCqTuFPviUi3q
 daDIHFRWLCMHijH0L7Pj+soV4v+FEQtvRDX8B1Oa4sQTzZ8Gi4E5DxjzOpmpeoLZ8vHI
 5JVQ==
X-Gm-Message-State: AAQBX9e9Z1VOUvw87oBq5Pwn/h+6z3ltanMRD/lF70OWWKyL1263RCYX
 1O1xshvH+snd/vpSdAtIbcZ7DuaYAJUcMDFpGfA=
X-Google-Smtp-Source: AKy350ZkJiVpvUcieuU2kqFOJ/OAdnKq40E+PLmCvtqId/JFLpKucdeMo2ppNwRWJvVclimQAVg9DPEL78KBn1eVLpE=
X-Received: by 2002:a25:d7d1:0:b0:b92:5a0e:d5e9 with SMTP id
 o200-20020a25d7d1000000b00b925a0ed5e9mr1999465ybg.28.1682077541278; Fri, 21
 Apr 2023 04:45:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230412224311.23511-1-robdclark@gmail.com>
 <20230412224311.23511-6-robdclark@gmail.com>
 <CACvgo525ogS4LSZDUyaqjSqjJWj=qLRkphji5469=3obFXoMrQ@mail.gmail.com>
 <f2a423c2-302a-024a-cf65-199f4be6caec@linux.intel.com>
In-Reply-To: <f2a423c2-302a-024a-cf65-199f4be6caec@linux.intel.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 21 Apr 2023 12:45:29 +0100
Message-ID: <CACvgo53dP03r1BuxntyyoYjua5k6XPvVhu4iTGqXJq31UMUgxg@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] drm: Add fdinfo memory stats
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-arm-msm@vger.kernel.org,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 21 Apr 2023 at 12:23, Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:

> On 21/04/2023 11:26, Emil Velikov wrote:
> > On Wed, 12 Apr 2023 at 23:43, Rob Clark <robdclark@gmail.com> wrote:
> >
> >> +/**
> >> + * enum drm_gem_object_status - bitmask of object state for fdinfo reporting
> >> + * @DRM_GEM_OBJECT_RESIDENT: object is resident in memory (ie. not unpinned)
> >> + * @DRM_GEM_OBJECT_PURGEABLE: object marked as purgeable by userspace
> >> + *
> >> + * Bitmask of status used for fdinfo memory stats, see &drm_gem_object_funcs.status
> >> + * and drm_show_fdinfo().  Note that an object can DRM_GEM_OBJECT_PURGEABLE if
> >> + * it still active or not resident, in which case drm_show_fdinfo() will not
> >
> > nit: s/can/can be/;s/if it still/if it is still/
> >
> >> + * account for it as purgeable.  So drivers do not need to check if the buffer
> >> + * is idle and resident to return this bit.  (Ie. userspace can mark a buffer
> >> + * as purgeable even while it is still busy on the GPU.. it does not _actually_
> >> + * become puregeable until it becomes idle.  The status gem object func does
> >
> > nit: s/puregeable/purgeable/
> >
> >
> > I think we want a similar note in the drm-usage-stats.rst file.
> >
> > With the above the whole series is:
> > Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
>
> Have you maybe noticed my slightly alternative proposal? (*) I am not a
> fan of putting this flavour of accounting into the core with no way to
> opt out. I think it leaves no option but to add more keys in the future
> for any driver which will not be happy with the core accounting.
>
> *) https://patchwork.freedesktop.org/series/116581/
>

Indeed I saw it. Not a fan of it, I'm afraid.

> > Fwiw: Keeping the i915 patch as part of this series would be great.
> > Sure i915_drm_client->id becomes dead code, but it's a piece one can
> > live with for a release or two. Then again it's not my call to make.
>
> Rob can take the i915 patch from my RFC too.
>

Indeed.

-Emil
