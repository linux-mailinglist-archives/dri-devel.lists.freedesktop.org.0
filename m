Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C659963C5AE
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 17:53:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B90310E03D;
	Tue, 29 Nov 2022 16:53:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7545D10E03D
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 16:53:30 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id l127so15866210oia.8
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 08:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nX3XDw+aJWbqG71jNK2XOm8EYBY4nRDO50tiBkk6nzE=;
 b=eZGUMebShf+nYBcnZ7+qSuog/s1H+Yimyzp9jVbMHDnUyBIOtfdsnqOmKxJgXhilUd
 kCXBn7Yj1M1Lji4/kmPp22ZbV8L2bYAvIcl9J+UYTD9d7jjjdIF6ZBGC1sYmCukK7y+w
 6aFYnilDbD+HyK8J/Y4o/PtDq/xStFYCLkAEVDmMwchKt2sw+M0T+CCo68KLN2fjES/t
 VWiWU7c/hgJb8sW+E/qFU6bABXcp+OnEMRzS53qibSrm9O5I+6nRBFva891L6ph/KSbC
 zyuy1HPdFjuz3+iSiKFzARg/85GaMyGxDMYRiciqzd8wWdWoOd2TFNu1zf1zYgSkvH80
 ShBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nX3XDw+aJWbqG71jNK2XOm8EYBY4nRDO50tiBkk6nzE=;
 b=4iD+Mh312oQ5e8edlLN79Ha12NONUUDBXl69cAgiV36aWeBGnumT9N8aokBVOgOcZt
 IlnIhDmGdi1D/k2NFdeZsJqyoqrFLS5GyZqdCi6XFBxVFQS7uApljM92PVcaq+ljePzx
 ahAk+C9u0hWo+0uq7FPDoAtgjPQIFuZlBwnffU2CEEL8qXq3pf57V8bLU+IazBl/EMoF
 yLnJ8upMVzTcubEDMV3uP+BYbKtg3ttPPqjHnqQDDbb0xumI7dKd31uxK5g7x2bnK0uP
 tHCpavGCPxsdlmoEeRwrm2GhSvQbEcWgV7mFWGW+UDFqpDIy02QZZoswci0qS6GyjAhB
 l+bw==
X-Gm-Message-State: ANoB5pl7yLM1bwT1q7mZ/ctANw4noiSVmjQzho0QVY6nd3JC4T0cQUEr
 hpUDvmo0Z0+DmKJO8rvLTSX1vd7N3CYKhxx0G6jNM4lPqrfMgfZ+
X-Google-Smtp-Source: AA0mqf5IXY8LzctaU4Fl4SjDm7702lMsmNWFfYQL6NXNStETLNdQMSdiKZ9Qj80YpnL+BWAZoUuLwX40hFVJgAK67OI=
X-Received: by 2002:aca:2801:0:b0:35a:13f4:d875 with SMTP id
 1-20020aca2801000000b0035a13f4d875mr30406072oix.190.1669740809533; Tue, 29
 Nov 2022 08:53:29 -0800 (PST)
MIME-Version: 1.0
References: <cover.1668602942.git.mazziesaccount@gmail.com>
 <a2f0835e8d3b5f5768d887ce47a1575ae11b19f0.1668602942.git.mazziesaccount@gmail.com>
In-Reply-To: <a2f0835e8d3b5f5768d887ce47a1575ae11b19f0.1668602942.git.mazziesaccount@gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 29 Nov 2022 17:53:18 +0100
Message-ID: <CAG3jFytRrhzWj+ka+fSK=cQfhg83pK9ZJAH4u5aRGnCmzJAZqg@mail.gmail.com>
Subject: Re: [PATCH RESEND v4 2/2] gpu: drm: meson: Use
 devm_regulator_*get_enable*()
To: Matti Vaittinen <mazziesaccount@gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The prefix to the commit title is a new one, let's use an existing one:
- drm/meson: dw-hdmi:
- drm: meson: dw-hdmi:

On Wed, 16 Nov 2022 at 14:04, Matti Vaittinen <mazziesaccount@gmail.com> wrote:
>
> Simplify using the devm_regulator_get_enable_optional(). Also drop the
> seemingly unused struct member 'hdmi_supply'.
>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>
> ---
> I am doing a clean-up for my local git and encountered this one.
> Respinning as it seems this one fell through the cracks.
> ---
>  drivers/gpu/drm/meson/meson_dw_hdmi.c | 23 +++--------------------
>  1 file changed, 3 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 5cd2b2ebbbd3..7642f740272b 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -140,7 +140,6 @@ struct meson_dw_hdmi {
>         struct reset_control *hdmitx_apb;
>         struct reset_control *hdmitx_ctrl;
>         struct reset_control *hdmitx_phy;
> -       struct regulator *hdmi_supply;
>         u32 irq_stat;
>         struct dw_hdmi *hdmi;
>         struct drm_bridge *bridge;
> @@ -665,11 +664,6 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
>
>  }
>
> -static void meson_disable_regulator(void *data)
> -{
> -       regulator_disable(data);
> -}
> -
>  static void meson_disable_clk(void *data)
>  {
>         clk_disable_unprepare(data);
> @@ -723,20 +717,9 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>         meson_dw_hdmi->data = match;
>         dw_plat_data = &meson_dw_hdmi->dw_plat_data;
>
> -       meson_dw_hdmi->hdmi_supply = devm_regulator_get_optional(dev, "hdmi");
> -       if (IS_ERR(meson_dw_hdmi->hdmi_supply)) {
> -               if (PTR_ERR(meson_dw_hdmi->hdmi_supply) == -EPROBE_DEFER)
> -                       return -EPROBE_DEFER;
> -               meson_dw_hdmi->hdmi_supply = NULL;
> -       } else {
> -               ret = regulator_enable(meson_dw_hdmi->hdmi_supply);
> -               if (ret)
> -                       return ret;
> -               ret = devm_add_action_or_reset(dev, meson_disable_regulator,
> -                                              meson_dw_hdmi->hdmi_supply);
> -               if (ret)
> -                       return ret;
> -       }
> +       ret = devm_regulator_get_enable_optional(dev, "hdmi");
> +       if (ret != -ENODEV)
> +               return ret;
>
>         meson_dw_hdmi->hdmitx_apb = devm_reset_control_get_exclusive(dev,
>                                                 "hdmitx_apb");
> --
> 2.38.1
>
>
> --
> Matti Vaittinen, Linux device drivers
> ROHM Semiconductors, Finland SWDC
> Kiviharjunlenkki 1E
> 90220 OULU
> FINLAND
>
> ~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
> Simon says - in Latin please.
> ~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
> Thanks to Simon Glass for the translation =]
