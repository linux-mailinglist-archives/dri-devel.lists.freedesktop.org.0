Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 967C979225F
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 13:57:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C28910E02B;
	Tue,  5 Sep 2023 11:57:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01D3510E02B
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 11:57:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 47BE1601BF;
 Tue,  5 Sep 2023 11:57:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C791C433C8;
 Tue,  5 Sep 2023 11:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693915067;
 bh=yW6RN8YkHd4Hfpori3CM7YyC89igPSM9JSnrmBGqE5g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hGoVO7xM/iLUXNkrTF0cnqtmiYYZzsF7+4NPfenz6E8aLWD6Xu5tZou3eGNkkyo1K
 PPIDMi4k4faKWSLJwO37TvGOjobI8B/t1H8FLKEn1/hLwpAVxe2suT0sa1ZMnU9ZRj
 Xo7mnaCJqZWHHPvCD5dYuOrM6vGL6afAzd2HIdFTEPB+RK59ktS1R+uaGJo17iLddC
 s77ikAxCOvE3myIRAaH/9ZlOLUAaezHHKFPDOT2rOMvBwy3cuptJE3//FNbPO3Dxhr
 gI+vdUgCltYtMNUIlgV1T+0XhLDt5yAQ0oQWNrWqBos50EiT2BLyjJxL2CggyQ4Ufh
 wQwUcu0rv35VQ==
Date: Tue, 5 Sep 2023 13:57:44 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Subject: Re: [PATCH v2 2/7] drm: ci: Force db410c to host mode
Message-ID: <ktikqf5hu2dmqb4p7dvrqv2tjm565qn3qu2gggrvncfu47l23j@o6t2rnpbya3x>
References: <20230904161516.66751-1-vignesh.raman@collabora.com>
 <20230904161516.66751-3-vignesh.raman@collabora.com>
 <CAA8EJpq_cmFQ6TGy1xELh3ButWKLfSkQcp5ix049s_iqKw6DvQ@mail.gmail.com>
 <ueznsu2dlvq5zp3ls262fww54bnlqa3e2ssr6f65vrrionloms@ir2ywgeajj4w>
 <2c812fe4-04ba-0243-5330-c7b7e695cff9@collabora.com>
 <2jz6wurh6ejbaejwtb5r5gukjuw4zs7ujk5hbwfpsn26o6esqe@g2nnb2gjpnjp>
 <CAA8EJpoGoopP64T1nm1ye1ukTwT=u+LYY1ubQG-9dQ-j41iHiA@mail.gmail.com>
 <6be5f5d8-8940-c79b-4a01-3f3d73641e4e@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="x4ofi2dynnfyekwu"
Content-Disposition: inline
In-Reply-To: <6be5f5d8-8940-c79b-4a01-3f3d73641e4e@collabora.com>
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
Cc: robdclark@google.com, daniels@collabora.com, emma@anholt.net,
 gustavo.padovan@collabora.com, linux-arm-msm@vger.kernel.org,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 david.heidelberg@collabora.com, helen.koike@collabora.com, anholt@google.com,
 linux-mediatek@lists.infradead.org, robclark@freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--x4ofi2dynnfyekwu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 05, 2023 at 05:11:43PM +0530, Vignesh Raman wrote:
> > > Also, that node actually has a label ("usb"), defined here:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/arch/arm64/boot/dts/qcom/msm8916.dtsi#n2322
> > >=20
> > > So you can end up with
> > >=20
> > > &usb {
> > >          dr_mode =3D "host";
> > > };
> >=20
> > ... which is the simplest and thus more robust one.
> >=20
>=20
> Should it be,
> &{/soc@0/usb} {
> 	dr_mode =3D "host";
> };

No. The &{/...} syntax refers to a path. &... refers to a label. They
are not equivalent.

Maxime

--x4ofi2dynnfyekwu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZPcXuAAKCRDj7w1vZxhR
xSWbAPwP14GufIj9qWu63z44zodhNDO5r+Fdp7Je7KtfA9W/JQEAjKAsvHIcmP+S
PR79vqaVr6o6IiGV79YCJa0aHGDBsgU=
=paYv
-----END PGP SIGNATURE-----

--x4ofi2dynnfyekwu--
