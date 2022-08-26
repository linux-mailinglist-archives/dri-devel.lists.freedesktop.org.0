Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 375B25A29B0
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 16:40:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF0510E961;
	Fri, 26 Aug 2022 14:40:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4948410E953;
 Fri, 26 Aug 2022 14:40:00 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-11c5505dba2so2254809fac.13; 
 Fri, 26 Aug 2022 07:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=70ww/AExymzz+UmPMXjybg2d47V+uWPsEJH8066lTcc=;
 b=lRZi6JQEWW28NXguTPAFUUbT3rzMb3LtOs31aag17uFs0UDOn7PzgDbKLiLzoWkI7K
 l7H3zOQQvB0mXPl6/pkCXmT4VntwBk5QOazzr9f5XFtRvjz8RdxaNyazJRLt2J6/JOYF
 OcH+6KrtZRQS7Q+QPbCiGbIi7Z+ksuya7muNNkFLiej6lb8v0eBZX6JgnE1XAhujmMIX
 xkcnXBNDAcsSFlcHvSyG/RqduTlXp10y3AGAj688iWIXgaylFL5Lpx95gK1qXs5ho0OW
 R9ClgfKOMR3m/8Gck4Etpo+LjiDW8OYSFPlbYWsYwlZ1GO9HFpMJT9pXN+Mfel4sizHp
 U6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=70ww/AExymzz+UmPMXjybg2d47V+uWPsEJH8066lTcc=;
 b=UsdyOgqwM7pWqwlCMnROayEhu9kG8nszAB/aHY9LyX1I9EYLvOjTxHA6pal0UO+IRa
 mTc1Y9JZ/zzjQ9skSWjxQd3ZvLr9eKl9C1FVfWPEZjSM7sDSsFHb1wIx9OXwRjHD8S10
 GtpFc4hExFRSclDjVygb9akofi9063iOTeZgus7Tt5rvNH9FtSloyZz8/YS79ZqesfVD
 0JCUpOOk4WF3YEsNC0s5xsFJDNqi+asbYYlIWRJrMHIx1pm7C18iAdW91GwmLi35r6mH
 RuqOLT88RWzs92IilYBS/d1NcyiVTVE4R5Nlawbe4qijT4GygdSJesib4YsS6QUmE64c
 OsOA==
X-Gm-Message-State: ACgBeo3pbF+cRADDpmvfCb7l6VYrsCAxzT/Ptq4/8L5ctalaNbapHG7/
 6I2TsxKenj7Ku17VxgaGLS9eKAFEnLdib8rlFiM=
X-Google-Smtp-Source: AA6agR4KrRs0GS9IrOyc07r6pFPcUVxtZ2fY9AMM5V9/YS4gt0YzIxAxe3FcAjFc8bRFU3D/QsMhnhJyG4BksW+7YBU=
X-Received: by 2002:a05:6870:3484:b0:11e:4465:3d9b with SMTP id
 n4-20020a056870348400b0011e44653d9bmr2113943oah.46.1661524799138; Fri, 26 Aug
 2022 07:39:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220824150834.427572-1-contact@emersion.fr>
 <20220824150834.427572-5-contact@emersion.fr>
 <CADnq5_MX0Qh7v-Wy1nBhMEWT9bhmQn4W-2Wo97CZgKcby1Xc+w@mail.gmail.com>
 <A_ZL55UlxqGGQnHrxTxvFZMCn1HkWbIuaZvtrOnir7mO6YCY8hhyYwjwKjv79SEEBLqbosVtxx0rVeCTso1RktRjY3ECNyLssw77of_D2sM=@emersion.fr>
In-Reply-To: <A_ZL55UlxqGGQnHrxTxvFZMCn1HkWbIuaZvtrOnir7mO6YCY8hhyYwjwKjv79SEEBLqbosVtxx0rVeCTso1RktRjY3ECNyLssw77of_D2sM=@emersion.fr>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 26 Aug 2022 10:39:47 -0400
Message-ID: <CADnq5_NMHWGOdW5Gfr4wK6o5j7PnYKW57Gg6UbbUJfnONdHY1w@mail.gmail.com>
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

On Fri, Aug 26, 2022 at 3:38 AM Simon Ser <contact@emersion.fr> wrote:
>
> On Thursday, August 25th, 2022 at 20:22, Alex Deucher <alexdeucher@gmail.com> wrote:
>
> > On Wed, Aug 24, 2022 at 11:09 AM Simon Ser contact@emersion.fr wrote:
> >
> > > amdgpu_dm_commit_planes already sets the flip_immediate flag for
> > > async page-flips. This flag is used to set the UNP_FLIP_CONTROL
> > > register. Thus, no additional change is required to handle async
> > > page-flips with the atomic uAPI.
> > >
> > > Note, async page-flips are still unsupported on DCE with the atomic
> > > uAPI. The mode_set_base callbacks unconditionally set the
> > > GRPH_SURFACE_UPDATE_H_RETRACE_EN field of the GRPH_FLIP_CONTROL
> > > register to 0, which disables async page-flips.
> >
> > Can you elaborate a bit on this? We don't use hsync flips at all, even
> > in non-atomic, as far as I recall. The hardware can also do immediate
> > flips which take effect as soon as you update the base address
> > register which is what we use for async updates today IIRC.
>
> When user-space performs a page-flip with the legacy KMS uAPI on DCE
> ASICs, amdgpu_display_crtc_page_flip_target() is called. This function
> checks for the DRM_MODE_PAGE_FLIP_ASYNC flag, sets work->async, which
> is then passed as an argument to adev->mode_info.funcs->page_flip() by
> amdgpu_display_flip_work_func(). Looking at an implementation, for
> instance dce_v10_0_page_flip(), the async flag is used to set that
> GRPH_FLIP_CONTROL register:
>
>         /* flip at hsync for async, default is vsync */
>         tmp = RREG32(mmGRPH_FLIP_CONTROL + amdgpu_crtc->crtc_offset);
>         tmp = REG_SET_FIELD(tmp, GRPH_FLIP_CONTROL,
>                             GRPH_SURFACE_UPDATE_H_RETRACE_EN, async ? 1 : 0);
>         WREG32(mmGRPH_FLIP_CONTROL + amdgpu_crtc->crtc_offset, tmp);
>
> I don't know how the hardware works, but I assumed it would be
> necessary to do the same in the atomic uAPI code-path as well. However
> dce_v10_0_crtc_do_set_base() has this code block:
>
>         /* Make sure surface address is updated at vertical blank rather than
>          * horizontal blank
>          */
>         tmp = RREG32(mmGRPH_FLIP_CONTROL + amdgpu_crtc->crtc_offset);
>         tmp = REG_SET_FIELD(tmp, GRPH_FLIP_CONTROL,
>                             GRPH_SURFACE_UPDATE_H_RETRACE_EN, 0);
>         WREG32(mmGRPH_FLIP_CONTROL + amdgpu_crtc->crtc_offset, tmp);
>
> Which unconditionally sets that same register.
>
> Either way, it's not a very big deal for this patch series, DCE and DCN
> are separate, DCE can be sorted out separately.
>
> Am I completely mistaken here?

I checked the code and it looks like only DCE11 and newer support
immediate flips.  E.g.,

        /* flip immediate for async, default is vsync */
        tmp = RREG32(mmGRPH_FLIP_CONTROL + amdgpu_crtc->crtc_offset);
        tmp = REG_SET_FIELD(tmp, GRPH_FLIP_CONTROL,
                            GRPH_SURFACE_UPDATE_IMMEDIATE_EN, async ? 1 : 0);

in dce_v11_0.c.

Either way, the non-DC display code is not atomic anyway, so I don't
think this is an issue.  We still support async flips via the
non-atomic API.  I agree this is not blocking for the patch series,
just thinking out loud mostly.

Alex

>
> Thanks,
>
> Simon
