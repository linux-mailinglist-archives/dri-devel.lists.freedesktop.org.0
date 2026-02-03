Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAVmHFE8gmmVQgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 19:20:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DD4DD789
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 19:20:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9DDA10E33A;
	Tue,  3 Feb 2026 18:19:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SaW4h0+0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA21110E33A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 18:19:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3887B601E4;
 Tue,  3 Feb 2026 18:19:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C87E4C16AAE;
 Tue,  3 Feb 2026 18:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770142796;
 bh=7B0IqyFiAJCnuWiTN4bALRsmVJz8AG3X1eL0xm9SMRg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SaW4h0+0m9Rc2/LljbTgsNttztzpz587YPlZMnkhly0nPyQS5eQpaVDQFZV7zsGvd
 CSg15FaN6U1OXiAz+YiRQbpxciMBM8tYBL5U3D00ac6FeyqDaP1VEs962EXaiTbQsp
 kYZmvQPmA3daez1d5wZa7WvA+Utrchies2Qt8UCINJJSUwOXqI8A7KblsCZisPpeV+
 jnyDzJiONeXg7aIXl4HygTBi3lmjLNl7tN/lp0cjZTilV6Dy0CaxzytbaCZS8FCOF4
 UTDHDNc5MW0QcJjxFQ3wXEd7GJ/FG3zWlsT9V2FNe86kH7+GDcehKoR0+W6cSFPsql
 6g/sCBf7JnDwQ==
Date: Tue, 3 Feb 2026 12:19:56 -0600
From: Rob Herring <robh@kernel.org>
To: Igor Reznichenko <igor@reznichenko.net>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Kael D'Alcamo <dev@kael-k.io>,
 Kever Yang <kever.yang@rock-chips.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: Add Ilitek ILI9488
 panel controller
Message-ID: <20260203181956.GA3387284-robh@kernel.org>
References: <20260203054121.335441-1-igor@reznichenko.net>
 <20260203054121.335441-2-igor@reznichenko.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203054121.335441-2-igor@reznichenko.net>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,sntech.de,bp.renesas.com,kael-k.io,rock-chips.com,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:igor@reznichenko.net,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:heiko@sntech.de,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:mani@kernel.org,m:dev@kael-k.io,m:kever.yang@rock-chips.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,devicetree.org:url,0.0.0.0:email,reznichenko.net:email]
X-Rspamd-Queue-Id: C7DD4DD789
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 09:41:19PM -0800, Igor Reznichenko wrote:
> Add binding for the Ilitek ILI9488 panel controller which is found on
> the FocusLCDs E35GH-I-MW800-CB MIPI DSI panel. Add "focuslcds" to
> vendor-prefixes.yaml as it's a brandname and a website for
> Focus Display Solutions, Inc.
> 
> Signed-off-by: Igor Reznichenko <igor@reznichenko.net>

Missing Conor's Reviewed-by

> ---
>  .../display/panel/ilitek,ili9488.yaml         | 63 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>  2 files changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
> new file mode 100644
> index 000000000000..ea7449273022
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/ilitek,ili9488.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ilitek ILI9488 based MIPI-DSI panels
> +
> +maintainers:
> +  - Igor Reznichenko <igor@reznichenko.net>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - focuslcds,e35gh-i-mw800cb
> +      - const: ilitek,ili9488
> +
> +  reg:
> +    maxItems: 1
> +
> +  vci-supply: true
> +  iovcc-supply: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - vci-supply
> +  - iovcc-supply
> +  - reset-gpios
> +  - backlight
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "focuslcds,e35gh-i-mw800cb", "ilitek,ili9488";
> +            reg = <0>;
> +            vci-supply = <&reg_vci_panel>;
> +            iovcc-supply = <&reg_iovcc_panel>;
> +            reset-gpios = <&gpio3 6 GPIO_ACTIVE_LOW>;
> +            backlight = <&pwm_bl>;
> +
> +            port {
> +                panel_in: endpoint {
> +                    remote-endpoint = <&dsi_out>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index c7591b2aec2a..aa3a8fd67155 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -584,6 +584,8 @@ patternProperties:
>      description: Flipkart Inc.
>    "^focaltech,.*":
>      description: FocalTech Systems Co.,Ltd
> +  "^focuslcds,.*":
> +    description: Focus Display Solutions, Inc.
>    "^forlinx,.*":
>      description: Baoding Forlinx Embedded Technology Co., Ltd.
>    "^foursemi,.*":
> -- 
> 2.43.0
> 
