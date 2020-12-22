Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F242E0DB2
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 18:13:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F626E0DF;
	Tue, 22 Dec 2020 17:13:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31BAC6E0DF
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 17:13:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 55FD023130;
 Tue, 22 Dec 2020 17:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608657183;
 bh=QMc+Cnpq+Ddufqm1c2v+CyjZvDCdSht11+jAolorCxc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CS8JHhYJ5YgSDZlA0NjddtfXZTgC1Z3fcs9vuoi16+oLbWh1G5PYb9vwKVtKP5GLr
 lR1+78rQs7PignJx8koBMFyh8hotAVDad2YdUA7VBpKiojVDS19+wF/eFn2v+edEd1
 LGqhA/5YmxSoCXmykV9Yc6JaQuZkIpCKexegWD9NNXu/AdFkB5QbrYSK2syTKs4/Hw
 0oCTvLQQbSCuNzPkPxpwSg0I4HorrI8HV93jqjnBASNPVV0i/e4KRMwM3YnrVhDapW
 cgDVQLzlfrq5tgSsx/4OXx/TWUiA9rAdZrJsJ+W9cBdPTIgF/tJH1S4EopLxCltqTN
 aAq7zIHqO7iGw==
Date: Tue, 22 Dec 2020 17:12:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Drop redundant maxItems/items
Message-ID: <20201222171247.GB5269@sirena.org.uk>
References: <20201222040645.1323611-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20201222040645.1323611-1-robh@kernel.org>
X-Cookie: Truth can wait
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jassi Brar <jaswinder.singh@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dmaengine@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1592834589=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1592834589==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uQr8t48UFsdbeI+V"
Content-Disposition: inline


--uQr8t48UFsdbeI+V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 21, 2020 at 09:06:45PM -0700, Rob Herring wrote:
> 'maxItems' equal to the 'items' list length is redundant. 'maxItems' is
> preferred for a single entry while greater than 1 should have an 'items'
> list.

Acked-by: Mark Brown <broonie@kernel.org>

--uQr8t48UFsdbeI+V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/iKQ4ACgkQJNaLcl1U
h9BplAgAgMSrJkYiQbh1znz9wN7xnXMTpux0VVJprS9HHh2tnjwzlKS947zZ0q3u
8Mt9Y+XyQf0uqpNcqskq47lPHRMP7Ijo8abvyVe09UYQ/abIojhriXFwRJyOnt3A
U35kRF1wvK7ppmCtZy7uSgLuB3JcEuvJiYHN33BCvxBYYmpNl0fnt2/XHO0tm9q+
8R7+asRLB41jBvgGzhDXg8Iw4XwNLvpVStuU89rxIJhon2jacFTcDyI51B45kCRh
CoqhVphzpvpD0ySa4C7I0GAL6tXmBOt+NYpEChvE4OKgldYl9KiYMBsNdZmtmkuG
c36cabybF2Yn8Y1UN/YJ3NTKvarpKg==
=7Cxt
-----END PGP SIGNATURE-----

--uQr8t48UFsdbeI+V--

--===============1592834589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1592834589==--
