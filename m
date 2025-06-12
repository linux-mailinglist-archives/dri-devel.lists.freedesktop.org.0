Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFDCAD749D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 16:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F09FE10E065;
	Thu, 12 Jun 2025 14:51:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="lQFGu7Fv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B879E10E881
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 14:51:35 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-312e747d2d8so1899834a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 07:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1749739893; x=1750344693;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZF8QzGPobTCQxU3cK3KGjHnmiAyxl3Hnpr6d0zTgBdg=;
 b=lQFGu7FvbI4xLrR4zQZPN2AOX0untzP2su8YBuwVAcxm6xy03AscR9J9wpzzMx0xr9
 P2ZAn3vuFqVqm4l7x2Bo4qDved64hkSLit2EmBjIb8M4cw41L3w+BoIKMEuEY9tA06Tx
 H57STF1R8ZN4etwrEQEJTNpmBiL53bZPuxam8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749739893; x=1750344693;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZF8QzGPobTCQxU3cK3KGjHnmiAyxl3Hnpr6d0zTgBdg=;
 b=p7rPYM+x0cCXzpqQemx4cKe/nLyWmOHPmDZ4+0JqI8JY9BeblB2+VVmr9R71ebbbcd
 +HsqMmQ5a4Gb5p7WMC44AEF0V0qo3uY2h0hZKCHpGOBh+SWhZwpQKpWExgasVZz31032
 jAaoY22K00W4hFhhWc8+2MKlNjArjd7eNrW55941XYcL0XqPruMcxtW5y+wAx9hrh16k
 LSS8Tjoy6Tbb8a1rcNfxoYk2jyJ8tJbeQbg8pCEViZ9BHFkAV2El0vyRo0hhhVNHms4o
 d8/I3HvWCP0QT5sPnEpt8AOmcMaHQvXrag9B1w+HHqE2zcflktXvjRoZC6FVJo1h+ZDN
 Hhgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWV4XFHfPAxAIpwe2e8EwFqp8VWHF9ewGN9e4lqQ9LAFTx7L8bP2NzxDNs2y+SAJmvS+b6QV/9nJmE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywe6gJLlOleFBXRHLWU/mhR9dK+wMX+fOh7DvJadwt5qPmJMrsq
 +H5nTHE4FbaAA3O/6+CfYADx2zTcGCDrcilIMAfnvt1ClaXDgb1Wpwx93I12NjPi9HGxCxYzhXS
 Rk8Y=
X-Gm-Gg: ASbGncuLjbmj1vlNkTp8l07eXYjaxaIKVSGl7TQwK4B9KiPWobuqyrMGtih0qnrRdVc
 uNrvLGcbXvSy6ZHmT2V6/WI0vU1FDzZcEhBEzL9QNGF8Lv0IuO4g/Dunn+iF7W3c4y2meAYJSgM
 ZgoYLTOWAeqbrSsnNg+H/M4DgBXvou+IiHUSHAuxDMb4zR5vHyCEsXzfEHWgPXEpAFF4jARpg9H
 2ILCMsSrl7XNXKZQVJ9btfAOyQlM2XY0KOczSV2nI+nFCcMrxEU5ooSvPyIFWIAtyTG2FyGNI7M
 E9a3e9roS0M2bnvADSa/1YdNKODZcNuUObAW/qK3QSnJY2NhVOC887uYUbQCRVCSVJ3DRaHyAcH
 +6NCs+sDjQ6uVOoqOIAoClVWDZXtd9YxDPOREcZa7
X-Google-Smtp-Source: AGHT+IFh6W8cqTOnD4ALrQcFuFizoyE51wZEtfTpbOI/VIP9thlolEMI8Cdh4d5/IQeHQ1n0M00jxQ==
X-Received: by 2002:a17:90b:5866:b0:311:b5ac:6f7d with SMTP id
 98e67ed59e1d1-313bfd90b31mr5726135a91.6.1749739893334; 
 Thu, 12 Jun 2025 07:51:33 -0700 (PDT)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com.
 [209.85.215.179]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-313c1bd9aecsm1543051a91.15.2025.06.12.07.51.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 07:51:32 -0700 (PDT)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-b2fd091f826so820815a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 07:51:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUneS6bmqP+oYEerytMiNx6A/FZ1N5MJfvyOWQPN8Pvc6xYIGHhguv0hv/hUI/ErKo7RaDxbgNAXSA=@lists.freedesktop.org
X-Received: by 2002:a17:90b:3b90:b0:311:9cdf:a8a4 with SMTP id
 98e67ed59e1d1-313bfd90bb1mr4862616a91.8.1749739891134; Thu, 12 Jun 2025
 07:51:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250611052947.5776-1-j-choudhary@ti.com>
 <CAD=FV=WvH73d78De3PrbiG7b6OaS_BysGtxQ=mJTj4z-h0LYWA@mail.gmail.com>
 <547a35f4-abc0-4808-9994-ccc70eb3c201@ti.com>
In-Reply-To: <547a35f4-abc0-4808-9994-ccc70eb3c201@ti.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Jun 2025 07:51:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XzSOqnLQCjDiJX7wrGH0UGq839a84v3QT9cj3eK+AeRA@mail.gmail.com>
X-Gm-Features: AX0GCFvUog-W0Yq8ScavOChYN1RdpooYMU-w84jaSxr5YZftWGA6ukEIfk_PLzY
Message-ID: <CAD=FV=XzSOqnLQCjDiJX7wrGH0UGq839a84v3QT9cj3eK+AeRA@mail.gmail.com>
Subject: Re: [PATCH v4] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
 connector type
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org, 
 tomi.valkeinen@ideasonboard.com, max.krummenacher@toradex.com, 
 ernestvanhoecke@gmail.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, kieran.bingham+renesas@ideasonboard.com, 
 linux-kernel@vger.kernel.org, max.oss.09@gmail.com, devarsht@ti.com, 
 geert@linux-m68k.org
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

Hi,

On Wed, Jun 11, 2025 at 9:39=E2=80=AFPM Jayesh Choudhary <j-choudhary@ti.co=
m> wrote:
>
> Hello Doug,
>
> On 12/06/25 03:08, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Jun 10, 2025 at 10:29=E2=80=AFPM Jayesh Choudhary <j-choudhary@=
ti.com> wrote:
> >>
> >> @@ -1195,9 +1203,17 @@ static enum drm_connector_status ti_sn_bridge_d=
etect(struct drm_bridge *bridge)
> >>          struct ti_sn65dsi86 *pdata =3D bridge_to_ti_sn65dsi86(bridge)=
;
> >>          int val =3D 0;
> >>
> >> -       pm_runtime_get_sync(pdata->dev);
> >> +       /*
> >> +        * The chip won't report HPD right after being powered on as
> >> +        * HPD_DEBOUNCED_STATE reflects correct state only after the
> >> +        * debounce time (~100-400 ms).
> >> +        * So having pm_runtime_get_sync() and immediately reading
> >> +        * the register in detect() won't work, and adding delay()
> >> +        * in detect will have performace impact in display.
> >> +        * So remove runtime calls here.
> >
> > That last sentence makes sense in a commit message, but not long term.
> > Someone reading the code later won't understand what "remove" means.
> > If you change "remove" to "omit" then it all makes sense, though. You
> > could also say that a pm_runtime reference will be grabbed by
> > ti_sn_bridge_hpd_enable().
>
> Okay. Will edit this.
>
> >
> >
> >> +        */
> >> +
> >>          regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);
> >> -       pm_runtime_put_autosuspend(pdata->dev);
> >>
> >>          return val & HPD_DEBOUNCED_STATE ? connector_status_connected
> >>                                           : connector_status_disconnec=
ted;
> >> @@ -1220,6 +1236,20 @@ static void ti_sn65dsi86_debugfs_init(struct dr=
m_bridge *bridge, struct dentry *
> >>          debugfs_create_file("status", 0600, debugfs, pdata, &status_f=
ops);
> >>   }
> >>
> >> +static void ti_sn_bridge_hpd_enable(struct drm_bridge *bridge)
> >> +{
> >> +       struct ti_sn65dsi86 *pdata =3D bridge_to_ti_sn65dsi86(bridge);
> >> +
> >> +       pm_runtime_get_sync(pdata->dev);
> >> +}
> >> +
> >> +static void ti_sn_bridge_hpd_disable(struct drm_bridge *bridge)
> >> +{
> >> +       struct ti_sn65dsi86 *pdata =3D bridge_to_ti_sn65dsi86(bridge);
> >> +
> >> +       pm_runtime_put_sync(pdata->dev);
> >> +}
> >> +
> >>   static const struct drm_bridge_funcs ti_sn_bridge_funcs =3D {
> >>          .attach =3D ti_sn_bridge_attach,
> >>          .detach =3D ti_sn_bridge_detach,
> >> @@ -1234,6 +1264,8 @@ static const struct drm_bridge_funcs ti_sn_bridg=
e_funcs =3D {
> >>          .atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicat=
e_state,
> >>          .atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_st=
ate,
> >>          .debugfs_init =3D ti_sn65dsi86_debugfs_init,
> >> +       .hpd_enable =3D ti_sn_bridge_hpd_enable,
> >> +       .hpd_disable =3D ti_sn_bridge_hpd_disable,
> >>   };
> >>
> >>   static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
> >> @@ -1322,7 +1354,8 @@ static int ti_sn_bridge_probe(struct auxiliary_d=
evice *adev,
> >>                             ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MOD=
E_CONNECTOR_eDP;
> >>
> >>          if (pdata->bridge.type =3D=3D DRM_MODE_CONNECTOR_DisplayPort)
> >> -               pdata->bridge.ops =3D DRM_BRIDGE_OP_EDID | DRM_BRIDGE_=
OP_DETECT;
> >> +               pdata->bridge.ops =3D DRM_BRIDGE_OP_EDID | DRM_BRIDGE_=
OP_DETECT |
> >> +                                   DRM_BRIDGE_OP_HPD;
> >
> > I think you also need this in the "DRM_MODE_CONNECTOR_DisplayPort" if t=
est:
> >
> > /*
> >   * If comms were already enabled they would have been enabled
> >   * with the wrong value of HPD_DISABLE. Update it now. Comms
> >   * could be enabled if anyone is holding a pm_runtime reference
> >   * (like if a GPIO is in use). Note that in most cases nobody
> >   * is doing AUX channel xfers before the bridge is added so
> >   * HPD doesn't _really_ matter then. The only exception is in
> >   * the eDP case where the panel wants to read the EDID before
> >   * the bridge is added. We always consistently have HPD disabled
> >   * for eDP.
> >   */
> > mutex_lock(&pdata->comms_mutex);
> > if (pdata->comms_enabled)
> >    regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG,
> >      HPD_DISABLE, 0);
> > mutex_unlock(&pdata->comms_mutex);
> >
> > Does that sound right?
>
>
> Here I don't think it is necessary to add this because enable_comms
> will be called again after probe either in hpd_enable() (in case
> refclk exist) or pre_enable() (in case it doesn't) with correct value.

I don't think that's necessarily true, is it? From my memory, this happens:

1. Main driver probe and we create the sub-devices, like the GPIO,
backlight, and AUX.

2. As soon as the GPIO probe happens, someone could conceivably claim
one of the GPIOs and set it as an output, which would cause a
"pm_runtime" reference to be held indefinitely.

3. After AUX probes, we create the bridge sub-device.

4. When the bridge probe runs, comms will still be enabled because the
"pm_runtime" reference keeps them on.

...there's also the issue that we use "autosuspend" and thus comms can
still be left on for a chunk of time even after there are no
"pm_runtime" references left.

-Doug
