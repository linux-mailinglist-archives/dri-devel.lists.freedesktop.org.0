Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBDF6E9107
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 12:53:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8302F10EC02;
	Thu, 20 Apr 2023 10:53:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE0110EC02
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 10:53:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A509B61788;
 Thu, 20 Apr 2023 10:53:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 657A1C433EF;
 Thu, 20 Apr 2023 10:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681987981;
 bh=V4lco/y75rcMDuis7+i08wHWjGkkTzhwSeSpdM8bEtE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IEnvquVue6KQzUvYOcJOt8QHI7H/BcaDsfqYl04fjnygvZmk3LD6EZ4n8olDdgvWd
 CdX6XD2VXTBprs0C7ZGJAlKBNL3lMBB2Lo3OK+O/bx6Z88D/c7Qtrc/I8I4z/p8E8V
 JHXms1HYk+ZqJ2WM/gK+6XcmwYr1MBK2cc+JwRHtcuexEujV/ioJqM13wkThNF1MTv
 p4eTtde7QYCZZjsdIoTt0viJmlrZwUFWyfvdy1EGB84iBSL+5bNA2q7ioKU0xxaZgA
 MBc0bCQDl1hnSnCGKYUiRH8Brm2sRmKmGWxen4ZoM2QjYD1OswTpiN7+0H75KhnOnk
 MXtUm+OGqwj0w==
Message-ID: <cc24ede2-cc43-a923-419a-d07d33623643@kernel.org>
Date: Thu, 20 Apr 2023 12:52:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/3] dt-bindings: display: bridge: icn6211: Add video-mode
 property
To: Brandon Cheo Fusi <fusibrandon13@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20230418122205.16632-1-fusibrandon13@gmail.com>
 <20230418122205.16632-3-fusibrandon13@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230418122205.16632-3-fusibrandon13@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: marex@denx.de, tzimmermann@suse.de, sam@ravnborg.org,
 jagan@amarulasolutions.com, robert.foss@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/04/2023 14:22, Brandon Cheo Fusi wrote:
> Document the 'video-mode' property for specifying the DSI video mode and update
> the example.
> 
> Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

No tests will be run here as you ignored DT list (and other entries).

Please resend.

> ---
>  .../bindings/display/bridge/chipone,icn6211.yaml   | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
> index 5fb54375a..1f9335496 100644
> --- a/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
> @@ -36,6 +36,16 @@ properties:
>    enable-gpios:
>      description: Bridge EN pin, chip is reset when EN is low.
>  
> +  video-mode:

Is it a common property? Lack of vendor prefix suggests it, so where
does it come from?

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 0, 1, 2 ]
> +    description:
> +      DSI video mode.
> +      0 - burst mode
> +      1 - non-burst mode with sync pulse
> +      2 - non-burst mode with sync event.

Why not string?

> +      Defaults to 2.

default:
Don't repeat constraints in free form text.

> +
>    vdd1-supply:
>      description: A 1.8V/2.5V/3.3V supply that power the MIPI RX.
>  
> @@ -97,7 +107,8 @@ examples:
>        bridge@0 {
>          compatible = "chipone,icn6211";
>          reg = <0>;
> -        enable-gpios = <&r_pio 0 5 GPIO_ACTIVE_HIGH>; /* LCD-RST: PL5 */
> +        enable-gpios = <&r_pio 0 5 GPIO_ACTIVE_HIGH>;

Drop unrelated changes.

> +        video-mode = <0>;
>  
>          ports {
>            #address-cells = <1>;
> @@ -107,6 +118,7 @@ examples:
>              reg = <0>;
>  
>              bridge_in_dsi: endpoint {
> +              data-lanes = <1 2 3 4>;
>                remote-endpoint = <&dsi_out_bridge>;
>              };
>            };

Best regards,
Krzysztof

