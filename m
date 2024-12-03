Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BE29E1EA3
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 15:07:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC59110E21C;
	Tue,  3 Dec 2024 14:07:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RK08XOP+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536C210EA09
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 14:07:39 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2ffa49f623cso70510741fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 06:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733234857; x=1733839657; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=alsc9vr73lToVKNbHqTqZ3F3g1arQk5UqwKIUtPE6Ps=;
 b=RK08XOP+o18SfPMgqsYu6pxaRmt6++1KyXhmwaJlavBI9IVLWWYhGqh9LXUEbKrWwK
 dOMXLmagReBPsnKaaC38gGEv+zCrIYJYuM+yUa84v9u6PRQTFLEsmn+PBdEpX71O/wSl
 65pZyixuYGS5rfDUAGSNfiomXhGwPAhVqiWQEG2hspY/eazNEaQT5dfniVfke4EGFv1W
 8XoDhXVY1iOSc9nQ1twvcVpnpGodk+ye9FhIDWcPmiiUg7SNFAavxliPxpuH4mXy9WVd
 2IeQUDgsp+8ZPFs+Cj4lNOCZvUylscimg5G18iqXiVJxOWzT3NKpqZJTjrrOIo/Wc1ze
 iHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733234857; x=1733839657;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=alsc9vr73lToVKNbHqTqZ3F3g1arQk5UqwKIUtPE6Ps=;
 b=JrGt5+/tPyF/nnL5uLYIsqdNydOKuaAN9GvSFK7EZdCxIX/mpwT6F2hapj0BwQSOtQ
 AkcABQPHSqj/HTXF1MVLslRd2ERPhLxrIlxSn0+FvLqZ0mD9gj47+dw2BR7BX+/mSTd2
 NeaNwW/ED5wuI9HUCyXPxcMCq9HKmGAu/7vcwEccRgFgnDj/EYMHACoquNCYxTrrzdMi
 VTPDBMjALGbdrH2tZkLBWVQByG4BaaMcthvhRLhGQCDx21cgwqFAH9jS8r9z0RG03dya
 baAO/GM+0RQ3h8ahBidJCy+ixrjkk5l/T4M3qXiHUZV99EpEYSLra6RH5IUb9ProCD4G
 bcfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAEqiEwizehIBL1hKxKyWhPvmbf4TX0JQ3igny8e+dAEIoJRCix4fXJoi0LsY5G1tPicJvOczs/QE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YweOR6J2qhA2xi20uRhmZ0b/yjDMARjCeFf2POWmuOe5apOg1r6
 MWevNl9EI3BErhzpTb2IAt87Z4fzSIDzC1Y3yhyl3re1eCL3k24cG9uJZNwuCZc=
X-Gm-Gg: ASbGnctTGTGFD14rAIu/wt0ztK+OgPGfr2EHro6fbFBDM3ydsZ4idgIAn942EECovQ4
 BKJvarwYOzjtPaRgzFmo37Q9DGMEi4ML1huFiuQARCMD5pPdUwaBW8vTagUrnU/uLOV9L5wrV9K
 +VL2I7uFIv60EEbqtBEb1P0P2fsTnrJtLCH9KDUA7LCw+R9wByJENxhpG75MJaV/kc9DbjfigCA
 SBT3dGSaO+hMVJDFZXNjh+MaSOyJKDrNu4DRxvx6KUiZW+m5rnVxk2OV7HxfLOcFhclT1waNp4X
 ERbv4w0KcnZ+/ffodx2KNSgfDRl7Fw==
X-Google-Smtp-Source: AGHT+IGzMeET4siJUKFgW4BnmqUwqvzwcdd9B9sOmlcJgCBnOeScvQxwQ4zyH6t4AC935j3xTebwFQ==
X-Received: by 2002:a2e:bd82:0:b0:2fb:5ebe:ed40 with SMTP id
 38308e7fff4ca-30009c3443dmr15745541fa.15.1733234855610; 
 Tue, 03 Dec 2024 06:07:35 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ffdfc74a1csm16403761fa.69.2024.12.03.06.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 06:07:33 -0800 (PST)
Date: Tue, 3 Dec 2024 16:07:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Xiangxu Yin <quic_xiangxuy@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, quic_lliu6@quicinc.com,
 quic_fangez@quicinc.com, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 7/8] drm/msm/dp: Retry Link Training 2 with lower pattern
Message-ID: <xlmgdysjah3ueypdrdu5b6botvidb2wn4rfm4qpeysclscmuwy@vpfv2ymprblj>
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-7-09a4338d93ef@quicinc.com>
 <CAA8EJpoN1qBHyZrQJT_=e_26+tcaKRnSrhtxrK6zBP4BwpL=Hg@mail.gmail.com>
 <b4345b9e-62c6-470d-b1b0-4758cef7f175@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4345b9e-62c6-470d-b1b0-4758cef7f175@quicinc.com>
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

On Tue, Dec 03, 2024 at 04:13:22PM +0800, Xiangxu Yin wrote:
> 
> 
> On 11/29/2024 9:53 PM, Dmitry Baryshkov wrote:
> > On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
> >>
> >> Add a mechanism to retry Link Training 2 by lowering the pattern level
> >> when the link training #2 first attempt fails. This approach enhances
> >> compatibility, particularly addressing issues caused by certain hub
> >> configurations.
> > 
> > Please reference corresponding part of the standard, describing this lowering.
> > 
> Per DisplayPort 1.4a specification Section 3.5.1.2 and Table 3-10, while the standard doesn't explicitly define a TPS downgrade mechanism, it does specify:

Anything in DP 2.1?

> - All devices shall support TPS1 and TPS2
> - HDR2-capable devices shall support TPS3
> - HDR3-capable devices shall support TPS4
> While these capabilities are explicitly defined DPCD for sink devices, source device capabilities are less strictly defined, with the minimum requirement being support for TPS1 and TPS2.
> In QCS615 DP phy is only supporting to HBR2, we observed a critical interoperability scenario with a DP->HDMI bridge. When link training at TPS4 consistently failed, downgrading to the next lower training pattern successfully established the link and display output successfully.

Any other driver doing such TPS lowering? Or maybe we should be
selecting TPS3 for HBR2-only devices?

> 
> This experience suggests that implementing a flexible link training pattern downgrade mechanism can significantly improve compatibility with third-party, non-standard hubs and displays,
> especially in scenarios where strict adherence to the highest training pattern might prevent successful connection.
> >>
> >> Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>
> >> ---
> >>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 34 ++++++++++++++++++++++++++++++----
> >>  1 file changed, 30 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> >> index 49c8ce9b2d0e57a613e50865be3fe98e814d425a..b1862294cb98c9f756b0108b7670cb42de37bae4 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> >> @@ -1220,7 +1220,7 @@ static void msm_dp_ctrl_clear_training_pattern(struct msm_dp_ctrl_private *ctrl)
> >>  }
> >>
> >>  static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
> >> -                       int *training_step)
> >> +                       int *training_step, bool downgrade)
> >>  {
> >>         int tries = 0, ret = 0;
> >>         u8 pattern;
> >> @@ -1243,6 +1243,28 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
> >>                 state_ctrl_bit = 2;
> >>         }
> >>
> >> +       /*
> >> +        * DP link training uses the highest allowed pattern by default.
> >> +        * If it fails, the pattern is downgraded to improve cable and monitor compatibility.
> >> +        */
> >> +       if (downgrade) {
> >> +               switch (pattern) {
> >> +               case DP_TRAINING_PATTERN_4:
> >> +                       pattern = DP_TRAINING_PATTERN_3;
> >> +                       state_ctrl_bit = 3;
> >> +                       break;
> >> +               case DP_TRAINING_PATTERN_3:
> >> +                       pattern = DP_TRAINING_PATTERN_2;
> >> +                       state_ctrl_bit = 2;
> >> +                       break;
> >> +               default:
> >> +                       break;
> >> +               }
> >> +       }
> >> +
> >> +       drm_dbg_dp(ctrl->drm_dev, "pattern(%d) state_ctrl_bit(%d) downgrade(%d)\n",
> >> +               pattern, state_ctrl_bit, downgrade);
> >> +
> >>         ret = msm_dp_catalog_ctrl_set_pattern_state_bit(ctrl->catalog, state_ctrl_bit);
> >>         if (ret)
> >>                 return ret;
> >> @@ -1311,10 +1333,14 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
> >>         /* print success info as this is a result of user initiated action */
> >>         drm_dbg_dp(ctrl->drm_dev, "link training #1 successful\n");
> >>
> >> -       ret = msm_dp_ctrl_link_train_2(ctrl, training_step);
> >> +       ret = msm_dp_ctrl_link_train_2(ctrl, training_step, false);
> >>         if (ret) {
> >> -               DRM_ERROR("link training #2 failed. ret=%d\n", ret);
> >> -               goto end;
> >> +               drm_dbg_dp(ctrl->drm_dev, "link training #2 failed, retry downgrade.\n");
> >> +               ret = msm_dp_ctrl_link_train_2(ctrl, training_step, true);
> >> +               if (ret) {
> >> +                       DRM_ERROR("link training #2 failed. ret=%d\n", ret);
> >> +                       goto end;
> >> +               }
> >>         }
> >>
> >>         /* print success info as this is a result of user initiated action */
> >>
> >> --
> >> 2.25.1
> >>
> > 
> > 
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry
