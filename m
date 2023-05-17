Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26843706510
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 12:25:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 006D210E3D7;
	Wed, 17 May 2023 10:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com
 [IPv6:2607:f8b0:4864:20::a2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD2310E3D7
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 10:25:50 +0000 (UTC)
Received: by mail-vk1-xa2f.google.com with SMTP id
 71dfb90a1353d-44ffef66dabso444976e0c.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 03:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1684319149; x=1686911149;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QzxZD48PY2DhxBTB/AhhijJZHAkj7rHk4JQ272Q2X+s=;
 b=hBGkseWpS5FW055SPb/V4102sqHaRDbGnnpBeApgHymo+Y0XxGQ5mW8x8bskNirjd1
 1nqsdnLtz6jLDHxyR+B1h/CnASnQswbUYJIGQp6gLL/eH26u4/FcmiEp+oXajc8s43c3
 GBP54xYmPceS8LxsdLdDOvLdX5IlK5sOKlgePhIYiR1t3IsHjwQ4TNBv+5a41rLbZSWW
 lDgD1AUfb1LEYvzURXKmRZiBcUaaiEXip5jrYG6KaZ0e0BPdawcuCO1WIqQDhsda80Rr
 m2VqmMq+mOnEfcjSk1WgQXHF34r33KXuUuzw/MtSmkAHmXpln1LSkRwQYpGQPPCM+onF
 RmkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684319149; x=1686911149;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QzxZD48PY2DhxBTB/AhhijJZHAkj7rHk4JQ272Q2X+s=;
 b=hTRSYik+tkvM8sp3dAmyvjNrSj/K5bt5qAyoBoi4Ant8XTc3nING5AV7slrSlcNGka
 4ZykaNZygqVoTxYYu3J+jem0Tf2izCphwfiEI9UkpHa36Q6b1L+DzyN1xFCFQItma5Oa
 DbxA7fp9PleGb+uY92M/++4pmias6ljD3trHjClBL+PFmvZ8/evIs/7eL3jjJo3par8T
 5MW1HvAqvKDmiUSEPzfTlKpTZJ2eysa+8Fq+QV8Y/fhHrrwgyVphMLi8o2sCgDJfSzv1
 mKEcx6jq0rkcdkVk5j+w77C5HAR7ZObEXPPhYRFn+47ZTPghLwgjA4Fpb91qophvdfqR
 Wd/w==
X-Gm-Message-State: AC+VfDwLGcPqFVMc1/mqvezEYfB1ZXrq1F2Ui1dsyvEHM88kprHyOMNB
 qXai6jD1KJtykgGxVupEb7clmPItjc4X2y/qHuhMuw==
X-Google-Smtp-Source: ACHHUZ44BqzmGxz3QHxrYPm16vIVE2NUwgPrK7cObMyOFiHcYfIUvs5KttvlZ6bXw8wpg58FmrjXdB681tQgnX4nUyw=
X-Received: by 2002:a1f:4e02:0:b0:44f:ba05:46cf with SMTP id
 c2-20020a1f4e02000000b0044fba0546cfmr14335258vkb.3.1684319149248; Wed, 17 May
 2023 03:25:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAO9szn18KsR0c+U8EEY1=xnmsKMxy6SEArMUic0z=aYJDVwWCQ@mail.gmail.com>
In-Reply-To: <CAO9szn18KsR0c+U8EEY1=xnmsKMxy6SEArMUic0z=aYJDVwWCQ@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 17 May 2023 11:25:34 +0100
Message-ID: <CAPY8ntCkZB3K2LoLcBseDcg=qNrOvZbYaCdiyNcR4R2Oo3sLoA@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: display: panel: add panel-mipi-dsi-bringup
To: =?UTF-8?B?UGF1bG8gUGF2YcSNacSH?= <pavacic.p@gmail.com>
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

Hi Paulo

On Tue, 16 May 2023 at 14:09, Paulo Pava=C4=8Di=C4=87 <pavacic.p@gmail.com>=
 wrote:
>
> Add dt-bindings documentation for panel-mipi-dsi-bringup which currently
> supports fannal,c3004 panel. Also added fannal to vendor-prefixes.
>
> v2 changelog:
>   - revised driver title, now describes purpose
>   - revised description, now describes hw
>   - revised maintainers, now has only 1 mail
>   - removed diacritics from commit/commit author
>   - properties/compatible is now enum
>   - compatible using only lowercase
>   - revised dts example
>   - modified MAINTAINERS in this commit (instead of driver commit)
>   - dt_bindings_check checked yml
>   - checkpatch warning fixed
>
> Signed-off-by: Paulo Pavacic <pavacic.p@gmail.com>
> ---
>  .../display/panel/panel-mipi-dsi-bringup.yaml | 54 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>  MAINTAINERS                                   |  6 +++
>  3 files changed, 62 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/display/panel/panel-mipi-dsi-bringup.ya=
ml
>
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-mipi-d=
si-bringup.yaml
> b/Documentation/devicetree/bindings/display/panel/panel-mipi-dsi-bringup.=
yaml
> new file mode 100644
> index 000000000000..c9e2b545657e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-mipi-dsi-brin=
gup.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/panel-mipi-dsi-bringup.=
yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MIPI DSI Bringup Panel Porting Bindings
> +
> +description: |
> +  MIPI DSI Bringup Panel porting bindings to be used for a collection of=
 panels
> +  from different manufacturers which don't require backlight control fro=
m the
> +  driver and have a single reset pin which is required to be passed as a=
n
> +  argument.

Don't we already have support for DSI displays that only need a single
reset pin via panel-simple? [1]

The bit that confuses me is that the driver patch [2] is using DSI DCS
commands to configure the panel - that differs from this dt binding
description of the panel only needing a reset pin.

Potentially there is gain in having a template DSI panel driver
available for reference, but this driver/binding appears to be trying
to act as a generic thing.

  Dave

[1] https://elixir.bootlin.com/linux/v6.3.2/source/drivers/gpu/drm/panel/pa=
nel-simple.c#L4605
[2] https://lists.freedesktop.org/archives/dri-devel/2023-May/404775.html


> +
> +maintainers:
> +  - Paulo Pavacic <pavacic.p@gmail.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +
> +  compatible:
> +    enum:
> +      # compatible must be listed in alphabetical order, ordered by comp=
atible.
> +      # The description in the comment is mandatory for each compatible.
> +
> +        # Fannal 480x800 panel
> +      - fannal,c3004
> +
> +  reg: true
> +  reset-gpios: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - reset-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    //example on IMX8MM where GPIO pin 9 is used as a reset pin
> +    mipi_dsi@32e10000 {
> +        panel@0 {
> +            compatible =3D "fannal,c3004";
> +            reg =3D <0>;
> +            pinctrl-0 =3D <&pinctrl_mipi_dsi_rst>;
> +            pinctrl-names =3D "default";
> +            reset-gpios =3D <&gpio1 9 GPIO_ACTIVE_LOW>;
> +        };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 82d39ab0231b..f962750f630a 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -462,6 +462,8 @@ patternProperties:
>      description: Facebook
>    "^fairphone,.*":
>      description: Fairphone B.V.
> +  "^fannal,.*":
> +    description: Fannal Electronics Co., Ltd
>    "^faraday,.*":
>      description: Faraday Technology Corporation
>    "^fastrax,.*":
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e0ad886d3163..46f988ee60bd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6566,6 +6566,12 @@ T:    git git://anongit.freedesktop.org/drm/drm-mi=
sc
>  F:    Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi=
.yaml
>  F:    drivers/gpu/drm/tiny/panel-mipi-dbi.c
>
> +DRM DRIVER FOR MIPI DSI BRINGUP
> +M:    Paulo Pavacic <pavacic.p@gmail.com>
> +S:    Maintained
> +C:    mipi-dsi-bringup:matrix.org
> +F:    Documentation/devicetree/bindings/display/panel/panel-mipi-dsi-bri=
ngup.yaml
> +
>  DRM DRIVER FOR MSM ADRENO GPU
>  M:    Rob Clark <robdclark@gmail.com>
>  M:    Abhinav Kumar <quic_abhinavk@quicinc.com>
> --
> 2.40.1
>
