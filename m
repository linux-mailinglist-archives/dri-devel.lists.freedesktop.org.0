Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 481228367D7
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 16:20:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99CA710F3F7;
	Mon, 22 Jan 2024 15:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E2210F3F7
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 15:20:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id D2A2CB80C81
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 15:20:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 331B3C433A6
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 15:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705936806;
 bh=SXUPVZkJmcierNdtKqvg9SmUNHeTPRtiZts/xJRvssk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rV7rGxU92XXwycgUGJw7K4cnzR088p6xQt3GeF0u42UV8it4WfI/TQVkK6f3YEDPR
 bygxas0sFl8gF3YUTiuDLBQT0pY1RdyU6ATXhDMRThgrOGgoqFzEFd0AkCshx7ClBK
 4G2iXtwl8IlyhM33mvX3O2mwdL5H7Z6ZUKhVlrmKq5SeDtOQ59k+9LHkXKlSMynBz7
 cJvRQEKrsi77S0BOWh9k3JDrV0nWxgTF1WikQChLAnZ9/0wO7ztG5RUpBZywzb9Bz6
 MhD63oQN33YPpsV8HcK8tR5sMEJaMmkajO5egAK+6CT0+rXZMsSj2p208Jhi4TVDpO
 cpjXU1vqThWcg==
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-6000bbdbeceso6459527b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 07:20:06 -0800 (PST)
X-Gm-Message-State: AOJu0Yz65/b0yfVNC68Bjpk2ndg7GlHXQpA893XBvUvCUf9NuSRi5fVE
 kEvO7ocDoHWt4T/72KQ71CdCrVJI/DScQvnDTJ+QqeIE9ZzmJ064bA9yaTgle7CupdyWfm19h/D
 eybon3iHBIbYzZSBuLDCNHlMmfZifAakzTvGzvA==
X-Google-Smtp-Source: AGHT+IHR9EW9F+L1o9xTG0NWnaQNNaPen2WULRKl2Ey5mTjdWB7qIXk9iNSTyKGEeFaaFtAETMuRe2rPCt8bmP5ufzo=
X-Received: by 2002:a81:a1d5:0:b0:5ff:850e:ca42 with SMTP id
 y204-20020a81a1d5000000b005ff850eca42mr3334295ywg.4.1705936805503; Mon, 22
 Jan 2024 07:20:05 -0800 (PST)
MIME-Version: 1.0
References: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
 <3a67fffe50fe267b612d5557bb6b790ff1a792ca.1701860672.git.u.kleine-koenig@pengutronix.de>
In-Reply-To: <3a67fffe50fe267b612d5557bb6b790ff1a792ca.1701860672.git.u.kleine-koenig@pengutronix.de>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 22 Jan 2024 16:19:54 +0100
X-Gmail-Original-Message-ID: <CAN6tsi6iDsoTpNS7e0XCTf-2RM924za+B7_z9HL+xRR430jjjg@mail.gmail.com>
Message-ID: <CAN6tsi6iDsoTpNS7e0XCTf-2RM924za+B7_z9HL+xRR430jjjg@mail.gmail.com>
Subject: Re: [PATCH v4 107/115] drm/bridge: ti-sn65dsi86: Make use of
 devm_pwmchip_alloc() function
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
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
 Jernej Skrabec <jernej.skrabec@gmail.com>, kernel@pengutronix.de,
 Jonas Karlman <jonas@kwiboo.se>, Douglas Anderson <dianders@chromium.org>,
 Maxime Ripard <mripard@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-pwm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 6, 2023 at 12:49=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> This prepares the pwm driver of the ti-sn65dsi86 to further changes of
> the pwm core outlined in the commit introducing devm_pwmchip_alloc().
> There is no intended semantical change and the driver should behave as
> before.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 27 ++++++++++++++++++---------
>  1 file changed, 18 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi86.c
> index c45c07840f64..33eb2ed0a729 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -197,7 +197,7 @@ struct ti_sn65dsi86 {
>         DECLARE_BITMAP(gchip_output, SN_NUM_GPIOS);
>  #endif
>  #if defined(CONFIG_PWM)
> -       struct pwm_chip                 pchip;
> +       struct pwm_chip                 *pchip;
>         bool                            pwm_enabled;
>         atomic_t                        pwm_pin_busy;
>  #endif
> @@ -1372,7 +1372,7 @@ static void ti_sn_pwm_pin_release(struct ti_sn65dsi=
86 *pdata)
>
>  static struct ti_sn65dsi86 *pwm_chip_to_ti_sn_bridge(struct pwm_chip *ch=
ip)
>  {
> -       return container_of(chip, struct ti_sn65dsi86, pchip);
> +       return pwmchip_get_drvdata(chip);
>  }
>
>  static int ti_sn_pwm_request(struct pwm_chip *chip, struct pwm_device *p=
wm)
> @@ -1585,22 +1585,31 @@ static const struct pwm_ops ti_sn_pwm_ops =3D {
>  static int ti_sn_pwm_probe(struct auxiliary_device *adev,
>                            const struct auxiliary_device_id *id)
>  {
> +       struct pwm_chip *chip;
>         struct ti_sn65dsi86 *pdata =3D dev_get_drvdata(adev->dev.parent);
>
> -       pdata->pchip.dev =3D pdata->dev;
> -       pdata->pchip.ops =3D &ti_sn_pwm_ops;
> -       pdata->pchip.npwm =3D 1;
> -       pdata->pchip.of_xlate =3D of_pwm_single_xlate;
> -       pdata->pchip.of_pwm_n_cells =3D 1;
> +       /*
> +        * This should better use adev->dev instead of pdata->dev. See
> +        * https://lore.kernel.org/dri-devel/20231127101547.734061-2-u.kl=
eine-koenig@pengutronix.de
> +        */
> +       pdata->pchip =3D chip =3D devm_pwmchip_alloc(pdata->dev, 1, 0);
> +       if (IS_ERR(chip))
> +               return PTR_ERR(chip);
>
> -       return pwmchip_add(&pdata->pchip);
> +       pwmchip_set_drvdata(chip, pdata);
> +
> +       chip->ops =3D &ti_sn_pwm_ops;
> +       chip->of_xlate =3D of_pwm_single_xlate;
> +       chip->of_pwm_n_cells =3D 1;
> +
> +       return pwmchip_add(chip);
>  }
>
>  static void ti_sn_pwm_remove(struct auxiliary_device *adev)
>  {
>         struct ti_sn65dsi86 *pdata =3D dev_get_drvdata(adev->dev.parent);
>
> -       pwmchip_remove(&pdata->pchip);
> +       pwmchip_remove(pdata->pchip);
>
>         if (pdata->pwm_enabled)
>                 pm_runtime_put_sync(pdata->dev);
> --
> 2.42.0
>

Acked-by: Robert Foss <rfoss@kernel.org>
