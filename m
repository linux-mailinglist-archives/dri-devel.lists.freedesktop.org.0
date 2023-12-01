Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A30D4800675
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 10:02:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD2310E089;
	Fri,  1 Dec 2023 09:01:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F2F310E089
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 09:01:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8FB96620BC;
 Fri,  1 Dec 2023 09:01:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E84D5C433CB;
 Fri,  1 Dec 2023 09:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701421312;
 bh=jpNDrmMrt5w7Ke72ajK5/RQFYq5ylOTlCAwPhtPoynA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ggA8gW8sp8r/5b8OcNKpRIpi/aHo6y7Gx7XM0z/DWpANEsntMNr8XDP1IXBDyphjL
 ZmD+ysTYeql+rVkA+Q3sVYpEFTowbiFwuOlgZZfUIm+4J2zEjwVhukuCkB1HOgmu1X
 QUJbwWPXKUIWgD7ZN4Y1fxSraGKwTBcPU9tla+6/wdckg/uyKS8hnE3RX2SC3KT1lr
 N9vXt6dTTpSiyUEDVph0tPHF/PLQAhPQf708HRDCTghCT+/QHHZI2H9JxJWvmKD8cf
 ReHwK4FtGxJ4z58tDkjm75Eyx7cbudeA0SWVDj0plYJWh/p+BHxBXtTj0K8c2ixaRA
 QwyBl5TKyJ0Ug==
Date: Fri, 1 Dec 2023 10:01:49 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 05/45] drm/connector: Check drm_connector_init
 pointers arguments
Message-ID: <2lbs5dkpusow72koxknoautcfb6e2ygq5wledim4i572ya5xlc@stc4koneykhm>
References: <20231128-kms-hdmi-connector-state-v4-0-c7602158306e@kernel.org>
 <20231128-kms-hdmi-connector-state-v4-5-c7602158306e@kernel.org>
 <87h6l66nth.fsf@intel.com>
 <v3hplco5fdedv6bnc6mwx2zhhw4xxdiekha26ykhc5cmy7ol77@2irk3w4hmabw>
 <ZWXv1Oi_sH0BRWao@intel.com>
 <2mnodqvu2oo674vspiy4gxhglu3it5cq47acx5itnbwevgc4cf@c7h2bvnx3m2n>
 <ZWcB4Ak8QnwkhObR@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rtx5vtwdur3wvxx2"
Content-Disposition: inline
In-Reply-To: <ZWcB4Ak8QnwkhObR@intel.com>
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
Cc: Emma Anholt <emma@anholt.net>, Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sandy Huang <hjc@rock-chips.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--rtx5vtwdur3wvxx2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 11:18:24AM +0200, Ville Syrj=E4l=E4 wrote:
> On Wed, Nov 29, 2023 at 10:11:26AM +0100, Maxime Ripard wrote:
> > Hi Ville,
> >=20
> > On Tue, Nov 28, 2023 at 03:49:08PM +0200, Ville Syrj=E4l=E4 wrote:
> > > On Tue, Nov 28, 2023 at 02:29:40PM +0100, Maxime Ripard wrote:
> > > > On Tue, Nov 28, 2023 at 02:54:02PM +0200, Jani Nikula wrote:
> > > > > On Tue, 28 Nov 2023, Maxime Ripard <mripard@kernel.org> wrote:
> > > > > > All the drm_connector_init variants take at least a pointer to =
the
> > > > > > device, connector and hooks implementation.
> > > > > >
> > > > > > However, none of them check their value before dereferencing th=
ose
> > > > > > pointers which can lead to a NULL-pointer dereference if the au=
thor
> > > > > > isn't careful.
> > > > >=20
> > > > > Arguably oopsing on the spot is preferrable when this can't be ca=
used by
> > > > > user input. It's always a mistake that should be caught early dur=
ing
> > > > > development.
> > > > >=20
> > > > > Not everyone checks the return value of drm_connector_init and fr=
iends,
> > > > > so those cases will lead to more mysterious bugs later. And proba=
bly
> > > > > oopses as well.
> > > >=20
> > > > So maybe we can do both then, with something like
> > > >=20
> > > > if (WARN_ON(!dev))
> > > >    return -EINVAL
> > > >=20
> > > > if (drm_WARN_ON(dev, !connector || !funcs))
> > > >    return -EINVAL;
> > > >=20
> > > > I'd still like to check for this, so we can have proper testing, an=
d we
> > > > already check for those pointers in some places (like funcs in
> > > > drm_connector_init), so if we don't cover everything we're inconsis=
tent.
> > >=20
> > > People will invariably cargo-cult this kind of stuff absolutely
> > > everywhere and then all your functions will have tons of dead
> > > code to check their arguments.
> >=20
> > And that's a bad thing because... ?
> >=20
> > Also, are you really saying that checking that your arguments make sense
> > is cargo-cult?
> >=20
> > We're already doing it in some parts of KMS, so we have to be
> > consistent, and the answer to "most drivers don't check the error"
> > cannot be "let's just give on error checking then".
> >=20
> > > I'd prefer not to go there usually.
> > >=20
> > > Should we perhaps start to use the (arguably hideous)
> > >  - void f(struct foo *bar)
> > >  + void f(struct foo bar[static 1])
> > > syntax to tell the compiler we don't accept NULL pointers?
> > >=20
> > > Hmm. Apparently that has the same problem as using any
> > > other kind of array syntax in the prototype. That is,
> > > the compiler demands to know the definition of 'struct foo'
> > > even though we're passing in effectively a pointer. Sigh.
> >=20
> > Honestly, I don't care as long as it's something we can unit-test to
> > make sure we make it consistent. We can't unit test a complete kernel
> > crash.
>=20
> Why do you want to put utterly broken code into a unit test?

Utterly broken code happens. It probably shouldn't, but here we are.

Anyway, you mostly missed the consistent part.

The current state with it is:

  - planes:
    - drm_universal_plane_init warns if funcs->destroy NULL
    - drm_universal_plane_alloc errors out if funcs is NULL
    - drmm_universal_plane_alloc warns and errors out if funcs or funcs->de=
stroy are NULL

  - CRTC:
    - drm_crtc_init_with_planes warns if funcs->destroy NULL
    - drmm_crtc_init_with_planes warns if funcs or funcs->destroy are NULL
    - drmm_crtc_alloc_with_planes warns and errors out if funcs or funcs->d=
estroy are NULL

  - encoder:
    - drm_encoder_init warns if funcs->destroy NULL
    - drmm_encoder_init warns and errors out if funcs or funcs->destroy are=
 NULL
    - drmm_encoder_alloc warns and errors out if funcs or funcs->destroy ar=
e NULL

  - connectors:
    - drm_connector_init warns and errors out if funcs or funcs->destroy ar=
e NULL
    - drm_connector_init_with_ddc warns and errors out if funcs or funcs->d=
estroy are NULL
    - drmm_connector_init warns and errors out if funcs or funcs->destroy a=
re NULL

I think that just proves that your opinion is just not as clear cut as
you'd like it to be, and it's far from being the policy you claim it is.

Plus, we're not even remotely consistent there, and we're not
documenting that anywhere.

And we have plenty of other examples of static stuff being checked
because it just makes sense. All variants of drm_crtc_init_with_planes
will for example check that the correct plane type is associated to the
primary and cursor planes.

We should fix that.

Maxime

--rtx5vtwdur3wvxx2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWmg/QAKCRDj7w1vZxhR
xXKqAQC1+hzRgBMOmcGyZ0qOZTQ2mgc2fhZmVU8e00/0/EtSkQD+MHB9/8fFCfDG
eCgsvdCLnrNjgI5MoqGzUdsYnzOTKgI=
=bxPp
-----END PGP SIGNATURE-----

--rtx5vtwdur3wvxx2--
