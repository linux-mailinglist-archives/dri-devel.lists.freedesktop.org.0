Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 117448AB0CF
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 16:33:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA9AC10E922;
	Fri, 19 Apr 2024 14:33:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hKJiXEkm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2793210E651;
 Fri, 19 Apr 2024 14:33:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 18752CE16E7;
 Fri, 19 Apr 2024 14:33:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF567C072AA;
 Fri, 19 Apr 2024 14:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713537194;
 bh=kayvRbH/Vvw0kMK/SNeTV2p7wiCw+IxKDYvrrefXNrA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hKJiXEkmfnPA2ztwzpqLPjLDwIG5EGqO7pu+ChKtmG0kkc2kQ/jU36R0NupJlHApG
 MnHsEd5R2Hz96a8vKcsCvw2855zyPKXSJ0yqyzR5yQC4Ruqp3LO9rLx1c30v4cR5h6
 7oQ4lWP3x0DzCBixjKOt9yGBuXKebRZRYkqRqBpdy795rW5cUwK0+wWaJxZZoiyIPF
 bk5fiegJAIu9I7i7ENwlaU+xahZD2TNxFnwaLisATBmGMGiZWKy03h+Bk3hHnho5B8
 CAF0sSU14LGmaKvl3vAwg/EVkH2XpAr5JOMasEu3wmXWGKz7dCtFpeCvAPqHVGOah1
 NxYXGecrtHatg==
Date: Fri, 19 Apr 2024 16:33:11 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, 
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v17 0/9] Enable Adaptive Sync SDP Support for DP
Message-ID: <20240419-silent-cheerful-weasel-dbdbdf@houat>
References: <20240311094238.3320888-1-mitulkumar.ajitkumar.golani@intel.com>
 <87a5mvppvd.fsf@intel.com>
 <20240319-devious-natural-rook-df5f43@houat>
 <f3ec8e22-1963-47e0-8c5d-53a7e6fc73ae@intel.com>
 <871q71wmvo.fsf@intel.com>
 <20240419-bonobo-of-stimulating-dignity-50ad22@houat>
 <87v84dv3za.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="2m5wwyr75idye3qs"
Content-Disposition: inline
In-Reply-To: <87v84dv3za.fsf@intel.com>
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


--2m5wwyr75idye3qs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2024 at 05:09:29PM +0300, Jani Nikula wrote:
> On Fri, 19 Apr 2024, Maxime Ripard <mripard@kernel.org> wrote:
> > On Fri, Apr 19, 2024 at 03:35:55PM +0300, Jani Nikula wrote:
> >> On Thu, 04 Apr 2024, "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com> =
wrote:
> >> > On 3/19/2024 3:16 PM, Maxime Ripard wrote:
> >> >> On Mon, Mar 18, 2024 at 04:37:58PM +0200, Jani Nikula wrote:
> >> >>> On Mon, 11 Mar 2024, Mitul Golani <mitulkumar.ajitkumar.golani@int=
el.com> wrote:
> >> >>>>   An Adaptive-Sync-capable DP protocol converter indicates its
> >> >>>> support by setting the related bit in the DPCD register. This
> >> >>>> is valid for DP and edp as well.
> >> >>>>
> >> >>>> Computes AS SDP values based on the display configuration,
> >> >>>> ensuring proper handling of Variable Refresh Rate (VRR)
> >> >>>> in the context of Adaptive Sync.
> >> >>> [snip]
> >> >>>
> >> >>>> Mitul Golani (9):
> >> >>>>    drm/dp: Add support to indicate if sink supports AS SDP
> >> >>>>    drm: Add Adaptive Sync SDP logging
> >> >>> Maarten, Maxime, Thomas, ack for merging these two patches via
> >> >>> drm-intel-next?
> >> >> Ack
> >> >>
> >> >> Maxime
> >> >
> >> > Thanks for the patch, ack and reviews, pushed to drm-intel-next.
> >>=20
> >> This came up again today [1]. The acks absolutely must be recorded in
> >> the commit messages when pushing the patches.
> >>=20
> >> dim should complain about applying non-i915 patches without acks.
> >
> > It doesn't at the moment, this has bitten us a couple of times in
> > drm-misc too.
>=20
> See check_maintainer() that gets called from apply_patch() and
> dim_b4_shazam_branch().

Oh, right, I missed it sorry.

> It's of limited value, but it should complain while applying non-i915
> patches.
>=20
> > I did a MR to address that that hasn't been reviewed yet:
> > https://gitlab.freedesktop.org/drm/maintainer-tools/-/merge_requests/40
>=20
> Yeah, a more generic solution is needed, but I think we should unify
> with the above.

Fully agreed, I'll rework it.

Thanks!
Maxime

--2m5wwyr75idye3qs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZiKAnwAKCRAnX84Zoj2+
domiAYDTHzIBpOGEx8uKXW+adwTkwS35RW4H6KHirowiD5A6H2bjc6ehtR3idYIw
391ecpUBgOblGW2ppYSaPw+njIaEoGJA4nut8sZvRzMmeHqak/THk9oTqYilUufc
WOqyuHyQZg==
=f9FE
-----END PGP SIGNATURE-----

--2m5wwyr75idye3qs--
