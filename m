Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB948B21FB
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 14:53:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E157112012;
	Thu, 25 Apr 2024 12:52:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ag8D3v6q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DED910E505;
 Thu, 25 Apr 2024 12:52:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 820CDCE1A23;
 Thu, 25 Apr 2024 12:52:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3618AC2BD10;
 Thu, 25 Apr 2024 12:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714049571;
 bh=nU5Ut4zM0aWIwM0GOqmAZqmLxlvnmf+ZPh3vOoocdTM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ag8D3v6qI6XtgafSdvYlAy6nI4PfXrkaq5EM2J7acha7mle87UONbFg4tghlhlx/1
 A90n1I1JpPLLQyBpqzIQpERGlCDwLJYrHD3zXps7FZTAPGWzg7N1OXu6VG6+2DpV8e
 2HnBaRlefLtmybtYvxS+/F2b5dmDM93yMGsMUA5BkHwFmL33sgd0BMg+ll/DPWw82M
 Xvdq/zkOYjtTfceTizODXEuYEcPa54K/tD7Ag4vhw68FmcPEQWuPNpsI4yossEJdLg
 BEiyVSKwWsJllkYRFTuimwj+wofSE8GdEab+gQpHkFO272mOdF5iEiiciw284OqR+b
 cqNIMvB0EUBVw==
Date: Thu, 25 Apr 2024 14:52:48 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, 
 airlied@gmail.com, tzimmermann@suse.de, intel-xe@lists.freedesktop.org, 
 Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v3 1/4] drm: add devm release action
Message-ID: <20240425-diligent-literate-terrier-2e787d@penduick>
References: <20240422065756.294679-1-aravind.iddamsetty@linux.intel.com>
 <20240422065756.294679-2-aravind.iddamsetty@linux.intel.com>
 <ZibOmWPr3pZXdoNM@intel.com>
 <c899f2a5-e4f8-421f-ba87-8e8c15a6f665@linux.intel.com>
 <Zify_rd1yV6ki7oR@intel.com>
 <20240424-spectacular-lumpy-guan-7188eb@houat>
 <Zij5EJLa-E5VEX14@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ejbxxjkghfd2udez"
Content-Disposition: inline
In-Reply-To: <Zij5EJLa-E5VEX14@intel.com>
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


--ejbxxjkghfd2udez
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2024 at 08:20:32AM -0400, Rodrigo Vivi wrote:
> On Wed, Apr 24, 2024 at 01:49:16PM +0200, Maxime Ripard wrote:
> > On Tue, Apr 23, 2024 at 01:42:22PM -0400, Rodrigo Vivi wrote:
> > > On Tue, Apr 23, 2024 at 02:25:06PM +0530, Aravind Iddamsetty wrote:
> > > >=20
> > > > On 23/04/24 02:24, Rodrigo Vivi wrote:
> > > > > On Mon, Apr 22, 2024 at 12:27:53PM +0530, Aravind Iddamsetty wrot=
e:
> > > > >> In scenarios where drm_dev_put is directly called by driver we w=
ant to
> > > > >> release devm_drm_dev_init_release action associated with struct
> > > > >> drm_device.
> > > > >>
> > > > >> v2: Directly expose the original function, instead of introducin=
g a
> > > > >> helper (Rodrigo)
> > > > >>
> > > > >> v3: add kernel-doc (Maxime Ripard)
> > > > >>
> > > > >> Cc: Maxime Ripard <mripard@kernel.org>
> > > > >> Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
> > > > >> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > >>
> > > > > please avoid these empty lines here.... cc, rv-b, sign-offs, link=
s,
> > > > > etc are all in the same block.
> > > > ok.
> > > > >
> > > > >> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > >> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.inte=
l.com>
> > > > >> ---
> > > > >>  drivers/gpu/drm/drm_drv.c | 13 +++++++++++++
> > > > >>  include/drm/drm_drv.h     |  2 ++
> > > > >>  2 files changed, 15 insertions(+)
> > > > >>
> > > > >> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv=
=2Ec
> > > > >> index 243cacb3575c..9d0409165f1e 100644
> > > > >> --- a/drivers/gpu/drm/drm_drv.c
> > > > >> +++ b/drivers/gpu/drm/drm_drv.c
> > > > >> @@ -714,6 +714,19 @@ static int devm_drm_dev_init(struct device =
*parent,
> > > > >>  					devm_drm_dev_init_release, dev);
> > > > >>  }
> > > > >> =20
> > > > >> +/**
> > > > >> + * devm_drm_dev_release_action - Call the final release action =
of the device
> > > > > Seeing the doc here gave me a second thought....
> > > > >
> > > > > the original release should be renamed to _devm_drm_dev_release
> > > > > and this should be called devm_drm_dev_release without the 'actio=
n' word.
> > > > i believe, was suggested earlier to directly expose the main functi=
on, is=A0
> > > > there any reason to have a __ version ?
> > >=20
> > > No no, just ignore me. Just remove the '_action' and don't change the=
 other.
> > >=20
> > > I don't like exposing the a function with '__'. what would '__' that =
mean?
> > > This is what I meant on the first comment.
> > >=20
> > > Now, I believe that we don't need the '_action'. What does the 'actio=
n' mean?
> > >=20
> > > the devm_drm_dev_release should be enough. But then I got confused and
> > > I thought it would conflict with the original released function name.
> > > But I misread it.
> >=20
> > I don't think devm_drm_dev_release is a good name either. Just like any
> > other devm_* function that cancels what a previous one has been doing
> > (devm_kfree, devm_backlight_device_unregister, devm_nvmem_device_put,
> > etc.) it should be called devm_drm_dev_put or something similar.
>=20
> I see what you mean, but I don't believe the 'put' is the best option,
> for 2 reasons:
> - in general, we have put paired with gets and this has not get equivalent

Yeah, that's true. _release is fine then I guess.

> - this bypass the regular get/put mechanism and forces the releases that
>   would be done only after all drm_dev_put() taking ref to zero.

I don't think it does? devm_release_action will only remove the devm
action and execute it directly, but this action here is a call to
drm_dev_put, so we might still have other references taken that would
defer the device being freed.

Maxime

--ejbxxjkghfd2udez
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZipSGgAKCRAnX84Zoj2+
dkR3AX9YS/FLcL55BZTnsP23zMQtOVRR7LpKvrVROHvB/1ql6kMsIA86Vh1GfoLt
ibK7W8ABgLLacK6+Ue8i6HeOxtEfDjGN6AHt8JTJzIbAJl7tZ0uo04OP5sy9ZRsT
jOgsSVUsLg==
=v8rr
-----END PGP SIGNATURE-----

--ejbxxjkghfd2udez--
