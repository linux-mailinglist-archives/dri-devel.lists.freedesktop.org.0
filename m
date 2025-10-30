Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4307C202D6
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 14:11:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9F510E2A5;
	Thu, 30 Oct 2025 13:11:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rA7J4Wn8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1FF310E2A5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 13:11:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 45286405E9;
 Thu, 30 Oct 2025 13:11:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68589C4CEF1;
 Thu, 30 Oct 2025 13:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761829871;
 bh=cUfmunFmOKx1Kdn9OOY6+9IMgFP68sYho/khWU56jgs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rA7J4Wn8SUe44IeZE5HtGG5H8CyV3vHl3VMZF+ZoYxFIR8fG2tAbMKlv44iMS9ZRN
 yI9himw24uEDo20AfpucXeaqQp0Tog9INey2ObSrlEgwtyG4GkoyeUkyDJnT6p8vFb
 VNN/0fBzLuuxRdyoLRWSNVvAW30OV4dt+vGpVNXPMQttnNFlhlhkAnsEnTYDRFMA0Y
 9uZF2Tmxp/nOOLIdXwiOMmTo+4pBo27D/QOFYxNE7k+qAOz5qZKv/6/QYeyIBP44D5
 qb11DKEmfCWaCg9zocdgZhiGKpjqE3UVVcIlh4Nq0FizwhNFvHYzGsDyG3490A0AV9
 sx207KDsQB9Ag==
Date: Thu, 30 Oct 2025 13:11:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] Revert "drm/display: bridge_connector: get/put
 the stored bridges"
Message-ID: <7873e2ab-a8ea-4fdc-8534-746f91c8368b@sirena.org.uk>
References: <20251017-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v2-0-667abf6d47c0@bootlin.com>
 <20251017-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v2-1-667abf6d47c0@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="UaEwUEMakzRpcyay"
Content-Disposition: inline
In-Reply-To: <20251017-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v2-1-667abf6d47c0@bootlin.com>
X-Cookie: Marriage, n.:
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


--UaEwUEMakzRpcyay
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2025 at 06:15:04PM +0200, Luca Ceresoli wrote:
> This reverts commit 2be300f9a0b6f6b0ae2a90be97e558ec0535be54.
>=20
> The commit being reverted moved all the bridge_connector->bridge_*
> assignments to just before the final successful return in order to handle
> the bridge refcounting in a clean way.

Is there any news on getting this series merged - the currently broken
code in -next is causing boot issues on several affected platforms (eg,
Rock5B) which is disrupting other testing?  If the other patches are
somehow causing issues could we perhaps get the revert in to fix the
boot issue while those issues are resolved?

--UaEwUEMakzRpcyay
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkDY+cACgkQJNaLcl1U
h9CppAf8CCGhznw7w0TXi5YjdWcrrOmjeDEoIv1HKQcYKRGO+/tahZ3lbX8bnuLN
CpBj57Mzat1s/wXgZzlPaXSS2rbb1Jq6zNTjfZ46NV39LV8cyzV7u9rZx8ldGp9q
rIZY/xPwufbrGAc7M8J6JyYDUJGu4RFFlAcvhppN3wbyU42Om+3ZFqCp8lZlN/tT
suYQK0vLrRIiZB4FjQgUzSULdO1FFphEd7Zc0H/7CEleFUIraStxtd6d+TWh3iq0
pYJXU0xezs+G15RjdmrRGazvhlVG6BXqn+GjS1aVKTyk+w5zSSc9mOuBn4U2gsjG
YfwhD1DqMRKDOzB3Cw5gxk3yR2YQrg==
=6XLc
-----END PGP SIGNATURE-----

--UaEwUEMakzRpcyay--
