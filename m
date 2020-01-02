Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EF612E4D1
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 11:08:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD2F89F2D;
	Thu,  2 Jan 2020 10:08:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81FC689F2D
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2020 10:08:35 +0000 (UTC)
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ECB4020866;
 Thu,  2 Jan 2020 10:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577959715;
 bh=x+kRT2D1Kn7Lf5nh9cGLkMkzex1mV1+rt2WXH85GIi4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NcZ1gTpS9ZvXDi5jA7DNk42YY4dfQY3uFvtZSH2ldAvzg3sN5DkND5yikXFrXrilf
 u7+WxXig3U6Hsn0lVM/SpchgomNPm5q/PDKX0Nz8JE76d7i9AXfIDxawh1z+WtzFLh
 7jpbHCGZPpfvOtRr9TGddKUETlpqoBTc+hlhOY2Y=
Date: Thu, 2 Jan 2020 11:08:32 +0100
From: Maxime Ripard <mripard@kernel.org>
To: roman.stratiienko@globallogic.com
Subject: Re: [PATCH v3 2/2] drm/sun4i: Use CRTC size instead of PRIMARY plane
 size as mixer frame.
Message-ID: <20200102100832.c5fc4imjdmr7otam@gilmour.lan>
References: <20200101204750.50541-1-roman.stratiienko@globallogic.com>
 <20200101204750.50541-2-roman.stratiienko@globallogic.com>
MIME-Version: 1.0
In-Reply-To: <20200101204750.50541-2-roman.stratiienko@globallogic.com>
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
Cc: jernej.skrabec@siol.net, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0395659020=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0395659020==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eij2leiodiz6sky6"
Content-Disposition: inline


--eij2leiodiz6sky6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Wed, Jan 01, 2020 at 10:47:50PM +0200, roman.stratiienko@globallogic.com wrote:
> From: Roman Stratiienko <roman.stratiienko@globallogic.com>
>
> According to DRM documentation the only difference between PRIMARY
> and OVERLAY plane is that each CRTC must have PRIMARY plane and
> OVERLAY are optional.
>
> Allow PRIMARY plane to have dimension different from full-screen.
>
> Fixes: 5bb5f5dafa1a ("drm/sun4i: Reorganize UI layer code in DE2")
> Signed-off-by: Roman Stratiienko <roman.stratiienko@globallogic.com>

So it applies to all the 4 patches you've sent, but this lacks some
context.

There's a few questions that should be answered here:
  - Which situation is it fixing?
  - What tool / userspace stack is it fixing?
  - What happens with your fix? Do you set the plane at coordinates
    0,0 (meaning you'll crop the top-lef corner), do you center it? If
    the plane is smaller than the CTRC size, what is set on the edges?

Thanks!
Maxime

--eij2leiodiz6sky6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXg3BIAAKCRDj7w1vZxhR
xRAgAP9QwzO6tt8HxHevGLJBWJuDC9qBUkk3iJWXTPHclJfsRwEA+VsyeUKuAxRL
/ZAvWo9lYy6wvymqssndD03TUld2Pwc=
=T74d
-----END PGP SIGNATURE-----

--eij2leiodiz6sky6--

--===============0395659020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0395659020==--
