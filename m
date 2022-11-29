Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC1363CAEC
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 23:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8747A10E0F6;
	Tue, 29 Nov 2022 22:06:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5711C10E265
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 22:06:05 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id ho10so37151937ejc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 14:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DMH+jK52f/JBcmbWcLJ3LSzlbnPFw6Ahm/0k3pfL+/s=;
 b=f2yg33inXJblUS67/eLUD0A2s+q1tBH/7hs/tfDh/O1rkrx6zLChIZC7JIxaJa4Ppp
 4Y//Nu/ell5Scmi4bHK3MhVIM7f4jyEuD4Gz4VFlpGlEkmtfjm23aZDJ2QH/gSuebEC4
 zTQzYdjqFKcGQi2PQLtuT2/qyvxe3YnLGgizXMhmtrPeomOI4pidWZD9sCtwbFSrKvwT
 B+sm6L5pHmvheMKtoeXVW6OW/T1GThARmIb0yWEJXqzNNp7NbwO8YHZxHE2NaGMB28hM
 tSRqmrsyUgPeaCRAV1xE+g8AP9hXukM3nvNe5CCeDAIru+eeGYtdwLcw+66AKysURz02
 Pyhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DMH+jK52f/JBcmbWcLJ3LSzlbnPFw6Ahm/0k3pfL+/s=;
 b=XxDQpe7HGyVKPeDEzMhemaoHo12sxw7ibm1Cn2z2gO+AsDcp2ECoGf0Ru0H7vtJdGC
 kEowaRtcVR9EYuRf1ZxMheJ3zqX6MlCmpwtCxN2strHdHltCBYYNnZ6fD79gK5rEU4bu
 8XtZmvFoF4JlewdFrt2cTDK875ggqi+ncoS0O1jabM+BcqZKvpfGgldPDr0kSt9iuxdw
 remw5yh9UAgmfnGs9M6hgaOfCOxMo9S8owBraTQekcfXkBYixVld/H7kBw/GcMODVdXy
 GhssFxFcj4NxBOu3nrWDjOpI1c2lTV2Wj9g9YUuq094LKo/k6VWBqnLzApcmTSwbKOYr
 QaIw==
X-Gm-Message-State: ANoB5pkhko8IVYnZEsc4l3BQ0xTbelHFd3VhWLaa6Z17jLs8kwUugXU4
 2hTSLzpKG0zjKnNpaTM5UcB+/YUmVncRB+FSoTA=
X-Google-Smtp-Source: AA0mqf7xa0+2/Tx8OYaQ6SSGkVq3h1RxYdH2hKEbXCYn+xr094/8L0JLSGIoTmf4QlGkSA3a0MqNyxcp6fih/wH47yU=
X-Received: by 2002:a17:906:6093:b0:78d:b37c:83d9 with SMTP id
 t19-20020a170906609300b0078db37c83d9mr33727650ejj.637.1669759563741; Tue, 29
 Nov 2022 14:06:03 -0800 (PST)
MIME-Version: 1.0
References: <20221128112320.25708-1-francesco@dolcini.it>
 <CAG3jFysnd9S2b4WCmHqKzJPhO=3sOLWHEExrsGPBn-e_6F5p6g@mail.gmail.com>
In-Reply-To: <CAG3jFysnd9S2b4WCmHqKzJPhO=3sOLWHEExrsGPBn-e_6F5p6g@mail.gmail.com>
From: Adrien Grassein <adrien.grassein@gmail.com>
Date: Tue, 29 Nov 2022 23:05:52 +0100
Message-ID: <CABkfQAECEFT_cJkVEHxSiYdo14r-dE-d80ZF3DpzGf4einKZkQ@mail.gmail.com>
Subject: Re: [PATCH v1] drm/bridge: lt8912b: Add hot plug detection
To: Robert Foss <robert.foss@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Francesco Dolcini <francesco@dolcini.it>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le mar. 29 nov. 2022 =C3=A0 12:15, Robert Foss <robert.foss@linaro.org> a =
=C3=A9crit :
>
> On Mon, 28 Nov 2022 at 12:23, Francesco Dolcini <francesco@dolcini.it> wr=
ote:
> >
> > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> >
> > Enable hot plug detection when it is available on the HDMI port.
> > Without this connecting to a different monitor with incompatible timing
> > before the 10 seconds poll period will lead to a broken display output.
> >
> > Fixes: 30e2ae943c26 ("drm/bridge: Introduce LT8912B DSI to HDMI bridge"=
)
> > Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > ---
> >  drivers/gpu/drm/bridge/lontium-lt8912b.c | 21 +++++++++++++++++++--
> >  1 file changed, 19 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm=
/bridge/lontium-lt8912b.c
> > index a98efef0ba0e..5f0c9cd2a970 100644
> > --- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
> > +++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
> > @@ -517,14 +517,27 @@ static int lt8912_attach_dsi(struct lt8912 *lt)
> >         return 0;
> >  }
> >
> > +static void lt8912_bridge_hpd_cb(void *data, enum drm_connector_status=
 status)
> > +{
> > +       struct lt8912 *lt =3D data;
> > +
> > +       if (lt->bridge.dev)
> > +               drm_helper_hpd_irq_event(lt->bridge.dev);
> > +}
> > +
> >  static int lt8912_bridge_connector_init(struct drm_bridge *bridge)
> >  {
> >         int ret;
> >         struct lt8912 *lt =3D bridge_to_lt8912(bridge);
> >         struct drm_connector *connector =3D &lt->connector;
> >
> > -       connector->polled =3D DRM_CONNECTOR_POLL_CONNECT |
> > -                           DRM_CONNECTOR_POLL_DISCONNECT;
> > +       if (lt->hdmi_port->ops & DRM_BRIDGE_OP_HPD) {
> > +               drm_bridge_hpd_enable(lt->hdmi_port, lt8912_bridge_hpd_=
cb, lt);
> > +               connector->polled =3D DRM_CONNECTOR_POLL_HPD;
> > +       } else {
> > +               connector->polled =3D DRM_CONNECTOR_POLL_CONNECT |
> > +                                   DRM_CONNECTOR_POLL_DISCONNECT;
> > +       }
> >
> >         ret =3D drm_connector_init(bridge->dev, connector,
> >                                  &lt8912_connector_funcs,
> > @@ -578,6 +591,10 @@ static void lt8912_bridge_detach(struct drm_bridge=
 *bridge)
> >
> >         if (lt->is_attached) {
> >                 lt8912_hard_power_off(lt);
> > +
> > +               if (lt->hdmi_port->ops & DRM_BRIDGE_OP_HPD)
> > +                       drm_bridge_hpd_disable(lt->hdmi_port);
> > +
> >                 drm_connector_unregister(&lt->connector);
> >                 drm_connector_cleanup(&lt->connector);
> >         }
> > --
> > 2.25.1
> >
>
>
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Adrien Grassein <adrien.grassein@gmail.com>
>
> Snoozing this patch, will apply it in a few days if no issues are found.
