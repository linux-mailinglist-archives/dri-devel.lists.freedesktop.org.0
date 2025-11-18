Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6958C6A941
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 17:21:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4562810E4F4;
	Tue, 18 Nov 2025 16:20:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TfVALgKC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F82510E4F4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 16:20:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5A9AC42AA5;
 Tue, 18 Nov 2025 16:20:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6761AC2BCB1;
 Tue, 18 Nov 2025 16:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763482858;
 bh=ZqXuGjjF65T7DdQh6g7d45GlFha4OAi/GU76qrook1o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TfVALgKC23KPD6Jqamv/19NpUbDysAJxeDp7XpIptrmw37bPdYWdy4xh6xgHd8DPw
 1t+SUVQHNDjmBfUoTu8mfwgy5/p4VgrRClbPUI4qOsX9XE4+rTsdrZkBDTCQMRHjlA
 rZJR+YeFIjpZJAQ6h4uaGSAzyqJOGDU+cgPFiIekYdxJvBJACSgWJMPc/z+a1/uSSg
 eLCEt64fWWSgL7E9M5D7oJ/Y7p7v3eDjrWUgB4d8aiXl9SztlLn+YPyDYqaP884jT8
 EunfsiA3+1w2MRl99Oo4ra71IZee1m9QOLsJPDx47abx81K5ac3QtCdr3qHpUCY6sW
 iT/cgTYuFztqw==
Date: Tue, 18 Nov 2025 17:20:54 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Harikrishna Shenoy <h-shenoy@ti.com>, 
 Laurent.pinchart@ideasonboard.com, airlied@gmail.com, andrzej.hajda@intel.com, 
 andy.yan@rock-chips.com, aradhya.bhatia@linux.dev, devarsht@ti.com,
 dianders@chromium.org, 
 dri-devel@lists.freedesktop.org, javierm@redhat.com, jernej.skrabec@gmail.com,
 jonas@kwiboo.se, 
 linux-kernel@vger.kernel.org, linux@treblig.org, luca.ceresoli@bootlin.com,
 lumag@kernel.org, 
 lyude@redhat.com, maarten.lankhorst@linux.intel.com, mordan@ispras.ru, 
 neil.armstrong@linaro.org, rfoss@kernel.org, s-jain1@ti.com, simona@ffwll.ch, 
 tzimmermann@suse.de, u-kumar1@ti.com
Subject: Re: [PATCH v9 0/6] MHDP8546 fixes related to DBANC usecase
Message-ID: <ujpesz2g2emhukb75yrxdlxzd2cfwbfoejlngtyxurjt45w45p@qjtcvk7in7mz>
References: <20251118115255.108225-1-h-shenoy@ti.com>
 <i7byagpaadjjhc6rbqvejsxezn2eeomtw2ddpxirwjuezfdf3x@tez2ooxn76dv>
 <821dff40-28f2-48e1-8821-795527d396c0@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="oppcniarmalmqp3i"
Content-Disposition: inline
In-Reply-To: <821dff40-28f2-48e1-8821-795527d396c0@ideasonboard.com>
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


--oppcniarmalmqp3i
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v9 0/6] MHDP8546 fixes related to DBANC usecase
MIME-Version: 1.0

On Tue, Nov 18, 2025 at 04:52:49PM +0200, Tomi Valkeinen wrote:
> Hi,
>=20
> On 18/11/2025 14:40, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Tue, Nov 18, 2025 at 05:22:49PM +0530, Harikrishna Shenoy wrote:
> >> With the DBANC framework, the connector is no longer initialized in=20
> >> bridge_attach() when the display controller sets the=20
> >> DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.=20
> >> This causes a null pointer dereference in cdns_mhdp_modeset_retry_fn()=
=20
> >> when trying to access &conn->dev->mode_config.mutex.=20
> >> Observed on a board where EDID read failed.=20
> >> (log: https://gist.github.com/Jayesh2000/233f87f9becdf1e66f1da6fd53f77=
429)
> >>
> >> Patch 1 adds a connector_ptr which takes care of both=20
> >> DBANC and !DBANC case by setting the pointer in appropriate hooks
> >> and checking for pointer validity before accessing the connector.
> >> Patch 2 adds mode validation hook to bridge fucntions.
> >> Patch 3 fixes HDCP to work with both DBANC and !DBANC case by
> >> moving HDCP state handling into the bridge atomic check in line with=
=20
> >> the DBANC model.
> >> Patches 4,5 do necessary cleanup and alignment for using
> >> connector pointer.
> >=20
> > It's mentioned several times in your series, and it might be obvious to
> > you, but documenting what is the "DBANC framework" is would be helpful.
> > I have no idea what it's about, and it appears that Google doesn't know
> > either.
> Yes, I was a bit baffled initially. DRM_BRIDGE_ATTACH_NO_CONNECTOR.

Oooooh, thanks

> I think it makes sense to only use "DBANC" if it's first introduced in
> that patch. So don't have a patch that just uses "DBANC", even if the
> previous patch did explain what it means. And if there's just one or two
> "DBANC"s, just spell it out "DRM_BRIDGE_ATTACH_NO_CONNECTOR".

Yeah, I'd go even further. Acronyms are fun but something being obvious
is better still. Use the proper flag name every time.

Maxime

--oppcniarmalmqp3i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaRyc4gAKCRAnX84Zoj2+
dkF+AYDLi4SGtu8UPb+ng9rrJOxKwkHFZuBRyDEiXGPsIOBfBXQ2A5lkrWKumr+k
bXX6j/YBgKme80OjJvRY00ZimcxCE7/dzR/uRygHZnJGtgorADreFwbp1CTguOG9
LwJwRADBrg==
=H48m
-----END PGP SIGNATURE-----

--oppcniarmalmqp3i--
