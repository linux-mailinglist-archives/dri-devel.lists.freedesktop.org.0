Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E22978F926
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 09:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C77710E731;
	Fri,  1 Sep 2023 07:33:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 548 seconds by postgrey-1.36 at gabe;
 Fri, 01 Sep 2023 07:33:28 UTC
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8661710E731;
 Fri,  1 Sep 2023 07:33:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AAE8CB8229D;
 Fri,  1 Sep 2023 07:24:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0954BC433C7;
 Fri,  1 Sep 2023 07:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693553056;
 bh=L1wTGO7jcST49mJRih4AiWgjXlctehjJ8YrF0b66cfo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aKiKv3UuvoWrND6Q9hNgh0vuL76qM7PgLy0uf3Kv00KoxGKYJBccmdi4o3daQTzw9
 3AZfK1flAB6pUItNbJ2mlFHCIZKtts8FIg92fIqswVB1tQYOfAGVidwdLF6V2viCtD
 cuEzwFNO/yLNs0XYc7aKHChbnCtEDnrgmttWcroAhYCsRmrylVLHIkgaKXEBP8g/gc
 PZPKCGhCGCKNYmI8Xlj7NtxUFMiL7AI87amd/v4sgxniOXBhiC2kzkR+BEn0RGaFbz
 s0NSxDO4OlbtSs5QV0Ln3DsuQLS3DA4zJFf7K0UEjNHBCU4gBn1MT0LcwAUKd/dsJV
 7hUjIvTakllYA==
Date: Fri, 1 Sep 2023 09:24:13 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 0/6] drm, cec and edid updates
Message-ID: <6i3idgngjlyez6y7zleqrt54r7f4c3urifgerizhzoarwdilv2@auwk3cedxv2t>
References: <cover.1692884619.git.jani.nikula@intel.com>
 <8734zzjb9v.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ozwshuq3yartaaha"
Content-Disposition: inline
In-Reply-To: <8734zzjb9v.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ozwshuq3yartaaha
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2023 at 09:51:24PM +0300, Jani Nikula wrote:
> On Thu, 24 Aug 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> > Avoid accessing the raw edid directly. Pre-parse the source physical
> > address during normal EDID parsing and use that for CEC.
> >
> > Jani Nikula (6):
> >   drm/edid: add drm_edid_is_digital()
> >   drm/i915/display: use drm_edid_is_digital()
> >   drm/edid: parse source physical address
> >   drm/cec: add drm_dp_cec_attach() as the non-edid version of set edid
> >   drm/i915/cec: switch to setting physical address directly
>=20
> Maarten, Maxime, Thomas, ack for merging patches 1, 3 and 4 via via
> drm-intel?

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--ozwshuq3yartaaha
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZPGRnQAKCRDj7w1vZxhR
xU6YAP9/nBLQqasjSUnmIaVto2eMtVCdC2AZTWBPZfFcDpMACwD6AzFIeDo+Xjmq
gWpTkk9mBoI9m/bg7ZeEVAREmFwxdg0=
=x7aT
-----END PGP SIGNATURE-----

--ozwshuq3yartaaha--
