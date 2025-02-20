Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D13B1A3DEF4
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 16:42:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B27110E4C3;
	Thu, 20 Feb 2025 15:42:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Wd7MR72J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3701810E161
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 15:42:40 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-e5372a2fbddso929326276.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 07:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740066159; x=1740670959; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5FyY/uqpI1+/qb2X9DvR/LN4Auweuub6T5/j2p07sJM=;
 b=Wd7MR72Jk/yxbgxYKVsR4GW7BpPBqCHCqO9/M2a85dJ4Xk933k9L9TJaqPVPAsUsho
 6EK8OnvbgiZ7jhUQgPsglhGukgfKgQbZauxLYH465vYO4NvC9ahUKJdOSGJH/1/snne7
 V6v2BI4mVZSxRA0IZ4Doq/Fuwi1wxjAhaDwyFN8omhDmVLA5fK/bdiBCv6w6yrPEAUm5
 63na1L/cXLDNTsL+eg9jDL4PqEJVbrGaAUlZkzjB2IbGlyWdLDrm5di97T6fmVVmbQy3
 80m7GWIPUbIX/yTwv+ry8hkKGwYaI148yCU0HAoSXH6tFqvFudv67TxaceOBDuydCZtA
 O+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740066159; x=1740670959;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5FyY/uqpI1+/qb2X9DvR/LN4Auweuub6T5/j2p07sJM=;
 b=tFKZl9NXm4xUZhlHS/btX9n9nG0HsF0y/xAK9tro+mi4xcmpJEizt5oiXwS/+wT3wJ
 fO1JDYvXdVSybocjxEojQYQBLPLy1t9Tlg2WZKDtrZAGcPuGsNOSxi4ufvFzmFvCMvKW
 ZCahGSKgdV8psRX8QnJl9aOdqvCruEcB8FTkVdvLVI/KjhKzexdA7H7lpZa2vV46yEVD
 c/WjE+zRpWe5/mJxDc92cnOROifKW/xAH6xzsfGS50ACqSdThd9FWTw8GW7Uq3BTR/W/
 lvflVjg+kRgW36rouLqIa+KlxZQehEfMCszWK4K6Ju34k6gIbw164JHOdt76TxbnOsrI
 wgkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPMuW6oylvBk68l972UzSew41RZwuNErl6CZ08cZAjNxf9da4haSL09nEf/dZYOfjTKas/gK6ZJbM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygW2yqGT+IinKewH8E0/oO/rfyyjoxRBUPuWfyz2EMy1/qOwEK
 aXiGucGAmsp/4YbP1Sz5QCO3bfAJXQdgB7ynh4jXQE6Nq6hBnuJqG8K7IoREiStP9Iw1Su91TBc
 6WgBjparJ6KbMjAgQzu1qe5vpt7REk6MlcfclSQ==
X-Gm-Gg: ASbGncskIuS4uk+h/XzUjIzf9JIWvtY2MzroxTmic9awPBQKxJm9VFWA5Itg4J4l7X4
 pZLVqmZ2Lz8IDWXSAyZ0OJg5VhBk/ufdCq4KVb+bNHZEzGXo5wbIC4NlKx3H9CXm51SiPUvAUMt
 +O
X-Google-Smtp-Source: AGHT+IEz/BdkBxzruDv1BnRXbsP+TA9e8Vw4LtNbmAaEcBP0MwtZCiysLe/spHraIOiIlseufiQMsXOwHbIUKyc7fcQ=
X-Received: by 2002:a05:690c:498c:b0:6ee:8363:96d3 with SMTP id
 00721157ae682-6fb5831dcddmr207514557b3.27.1740066158995; Thu, 20 Feb 2025
 07:42:38 -0800 (PST)
MIME-Version: 1.0
References: <20250220-dual-dsi-v2-0-6c0038d5a2ef@linaro.org>
 <20250220-dual-dsi-v2-5-6c0038d5a2ef@linaro.org>
 <iibq3orsb7uf44luz2he2auox43ki42m2z4nnderyqlhypvfgo@pwqpvua6vuyo>
In-Reply-To: <iibq3orsb7uf44luz2he2auox43ki42m2z4nnderyqlhypvfgo@pwqpvua6vuyo>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 20 Feb 2025 23:42:28 +0800
X-Gm-Features: AWEUYZkhT707fwgCYjUo1mZOa8BNPphgYLuTOs0pu7OSbwGyUxHGJN7uYb0yFbQ
Message-ID: <CABymUCNajuc8WnWgf2JehFYUY-MqxCYmD=By8nY-JppxYHsyNw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] drm/msm/dsi: Support DSC for dual panel case
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2025=E5=B9=B42=E6=
=9C=8820=E6=97=A5=E5=91=A8=E5=9B=9B 18:39=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Feb 20, 2025 at 06:07:56PM +0800, Jun Nie wrote:
> > There is dual DSI case that every DSI link is connected to an independe=
nt
> > panel. In this dual panel case, the frame width for DSC on each link sh=
ould
> > be halved to support the usage case.
>
> Isn't it the case for the DSI panel utilizing two DSI links?

The added case here is 2 DSI panel utilizing two DSI links, 1 DSI link
in each panel.
I assume default case is 1 panel with 2 DSI link, such as Marijn's case.
>
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi.h         |  3 ++-
> >  drivers/gpu/drm/msm/dsi/dsi_host.c    | 13 +++++++++----
> >  drivers/gpu/drm/msm/dsi/dsi_manager.c | 10 ++++++++--
> >  3 files changed, 19 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/ds=
i.h
> > index 35b90c462f637111159b204269ce908614a21586..5a8978bed9f4ca897b418ce=
d60194042d9dd8d05 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi.h
> > +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> > @@ -74,7 +74,8 @@ void msm_dsi_host_enable_irq(struct mipi_dsi_host *ho=
st);
> >  void msm_dsi_host_disable_irq(struct mipi_dsi_host *host);
> >  int msm_dsi_host_power_on(struct mipi_dsi_host *host,
> >                       struct msm_dsi_phy_shared_timings *phy_shared_tim=
ings,
> > -                     bool is_bonded_dsi, struct msm_dsi_phy *phy);
> > +                     bool is_bonded_dsi, bool is_dual_panel,
> > +                     struct msm_dsi_phy *phy);
> >  int msm_dsi_host_power_off(struct mipi_dsi_host *host);
> >  int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
> >                                 const struct drm_display_mode *mode);
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/d=
si/dsi_host.c
> > index 976c5d82a2efa0fc51657b8534675890be7c33a6..752a97f7181c30dade0a774=
5492bf16649b3197b 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > @@ -902,7 +902,8 @@ static void dsi_update_dsc_timing(struct msm_dsi_ho=
st *msm_host, bool is_cmd_mod
> >       }
> >  }
> >
> > -static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bo=
nded_dsi)
> > +static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bo=
nded_dsi,
> > +                          bool is_dual_panel)
> >  {
> >       struct drm_display_mode *mode =3D msm_host->mode;
> >       u32 hs_start =3D 0, vs_start =3D 0; /* take sync start as 0 */
> > @@ -947,7 +948,10 @@ static void dsi_timing_setup(struct msm_dsi_host *=
msm_host, bool is_bonded_dsi)
> >                       return;
> >               }
> >
> > -             dsc->pic_width =3D mode->hdisplay;
> > +             if (is_dual_panel)
> > +                     dsc->pic_width =3D hdisplay;
> > +             else
> > +                     dsc->pic_width =3D mode->hdisplay;
> >               dsc->pic_height =3D mode->vdisplay;
> >               DBG("Mode %dx%d\n", dsc->pic_width, dsc->pic_height);
> >
> > @@ -2369,7 +2373,8 @@ static void msm_dsi_sfpb_config(struct msm_dsi_ho=
st *msm_host, bool enable)
> >
> >  int msm_dsi_host_power_on(struct mipi_dsi_host *host,
> >                       struct msm_dsi_phy_shared_timings *phy_shared_tim=
ings,
> > -                     bool is_bonded_dsi, struct msm_dsi_phy *phy)
> > +                     bool is_bonded_dsi, bool is_dual_panel,
> > +                     struct msm_dsi_phy *phy)
> >  {
> >       struct msm_dsi_host *msm_host =3D to_msm_dsi_host(host);
> >       const struct msm_dsi_cfg_handler *cfg_hnd =3D msm_host->cfg_hnd;
> > @@ -2412,7 +2417,7 @@ int msm_dsi_host_power_on(struct mipi_dsi_host *h=
ost,
> >               goto fail_disable_clk;
> >       }
> >
> > -     dsi_timing_setup(msm_host, is_bonded_dsi);
> > +     dsi_timing_setup(msm_host, is_bonded_dsi, is_dual_panel);
> >       dsi_sw_reset(msm_host);
> >       dsi_ctrl_enable(msm_host, phy_shared_timings, phy);
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/ms=
m/dsi/dsi_manager.c
> > index be13bf682a9601484c9c14e8419563f37c2281ee..158b6cc907cb39cc3b182d3=
088b793d322a3527c 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > @@ -24,6 +24,7 @@ struct msm_dsi_manager {
> >       struct msm_dsi *dsi[DSI_MAX];
> >
> >       bool is_bonded_dsi;
> > +     bool is_dual_panel;
> >       bool is_sync_needed;
> >       int master_dsi_link_id;
> >  };
> > @@ -31,6 +32,7 @@ struct msm_dsi_manager {
> >  static struct msm_dsi_manager msm_dsim_glb;
> >
> >  #define IS_BONDED_DSI()              (msm_dsim_glb.is_bonded_dsi)
> > +#define IS_DUAL_PANEL()              (msm_dsim_glb.is_dual_panel)
> >  #define IS_SYNC_NEEDED()     (msm_dsim_glb.is_sync_needed)
> >  #define IS_MASTER_DSI_LINK(id)       (msm_dsim_glb.master_dsi_link_id =
=3D=3D id)
> >
> > @@ -55,6 +57,7 @@ static int dsi_mgr_parse_of(struct device_node *np, i=
nt id)
> >               msm_dsim->is_bonded_dsi =3D of_property_read_bool(np, "qc=
om,dual-dsi-mode");
> >
> >       if (msm_dsim->is_bonded_dsi) {
> > +             msm_dsim->is_dual_panel =3D of_property_read_bool(np, "qc=
om,dual-panel");
> >               if (of_property_read_bool(np, "qcom,master-dsi"))
> >                       msm_dsim->master_dsi_link_id =3D id;
> >               if (!msm_dsim->is_sync_needed)
> > @@ -214,6 +217,7 @@ static int dsi_mgr_bridge_power_on(struct drm_bridg=
e *bridge)
> >       struct mipi_dsi_host *host =3D msm_dsi->host;
> >       struct msm_dsi_phy_shared_timings phy_shared_timings[DSI_MAX];
> >       bool is_bonded_dsi =3D IS_BONDED_DSI();
> > +     bool is_dual_panel =3D IS_DUAL_PANEL();
> >       int ret;
> >
> >       DBG("id=3D%d", id);
> > @@ -222,7 +226,8 @@ static int dsi_mgr_bridge_power_on(struct drm_bridg=
e *bridge)
> >       if (ret)
> >               goto phy_en_fail;
> >
> > -     ret =3D msm_dsi_host_power_on(host, &phy_shared_timings[id], is_b=
onded_dsi, msm_dsi->phy);
> > +     ret =3D msm_dsi_host_power_on(host, &phy_shared_timings[id],
> > +                                 is_bonded_dsi, is_dual_panel, msm_dsi=
->phy);
> >       if (ret) {
> >               pr_err("%s: power on host %d failed, %d\n", __func__, id,=
 ret);
> >               goto host_on_fail;
> > @@ -230,7 +235,8 @@ static int dsi_mgr_bridge_power_on(struct drm_bridg=
e *bridge)
> >
> >       if (is_bonded_dsi && msm_dsi1) {
> >               ret =3D msm_dsi_host_power_on(msm_dsi1->host,
> > -                             &phy_shared_timings[DSI_1], is_bonded_dsi=
, msm_dsi1->phy);
> > +                             &phy_shared_timings[DSI_1], is_bonded_dsi=
,
> > +                             is_dual_panel, msm_dsi1->phy);
> >               if (ret) {
> >                       pr_err("%s: power on host1 failed, %d\n",
> >                                                       __func__, ret);
> >
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry
