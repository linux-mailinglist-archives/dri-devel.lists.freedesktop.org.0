Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9104A8D192F
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 13:13:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E8E410E614;
	Tue, 28 May 2024 11:13:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nlZruYZH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B930210E600;
 Tue, 28 May 2024 11:12:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BEFB861E75;
 Tue, 28 May 2024 11:12:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DBE5C32781;
 Tue, 28 May 2024 11:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716894777;
 bh=3rPjQMH0spyLRLysMnC+8uLAxHoFyiHsGR9/+icJuTA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nlZruYZHNcdYggDSw6i0+eu6AbyHAH2ek9Q/r6rDvh+/SIXPNz87b7WHzSC3/cOq7
 3MBEv71WCFDlQPl/2oJJ0im7BtkwVVi6ufcX5TlGdbve/XXx6B1pNec4CsWq8cRPCl
 tFFeRtTU6z1RXQPcadVTyw4d4tjH/aCJ2IqjNxpPONeD9amIF+VGG3eIJbTfG4yly3
 1r6kLUAPHMB/QXDBuHxlmZ3pS5FV//+L276Mhg5HN+GH2nUqcJOFGXD78Re8I41w/g
 v3JwdfuwUr+r5ngnzZegSL49OOi4Kenk3+T8xKo/0EENMmPX5K124pcDCj5PknT66Y
 y2REO4hdHI7aw==
Date: Tue, 28 May 2024 13:12:54 +0200
From: "mripard@kernel.org" <mripard@kernel.org>
To: "Manna, Animesh" <animesh.manna@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, 
 "Nikula, Jani" <jani.nikula@intel.com>, "Hogander,
 Jouni" <jouni.hogander@intel.com>, 
 "Murthy, Arun R" <arun.r.murthy@intel.com>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v6 3/6] drm/display: Add missing aux less alpm wake
 related bits
Message-ID: <20240528-mongoose-of-eminent-aurora-0503bb@houat>
References: <20240527082636.1519057-1-animesh.manna@intel.com>
 <20240527082636.1519057-4-animesh.manna@intel.com>
 <PH7PR11MB5981DB0A17046BFC9E5A6BE0F9F12@PH7PR11MB5981.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="oou6hmo2hd3odedr"
Content-Disposition: inline
In-Reply-To: <PH7PR11MB5981DB0A17046BFC9E5A6BE0F9F12@PH7PR11MB5981.namprd11.prod.outlook.com>
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


--oou6hmo2hd3odedr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2024 at 10:04:06AM GMT, Manna, Animesh wrote:
> + drm-core maintainer
>=20
> Hi,
>=20
> Could you please have a look and ack this patch.
> Received r-b from Jouni on 0th patch for the whole patch series.

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--oou6hmo2hd3odedr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZlW8MQAKCRAnX84Zoj2+
dg7AAX0WtNJTSIbNWDohFUoZq/n00H16cZALk+6rVlos/7kX4KF4J9p/51Ucn+ut
l5gKafwBfjvrFUUXn/LuIJCUXYlwLUFeDTXljY8Y/d5TO7bdgRnpZjF9Qjh5eRb3
EGYtzBtf0Q==
=BYek
-----END PGP SIGNATURE-----

--oou6hmo2hd3odedr--
