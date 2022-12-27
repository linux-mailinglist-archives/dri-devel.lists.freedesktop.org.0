Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6188656DE2
	for <lists+dri-devel@lfdr.de>; Tue, 27 Dec 2022 19:16:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B27510E326;
	Tue, 27 Dec 2022 18:16:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6663210E326
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 18:16:07 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-417b63464c6so193407277b3.8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 10:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RMSJEr54reUvLsyEt0g6Qxy3nLHgzy6qj5b2+DqI7ho=;
 b=X+6ZSBqj6+QbPQ/oVoNJxqSfA4TEC1NlbNWMHYbLX17sbXX7sjNwWUfLlzPU+qg7J7
 cyoxzCJSk4kMxzsbz7iwcMfhEDd1QGCzgwWeazP+/u4h99ML7Y094RoQJu+UzHkTl+rz
 QY718wii4f30Ct1DdK1ghFj6XNrj1FEbwsnMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RMSJEr54reUvLsyEt0g6Qxy3nLHgzy6qj5b2+DqI7ho=;
 b=DxhNAbe2L/bQV1OQFVapZJ3vQbYLej4IwSDihEBjDCgZegl4puW0ZEs7EgpRWyfZ10
 S8kX1TiYdECktAoeRy1A89y3uj9E52jx2+xnyoQ4wW/8Cvv/PyZGrfs4kBZl6eKU4uqL
 4okI0uYaqtNWmcNzT++QVc0chD0B0cF32nn8B2jZ40v7QTdUS+esRHv5EBw0nG2qGejf
 ufgJnkKs+DaTmfvoD2UaHB3BegHEi+UHZSqfmVpO1vn8drD2j8RrQqxB1c37LGKbwDbG
 ov4z8W8oaARKBCJYiCf2uRklp6yrMuzzkEufOc3JbKURuG5HSePZti/JehISiNVlnNKr
 I3jA==
X-Gm-Message-State: AFqh2koDKfmj6ryAo99e3iivmyTY2qDisBqYk02VECUQBwwTWhtR10MT
 J1VuCNEafwJFtwiSGtFQusSiqPi2LT++itHBsJnFfA==
X-Google-Smtp-Source: AMrXdXs2qXVXbIeSOZPrUECD4HGZK+sdJA4II7CFyF3HP+ffttgcN305uaUmfBpTIQrHV0crlgYRUZzRx39vYS7ZhsM=
X-Received: by 2002:a0d:ff86:0:b0:47a:a05b:7d0d with SMTP id
 p128-20020a0dff86000000b0047aa05b7d0dmr839791ywf.230.1672164966844; Tue, 27
 Dec 2022 10:16:06 -0800 (PST)
MIME-Version: 1.0
References: <20221227110335.2923359-1-javierm@redhat.com>
 <20221227110335.2923359-2-javierm@redhat.com>
In-Reply-To: <20221227110335.2923359-2-javierm@redhat.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 27 Dec 2022 23:45:55 +0530
Message-ID: <CAMty3ZAaHKJ21D8mE=HU3D3KOGAiZ7vfmW_Hgc-E5JO5S+tMNA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: display: Add Himax HX8394 panel
 controller
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: devicetree@vger.kernel.org, Robert Mader <robert.mader@posteo.de>,
 Onuralp Sezer <thunderbirdtr@fedoraproject.org>,
 Neal Gompa <ngompa13@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tom Fitzhenry <tom@tom-fitzhenry.me.uk>,
 Martijn Braam <martijn@brixit.nl>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Ondrej Jirman <megi@xff.cz>,
 Peter Robinson <pbrobinson@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?Q?Kamil_Trzci=C5=84ski?= <ayufan@ayufan.eu>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 27, 2022 at 4:33 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> Add device tree bindings for panels based on the Himax HX8394 controller,
> such as the HannStar HSD060BHW4 720x1440 TFT LCD panel that is connected
> through a MIPI-DSI video interface.
>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>
> Changes in v3:
> - Fix example snippet for `make dt_binding_check` to pass (Krzysztof Kozlowski).
>
> Changes in v2:
> - Drop redundant "bindings" in subject (Krzysztof Kozlowski).
> - Drop "device tree bindings" in title (Krzysztof Kozlowski).
> - Put port next to other "true" properties (Krzysztof Kozlowski).
> - Add Krzysztof Kozlowski's Reviewed-by tag.
>
>  .../bindings/display/panel/himax,hx8394.yaml  | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
> new file mode 100644
> index 000000000000..fb1981cacfc8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/himax,hx8394.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Himax HX8394 MIPI-DSI LCD panel controller
> +
> +maintainers:
> +  - Javier Martinez Canillas <javierm@redhat.com>
> +
> +description:
> +  Device tree bindings for panels based on the Himax HX8394 controller,
> +  such as the HannStar HSD060BHW4 720x1440 TFT LCD panel connected with
> +  a MIPI-DSI video interface.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      # HannStar HSD060BHW4 5.99" 720x1440 TFT LCD panel
> +      - hannstar,hsd060bhw4

Parent controller can have a compatible where the associated panels
will be enum list.

Jagan.
