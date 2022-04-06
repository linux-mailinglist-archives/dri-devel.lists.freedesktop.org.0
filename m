Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B534F5A6B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 12:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3E6A10EADC;
	Wed,  6 Apr 2022 10:06:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F76810E3F1
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 10:06:18 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 3EECF3202069;
 Wed,  6 Apr 2022 06:06:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 06 Apr 2022 06:06:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=rzh+YVo8AjmVzXYtwCOyrTTWQiWeb9VJ0DWPZZ
 BZogk=; b=Iwl/Hcis915YuxuSYdtKUaM/emcwdNwLUmOhK6Uz82oFFtNQo63baz
 Ff5WVmMH4CgIgB7Mjfc5roxPZ0JdXi0pY34k5ZIeLjH3enh4PdbqE3fxuGXU4pHV
 3hdnWggWcpKE6ptGCcatiyrWEHik3RVX22Vpulup6f6z/FberTjC3fiBs/BaUMP2
 niwV6K24YkECzfaWDbiKrXjqT+cuw3wK/0wd/7NWxLp4iZdqkn59yFYerh4SfVtl
 QvKs0QQ0rjf86CoCz+GhX9FldByRRlCzIVxn6PQLtl8fE/vvyg9uP7RXCDhZHRXa
 9AbPtGKycpgEyc73ClOkJmrdbu7HaqGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=rzh+YVo8AjmVzXYtw
 COyrTTWQiWeb9VJ0DWPZZBZogk=; b=oJmVUCYa8RfGhDk7IDvEzqizOrCriQbxv
 WdMHs6fMqIyIi3LPz6EI/scjODZShthbGt7AcwVMnlmsQwqNKQbqtrk7p/PcipWC
 ecVAyKG61Np/F1E+MIxcWHz3ZPHLYas2VHt9DmPa2RBmZxClg91IlIiAr4Q53YuR
 l/y5XAFHyRvZh8n9FDiyNhq8VW9Q2oQT3GfmHfgIJZkK0YLqP6fEK1t1sFSThi4E
 YHFU+5HU0XY6nGnJXU/voDMb2tmchA5A6ZagEFAYDI+MDrQ4knCFrAg3M90fVEbw
 2Jd5MVa9ixw40lX5/Vcm7UzV83wl3vCgbZFRkRAfy16QetfoY1Btg==
X-ME-Sender: <xms:FmZNYpJl84yEK7oacOxfoP1IURA_k3vTeG1huh40Qr5-r_tVWKxnzg>
 <xme:FmZNYlKHcTc7M2cYTupcwic4PCFhpt_NuhXN7PM_lZhmfneYkwCaps03-x-fjv6_4
 HOb7n524u4a06ACdtM>
X-ME-Received: <xmr:FmZNYhui4m3AsCU4MTpBt76kbnVxXWXaR2wY32nkqlW--tXu5EDCr8ttmPEWK9f45yHk_7v6H4PRNtuQRiiIRGMNsJhUgNmEn_Ywv6Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejiedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
 gfevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:FmZNYqaz6oaZVAssejHnLeAU8GbZO9Mh9YaMZYA9Kr2tGAgvIPv-LA>
 <xmx:FmZNYgZmoRxnLfPw2ysMKf-mQYdh9yyn2ZhQqFMA-tmCIBb30k0pvg>
 <xmx:FmZNYuBw0PTi9pVOCgEUkOdb0QIjl3O5WLVJGNTDssWHFwPv3EWNsg>
 <xmx:FmZNYvyzyhoy5Khxf_IBHaOsGBVgMQmSHjUQWsjmpOQLFwXLiJ17Rg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Apr 2022 06:06:14 -0400 (EDT)
Date: Wed, 6 Apr 2022 12:06:12 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: "Zhengbin (OSKernel)" <zhengbin13@huawei.com>
Subject: Re: [PATCH v2 -next] drm/vc4: Fix build error when CONFIG_DRM_VC4=y
 && CONFIG_RASPBERRYPI_FIRMWARE=m
Message-ID: <20220406100612.2nuvjcc2oxo54n5j@houat>
References: <20220325021831.2812735-1-zhengbin13@huawei.com>
 <20220325130541.tjxq4kjgmkaz32en@houat>
 <601a9682-6afc-d87b-cfa7-5c683271f7a5@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="m2ydzgbnjwzzthnm"
Content-Disposition: inline
In-Reply-To: <601a9682-6afc-d87b-cfa7-5c683271f7a5@huawei.com>
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
Cc: emma@anholt.net, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tangyizhou@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--m2ydzgbnjwzzthnm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Mar 28, 2022 at 10:22:11AM +0800, Zhengbin (OSKernel) wrote:
> On 2022/3/25 21:05, Maxime Ripard wrote:
> > On Fri, Mar 25, 2022 at 10:18:31AM +0800, Zheng Bin wrote:
> > > If CONFIG_DRM_VC4=3Dy, CONFIG_RASPBERRYPI_FIRMWARE=3Dm, CONFIG_COMPIL=
E_TEST=3Dn,
> > > bulding fails:
> > >=20
> > > drivers/gpu/drm/vc4/vc4_drv.o: In function `vc4_drm_bind':
> > > vc4_drv.c:(.text+0x320): undefined reference to `rpi_firmware_get'
> > > vc4_drv.c:(.text+0x320): relocation truncated to fit: R_AARCH64_CALL2=
6 against undefined symbol `rpi_firmware_get'
> > > vc4_drv.c:(.text+0x34c): undefined reference to `rpi_firmware_propert=
y'
> > > vc4_drv.c:(.text+0x34c): relocation truncated to fit: R_AARCH64_CALL2=
6 against undefined symbol `rpi_firmware_property'
> > > vc4_drv.c:(.text+0x354): undefined reference to `rpi_firmware_put'
> > > vc4_drv.c:(.text+0x354): relocation truncated to fit: R_AARCH64_CALL2=
6 against undefined symbol `rpi_firmware_put'
> > >=20
> > > Make DRM_VC4 depends on RASPBERRYPI_FIRMWARE || COMPILE_TEST to fix t=
his.
> > >=20
> > > Fixes: c406ad5e4a85 ("drm/vc4: Notify the firmware when DRM is in cha=
rge")
> > > Reported-by: Hulk Robot <hulkci@huawei.com>
> > > Signed-off-by: Zheng Bin <zhengbin13@huawei.com>
> > > ---
> > > v2: follow Maxime's advise, add RASPBERRYPI_FIRMWARE as an additional=
 depends
> > >   drivers/gpu/drm/vc4/Kconfig | 1 +
> > >   1 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/vc4/Kconfig b/drivers/gpu/drm/vc4/Kconfig
> > > index de3424fed2fc..92d74ba7c449 100644
> > > --- a/drivers/gpu/drm/vc4/Kconfig
> > > +++ b/drivers/gpu/drm/vc4/Kconfig
> > > @@ -2,6 +2,7 @@
> > >   config DRM_VC4
> > >   	tristate "Broadcom VC4 Graphics"
> > >   	depends on ARCH_BCM || ARCH_BCM2835 || COMPILE_TEST
> > > +	depends on RASPBERRYPI_FIRMWARE || COMPILE_TEST
> > Why do we need the || COMPILE_TEST here?
> >=20
> > The rpi_firmware_get, _property and _put functions aren't define if
> > RASPBERRYPI_FIRMWARE, so we need that dependency every time, even if
> > COMPILE_TEST is set?
>=20
> include/soc/bcm2835/raspberrypi-firmware.h
>=20
> #if IS_ENABLED(CONFIG_RASPBERRYPI_FIRMWARE)
>=20
> struct rpi_firmware *rpi_firmware_get(struct device_node
> *firmware_node);/_property/_put
>=20
> #else=A0=A0=A0 -->empty function
>=20
> =A0static inline struct rpi_firmware *rpi_firmware_get(struct device_node
> *firmware_node)/_property/_put
> {
> =A0=A0=A0=A0=A0=A0=A0=A0 return NULL;
> =A0}
> #endif
>=20
>=20
> We can refer to drivers/pwm/Kconfig
>=20
> config PWM_RASPBERRYPI_POE
> =A0=A0=A0=A0=A0=A0=A0=A0 tristate "Raspberry Pi Firwmware PoE Hat PWM sup=
port"
> =A0=A0=A0=A0=A0=A0=A0=A0 # Make sure not 'y' when RASPBERRYPI_FIRMWARE is=
 'm'. This can only
> =A0=A0=A0=A0=A0=A0=A0 # happen when COMPILE_TEST=3Dy, hence the added !RA=
SPBERRYPI_FIRMWARE.
> =A0=A0=A0=A0=A0=A0=A0=A0 depends on RASPBERRYPI_FIRMWARE || (COMPILE_TEST=
 &&
> !RASPBERRYPI_FIRMWARE)=A0 -->There is no need to add (&&
> !RASPBERRYPI_FIRMWARE)

Oh, so you're fixing the case where vc4 would be built-in, but the
firmware driver a module?

I guess that makes sense, but the comment definitely helps there. And
the (COMPILE_TEST && !RASPBERRYPI_FIRMWARE) is also needed, since it
wouldn't fix the issue you're trying to fix for COMPILE_TEST otherwise.

Maxime

--m2ydzgbnjwzzthnm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYk1mFAAKCRDj7w1vZxhR
xT80AQC7Tm+NmNDitAW/WPTe7zEurlBuKyI80CaozozVmnmeUgD/ZdkwChF2xf3c
k1aWDhJy5q1hEMUagUb6QAuZLV0lMAM=
=wzKX
-----END PGP SIGNATURE-----

--m2ydzgbnjwzzthnm--
