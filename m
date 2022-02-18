Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 627684BB4CB
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 10:01:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D0D10EBFF;
	Fri, 18 Feb 2022 09:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD5C10EBFF
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 09:01:44 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id h16so6734776iol.11
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 01:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U8AEdmITUIDJSI02jf8n1UdQu5Z2kTq1rYcS4yrbyjQ=;
 b=g10Pv4nLzUwZQKqmdv9zn0DbJnh7QDler3SfEmWHSCPPNMePstfRf6EIz8T9g1k3q5
 Y2fDM52ypuGLRKkJmSK8e8XuD77uA4DFttbqXAc/496wXFtVCXCxiWmyT03EMukXyZBS
 3Bz6lISNM4D11i14X4GbTJlF6wTstAeoWVTls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U8AEdmITUIDJSI02jf8n1UdQu5Z2kTq1rYcS4yrbyjQ=;
 b=zNm3i5x9JSIXQmA9OOmOpOnPd7vwNX8zz6lHK1+W1cbUVwjJhRcJhUptyagGq7f/gL
 UAh2fgpPdyZCuz3JMulYv2XevgNg2dN9phLNX1G7I1bgLaV0WR3oPk/0bHHGxqkViYl6
 g7i4kSh9B/PAhRdXjYaYOrJUTzycmNC8LTM2G1BF7Mmvy4PmoBBMTubtretDecxWF30h
 ochjBbGTQz9bKKuWQk60dw4VbLISHkEDPs7ATvqU1W0UcR1LOQux9agBUP7/mg6C/nSQ
 O3vAIgMd3pyy98rYlomO1hgb3BS05hmwKbK7hCP1+2DQEbjLU3FJ/miv94RrdVCtKd5R
 UUXQ==
X-Gm-Message-State: AOAM532/oMTXZMakUGOZmDoLIzTQdv0JSo4hH5hS5h9kKenPOWkq/s+l
 G+xeRMzNsaz1UiphsG1+peIJrFcJyyPF+WloohRFuw==
X-Google-Smtp-Source: ABdhPJwkHQMn7rS7t8JjEUIDpKt6F6hXh8261rU+mdXf4Nr0q63mzDPdxRNHBcKlGfW12wJ7ty3/ZQUDZVuxWVb6Ol8=
X-Received: by 2002:a05:6602:29cb:b0:638:d53c:d212 with SMTP id
 z11-20020a05660229cb00b00638d53cd212mr4869652ioq.167.1645174903774; Fri, 18
 Feb 2022 01:01:43 -0800 (PST)
MIME-Version: 1.0
References: <20220218063610.1530630-1-rexnie3@gmail.com>
In-Reply-To: <20220218063610.1530630-1-rexnie3@gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 18 Feb 2022 17:01:17 +0800
Message-ID: <CAJMQK-gz5ha232M22+wEY8Bid4oHOESJPk3vRXDU_dzAeiaEQA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Add panel-edp: add lcd innolux,n140hca-eac
To: Rex Nie <rexnie3@gmail.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 spanda@codeaurora.org, dri-devel@lists.freedesktop.org, dianders@chromium.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 18, 2022 at 2:36 PM Rex Nie <rexnie3@gmail.com> wrote:
>
> innolux,n140hca-eac is a eDP-based LCD panel. This panel has 1920x1080
> resolution in 14-inch TFT panel.
>
> Signed-off-by: Rex Nie <rexnie3@gmail.com>
> ---
>  .../display/panel/innolux,n140hca-eac.yaml    | 43 +++++++++++++++++++
>  drivers/gpu/drm/panel/panel-edp.c             | 26 +++++++++++
>  2 files changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/innolux,n140hca-eac.yaml
>
Hi Rex,

Please split yaml and driver into different patches.
You don't need to create a new binding for innolux,n140hca-eac.yaml.
You can add the compatible into panel-simple.yaml. Check
innolux,n125hce-gn1 for example.

> diff --git a/Documentation/devicetree/bindings/display/panel/innolux,n140hca-eac.yaml b/Documentation/devicetree/bindings/display/panel/innolux,n140hca-eac.yaml
> new file mode 100644
> index 000000000000..5493e383c97c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/innolux,n140hca-eac.yaml
> @@ -0,0 +1,43 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/innolux,n140hca-eac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Innolux N140HCA-EAC 14 inch eDP 1080p display panel
> +
> +maintainers:
> +  - Sandeep Panda <spanda@codeaurora.org>
> +  - Douglas Anderson <dianders@chromium.org>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: innolux,n140hca-eac
> +
> +  enable-gpios: true
> +  power-supply: true
> +  backlight: true
> +  no-hpd: true
> +
> +required:
> +  - compatible
> +  - power-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    panel_edp: panel-edp {
> +        compatible = "innolux,n140hca-eac";
> +        enable-gpios = <&pio 96 GPIO_ACTIVE_HIGH>;
> +        power-supply = <&pp3300_disp_x>;
> +        backlight = <&backlight_lcd0>;
> +        no-hpd;
> +    };
> +
> +...
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index f7bfcf63d48e..f5f9c9cb26ba 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1330,6 +1330,29 @@ static const struct panel_desc innolux_n125hce_gn1 = {
>         },
>  };
>
> +static const struct display_timing innolux_n140hca_eac_timing = {
> +       .pixelclock = { 72600000, 76420000, 80240000 },
> +       .hactive = { 1920, 1920, 1920 },
> +       .hfront_porch = { 80, 80, 80 },
> +       .hback_porch = { 190, 190, 190 },
> +       .hsync_len = { 60, 60, 60 },
> +       .vactive = { 1080, 1080, 1080 },
> +       .vfront_porch = { 6, 6, 6 },
> +       .vback_porch = { 38, 38, 38 },
> +       .vsync_len = { 8, 8, 8 },
> +       .flags = DISPLAY_FLAGS_VSYNC_LOW | DISPLAY_FLAGS_HSYNC_LOW,
> +};
> +
> +static const struct panel_desc innolux_n140hca_eac = {
> +       .timings = &innolux_n140hca_eac_timing,
> +       .num_timings = 1,
> +       .bpc = 6,
> +       .size = {
> +               .width = 309,
> +               .height = 174,
> +       },
> +};
> +
>  static const struct drm_display_mode innolux_p120zdg_bf1_mode = {
>         .clock = 206016,
>         .hdisplay = 2160,
> @@ -1750,6 +1773,9 @@ static const struct of_device_id platform_of_match[] = {
>         }, {
>                 .compatible = "innolux,n125hce-gn1",
>                 .data = &innolux_n125hce_gn1,
> +       }, {
> +               .compatible = "innolux,n140hca-eac",
> +               .data = &innolux_n140hca_eac,
>         }, {
>                 .compatible = "innolux,p120zdg-bf1",
>                 .data = &innolux_p120zdg_bf1,
> --
> 2.25.1
>
