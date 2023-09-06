Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF1A793B71
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 13:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EAA610E135;
	Wed,  6 Sep 2023 11:35:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A3610E135
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 11:35:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 14D40B81A1A;
 Wed,  6 Sep 2023 11:35:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 638CEC433C7;
 Wed,  6 Sep 2023 11:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694000140;
 bh=R8cX6KBAOR46kqNyWM5gSlQFjpzLIdHBLmnmWEd82Cg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tpiWsu7HogmInxaMLnRjvlJgp1n/vNaB9C7CnsCWxJs5ThTRQ/IM3708Vht7shtCK
 jOU6ITZ6+Ml9yRqXds4l8H0hFoEaICnZMi9hm86XtUyOGWdCqC1Zngmbw52bqHk3Vi
 ZPSBhM7R1AcYL4DI0VFHCC6bjD6tLo+jo6tXubr55pMtq9TgLk2W5yFbcgijor0lFq
 2Bk5/psx8VBPsEu7arDV0JW3bGGby1ew4lNS9upVJCQZF+HZiW4peKp1HI7EG11ZUX
 LVwSKUlFQQU+78OYbsWkuunBTQhM42XaaIWpyG7YExvFzAHyADVolEMN/xb8jWgC9G
 2ZBlnPJPXSpUQ==
Date: Wed, 6 Sep 2023 13:35:37 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Sarah Walker <sarah.walker@imgtec.com>
Subject: Re: [PATCH v6 02/20] drm/gpuva_mgr: Helper to get range of unmap
 from a remap op.
Message-ID: <7z6t4sudgits372e26f37gydfxxonsduiajurr7ztgvmh3crch@mbeb66xwin5s>
References: <20230906095542.3280699-1-sarah.walker@imgtec.com>
 <20230906095542.3280699-3-sarah.walker@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kgq6kck2vs7tqvol"
Content-Disposition: inline
In-Reply-To: <20230906095542.3280699-3-sarah.walker@imgtec.com>
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
Cc: linux-doc@vger.kernel.org, hns@goldelico.com,
 dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 matthew.brost@intel.com, corbet@lwn.net, luben.tuikov@amd.com, dakr@redhat.com,
 donald.robson@imgtec.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 matt.coster@imgtec.com, robh+dt@kernel.org, faith.ekstrand@collabora.com,
 linux-kernel@vger.kernel.org, afd@ti.com, boris.brezillon@collabora.com,
 tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--kgq6kck2vs7tqvol
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sarah,

On Wed, Sep 06, 2023 at 10:55:24AM +0100, Sarah Walker wrote:
> From: Donald Robson <donald.robson@imgtec.com>
>=20
> Signed-off-by: Donald Robson <donald.robson@imgtec.com>

Sorry, this applied to your previous versions too but I only caught it
right now. When you submit a patch on someone else's behalf, you need to
add your Signed-off-by. That's also true when you're the committer of a
patch you didn't write.

This one, and patch 1, are affected.

Also, generally speaking, it's a good to write a commit log for a patch
to at least provide some context on what you want to achieve.

Maxime

--kgq6kck2vs7tqvol
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZPhkCQAKCRDj7w1vZxhR
xXXKAP9f8E7gk6BdQrqtOlP19X5C2PDO24NNYUt53ReNjMx1IQEAvg2g5mAfgBOv
7sh6wvmMaiVlRQbQiibMAh1kOMIXYAQ=
=qF9D
-----END PGP SIGNATURE-----

--kgq6kck2vs7tqvol--
