Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5A28AAED1
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 14:51:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC82A10FEC6;
	Fri, 19 Apr 2024 12:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tKjEyQwT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0683010FEC4;
 Fri, 19 Apr 2024 12:51:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DC589CE1AD5;
 Fri, 19 Apr 2024 12:51:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B83A8C072AA;
 Fri, 19 Apr 2024 12:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713531098;
 bh=zDutekAwUTxdkLhQY13k2RWsK1bWnXS0KE2OnaardZs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tKjEyQwTKWk3XM3LkT6ZAIU4I247zzRznecQJegqrfxLeyY2/oZpY+8GZFpCoBXOW
 VwFwfdRKl4M1OvN08of3Rqr6ImoghIKZta+jqYnivyNprijJqDVagqMS10mymb0ifH
 ZswzslqlBm7o4xgx+m7WWYnAZli+019fvzSYOIY39p6PgC95zkznjC3fFqvZam+/sW
 BZTqXykCRDVVGDXgpPfDBZDvGBgWlHShx0AQC3Bv0E4ZvDPB4/ZjPbrtJQe5dJ7usT
 ZFRtK+0iCJ988tGbCJaJ7H5BQH0EyCtKodeKp5UzglrxnGKtD6RNqslnemTihqJdGX
 mzojNsblEEmMA==
Date: Fri, 19 Apr 2024 14:51:35 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, 
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v17 0/9] Enable Adaptive Sync SDP Support for DP
Message-ID: <20240419-bonobo-of-stimulating-dignity-50ad22@houat>
References: <20240311094238.3320888-1-mitulkumar.ajitkumar.golani@intel.com>
 <87a5mvppvd.fsf@intel.com>
 <20240319-devious-natural-rook-df5f43@houat>
 <f3ec8e22-1963-47e0-8c5d-53a7e6fc73ae@intel.com>
 <871q71wmvo.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="lzfj3mwz7zeqtvey"
Content-Disposition: inline
In-Reply-To: <871q71wmvo.fsf@intel.com>
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


--lzfj3mwz7zeqtvey
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2024 at 03:35:55PM +0300, Jani Nikula wrote:
> On Thu, 04 Apr 2024, "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com> wro=
te:
> > On 3/19/2024 3:16 PM, Maxime Ripard wrote:
> >> On Mon, Mar 18, 2024 at 04:37:58PM +0200, Jani Nikula wrote:
> >>> On Mon, 11 Mar 2024, Mitul Golani <mitulkumar.ajitkumar.golani@intel.=
com> wrote:
> >>>>   An Adaptive-Sync-capable DP protocol converter indicates its
> >>>> support by setting the related bit in the DPCD register. This
> >>>> is valid for DP and edp as well.
> >>>>
> >>>> Computes AS SDP values based on the display configuration,
> >>>> ensuring proper handling of Variable Refresh Rate (VRR)
> >>>> in the context of Adaptive Sync.
> >>> [snip]
> >>>
> >>>> Mitul Golani (9):
> >>>>    drm/dp: Add support to indicate if sink supports AS SDP
> >>>>    drm: Add Adaptive Sync SDP logging
> >>> Maarten, Maxime, Thomas, ack for merging these two patches via
> >>> drm-intel-next?
> >> Ack
> >>
> >> Maxime
> >
> > Thanks for the patch, ack and reviews, pushed to drm-intel-next.
>=20
> This came up again today [1]. The acks absolutely must be recorded in
> the commit messages when pushing the patches.
>=20
> dim should complain about applying non-i915 patches without acks.

It doesn't at the moment, this has bitten us a couple of times in
drm-misc too.

I did a MR to address that that hasn't been reviewed yet:
https://gitlab.freedesktop.org/drm/maintainer-tools/-/merge_requests/40

Maxime

--lzfj3mwz7zeqtvey
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZiJo1wAKCRAnX84Zoj2+
dpHqAXwLc4S9IhaVdV9tzCcTCPDtb6P46KPtTxNIL0/H0216XL80xVwFQEaFS0dr
EYFZfl8BgNlbMvm9ov/f+YwcwOpf7tk8AQCkcRgWSVTlWUV5OoDua6RBv+ifdhl6
H+ZVD+plPQ==
=qWrq
-----END PGP SIGNATURE-----

--lzfj3mwz7zeqtvey--
