Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C06B9F30AF
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 13:39:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF86E10E03B;
	Mon, 16 Dec 2024 12:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KtfuvfOL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 391A010E03B;
 Mon, 16 Dec 2024 12:39:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9A5F6A40E22;
 Mon, 16 Dec 2024 12:37:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DEBDC4CED3;
 Mon, 16 Dec 2024 12:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734352750;
 bh=Xyflv/QGtzfe7hlxQvQHqobKDpH4s565cZx2xJ81WKI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KtfuvfOLhyZqEc8Hrjmo54M+cdxq7XvEMqZc7f8sET2AdFw7mg37ltcu+clwsEEpG
 IXcFgIrreR6URd/1gTgYbWLEk5YGoBBdavAxdvibmXrQqqQ6EkzP7Y/gRAWF0kiJKH
 SWdix/ao604o6Fu9Elb5WpYvSQCA+zolm4Qf1N9ZDtypUr6v07HmiEKQU7YsELgkp/
 2sCXWDehg3fspmhewffxjzBlFLqsilQSuBOP1r1y90UPVlGx1yMij+WEhRrZaWlR/+
 sS3PkUTAxB1AincgoVDu9gSYQzfbF1WTux+FXXmM2Vrth8qvKeg+YdAo9nMMUn19TY
 jocoizIJfUgHw==
Date: Mon, 16 Dec 2024 13:39:07 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Imre Deak <imre.deak@intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Lyude Paul <lyude@redhat.com>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, Karol Herbst <kherbst@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v3 0/7] drm/connector: Expose only a properly inited
 connector
Message-ID: <20241216-ambitious-horse-of-force-b57ce8@houat>
References: <20241211230328.4012496-1-imre.deak@intel.com>
 <Z2AbmXNwQv8YRzfD@ideak-desk.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="xusxrjvcycgj7wid"
Content-Disposition: inline
In-Reply-To: <Z2AbmXNwQv8YRzfD@ideak-desk.fi.intel.com>
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


--xusxrjvcycgj7wid
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 0/7] drm/connector: Expose only a properly inited
 connector
MIME-Version: 1.0

Hi,

On Mon, Dec 16, 2024 at 02:22:49PM +0200, Imre Deak wrote:
> are you ok to merge patches 1-9 to drm-misc-next? Patches 10,11 could be
> merged then to drm-intel-next after back-merging drm-misc-next to
> drm-intel-next.

Sounds good to me

Maxime

--xusxrjvcycgj7wid
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ2AfagAKCRAnX84Zoj2+
dn8iAX958Tj3tXQEPdErkNTEKz4am4gomRdyIJw3mG9mXTGamK+Mqc6ptxgid2Wi
K2aUWK4BfRfhHtzsw3DOy5ihw5FbxZ0b29pRvEAa1IybxV3/Tn6CteQYfBrvCLUy
AiobQXqAwA==
=8Lig
-----END PGP SIGNATURE-----

--xusxrjvcycgj7wid--
