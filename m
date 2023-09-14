Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2A67A04EC
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 15:05:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA0110E0CC;
	Thu, 14 Sep 2023 13:05:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6056310E0CC
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 13:05:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 38BF2CE2319;
 Thu, 14 Sep 2023 13:05:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D38DC433CA;
 Thu, 14 Sep 2023 13:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694696725;
 bh=YHbADKQ6uhUELFMVb5GWya0ymsNBgFatl1XxYxyNA7Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KWyJ43+jLMGArriTRLaEhSVb9CDR3iUsmGMnpCRQW7g1WMmbzEI1HqZohhDfDCHs3
 O2eSB3418GU3+/vtDV+wMVBjdmVxxsA/Qmz900QVLR39LFsZa/BoNk70w9Q2NtuBho
 tV3+5HVnP1yNR9jFoXtt1mEbc6wpTPD6RdHiZoBpMJK0kWoj16bv7y2YEdGw03eoc1
 +45inNYAbPlPLUpwj4RYbwgUqEO3QQh6AW3fQ8WCIra/5A25oCjlNazynbPXoIIJ47
 CezSY/QxP4FxPYCTMSd+uNo83d7a9OeIET/x+K2Ah2U4vI6FHg9TOKW4/P5mOBSAfc
 yh9/qaxIUZk0w==
Date: Thu, 14 Sep 2023 15:05:22 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v4] drm/ssd130x: Store the HW buffer in the
 driver-private CRTC state
Message-ID: <4norb2kxq4uxs3imi3qjxhyxpvnyf5cpl4sg7yyf3ydrykqhfl@cb3w4wstak7r>
References: <20230913052938.1114651-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dov6lznkfrfwqaip"
Content-Disposition: inline
In-Reply-To: <20230913052938.1114651-1-javierm@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--dov6lznkfrfwqaip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Wed, Sep 13, 2023 at 07:29:25AM +0200, Javier Martinez Canillas wrote:
>  static const struct drm_crtc_helper_funcs ssd130x_crtc_helper_funcs = {
>  	.mode_valid = ssd130x_crtc_helper_mode_valid,
> -	.atomic_check = drm_crtc_helper_atomic_check,
> +	.atomic_check = ssd130x_crtc_helper_atomic_check,
>  };

Sorry I didn't catch that sooner, but there's no reason to call that
function a helper.

With that fixed (and feel free to fix while applying)

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--dov6lznkfrfwqaip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZQMFEgAKCRDj7w1vZxhR
xXIhAP9OFI6JCdZluvIUtxdFCWKErbu4NsjR8lWb+91ICcT0mQEAmOI1mtSwaYXY
8foP5Le4d57nb7aRnPbzxWptxjeoOgI=
=wLxW
-----END PGP SIGNATURE-----

--dov6lznkfrfwqaip--
