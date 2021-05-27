Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 027703925EC
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 06:13:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C1086E8C5;
	Thu, 27 May 2021 04:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE866E8C5;
 Thu, 27 May 2021 04:12:58 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 r26-20020a056830121ab02902a5ff1c9b81so3170333otp.11; 
 Wed, 26 May 2021 21:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wAtRRMb1FBGzO+jQIGrd+HIGuJW9STgbsAS6K+V97RQ=;
 b=HuW+0u6qUbeGkEDLvz7I2oy9Mc8OAbS1xNk5cVRIHHTMPu3qv3rBsTxByh3rpGW21a
 UOQSJhQdd+f3D185abbIMjJ2tMotDyk2KQ59iHE4DhpjxSmJjdY50esGah5i4BH2Sxdi
 8EiHVgeT9GQcqotkfiZCgSOI8X+Ub6+TL6JrT5L1Y+LwelzQHywdvv5dpdhFnKDJTAZc
 kaghpeLh4X77oaWOsCWtbqp1cG3c2JvGPOrlUqpeKe1wAB7LPMEngj7S6KmDGoftBT0m
 n/10XZfuyxymxLXV+3ci3/T8i4lGUdaveLHS9uwkqE3rBjgBogEN0ypopdFVp+zDMUxT
 sYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wAtRRMb1FBGzO+jQIGrd+HIGuJW9STgbsAS6K+V97RQ=;
 b=ZQaqKPujx2sVbkYBiVdZ5PJ6VgoNJmFxk97S1XDhRaN/UH203YEHR/0QPMG/DY1YKG
 SN0tuHTGLKQf3rG0Fb1+c00M5NG85jzu2SpxHiRTZNg3zT/xv6ErOAg1NWFX57KGtNIR
 iuEC7iDbR4myQnhWD/PFZNRpBc6TmPUocEETmt9cmSosj1FLslQ6Sz1dTvs/5p6SuxeY
 1aabznPW73W3jbGrhAgzyAW/SusC0W13avRHqOz+ZM4OOzcu19y+JA8H+amAu8wylh+M
 QvVSkb7bP+INYMiL+/bQNTS97ytxxf9ZGUu4uDROQ46mSqqtSgi8V6HBsQon8ATx8eDh
 4Kjg==
X-Gm-Message-State: AOAM5339bTOD0BFezh1ZIOyMy1rvUR2KJRl4ZUauVkTyq7QWUoqFeaN4
 HwJ6B67EyUptHKhbKbbsr6+Rhte6AtsxkbolYTaoXuvSffc=
X-Google-Smtp-Source: ABdhPJwZ4Ix3NcRn/6nTGZbbXYbkWrttOSD2i6IYoabkkdQes4mjHf1EiB4EJLDbj4Ps2yyCovGYGLpZQFalG5HV6jo=
X-Received: by 2002:a9d:6548:: with SMTP id q8mr1254263otl.311.1622088777455; 
 Wed, 26 May 2021 21:12:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210526084726.552052-1-lee.jones@linaro.org>
 <20210526084726.552052-17-lee.jones@linaro.org>
In-Reply-To: <20210526084726.552052-17-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 27 May 2021 00:12:46 -0400
Message-ID: <CADnq5_PmyZyZLO1N0q2fMM9NKPYYiMhbPBfgFyeOAWgi-i1MFg@mail.gmail.com>
Subject: Re: [PATCH 16/34] drm/amd/display/dc/dce/dce_transform: Remove
 superfluous re-initialisation of DCFE_MEM_LIGHT_SLEEP_CNTL,
To: Lee Jones <lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, Mauro Rossi <issor.oruam@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 26, 2021 at 4:48 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp_psp.c:374:22: wa=
rning: no previous prototype for =E2=80=98mod_hdcp_hdcp1_get_link_encryptio=
n_status=E2=80=99
>  In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce=
60_resource.c:28:
>  drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dce/dce_6_0_d.h:568:43: w=
arning: initialized field overwritten [-Woverride-init]
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:157:14: =
note: in expansion of macro =E2=80=98mmCRTC0_DCFE_MEM_LIGHT_SLEEP_CNTL=E2=
=80=99
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_transform.h:170:2: note=
: in expansion of macro =E2=80=98SRI=E2=80=99
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:183:3: n=
ote: in expansion of macro =E2=80=98XFM_COMMON_REG_LIST_DCE60=E2=80=99
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:187:3: n=
ote: in expansion of macro =E2=80=98transform_regs=E2=80=99
>  drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dce/dce_6_0_d.h:568:43: n=
ote: (near initialization for =E2=80=98xfm_regs[0].DCFE_MEM_LIGHT_SLEEP_CNT=
L=E2=80=99)
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:157:14: =
note: in expansion of macro =E2=80=98mmCRTC0_DCFE_MEM_LIGHT_SLEEP_CNTL=E2=
=80=99
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_transform.h:170:2: note=
: in expansion of macro =E2=80=98SRI=E2=80=99
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:183:3: n=
ote: in expansion of macro =E2=80=98XFM_COMMON_REG_LIST_DCE60=E2=80=99
>  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:187:3: n=
ote: in expansion of macro =E2=80=98transform_regs=E2=80=99
>  drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dce/dce_6_0_d.h:645:43: w=
arning: initialized field overwritten [-Woverride-init]
>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Mauro Rossi <issor.oruam@gmail.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/amd/display/dc/dce/dce_transform.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_transform.h b/drivers=
/gpu/drm/amd/display/dc/dce/dce_transform.h
> index cbce194ec7b82..e98b5d4141739 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dce_transform.h
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dce_transform.h
> @@ -166,8 +166,7 @@
>         SRI(SCL_F_SHARP_CONTROL, SCL, id)
>
>  #define XFM_COMMON_REG_LIST_DCE60(id) \
> -       XFM_COMMON_REG_LIST_DCE60_BASE(id), \
> -       SRI(DCFE_MEM_LIGHT_SLEEP_CNTL, CRTC, id)
> +       XFM_COMMON_REG_LIST_DCE60_BASE(id)

I believe this should be kept and it should be removed from
XFM_COMMON_REG_LIST_DCE60_BASE().

Alex

>  #endif
>
>  #define XFM_SF(reg_name, field_name, post_fix)\
> --
> 2.31.1
>
