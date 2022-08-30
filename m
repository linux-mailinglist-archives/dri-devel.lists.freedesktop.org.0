Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CD95A65E5
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 16:06:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2452610E02D;
	Tue, 30 Aug 2022 14:06:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60FF810E02D;
 Tue, 30 Aug 2022 14:06:20 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 t8-20020a9d5908000000b0063b41908168so67148oth.8; 
 Tue, 30 Aug 2022 07:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=y3fQo2Q3lqRWYYWZ5VGbMuYgWpaQiSUdmI4Mq8INkBQ=;
 b=Th7IuIUdewTPU3ylhrL9gvKnzMxRhIFg+TKreloC84Tatn41sVFzttkRDLXIzn1xBV
 zZhZgeUpGUBAPpfTI7oT50TfRaeNmwQXop9++ZTIKzIyQ++RpICuPxiqlu8r7JkZRt2/
 5bwmqqJzQUJ3RBG1qkaKjlQVDxLb56YFbhr1lXfPs7N6McoJ9qGKRVYZSpZiT55ZA8Cj
 cTbha88ZKJQw0+ZpBipHhRZFtPjicCwnoLsTmm6qyR/41snrq0aFu4KB9Pgc5V7EQnjJ
 0lGF2PkmlH1E4p6RfXTIQtTmb6xjo1yi+KcF41AMFwB3mcD1Pen4tippE0pih/6aTYXe
 HUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=y3fQo2Q3lqRWYYWZ5VGbMuYgWpaQiSUdmI4Mq8INkBQ=;
 b=vnvTr+G4ZeUKB5beEml3uuJy7YfsChXC9kuDjar5MdPFadX0tVad8PPQasMobLQztu
 RdUrTwXpWGgmjVH7p7OcoPH1mYbIJGOrNf195zYnHJHUx2MZNn9+ctBkj8HRTX/Ahlnq
 iZ/43XDletmAmGGpd7Fp6LuuEWiCjhmiAAJVY3x1tx7vUCFPpKWjt3ukEoB49ARJVGxT
 6W5iIRZnp0e80ay5hmawdCg3fR3yk5IajGQ+DChCDssH7VL5nhJ6qOXrAuoAMx9tHq00
 XyLszR7AbYPIRsBzevW2637eduU+VnSxePtaQB2t7hh8dWSkLe3mDij5ZY5K+buRFwFj
 4pog==
X-Gm-Message-State: ACgBeo2OWNH0injVqHMWJ0UB3p8obi7mgCVHF8wRfnuGjFzuJvP+9x3w
 QxB5bGYdNUlEhIKjItIu+YLTWTI7EqhDM7dwmY4=
X-Google-Smtp-Source: AA6agR4hdFqyla262W8KfIT3yQBtoLxqzkiOgW/wCs0v4B39MmJ531AMDzUo7qk6nK5dvApLfaM3skCfFWdSaFu4lZg=
X-Received: by 2002:a9d:6ad7:0:b0:636:f76b:638a with SMTP id
 m23-20020a9d6ad7000000b00636f76b638amr8792615otq.233.1661868379637; Tue, 30
 Aug 2022 07:06:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220824150834.427572-1-contact@emersion.fr>
 <20220824150834.427572-5-contact@emersion.fr>
 <CADnq5_MX0Qh7v-Wy1nBhMEWT9bhmQn4W-2Wo97CZgKcby1Xc+w@mail.gmail.com>
 <A_ZL55UlxqGGQnHrxTxvFZMCn1HkWbIuaZvtrOnir7mO6YCY8hhyYwjwKjv79SEEBLqbosVtxx0rVeCTso1RktRjY3ECNyLssw77of_D2sM=@emersion.fr>
 <CADnq5_NMHWGOdW5Gfr4wK6o5j7PnYKW57Gg6UbbUJfnONdHY1w@mail.gmail.com>
 <2uZ8U_CJxQ9zlnv1lIRhMtwKYU-uuOuhzef2hbvONDPGN-t9Pm4fSejJNLm3ThkJIj1ZkDZwizu49Xactvx-ykn-0Rc23CzsBUXe3Xg_-XI=@emersion.fr>
In-Reply-To: <2uZ8U_CJxQ9zlnv1lIRhMtwKYU-uuOuhzef2hbvONDPGN-t9Pm4fSejJNLm3ThkJIj1ZkDZwizu49Xactvx-ykn-0Rc23CzsBUXe3Xg_-XI=@emersion.fr>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 30 Aug 2022 10:06:08 -0400
Message-ID: <CADnq5_PX_d0hsoTSLsyZpEHg9hu33x8LhyLOGFMZRo0WWdKPvw@mail.gmail.com>
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

On Tue, Aug 30, 2022 at 3:08 AM Simon Ser <contact@emersion.fr> wrote:
>
> On Friday, August 26th, 2022 at 16:39, Alex Deucher <alexdeucher@gmail.com> wrote:
>
> > On Fri, Aug 26, 2022 at 3:38 AM Simon Ser <contact@emersion.fr> wrote:
> > >
> > > On Thursday, August 25th, 2022 at 20:22, Alex Deucher <alexdeucher@gmail.com> wrote:
> > >
> > > > On Wed, Aug 24, 2022 at 11:09 AM Simon Ser contact@emersion.fr wrote:
> > > >
> > > > > amdgpu_dm_commit_planes already sets the flip_immediate flag for
> > > > > async page-flips. This flag is used to set the UNP_FLIP_CONTROL
> > > > > register. Thus, no additional change is required to handle async
> > > > > page-flips with the atomic uAPI.
> > > > >
> > > > > Note, async page-flips are still unsupported on DCE with the atomic
> > > > > uAPI. The mode_set_base callbacks unconditionally set the
> > > > > GRPH_SURFACE_UPDATE_H_RETRACE_EN field of the GRPH_FLIP_CONTROL
> > > > > register to 0, which disables async page-flips.
> > > >
> > > > Can you elaborate a bit on this? We don't use hsync flips at all, even
> > > > in non-atomic, as far as I recall. The hardware can also do immediate
> > > > flips which take effect as soon as you update the base address
> > > > register which is what we use for async updates today IIRC.
> > >
> > > When user-space performs a page-flip with the legacy KMS uAPI on DCE
> > > ASICs, amdgpu_display_crtc_page_flip_target() is called. This function
> > > checks for the DRM_MODE_PAGE_FLIP_ASYNC flag, sets work->async, which
> > > is then passed as an argument to adev->mode_info.funcs->page_flip() by
> > > amdgpu_display_flip_work_func(). Looking at an implementation, for
> > > instance dce_v10_0_page_flip(), the async flag is used to set that
> > > GRPH_FLIP_CONTROL register:
> > >
> > >         /* flip at hsync for async, default is vsync */
> > >         tmp = RREG32(mmGRPH_FLIP_CONTROL + amdgpu_crtc->crtc_offset);
> > >         tmp = REG_SET_FIELD(tmp, GRPH_FLIP_CONTROL,
> > >                             GRPH_SURFACE_UPDATE_H_RETRACE_EN, async ? 1 : 0);
> > >         WREG32(mmGRPH_FLIP_CONTROL + amdgpu_crtc->crtc_offset, tmp);
> > >
> > > I don't know how the hardware works, but I assumed it would be
> > > necessary to do the same in the atomic uAPI code-path as well. However
> > > dce_v10_0_crtc_do_set_base() has this code block:
> > >
> > >         /* Make sure surface address is updated at vertical blank rather than
> > >          * horizontal blank
> > >          */
> > >         tmp = RREG32(mmGRPH_FLIP_CONTROL + amdgpu_crtc->crtc_offset);
> > >         tmp = REG_SET_FIELD(tmp, GRPH_FLIP_CONTROL,
> > >                             GRPH_SURFACE_UPDATE_H_RETRACE_EN, 0);
> > >         WREG32(mmGRPH_FLIP_CONTROL + amdgpu_crtc->crtc_offset, tmp);
> > >
> > > Which unconditionally sets that same register.
> > >
> > > Either way, it's not a very big deal for this patch series, DCE and DCN
> > > are separate, DCE can be sorted out separately.
> > >
> > > Am I completely mistaken here?
> >
> > I checked the code and it looks like only DCE11 and newer support
> > immediate flips.  E.g.,
> >
> >         /* flip immediate for async, default is vsync */
> >         tmp = RREG32(mmGRPH_FLIP_CONTROL + amdgpu_crtc->crtc_offset);
> >         tmp = REG_SET_FIELD(tmp, GRPH_FLIP_CONTROL,
> >                             GRPH_SURFACE_UPDATE_IMMEDIATE_EN, async ? 1 : 0);
> >
> > in dce_v11_0.c.
> >
> > Either way, the non-DC display code is not atomic anyway, so I don't
> > think this is an issue.  We still support async flips via the
> > non-atomic API.  I agree this is not blocking for the patch series,
> > just thinking out loud mostly.
>
> Michel pointed out that DC can drive both DCN and DCE. This was a
> misunderstanding on my end, I thought DC could only drive DCN. I'll reword the
> commit message to refer to DC instead of DCN.
>
> This begs the question, should we bother to set the
> atomic_async_page_flip_not_supported flag on non-atomic drivers? I've just
> slapped the flag everywhere for simplicity's sake, but maybe it would make more
> sense to just set it for atomic-capable drivers. Especially if the long-term
> goal is to convert all atomic drivers to support async flips and eventually
> remove atomic_async_page_flip_not_supported.

yeah, I think we can drop the flag for non-atomic.  amdgpu at least
already supports async flips.

>
> Thanks for the hint regarding DCE10. It sounds like it may be worthwhile to
> unset drm_mode_config.async_page_flip on DCE10 and earlier, to indicate to
> user-space that async page-flips are not supported on these ASICs? Right now it
> seems like we indicate that we support them, and then ignore the ASYNC_FLIP
> flag?

Async flips work fine with the current code.  I think I did the
initial implementation on DCE10.  We set
GRPH_SURFACE_UPDATE_H_RETRACE_EN dynamically in dce_v10_0_page_flip()
based on the type of flip selected.

Alex
