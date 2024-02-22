Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB9185F56A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 11:14:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32D6110E6C5;
	Thu, 22 Feb 2024 10:14:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FwCI0rqL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6C010E6C5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 10:14:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 23E5FCE20A8;
 Thu, 22 Feb 2024 10:14:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10BE3C43390;
 Thu, 22 Feb 2024 10:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708596862;
 bh=foxoZ9LRpQOe6jh8rAu3IF9Z8ybhG9+6DsKDBavcozc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FwCI0rqLgZV9yA15sWrKEcXlBSluDIaDzP8pgdBsSuu/SfBglNugA5Y6DNF6WvTH8
 uopNoQ4tdKPqLzRLihuTKB0Wsis81z6VdlIRnNxgCMxzcuGOisZrQW3JbVz3Mb+Uka
 1HbBQtazSbJF1mR1vuGtUNWjkjtJk7n/U62V+5ip84QqUkeOD9KOvOaOpmdT3K+5YO
 uyDXRiah7wcpH6GtL4WQleTPnTewamYqvBhXrIFMiqUkIr/OT1Dw80OlBvOn+87noj
 9F+BJaOvZUGcsaKARp1qS4EDLVI8feMf51GHLFN5El73RXqOX9BXWwJKxkS4iGjd8+
 o5iOxmC91/41g==
Date: Thu, 22 Feb 2024 11:14:19 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Stephen Rothwell <sfr@canb.auug.org.au>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH] drm: renesas: rz-du: Fix redefinition errors related to
 rzg2l_du_vsp_*()
Message-ID: <dmtawf7kybdkhf3tjp5chuwn54szunlme7l3gtq7bn7sxntvge@ozgpn3lljhmg>
References: <20240222095630.85949-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="marwcfzepqmkg4oh"
Content-Disposition: inline
In-Reply-To: <20240222095630.85949-1-biju.das.jz@bp.renesas.com>
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


--marwcfzepqmkg4oh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Thanks for working on this

On Thu, Feb 22, 2024 at 09:56:30AM +0000, Biju Das wrote:
> Fix the redefinition errors for the below functions on x86 by replacing
> CONFIG_DRM_RCAR_VSP->IS_ENABLED(CONFIG_VIDEO_RENESAS_VSP1) and adding
> EXPORT_SYMBOL_GPL for all:
>  1) rzg2l_du_vsp_init()
>  2) rzg2l_du_vsp_enable()
>  3) rzg2l_du_vsp_disable()
>  4) rzg2l_du_vsp_atomic_flush()
>  5) rzg2l_du_vsp_get_drm_plane()

This really should be two patches: you're fixing some symbols not being
exported (because they need to be called by what other module?) and then
fixing the redefinition error you're mentionning in the title.

Maxime

--marwcfzepqmkg4oh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZdceegAKCRDj7w1vZxhR
xSXXAQD4/RsuTn9UG1AMaOfUFVlhuIdi8EERjmWBgkb/aa7WsgD/XkYEWYepMCUW
43cjCILRWHh0JVgavn5ak51VjRkXbgk=
=Pxd1
-----END PGP SIGNATURE-----

--marwcfzepqmkg4oh--
