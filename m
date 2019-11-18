Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F53E100588
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 13:25:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802396E4AE;
	Mon, 18 Nov 2019 12:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D686E4AE
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:25:15 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 820A6206F4;
 Mon, 18 Nov 2019 12:25:14 +0000 (UTC)
Date: Mon, 18 Nov 2019 13:25:12 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 10/13] drm/modes: parse_cmdline: Remove some
 unnecessary code (v2)
Message-ID: <20191118122512.GG4345@gilmour.lan>
References: <20191113164434.254159-1-hdegoede@redhat.com>
 <20191113164434.254159-10-hdegoede@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191113164434.254159-10-hdegoede@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1574079915;
 bh=uXvXHINnsBrIxN548ubOi1jEeWXdu2KC6XOtQrDp90E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YN2Ir6kE5sH/Ao4kRLqElelYZOAAy0j7vqN6QLkmrVA6La0nUKfYDLK+/Wly7G1kp
 1D6Nnl9pHFcsbz2mY7CM1ex4boj8qkTe27viafartApMMgxrXMNrSuG4xuIKUBpll3
 se4rmOSso06rYtsTT8ZRW4dcJ3MTnVSn74Z5a4VY=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: David Airlie <airlied@linux.ie>, Derek Basehore <dbasehore@chromium.org>,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mathieu =?iso-8859-1?Q?Alexandre-T=E9treault?= <alexandretm@amotus.ca>
Content-Type: multipart/mixed; boundary="===============0923868477=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0923868477==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GXT8AkipAZwA99QD"
Content-Disposition: inline


--GXT8AkipAZwA99QD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 13, 2019 at 05:44:31PM +0100, Hans de Goede wrote:
> fb_get_options() will return fb_mode_option if no video=<connector-name>
> argument is present on the kernel commandline, so there is no need to also
> do this in drm_mode_parse_command_line_for_connector() as our only caller
> uses fb_get_options() to get the mode_option argument.
>
> Changes in v2:
> -Split out the changes dealing with the initialization of the mode struct
>  into a separate patch
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

--GXT8AkipAZwA99QD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXdKNqAAKCRDj7w1vZxhR
xaqSAP4gER/CB6XS9aJzWcARzi/7kgyEPQdUwV+aefmfa0FykwEAmAJoXdI+2m5W
N3s679q8wPTAKCM4TXFy6OmLF8JR6wY=
=ukPv
-----END PGP SIGNATURE-----

--GXT8AkipAZwA99QD--

--===============0923868477==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0923868477==--
