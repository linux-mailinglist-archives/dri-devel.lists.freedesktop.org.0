Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F65C758ED5
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 09:24:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A56AE10E401;
	Wed, 19 Jul 2023 07:24:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653E210E401
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 07:24:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9634860B45;
 Wed, 19 Jul 2023 07:24:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B51BC433C7;
 Wed, 19 Jul 2023 07:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689751449;
 bh=XWWgYiOEFEKdSG/wjaVKJVtpMf5L+umNU5Tyi93RDbo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Dlrvlroo+aHZrtIrDj1jCxBCOAm5iwJPelTpgDD0QVB+l7dn7sL/Jeig4UQHOopCW
 qEsXpgubye0Kyp9L/TNhcggZpMx4JjXISsZabbMHf/PUmXaB8HJP53tcLQPAUCMEG5
 b+rJYaGtG17YZdqlkR3XjjCfeG0h6GpO2DnMd/oRzr0JR/HVdCzLP5Ld5ovCN/eXM2
 eHUG5Pt/9FDl/5U+H8+uyGe35/jxe0bhxglpza0KIqGIybDD0gEIccpjvpzLfWnyVL
 hXfE/AmCgK7D9ClRqIwgZxcrEnvgi3vfzh0gjW1dYoyM9qtYBBDops79KMAgbyKGWi
 p4v5yobAnN0gw==
Date: Wed, 19 Jul 2023 09:24:06 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
Subject: Re: [PATCH v2 1/4] drm: Add kernel-doc for
 drm_framebuffer_check_src_coords()
Message-ID: <mszd5jjugujg6p6qhq45zrnx4zirun76z3cvf5bwjhlebgwmdg@4lzokndi5jkb>
References: <20230718181726.3799-1-gcarlos@disroot.org>
 <20230718181726.3799-2-gcarlos@disroot.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4gusmduvap7f6sgp"
Content-Disposition: inline
In-Reply-To: <20230718181726.3799-2-gcarlos@disroot.org>
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
Cc: andrealmeid@igalia.com, tzimmermann@suse.de, tales.aparecida@gmail.com,
 dri-devel@lists.freedesktop.org, mairacanal@riseup.net, davidgow@google.com,
 michal.winiarski@intel.com, arthurgrillo@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--4gusmduvap7f6sgp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 18, 2023 at 03:17:23PM -0300, Carlos Eduardo Gallo Filho wrote:
> Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>

As a general rule of thumb, a commit log is always needed :)

Looks good otherwise, once fixed
Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--4gusmduvap7f6sgp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZLePlgAKCRDj7w1vZxhR
xblyAQDK10MJPk2VPD9zuZgzsYfkiCxzNhuYR9AjooMqVypUmQD7BUcsoR0vZbhq
1MK8aZGafHj33A9OI0fvC/HXSqDXwA4=
=Ewz0
-----END PGP SIGNATURE-----

--4gusmduvap7f6sgp--
