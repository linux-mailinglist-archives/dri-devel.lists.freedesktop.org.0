Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0883232659D
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 17:36:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 352646E417;
	Fri, 26 Feb 2021 16:36:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 948996E417
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 16:36:22 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id b145so6610216pfb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 08:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nsvOAu55FgLPhCToArkAdRGmd43y7a+b+sjefBpof74=;
 b=wHthvJCA47mzp0GyO2hNpSjiMVwhSaeG1TJh+ToVxTuVf9I5588PEAwguEOImdCZmI
 wGW/GXpmbaQ+7Uv3XCtiK6jhhbh95Wi0lJYG90FMHhwygxxdPlnOXHg4ofF2d++yXWth
 WjKwVYBpxK6qjzjouT5YgFgy+6W4tLs0CfaOdh8FU0UItgLJw2qxGdTS8aVHlVWOhTEr
 Qb5EmkbN8nbESoMM+J/16eQ8QAtT7Hkq33+n7HmdJoezAW3ZPm9j6LPalw1LFqBUUJNe
 /KqUmeHKIkd8rbqW6jxSGsme7lsK6uUexa5cs35UOF0h7snhPF88CDu1TQUuCth4w0b/
 uZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nsvOAu55FgLPhCToArkAdRGmd43y7a+b+sjefBpof74=;
 b=tFsQCT/D88Vzno+hYvMm3SnN2YAi20kfu/oMgNqO3sXfsh2uaxOsfwFPWzYxI/zi3F
 nmQqMr7ScGuzZnAbP5wO+7JI8BWVJzGaebiQLSrKs3FvJMqGHYJ7IS+XY/TflBARjn0r
 wofws3kSkffkeXntr83ZfVYIauiRXzGglYMSEeZibVYlaJkx5ha7Jdz7xGCQAxL3/Tsa
 rlEzbtinRhV63aaxcXNpTxmTTY0DjuwQpxBsDtd8TnzBylhZT8w7+pH4pLBPxUplL8XB
 VQNp4PluPIrKGCpRA4VGd+J/m8Ug89YKrCId+TgbDp/6YbxIJdQE1VwDAOKRnn1To9t3
 oITQ==
X-Gm-Message-State: AOAM533TV6tn8b8DXLDTBQHLGS8+mLvHl43/TlM+dKdXLhCvX4X1d6Yy
 +jfJMbWQnckiNTPlpzTY4Rlx43OcIXsAGsfydQpHtA==
X-Google-Smtp-Source: ABdhPJzI5t1t6CVjbpJ/jYBjS/sGpFHq14yb4uuIzCsaZRWH5vV3GcNvACclb/rgNZRwFG9uqbl8nYuoLgHlhngXL5g=
X-Received: by 2002:a63:ee4b:: with SMTP id n11mr3638677pgk.265.1614357382184; 
 Fri, 26 Feb 2021 08:36:22 -0800 (PST)
MIME-Version: 1.0
References: <1614356086-19745-1-git-send-email-pthombar@cadence.com>
 <1614356118-21409-1-git-send-email-pthombar@cadence.com>
In-Reply-To: <1614356118-21409-1-git-send-email-pthombar@cadence.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 26 Feb 2021 17:36:11 +0100
Message-ID: <CAG3jFysryArs1DD3pgQAqO8AaW_+OH_Jpb4=o7uc93jaXFKF0Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: MHDP8546 bridge binding
 changes for HDCP
To: Parshuram Thombare <pthombar@cadence.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, kishon@ti.com,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, sjakhade@cadence.com,
 nikhil.nd@ti.com, mparab@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Parshuram,

Thanks for submitting this.

This series rebased on upstream-drm-misc/for-linux-next fails dt
binding verification.
$ make dt_binding_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml


On Fri, 26 Feb 2021 at 17:18, Parshuram Thombare <pthombar@cadence.com> wrote:
>
> Add binding changes for HDCP in the MHDP8546 DPI/DP bridge binding.
>
> Signed-off-by: Parshuram Thombare <pthombar@cadence.com>
> ---
>  .../display/bridge/cdns,mhdp8546.yaml         | 20 +++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
> index 63427878715e..89b4bf783c53 100644
> --- a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
> @@ -18,7 +18,7 @@ properties:
>
>    reg:
>      minItems: 1
> -    maxItems: 2
> +    maxItems: 3
>      items:
>        - description:
>            Register block of mhdptx apb registers up to PHY mapped area (AUX_CONFIG_P).
> @@ -26,13 +26,16 @@ properties:
>            included in the associated PHY.
>        - description:
>            Register block for DSS_EDP0_INTG_CFG_VP registers in case of TI J7 SoCs.
> +      - description:
> +          Register block of mhdptx sapb registers.
>
>    reg-names:
>      minItems: 1
> -    maxItems: 2
> +    maxItems: 3
>      items:
>        - const: mhdptx
>        - const: j721e-intg
> +      - const: mhdptx-sapb

The reg & reg-names changes appear to be introducing the failure.

>
>    clocks:
>      maxItems: 1
> @@ -53,6 +56,11 @@ properties:
>    power-domains:
>      maxItems: 1
>
> +  hdcp-config:
> +    maxItems: 1
> +    description:
> +      HDCP version supported. Bit [0]:HDCP2.2 [1]:HDCP1.4.
> +
>    interrupts:
>      maxItems: 1
>
> @@ -98,15 +106,15 @@ allOf:
>      then:
>        properties:
>          reg:
> -          minItems: 2
> +          minItems: 3
>          reg-names:
> -          minItems: 2
> +          minItems: 3
>      else:
>        properties:
>          reg:
> -          maxItems: 1
> +          maxItems: 2
>          reg-names:
> -          maxItems: 1
> +          maxItems: 2
>
>  required:
>    - compatible
> --
> 2.25.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
