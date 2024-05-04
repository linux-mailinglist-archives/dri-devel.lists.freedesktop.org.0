Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 516B08BB895
	for <lists+dri-devel@lfdr.de>; Sat,  4 May 2024 02:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 065E210EC97;
	Sat,  4 May 2024 00:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="So8NBTkl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED6F810E780
 for <dri-devel@lists.freedesktop.org>; Sat,  4 May 2024 00:02:44 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-62026f59233so1610327b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 17:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714780964; x=1715385764; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IWfUOzDKDaHyvvHIKdIupNeybV1v+hpH82Kvs33JOtQ=;
 b=So8NBTklqbGjlht7Yw/1K4RCAuGKoTiLq8ZOdfwfDwjToH+zzSdhK8dmhr1tVHlKMD
 zoCoOpUmNJQstoE+6fK0+jDLxBgv/aMayauRZpcTL9pJG9RHKwnq/BojCnd67/quV6dl
 LaSJzbNrK5O2kD3cuKeVerfwVYJCfOEdeowG6stsWB4mWfWpFfh+dRMlBsVZfd/lS/2c
 SnhOkaAnaX29FBu/kacBqLKU3WIJP967gLfFVP8NShGQcwO7tJpOuXZxfcaJ+0uRgEC4
 UjndyDygGRaNZ5BLEQqdJVKw0Z5v/D5jbjshCYppm/0FqX8kxPcjlvkwUttfrIjQ/Rlx
 SZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714780964; x=1715385764;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IWfUOzDKDaHyvvHIKdIupNeybV1v+hpH82Kvs33JOtQ=;
 b=ZZlyJUDj0/CiJGsE4JuVGqYUW53BOe7/yC87BW8hogAaK4UjlIg+Dg0iZZ2fytVvw8
 +5cPopr+w+u4RP4hxBcD9HFPB8BG1BR3i5CpHII+mAVSpWF9ATKByAAgIYK6DYUawZGs
 lHaZIGnyGi+D7mXKAA0TE9ou7AssmwIRx4v5AAWV2dy/OxugiSDeIbXBWe6hPQFpUU5T
 kwf3lQAhViFTSDdsVU5bm8dGLdwV+inKJDHhUrmmf1VvozGGjI0DaOsSqA3S/y+zMe6n
 expWlsw8nAcUMssCTIugTM1ZlJuXWOZHiu9viHvHfL2vu0h1417NtWULlenfXYhtQvnE
 sKCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoFWHpeHMCgT1yUezZK0USANzyisdxfTjc5nKpuMEpbobJZf6OXsdhd8bX1x+o4Ap2aHAe7R9cdWFH0ge05U0770fAqeqQ8mrm1+fL7pHb
X-Gm-Message-State: AOJu0YzpaziuUIENnBGLAXdG1YalsnIS5wTn7U5MMNrmWhX8aeugZFZd
 o/JZ+3exNpHuZzgubfB6bMsRWHkIHJg10HUn5Y7D+faUUyfhmQs4QYfJtpAYJ4//Dk2ir8ZXwXs
 8LFkB3M7gQ7rJDTiNoO0xaOObvbadLsQnaXm5kw==
X-Google-Smtp-Source: AGHT+IEymS5X5ig3FJMTRZ56tRBGiOhi2tDbas/Tb524ePf/hM4/Xj702HYCnq1FuYFayU9Ud8U1yzDouq4Mi2oXsKk=
X-Received: by 2002:a0d:ea54:0:b0:618:5c6e:9291 with SMTP id
 t81-20020a0dea54000000b006185c6e9291mr3221458ywe.17.1714780963901; Fri, 03
 May 2024 17:02:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240503-fd-fix-lxml-v2-0-f80a60ce21a1@linaro.org>
 <20240503-fd-fix-lxml-v2-2-f80a60ce21a1@linaro.org>
 <69b593b7-109c-825f-3dbb-5e8cce63ff01@quicinc.com>
 <CAA8EJpp4x+NEpMAGtgOmu-0NY8ycTu0iQX6-1Vv76mkKPea_Cw@mail.gmail.com>
 <24fb0b07-af03-1341-d98c-46f4f167fbbb@quicinc.com>
In-Reply-To: <24fb0b07-af03-1341-d98c-46f4f167fbbb@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 4 May 2024 03:02:32 +0300
Message-ID: <CAA8EJporB9jjKtT-XS4PcRSYzi+FJh1smsjnBCgy8f5JvDtjAg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/ci: validate drm/msm XML register files
 against schema
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Helen Koike <helen.koike@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 4 May 2024 at 01:38, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 5/3/2024 1:20 PM, Dmitry Baryshkov wrote:
> > On Fri, 3 May 2024 at 22:42, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 5/3/2024 11:15 AM, Dmitry Baryshkov wrote:
> >>> In order to validate drm/msm register definition files against schema,
> >>> reuse the nodebugfs build step. The validation entry is guarded by
> >>> the EXPERT Kconfig option and we don't want to enable that option for
> >>> all the builds.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>    drivers/gpu/drm/ci/build.sh  | 3 +++
> >>>    drivers/gpu/drm/ci/build.yml | 1 +
> >>>    2 files changed, 4 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
> >>> index 106f2d40d222..28a495c0c39c 100644
> >>> --- a/drivers/gpu/drm/ci/build.sh
> >>> +++ b/drivers/gpu/drm/ci/build.sh
> >>> @@ -12,6 +12,9 @@ rm -rf .git/rebase-apply
> >>>    apt-get update
> >>>    apt-get install -y libssl-dev
> >>>
> >>> +# for msm header validation
> >>> +apt-get install -y python3-lxml
> >>> +
> >>>    if [[ "$KERNEL_ARCH" = "arm64" ]]; then
> >>>        GCC_ARCH="aarch64-linux-gnu"
> >>>        DEBIAN_ARCH="arm64"
> >>> diff --git a/drivers/gpu/drm/ci/build.yml b/drivers/gpu/drm/ci/build.yml
> >>> index 17ab38304885..9c198239033d 100644
> >>> --- a/drivers/gpu/drm/ci/build.yml
> >>> +++ b/drivers/gpu/drm/ci/build.yml
> >>> @@ -106,6 +106,7 @@ build-nodebugfs:arm64:
> >>>      extends: .build:arm64
> >>>      variables:
> >>>        DISABLE_KCONFIGS: "DEBUG_FS"
> >>> +    ENABLE_KCONFIGS: "EXPERT DRM_MSM_VALIDATE_XML"
> >>>
> >>
> >> Wouldnt this end up enabling DRM_MSM_VALIDATE_XML for any arm64 device.
> >>
> >> Cant we make this build rule msm specific?
> >
> > No need to. We just need to validate the files at least once during
> > the whole pipeline build.
> >
>
> ah okay, today the arm64 config anyway sets all arm64 vendor drm configs
> to y.
>
> A couple of more questions:
>
> 1) Why is this enabled only for no-debugfs option?
> 2) Will there be any concerns from other vendors to enable CONFIG_EXPERT
> in their CI runs as the arm64 config is shared across all arm64 vendors.

I don't get the second question. This option is only enabled for
no-debugfs, which isn't used for execution.

I didn't want to add an extra build stage, just for the sake of
validating regs against the schema, nor did I want EXPERT to find its
way into the actual running kernels.

-- 
With best wishes
Dmitry
