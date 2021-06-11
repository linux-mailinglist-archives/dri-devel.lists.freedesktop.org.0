Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C31D03A47EF
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 19:35:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ECE26F3A8;
	Fri, 11 Jun 2021 17:35:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F45C6E06E;
 Fri, 11 Jun 2021 17:35:42 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 o17-20020a9d76510000b02903eabfc221a9so3938440otl.0; 
 Fri, 11 Jun 2021 10:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SMqVCQIyzcAu0M4b9TgfgPf3semJQ4ktsbcHyXfGs4k=;
 b=XjQTrcPTPOSpYumSQta+tgkLewY+5QFIH/lXUuVLTD9JlSaSsl0SfWeSXG+4L/wFYB
 Dcw7em6UrC5TXKRwX2QEcYHdzQQuZod6dTPlBCWSDiTAfmGZKe6MX8HOhzDm5HkpQFCZ
 kAwdUfkVSBaZTjA6ki4Y48Co2Yj4VNP4YZNlEA9JvL+o8yW8JHQhunc9qIvSGF25nQyV
 t4j0LvtklOIth/UWHCTvhkbja5M4I3xn0N0+8TTGBoVf05vZlIfhpXy1MwHYz2coCuXg
 BP2R3XMLj8KXL0T+hvOp0NiGj9wUAMrkpixJMO7iI+2PtvvbCMjSADMKlb8BC4gvbvmP
 v6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SMqVCQIyzcAu0M4b9TgfgPf3semJQ4ktsbcHyXfGs4k=;
 b=QS8IKsDbxT5Ke3Ri5dV2BEt4u56aEbscmU23KuDLdT8YCINhj/5pvoiim45Zx9q0kF
 Ea6/4U3gioiQfDBvECHAKxSn7hRgr+bdD9ClvXVSyw2nq1QymSqDrrrpxlTy8pPQoQKi
 iTeiUNsXTFqZkiXX0d63ZUYnn7NMjoBtTEdTPpKR/8G6B3b9/4uakvr88t/NvyHlAieq
 OS6Dl4T2OswBVNlSA0+XC4jWgPXbX3AtuEibllcYUEd+uaThE4ba/vdlN4kpyRQfSzg3
 wY7r4edDgC/J3Xh62TdQQTnHwDunPFHwXInCxfG3ysMFN/zLvHOWciVUuOJu5hcJLiwy
 rYsA==
X-Gm-Message-State: AOAM532Ab4VefGRdI4rQpzvHLys96osSzNZMeEDQeXtmD7OCvhDYJ8we
 mlU8o+Zr8yVV+Q/Bwx7xISgngutRt00N5gV23Y0=
X-Google-Smtp-Source: ABdhPJzAoNZYj/M9nNizghfN4+3b7QpWnZ6rxrNY1A16Kjx1wOc1UHxpIAhzzxPtKOl57CjCpz3MM6HQPkJsHpp2aTE=
X-Received: by 2002:a05:6830:1e64:: with SMTP id
 m4mr3917435otr.23.1623432941736; 
 Fri, 11 Jun 2021 10:35:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210604170107.2023162-1-markyacoub@chromium.org>
 <906d0ab3-ddca-8cb9-68f5-1b495cc4be5c@amd.com>
 <CAJUqKUr-s+r1Q-CEO6avH-X5T_Lwt3ZaG5tukygo0joHi8kCpA@mail.gmail.com>
 <2e289387-0101-6141-a1c4-ae0438e0c2b8@amd.com>
In-Reply-To: <2e289387-0101-6141-a1c4-ae0438e0c2b8@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 11 Jun 2021 13:35:30 -0400
Message-ID: <CADnq5_Nu=rzRw-jY7zf7Q6mjJQ=s4+vRTudb3383YG_h=twO9g@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Verify Gamma & Degamma LUT sizes in
 amdgpu_dm_atomic_check
To: Harry Wentland <harry.wentland@amd.com>
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
Cc: Mark Yacoub <markyacoub@chromium.org>, "Siqueira,
 Rodrigo" <rodrigo.siqueira@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Mark Yacoub <markyacoub@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Thu, Jun 10, 2021 at 5:14 PM Harry Wentland <harry.wentland@amd.com> wrote:
>
>
>
> On 2021-06-07 10:53 a.m., Mark Yacoub wrote:
> > On Fri, Jun 4, 2021 at 4:17 PM Harry Wentland <harry.wentland@amd.com> wrote:
> >>
> >>
> >>
> >> On 2021-06-04 1:01 p.m., Mark Yacoub wrote:
> >>> From: Mark Yacoub <markyacoub@google.com>
> >>>
> >>> For each CRTC state, check the size of Gamma and Degamma LUTs  so
> >>> unexpected and larger sizes wouldn't slip through.
> >>>
> >>> TEST: IGT:kms_color::pipe-invalid-gamma-lut-sizes
> >>>
> >>> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> >>> Change-Id: I9d513a38e8ac2af1b4bf802e1feb1a4d726fba4c
> >>> ---
> >>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  3 ++
> >>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  1 +
> >>>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 40 ++++++++++++++++---
> >>>  3 files changed, 38 insertions(+), 6 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >>> index 38d497d30dba8..f6cd522b42a80 100644
> >>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >>> @@ -9402,6 +9402,9 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
> >>>                       dm_old_crtc_state->dsc_force_changed == false)
> >>>                       continue;
> >>>
> >>> +             if ((ret = amdgpu_dm_verify_lut_sizes(new_crtc_state)))
> >>> +                     goto fail;
> >>> +
> >>>               if (!new_crtc_state->enable)
> >>>                       continue;
> >>>
> >>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> >>> index 8bfe901cf2374..1b77cd2612691 100644
> >>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> >>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> >>> @@ -541,6 +541,7 @@ void amdgpu_dm_trigger_timing_sync(struct drm_device *dev);
> >>>  #define MAX_COLOR_LEGACY_LUT_ENTRIES 256
> >>>
> >>>  void amdgpu_dm_init_color_mod(void);
> >>> +int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state);
> >>>  int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc);
> >>>  int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
> >>>                                     struct dc_plane_state *dc_plane_state);
> >>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> >>> index 157fe4efbb599..da6f9fcc0b415 100644
> >>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> >>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> >>> @@ -284,6 +284,37 @@ static int __set_input_tf(struct dc_transfer_func *func,
> >>>       return res ? 0 : -ENOMEM;
> >>>  }
> >>>
> >>> +/**
> >>> + * Verifies that the Degamma and Gamma LUTs attached to the |crtc_state| are of
> >>> + * the expected size.
> >>> + * Returns 0 on success.
> >>> + */
> >>> +int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state)
> >>> +{
> >>> +     const struct drm_color_lut *lut = NULL;
> >>> +     uint32_t size = 0;
> >>> +
> >>> +     lut = __extract_blob_lut(crtc_state->degamma_lut, &size);
> >>> +     if (lut && size != MAX_COLOR_LUT_ENTRIES) {
> >>
> >> Isn't the point of the LUT size that it can be variable? Did you observe any
> >> problems with LUTs that are not of size 4096?
> > Is it supposed to be variable?
> > I'm basing my knowledge of LUTs on this IGT Test:
> > https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/kms_color_helper.c#L281>> It does check for invalid sizes and for the exact size, giving me the
> > impression that it's not too flexible.
> > Is variability of size an AMD specific behavior or should it be a DRM behavior?
> >>
> >> Legacy X-based userspace will give us 256 size LUTs. We can't break support for
> >> that. See MAX_COLOR_LEGACY_LUT_ENTRIES.
> > In the new function `amdgpu_dm_verify_lut_sizes`, I maintained parity
> > with the old behavior. In `amdgpu_dm_update_crtc_color_mgmt`, the
> > degamma size is only checked against `MAX_COLOR_LUT_ENTRIES` while
> > regamma_size size is checked against both MAX_COLOR_LUT_ENTRIES and
> > MAX_COLOR_LEGACY_LUT_ENTRIES:
> > https://gitlab.freedesktop.org/agd5f/linux/-/blob/amd-staging-drm-next/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c#L321>> Also, in the definition of MAX_COLOR_LEGACY_LUT_ENTRIES, it mentions
> > "Legacy gamm[sic] LUT" not degamma:
> > https://gitlab.freedesktop.org/agd5f/linux/-/blame/amd-staging-drm-next/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h#L616>> As well as the commit when it was introduced, it seems to be handling
> > gammas rather than degamma LUTs:
> > https://gitlab.freedesktop.org/agd5f/linux/-/commit/086247a4b2fba49800b27807f22bb894cd8363fb>> Let me know if this would be a bug in the old behavior and I can fix
> > it, or if i'm missing something.
>
> Ah, yes, you're right, of course. Thanks for walking me through it. :)
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> >>
> >> Harry
> >>
> >>> +             DRM_DEBUG_DRIVER(
> >>> +                     "Invalid Degamma LUT size. Should be %u but got %u.\n",
> >>> +                     MAX_COLOR_LUT_ENTRIES, size);
> >>> +             return -EINVAL;
> >>> +     }
> >>> +
> >>> +     lut = __extract_blob_lut(crtc_state->gamma_lut, &size);
> >>> +     if (lut && size != MAX_COLOR_LUT_ENTRIES &&
> >>> +         size != MAX_COLOR_LEGACY_LUT_ENTRIES) {
> >>> +             DRM_DEBUG_DRIVER(
> >>> +                     "Invalid Gamma LUT size. Should be %u (or %u for legacy) but got %u.\n",
> >>> +                     MAX_COLOR_LUT_ENTRIES, MAX_COLOR_LEGACY_LUT_ENTRIES,
> >>> +                     size);
> >>> +             return -EINVAL;
> >>> +     }
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>>  /**
> >>>   * amdgpu_dm_update_crtc_color_mgmt: Maps DRM color management to DC stream.
> >>>   * @crtc: amdgpu_dm crtc state
> >>> @@ -317,14 +348,11 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
> >>>       bool is_legacy;
> >>>       int r;
> >>>
> >>> -     degamma_lut = __extract_blob_lut(crtc->base.degamma_lut, &degamma_size);
> >>> -     if (degamma_lut && degamma_size != MAX_COLOR_LUT_ENTRIES)
> >>> -             return -EINVAL;
> >>> +     if ((r = amdgpu_dm_verify_lut_sizes(&crtc->base)))
> >>> +             return r;
> >>>
> >>> +     degamma_lut = __extract_blob_lut(crtc->base.degamma_lut, &degamma_size);
> >>>       regamma_lut = __extract_blob_lut(crtc->base.gamma_lut, &regamma_size);
> >>> -     if (regamma_lut && regamma_size != MAX_COLOR_LUT_ENTRIES &&
> >>> -         regamma_size != MAX_COLOR_LEGACY_LUT_ENTRIES)
> >>> -             return -EINVAL;
> >>>
> >>>       has_degamma =
> >>>               degamma_lut && !__is_lut_linear(degamma_lut, degamma_size);
> >>>
> >>
> > -Mark
> >
>
