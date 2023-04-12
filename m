Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB3E6DFF95
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 22:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A862B10E1E9;
	Wed, 12 Apr 2023 20:22:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E755310E1E9
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 20:22:19 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id q5so15988532ybk.7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 13:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1681330938; x=1683922938;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nvarXsiUW5PBuCRvwerC9nemBFftbn3zJXSqzBEP1bw=;
 b=kNTHnIjTjuyxCWlfAZflGtN3mh9BDwsKqOfYyAWh2JwUUg6KFCqnS8AalcgDQWrtcv
 bKwqeEWxiDXW1+CM8NoPSXiWbkCh5BSu9OAhFNFMe/qgGfw6L0S1Q07qnOBmXdG2WO9s
 QYOZXKCkptsBn0YyUOWVNPRTRG5oVQtKbVxkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681330938; x=1683922938;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nvarXsiUW5PBuCRvwerC9nemBFftbn3zJXSqzBEP1bw=;
 b=PaldrHHefXc9CcW0ho098Gz4tj0Wou85w58iNs+1buJARf0Z5nyyierrQ1fum0bxIL
 gtXpAqYK0Yq7TBoxjd8GP6mL4GhL79oyRbuz2F3TNp2/2kJfQpHYE4ENcYZLyOcpCaPK
 2Hp21Bd2fQSzZYz/i8rgiloQE6J9sBw3ijDXVuJDbwDXBG8XMrcDSR2wQCzzihXzGVS2
 T8DX1nmAoe6IRtPoWaw79xfgLpd+rz5h9RCY4NrO/UdAGgqRXweS0R1Tf1WxOEyBnqJ9
 93BiFARS3rQ2D+nMrWkKknMdE+InPLvsV4AjhzMm3hVii2YxL3ZyvOTvXUujW5DDyGGi
 iNgQ==
X-Gm-Message-State: AAQBX9duVD9qBlkilArjt/DPgMQRmRQLmnlNchn4FbGqnZdjoZZ0WecC
 J/J7+GGCIpHgMrc10izOQ9VdHm3WyY+3jaxFHy0=
X-Google-Smtp-Source: AKy350ZSOdsg289MAvuMVQfnATDaAnPTi1PkTPVaK5gkZYVAezx3qCqtHWR/9LS5BFGlPtZIUi/J2w==
X-Received: by 2002:a05:6902:70e:b0:a1e:deda:9bf4 with SMTP id
 k14-20020a056902070e00b00a1ededa9bf4mr4091517ybt.22.1681330938377; 
 Wed, 12 Apr 2023 13:22:18 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170]) by smtp.gmail.com with ESMTPSA id
 t5-20020a25ba05000000b00b8ee3e2d073sm2590773ybg.52.2023.04.12.13.22.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 13:22:17 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id j10so2985256ybj.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 13:22:17 -0700 (PDT)
X-Received: by 2002:a25:7382:0:b0:b8b:eea7:525b with SMTP id
 o124-20020a257382000000b00b8beea7525bmr4892457ybc.7.1681330937165; Wed, 12
 Apr 2023 13:22:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230408082014.235425-1-nikita@trvn.ru>
In-Reply-To: <20230408082014.235425-1-nikita@trvn.ru>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 12 Apr 2023 13:22:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XEQS9MB4e52B4yLjiP8ksYmeos_emiH4=-adCOwzfGUA@mail.gmail.com>
Message-ID: <CAD=FV=XEQS9MB4e52B4yLjiP8ksYmeos_emiH4=-adCOwzfGUA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Implement wait_hpd_asserted
To: Nikita Travkin <nikita@trvn.ru>
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
Cc: neil.armstrong@linaro.org, rfoss@kernel.org, andrzej.hajda@intel.com,
 jonas@kwiboo.se, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sat, Apr 8, 2023 at 1:20=E2=80=AFAM Nikita Travkin <nikita@trvn.ru> wrot=
e:
>
> This bridge doesn't actually implement HPD due to it being way too slow
> but instead expects the panel driver to wait enough to assume HPD is
> asserted. However some panels (such as the generic 'edp-panel') expect
> the bridge to deal with the delay and pass maximum delay to the aux
> instead.
>
> In order to support such panels, add a dummy implementation of wait
> that would just sleep the maximum delay and assume no failure has
> happened.
>
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> ---
> This was suggested in [1] to make sure DT users can be semantically
> correct (not adding no-hpd when the line is actually there) while
> still using a hard delay to be faster than waiting the long debounce
> time.
>
> [1] - https://lore.kernel.org/all/CAD=3DFV=3DVR7sKsquE25eF7joc7gPApu-vqwd=
uZzjE=3DwFCoXjMYnQ@mail.gmail.com/
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi86.c
> index 7a748785c545..260cad1fd1da 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -618,6 +618,24 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux =
*aux,
>         return len;
>  }
>
> +static int ti_sn_aux_wait_hpd_asserted(struct drm_dp_aux *aux, unsigned =
long wait_us)
> +{
> +       /*
> +        * The HPD in this chip is a bit useless (See comment in
> +        * ti_sn65dsi86_enable_comms) so if our driver is expected to wai=
t
> +        * for HPD, we just assume it's asserted after the wait_us delay.
> +        *
> +        * In case we are asked to wait forever (wait_us=3D0) take conser=
vative
> +        * 500ms delay.
> +        */
> +       if (wait_us =3D=3D 0)
> +               wait_us =3D 500000;
> +
> +       usleep_range(wait_us, wait_us + 1000);
> +
> +       return 0;
> +}
> +
>  static int ti_sn_aux_probe(struct auxiliary_device *adev,
>                            const struct auxiliary_device_id *id)
>  {
> @@ -627,6 +645,7 @@ static int ti_sn_aux_probe(struct auxiliary_device *a=
dev,
>         pdata->aux.name =3D "ti-sn65dsi86-aux";
>         pdata->aux.dev =3D &adev->dev;
>         pdata->aux.transfer =3D ti_sn_aux_transfer;
> +       pdata->aux.wait_hpd_asserted =3D ti_sn_aux_wait_hpd_asserted;

This looks reasonable to me, but I think you only want this
implementation if the "no-hpd" property _isn't_ present. In other
words:

if (!of_property_read_bool(np, "no-hpd"))
  pdata->aux.wait_hpd_asserted =3D ti_sn_aux_wait_hpd_asserted;

Essentially:

* If "no-hpd" is present in ti-sn65dsi86 then we'll assume that HPD is
handled by the panel driver via a GPIO or a "no-hpd" there (which will
cause the panel driver to wait the maximum duration).

* If "no-hpd" isn't present in ti-sn65dsi86 then HPD is actually
hooked up and thus the panel driver _won't_ handle it.

Does that seem right? Presumably this should be explained by comments.

-Doug
