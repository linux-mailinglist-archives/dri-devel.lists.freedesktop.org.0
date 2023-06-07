Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFB1726171
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 15:38:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B9ED10E051;
	Wed,  7 Jun 2023 13:38:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FFE310E051
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 13:38:32 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-39c6a912cc5so464648b6e.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 06:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686145112; x=1688737112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=u3OWCbf5H61Lfol0csF8z8CFfOPa3TQ/ObPqUdE2SX4=;
 b=KAmyP/ini8v90wI/GFZqjfjS31ontpl+4VtaLOvLQs94la+/W4d9Fgv5fr8QackOCJ
 dCNzrA2qR/pEvumBrxz0oqTIZVZ+PuMVH4dK6hjoAeYbEhFyYdMWhPdxCJuTCO4Pt61N
 KeVlg5IRdU2msZJAvv8Gb4dOmYR7j4xw1unq1tULmlpfzSQ5F1Q1EoJcUN5GeYxGO+gu
 wcTfCKT13c8g+KWWiPZBO4TyhPOX5qZu5hdKXbCCKmlbCSomMQskSw5aBw0A15aYCfUI
 gQHacmh4BgpzFGIDk6OEzpSN2aM5g9LZ1bUzti2nqUhrJfOyONPnA6EAN1ZuPVNJHhmq
 38Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686145112; x=1688737112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u3OWCbf5H61Lfol0csF8z8CFfOPa3TQ/ObPqUdE2SX4=;
 b=eGnw82oT5CrHKRRueiEZy3c9453kYnMnP13mpulDWBVkcoBCK6iGKoR77sctqRyDZm
 794N5+sljvyzywUfbvyqKQ/wFuKeIg4thbVnkM8B5inZDbTToN29VDADDxq0//a0nmqv
 xu/PwvbsGmflZc5cKYY4ULKgo02b34fLiwYg/Frr0mSI8UVeL4/UqL3ICyVDnWdeeolz
 2AB7KTqJXi7oujeV/UPIYYCINzjy8dwUvSGZ8BzzBB+sG8DYGr70R8R1wzw3POh3A3Co
 wkmApeFJDxVrO8sQ0zDsUU2Kp2bLoqtPGSn/uw47GH576Y8f3TsjCVlUjoJydsySSyn3
 QCog==
X-Gm-Message-State: AC+VfDyuoHBkkW22WRZhTWAD5ct47GTQsJFQE41yGUP8Ujs1vnNtiqRl
 so37qbOC/GkFzIqOgP3C/pQOGdecY5fEyxY5/44=
X-Google-Smtp-Source: ACHHUZ7ykAOu9yzsGVGgnF/U30QPe7I5TCv2TcaCoYPjApr8wINN1s7hJpFNRgkwQTTnByd7Lu0vdiqoVuvkrNRp8LE=
X-Received: by 2002:a05:6808:b0d:b0:39a:bc60:adf2 with SMTP id
 s13-20020a0568080b0d00b0039abc60adf2mr5640664oij.24.1686145111699; Wed, 07
 Jun 2023 06:38:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230606140757.818705-1-pavacic.p@gmail.com>
 <20230606140757.818705-4-pavacic.p@gmail.com>
 <dfe2c108-0268-c4d0-226e-b3d2bc8c3369@linaro.org>
In-Reply-To: <dfe2c108-0268-c4d0-226e-b3d2bc8c3369@linaro.org>
From: Paulo Pavacic <pavacic.p@gmail.com>
Date: Wed, 7 Jun 2023 15:38:20 +0200
Message-ID: <CAO9szn3PyQQRKsxdsOrmVNMP2xuvN4_dHwb1_TWEqmhnr3TLPA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] drm/panel-fannal-c3004: Add fannal c3004 DSI panel
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

uto, 6. lip 2023. u 16:45 Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> napisao je:
>
> On 06/06/2023 16:07, Paulo Pavacic wrote:
> > Fannal C3004 is a 480x800 display made by fannal that requires
> > DCS initialization sequences.
> >
> > Signed-off-by: Paulo Pavacic <pavacic.p@gmail.com>
> > ---
> > v4 changelog:
> >  - formatting and style changes
>
> Are you sure? I see other changes - removal of some code, handling
> errors and GPIO.
>
> >  - change community room
>
> What does it mean? Where is this change in this patch?
>
> ...
>
> > +
> > +static const struct drm_panel_funcs fannal_panel_funcs = {
> > +     .prepare = fannal_panel_prepare,
> > +     .unprepare = fannal_panel_unprepare,
> > +     .enable = fannal_panel_enable,
> > +     .disable = fannal_panel_disable,
> > +     .get_modes = fannal_panel_get_modes,
> > +};
> > +
> > +static int fannal_panel_probe(struct mipi_dsi_device *dsi)
> > +{
> > +     struct device *dev = &dsi->dev;
> > +     struct fannal_panel_data *panel_data;
> > +     int ret;
> > +
> > +     panel_data = devm_kzalloc(&dsi->dev, sizeof(*panel_data), GFP_KERNEL);
> > +
>
> Drop blank line.
>
> > +     if (!panel_data)
> > +             return -ENOMEM;
> > +
> > +     panel_data->reset =
>
> You have wrong wrapping here. devm_gpiod_get_optional() goes after =.

I'm not sure why, but clang-format makes it that way. I'm using this
style: https://raw.githubusercontent.com/torvalds/linux/master/.clang-format
Do you have some other style?

>
> > +             devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> > +
>
> Drop blank line.
>
> > +     if (IS_ERR(panel_data->reset)) {
> > +             return dev_err_probe(
> > +                     dev, PTR_ERR(panel_data->reset),
> > +                     "error: probe: get reset GPIO: (%d) Check the fdt\n",
> > +                     ret);
> > +     }
> > +
> > +     mipi_dsi_set_drvdata(dsi, panel_data);
> > +
> > +     dsi->format = MIPI_DSI_FMT_RGB888;
> > +     dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS |
> > +                       MIPI_DSI_MODE_VSYNC_FLUSH | MIPI_DSI_MODE_VIDEO_HSE |
> > +                       MIPI_DSI_MODE_NO_EOT_PACKET |
> > +                       MIPI_DSI_MODE_VIDEO_SYNC_PULSE | MIPI_DSI_MODE_VIDEO;
> > +     dsi->lanes = 2;
> > +
> > +     gpiod_set_value_cansleep(panel_data->reset, 1);
> > +
> > +     drm_panel_init(&panel_data->panel, dev, &fannal_panel_funcs,
> > +                    DRM_MODE_CONNECTOR_DSI);
> > +     dev_set_drvdata(dev, panel_data);
> > +
> > +     drm_panel_add(&panel_data->panel);
> > +
>
>
> Best regards,
> Krzysztof
>

Thanks,
Paulo
