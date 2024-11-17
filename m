Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AE89D06FB
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 00:22:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA9410E46E;
	Sun, 17 Nov 2024 23:22:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EjLJOa5z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E62510E465
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2024 23:22:36 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-e38232fc4d8so943247276.2
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2024 15:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731885755; x=1732490555; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=421dnoBG8EVTU7khRTWnYcAennve4M8YbD8yLemljJw=;
 b=EjLJOa5zVz//3qC+q8u/npQZGxAJ7CDAKA5/jrSg60jnKf6nxiClZ6dG0pMo6reSWs
 a0S2eHxhNsZV1unAJuJkohYVAvAI0O5IpbCGXsl0NykNYGTNDMBtNwThUHhltZzfXQLr
 nN4Dr4VfVcoZRoTQZbC+jJEt5YutGI/+YpZ/dfP0bloZD4Jg//hO4oKAcS5f7pUSDZFV
 0Z4HgGXF9M92NWDfeIoT2O2KOjjHLme+nE74NC9w/IUo+Z8qMcvUJwLlwhomrxhtZ2Cx
 a+7hGuVaTwgz8JNcG+EZradwasQnDja/X57HVl3ii7j5/4K/FfPue+B6gLssGyW7l5kF
 8dfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731885755; x=1732490555;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=421dnoBG8EVTU7khRTWnYcAennve4M8YbD8yLemljJw=;
 b=ZmEWjs4J2gP+MEAsMXmaeY36p1kElm/bjbygzBbQ7TcJM1tQOr7j3TVK8t90ReyXPm
 RRMw2rZSLVN50azj69Lmvz+0PENjPRwv6KUlkhtUNKoo6vvJUb7HKFMOO3Rp68sWBWb+
 agiGml+INk377hVUh2dlSkz4gzb6JpIr3naK79wl/q0tbhYq3Vn7gSIYwhv1s2GiTkze
 PwTEjhpY9fJqyFiTVbQlFH8lnWfdtne8EUiMjoTgnXEZ3NJwoSvL+v9MKKrDbTv5FzDt
 CWuaDtNisWWrEHvNg4/NFvRIjc62RkzsuUKK6at0YMoU0zkE23STzWKWhhRDAqL59gkX
 rhNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbNqH89J060lhc09myETdWEJpnnnxcJvr2GAUC5XNEI0MXDZ1C/8DbFBYkiNyuAYXWxGx3l7jVYh0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFWB/I4eTeS0oI4j+NwzZ0xQmXsku12ifY54TnK6HTyMVRfk3X
 Pqd+2Yd7XgtQHi4p4ka0dYgyqD1OWjhM6Hb6Rv6tSraimnHwC4jjGaCjYcwT207ZEsRHuget7pf
 iD5cKnfefYbGFBYEEemzU8+d7FjD5CAgBMfMmfw==
X-Google-Smtp-Source: AGHT+IEKu4HQ4qxL7ggceao+8OGc691sv4/g0I2nwk1Rm7VUkJQLOOIbagikzI5b/uN25//8jFEf3+o5fWyZPy0dMUc=
X-Received: by 2002:a05:6902:12ca:b0:e33:2533:2d52 with SMTP id
 3f1490d57ef6-e38263dc27bmr8339143276.44.1731885754875; Sun, 17 Nov 2024
 15:22:34 -0800 (PST)
MIME-Version: 1.0
References: <20241115-drm-connector-mode-valid-const-v1-0-b1b523156f71@linaro.org>
 <20241115-drm-connector-mode-valid-const-v1-1-b1b523156f71@linaro.org>
 <20241117205426.GE12409@pendragon.ideasonboard.com>
In-Reply-To: <20241117205426.GE12409@pendragon.ideasonboard.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 18 Nov 2024 01:22:12 +0200
Message-ID: <CAA8EJpr=4AQVRKbtR2MaCQfguGW0a=3ay-ttew-mFR4f086Uyg@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/encoder_slave: make mode_valid accept const
 struct drm_display_mode
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>, 
 Ian Ray <ian.ray@ge.com>, Martyn Welch <martyn.welch@collabora.co.uk>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dave Airlie <airlied@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-tegra@vger.kernel.org
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

On Sun, 17 Nov 2024 at 22:54, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Dmitry,
>
> Thank you for the patch.
>
> On Fri, Nov 15, 2024 at 11:09:26PM +0200, Dmitry Baryshkov wrote:
> > The mode_valid() callbacks of drm_encoder, drm_crtc and drm_bridge
> > accept const struct drm_display_mode argument. Change the mode_valid
> > callback of drm_encoder_slave to also accept const argument.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> On a side note, there's only two I2C slave encoder drivers left... I
> wonder if we could so something about them. The ch7006 and sil164
> drivers seem to be used by nouveau only, could they be moved to
> drivers/gpu/drm/nouveau/ ? We would move the whole drm_encoder_slave
> implementation there too, and leave it to die (or get taken out of limbo
> and fixed) with dispnv04.

Or it might be better to switch to drm_bridge. Currently we also have
sil164 (sub)drivers in ast and i915 drivers. I don't know if there is
any common code to share or not. If there is some, it might be nice to
use common framework.

>
> > ---
> >  drivers/gpu/drm/i2c/ch7006_drv.c          | 2 +-
> >  drivers/gpu/drm/i2c/sil164_drv.c          | 2 +-
> >  drivers/gpu/drm/nouveau/dispnv04/tvnv17.c | 2 +-
> >  include/drm/drm_encoder_slave.h           | 2 +-
> >  4 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i2c/ch7006_drv.c b/drivers/gpu/drm/i2c/ch7006_drv.c
> > index 131512a5f3bd996ad1e2eb869ffa09837daba0c7..a57f0a41c1a9e2006142fe0bad2914b0c344c82a 100644
> > --- a/drivers/gpu/drm/i2c/ch7006_drv.c
> > +++ b/drivers/gpu/drm/i2c/ch7006_drv.c
> > @@ -104,7 +104,7 @@ static bool ch7006_encoder_mode_fixup(struct drm_encoder *encoder,
> >  }
> >
> >  static int ch7006_encoder_mode_valid(struct drm_encoder *encoder,
> > -                                  struct drm_display_mode *mode)
> > +                                  const struct drm_display_mode *mode)
> >  {
> >       if (ch7006_lookup_mode(encoder, mode))
> >               return MODE_OK;
> > diff --git a/drivers/gpu/drm/i2c/sil164_drv.c b/drivers/gpu/drm/i2c/sil164_drv.c
> > index ff23422727fce290a188e495d343e32bc2c373ec..708e119072fcb50c31b5596b75dc341429b93697 100644
> > --- a/drivers/gpu/drm/i2c/sil164_drv.c
> > +++ b/drivers/gpu/drm/i2c/sil164_drv.c
> > @@ -255,7 +255,7 @@ sil164_encoder_restore(struct drm_encoder *encoder)
> >
> >  static int
> >  sil164_encoder_mode_valid(struct drm_encoder *encoder,
> > -                       struct drm_display_mode *mode)
> > +                       const struct drm_display_mode *mode)
> >  {
> >       struct sil164_priv *priv = to_sil164_priv(encoder);
> >
> > diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> > index 3ecb101d23e949b753b873d24eec01ad6fe7f5d6..35ad4e10d27323c87704a3ff35b7dc26462c82bd 100644
> > --- a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> > +++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> > @@ -308,7 +308,7 @@ static int nv17_tv_get_modes(struct drm_encoder *encoder,
> >  }
> >
> >  static int nv17_tv_mode_valid(struct drm_encoder *encoder,
> > -                           struct drm_display_mode *mode)
> > +                           const struct drm_display_mode *mode)
> >  {
> >       struct nv17_tv_norm_params *tv_norm = get_tv_norm(encoder);
> >
> > diff --git a/include/drm/drm_encoder_slave.h b/include/drm/drm_encoder_slave.h
> > index 49172166a164474f43e4afb2eeeb3cde8ae7c61a..b526643833dcf78bae29f9fbbe27de3f730b55d8 100644
> > --- a/include/drm/drm_encoder_slave.h
> > +++ b/include/drm/drm_encoder_slave.h
> > @@ -85,7 +85,7 @@ struct drm_encoder_slave_funcs {
> >        * @mode_valid: Analogous to &drm_encoder_helper_funcs @mode_valid.
> >        */
> >       int (*mode_valid)(struct drm_encoder *encoder,
> > -                       struct drm_display_mode *mode);
> > +                       const struct drm_display_mode *mode);
> >       /**
> >        * @mode_set: Analogous to &drm_encoder_helper_funcs @mode_set
> >        * callback. Wrapped by drm_i2c_encoder_mode_set().
> >
>
> --
> Regards,
>
> Laurent Pinchart



-- 
With best wishes
Dmitry
