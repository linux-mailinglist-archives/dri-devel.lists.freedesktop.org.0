Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03909792268
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 14:06:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F4A510E4D0;
	Tue,  5 Sep 2023 12:06:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB9F210E4D0;
 Tue,  5 Sep 2023 12:06:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 572DB602F8;
 Tue,  5 Sep 2023 12:06:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C891C433C8;
 Tue,  5 Sep 2023 12:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693915585;
 bh=QJ1iipHIRhF00nMJB2wW93b1ptiinoSXBygyLb8REK8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RctXaLCXofN3ki4Y6ObCQk2kp73doFDmWoave5WhmMBx+WBtObr+URhm3DQ8phlK7
 KSFgbPafDpM+onmjQU8eCBsyHg/dlrqNzsKNMCjXkuAZFn/ke4WbgRb6glpwHx1Gml
 cH5RROnixdAwNZ7ldMrcfxluRjXGtYu8Woo5Qb2n6u88sz0jaJxvFZ+phEu5T2TvaA
 083qeq/oa4DtShjAnQOLltbe4U0exGi3zQ2U12/J4YEL2X/UQgnMJVcXIrP0nec4Tt
 Btgu53ecGDWCURVzarTokT9GdLPklgRzLARb6Vwg8FOuk1Ke/iqSL2MuH1EluA8lJ2
 7OaO9oi/0oa9A==
Date: Tue, 5 Sep 2023 14:06:22 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [Intel-xe] [PATCH 1/3] drm/kunit: Avoid a driver uaf
Message-ID: <efarj6smmvuqlredgy5aelgvm43xovnqo5fywsindq3bhggvul@3rqq27vmatcm>
References: <20230905085832.2103-1-thomas.hellstrom@linux.intel.com>
 <20230905085832.2103-2-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="55v4cmmahj7hcxid"
Content-Disposition: inline
In-Reply-To: <20230905085832.2103-2-thomas.hellstrom@linux.intel.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--55v4cmmahj7hcxid
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 05, 2023 at 10:58:30AM +0200, Thomas Hellstr=F6m wrote:
> when using __drm_kunit_helper_alloc_drm_device() the driver may be
> dereferenced by device-managed resources up until the device is
> freed, which is typically later than the kunit-managed resource code
> frees it.

I'd like to have a bit more context on how a driver can end up in that
situation?

Maxime

--55v4cmmahj7hcxid
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZPcZvgAKCRDj7w1vZxhR
xWcIAQCXDn2sCXCH3mjCpXwaUPkdU0oOF7rFmGECwTMEwFLUAgD/fhSpZ9+mYXwL
bBsoWPZYRj0p51E98K5o0ywQDq0ZrAs=
=Sn0p
-----END PGP SIGNATURE-----

--55v4cmmahj7hcxid--
