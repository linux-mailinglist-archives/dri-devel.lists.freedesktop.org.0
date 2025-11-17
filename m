Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9D9C62A52
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 08:05:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85CAB10E2D5;
	Mon, 17 Nov 2025 07:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Zmf+GQm0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6FA10E2D5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 07:05:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 525E843F19;
 Mon, 17 Nov 2025 07:05:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 765EBC4CEF5;
 Mon, 17 Nov 2025 07:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763363136;
 bh=iU8ROMk83jPncCljG0G/Fsoi2HDIAUbVt2VmcnD6plU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zmf+GQm0pAZ6z6C3arkzoxE5KbyOToef7Sp5DndQnxXr8JmQ3033UwODfZZpK7eMG
 hNH2jlwIuNUC5NnJDZINgZJkjsQJmjVDQrUIWEvPazC8bT+gOyaYKNFP8Uis24UXEt
 mU5oJ0PrmJNp25ZaImcMpp9pIDc8xskK7aEelL5VGWSuUeOnhVqU2YCiwbVsYM36cB
 +17Rqg5eybYkDTX3XKBekgImKsuhhWCgQs0k0isOYITGYUfeEsHwvLyJGwVn6IGefN
 4doh0ptX0oiLvP/wADeR//qwwzH01kT6exkg/8xtX7yON6lMV/FrtXhlnhvW0RUQWm
 qytLrxDJMjTIQ==
Date: Mon, 17 Nov 2025 08:05:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kuba =?utf-8?Q?Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, parthiban@linumiz.com, paulk@sys-base.io
Subject: Re: [PATCH v3 4/6] dt-bindings: display: sun4i: Add D1s/T113 combo
 D-PHY bindings
Message-ID: <20251117-faithful-unique-millipede-d8bae5@kuoka>
References: <20251116134609.447043-1-kuba@szczodrzynski.pl>
 <20251116134943.447443-1-kuba@szczodrzynski.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251116134943.447443-1-kuba@szczodrzynski.pl>
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

On Sun, Nov 16, 2025 at 02:49:43PM +0100, Kuba Szczodrzy=C5=84ski wrote:
> The sun4i TCON needs a reference to the D-PHY in order to support LVDS
> on Allwinner D1s/T113.
>=20
> Add phys and phy-names to DT bindings.

Do not attach (thread) your patchsets to some other threads (unrelated
or older versions). This buries them deep in the mailbox and might
interfere with applying entire sets. See also:
https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/sub=
mitting-patches.rst#L830


>=20
> Signed-off-by: Kuba Szczodrzy=C5=84ski <kuba@szczodrzynski.pl>
> ---
>  .../bindings/display/allwinner,sun4i-a10-tcon.yaml          | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a1=
0-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10=
-tcon.yaml
> index 724d93b91..52589341f 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.=
yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.=
yaml
> @@ -115,6 +115,12 @@ properties:
>            - const: edp
>            - const: lvds
> =20
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    const: combo-phy

Drop phy suffix. Can a "phy" property hold reference to something else
than phy? You don't need names in the first place, you have only one
entry.

Best regards,
Krzysztof

