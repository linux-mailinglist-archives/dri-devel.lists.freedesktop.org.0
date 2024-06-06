Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 287218FE667
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 14:23:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32AF110E0B6;
	Thu,  6 Jun 2024 12:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="I54cmj7+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 563D610E08C;
 Thu,  6 Jun 2024 12:23:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8B1576173B;
 Thu,  6 Jun 2024 12:23:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3FBFC4AF0A;
 Thu,  6 Jun 2024 12:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717676606;
 bh=IlInq4cZuAv5dDIz56+IQg5jU99RfgvfiKv9Sn3hZhM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I54cmj7+eLYvzc6dQWZ3+4x5NKHh9VKkw1Dy2lyXk8CtDDaKNggSxoayvd+C/JxKz
 sxp9L5qd+wUac73XcruK3RqsESllJf/pywTa95eZGO3Sra5ywRs31LX8jemS0jZ7wM
 xRwJFGNxq9v7PZzqdppfo+H6TD4ToFq1BnGBCIqBXPLyXoMgsI69Prto/v9qgCPQR5
 3bMqwQudDJqbk9ox2CQOJqnwojXUyyUKc9ag72Kg1V/LP486poCjnZL4xO8+mjhVm2
 xqJhWjYGWnqAuKYOaa2qDsyEVYclTNBzy9R9hFvfscIgrNyzYTS2idxmz6OFuznvIl
 +SUspe/Sh9a7g==
Date: Thu, 6 Jun 2024 14:23:23 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>, 
 intel-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v13 5/9] drm/dp: Add refresh rate divider to struct
 representing AS SDP
Message-ID: <20240606-finicky-savvy-harrier-edec83@houat>
References: <20240605170111.494784-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240605170111.494784-6-mitulkumar.ajitkumar.golani@intel.com>
 <87wmn29u7u.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="43fn6thlzuhizwk3"
Content-Disposition: inline
In-Reply-To: <87wmn29u7u.fsf@intel.com>
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


--43fn6thlzuhizwk3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 06, 2024 at 02:38:45PM GMT, Jani Nikula wrote:
> On Wed, 05 Jun 2024, Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>=
 wrote:
> > Add target_rr_divider to structure representing AS SDP.
> > It is valid only in FAVT mode, sink device ignores the bit in AVT
> > mode.
> >
> > --v2:
> > - Update commit header and send patch to dri-devel.
> >
> > Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> > Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
>=20
> Maxime, Maarten, Thomas, ack for merging this via drm-intel-next?

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--43fn6thlzuhizwk3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZmGqOwAKCRAnX84Zoj2+
dguBAX9UWND51DrNwVU1T6JlorfZQxyw4S1HIlPLwKHReYBVLJtXuiw1i223bB6d
KmBFGyUBgKoTAdcUIwi3wsM7sVuU3adpIL1SNTeLp+cZ3koNhVECozgXlL4A9dqA
wE4xZcmgbg==
=nu6K
-----END PGP SIGNATURE-----

--43fn6thlzuhizwk3--
