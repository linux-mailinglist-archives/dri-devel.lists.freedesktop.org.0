Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8982D82C4CD
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 18:34:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 421D410E146;
	Fri, 12 Jan 2024 17:34:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D15FC10E146
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 17:34:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1705080852; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=W3GWy0FmIaj8bnyQOLBzXX83ySwtjGcplbG/RlF6oXx9qygnBd9EMgXtiadN4VCuYL
 Vzb9K/1Q4zEh0B7XcKv8F2Sx4FijwnMPXysHfKJDCuQG0VCoTY5bqyISD5X10Sklu//B
 6VkzB1eAyWBDr/bYsxdCjCk7edGU3pgaP2hEzvpyZbAxOha7gyG3pLDtiV5WNhRfEYbL
 TDD/pLVM6nJvYv+XcCrZwcaohlv+M2+F2XzRIFeiekgqkBmiLXVXMh3jQ6/CCRVmglED
 VgmepBQlqLq+ZF6ebJlWo7K1uGUcBpy8sQQyJjroV+U5685/yWLccmDVI8r77ioDgMW0
 JoMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1705080852;
 s=strato-dkim-0002; d=strato.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=x1r68xA9wRZ4ANIBi9hA9+/f2i2/5reMcctFU/rKIWM=;
 b=VDcJUmHB6n+dNWMqrBgIeSm07uZuiZ3Lo4YHM+4lHTEf/fShWCuTsnhOvGLLQPDnuX
 DVAPLYAUhm05iR1fke6fvyGt2yjAOY9M0JpWsM0G7ZDb7NOVtKdS5okSvg27EKDAjxe4
 EZA65KUjsuxqrlxq3A4GvhvmCzWHoRqtwrIEFgzCZ+5/k2+oHOIrVt8PoLSJaD5ZuoIt
 SkIGnPo+f/Kh0VfwAACyGqpv0UWlsRVd0cuYtQVx3MTV8cVZA1NPKmpaCAhndTK188ip
 jcc0l/OXnhCOTjIjugpKHKxL3l3jO3UA4Ps7c/ux8panbv6FBehkIg3hmwU9B0kTY7rX
 EJQQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1705080852;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=x1r68xA9wRZ4ANIBi9hA9+/f2i2/5reMcctFU/rKIWM=;
 b=jL32j5FwaeApRttmOhW1Gu7gSfqOtYGFDHV/dfmiVwk6lv/rGq6WkiuBz82beG8UnO
 swrsv0PhvQYaN21JZmxO2+xU2OKEIDHGCNxj9juFGzg+Ldkd0mhSBo97APtDJ6U+LRqu
 7blY6TeqlvdGLoENvx22BbsH/dahwDdBTiZ9BLCKDH+ergN8Y0RIkiA25I65IuRw4QpB
 qzlOiNthWw+WTgSS1LzxBVQAwVwPewl9NQf1D7CfvSzknu8aEGQJDyWjtSAjV3d/ogkE
 eT3drVtVQwHCoz/BHuQVEe8SLaX+rax4SpDu49ZC3/DEwQeCoUx/w0zBh8zzKKg1e7bO
 eWKg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1705080852;
 s=strato-dkim-0003; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=x1r68xA9wRZ4ANIBi9hA9+/f2i2/5reMcctFU/rKIWM=;
 b=pHXvjyM6SXoq2JN88aS5Df7FeZdKXhVFedn7SwZ4nyqUqIMi1EYmq65gduamPGp39D
 E3e2r+2FnzciMSGM/LCQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Apz9PSN6LgsXcGZjDY="
Received: from smtpclient.apple by smtp.strato.de (RZmta 49.10.2 DYNA|AUTH)
 with ESMTPSA id dbe64400CHY9PpN
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Fri, 12 Jan 2024 18:34:09 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.300.61.1.2\))
Subject: Re: [PATCH RFC v2 04/11] ARM: dts: omap4: Add device tree entry for
 SGX GPU
From: H. Nikolaus Schaller <hns@goldelico.com>
In-Reply-To: <20240108183302.255055-5-afd@ti.com>
Date: Fri, 12 Jan 2024 18:33:58 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <122DC5ED-2AA7-46A0-845F-083922458385@goldelico.com>
References: <20240108183302.255055-1-afd@ti.com>
 <20240108183302.255055-5-afd@ti.com>
To: Andrew Davis <afd@ti.com>
X-Mailer: Apple Mail (2.3774.300.61.1.2)
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
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tony Lindgren <tony@atomide.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Donald Robson <donald.robson@imgtec.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, Matt Coster <matt.coster@imgtec.com>,
 Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Tero Kristo <kristo@kernel.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
I just comment on this example, but it applies almost the same for all =
other .dtsi changes.

> Am 08.01.2024 um 19:32 schrieb Andrew Davis <afd@ti.com>:
>=20
> Add SGX GPU device entry to base OMAP4 dtsi file.
>=20
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
> arch/arm/boot/dts/ti/omap/omap4.dtsi | 9 +++++----
> 1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/ti/omap/omap4.dtsi =
b/arch/arm/boot/dts/ti/omap/omap4.dtsi
> index 2bbff9032be3e..559b2bfe4ca7c 100644
> --- a/arch/arm/boot/dts/ti/omap/omap4.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/omap4.dtsi
> @@ -501,10 +501,11 @@ sgx_module: target-module@56000000 {
> #size-cells =3D <1>;
> ranges =3D <0 0x56000000 0x2000000>;
>=20
> - /*
> - * Closed source PowerVR driver, no child device
> - * binding or driver in mainline
> - */
> + gpu@0 {

I wonder why we don't add a "gpu:" label here.

Almost all other subsystem nodes have one (e.g. emif:, aes:, dss:, dsi:, =
hdmi:, etc.),
obviously for convenience when using a .dtsi file.

It would allow a board-specific DTS to easily add status =3D "disabled" =
to avoid driver
probing or disabling the GPU (e.g. if there is no display).

> + compatible =3D "ti,omap4430-gpu", "img,powervr-sgx540";

It still appears to me that the "img,powervr-sgx540" (or similar) entry =
is redundant
information.

I have experimentally updated our openpvrsgx driver and we do not have =
any use for
this information (at least in the kernel driver):

=
https://github.com/goldelico/letux-kernel/commit/f2f7cb3b858ef255f52f2b82a=
8bb34c047337afe

It shows how easy it is to derive the sgx version and revision number if =
we ever
need it inside the driver.

So if you want to keep a reference to powervr, it would suffice to have

> + compatible =3D "ti,omap4430-gpu", "img,powervr-sgx";

Otherwise your device tree entries compile fine and seem to work (at =
least in
a cursory test on PandaBoard ES).

> + reg =3D <0x0 0x2000000>; /* 32MB */
> + interrupts =3D <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
> + };
> };

BR and thanks,
Nikolaus=
