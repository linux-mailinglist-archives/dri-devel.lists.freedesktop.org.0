Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D026E8B81
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 09:35:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A62E10EBCC;
	Thu, 20 Apr 2023 07:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C9810EBCC
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 07:35:34 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-54fe82d8bf5so30149467b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 00:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681976133; x=1684568133;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oRrgwJWD+8vJRxL9WL2rW+4K8XNxrX77Zqnik++vJco=;
 b=V9ZZeQCguzR5s2+a6zt5ViV/VcZ+MawMWiQ9nWrHrmXXlj9v/UaQS/O6PJRaT1tsOf
 h5tuQEjKStlQgMKhkXFOOcFmS8B21iMRc/pb0uRoREw//QmWb6GXKizIyZkwfuZuGyvc
 nRnyrpjDyZwNDguS9iq6WQnUktSEpOTpCGJrLDrolPM6fgKork4xnuTa9B2uFi9C0zcw
 SB6x5/FLx4hgdeIH4iav6r2eq1lLbS9I+A0sikp4EO7/1dkNPVS4XMM5Q+cbDY+g+lEF
 vG4BJH/hcBbMb1ApWBnTaaxzurUWTCqxIik+LXS0lzoFMzLweYAM3YZjRvawKEuA4FsE
 rRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681976133; x=1684568133;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oRrgwJWD+8vJRxL9WL2rW+4K8XNxrX77Zqnik++vJco=;
 b=MK+hFlAaXIsTI+K8s2yXjHvrpylY6PlBOzK2w+ILgUXPAH4EzX4gVnkQlCIYb+ACAe
 uLVp4FaMpy7luPcT48VC7vNZuYdpHIz5nBqfb1tnbUohs0OO0+W7jM8gr6PXrVgmUnEu
 EQuQOhtMIPvPwWEZr1h7exYgL8xU+iA8NcqZ1cBXSWekmy2BTimdc3cLVu7rNsARWexZ
 QTlawtrGAbKuFnHJT2CfMeEXG2O9z0y1XG0VE0KAYa7+U8RmZOJ/FFWW2kMSv7aqgZNF
 mqLNDY0gDezc1uBly77Iy8S97HOu4Ay1Plhn+OD818XpGIh0q+SM5sum+ugqc6csBjW6
 UWUQ==
X-Gm-Message-State: AAQBX9cLaBvDltZ2KX5lPEAOLtHqcI4T9TODhgjBpBE1p8QhB8Bhb7ZD
 Zasq6oEZG124g8o9oEpuJVZLW98FbcZeHa+8WSk10w==
X-Google-Smtp-Source: AKy350YaQVz1wjGKUyNZHlXqYFpw2kdjS+Sgqe2y5mQGrXyThLkKM3iPTeHdsD8UdaeJzMrBxzAyirCqaJIDymtnh3A=
X-Received: by 2002:a81:61c4:0:b0:555:dc97:8e76 with SMTP id
 v187-20020a8161c4000000b00555dc978e76mr172577ywb.44.1681976133614; Thu, 20
 Apr 2023 00:35:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230416131632.31673-1-aweber.kernel@gmail.com>
 <20230416131632.31673-3-aweber.kernel@gmail.com>
In-Reply-To: <20230416131632.31673-3-aweber.kernel@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 20 Apr 2023 09:35:22 +0200
Message-ID: <CACRpkdaTmHASz25uzDoeZBG2=e7XRLK67DENfAtCbaFp+AYnYA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm/panel: Add Samsung S6D7AA0 panel controller
 driver
To: Artur Weber <aweber.kernel@gmail.com>
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
Cc: devicetree@vger.kernel.org, sam@ravnborg.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, dri-devel@lists.freedesktop.org,
 krzysztof.kozlowski+dt@linaro.org, ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Artur,

thanks for your patch!

On Sun, Apr 16, 2023 at 3:16=E2=80=AFPM Artur Weber <aweber.kernel@gmail.co=
m> wrote:

> Initial driver for S6D7AA0-controlled panels, currently only for the
> LSL080AL02 panel used in the Samsung Galaxy Tab 3 8.0 family of tablets.
>
> It should be possible to extend this driver to work with other panels
> using this IC.
>
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
> Changed in v2:
>  - Removed unused panel_name property from desc struct

Overall this driver looks very good. I could merge it once the DT bindings
are ACKed by the DT maintainers and some minor stuff fixed.

Some comments below:

> +/* Manufacturer command set */
> +#define CMD_BL_CTL             0xc3
> +#define CMD_OTP_RELOAD         0xd0
> +#define CMD_PASSWD1            0xf0
> +#define CMD_PASSWD2            0xf1
> +#define CMD_PASSWD3            0xfc

Some drivers prefix these commands with "MCS" such as
MCS_BL_CTL.

MCS =3D Manufacturer Command Set (I think)

Some just name the identifers after the panel such as
s6d27a1 which has S6D27A1_RESCTL etc.

CMD seems a bit general to me and may be mistaken for
the actual DCS commands.

> +struct s6d7aa0 {
> +       struct drm_panel panel;
> +       struct mipi_dsi_device *dsi;
> +       struct gpio_desc *reset_gpio;
> +       struct regulator *enable_supply;
> +       const struct s6d7aa0_panel_desc *desc;
> +       bool prepared;

Skip this state variable, the core keeps track of whether the
panel is enabled or not.

> +static void s6d7aa0_reset(struct s6d7aa0 *ctx)
> +{
> +       gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +       msleep(50);

This first de-assertion is unnecessary isn't it?

The reset line will just be asserted longer if it is already asserted.

> +       gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +       msleep(50);
> +       gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +       msleep(50);
> +}

(...)

> +static int s6d7aa0_on(struct s6d7aa0 *ctx)
> +{
> +       struct mipi_dsi_device *dsi =3D ctx->dsi;
> +       struct device *dev =3D &dsi->dev;
> +       int ret;
> +
> +       dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;

(...)

> +static int s6d7aa0_off(struct s6d7aa0 *ctx)
> +{
> +       struct mipi_dsi_device *dsi =3D ctx->dsi;
> +       struct device *dev =3D &dsi->dev;
> +       int ret;
> +
> +       dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;

I haven't seen this mode flag MIPI_DSI_MODE_LPM set and
masked in other DSI panel drivers! Is this something we should
fix everywhere then? Or even something the core should be
doing?

Yours,
Linus Walleij
