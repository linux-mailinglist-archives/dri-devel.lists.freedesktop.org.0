Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3705E4D03EE
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 17:20:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8164E10E05F;
	Mon,  7 Mar 2022 16:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC3310E076
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 16:20:54 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 mg21-20020a17090b371500b001bef9e4657cso13772466pjb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Mar 2022 08:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=iNi/NuJgb3I9MZadAA/nBbNUy0J51g3KZrUkLORkuTg=;
 b=ncIyprolCtNzbtGaI8ZEmcOjRrndbUssGRkZqhTqAq1mncPCxyr8gFUJT+9I8xw3xp
 1KU0CXG+rNCoX6ko4mNtq8RrozoX0C5ZaIoyvWhz5WuIWD848QK3TinrNTgYk2H0pjay
 odWdVM4oK06IhmLm2ZcpZ0v15xUfdR5ZvVuPOnMWX7n6TXe5xpnAyVs3mM72TW+xblVn
 mMYYTaKxcR1doMK9EUB3YFnFb9X+xNpabSffaQfIwXi11CR5PVbT8n/PxmD8rD54BIKV
 YfQWUEZpZHA4EuNW66caBCVzlVAUu4DnBwAO3IJNM7eqAMTnXHCAWIcjn4NKJ8hHT1yf
 E2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=iNi/NuJgb3I9MZadAA/nBbNUy0J51g3KZrUkLORkuTg=;
 b=b2a0HzUTL3BK4rBiRgd7Cwb3ApZ3CtkdLpj59vU87AzoiJXCprlXmMUi6u/QiAT6ni
 ZXVzIVw4bdfcZj8SqjHoZ6hh4qmcJ2OP5fM2DNlpRhkUGf6wwUKh+AOR2aDPmtwrQjc8
 3F9IoHQJyX7ITiY9HNHX7xUTMWnGoAtSc5aGWk4BC5U8KQ0Kk98jUYrF8zS/jobxcsIt
 35/07xCqOnFuZmG92gOfwfhOqcj6GD5c4QhYytdwrXMrD+jlEouEmI6IPTHCAdvDxSZ1
 aW1WZsGGP254V7ss6NvbP/Hj125ZBR9T/QfUxfybEXzyXRbBPWN1xpoZtZNZ6rgrEvAu
 pY2A==
X-Gm-Message-State: AOAM5316dnC+CUNJrKbx+ci845GyUuLZvQLqvLfA3TQ5ujlEqEWjGvQL
 VHXfrF/oUoVJSeqiAwpH2j8LPAnNYM4sCcTNE+u8UA==
X-Google-Smtp-Source: ABdhPJwdaWZHVqYQDvsGi1XSWtL8PLKoWQ/6BDdpDRBxtNhslHD57lm6/C7wkiv2yOrgMygpsnOjzpRX6cHmYGRXWVI=
X-Received: by 2002:a17:902:f155:b0:151:8377:9a8e with SMTP id
 d21-20020a170902f15500b0015183779a8emr12909462plb.21.1646670054330; Mon, 07
 Mar 2022 08:20:54 -0800 (PST)
MIME-Version: 1.0
References: <20220307154558.2505734-1-robert.foss@linaro.org>
 <20220307154558.2505734-2-robert.foss@linaro.org>
In-Reply-To: <20220307154558.2505734-2-robert.foss@linaro.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 7 Mar 2022 17:20:43 +0100
Message-ID: <CAG3jFytBsDVe6z7QsEZCc2KN4HdyBCZKTQxuc01YUO4m-RkMmQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] Revert "dt-bindings:drm/bridge:anx7625:add vendor
 define"
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, 
 matthias.bgg@gmail.com, robert.foss@linaro.org, xji@analogixsemi.com, 
 hsinyi@chromium.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chen-Yu Tsai <wenst@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 7 Mar 2022 at 16:46, Robert Foss <robert.foss@linaro.org> wrote:
>
> This reverts commit a43661e7e819b100e1f833a35018560a1d9abb39.
> ---
>  .../display/bridge/analogix,anx7625.yaml      | 65 +------------------
>  1 file changed, 2 insertions(+), 63 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> index 1d3e88daca041..ab48ab2f4240d 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> @@ -43,70 +43,14 @@ properties:
>    vdd33-supply:
>      description: Regulator that provides the supply 3.3V power.
>
> -  analogix,lane0-swing:
> -    $ref: /schemas/types.yaml#/definitions/uint8-array
> -    minItems: 1
> -    maxItems: 20
> -    description:
> -      an array of swing register setting for DP tx lane0 PHY.
> -      Registers 0~9 are Swing0_Pre0, Swing1_Pre0, Swing2_Pre0,
> -      Swing3_Pre0, Swing0_Pre1, Swing1_Pre1, Swing2_Pre1, Swing0_Pre2,
> -      Swing1_Pre2, Swing0_Pre3, they are for [Boost control] and
> -      [Swing control] setting.
> -      Registers 0~9, bit 3:0 is [Boost control], these bits control
> -      post cursor manual, increase the [Boost control] to increase
> -      Pre-emphasis value.
> -      Registers 0~9, bit 6:4 is [Swing control], these bits control
> -      swing manual, increase [Swing control] setting to add Vp-p value
> -      for each Swing, Pre.
> -      Registers 10~19 are Swing0_Pre0, Swing1_Pre0, Swing2_Pre0,
> -      Swing3_Pre0, Swing0_Pre1, Swing1_Pre1, Swing2_Pre1, Swing0_Pre2,
> -      Swing1_Pre2, Swing0_Pre3, they are for [R select control] and
> -      [R Termination control] setting.
> -      Registers 10~19, bit 4:0 is [R select control], these bits are
> -      compensation manual, increase it can enhance IO driven strength
> -      and Vp-p.
> -      Registers 10~19, bit 5:6 is [R termination control], these bits
> -      adjust 50ohm impedance of DP tx termination. 00:55 ohm,
> -      01:50 ohm(default), 10:45 ohm, 11:40 ohm.
> -
> -  analogix,lane1-swing:
> -    $ref: /schemas/types.yaml#/definitions/uint8-array
> -    minItems: 1
> -    maxItems: 20
> -    description:
> -      an array of swing register setting for DP tx lane1 PHY.
> -      DP TX lane1 swing register setting same with lane0
> -      swing, please refer lane0-swing property description.
> -
> -  analogix,audio-enable:
> -    type: boolean
> -    description: let the driver enable audio HDMI codec function or not.
> -
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>
>      properties:
>        port@0:
> -        $ref: /schemas/graph.yaml#/$defs/port-base
> -        unevaluatedProperties: false
> +        $ref: /schemas/graph.yaml#/properties/port
>          description:
> -          MIPI DSI/DPI input.
> -
> -        properties:
> -          endpoint:
> -            $ref: /schemas/media/video-interfaces.yaml#
> -            type: object
> -            additionalProperties: false
> -
> -            properties:
> -              remote-endpoint: true
> -
> -              bus-type:
> -                enum: [1, 5]
> -                default: 1
> -
> -              data-lanes: true
> +          Video port for MIPI DSI input.
>
>        port@1:
>          $ref: /schemas/graph.yaml#/properties/port
> @@ -143,9 +87,6 @@ examples:
>              vdd10-supply = <&pp1000_mipibrdg>;
>              vdd18-supply = <&pp1800_mipibrdg>;
>              vdd33-supply = <&pp3300_mipibrdg>;
> -            analogix,audio-enable;
> -            analogix,lane0-swing = /bits/ 8 <0x14 0x54 0x64 0x74>;
> -            analogix,lane1-swing = /bits/ 8 <0x14 0x54 0x64 0x74>;
>
>              ports {
>                  #address-cells = <1>;
> @@ -155,8 +96,6 @@ examples:
>                      reg = <0>;
>                      anx7625_in: endpoint {
>                          remote-endpoint = <&mipi_dsi>;
> -                        bus-type = <5>;
> -                        data-lanes = <0 1 2 3>;
>                      };
>                  };
>
> --
> 2.32.0
>

Signed-off-by: Robert Foss <robert.foss@linaro.org>
