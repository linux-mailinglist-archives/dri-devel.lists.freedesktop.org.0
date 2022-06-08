Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9136A543810
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 17:52:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72BC110F020;
	Wed,  8 Jun 2022 15:52:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A1F10EFA7
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 15:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4Vxeo9jH11rHQyQP2R0cI5LaRVtfqr/hSLMJ4leQkxM=; b=PhmIe1qe2P6DDjozBkILvARJUI
 c/nZEsOGaaQzhnEVZDphYyL8AT0vqoipAjuVJp8dWUEIbJq8+NflXicm1jM+7qnwT/uI4A4yWSIEK
 o2oiikk+B2XiOdBz4fyULdUpJtp9CGyiMtdw6V8/IRySboBH/rwhQf7vf0YhU22gW+QjA/KWz6TNB
 PYNRd6wh4xhf8GBbGgFjmb4RR+yYCxN2CV/g0S/+S4l93bIDBSvkfSeoi9Y+2Cojo/LMFdKUaUR8C
 Lvx2QwDyLp4Nd2yTwGA9Ve9UXiw1s/YzPLCnSuv7SJqB7WwtpEXU1rSeqoZclx/O8qKYNtDXw9JmB
 hvjDh8vA==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1nyxyC-00EPDe-TK; Wed, 08 Jun 2022 17:51:45 +0200
Date: Wed, 8 Jun 2022 14:51:30 -0100
From: Melissa Wen <mwen@igalia.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v6 0/6] Raspberry PI 4 V3D enablement
Message-ID: <20220608155130.w4piz2g3obp7qnx7@mail.igalia.com>
References: <20220603092610.1909675-1-pbrobinson@gmail.com>
 <cadecbfd-e174-eadb-276c-577bb2bf70f2@gmail.com>
 <9aaaaa29-11c0-d494-11dd-0bbf5d384364@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="z56oylvtyf4k6pji"
Content-Disposition: inline
In-Reply-To: <9aaaaa29-11c0-d494-11dd-0bbf5d384364@redhat.com>
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, Emma Anholt <emma@anholt.net>,
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, Peter Robinson <pbrobinson@gmail.com>,
 maxime@cerno.tech, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--z56oylvtyf4k6pji
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 06/08, Javier Martinez Canillas wrote:
> Hello Florian,
>=20
> On 6/8/22 11:26, Florian Fainelli wrote:
> >=20
> >=20
> > On 6/3/2022 11:26 AM, Peter Robinson wrote:
> >> This is a follow up from my v4 patchset. The power management pieces h=
ave
> >> been split out to a separate independent set of patches by Stefan [1].=
 This
> >> version 5 of the DRM patches are independent and given the V3D driver =
has
> >> been upstream for some time the two patches to enable it in defconfigs=
 can
> >> be taken at anytime independent of the enablement for the Raspberry Pi=
 4.
> >>
> >> I've tested this using mesa 22.0.x and Wayland/Gnome on Fedora 36, it's
> >> more or less stable with basic testing.
> >>
> >> Changes since v5:
> >> - Update the DT compatible to match the others that were updated
> >> - Adjust the Kconfig help text
> >> - Add review tags
> >>
> >> Changes since v4:
> >> - Fixes for device tree and bindings
> >> - Split out the power management changes into an independent set
> >> - Rebase to 5.18
> >> - Individual changes in patches
> >>
> >> [1] https://www.spinics.net/lists/arm-kernel/msg980342.html
> >=20
> > I can take the last 3 patches through the Broadcom ARM SoC pull request=
,=20
> > but the first three should probably go via the DRM tree unless you want=
=20
> > me to merge them all?
>=20
> I can merge the first 3 patches through the drm-misc tree. Can I get
> an ack from you for those ?
>=20
> The changes are independent so there's no need for an immutable branch
> or any kind of cross tree coordination.

Hi Javier,

I'm not sure if you're suggesting here to apply the entire series as it
is now.

I'm not able to have a functional kernel from arm defconfig, only for
arm64. I'd like to have this issue clarified before merge this serie. I
tried multi_v7_defconfig on raspbian 32-bits and got a kernel panic.
Things work better when using downstream bcm2711_defconfig.

If you have an idea of what is going on, please, let me know. I can try
again and I'll be okay on merging it. Otherwise, let's wait for more
inputs to have a better picture of the situation.

Thanks,

Melissa

>=20
> --=20
> Best regards,
>=20
> Javier Martinez Canillas
> Linux Engineering
> Red Hat
>=20

--z56oylvtyf4k6pji
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmKgxXYACgkQwqF3j0dL
ehySWA//YfV/JrmvLlJ/UzGQfDL4EqAUfeeAX66bdXj5dGRhj+5UibYJFjK47jik
xWLAMWQuEYBOxGFjiEQVkM2+QQovjGkhSgcHFOAJJNq4seZi76iyZy68jWUYBqpK
6pmKulmEmplaTyYs2O1DDbQQVbbqXDmoaS8y0FQyPUhg2iVTqTAoPiX2fPn/Xmqc
IRzgZHuk4lq9gm8IRsgskPBle5R+xP0kjUS29JwbmEyc3fcTpt+9Ad9yhfusrp4h
ftwEN4JaWg1n3O1oM1D+jbLf2ZgDhuVGW2OqG7V81UVFaoh7RZ5XynnYRz2Pjfmf
hzk45/gGUHvDcMXxjcfnflNjuACR2Mw3IlXo1L0A+xEQJh+Otdy7yf0ksznjyGHH
o57DXSF0PBcp2JtSTxB6ZuwFNZfPScG08HxCIQWT3Nl2yP46CZFW28Bc9PZmcppe
x82sn1FOIJBPzlHGLd6Po6YX5f2/6IOG44q0jqQRmFPBMQnRVo9GCzwS5DkMxkav
6ZvhTIibs0XGhXtVkL/UlGRCsAnLcQnXqQQ+Mk51YHXR3W19mDnDvD+bY2Ihv0t2
ojpYul594P8cwyinQQX7cXftjHMry8A7wj8y2/NdOuY3sRnIND/s9M7bGNf8zYVn
HIxxLdzXm3b4IegfIbudfbwH0tOsmh5tKlGdDTTJ+iV+frXsB+c=
=fJYd
-----END PGP SIGNATURE-----

--z56oylvtyf4k6pji--
