Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2CAA7C405
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 21:44:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE1A310E28B;
	Fri,  4 Apr 2025 19:44:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cknow.org header.i=@cknow.org header.b="DQXOMEEl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 403 seconds by postgrey-1.36 at gabe;
 Fri, 04 Apr 2025 19:43:57 UTC
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com
 [95.215.58.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B8AF10E28B
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 19:43:57 +0000 (UTC)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
 t=1743795430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j5iIDPsMyXuzJK77wAJ/JXOO40jyIXq/LxkNUBl62XQ=;
 b=DQXOMEElFWKrqzc82mZ22U473YVAh7jYVz30PuKpuDL7ShqgdxTy23hx+dHmzeji0rxpqu
 aMHDmf+1Gfg336iJLkjDx2PPPwPr7Qr0rhYThNk4b/UyCCXDLDx047eJDNsTSpawOLZlP/
 FWj2tWol/jaD1Q3lh/y5Ff7w4LId2FIeXgC8UayYsJIDdBIN90bRvk/E6ZWHbgaKbgMXdD
 CEfS7wmw0TRJ80J80ZOOWHRVFLrwBuvbe9rGwAqU344CLe6jq90KOZtF3QVr6KnJG+ORCq
 D7K6TYOblr5rnCLYQyTxejqUpQmTe8bj6iBcQrgGg86b7V8tgGBh8YZe7ByPYw==
Content-Type: multipart/signed;
 boundary=1d0b1c9b765b5909805ad66ccb19fe973b8f7f377113664bb82b4c67afb6;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Fri, 04 Apr 2025 21:36:58 +0200
Message-Id: <D8Y3VW5489RZ.3IXJX79M1ZK8O@cknow.org>
Cc: <neil.armstrong@linaro.org>, <sebastian.reichel@collabora.com>,
 <stephen@radxa.com>, <dri-devel@lists.freedesktop.org>,
 <hjc@rock-chips.com>, <mripard@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <yubing.zhang@rock-chips.com>, <naoki@radxa.com>,
 <Laurent.pinchart@ideasonboard.com>, "Andy Yan" <andy.yan@rock-chips.com>,
 <krzk+dt@kernel.org>, <robh@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 1/9] dt-bindings: display: rockchip: Add schema for
 RK3588 DPTX Controller
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Andy Yan" <andyshrk@163.com>, <dmitry.baryshkov@oss.qualcomm.com>,
 <heiko@sntech.de>
References: <20250403033748.245007-1-andyshrk@163.com>
 <20250403033748.245007-2-andyshrk@163.com>
In-Reply-To: <20250403033748.245007-2-andyshrk@163.com>
X-Migadu-Flow: FLOW_OUT
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

--1d0b1c9b765b5909805ad66ccb19fe973b8f7f377113664bb82b4c67afb6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Apr 3, 2025 at 5:37 AM CEST, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
>
> The Rockchip RK3588 SoC integrates the Synopsys DesignWare DPTX
> controller. And this DPTX controller need share a USBDP PHY with
> the USB 3.0 OTG controller during operation.
>
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>
> ---
>
> (no changes since v2)
>
> Changes in v2:
> - Link to V1: https://lore.kernel.org/linux-rockchip/20250223113036.74252=
-1-andyshrk@163.com/
> - Fix a character encoding issue
>
>  .../display/rockchip/rockchip,dw-dp.yaml      | 150 ++++++++++++++++++
>  1 file changed, 150 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/ro=
ckchip,dw-dp.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,=
dw-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw=
-dp.yaml
> new file mode 100644
> index 0000000000000..a8a0087179972
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.y=
aml
> @@ -0,0 +1,150 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip DW DisplayPort Transmitter
> +
> +maintainers:
> +  - Andy Yan <andy.yan@rock-chips.com>
> +
> +description: |
> +  The Rockchip RK3588 SoC integrates the Synopsys DesignWare DPTX contro=
ller
> +  which is compliant with the DisplayPort Specification Version 1.4 with=
 the
> +  following features:
> +
> +  * DisplayPort 1.4a
> +  * Main Link: 1/2/4 lanes
> +  * Main Link Support 1.62Gbps, 2.7Gbps, 5.4Gbps and 8.1Gbps
> +  * AUX channel 1Mbps
> +  * Single Stream Transport(SST)
> +  * Multistream Transport (MST)
> +  * Type-C support (alternate mode)
> +  * HDCP 2.2, HDCP 1.3
> +  * Supports up to 8/10 bits per color component
> +  * Supports RBG, YCbCr4:4:4, YCbCr4:2:2, YCbCr4:2:0
> +  * Pixel clock up to 594MHz
> +  * I2S, SPDIF audio interface
> +
> +allOf:
> +  - $ref: /schemas/sound/dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - rockchip,rk3588-dp
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Peripheral/APB bus clock
> +      - description: DisplayPort AUX clock
> +      - description: HDCP clock
> +      - description: I2S interface clock
> +      - description: SPDIF interfce clock

s/interfce/interface/

Cheers,
  Diederik

> +
> +  clock-names:
> +    items:
> +      - const: apb
> +      - const: aux
> +      - const: hdcp
> +      - const: i2s
> +      - const: spdif

--1d0b1c9b765b5909805ad66ccb19fe973b8f7f377113664bb82b4c67afb6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZ/A03gAKCRDXblvOeH7b
bpJBAQDvx5djc7YfaKYs4IcJeoXUVMwHtmKxjI+9dTI+U5l82wD/TCM5+lKSSL8X
Ub8SCGu2YvEfoUy58ySWw+QHY8eQfwE=
=IJxa
-----END PGP SIGNATURE-----

--1d0b1c9b765b5909805ad66ccb19fe973b8f7f377113664bb82b4c67afb6--
