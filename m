Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEBA5B6E83
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 15:42:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F60E10E710;
	Tue, 13 Sep 2022 13:42:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FBF410E710
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 13:42:08 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id lz22so27642550ejb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 06:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=vNF5waG2YVjvRugX1NRO9AbYEfgn4cMZgnF5Zi7NHsk=;
 b=DmFwQW95cSPfI7vP7jUPJnXJZhXAvTEn1ICDVXVvYpF40zHx/kHplL5gOKx3NKz7m+
 m+oiPPgqshXgLqQhON5Q9QP+vGDLrN0f9LKsvR548PHBpsal7+3b7Gf/EfJ+A24PyTIu
 XIANQmqgoJ9bCNh/4r9zXyS4vNuV/VqKVv4jRseTQQqwA7OsGIVKi4JyjuzuL6DqIWHI
 /PLHNJaQLbSNQ70QIZL7D1hsGOBriEoneR+y0dd0mHtp40bsbYcXYtfMpl5D28/05VIC
 t8/+vh8zFSlVlVJblj5dCczFqWChG6oT5V/CGs2cx0qiZQytdiS5rJzqk080w+DAawDY
 4gZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=vNF5waG2YVjvRugX1NRO9AbYEfgn4cMZgnF5Zi7NHsk=;
 b=UPmHtQysUbSgzlkzeePicN2MZpRXQ/yYUSbsmjq3y5Z0lL6WXvs+Oy6Qx6mWfBHq+4
 JVg1iQg/NgEtUgkT6ACoTT/Mag+0gYgepfmkwIZ+nm6Ok/MXAbBee3Mn7YNSkThyVUDK
 NQUUeEF6oEn6WVAuajK79iPwOV9Nu0DHVMb7L0IENQiHF4P9ADE0sF3TX2AF/c0LujVX
 PTN/jdvEIT26BP7fu+QvlG4Y9VrzWX/lK2keEQx8uGn9J72mNEr3Z/r2IpY89EPNOJxg
 8GD8RUdNFS+VzquGX+S7aBqBZLXeW/xToS/b9gpxHICzLsIbRtHzq7pTr15LcloYbyDv
 96tQ==
X-Gm-Message-State: ACgBeo0QqITX2YFbGXhpKI2hiAZsIs5hcbrGx1JWQ1rSrC4IFtjECPHb
 Gb1Zjcq5nivSc7a0xOcAsZF3UFFKaNbb0wq4A8a8kQ==
X-Google-Smtp-Source: AA6agR7jBaOzKcMl9lw4/YsXGvyyocpqKgbqURYp9oY9e2xb6ENMQ7CNcFiKUIrd3FK3jxi11B4+3T6oZf4JPAwjK6w=
X-Received: by 2002:a17:907:e9e:b0:77f:9688:2714 with SMTP id
 ho30-20020a1709070e9e00b0077f96882714mr4085240ejc.208.1663076527048; Tue, 13
 Sep 2022 06:42:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220908135940.299324-1-jagan@edgeble.ai>
 <20220908135940.299324-4-jagan@edgeble.ai>
In-Reply-To: <20220908135940.299324-4-jagan@edgeble.ai>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 Sep 2022 15:41:55 +0200
Message-ID: <CACRpkdZHu+_ffZEiJrY=aq2YbJGvTA87UP5xn0NzAketGS0EEw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm: panel: Add Jadard JD9365DA-H3 DSI panel
To: Jagan Teki <jagan@edgeble.ai>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 8, 2022 at 4:00 PM Jagan Teki <jagan@edgeble.ai> wrote:

> Jadard JD9365DA-H3 is WUXGA MIPI DSI panel and it support TFT
> dot matrix LCD with 800RGBx1280 dots at maximum.
>
> Add support for it.
>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Jagan Teki <jagan@edgeble.ai>

I wrote to Jadard and asked for a datasheet. They didn't even answer,
how rude.

> +#define _INIT_CMD_DCS(...)                                     \
> +       {                                                       \
> +               .type   = CMD_TYPE_DCS,                         \
> +               .data   = (char[]){__VA_ARGS__},                \
> +               .len    = sizeof((char[]){__VA_ARGS__})         \
> +       }                                                       \
> +
> +#define _INIT_CMD_DELAY(...)                                   \
> +       {                                                       \
> +               .type   = CMD_TYPE_DELAY,                       \
> +               .data   = (char[]){__VA_ARGS__},                \
> +               .len    = sizeof((char[]){__VA_ARGS__})         \
> +       }                                                       \

I think the _MACRO namespace (macros starting with underscore)
is reserved for the compiler.

Just call them something unique if you have to do this, such as
JD9365_INIT_CMD_DCS()

But I think you should do something more elaborate here, see
below.

> +static const struct jadard_init_cmd cz101b4001_init_cmds[] = {
> +       _INIT_CMD_DELAY(10),
> +
> +       _INIT_CMD_DCS(0xE0, 0x00),
> +       _INIT_CMD_DCS(0xE1, 0x93),
> +       _INIT_CMD_DCS(0xE2, 0x65),
> +       _INIT_CMD_DCS(0xE3, 0xF8),
> +       _INIT_CMD_DCS(0x80, 0x03),
> +       _INIT_CMD_DCS(0xE0, 0x01),

That's what we call a jam table.
(...)
> +       _INIT_CMD_DCS(0xE7, 0x0C),
> +
> +       _INIT_CMD_DELAY(120),

You introduce _INIT_CMD_DELAY() for a delay just before and
after the init sequence. Just open code these delays instead.

Then you can drop the .type field from the DCS sequences because
there is just one type.


> +       for (i = 0; i < desc->num_init_cmds; i++) {
> +               const struct jadard_init_cmd *cmd = &desc->init_cmds[i];
> +
> +               switch (cmd->type) {
> +               case CMD_TYPE_DELAY:
> +                       msleep(cmd->data[0]);
> +                       err = 0;
> +                       break;
> +               case CMD_TYPE_DCS:
> +                       err = mipi_dsi_dcs_write(dsi, cmd->data[0],
> +                                                cmd->len <= 1 ? NULL : &cmd->data[1],
> +                                                cmd->len - 1);
> +                       break;
> +               default:
> +                       err = -EINVAL;
> +               }
> +
> +               if (err < 0) {
> +                       DRM_DEV_ERROR(dev, "failed to write CMD#0x%x\n", cmd->data[0]);
> +                       return err;
> +               }
> +       }

So add explicit delays before and after this for-loop.

But then you probably see that after that you can simply replace this entire
for-loop with mipi_dsi_dcs_write_seq() so do that.

Grep in the kernel tree for examples of mipi_dsi_dcs_write_seq().

Yours,
Linus Walleij
