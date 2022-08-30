Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5ACF5A667C
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 16:42:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3500F10E0E7;
	Tue, 30 Aug 2022 14:42:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E8D10E0E7;
 Tue, 30 Aug 2022 14:42:30 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-11eab59db71so13313925fac.11; 
 Tue, 30 Aug 2022 07:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=0ESy7F3nohHMl9WxcyZ9zq72zW0Hic4VE6BXYcu0fLY=;
 b=Le0R1N86J/jJ4G6JozfqvBR2NO2Lt7WSl+hL0P9+u6XCURKL+JzRBHSsGCztJt2rFl
 YwquDYemoaO/U+4hFXP9qxz/g5CtGphgIvQtXjan5fMZ5fq3nMpN9wqioRH8SSPQNjOQ
 jLFsSbpq8U4cT4Kd31pAICtwLXfgvgGZbRglg6cDuDk2IA5Gpy97W5RynV+pwRfPqF/C
 P+DTXVCJiACJgrRA67Xk5haKot0TeCnum1au4zPWhuPjGbPzNTOtfFEYWZcMyWxcuUlY
 bH3RsgeKwRnX5s46gH1x4If27ibPrzm8g7MEJKZMa+1v79mg4HByd5jw5IvkNOoA67Ss
 1kgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=0ESy7F3nohHMl9WxcyZ9zq72zW0Hic4VE6BXYcu0fLY=;
 b=nXjCfj2kfLLlmo4sGmxcvK3S6k1EWxYRQ8Nd6iN1WfLNgRJs0s96dkd93NBK4lmA+D
 APFJznC6gzPH+8IElqx6vQaJLY64fRMXblgRFHi3tzNBl+PWwX+Oc+IMiIRpJ/QRHVnU
 +JEYm5x9l50w4DyD8cTM7ZoOm3UtHencBhrORActvTdPv57v0SSJ2TGSEyDT2VhhYcJb
 uum9l91zSHEdEbNPbcZoqkrcwojPp5gnen0pGqZ4htQvaK2WU6/eVLpJ1bwITc6aGgb8
 mo6jjks1Y6PilX9jGyvkOUFGDJN2nGDzKw1uzFNV9x6a7Va+ttnDs2glctc1B0uXl5An
 IxkQ==
X-Gm-Message-State: ACgBeo35uMPGPoMLtqNywZNeDiA7H5glL2KNNKzzp+QKG5UBJFbwEW4v
 fn/PUSSIned0jTwDXNErW/MgAkudJJgsGEeoB/s=
X-Google-Smtp-Source: AA6agR4PGIJaL9l8J2XvmsXnxG3BuG1BK6Op4k/9/6QTQcJgh9731qPtzgXO0fU+BAO3xTl2pRr+PEvrA+IWi1tK9NQ=
X-Received: by 2002:a05:6870:3484:b0:11e:4465:3d9b with SMTP id
 n4-20020a056870348400b0011e44653d9bmr10872373oah.46.1661870549280; Tue, 30
 Aug 2022 07:42:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220824150834.427572-1-contact@emersion.fr>
 <20220824150834.427572-5-contact@emersion.fr>
 <CADnq5_MX0Qh7v-Wy1nBhMEWT9bhmQn4W-2Wo97CZgKcby1Xc+w@mail.gmail.com>
 <A_ZL55UlxqGGQnHrxTxvFZMCn1HkWbIuaZvtrOnir7mO6YCY8hhyYwjwKjv79SEEBLqbosVtxx0rVeCTso1RktRjY3ECNyLssw77of_D2sM=@emersion.fr>
 <CADnq5_NMHWGOdW5Gfr4wK6o5j7PnYKW57Gg6UbbUJfnONdHY1w@mail.gmail.com>
 <2uZ8U_CJxQ9zlnv1lIRhMtwKYU-uuOuhzef2hbvONDPGN-t9Pm4fSejJNLm3ThkJIj1ZkDZwizu49Xactvx-ykn-0Rc23CzsBUXe3Xg_-XI=@emersion.fr>
 <CADnq5_PX_d0hsoTSLsyZpEHg9hu33x8LhyLOGFMZRo0WWdKPvw@mail.gmail.com>
 <2ceFF1QUjpWpVaQxW7MgRgDlU-Ff3UPBZLRET1On9G_S5IxK-i4Ye2zGgx5KeEJVXwMCyaG2TIBG7RW4L5lciqbQhE-uitglBBgqTwhKCck=@emersion.fr>
In-Reply-To: <2ceFF1QUjpWpVaQxW7MgRgDlU-Ff3UPBZLRET1On9G_S5IxK-i4Ye2zGgx5KeEJVXwMCyaG2TIBG7RW4L5lciqbQhE-uitglBBgqTwhKCck=@emersion.fr>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 30 Aug 2022 10:42:17 -0400
Message-ID: <CADnq5_NEL6sUm_9qretTzQ=yH84byfjo3fXPForGGXMGediYhQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] amd/display: indicate support for atomic async
 page-flips on DCN
To: Simon Ser <contact@emersion.fr>
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
Cc: daniel.vetter@ffwll.ch, amd-gfx@lists.freedesktop.org, mwen@igalia.com,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com, hwentlan@amd.com,
 nicholas.kazlauskas@amd.com, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 30, 2022 at 10:24 AM Simon Ser <contact@emersion.fr> wrote:
>
> On Tuesday, August 30th, 2022 at 16:06, Alex Deucher <alexdeucher@gmail.com> wrote:
>
> > On Tue, Aug 30, 2022 at 3:08 AM Simon Ser contact@emersion.fr wrote:
> >
> > > On Friday, August 26th, 2022 at 16:39, Alex Deucher alexdeucher@gmail.com wrote:
> > >
> > > > On Fri, Aug 26, 2022 at 3:38 AM Simon Ser contact@emersion.fr wrote:
> > > >
> > > > > On Thursday, August 25th, 2022 at 20:22, Alex Deucher alexdeucher@gmail.com wrote:
> > > > >
> > > > > > On Wed, Aug 24, 2022 at 11:09 AM Simon Ser contact@emersion.fr wrote:
> > > > > >
> > > > > > > amdgpu_dm_commit_planes already sets the flip_immediate flag for
> > > > > > > async page-flips. This flag is used to set the UNP_FLIP_CONTROL
> > > > > > > register. Thus, no additional change is required to handle async
> > > > > > > page-flips with the atomic uAPI.
> > > > > > >
> > > > > > > Note, async page-flips are still unsupported on DCE with the atomic
> > > > > > > uAPI. The mode_set_base callbacks unconditionally set the
> > > > > > > GRPH_SURFACE_UPDATE_H_RETRACE_EN field of the GRPH_FLIP_CONTROL
> > > > > > > register to 0, which disables async page-flips.
> > > > > >
> > > > > > Can you elaborate a bit on this? We don't use hsync flips at all, even
> > > > > > in non-atomic, as far as I recall. The hardware can also do immediate
> > > > > > flips which take effect as soon as you update the base address
> > > > > > register which is what we use for async updates today IIRC.
> > > > >
> > > > > When user-space performs a page-flip with the legacy KMS uAPI on DCE
> > > > > ASICs, amdgpu_display_crtc_page_flip_target() is called. This function
> > > > > checks for the DRM_MODE_PAGE_FLIP_ASYNC flag, sets work->async, which
> > > > > is then passed as an argument to adev->mode_info.funcs->page_flip() by
> > > > > amdgpu_display_flip_work_func(). Looking at an implementation, for
> > > > > instance dce_v10_0_page_flip(), the async flag is used to set that
> > > > > GRPH_FLIP_CONTROL register:
> > > > >
> > > > > /* flip at hsync for async, default is vsync */
> > > > > tmp = RREG32(mmGRPH_FLIP_CONTROL + amdgpu_crtc->crtc_offset);
> > > > > tmp = REG_SET_FIELD(tmp, GRPH_FLIP_CONTROL,
> > > > > GRPH_SURFACE_UPDATE_H_RETRACE_EN, async ? 1 : 0);
> > > > > WREG32(mmGRPH_FLIP_CONTROL + amdgpu_crtc->crtc_offset, tmp);
> > > > >
> > > > > I don't know how the hardware works, but I assumed it would be
> > > > > necessary to do the same in the atomic uAPI code-path as well. However
> > > > > dce_v10_0_crtc_do_set_base() has this code block:
> > > > >
> > > > > /* Make sure surface address is updated at vertical blank rather than
> > > > > * horizontal blank
> > > > > */
> > > > > tmp = RREG32(mmGRPH_FLIP_CONTROL + amdgpu_crtc->crtc_offset);
> > > > > tmp = REG_SET_FIELD(tmp, GRPH_FLIP_CONTROL,
> > > > > GRPH_SURFACE_UPDATE_H_RETRACE_EN, 0);
> > > > > WREG32(mmGRPH_FLIP_CONTROL + amdgpu_crtc->crtc_offset, tmp);
> > > > >
> > > > > Which unconditionally sets that same register.
> > > > >
> > > > > Either way, it's not a very big deal for this patch series, DCE and DCN
> > > > > are separate, DCE can be sorted out separately.
> > > > >
> > > > > Am I completely mistaken here?
> > > >
> > > > I checked the code and it looks like only DCE11 and newer support
> > > > immediate flips. E.g.,
> > > >
> > > > /* flip immediate for async, default is vsync */
> > > > tmp = RREG32(mmGRPH_FLIP_CONTROL + amdgpu_crtc->crtc_offset);
> > > > tmp = REG_SET_FIELD(tmp, GRPH_FLIP_CONTROL,
> > > > GRPH_SURFACE_UPDATE_IMMEDIATE_EN, async ? 1 : 0);
> > > >
> > > > in dce_v11_0.c.
> > > >
> > > > Either way, the non-DC display code is not atomic anyway, so I don't
> > > > think this is an issue. We still support async flips via the
> > > > non-atomic API. I agree this is not blocking for the patch series,
> > > > just thinking out loud mostly.
> > >
> > > Michel pointed out that DC can drive both DCN and DCE. This was a
> > > misunderstanding on my end, I thought DC could only drive DCN. I'll reword the
> > > commit message to refer to DC instead of DCN.
> > >
> > > This begs the question, should we bother to set the
> > > atomic_async_page_flip_not_supported flag on non-atomic drivers? I've just
> > > slapped the flag everywhere for simplicity's sake, but maybe it would make more
> > > sense to just set it for atomic-capable drivers. Especially if the long-term
> > > goal is to convert all atomic drivers to support async flips and eventually
> > > remove atomic_async_page_flip_not_supported.
> >
> > yeah, I think we can drop the flag for non-atomic. amdgpu at least
> > already supports async flips.
> >
> > > Thanks for the hint regarding DCE10. It sounds like it may be worthwhile to
> > > unset drm_mode_config.async_page_flip on DCE10 and earlier, to indicate to
> > > user-space that async page-flips are not supported on these ASICs? Right now it
> > > seems like we indicate that we support them, and then ignore the ASYNC_FLIP
> > > flag?
> >
> > Async flips work fine with the current code. I think I did the
> > initial implementation on DCE10. We set
> > GRPH_SURFACE_UPDATE_H_RETRACE_EN dynamically in dce_v10_0_page_flip()
> > based on the type of flip selected.
>
> Hm, can you elaborate on the difference between "immediate flip" (as in
> UNP_FLIP_CONTROL) and GRPH_SURFACE_UPDATE_H_RETRACE_EN? What are their
> relationship with KMS's concept of "async flips"?

The display surface registers are double buffered.  The default is for
the swap to take place during vblank.  However, you can select
different behavior via the GRPH_FLIP_CONTROL register.  On DCE10 and
older you can set GRPH_SURFACE_UPDATE_H_RETRACE_EN to select swapping
at hsync.  On DCE11 and newer, you can set
GRPH_SURFACE_UPDATE_IMMEDIATE_EN which causes the swap to immediately
(IIRC as soon as GRPH_PRIMARY_SURFACE_ADDRESS is written).

>
> Also you said earlier:
>
> > We don't use hsync flips at all, even in non-atomic, as far as I recall.
>
> Is "hsync flip" controlled by GRPH_SURFACE_UPDATE_H_RETRACE_EN, or is it
> something else entirely?

Yes, GRPH_SURFACE_UPDATE_H_RETRACE_EN.  We use hsync swaps on older
DCE parts that don't support immediate swaps.

Alex
