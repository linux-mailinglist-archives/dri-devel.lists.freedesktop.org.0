Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67800B8AF9
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 08:20:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ABE06EA84;
	Fri, 20 Sep 2019 06:20:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2BD86EA84
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 06:20:22 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F354C20882;
 Fri, 20 Sep 2019 06:20:21 +0000 (UTC)
Date: Fri, 20 Sep 2019 08:20:20 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>
Subject: Re: drm/sun4i: Add missing pixel formats to the vi layer
Message-ID: <20190920062020.zyt5ng6cxtu6muye@gilmour>
References: <20190918110541.38124-1-roman.stratiienko@globallogic.com>
 <9229663.7SG9YZCNdo@jernej-laptop>
MIME-Version: 1.0
In-Reply-To: <9229663.7SG9YZCNdo@jernej-laptop>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1568960422;
 bh=3T4MBrrvAFoM5nVfdPzS+xVdO3QHAnjJT4ytFIM+Gzg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mT2ka4Nr4v3hC4nSuZb/06NB6lhQVzdlxhnSSPfNNayqKve2YzN4WH4VeVKY4W0Gc
 fNAtOezhXRjHaXQ9apdMWD0/JySkkD1/VPZW1ifChgNla8HItF8DsQmmqsWo9980Kh
 JcNFloX/JArYE27T3xdjnJuWgm8H+OkvFQdwaDLQ=
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
Cc: roman.stratiienko@globallogic.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0585991285=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0585991285==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jyakblbkkxwj5w7k"
Content-Disposition: inline


--jyakblbkkxwj5w7k
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 19, 2019 at 08:53:10PM +0200, Jernej =C5=A0krabec wrote:
> Dne sreda, 18. september 2019 ob 13:05:41 CEST je
> roman.stratiienko@globallogic.com napisal(a):
> > From: Roman Stratiienko <roman.stratiienko@globallogic.com>
> >
> > According to Allwinner DE2.0 Specification REV 1.0, vi layer supports t=
he
> > following pixel formats:  ABGR_8888, ARGB_8888, BGRA_8888, RGBA_8888
>
> It's true that DE2 VI layers support those formats, but it wouldn't change
> anything because alpha blending is not supported by those planes. These
> formats were deliberately left out because their counterparts without alp=
ha
> exist, for example ABGR8888 <-> XBGR8888. It would also confuse user, whi=
ch
> would expect that alpha blending works if format with alpha channel is
> selected.

I'm not too familiar with the DE2 code, but why is alpha not working
if the VI planes support formats with alpha?

Thanks!
Maxime

--jyakblbkkxwj5w7k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXYRvowAKCRDj7w1vZxhR
xRW4AP91J8qXurWjaYEIlShut/9F1o+AH+QFka253dVyQ1XzmQD9GKVxtyQFNqro
T6dUZ4eM7nZmoFWRwll07iRaM6lFVQM=
=cHIh
-----END PGP SIGNATURE-----

--jyakblbkkxwj5w7k--

--===============0585991285==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0585991285==--
