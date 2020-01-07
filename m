Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32599132FDC
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 20:51:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E3356E12F;
	Tue,  7 Jan 2020 19:51:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBAD46E12F
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 19:51:52 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9FFDA222D9
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 19:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578426712;
 bh=RkPkxHdDrVWTWUcfdQwi+Xu/cIE6Qm9n1GGBwAbqrOU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=koi+qwb0kk2y+oCdP0Dw98mzl4xq36YUSAFXGOyLpjw3rPhVaAqNQkNpliAkRlRAc
 Oz9G8Ol7VDw4pGmPMFyIDHdKBhvPvvxYdG/9MktPJjJG07xfCooqiaD4Z9jvOumxfn
 fWHn8BrXXvcLBdfhA2tSFa+HVpYV4TSGL0VONs+U=
Received: by mail-qv1-f52.google.com with SMTP id u10so409016qvi.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 11:51:52 -0800 (PST)
X-Gm-Message-State: APjAAAWeKJxK2hecly/fd4KRczR8D53rYpqkdiMANvS12gJ7X7/qb5b6
 VxzVjOf+ogmelEWViYK/ygd8P7TiulCvrJe8NA==
X-Google-Smtp-Source: APXvYqyqfnWHJxq4dKDL6Fu0FBWApL6bA5ye4/JPZIjQq52JfXuVn/kiI1xloPDFuRdmsfn8sK9L280z437O+o6RbOQ=
X-Received: by 2002:a0c:f6cd:: with SMTP id d13mr1028545qvo.20.1578426711761; 
 Tue, 07 Jan 2020 11:51:51 -0800 (PST)
MIME-Version: 1.0
References: <20200102101712.5085-1-sam@ravnborg.org>
 <20200102101712.5085-3-sam@ravnborg.org>
In-Reply-To: <20200102101712.5085-3-sam@ravnborg.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 7 Jan 2020 13:51:40 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+C8zOKhT1jg7RcuMqMTYUqTCeyw2e_vJrz6-ycxhHQ3w@mail.gmail.com>
Message-ID: <CAL_Jsq+C8zOKhT1jg7RcuMqMTYUqTCeyw2e_vJrz6-ycxhHQ3w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: one file of all simple DSI panels
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Yannick Fertre <yannick.fertre@st.com>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 2, 2020 at 4:17 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> To complement panel-simple.yaml, create panel-simple-dsi.yaml.
> panel-simple-dsi-yaml are for all simple DSP panels with a single
> power-supply and optional backlight / enable GPIO.
>
> Migrate panasonic,vvx10f034n00 over to the new file.
>
> The objectives with one file for all the simple DSI panels are:
>     - Make it simpler to add bindings for simple DSI panels
>     - Keep the number of bindings file lower
>     - Keep the binding documentation for simple DSI panels more consistent
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Yannick Fertre <yannick.fertre@st.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: devicetree@vger.kernel.org
> ---
>  .../display/panel/panasonic,vvx10f034n00.txt  | 20 ------
>  .../display/panel/panel-simple-dsi.yaml       | 67 +++++++++++++++++++
>  2 files changed, 67 insertions(+), 20 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml

Reviewed-by: Rob Herring <robh@kernel.org>

>
> diff --git a/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.txt b/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.txt
> deleted file mode 100644
> index 37dedf6a6702..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.txt
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -Panasonic 10" WUXGA TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "panasonic,vvx10f034n00"
> -- reg: DSI virtual channel of the peripheral
> -- power-supply: phandle of the regulator that provides the supply voltage
> -
> -Optional properties:
> -- backlight: phandle of the backlight device attached to the panel
> -
> -Example:
> -
> -       mdss_dsi@fd922800 {
> -               panel@0 {
> -                       compatible = "panasonic,vvx10f034n00";
> -                       reg = <0>;
> -                       power-supply = <&vreg_vsp>;
> -                       backlight = <&lp8566_wled>;
> -               };
> -       };
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> new file mode 100644
> index 000000000000..05c52390269e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/panel-simple-dsi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Simple DSI panels with a single power-supply
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Sam Ravnborg <sam@ravnborg.org>
> +
> +description: |
> +  This binding file is a collection of the DSI panels that
> +  requires only a single power-supply.
> +  There are optionally a backlight and an enable GPIO.
> +  The panel may use an OF graph binding for the association to the display,
> +  or it may be a direct child node of the display.
> +
> +  If the panel is more advanced a dedicated binding file is required.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +
> +  compatible:
> +    enum:
> +    # compatible must be listed in alphabetical order, ordered by compatible.
> +    # The description in the comment is mandatory for each compatible.

To answer your irc question, this is fine. You could do it like this instead:

oneOf:
  - description: ...
    const: compat-string
  - description: ...
    const: compat-string-2

The advantage is being able to extract 'description' if say you wanted
to generate documentation. Even so, I somewhat prefer how you have it.

> +
> +    # Panasonic 10" WUXGA TFT LCD panel

I'd align the # with the string to keep the list '-' a bit more
visible. IOW, 2 more spaces (before my next comment).

> +    - panasonic,vvx10f034n00

This should be indented 2 more spaces.

BTW, I extracted all the panels from my patch with this:

git show | grep -E '(title|const)' | sed -e 's/\+title:/  #/' -e 's/+
  const:/\-/'

There's a few with more than just 'title'.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
