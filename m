Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEE1124142
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 09:13:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8636E250;
	Wed, 18 Dec 2019 08:13:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA1F6E9F7
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 14:24:53 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id F367421D28;
 Tue, 17 Dec 2019 09:24:50 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 17 Dec 2019 09:24:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=/m0POol9wORRwVPgBQM/4iedMaG
 mXANv7x8kJeqUrb4=; b=lYhsZzkTGt9J32KZTTP7D0gYwAJwdXrwWpwuEHVOMxe
 SWWDqg4IneI3mTs1ggR8DkEKVXdmaZV0GG670hgbGHZVaJss5/ALy4gjm0EOdRaU
 WrVLKRq8AAOg1FZYck19/Pyxqap2mb/JCPcgVVAvqUiCTjCcp7khRI4vUAN3c3/Y
 EQMFb/SHc+XRlhtLNcyF7ViKu3FEqniIlv3TPA2sKMaRa9ZgRzPtk/B8jOmp1InQ
 L59N3FNesndPjbPJnGDTvfuCEC9YKhrp5bv6Ns76YIjJXdJMm03beYOxTBXWuTAk
 M57StqIX/yz6dGUkmyhRK6JOB0CsDMqdgF7K2BCYg+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=/m0POo
 l9wORRwVPgBQM/4iedMaGmXANv7x8kJeqUrb4=; b=t65XaHKXhHF207bTgmCNCz
 NmByeuef5nFUMgAOpN6EaYnQXSQUqx/maAyDf+NTJvY6m6YGmxAlwdEvntXyABtT
 cWYzLzfzNdv/9Ct9PU2Fx2aAGcKDiaMU38r0USk5jv9Y6tUkoPKzv0lwZfKpvVH3
 rV+t18DtYXB7m56p2jAx7wFWZrDdoVpN66fT5fskONGywOJBM9B9olctEJs4P2FY
 WDt41qD5xv413RICFZvBraZYlT9aJ7fPKBlWJ4Ak19l8AhLcd6/tOxWAuPtiHWDq
 RQ+sMuVMGpwxbgtR3lLwqFuxzJ6LaxyDhvhoGFBCYcaL8nR/PruyecQmEveIrdOQ
 ==
X-ME-Sender: <xms:MOX4XWfubWKZ-q-s1fmqnhT6qHQPDCnENg0z9U9d2-IyAw1O6ikaJg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddtjedgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuffhomhgrih
 hnpeguvghvihgtvghtrhgvvgdrohhrghenucfkphepledtrdekledrieekrdejieenucfr
 rghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthhenucevlh
 hushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:MOX4Xd2WqOL3rpTNmp6HnyIy7jueNOuRI6qOATiU6vjOHh00FEhO9A>
 <xmx:MOX4XdGPhQp5bK9koyvOyCy7EjKawU3kP6j9W8LaF6Yo1gfxPMabsQ>
 <xmx:MOX4XXkVnQPp612QOBYEvgkffg65b1ubIOy4vga7wpdJgBHCmMdnSw>
 <xmx:MuX4XTKI8GldbJ1wyvw4N2Q_C-JVnLc8xY4WUWRCg3S5LShgTkI1Gg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0AAD980068;
 Tue, 17 Dec 2019 09:24:47 -0500 (EST)
Date: Tue, 17 Dec 2019 15:24:46 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v3 2/3] dt-bindings: display: panel: Add binding document
 for Xinpeng XPP055C272
Message-ID: <20191217142446.yexcmh5ox4336qmd@gilmour.lan>
References: <20191217140703.23867-1-heiko@sntech.de>
 <20191217140703.23867-2-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191217140703.23867-2-heiko@sntech.de>
X-Mailman-Approved-At: Wed, 18 Dec 2019 08:13:03 +0000
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Dec 17, 2019 at 03:07:02PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
>
> The XPP055C272 is a 5.5" 720x1280 DSI display.
>
> changes in v2:
> - add size info into binding title (Sam)
> - add more required properties (Sam)
>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/xinpeng,xpp055c272.yaml     | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml b/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
> new file mode 100644
> index 000000000000..2d0fc97d735c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/sony,acx424akp.yaml#

The ID doesn't match the file name.

Did you run dt_bindings_check?

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Xinpeng XPP055C272 5.5in 720x1280 DSI panel
> +
> +maintainers:
> +  - Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: xinpeng,xpp055c272
> +  reg: true
> +  backlight: true
> +  port: true

What is the port supposed to be doing?

> +  reset-gpios: true
> +  iovcc-supply:
> +     description: regulator that supplies the iovcc voltage
> +  vci-supply:
> +     description: regulator that supplies the vci voltage
> +
> +required:
> +  - compatible
> +  - reg
> +  - backlight
> +  - iovcc-supply
> +  - vci-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dsi@ff450000 {
> +        panel@0 {
> +            compatible = "xinpeng,xpp055c272";
> +            reg = <0>;
> +            backlight = <&backlight>;
> +            iovcc-supply = <&vcc_1v8>;
> +            vci-supply = <&vcc3v3_lcd>;
> +        };
> +    };
> +
> +...

Thanks!
Maxime
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
