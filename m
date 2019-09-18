Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBC6B65AF
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 16:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C60A36F4FF;
	Wed, 18 Sep 2019 14:17:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47EFE6F3BC
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 14:17:37 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A48A7218AF;
 Wed, 18 Sep 2019 14:17:36 +0000 (UTC)
Date: Wed, 18 Sep 2019 16:17:34 +0200
From: Maxime Ripard <mripard@kernel.org>
To: megous@megous.com
Subject: Re: [PATCH] drm: sun8i-ui/vi: Fix layer zpos change/atomic modesetting
Message-ID: <20190918141734.kerdbbaynwutrxf6@gilmour>
References: <20190914220337.646719-1-megous@megous.com>
MIME-Version: 1.0
In-Reply-To: <20190914220337.646719-1-megous@megous.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1568816257;
 bh=XlMjo+rJMmL2INhELdyisylIWWJuH9qmRMqjUBhMrPs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sCU4sOePodZ0NZRXVMNEveX/tym8IABAHl9TG6H3SeCs3z6Ppyi6VenSOym+Cfzv/
 3ND6vGPBodkNZ3H9Hg5nUSBl97swamBntj6Lwn2frijgY9Qnkfoi5WyjGHQxpgutMR
 VgymzYgeFrgM7zIt6dH/U6bBqd5Btwkwb3V7T2Mc=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0142618176=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0142618176==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cdt6atu5ilzdls4s"
Content-Disposition: inline


--cdt6atu5ilzdls4s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Sun, Sep 15, 2019 at 12:03:37AM +0200, megous@megous.com wrote:
> From: Ondrej Jirman <megous@megous.com>
>
> There are various issues that this re-work of sun8i_[uv]i_layer_enable
> function fixes:
>
> - Make sure that we re-initialize zpos on reset
> - Minimize register updates by doing them only when state changes
> - Fix issue where DE pipe might get disabled even if it is no longer
>   used by the layer that's currently calling sun8i_ui_layer_enable
> - .atomic_disable callback is not really needed because .atomic_update
>   can do the disable too, so drop the duplicate code
>
> Signed-off-by: Ondrej Jirman <megous@megous.com>

It looks like these fixes should be in separate patches. Is there any
reason it's not the case?

Maxime

--cdt6atu5ilzdls4s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXYI8fgAKCRDj7w1vZxhR
xb0xAP0UxpXjzIgS09xk7fwpffpkj2Q3Yv0Qg6MWjDlQTkd50gEAy9kA6SNT4uzq
55chDp6x+7ABhqgw1Undj9ZVA3OQbQA=
=Op1q
-----END PGP SIGNATURE-----

--cdt6atu5ilzdls4s--

--===============0142618176==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0142618176==--
