Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD55A13256A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 12:57:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A498589110;
	Tue,  7 Jan 2020 11:57:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E3889110
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 11:57:40 +0000 (UTC)
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 12FF2207E0;
 Tue,  7 Jan 2020 11:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578398260;
 bh=AI+VfAqTa9UCq8IvejkTKMbTJBx1EJ58qhLOA9wGowE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A55wtQnfkltHy8t1jJOI3SXpwJjrT4aTNOuU48IslkaNiRawRyKfRrMyRh5XKdhJP
 jmi9V4548UnWlidEPJux/55Vln5PPtfMHeF2zXnhQS1Pl+sewNtKIUrcKeyzoDMtip
 h2uzk/OjTAIk/DCvrzzPMg4EnDoUndAgwVYCSTNE=
Date: Tue, 7 Jan 2020 12:57:37 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Wambui Karuga <wambui.karugax@gmail.com>
Subject: Re: [PATCH] drm/sun4i: use PTR_ERR_OR_ZERO macro.
Message-ID: <20200107115737.ybaxsjyvfaledfje@gilmour>
References: <20200106140052.30747-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200106140052.30747-1-wambui.karugax@gmail.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1405985618=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1405985618==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yo7cidopzvqnu2id"
Content-Disposition: inline


--yo7cidopzvqnu2id
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Mon, Jan 06, 2020 at 05:00:52PM +0300, Wambui Karuga wrote:
> Replace the use of IS_ERR and PTR_ZERO macros by returning the
> PTR_ERR_OR_ZERO macro.
> Changes suggested by coccinelle.
>
> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>

Unfortunately, that patch came up a number of time and shouldn't have
been a coccinelle script in the first place.

I've sent a patch to remove that script:
https://lore.kernel.org/lkml/20200107073629.325249-1-maxime@cerno.tech/

Maxime

--yo7cidopzvqnu2id
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXhRyIwAKCRDj7w1vZxhR
xYDqAP4n1dm9IQoXmI7Bx40vuU1hQtG4nyx+pIljTVCbkWCjFQD9G8aJvCqjVRId
JX/7qRsTP2Iifrmf5iMSo3e4cGz8NwA=
=ilwZ
-----END PGP SIGNATURE-----

--yo7cidopzvqnu2id--

--===============1405985618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1405985618==--
