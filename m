Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B912A72391F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 09:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3617310E2A2;
	Tue,  6 Jun 2023 07:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 023CB10E2A2
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 07:36:50 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-52cb8e5e9f5so4002745a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jun 2023 00:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686037010; x=1688629010;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nD/LkGWtI5flKQ+Ke2jMCbqz9Sr5XNRMirWL/QAprxA=;
 b=AcmFSCfdJkk9Hn7hgZC5mDeXrTp+dEiBAeSopwWhIpVuqmeml2QyMIXHyh+KVYJGfp
 lpoc7El2Ps0adh7C5569hmz7fR/33rQhMwylPaXozbK83Egh744tigif2cmQj5HKJYva
 Oaz1+2HOPMYwoHWfTiW+JXO451kD2H5QbejrwOC1sjZAoB70C+reunq2k//0tR5/dDOO
 r5WRDhytXwr0fbWnnEAGRpO0WZyo6XMJvq7oO82X3Io6jQeyPm3p/ZAsApmJmb0Oo+gs
 y9me+NeBEdnwJiaZW0hSWRTjAhnSHcTJj70+EqAom7xhYVuLApaUL0/k7c2FwTuZRKiI
 jLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686037010; x=1688629010;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nD/LkGWtI5flKQ+Ke2jMCbqz9Sr5XNRMirWL/QAprxA=;
 b=Fa+I64C1P7LK35lICqUv0oZVOFtIbo6SVK+HlKNpyjxDLdFApltVf66qXKD/+O0D+f
 xVbmGnUu+7pEwLYbooaJ+z7jrDX1yeivKaAOhNG1LRVXYlG21+9B+DsjmFcZn7zANr8f
 wJ2fvkqlXHg3vlNqAVa3kLSXZzayxu99tZUl+FyqxzY0ltigJShpfh+PcCrIsDYeRlc4
 FdXx2YUUjaD1HKASIeEqnFVknNKgR+6wNmCDgw5ICak9uJcFxJMcRPoQPYMFmzPgXREa
 D/Ft/UA3vihH749v2KGxBOIthdJI4E5Tc3lsNt/2DhMklWj/q6hpz6xsHG5mtY/C/90b
 Qq+w==
X-Gm-Message-State: AC+VfDwDO7eywUVh5fVr0iGitM7zi/TTPqdr/AAPAuKYeVLe60dyHysi
 l+2eUpMpeT+mf6tF6WrwlfOvisSWvpEKzpBviI0=
X-Google-Smtp-Source: ACHHUZ428r6gqxfQi0LZN59H7BZK1TBLgS52eAK3fHMnnNGvKJfr7euZ5zxRhhFrw6faArzEBTIeE6YDOATI6/h9tiI=
X-Received: by 2002:a17:902:e845:b0:1ac:820e:c34a with SMTP id
 t5-20020a170902e84500b001ac820ec34amr11893662plg.0.1686037009953; Tue, 06 Jun
 2023 00:36:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230605153539.497602-1-pavacic.p@gmail.com>
 <20230605153539.497602-4-pavacic.p@gmail.com>
 <4bb22e77-b3f0-be07-5e8a-442c3aa3fd48@linaro.org>
In-Reply-To: <4bb22e77-b3f0-be07-5e8a-442c3aa3fd48@linaro.org>
From: Paulo Pavacic <pavacic.p@gmail.com>
Date: Tue, 6 Jun 2023 09:36:39 +0200
Message-ID: <CAO9szn05edU_HZHVnREMZcwm6TbBa4psABoqSqLWghFc=KbV7w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/panel-fannal-c3003: Add fannal c3004 DSI panel
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

Hello Krzysztof,

uto, 6. lip 2023. u 09:14 Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> napisao je:
>
> On 05/06/2023 17:35, Paulo Pavacic wrote:
> > Fannal C3004 is a 480x800 display made by fannal that requires
> > DCS initialization sequences.
> >
> > Signed-off-by: Paulo Pavacic <pavacic.p@gmail.com>
> > ---
>
> > v3 changelog:
> >  - using generic mipi_dsi_dcs_write_seq
>
> This is marked as v2?

I have ruined numbering. At first this driver was named
panel-mipi-dsi-bringup and parts of it weren't handled under patchset.

>
> >  - removed success prints
> >  - removed some comments
> >  - simplified code/removed support for different panels
> >  - changed namespace from fann to fannal
> > v2 changelog:
> >  - renamed from panel-mipi-dsi-bringup
> >  - only one MAINTAINER e-mail
> > ---
> >  MAINTAINERS
>
>
> > +static int fannal_panel_probe(struct mipi_dsi_device *dsi)
> > +{
> > +     struct device *dev = &dsi->dev;
> > +     struct fannal_panel_data *panel_data;
> > +     int ret;
> > +
> > +     panel_data = devm_kzalloc(&dsi->dev, sizeof(*panel_data), GFP_KERNEL);
> > +
> > +     if (!panel_data)
> > +             return -ENOMEM;
> > +
> > +     panel_data->reset = devm_gpiod_get_optional(
> > +             dev, "reset", GPIOD_OUT_LOW | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
>
> dev should be in previous line
>
> Why this is nonexclusive? How many instances of same driver are
> expecting to get this on one system?
>
> > +
> > +     if (IS_ERR(panel_data->reset)) {
> > +             ret = PTR_ERR(panel_data->reset);
> > +             dev_err(dev,
> > +                     "error: probe: get reset GPIO: (%d) Check the fdt\n",
> > +                     ret);
>
> return dev_err_probe
>
> > +             return ret;
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
>
> So you leave the panel in reset state?
yes

> > +
> > +     drm_panel_init(&panel_data->panel, dev, &fannal_panel_funcs,
> > +                    DRM_MODE_CONNECTOR_DSI);
> > +     dev_set_drvdata(dev, panel_data);
> > +
> > +     drm_panel_add(&panel_data->panel);
> > +
> > +     ret = mipi_dsi_attach(dsi);
> > +     if (ret) {
> > +             drm_panel_remove(&panel_data->panel);
> > +             dev_err(dev, "error: probe fail: can't attach mipi_dsi!\n");
>
> No need to shout, skip exclamation mark.
>
>
> Best regards,
> Krzysztof
>

Thanks,
Paulo
