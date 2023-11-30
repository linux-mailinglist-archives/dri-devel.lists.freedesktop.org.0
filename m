Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2147FEBD4
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 10:28:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B83410E174;
	Thu, 30 Nov 2023 09:28:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E294810E174
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 09:28:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 482B6B841F2;
 Thu, 30 Nov 2023 09:28:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FF0BC433C8;
 Thu, 30 Nov 2023 09:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701336488;
 bh=Y40c7C5K4pqWqN0+ur797YDI/9mVEZ6Ks1ldvsmx7Xw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lSmW7sAIr40qs7sVpiByKw3836RtLyslE4Z2pCVp3ew1G0O1xzzAsFv4yur2AXeyx
 sXP+tyITN0rH4VVwwj07rJQMQqgZHYVE5dP4QVUa0VcZmX2RZGLgfkM/feLGuQ9lOx
 1c0dLsarzcFBOlZGBwJg8kX15ElE/1TcrEB4X3E9uiYvuVMxW5yUp9XZyFnGorT7r/
 np56DQaUUst/8Kp3878aen7ewEQrTWEevW0RVYwLcdBO5jqS9grXW64J8x3ZzNcXNY
 eekN+VtCQ3H7pWBk0NeOO7e6HN24GuVu41fRuJ9H7gXv5ATVSIevXADeREdTktXfXI
 2+N3DUq05FyEw==
Date: Thu, 30 Nov 2023 10:28:05 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Donald Robson <donald.robson@imgtec.com>
Subject: Re: [PATCH 1/5] drm/imagination: Fixed warning due to implicit cast
 to bool
Message-ID: <lb5weoobtasmrj2iknhstdphvflapum4mqjuiu4vlkn6qn2n5a@fssce52lpkeu>
References: <20231129153703.162642-1-donald.robson@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ochkfrngyobckdx7"
Content-Disposition: inline
In-Reply-To: <20231129153703.162642-1-donald.robson@imgtec.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 matt.coster@imgtec.com, boris.brezillon@collabora.com, tzimmermann@suse.de,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ochkfrngyobckdx7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Donald,

It looks better, thanks :)

On Wed, Nov 29, 2023 at 03:36:59PM +0000, Donald Robson wrote:
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202311241752.3iLyyFcA-lkp@intel.com/
> Fixes: 1ff76f7a5b45 ("drm/imagination: Add GPU ID parsing and firmware loading")
> Signed-off-by: Donald Robson <donald.robson@imgtec.com>

However, we'll want some commit logs for all of these. You can have a
look at Arnd's which are very good example of what we expect, but some
small description of the issue, the fix and the warning from the
compiler is usually what we go for.

Thanks!
Maxime

--ochkfrngyobckdx7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWhVpQAKCRDj7w1vZxhR
xaS3AQDeq06UyHiu9THDsZTzr/zSZGHR12FDZ6s2HLy2D8THJAEAri1zu23eIU61
pAxOLvvYxy90pzq5U0RpJXweNGo/HwI=
=Naf4
-----END PGP SIGNATURE-----

--ochkfrngyobckdx7--
