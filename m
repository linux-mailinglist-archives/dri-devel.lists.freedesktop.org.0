Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0E26BA176
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 22:30:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA5D10E89F;
	Tue, 14 Mar 2023 21:30:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 672B410E89F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 21:30:21 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id y12so5135275ilq.4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 14:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678829418;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JsMceCqob1v/eZx8VljwvrzXfHSSxRsvo6NsNcMmoXs=;
 b=bnLAcAb45oqt2qYPf6nAybs38nR7U2n76pgqYycg2+MD2EdRQgUOgVH4SbraH5LB74
 Yrdbe35Jvz0fVUUdcD79C+pDQ2MB6MvRuBW0RnHfO3Nd8pAc5TzAkblnuaBRmfbC0Bdc
 zfLs+pZogwNO7kKt8HmAxkolq2Mgd0o779GXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678829418;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JsMceCqob1v/eZx8VljwvrzXfHSSxRsvo6NsNcMmoXs=;
 b=i/Gwmf1XX52AlYTAcZK9ZVdtPOr9pDzbdzYpeERoTdlJELgyJYfokJdFd3XOZ8a7gj
 i0iG82g9sFqbfd/iEiu6g+yldarhxLlbCaCGPjTtLejCyz4QxZ+TqbdJp2DszRuCQOAj
 IZ5wAZOjOgQ9nv1Srd20ODGpZ9xgymyUldeMSi6xWiskxMPtvO0eUB2JJ/QQ6bX+j8nz
 X9ZIx308eMiHP4OilHL2F4vIwDTw4E/HA1sr2ZdhWDfdz2oeOcs62n7OPbaCyfiQY5mE
 UH4QxCGaYVJ96nq0ZUS8sq6NbZbSu4yhj1ImAla+b6/FnLso8AsFjojMBfmhzGCqOz1T
 McFg==
X-Gm-Message-State: AO0yUKXPqIpzh8pFkV7JJ9VxXBdy5Q7jOD1tdpZ2NP4iJxfedBbpqWAJ
 fxy949R10Y8t7eeZ8KnLdI97FpD8LJbVug+bURc=
X-Google-Smtp-Source: AK7set9Ko6pN+AxJNJLu6UhtkGGx1xkFsT/z0XTN9S4e9ozwjVit3y8MJ65ifH7rtFXnIkgpJNU/sQ==
X-Received: by 2002:a05:6e02:1d03:b0:315:2b7b:a3b7 with SMTP id
 i3-20020a056e021d0300b003152b7ba3b7mr2744993ila.5.1678829418300; 
 Tue, 14 Mar 2023 14:30:18 -0700 (PDT)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com.
 [209.85.166.53]) by smtp.gmail.com with ESMTPSA id
 y26-20020a02ce9a000000b003acde48bdc3sm1076167jaq.111.2023.03.14.14.30.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Mar 2023 14:30:16 -0700 (PDT)
Received: by mail-io1-f53.google.com with SMTP id g6so6987520iov.13
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 14:30:15 -0700 (PDT)
X-Received: by 2002:a6b:6811:0:b0:752:dd73:efde with SMTP id
 d17-20020a6b6811000000b00752dd73efdemr755170ioc.1.1678829415242; Tue, 14 Mar
 2023 14:30:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230314110043.2139111-1-treapking@chromium.org>
 <20230314110043.2139111-2-treapking@chromium.org>
In-Reply-To: <20230314110043.2139111-2-treapking@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 14 Mar 2023 14:30:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VuK8vK7gaur7Srv9JFOaYbi=wkNs3f4sgrcLvjZahfjw@mail.gmail.com>
Message-ID: <CAD=FV=VuK8vK7gaur7Srv9JFOaYbi=wkNs3f4sgrcLvjZahfjw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: ps8640: Add a cache for EDID
To: Pin-yen Lin <treapking@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Mar 14, 2023 at 4:00=E2=80=AFAM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> When there are multiple EDID reads, the bridge will be repeatedly
> enabled and disabled. Add a cache for EDID to speed this up.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> ---
>
>  drivers/gpu/drm/bridge/parade-ps8640.c | 61 ++++++++++++++++----------
>  1 file changed, 37 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bri=
dge/parade-ps8640.c
> index 08de501c436e..4d594be8b89c 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -105,6 +105,7 @@ struct ps8640 {
>         struct gpio_desc *gpio_reset;
>         struct gpio_desc *gpio_powerdown;
>         struct device_link *link;
> +       struct edid *edid;
>         bool pre_enabled;
>         bool need_post_hpd_delay;
>  };
> @@ -543,34 +544,37 @@ static struct edid *ps8640_bridge_get_edid(struct d=
rm_bridge *bridge,
>  {
>         struct ps8640 *ps_bridge =3D bridge_to_ps8640(bridge);
>         bool poweroff =3D !ps_bridge->pre_enabled;
> -       struct edid *edid;
>
> -       /*
> -        * When we end calling get_edid() triggered by an ioctl, i.e
> -        *
> -        *   drm_mode_getconnector (ioctl)
> -        *     -> drm_helper_probe_single_connector_modes
> -        *        -> drm_bridge_connector_get_modes
> -        *           -> ps8640_bridge_get_edid
> -        *
> -        * We need to make sure that what we need is enabled before readi=
ng
> -        * EDID, for this chip, we need to do a full poweron, otherwise i=
t will
> -        * fail.
> -        */
> -       if (poweroff)
> -               drm_atomic_bridge_chain_pre_enable(bridge, connector->sta=
te->state);
> +       if (!ps_bridge->edid) {
> +               /*
> +                * When we end calling get_edid() triggered by an ioctl, =
i.e
> +                *
> +                *   drm_mode_getconnector (ioctl)
> +                *     -> drm_helper_probe_single_connector_modes
> +                *        -> drm_bridge_connector_get_modes
> +                *           -> ps8640_bridge_get_edid
> +                *
> +                * We need to make sure that what we need is enabled befo=
re
> +                * reading EDID, for this chip, we need to do a full powe=
ron,
> +                * otherwise it will fail.
> +                */
> +               if (poweroff)
> +                       drm_atomic_bridge_chain_pre_enable(bridge,
> +                                                          connector->sta=
te->state);
>
> -       edid =3D drm_get_edid(connector,
> -                           ps_bridge->page[PAGE0_DP_CNTL]->adapter);
> +               ps_bridge->edid =3D drm_get_edid(connector,
> +                                              ps_bridge->page[PAGE0_DP_C=
NTL]->adapter);
>
> -       /*
> -        * If we call the get_edid() function without having enabled the =
chip
> -        * before, return the chip to its original power state.
> -        */
> -       if (poweroff)
> -               drm_atomic_bridge_chain_post_disable(bridge, connector->s=
tate->state);
> +               /*
> +                * If we call the get_edid() function without having enab=
led the
> +                * chip before, return the chip to its original power sta=
te.
> +                */
> +               if (poweroff)
> +                       drm_atomic_bridge_chain_post_disable(bridge,
> +                                                            connector->s=
tate->state);
> +       }
>
> -       return edid;
> +       return drm_edid_duplicate(ps_bridge->edid);
>  }
>
>  static void ps8640_runtime_disable(void *data)
> @@ -767,6 +771,14 @@ static int ps8640_probe(struct i2c_client *client)
>         return ret;
>  }
>
> +static void ps8640_remove(struct i2c_client *client)
> +{
> +       struct ps8640 *ps_bridge =3D i2c_get_clientdata(client);
> +
> +       kfree(ps_bridge->edid);
> +       ps_bridge->edid =3D NULL;

nit: no need to clear this to NULL since the driver is exiting.

Other than the small nit:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
