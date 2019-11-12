Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5275AF9A39
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 21:05:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 686CB6E147;
	Tue, 12 Nov 2019 20:05:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D363A6E147
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 20:05:32 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 261A421872;
 Tue, 12 Nov 2019 20:05:31 +0000 (UTC)
Date: Tue, 12 Nov 2019 21:05:29 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Torsten Duwe <duwe@lst.de>
Subject: Re: [PATCH] drm/bridge: fix anx6345 compilation for v5.5
Message-ID: <20191112200529.GD4345@gilmour.lan>
References: <20191112175940.GA13539@lst.de>
MIME-Version: 1.0
In-Reply-To: <20191112175940.GA13539@lst.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1573589132;
 bh=Snz++UdcsaVDqtyqzKDLVJnVYN3dmVpXMHJ3jUKP5IY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vYvIjyxkX5Zo8smdNu3bWGbERygoEFwwa6KXjuXfQq+TRCeAWsmEJn1F8txa55XNl
 dcJm4I7iUpp3pdW1mO1EXGRS1dC5mvoij3dl3829qiouhIb/BOWR7tZJJ0XfhQKzdh
 RpvjGbVD5r2n9ALYNjdqHeXzOjS8r6oIv9wTYj5U=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vasily Khoruzhick <anarsoul@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, Sean Paul <seanpaul@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: multipart/mixed; boundary="===============0121188059=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0121188059==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="K3iCROrs1P5jLO0B"
Content-Disposition: inline


--K3iCROrs1P5jLO0B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 12, 2019 at 06:59:40PM +0100, Torsten Duwe wrote:
>
> The anx6345 driver originally was copied from anx78xx.c, which has meanwhile
> seen a few changes. In particular, the removal of drm_dp_link helpers and the
> discontinuation to include drm_bridge.h from drm_crtc.h breaks compilation
> in linux-5.5. Apply equivalents of these changes to anx6345.c.
>
> Signed-off-by: Torsten Duwe <duwe@suse.de>
>
> ---

I've pushed that fix, but it still doesn't compile on x86. I'm
guessing you're missing a depends on OF in the Kconfig option.

Maxime

--K3iCROrs1P5jLO0B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXcsQiQAKCRDj7w1vZxhR
xfxeAQCbVisRTcE1Ce3PVDIcGzEUIJUMob4fd21aFdLYVx1lNQD+JpvMUuRpM4sh
Juw/GRayY3iQ60DmSudqv+xFhRjsMAk=
=+el9
-----END PGP SIGNATURE-----

--K3iCROrs1P5jLO0B--

--===============0121188059==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0121188059==--
