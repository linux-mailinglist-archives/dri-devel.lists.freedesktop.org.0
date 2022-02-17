Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFBE4BA583
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 17:14:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C88D10E5C2;
	Thu, 17 Feb 2022 16:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E213110E5C2;
 Thu, 17 Feb 2022 16:14:45 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3D7BA5803CF;
 Thu, 17 Feb 2022 11:14:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 17 Feb 2022 11:14:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=MXfbhVCWqKJUrwBB370kKI/nk0FF2MyMt1LLhi
 0Bzqk=; b=uaZ9zUScDswRciS651h6P9I/nntH5mLe5nYsPsipgvSe1xFnmbiEFJ
 3cYX3mm1h3dL+z464foVFfSJB9wcti5IJUDiB9ct7AdBMkbGi9tqTh+2gUXD7Ozg
 CTKGy6b8oQa89dO2w53x3Zep8cClNi2/mQKQbtUAZT8Lcq/ad5SvJjGd+1ws5sJK
 jtng6Tqc/Eh9q6KRJH8+dkTvODtqSodCWyWpHrfE7iPqjNuJt6KIBAJBfxtj9vM9
 6iWSTiwSDq3zElsrVUgLxfn2OTjd7z3V2tR66GIVq/QkJxyl4O95+oDO4w7POxny
 qUSGXElE5dZKErJKmoJyFDrmZ6xthzjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=MXfbhVCWqKJUrwBB3
 70kKI/nk0FF2MyMt1LLhi0Bzqk=; b=DuLccNJoiDnBVilPLgBT4oZOodRMmB/B7
 OVf1O800nGiAR1di38Z+C5DfEaHRAn5JYeMQPR5oVWnIuoDWzTpb13QFq6oW9pGT
 KVEp8pvW+OlC7j0UPW/vLaXxMxxM0SUfSnXMqRd70tX704ssDYGGiCA44Ig5tklZ
 aq2egWRsFk0evqW5chJhLVpnyJUETBus9yAhmXzt2rOyUmUA4VkA7YMShv8KuryY
 cIY4bbghjD0+RXUg/eoPkaie2rGXOhKwPe7ZkCNnoWiR3jmAD5YZ4Ql6Fnt2n20Y
 AShHOaNzAX2dtTI2F+kbX99ZasBhapR4MPsEP8BBgrWYLTx2Xxk7w==
X-ME-Sender: <xms:dHQOYt0XDNEadGPuKW0ClQNb8oiVGPMnxAtoD3varYj3IsilIR835w>
 <xme:dHQOYkHTSM04M13_upnHDaqTW31n-PPlusXPRfD4F3llOpPaQGpZGSg9lR4HoJS5d
 nsDYG50OK6SPT6mQM4>
X-ME-Received: <xmr:dHQOYt6wGut1Lu5acdMwYq9uHZBRsdWC-371_xuGfDrkSTvWswnkyaCq0ghutKFX-oRNd3LGeMKuDsWek-5M7v0YuK3T6tUexpjTAo0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjeekgdekgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:dHQOYq0u0OpbagD2YhNfx0R5byyjvdC_hYiP3-fR2TyPxZUMnAjMnw>
 <xmx:dHQOYgESU04F2JXknEXkcEt3kCqupfPXy0qxEa5cMxs3aP2yBEWQXQ>
 <xmx:dHQOYr8sXvO47-JiN0pjNCcuFjPSAcaaO4SdffsJYaDnhaLTNYAifA>
 <xmx:dXQOYtdDju-3lzfeUEvrtH0QWwmNZBadlTQfSQ7Rem6KqvyDd7jNRg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Feb 2022 11:14:44 -0500 (EST)
Date: Thu, 17 Feb 2022 17:14:42 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH 05/23] drm/amd/display: Fix color encoding mismatch
Message-ID: <20220217161442.2ndrwzhvq7jzpuwe@houat>
References: <20220207163515.1038648-1-maxime@cerno.tech>
 <20220207163515.1038648-6-maxime@cerno.tech>
 <8aa30074-6039-ba5c-c25d-38a0c2f52619@amd.com>
 <3a9f5ff6-52fd-25f5-2714-8801eba13dab@amd.com>
 <20220210084243.grmjum55qc6sei52@houat>
 <fc0054aa-77aa-6d0b-b9d7-7a0163e3eb22@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3y3s4rvkp2s5fbh6"
Content-Disposition: inline
In-Reply-To: <fc0054aa-77aa-6d0b-b9d7-7a0163e3eb22@amd.com>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Leo Li <sunpeng.li@amd.com>,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--3y3s4rvkp2s5fbh6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Harry,

On Thu, Feb 10, 2022 at 09:38:24AM -0500, Harry Wentland wrote:
> On 2022-02-10 03:42, Maxime Ripard wrote:
> > On Mon, Feb 07, 2022 at 01:59:38PM -0500, Harry Wentland wrote:
> >> On 2022-02-07 13:57, Harry Wentland wrote:
> >>> On 2022-02-07 11:34, Maxime Ripard wrote:
> >>>> The amdgpu KMS driver calls drm_plane_create_color_properties() with=
 a
> >>>> default encoding set to BT709.
> >>>>
> >>>> However, the core will ignore it and the driver doesn't force it in =
its
> >>>> plane state reset hook, so the initial value will be 0, which repres=
ents
> >>>> BT601.
> >>>>
> >>>
> >>> Isn't this a core issue? Should __drm_atomic_helper_plane_state_reset
> >>> reset all plane_state members to their properties' default values?
> >>>
> >>
> >> Ah, looks like that's exactly what you do in the later patches, which =
is
> >> perfect. With that, I don't think you'll need this patch anymore.
> >=20
> > Ok, I'll squash it into the patch that removes the reset code.
> >=20
>=20
> I don't think that's right. I think we can just drop this patch.
> The amdgpu display driver is not doing BT601 by default.

My understanding from the code currently in tree is that:

1) amdgpu_dm_plane_init() will call drm_plane_create_color_properties()
   with an initial value set to BT709.

2) dm_drm_plane_reset() will use kzalloc and then just rely on
   __drm_atomic_helper_plane_reset(), which will not set the color encoding
   at all. It's thus 0 in the initial state.

3) the drm_color_encoding enum will have BT601 associated to 0

So it does look like the default for amdgpu at the moment is BT601?

Maxime

--3y3s4rvkp2s5fbh6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYg50cgAKCRDj7w1vZxhR
xajBAQDZJH4L1HIZtOjNjUZy70kzhvPp84ITyDvZFUbtrnlvswEA3sWE6f7R9xcI
FKWQz7FikzvKtmT8XxLs5vH6cJnYCgQ=
=LDIf
-----END PGP SIGNATURE-----

--3y3s4rvkp2s5fbh6--
