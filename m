Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA43A9FA2D
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 22:08:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8204910E9F1;
	Mon, 28 Apr 2025 20:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CRFdrtIN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C8510E714;
 Mon, 28 Apr 2025 20:08:02 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id
 e9e14a558f8ab-3d5e2606a1bso48045075ab.0; 
 Mon, 28 Apr 2025 13:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745870881; x=1746475681; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iWnIADilPROQfhZbcZuvpmZDw5u9UHe9ZdLyBfiumno=;
 b=CRFdrtINtTusI1QMZTP+mJmJbZCuaX1xs+10xYsgUZeD+KWUdLxieiIM2E4TFOVkGK
 hH2lUEdZ01QSqZ5EKBsosN3dV0N1LANIxqIo/NMiaI3P3SD+0l0ivBe0q84oE6OyB/Dn
 cGGOYupDnu3CQubOusA+J5e8f/F5hug7CO0ZplpVhfJ4Eitn2mAXyN1IclI3+PztIR3o
 sgFYgqaJlcvIv2hvX3DQ9yM320KuSTqfqsVJ+yDlz5R7KB9h5nv3UCAbrKTfgiwL0qL1
 ob80YLNNrHEM5OhZus39yKJNf9vb2LajRYV6U64R06BgJ7Vi5TpOXaIbVPdnuA6uIFVT
 CIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745870881; x=1746475681;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iWnIADilPROQfhZbcZuvpmZDw5u9UHe9ZdLyBfiumno=;
 b=gfP6sON8s0CyIe4JMuezfR4MFggNIKrGbfdz3+d5jSGUcJVwBtndtRsb5GPx+MShv/
 lIbW6HLNf1tlWRpc0ct6liDOp2wLozXlQt5ZOtTjEjQCZ4q6gWSs4MVRSZn1IVyGVTMu
 v6vGxcBg+uNRFjjEk/WXz0suiV6/YsBnqXGVpRBwEb5r72yBSYKvSockv7PFoSaT3qIZ
 GY9sry0bMJy7p7qvfZAJX91+j6eGztRgMAdrCFDtPJUsXMXfFr8GjG9k3G4J8mfjss46
 dBMxR+xdbojorptKi213G6ByAPvKj0zYXd07IENXmSW8SJzx1O+152xwqxnQ3GycPL6a
 Loog==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKvfLVYHbFjTKC8a3PK7GPkjpeKKMz71ASku/ID+nosr1ME/PjOHNU6Ul6bRQWSS8onDOm+Qa7K+E=@lists.freedesktop.org,
 AJvYcCVwzgtpQ07UsyUN58tqeA9Di1eQ8b1HdgvfakeBg8kAT8GWsknEgO+wR3yEBME/QQw9N563Nap0TT+Q@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFDEvDXWZvhPLzjcz7kECMI5MLNipzRx05iosDZTBAC76gpDpf
 ++6WzrlHSKXigNBFWAHulIRflgMWtL42xh9K/HbEtVgX6YObDoJ7du+dT15gr5DIfKDucpvB8D3
 tWuSkMLxBtQaCp7JzPwolGVNHKXE=
X-Gm-Gg: ASbGncsiEumBaoXyYXMstCUo2tgBYAZuekwcoGeOmHBWP3pdV4ZZavhb+frqHZ+OepQ
 0zdO42N0hUX/IV6pLUbjtXa8zMwOhMbaKa2UOSg9c6xbHKgImsfwmxO/G49ALh0yr8SsnPnmdcV
 kvIWyx7wB0NoJ+ZNh7HzoX0bYPMYPOS1y+eKxzvGD7hgdNXcTx60CZJssQI0Arfg==
X-Google-Smtp-Source: AGHT+IGDbHc+XXH/VJsWaa/q+U93uQ0j65YLwG7dYwBdeOSNwdWZZPSWoJyHJ5h3dCN88knlUGjt2Zxrhk59XMqyboY=
X-Received: by 2002:a05:6e02:3008:b0:3d3:d00c:3602 with SMTP id
 e9e14a558f8ab-3d95d835c48mr6761235ab.10.1745870880979; Mon, 28 Apr 2025
 13:08:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <20250417021349.148911-5-alex.vinarskis@gmail.com>
In-Reply-To: <20250417021349.148911-5-alex.vinarskis@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 28 Apr 2025 13:07:47 -0700
X-Gm-Features: ATxdqUF-RmOIWHo9oUJkhHpXg4mf9bDj4Qpn8L9zs5EASxERcQwU6fnR6TdGa3c
Message-ID: <CAF6AEGvcD1EMJOgWEpBZkeecrCuic0qBbc4=kRFNL1GiyHf+vQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] drm/msm/dp: Introduce link training per-segment
 for LTTPRs
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, laurentiu.tudor1@dell.com,
 abel.vesa@linaro.org, 
 johan@kernel.org, Stefan Schmidt <stefan.schmidt@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 16, 2025 at 7:13=E2=80=AFPM Aleksandrs Vinarskis
<alex.vinarskis@gmail.com> wrote:
>
> DisplayPort requires per-segment link training when LTTPR are switched
> to non-transparent mode, starting with LTTPR closest to the source.
> Only when each segment is trained individually, source can link train
> to sink.
>
> Implement per-segment link traning when LTTPR(s) are detected, to
> support external docking stations. On higher level, changes are:
>
> * Pass phy being trained down to all required helpers
> * Run CR, EQ link training per phy
> * Set voltage swing, pre-emphasis levels per phy
>
> This ensures successful link training both when connected directly to
> the monitor (single LTTPR onboard most X1E laptops) and via the docking
> station (at least two LTTPRs).
>
> Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org>
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

Tested-by: Rob Clark <robdclark@gmail.com>  # yoga slim 7x

> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 126 ++++++++++++++++++++++---------
>  1 file changed, 89 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp=
_ctrl.c
> index 69a26bb5fabd..a50bfafbb4ea 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1034,10 +1034,12 @@ static int msm_dp_ctrl_set_vx_px(struct msm_dp_ct=
rl_private *ctrl,
>         return 0;
>  }
>
> -static int msm_dp_ctrl_update_vx_px(struct msm_dp_ctrl_private *ctrl)
> +static int msm_dp_ctrl_update_phy_vx_px(struct msm_dp_ctrl_private *ctrl=
,
> +                                       enum drm_dp_phy dp_phy)
>  {
>         struct msm_dp_link *link =3D ctrl->link;
> -       int ret =3D 0, lane, lane_cnt;
> +       int lane, lane_cnt, reg;
> +       int ret =3D 0;
>         u8 buf[4];
>         u32 max_level_reached =3D 0;
>         u32 voltage_swing_level =3D link->phy_params.v_level;
> @@ -1075,8 +1077,13 @@ static int msm_dp_ctrl_update_vx_px(struct msm_dp_=
ctrl_private *ctrl)
>
>         drm_dbg_dp(ctrl->drm_dev, "sink: p|v=3D0x%x\n",
>                         voltage_swing_level | pre_emphasis_level);
> -       ret =3D drm_dp_dpcd_write(ctrl->aux, DP_TRAINING_LANE0_SET,
> -                                       buf, lane_cnt);
> +
> +       if (dp_phy =3D=3D DP_PHY_DPRX)
> +               reg =3D DP_TRAINING_LANE0_SET;
> +       else
> +               reg =3D DP_TRAINING_LANE0_SET_PHY_REPEATER(dp_phy);
> +
> +       ret =3D drm_dp_dpcd_write(ctrl->aux, reg, buf, lane_cnt);
>         if (ret =3D=3D lane_cnt)
>                 ret =3D 0;
>
> @@ -1084,9 +1091,10 @@ static int msm_dp_ctrl_update_vx_px(struct msm_dp_=
ctrl_private *ctrl)
>  }
>
>  static bool msm_dp_ctrl_train_pattern_set(struct msm_dp_ctrl_private *ct=
rl,
> -               u8 pattern)
> +               u8 pattern, enum drm_dp_phy dp_phy)
>  {
>         u8 buf;
> +       int reg;
>         int ret =3D 0;
>
>         drm_dbg_dp(ctrl->drm_dev, "sink: pattern=3D%x\n", pattern);
> @@ -1096,17 +1104,26 @@ static bool msm_dp_ctrl_train_pattern_set(struct =
msm_dp_ctrl_private *ctrl,
>         if (pattern && pattern !=3D DP_TRAINING_PATTERN_4)
>                 buf |=3D DP_LINK_SCRAMBLING_DISABLE;
>
> -       ret =3D drm_dp_dpcd_writeb(ctrl->aux, DP_TRAINING_PATTERN_SET, bu=
f);
> +       if (dp_phy =3D=3D DP_PHY_DPRX)
> +               reg =3D DP_TRAINING_PATTERN_SET;
> +       else
> +               reg =3D DP_TRAINING_PATTERN_SET_PHY_REPEATER(dp_phy);
> +
> +       ret =3D drm_dp_dpcd_writeb(ctrl->aux, reg, buf);
>         return ret =3D=3D 1;
>  }
>
>  static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
> -                       int *training_step)
> +                       int *training_step, enum drm_dp_phy dp_phy)
>  {
> +       int delay_us;
>         int tries, old_v_level, ret =3D 0;
>         u8 link_status[DP_LINK_STATUS_SIZE];
>         int const maximum_retries =3D 4;
>
> +       delay_us =3D drm_dp_read_clock_recovery_delay(ctrl->aux,
> +                                                   ctrl->panel->dpcd, dp=
_phy, false);
> +
>         msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
>
>         *training_step =3D DP_TRAINING_1;
> @@ -1115,18 +1132,19 @@ static int msm_dp_ctrl_link_train_1(struct msm_dp=
_ctrl_private *ctrl,
>         if (ret)
>                 return ret;
>         msm_dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_1 |
> -               DP_LINK_SCRAMBLING_DISABLE);
> +               DP_LINK_SCRAMBLING_DISABLE, dp_phy);
>
> -       ret =3D msm_dp_ctrl_update_vx_px(ctrl);
> +       msm_dp_link_reset_phy_params_vx_px(ctrl->link);
> +       ret =3D msm_dp_ctrl_update_phy_vx_px(ctrl, dp_phy);
>         if (ret)
>                 return ret;
>
>         tries =3D 0;
>         old_v_level =3D ctrl->link->phy_params.v_level;
>         for (tries =3D 0; tries < maximum_retries; tries++) {
> -               drm_dp_link_train_clock_recovery_delay(ctrl->aux, ctrl->p=
anel->dpcd);
> +               fsleep(delay_us);
>
> -               ret =3D drm_dp_dpcd_read_link_status(ctrl->aux, link_stat=
us);
> +               ret =3D drm_dp_dpcd_read_phy_link_status(ctrl->aux, dp_ph=
y, link_status);
>                 if (ret)
>                         return ret;
>
> @@ -1147,7 +1165,7 @@ static int msm_dp_ctrl_link_train_1(struct msm_dp_c=
trl_private *ctrl,
>                 }
>
>                 msm_dp_link_adjust_levels(ctrl->link, link_status);
> -               ret =3D msm_dp_ctrl_update_vx_px(ctrl);
> +               ret =3D msm_dp_ctrl_update_phy_vx_px(ctrl, dp_phy);
>                 if (ret)
>                         return ret;
>         }
> @@ -1199,21 +1217,31 @@ static int msm_dp_ctrl_link_lane_down_shift(struc=
t msm_dp_ctrl_private *ctrl)
>         return 0;
>  }
>
> -static void msm_dp_ctrl_clear_training_pattern(struct msm_dp_ctrl_privat=
e *ctrl)
> +static void msm_dp_ctrl_clear_training_pattern(struct msm_dp_ctrl_privat=
e *ctrl,
> +                                              enum drm_dp_phy dp_phy)
>  {
> -       msm_dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_DISABLE);
> -       drm_dp_link_train_channel_eq_delay(ctrl->aux, ctrl->panel->dpcd);
> +       int delay_us;
> +
> +       msm_dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_DISABLE, =
dp_phy);
> +
> +       delay_us =3D drm_dp_read_channel_eq_delay(ctrl->aux,
> +                                               ctrl->panel->dpcd, dp_phy=
, false);
> +       fsleep(delay_us);
>  }
>
>  static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
> -                       int *training_step)
> +                       int *training_step, enum drm_dp_phy dp_phy)
>  {
> +       int delay_us;
>         int tries =3D 0, ret =3D 0;
>         u8 pattern;
>         u32 state_ctrl_bit;
>         int const maximum_retries =3D 5;
>         u8 link_status[DP_LINK_STATUS_SIZE];
>
> +       delay_us =3D drm_dp_read_channel_eq_delay(ctrl->aux,
> +                                               ctrl->panel->dpcd, dp_phy=
, false);
> +
>         msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
>
>         *training_step =3D DP_TRAINING_2;
> @@ -1233,12 +1261,12 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp=
_ctrl_private *ctrl,
>         if (ret)
>                 return ret;
>
> -       msm_dp_ctrl_train_pattern_set(ctrl, pattern);
> +       msm_dp_ctrl_train_pattern_set(ctrl, pattern, dp_phy);
>
>         for (tries =3D 0; tries <=3D maximum_retries; tries++) {
> -               drm_dp_link_train_channel_eq_delay(ctrl->aux, ctrl->panel=
->dpcd);
> +               fsleep(delay_us);
>
> -               ret =3D drm_dp_dpcd_read_link_status(ctrl->aux, link_stat=
us);
> +               ret =3D drm_dp_dpcd_read_phy_link_status(ctrl->aux, dp_ph=
y, link_status);
>                 if (ret)
>                         return ret;
>
> @@ -1248,7 +1276,7 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_c=
trl_private *ctrl,
>                 }
>
>                 msm_dp_link_adjust_levels(ctrl->link, link_status);
> -               ret =3D msm_dp_ctrl_update_vx_px(ctrl);
> +               ret =3D msm_dp_ctrl_update_phy_vx_px(ctrl, dp_phy);
>                 if (ret)
>                         return ret;
>
> @@ -1257,9 +1285,32 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_=
ctrl_private *ctrl,
>         return -ETIMEDOUT;
>  }
>
> +static int msm_dp_ctrl_link_train_1_2(struct msm_dp_ctrl_private *ctrl,
> +                                     int *training_step, enum drm_dp_phy=
 dp_phy)
> +{
> +       int ret;
> +
> +       ret =3D msm_dp_ctrl_link_train_1(ctrl, training_step, dp_phy);
> +       if (ret) {
> +               DRM_ERROR("link training #1 on phy %d failed. ret=3D%d\n"=
, dp_phy, ret);
> +               return ret;
> +       }
> +       drm_dbg_dp(ctrl->drm_dev, "link training #1 on phy %d successful\=
n", dp_phy);
> +
> +       ret =3D msm_dp_ctrl_link_train_2(ctrl, training_step, dp_phy);
> +       if (ret) {
> +               DRM_ERROR("link training #2 on phy %d failed. ret=3D%d\n"=
, dp_phy, ret);
> +               return ret;
> +       }
> +       drm_dbg_dp(ctrl->drm_dev, "link training #2 on phy %d successful\=
n", dp_phy);
> +
> +       return 0;
> +}
> +
>  static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
>                         int *training_step)
>  {
> +       int i;
>         int ret =3D 0;
>         const u8 *dpcd =3D ctrl->panel->dpcd;
>         u8 encoding[] =3D { 0, DP_SET_ANSI_8B10B };
> @@ -1272,8 +1323,6 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctr=
l_private *ctrl,
>         link_info.rate =3D ctrl->link->link_params.rate;
>         link_info.capabilities =3D DP_LINK_CAP_ENHANCED_FRAMING;
>
> -       msm_dp_link_reset_phy_params_vx_px(ctrl->link);
> -
>         msm_dp_aux_link_configure(ctrl->aux, &link_info);
>
>         if (drm_dp_max_downspread(dpcd))
> @@ -1288,24 +1337,27 @@ static int msm_dp_ctrl_link_train(struct msm_dp_c=
trl_private *ctrl,
>                                 &assr, 1);
>         }
>
> -       ret =3D msm_dp_ctrl_link_train_1(ctrl, training_step);
> +       for (i =3D ctrl->link->lttpr_count - 1; i >=3D 0; i--) {
> +               enum drm_dp_phy dp_phy =3D DP_PHY_LTTPR(i);
> +
> +               ret =3D msm_dp_ctrl_link_train_1_2(ctrl, training_step, d=
p_phy);
> +               msm_dp_ctrl_clear_training_pattern(ctrl, dp_phy);
> +
> +               if (ret)
> +                       break;
> +       }
> +
>         if (ret) {
> -               DRM_ERROR("link training #1 failed. ret=3D%d\n", ret);
> +               DRM_ERROR("link training of LTTPR(s) failed. ret=3D%d\n",=
 ret);
>                 goto end;
>         }
>
> -       /* print success info as this is a result of user initiated actio=
n */
> -       drm_dbg_dp(ctrl->drm_dev, "link training #1 successful\n");
> -
> -       ret =3D msm_dp_ctrl_link_train_2(ctrl, training_step);
> +       ret =3D msm_dp_ctrl_link_train_1_2(ctrl, training_step, DP_PHY_DP=
RX);
>         if (ret) {
> -               DRM_ERROR("link training #2 failed. ret=3D%d\n", ret);
> +               DRM_ERROR("link training on sink failed. ret=3D%d\n", ret=
);
>                 goto end;
>         }
>
> -       /* print success info as this is a result of user initiated actio=
n */
> -       drm_dbg_dp(ctrl->drm_dev, "link training #2 successful\n");
> -
>  end:
>         msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
>
> @@ -1622,7 +1674,7 @@ static int msm_dp_ctrl_link_maintenance(struct msm_=
dp_ctrl_private *ctrl)
>         if (ret)
>                 goto end;
>
> -       msm_dp_ctrl_clear_training_pattern(ctrl);
> +       msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
>
>         msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_=
VIDEO);
>
> @@ -1646,7 +1698,7 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struc=
t msm_dp_ctrl_private *ctrl)
>                 return false;
>         }
>         msm_dp_catalog_ctrl_send_phy_pattern(ctrl->catalog, pattern_reque=
sted);
> -       msm_dp_ctrl_update_vx_px(ctrl);
> +       msm_dp_ctrl_update_phy_vx_px(ctrl, DP_PHY_DPRX);
>         msm_dp_link_send_test_response(ctrl->link);
>
>         pattern_sent =3D msm_dp_catalog_ctrl_read_phy_pattern(ctrl->catal=
og);
> @@ -1888,7 +1940,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_=
ctrl)
>                         }
>
>                         /* stop link training before start re training  *=
/
> -                       msm_dp_ctrl_clear_training_pattern(ctrl);
> +                       msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_D=
PRX);
>                 }
>
>                 rc =3D msm_dp_ctrl_reinitialize_mainlink(ctrl);
> @@ -1912,7 +1964,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_=
ctrl)
>                  * link training failed
>                  * end txing train pattern here
>                  */
> -               msm_dp_ctrl_clear_training_pattern(ctrl);
> +               msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
>
>                 msm_dp_ctrl_deinitialize_mainlink(ctrl);
>                 rc =3D -ECONNRESET;
> @@ -1983,7 +2035,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_d=
p_ctrl, bool force_link_train
>                 msm_dp_ctrl_link_retrain(ctrl);
>
>         /* stop txing train pattern to end link training */
> -       msm_dp_ctrl_clear_training_pattern(ctrl);
> +       msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
>
>         /*
>          * Set up transfer unit values and set controller state to send
> --
> 2.45.2
>
