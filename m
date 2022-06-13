Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E5D54A00D
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 22:48:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA0D10F99A;
	Mon, 13 Jun 2022 20:48:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870D710F99A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 20:48:25 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-30c143c41e5so10685097b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 13:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3mzLXc3omMOdnceGi72bYvaWi09FowsdxsPXVOOLWCo=;
 b=UkGQCIGmy2VA2qNV54XgHFut1lruS44Ok6ioCXsNzw6LyRpNqBzZClI6cA1S7OvMcY
 Kp8PTojzzJD65eMqBbZ/0ziJq0NYOS6jETD9dqdsU4UjPK+Z84UhGwH6M7KldwNl2q3N
 5tACt6+cbeMJpcLCaQEI4AOkuRxogFnBtnqG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3mzLXc3omMOdnceGi72bYvaWi09FowsdxsPXVOOLWCo=;
 b=jckKkkDT86km/H01jAq+HeZaHyXycjsd20gDvpUXo0RZ+HLVtn0ZAZ/zdrVXv5WNX3
 No0at6daTy4m6z8RarJ+jkLT492Jo8+jSvQGf3Gf+I1cB2dHt/RXpftFFIm85CzgFZS/
 1TNbMRvGydxIC/lNc7RWpXvHb5nAQCqnQEfTmWmVNBv93uwqLIKOZyjIXgG/67EUKqMb
 A5KIzgS18JF6bKDCOGVdh6Qdl1BPXjPx3VSQ9/swa4XQIazoFA4JEyqT+hft9tSioTdJ
 jla9/XYgPY5me0ZQkNsJV2GpIrXifHyS3sjjHahD40QrmE/6giejfPuyy8wXtNzRhzXU
 jyJw==
X-Gm-Message-State: AJIora8Eery4XmoRWDLJ0cTxXc5ZtYy86bqXEC/XgfyegqcpOewBt+yB
 CPMiJijGXTMF4ZEDoaMQUQ+PDM81agh6zgtn1ey74Q==
X-Google-Smtp-Source: AGRyM1v0IBXwwJvQ6ThVo9NueSieU7nIxKk5N1jB0CBM2omKJsAvjrCZ6AcsceMJ9k7lsbfvB7coyKa/u+Rb5K9KkgU=
X-Received: by 2002:a0d:f882:0:b0:2f4:d830:6fd with SMTP id
 i124-20020a0df882000000b002f4d83006fdmr1775978ywf.387.1655153304756; Mon, 13
 Jun 2022 13:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220609181106.3695103-1-pmalani@chromium.org>
 <20220609181106.3695103-6-pmalani@chromium.org>
 <20220613204544.onfazkv4ciphddm3@notapiano>
In-Reply-To: <20220613204544.onfazkv4ciphddm3@notapiano>
From: Prashant Malani <pmalani@chromium.org>
Date: Mon, 13 Jun 2022 13:48:13 -0700
Message-ID: <CACeCKacaq_6zc9daL38VycCxWaNvVHFETBfytrDXTBCa3Y3jRw@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] drm/bridge: anx7625: Register number of Type C
 switches
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
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
Cc: heikki.krogerus@linux.intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, swboyd@chromium.org,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi N=C3=ADcolas,

On Mon, Jun 13, 2022 at 1:45 PM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> Hi Prashant,
>
> On Thu, Jun 09, 2022 at 06:09:44PM +0000, Prashant Malani wrote:
> > Parse the "switches" node, if available, and count and store the number
> > of Type-C switches within it. Since we currently don't do anything with
> > this info, no functional changes are expected from this change.
> >
> > This patch sets a foundation for the actual registering of Type-C
> > switches with the Type-C connector class framework.
> >
> > Signed-off-by: Prashant Malani <pmalani@chromium.org>
> > ---
> >
> > Changes since v1:
> > - No changes.
> >
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 20 ++++++++++++++++++++
> >  drivers/gpu/drm/bridge/analogix/anx7625.h |  1 +
> >  2 files changed, 21 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/dr=
m/bridge/analogix/anx7625.c
> > index 53a5da6c49dd..07ed44c6b839 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -2581,6 +2581,22 @@ static void anx7625_runtime_disable(void *data)
> >       pm_runtime_disable(data);
> >  }
> >
> > +static int anx7625_register_typec_switches(struct device *device, stru=
ct anx7625_data *ctx)
> > +{
> > +     struct device_node *of =3D NULL;
> > +     int ret =3D 0;
> > +
> > +     of =3D of_get_child_by_name(device->of_node, "switches");
> > +     if (!of)
> > +             return -ENODEV;
> > +
> > +     ctx->num_typec_switches =3D of_get_child_count(of);
> > +     if (ctx->num_typec_switches <=3D 0)
> > +             return -ENODEV;
>
> Since the hardware only allows at most 2 switches (based on the dt-bindin=
gs),
> you should have a define for that limit and check that it isn't exceeded =
here.

This is already enforced by the DT binding (see the
"patternProperties" in patch 4/7, suggested by Krzysztof in the
previous version)

>
> Thanks,
> N=C3=ADcolas
>
> > +
> > +     return ret;
> > +}
> > +
> >  static int anx7625_i2c_probe(struct i2c_client *client,
> >                            const struct i2c_device_id *id)
> >  {
> > @@ -2686,6 +2702,10 @@ static int anx7625_i2c_probe(struct i2c_client *=
client,
> >       if (platform->pdata.intp_irq)
> >               queue_work(platform->workqueue, &platform->work);
> >
> > +     ret =3D anx7625_register_typec_switches(dev, platform);
> > +     if (ret)
> > +             dev_info(dev, "Didn't register Type C switches, err: %d\n=
", ret);
> > +
> >       platform->bridge.funcs =3D &anx7625_bridge_funcs;
> >       platform->bridge.of_node =3D client->dev.of_node;
> >       if (!anx7625_of_panel_on_aux_bus(&client->dev))
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/dr=
m/bridge/analogix/anx7625.h
> > index e257a84db962..d5cbca708842 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.h
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
> > @@ -473,6 +473,7 @@ struct anx7625_data {
> >       struct drm_connector *connector;
> >       struct mipi_dsi_device *dsi;
> >       struct drm_dp_aux aux;
> > +     int num_typec_switches;
> >  };
> >
> >  #endif  /* __ANX7625_H__ */
> > --
> > 2.36.1.476.g0c4daa206d-goog
> >
