Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1200E80705B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 13:56:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F0F210E710;
	Wed,  6 Dec 2023 12:56:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB64B10E710
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 12:56:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E4C83CE1DCE;
 Wed,  6 Dec 2023 12:56:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96334C433C7;
 Wed,  6 Dec 2023 12:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701867395;
 bh=FDpwgafoOGfqeUaYxZy4t8X7eZ2h7VcCSdPOW2X4ypw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RbCYYuJFjpJuAoaOmVIeBQwzx4ooCuREK8n66iOreUgfHmf/MHb99uU8xjDNk4xIL
 QKtojAJ3/3NINB8+CMNlf30MiSema9MMZ6BYNRoz6WBdMOc/VhNBo1jf2sCvKqWYZt
 Yb0FjVkoC39tFpXgyj4ciXKUsfOwhnRZ4Ezg2AO89SgtBOWutY+VP21wOArVDoP6Gm
 ndfLOI27SUzxJMF0gAS8McSZtpIOOokGV1d4e/i0vugnvH1Dr/yVl4pw5DNDYciJ1W
 Nt4EIqfQhM8wHIqvdqDVZTaYRC01YqP10mxruH/CFiP1/rhVks9BssJj6MMkxmAlAE
 UoYzhVXJWgW6g==
Date: Wed, 6 Dec 2023 13:56:32 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Keith Zhao <keith.zhao@starfivetech.com>
Subject: Re: [v3 5/6] drm/vs: Add hdmi driver
Message-ID: <abdl6kmighvpwojvafq443q7grn6w3abwpvw7zwbna4jvtsvjf@fa42rv46n2wh>
References: <20231204123315.28456-1-keith.zhao@starfivetech.com>
 <20231204123315.28456-6-keith.zhao@starfivetech.com>
 <esetsiqgqpk35zue4c6aq7l6zn4kezhxkqqa7ompaz2vhdy3lr@4d5awfqgs2ss>
 <94a1f9fc-82fb-4a04-a44b-f9b20c2bdfdd@starfivetech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gejtzksqfhmcrf7c"
Content-Disposition: inline
In-Reply-To: <94a1f9fc-82fb-4a04-a44b-f9b20c2bdfdd@starfivetech.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "suijingfeng@loongson.cn" <suijingfeng@loongson.cn>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Xingyu Wu <xingyu.wu@starfivetech.com>, Jack Zhu <jack.zhu@starfivetech.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 William Qiu <william.qiu@starfivetech.com>,
 Shengyang Chen <shengyang.chen@starfivetech.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Changhuang Liang <changhuang.liang@starfivetech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--gejtzksqfhmcrf7c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 06, 2023 at 08:02:55PM +0800, Keith Zhao wrote:
> >> +static const struct of_device_id starfive_hdmi_dt_ids[] =3D {
> >> +	{ .compatible =3D "starfive,jh7110-inno-hdmi",},
> >=20
> > So it's inno hdmi, just like Rockchip then?
> >=20
> > This should be a common driver.
>
> Rockchip has a inno hdmi IP. and Starfive has a inno hdmi IP.
> but the harewawre difference of them is big , it is not easy to use the c=
ommon driver
> maybe i need the inno hdmi version here to make a distinction

I just had a look at the rockchip header file: all the registers but the
STARFIVE_* ones are identical.

There's no need to have two identical drivers then, please use the
rockchip driver instead.

Maxime

--gejtzksqfhmcrf7c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXBvgAAKCRDj7w1vZxhR
xStPAQDTvV/nRdmwVbGgRirLKYu3fEEk2bcTs2wowK1XVkHKtQEAnaZsvW3x1amk
Y3Ot2ZUNpn5FMhvwW/Xd0KRaNbS+SAM=
=Auvj
-----END PGP SIGNATURE-----

--gejtzksqfhmcrf7c--
