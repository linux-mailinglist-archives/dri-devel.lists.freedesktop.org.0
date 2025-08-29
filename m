Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 207A6B3BF6F
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 17:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE2F710EC02;
	Fri, 29 Aug 2025 15:36:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="B5GSaPDf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD4D10EC02
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 15:36:11 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-7fac8fdea9fso161597085a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 08:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1756481771; x=1757086571;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4SSy/4QqSxPf2Td+xOiBHnRIJU25HPzBFl3gyWpJBL4=;
 b=B5GSaPDfOEGwZu6eUdUFbiAFxtjhAecyjhYp6DHMwERU7sG0WPBCdxkXN0AX08x08f
 FvFfwuI+1WxmWzbRecF8zM4kZi2vnADhO1AHLOBeK9a0TeYVkZ2lSZ0YM58T+lBsc6W4
 gQun7RNHE54Np7EiohjCa/bSkP05DpfXIDmDKOJK6sLkiqA8xxkkLGBb2ae4JbXcCACI
 CXUWZeoGxgO5GTUP6uprL5AB8yfvoOwqOn1AJ0mh8DSMYAUetuqijE2gjSnTR+ONg1se
 2OoRLpJg6kKceIJWwLe4Cu1r7lXX1Byin5cZtI9r7w3PVtai/MBpxpDxrpRMfvhVE5Q2
 xPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756481771; x=1757086571;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4SSy/4QqSxPf2Td+xOiBHnRIJU25HPzBFl3gyWpJBL4=;
 b=YA5SdtMWVSbyY9MI24/xTy0DyMPI0ySRhWA2fwVYYaIVN59fhOSi1K0uU/Z9ugf3br
 9xofeDznjv/rOvwUmfeCVDVFW8ey6Kyvrhlvkn8N1L38rrclBusr+RHe+ieEKcmphLLl
 beEWpkkHclA1gMNQL7C4Ii7PPHMRQYBm6nQ9reJqqDqlJ/RZQB6WLB6O7lhIgDN/pOHw
 645ybNR8xJLYwylzo0CxBfB8G/zDZdWfH08LF+gmCv1AOeSuJsMnuZm02TsdXZwPALob
 BtqRTSav2g31yd/APa/RlnmJukejxA0tRd3DTfTHSIt737Sy30iWXLqSCZ/dn2JSVA75
 wAlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPCNcHWxsCnHJQOE8i9fxpPjhwxtfs/GI5x1ogHmVbSDrEHe47nyP3qozXnWXdcGeXKnTfI9x8he4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPyy8RS4FJTSSjLWEdK9P8m2VaNouRa8fuwgzp9c/zbjZ4Ymri
 i/8a//RM9QqY/c3vrT9BY5Ns8DzUiGiFtmYn782SaTgRGSDQzFxPqBA6hAE9QRJx/B1RTrRP6JM
 nF3BeJZnAFB9jO7fIWqJ0dAkiIERVlC5lVMZ5fJAzjQ==
X-Gm-Gg: ASbGncvaf4ygC4DBQCr0VbM1H5WLsPUrm/ScNDyc3QF0zqQAEum/hUOE2rYIDnmImn2
 Z439dCwQZ9RsBB+A4LsG6oTRUKhRLfuUwK1pq5fciFciZO/zr416gU9lYytCX/ulB0AiUVTQmaJ
 ItlxzbtRmbqmcQStjcxRnzWuJQ1x2CciEUriBRsZtx5D0K4M+t8gsEK+pCLYjLXisIesYw7z63a
 672x+Zex/rjjnkE
X-Google-Smtp-Source: AGHT+IEWqZtwwwHsrf82ewOz9RLbEwp65hDGKMxJaKKPW/S3xt8Z0JtCwy0RHATkKGBiN8Hrm886i7G3V+7iyRzmihw=
X-Received: by 2002:a05:620a:1aa9:b0:7fd:6709:f08d with SMTP id
 af79cd13be357-7fd6709f66emr191563385a.81.1756481770696; Fri, 29 Aug 2025
 08:36:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250825-rk3588-10bpc-v2-0-955622d16985@collabora.com>
 <20250825-rk3588-10bpc-v2-1-955622d16985@collabora.com>
In-Reply-To: <20250825-rk3588-10bpc-v2-1-955622d16985@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 29 Aug 2025 17:35:59 +0200
X-Gm-Features: Ac12FXwrZsUUOJf6R_CcGG1_6Xwe2zsAflxp6I-kKbisXKVACpCbORbGe0q1z1k
Message-ID: <CAPj87rNX0vdQquZB7HQDG1rvCCyk=+2wa=isLqgL3_Sx6Y1J=Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] drm/rockchip: vop2: Check bpc before switching
 DCLK source
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
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

Hi Cristian,

On Mon, 25 Aug 2025 at 12:08, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> When making use of the HDMI PHY PLL as a VOP2 DCLK source, it's output
> rate does normally match the mode clock.  But this is only applicable
> for default color depth of 8 bpc.  For higher depths, the output clock
> is further divided by the hardware according to the formula:
>
>   output rate = PHY PLL rate * 8 / bpc

Observing that this results in phy_pll_rate * 8 / 8 == phy_pll_rate
for 8bpc, the formula does actually hold true everywhere.

> @@ -1737,36 +1737,48 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
>          * Switch to HDMI PHY PLL as DCLK source for display modes up
>          * to 4K@60Hz, if available, otherwise keep using the system CRU.
>          */
> -       if ((vop2->pll_hdmiphy0 || vop2->pll_hdmiphy1) && clock <= VOP2_MAX_DCLK_RATE) {
> -               drm_for_each_encoder_mask(encoder, crtc->dev, crtc_state->encoder_mask) {
> -                       struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
> +       if (vop2->pll_hdmiphy0 || vop2->pll_hdmiphy1) {
> +               unsigned long max_dclk;
>
> -                       if (rkencoder->crtc_endpoint_id == ROCKCHIP_VOP2_EP_HDMI0) {
> -                               if (!vop2->pll_hdmiphy0)
> -                                       break;
> +               if (vcstate->output_bpc > 8)
> +                       max_dclk = DIV_ROUND_CLOSEST_ULL(VOP2_MAX_DCLK_RATE * 8,
> +                                                        vcstate->output_bpc);
> +               else
> +                       max_dclk = VOP2_MAX_DCLK_RATE;

... so this could just be do the mul+div unconditionally.

> +               if (clock <= max_dclk) {
> +                       drm_for_each_encoder_mask(encoder, crtc->dev, crtc_state->encoder_mask) {
> +                               struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
>
> -                               ret = clk_set_parent(vp->dclk, vop2->pll_hdmiphy0);
> -                               if (ret < 0)
> -                                       drm_warn(vop2->drm,
> -                                                "Could not switch to HDMI0 PHY PLL: %d\n", ret);
> -                               break;
> -                       }
> +                               if (rkencoder->crtc_endpoint_id == ROCKCHIP_VOP2_EP_HDMI0) {
> +                                       if (!vop2->pll_hdmiphy0)
> +                                               break;
> +
> +                                       if (!vp->dclk_src)
> +                                               vp->dclk_src = clk_get_parent(vp->dclk);
>
> -                       if (rkencoder->crtc_endpoint_id == ROCKCHIP_VOP2_EP_HDMI1) {
> -                               if (!vop2->pll_hdmiphy1)
> +                                       ret = clk_set_parent(vp->dclk, vop2->pll_hdmiphy0);
> +                                       if (ret < 0)
> +                                               drm_warn(vop2->drm,
> +                                                        "Could not switch to HDMI0 PHY PLL: %d\n",
> +                                                        ret);
>                                         break;
> +                               }
>
> -                               if (!vp->dclk_src)
> -                                       vp->dclk_src = clk_get_parent(vp->dclk);
> +                               if (rkencoder->crtc_endpoint_id == ROCKCHIP_VOP2_EP_HDMI1) {
> +                                       if (!vop2->pll_hdmiphy1)
> +                                               break;
>
> -                               ret = clk_set_parent(vp->dclk, vop2->pll_hdmiphy1);
> -                               if (ret < 0)
> -                                       drm_warn(vop2->drm,
> -                                                "Could not switch to HDMI1 PHY PLL: %d\n", ret);
> -                               break;
> +                                       if (!vp->dclk_src)
> +                                               vp->dclk_src = clk_get_parent(vp->dclk);
> +
> +                                       ret = clk_set_parent(vp->dclk, vop2->pll_hdmiphy1);
> +                                       if (ret < 0)
> +                                               drm_warn(vop2->drm,
> +                                                        "Could not switch to HDMI1 PHY PLL: %d\n",
> +                                                        ret);
> +                                       break;
> +                               }

To be honest, this whole thing is a bit weird, and seems like it could
also be struct clk *new_dclk_parent = (rkencoder->crtc_endpoint_id ==
ROCKCHIP_VOP2_EP_HDMI0) ? vop2->pll_hdmiphy0 : vop2->pll_hdmiphy1? But
it's not your code, I know, and the rest of the clock handling is
pretty messy, so I think this is fine as is.

Reviewed-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel
