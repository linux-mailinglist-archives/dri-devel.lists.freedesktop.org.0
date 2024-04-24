Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9793E8B0367
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 09:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C137410F8F1;
	Wed, 24 Apr 2024 07:43:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PYx9rcgX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED3310F8F1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 07:43:45 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-dc23bf7e5aaso6901946276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 00:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713944624; x=1714549424; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wtsihhksumpqYptVS7nFL045QDvdMYuFE08WIUvrDLM=;
 b=PYx9rcgXTDERnTmv1gFnYOi4Rs9i9tNxHqQHmjSQV8Z+1Fp6HQ73IaO01TUNkIVcge
 RbB4skrYrJXc6IQFevFrJ5g20KIhTaQh/hjAWde8BnXzdt5fWkuA3cUBkXCMn3fH4JKX
 QOIc/gdOLVMjHjbw7OUOH5XwLql+PBZxVqMWdZT4onEl4b86uB5l6DvQKbmvshNBWgVt
 aasy6yUNjLNDgTF9j5t7uTDJ9gwWG49OalZG28OQAdE/dleid+VoOeUg2Mxz+KQzMA4D
 fIskCL1+4Fbu7DQsrq1moz2abF4BdXadRBUziFyjkgr2DPM6T5KfzpZfvhtRaFInDx6g
 25Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713944624; x=1714549424;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wtsihhksumpqYptVS7nFL045QDvdMYuFE08WIUvrDLM=;
 b=Bc+d1sqafN9SmLaqOScBcAvO1sD6Zo9p/N/cbNJQ2Ql7LxitgwhcRg2iRq1q47mE3l
 tWjE/6+xjGo7pnrkS5xXjn6AtHaFSrmtlA0SexfZZjd7iyeZ4wa4S/qyVf3GxhA9AB1z
 RBwThMn+pFicjoWLrdcwxph0FwiTuNYmo2+t//bypoZ7tsyeRrjRFVejCPYZiqomFVUq
 CK8AI3IqlqJNofZ12Q41KIQPWcyM28Xizd1hQQLFGCw3ZTwCBqlsmXrkkrgDLt/z8dyB
 P3Mspnci6KHBqCLo5YWWCWSkVIM7IvSGPWSaegR8CXEoIZNBLvXqqZIjue3rUgf1aGyk
 WxlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCViJmdCXntcWjJVr4melxR9OPCghUtUpY5R2qcqYMJMW+PZvD/aAeLpqkgxBAtLH0onmN5LdivhfwJmPsJh8y1emzuIR9tc08AQ1t5Q2JZX
X-Gm-Message-State: AOJu0YxdVHAAK5wRJm1DrBMWKZ1d1BsKnndOQK4yIQpGVchg01y7w03F
 sDzKzArp3JJvTvMkg25SIDHPQFzcTl/LDMVPK3N5YaCzgdKpDt+L4VZ3PcDUjtbDjbhIpfBbIjT
 Gu0lRPp6u+unLjCxepud6vzvV+naPWIogMPLn8A==
X-Google-Smtp-Source: AGHT+IF6ZYrfiV6J/Ex+BTtfPhn4h1lI97ii3I32JXsH/ubecZf0tKeapodA/iVSzk2OAU67Z3K0OGIEKkbnClchApA=
X-Received: by 2002:a05:6902:110e:b0:dca:c369:fac2 with SMTP id
 o14-20020a056902110e00b00dcac369fac2mr2179571ybu.3.1713944624156; Wed, 24 Apr
 2024 00:43:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240420-panel-sw43408-fix-v1-0-b282ff725242@linaro.org>
 <20240420-panel-sw43408-fix-v1-1-b282ff725242@linaro.org>
 <d377e5c4-7716-4f4e-8fe4-472e3230eebe@linaro.org>
In-Reply-To: <d377e5c4-7716-4f4e-8fe4-472e3230eebe@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 24 Apr 2024 10:43:32 +0300
Message-ID: <CAA8EJpr-uTiLNbYxq2e7X7-QWaa83Rh3NhZa2ALMxTPPb2Nx0Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/panel/lg-sw43408: depends on
 CONFIG_DRM_DISPLAY_DP_HELPER
To: neil.armstrong@linaro.org
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
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

On Wed, 24 Apr 2024 at 09:54, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On 20/04/2024 04:41, Dmitry Baryshkov wrote:
> > This panel driver uses DSC PPS functions and as such depends on the
> > DRM_DISPLAY_DP_HELPER. Add missing dependency
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202404200800.kYsRYyli-lkp@intel.com/
>
> No Fixes ?

I'll add Fixes for v2. I'm waiting for the discussion on Kconfig to settle.

>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/panel/Kconfig | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> > index ab67789e59a2..5e6692207beb 100644
> > --- a/drivers/gpu/drm/panel/Kconfig
> > +++ b/drivers/gpu/drm/panel/Kconfig
> > @@ -340,6 +340,7 @@ config DRM_PANEL_LG_SW43408
> >       depends on OF
> >       depends on DRM_MIPI_DSI
> >       depends on BACKLIGHT_CLASS_DEVICE
> > +     depends on DRM_DISPLAY_DP_HELPER
> >       help
> >         Say Y here if you want to enable support for LG sw43408 panel.
> >         The panel has a 1080x2160@60Hz resolution and uses 24 bit RGB per
> >
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>



-- 
With best wishes
Dmitry
