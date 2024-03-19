Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6843187FB08
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 10:46:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D28F10F923;
	Tue, 19 Mar 2024 09:46:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YDDaEL9z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637FF10F923;
 Tue, 19 Mar 2024 09:46:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 955B060E07;
 Tue, 19 Mar 2024 09:46:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2A4CC433F1;
 Tue, 19 Mar 2024 09:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710841585;
 bh=Gs/E3yfXBtvhpdg1gG9CK8zs2Wlko0XsdWiUFSvf7FA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YDDaEL9zbY2/IYC8I9RhzVGkzkWU36Irn3AoUo2pNIx1cp2YfkSbH831dx2IHusyW
 /A8jkRuRYnIIrErPZcE6/BHUNzrqsq6p/1V7MN85CO8PBPa4y1DH3NG9VVIORMFw1K
 cJcEEnaGz4RJKAWGhEoFyW/jNw6iBnb5wjoDSv6Fb8kgN+oBzxOOasemb3u7f385/F
 GkIYevsQYl3Dz5h35GwR0ffxZhW73hbw+DQqoekTVKtE5s/seh52j4DNyr6P37iLN+
 4WgN5IhXWUyKXetFUMSATyHpjuy4vkkgAnHOzfbPohdXV0rrkJ4jRQ+SvvKUOKr3zj
 UYYpf6chT2FOw==
Date: Tue, 19 Mar 2024 10:46:22 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>, 
 intel-gfx@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v17 0/9] Enable Adaptive Sync SDP Support for DP
Message-ID: <20240319-devious-natural-rook-df5f43@houat>
References: <20240311094238.3320888-1-mitulkumar.ajitkumar.golani@intel.com>
 <87a5mvppvd.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rbzz2veycd7w3qju"
Content-Disposition: inline
In-Reply-To: <87a5mvppvd.fsf@intel.com>
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


--rbzz2veycd7w3qju
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 18, 2024 at 04:37:58PM +0200, Jani Nikula wrote:
> On Mon, 11 Mar 2024, Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>=
 wrote:
> >  An Adaptive-Sync-capable DP protocol converter indicates its
> > support by setting the related bit in the DPCD register. This
> > is valid for DP and edp as well.
> >
> > Computes AS SDP values based on the display configuration,
> > ensuring proper handling of Variable Refresh Rate (VRR)
> > in the context of Adaptive Sync.
>=20
> [snip]
>=20
> > Mitul Golani (9):
> >   drm/dp: Add support to indicate if sink supports AS SDP
> >   drm: Add Adaptive Sync SDP logging
>=20
> Maarten, Maxime, Thomas, ack for merging these two patches via
> drm-intel-next?

Ack

Maxime

--rbzz2veycd7w3qju
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZfle7QAKCRDj7w1vZxhR
xbuLAQD7gJhz24uGbcpBMhdrD1VRmDPxmySRUaJNyztHY2SjfgEA9WMYVFcKFpjb
TkgGzKrb98EyUtGA+iU/LUUjTkp1Ww0=
=wi4b
-----END PGP SIGNATURE-----

--rbzz2veycd7w3qju--
