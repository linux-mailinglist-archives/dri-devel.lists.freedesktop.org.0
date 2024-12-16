Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFE09F2ED7
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 12:07:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4177510E5A9;
	Mon, 16 Dec 2024 11:06:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LuraBuVR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E2310E59B
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 11:06:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E17A05C5855;
 Mon, 16 Dec 2024 11:06:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C9ECC4CED0;
 Mon, 16 Dec 2024 11:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734347215;
 bh=ywX1oQ18iE2vfl6WWVI5VhJrNL5RQwd7RuMeVyNwMPo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LuraBuVRAsnT6gD6C7MwpftgUMyIgYT4jkPbZClcgUHIgAQbC3jyzh6rp0mzYYjQ9
 S77N5jO5/+eVUMBEypsuJVhCL93MHcLSf43s6E2Ip7NAUIMgHRv8wG2lir8TPB9krm
 y/rLWcKUEr6h+6IxBIjotw01LmIQuIXb8pHXN2avcmpvAusM35Z9mE6FLifuFVMh0n
 pUvkZVluitwzgRgyfZGEeylP/GPop6sIGG8GDYlGsYRQPcxpmNfOfBRqqm9Ed7h2+y
 K2/Nw08o+rCIzzK/eGQ3WKO/wS/3VI16wsgqRAaQxDG1Futl/oYWxvLgwAt+gWq0YQ
 kbOnp8+CbVr7g==
Date: Mon, 16 Dec 2024 12:06:53 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org, robdclark@gmail.com
Subject: Re: [PATCH v3 0/2] drm: Allow encoder modeset when connectors are
 changed
Message-ID: <20241216-daring-opalescent-herring-bfdc8f@houat>
References: <20241211-abhinavk-modeset-fix-v3-0-0de4bf3e7c32@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="cve54abmjy6zy4ki"
Content-Disposition: inline
In-Reply-To: <20241211-abhinavk-modeset-fix-v3-0-0de4bf3e7c32@quicinc.com>
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


--cve54abmjy6zy4ki
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 0/2] drm: Allow encoder modeset when connectors are
 changed
MIME-Version: 1.0

On Wed, Dec 11, 2024 at 01:18:41PM -0800, Jessica Zhang wrote:
> Call encoder mode_set() when connectors are changed. This avoids issues
> for cases where the connectors are changed but CRTC mode is not.

Looks great, thanks a lot for doing the tests :)

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--cve54abmjy6zy4ki
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ2AJyAAKCRAnX84Zoj2+
doAKAX4pPBt7VLBlP5IvAhuVZ6Shqdm2H1X/lYRp7MyncmWE+FL5eQP1/vfD6ZnC
E/VtNa8BfR6R5wMfrQSRkkVWpIUeUVmiq2gpikdFQ5+i6Pwonp/GABF2PdLHhXaU
6Mv00hJLEQ==
=c2zP
-----END PGP SIGNATURE-----

--cve54abmjy6zy4ki--
