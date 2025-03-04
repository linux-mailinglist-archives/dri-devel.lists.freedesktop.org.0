Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F97A4E693
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 17:46:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5810110E5DF;
	Tue,  4 Mar 2025 16:46:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XxI2Hw/e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9FE10E5DF
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 16:46:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 05C935C5EAF;
 Tue,  4 Mar 2025 16:43:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C5D3C4CEE5;
 Tue,  4 Mar 2025 16:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741106768;
 bh=eoJB3OLgTrk+lA8oBYKJiwXc8eqZCVoHFloR0SzQllY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XxI2Hw/ea4eI+SoFuS3K0cKmjGZ3ZtNccc4VskQyfpMe9NvMF1jUiRpqZ5JXH6WOz
 xTW+Xqi2T0wkOQvH8nU/K8EGesDgQdsAp9TjhaDz+K2V5VtF3s1ggT95YSVYgoGSw4
 kybnoo9e4Isp3EZrQi39i1S2GZ+KuKZs6XyH3STW0z3iP5VX/Q+P11pvaELXqQ15ON
 hlr84h6hwEx3deXvRLoHlOqbvXrJjXsT7iMd1HtwcCDxHstS3mGb/YT4RjDpXvltMU
 xrguuGDPBPlcgTpmDwe4jPyfRk6QyUFJ+WpucTNsm9STEu6fgv5p4pDfqJN2uPlqXW
 2QIon9Rrb9LUQ==
Date: Tue, 4 Mar 2025 17:46:05 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/vc4: hdmi: Fix some NULL vs IS_ERR() bugs
Message-ID: <20250304-adaptable-monumental-octopus-a8ea0e@houat>
References: <a952e2b4-d4b8-49ac-abd9-9967c50f4a80@stanley.mountain>
 <CAN9Xe3R-nyCcTRhDTeWFrW9EVnpdRG2Nyz=qjiYB0pzFM3NxWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="jmdly7fe3anaxwwp"
Content-Disposition: inline
In-Reply-To: <CAN9Xe3R-nyCcTRhDTeWFrW9EVnpdRG2Nyz=qjiYB0pzFM3NxWw@mail.gmail.com>
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


--jmdly7fe3anaxwwp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH next] drm/vc4: hdmi: Fix some NULL vs IS_ERR() bugs
MIME-Version: 1.0

On Tue, Mar 04, 2025 at 10:22:29AM -0500, Anusha Srivatsa wrote:
> Thanks for the fix. I shall revisit the rest of my series.
>=20
> Reviewed-by: Anusha Srivatsa <asrivats@redhat.com>

It's already been applied

Maxime

--jmdly7fe3anaxwwp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ8cuTQAKCRAnX84Zoj2+
di70AYC6ULd7dct3xCYAhUfz5uJpVATAd7zazZggq/xnzOI2jlTCF4qgyYPwrYew
KYdyTE8BgMZZK7VY6cp70tbWDArNUO9U0wES2zr7mCr3dAutBqpCvO2EYu6hlbSL
5cbIq5Uu5w==
=Jmp5
-----END PGP SIGNATURE-----

--jmdly7fe3anaxwwp--
