Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A149183119
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 14:19:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 561866EAB7;
	Thu, 12 Mar 2020 13:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 209E56EABD
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 13:19:29 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DAC7620663
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 13:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584019169;
 bh=+MMUU8Xne5+2eAsxkj1dA3qRhr6aXsgwB+rUXSYPzE0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oBuxXTK+sOvN9xmpujdNIlPjbN6NqPJXk69SVa3NDAaf0FLoROg6xTNK5zAlm/mUZ
 EitYitoXQEaQ2Q8iluxS4/D6etYlloiHcUKqBho2dEyI9YGo7UGXuFSTU5CcyQ8JP+
 GB/KQk4RCmU037Rs58FLIATLrm38aCfCQZkw5tdE=
Received: by mail-qk1-f179.google.com with SMTP id e16so6034658qkl.6
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 06:19:28 -0700 (PDT)
X-Gm-Message-State: ANhLgQ06sLYk/iQwDwr1dAMgwvjA5uf0m9BRTi7xJpQTqMuFqjw/lE+A
 iWLYIsd5WMBMVb+LExKdw33WzvjjFaY6K5mE4Q==
X-Google-Smtp-Source: ADFU+vvNInz9AlidtVdZ0P289xaWlWPKA9exqV+sPaM3Dd1PlNwUy5fkfYtGWYhui8BnHxUJyQeSQb/1xHXWoohpI+Q=
X-Received: by 2002:a37:aa92:: with SMTP id t140mr6952437qke.119.1584019168038; 
 Thu, 12 Mar 2020 06:19:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200308115017.18563-1-sam@ravnborg.org>
 <20200308115017.18563-2-sam@ravnborg.org>
In-Reply-To: <20200308115017.18563-2-sam@ravnborg.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 12 Mar 2020 08:19:16 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL75eu49C9cB4pSekXxow8oFPcPAjTQ8GRhjEH8zkA2jw@mail.gmail.com>
Message-ID: <CAL_JsqL75eu49C9cB4pSekXxow8oFPcPAjTQ8GRhjEH8zkA2jw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] dt-bindings: display: fix panel warnings
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
Cc: devicetree@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 8, 2020 at 6:50 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Fix following type af warnings in the panel bindings:
>
> Warning (unit_address_vs_reg): /example-0/dsi/panel: node has a reg or ranges property, but no unit name
> Warning (unit_address_vs_reg): /example-0/dsi@ff450000: node has a unit name, but no reg property
>
> Removing the "@xxx" from the node name fixed first warning.
> Adding a missing reg property fixed the second warning
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../devicetree/bindings/display/panel/elida,kd35t133.yaml     | 2 +-
>  .../bindings/display/panel/leadtek,ltk500hd1829.yaml          | 2 +-
>  .../devicetree/bindings/display/panel/novatek,nt35510.yaml    | 4 ++--
>  .../devicetree/bindings/display/panel/orisetech,otm8009a.yaml | 2 +-
>  .../devicetree/bindings/display/panel/panel-dpi.yaml          | 2 +-
>  .../devicetree/bindings/display/panel/panel-simple-dsi.yaml   | 2 +-
>  .../devicetree/bindings/display/panel/raydium,rm68200.yaml    | 2 +-
>  .../devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml | 2 +-
>  8 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml b/Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml
> index 4bd74eaa61be..aa761f697b7a 100644
> --- a/Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml
> @@ -34,7 +34,7 @@ additionalProperties: false
>
>  examples:
>    - |
> -    dsi@ff450000 {
> +    dsi {
>          #address-cells = <1>;
>          #size-cells = <0>;
>          panel@0 {
> diff --git a/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml b/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
> index 4ebcea7d0c63..2c9b8aa34815 100644
> --- a/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
> @@ -34,7 +34,7 @@ additionalProperties: false
>
>  examples:
>    - |
> -    dsi@ff450000 {
> +    dsi {
>          #address-cells = <1>;
>          #size-cells = <0>;
>          panel@0 {
> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
> index 791fc9daa68b..73d2ff3baaff 100644
> --- a/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
> @@ -40,10 +40,10 @@ examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
>
> -    dsi@a0351000 {
> +    dsi {
>          #address-cells = <1>;
>          #size-cells = <0>;
> -        panel {
> +        panel@0 {
>              compatible = "hydis,hva40wv1", "novatek,nt35510";
>              reg = <0>;
>              vdd-supply = <&ab8500_ldo_aux4_reg>;
> diff --git a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml b/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
> index 6e6ac995c27b..4b6dda6dbc0f 100644
> --- a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
> @@ -39,7 +39,7 @@ required:
>
>  examples:
>    - |
> -    dsi@0 {
> +    dsi {
>        #address-cells = <1>;
>        #size-cells = <0>;
>        panel@0 {
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> index 5275d350f8cb..f63870384c00 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> @@ -48,7 +48,7 @@ additionalProperties: false
>
>  examples:
>    - |
> -    panel@0 {
> +    panel {
>          compatible = "osddisplays,osd057T0559-34ts", "panel-dpi";
>          label = "osddisplay";
>          power-supply = <&vcc_supply>;
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> index 8b60368a2425..cefe19b6bf44 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> @@ -50,7 +50,7 @@ required:
>
>  examples:
>    - |
> -    mdss_dsi@fd922800 {
> +    mdss_dsi {

dsi {

With that,

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
