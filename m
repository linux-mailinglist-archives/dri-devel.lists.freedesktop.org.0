Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 964FA87FB0B
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 10:46:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA6AD10F92B;
	Tue, 19 Mar 2024 09:46:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="V6jKXAX4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E1FC10F928;
 Tue, 19 Mar 2024 09:46:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B18EC60E07;
 Tue, 19 Mar 2024 09:46:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0576EC433C7;
 Tue, 19 Mar 2024 09:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710841600;
 bh=KVbOalU7VovrcrrZt9/PTyNlTV4JreEoA/8+yYbx7Ys=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V6jKXAX43Ijc64Lfzic3HTbZtVoCMId6kaJV2l0aDhhlOkMMowogOznQSsYuxFcPq
 TeyIYDW2sgkSHnP/aNPNoBELtEmzUSwJap2F5HrklUuefrbzPbndeYwy5y5kJw1a1N
 LJbQxuFB53RKEWz/eKTObY58bbI4cEh547aV4c9FMZ0XAqzy0Y6YVB/3uwte2bOfGK
 +yTrP/C4IWuJKZssgUuTVVPBJ8/3HPNBdwzKy6RFy5NTlUIEuKletEdJuhOHOm2hfj
 EZukBI/Bgvv5MxUn+jlXAtOOJyLyDnMe76nroIifNIgjBKUAoGemmaUVhSxo1XLVJZ
 +kkFW5JiuRTFg==
Date: Tue, 19 Mar 2024 10:46:37 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 ville.syrjala@linux.intel.com, Arun R Murthy <arun.r.murthy@intel.com>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [RESEND v3 1/6] drm/mst: read sideband messaging cap
Message-ID: <20240319-subtle-giraffe-of-karma-eef8f6@houat>
References: <cover.1710839496.git.jani.nikula@intel.com>
 <b32a3704934871a67d06420b760e148b76c5ced8.1710839496.git.jani.nikula@intel.com>
 <87v85io9wv.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="x26i6hz2idxrwsdp"
Content-Disposition: inline
In-Reply-To: <87v85io9wv.fsf@intel.com>
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


--x26i6hz2idxrwsdp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2024 at 11:20:16AM +0200, Jani Nikula wrote:
> On Tue, 19 Mar 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> > Amend drm_dp_read_mst_cap() to return an enum, indicating "SST", "SST
> > with sideband messaging", or "MST". Modify all call sites to take the
> > new return value into account.
>=20
> drm-misc and nouveau maintainers, ack for merging this via drm-intel,
> please?

Ack

Maxime

--x26i6hz2idxrwsdp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZfle/QAKCRDj7w1vZxhR
xTEbAQCFP1JoDunE0DEwj14R01rTHg0FTD9ZrpGgB4wKzLBr5QD+PBUAA8g21apM
PgAdr22Pb0Hf1mEr15bKMG75PUNVWAk=
=X3Gp
-----END PGP SIGNATURE-----

--x26i6hz2idxrwsdp--
