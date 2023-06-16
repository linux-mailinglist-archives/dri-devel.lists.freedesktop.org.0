Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC16B732C8E
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 11:57:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B2810E592;
	Fri, 16 Jun 2023 09:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AC4010E592
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 09:57:42 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-5535efe37b7so261376a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 02:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686909461; x=1689501461;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xSWPkl0GFydjtQjoGfD84JMg5QUAqadLvCPjoKyFk/g=;
 b=NI1iKvl3RMZOqooY3oDaUiNuG3ljgxd4rNh/b6GXzeq0LrnAbYqiWGW5dkYeHhF6Q0
 rgPnLKX35oso6ufA6urIqmAymiVx7S2rJ6y4WU9DNpVSqCNQM36yvM9LIJe/jheqa5FI
 ngbGI0HBdTEV2LjiX1ePJa5zE3kCQ221VhINFVDFTXk6zXYyBfh3zwe3xW1elT58Zu7I
 d3n9IqsiBrSfdgYEp0iDz0+BI1N1g/ku0IqjbcxBOYE2Td0A2zJG7707JtR+AIvWEEX/
 Xvtsb3SWvWxxA2IMhNguq9a6EyUwspbcb5JByF/vPAIbnTZitkV9ntyPkLMI3V+mii2m
 H7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686909461; x=1689501461;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xSWPkl0GFydjtQjoGfD84JMg5QUAqadLvCPjoKyFk/g=;
 b=cckEKRDIGRFeCLHFPpgoBM/ivzMXT49wqc/S91nEtgQzZYSpu2sT4LSDS7XN1CE8Yb
 3BG6G5kHdWCfhLAm09uSCZijGSC9GwwtzD9gTUmu95HKJvkt2nmwyEY+YqsNgF3ZKlJI
 MKYjilEZzkWXEoT2Ke4resWfUGsGKLiiUFXnl4RFBuB9kfxLNHPg8WjkGqJpanAUJrJu
 IOkG8v3KFLo5g+dGr3idQ7wkOL+6D3cOdDBc5aCy5ogPZsJXGgcpOeEZSZkiR16SMK0W
 go9BgPrG1o0Hqyfc+bgTcZAyBQRD2+z478z6V53sk4qP8dgzH5sbu1jNPwiGUXuBK8KV
 4jyg==
X-Gm-Message-State: AC+VfDwdCt0GbMt8+V7F2tBFHoGcSxjz1xT56dAc762HsCoMRUYO40IH
 BlI0dhk2uxH26K8cshwjKLpGSMAPE/Zkwj2Txpc=
X-Google-Smtp-Source: ACHHUZ6Xr7jEKTocO3zdpMURLNPKvIe0g4CLZ3O+v7Vi0S2kHoaUXSUaqAbwMWkTRwVpsbZ6aT3vLCDQxPIZ3EeC4cc=
X-Received: by 2002:a17:90a:898c:b0:256:cf39:afce with SMTP id
 v12-20020a17090a898c00b00256cf39afcemr1020399pjn.43.1686909461105; Fri, 16
 Jun 2023 02:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230607151127.1542024-1-pavacic.p@gmail.com>
 <20230607151127.1542024-4-pavacic.p@gmail.com>
 <CACRpkdbrEA54qmfTKSsFRG9ZS4u8hM6P5TXtOjRAiW+TD_v-fQ@mail.gmail.com>
In-Reply-To: <CACRpkdbrEA54qmfTKSsFRG9ZS4u8hM6P5TXtOjRAiW+TD_v-fQ@mail.gmail.com>
From: Paulo Pavacic <pavacic.p@gmail.com>
Date: Fri, 16 Jun 2023 11:57:29 +0200
Message-ID: <CAO9szn00vRFm+iM1m7KgkW0WRuKyJEgVU4tVx4f5tF6KPnE=2w@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] drm/panel-fannal-c3004: Add fannal c3004 DSI panel
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Linus,

thank you for the comments.

=C4=8Det, 15. lip 2023. u 21:55 Linus Walleij <linus.walleij@linaro.org> na=
pisao je:
>
> Hi Paulo,
>
> thanks for your patch!
>
> Overall this looks very good.
>
> I doubt that the display controller is actually by Fannal, but I guess
> you tried to find out? We usually try to identify the underlying display
> controller so the driver can be named after it and reused for more
> display panels.

Yes, of course, the controller is ST7701S.

>
> Some minor questions/nitpicks below.
>
> On Wed, Jun 7, 2023 at 5:11=E2=80=AFPM Paulo Pavacic <pavacic.p@gmail.com=
> wrote:
>
> > +static int fannal_panel_enable(struct drm_panel *panel)
> > +{
> > +       struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(panel->dev);
> > +
> > +       mipi_dsi_generic_write_seq(dsi, 0xFF, 0x77, 0x01, 0x00, 0x00, 0=
x13);
> > +       mipi_dsi_generic_write_seq(dsi, 0xEF, 0x08);
>
> Why is everything using mipi_dsi_generic_write_seq() instead of
> mipi_dsi_dcs_write_seq()?

Okay, I will replace it.

>
> Especially here, because 0x11 is certainly a command:
>
> > +       mipi_dsi_generic_write_seq(dsi, 0x11); //MIPI_DCS_EXIT_SLEEP_MO=
DE
>
> Instead use:
>
>     ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
>     if (ret)
>             return ret;
>
>
> > +       mipi_dsi_generic_write_seq(dsi, 0x29); //MIPI_DCS_SET_DISPLAY_O=
N
>
> Instead use:
>
>     ret =3D mipi_dsi_dcs_set_display_on(dsi);
>     if (ret)
>             return ret;
>

Okay I will replace all commands with a functions found here:
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_mipi_dsi=
.c#L995

> Yours,
> Linus Walleij

Best regards,
Paulo
