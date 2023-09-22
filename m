Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6857AB1D6
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 14:05:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD9910E063;
	Fri, 22 Sep 2023 12:05:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 971C110E043;
 Fri, 22 Sep 2023 12:05:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E3E33B82356;
 Fri, 22 Sep 2023 12:05:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D6ABC433C7;
 Fri, 22 Sep 2023 12:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695384342;
 bh=39G/1wrABcCZttH7QTzYVPicY+OhkWDKWbR8tfYhVoc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DwOdK7KXK0tLM7rmTx+lemxoVJ2ClwtNw3n+M4gHTvkqBpmOoQcXdH0g2AGK0qhr+
 aXmVlSb//2ZAzCjVl8VNkaANs+psun1iNjISN61GQGP1yzwjVJto8OhUySzf8jyjj2
 LF2twSvCrHBEN6r5UGEUysK4UixWI2qcqh+yVIcPjiRliicJ0ZWiqF1zDwFHcEmJiE
 vwroLkQvQmQ1uPGreZaR09kVWWlBMK3AOfGm4hM27vDaLpeJpizLrPCJQZwB77F4uc
 b9PnmimNle4ZSc3cpxAfWNNzaLC90ZOTHF7nPA3m14GzJjTHcp5+8TxSI1MFB6poPa
 tJiNUbUHqz/3g==
Date: Fri, 22 Sep 2023 14:05:40 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 1/8] drm/display/dp: Add helper function to get DSC bpp
 prescision
Message-ID: <66dwgnyxq3mdsfczgcslooxrtwxwmgwgleciqzy7s4vpkoaz7e@uqlpdb7pcxvg>
References: <20230913060606.1105349-1-mitulkumar.ajitkumar.golani@intel.com>
 <20230913060606.1105349-2-mitulkumar.ajitkumar.golani@intel.com>
 <875y44q8g8.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pfkcucr6yatalhss"
Content-Disposition: inline
In-Reply-To: <875y44q8g8.fsf@intel.com>
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
Cc: suraj.kandpal@intel.com, intel-gfx@lists.freedesktop.org,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 dri-devel@lists.freedesktop.org, swati2.sharma@intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>, ankit.k.nautiyal@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--pfkcucr6yatalhss
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 21, 2023 at 10:41:43AM +0300, Jani Nikula wrote:
> On Wed, 13 Sep 2023, Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>=
 wrote:
> > From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> >
> > Add helper to get the DSC bits_per_pixel precision for the DP sink.
> >
> > Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>=20
> Maarten, Maxime, Thomas, ack for merging this via drm-intel please?

That's fine by me :)

Maxime

--pfkcucr6yatalhss
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZQ2DCQAKCRDj7w1vZxhR
xRdaAQCObgs+KiTlfVpFtwBTKcikFbMB56aWpmlJVW8FJ2i+fAD5AZAIuj/452xT
1DG3OJeUtcJa6piBRvREAFyTlbrPWg8=
=Deus
-----END PGP SIGNATURE-----

--pfkcucr6yatalhss--
