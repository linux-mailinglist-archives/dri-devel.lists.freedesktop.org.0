Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8968410058D
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 13:26:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 185786E4CD;
	Mon, 18 Nov 2019 12:26:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FBD06E4CB
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:26:00 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BBB06206F4;
 Mon, 18 Nov 2019 12:25:59 +0000 (UTC)
Date: Mon, 18 Nov 2019 13:25:57 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 09/13] drm/modes: parse_cmdline: Add support for
 specifying panel_orientation (v2)
Message-ID: <20191118122557.GI4345@gilmour.lan>
References: <20191113164434.254159-1-hdegoede@redhat.com>
 <20191113164434.254159-9-hdegoede@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191113164434.254159-9-hdegoede@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1574079960;
 bh=tBT4yetRkVsPMG3NZEBGpsbtPGIvzNhMKJyUS6g5W4g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bTOrfaQXPzG/QawOZTQnTMJ1UwNQ10FXovupl+yIcmnIOY6P8Gg6xDY33ZrHLqSeH
 LLlnPAxW0D3pshkRnYxozl2gRt9qNSRxkq3FdX9f258nTi9MxpoZdevWPE+7Pea2AC
 lhYATQzwZR49w00FatynA0sy8jgqwC5sDXOksVh4=
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
Cc: David Airlie <airlied@linux.ie>, Derek Basehore <dbasehore@chromium.org>,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mathieu =?iso-8859-1?Q?Alexandre-T=E9treault?= <alexandretm@amotus.ca>
Content-Type: multipart/mixed; boundary="===============1620992091=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1620992091==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kvWJmX0bB3Sab/3X"
Content-Disposition: inline


--kvWJmX0bB3Sab/3X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 13, 2019 at 05:44:30PM +0100, Hans de Goede wrote:
> Sometimes we want to override a connector's panel_orientation from the
> kernel commandline. Either for testing and for special cases, e.g. a kiosk
> like setup which uses a TV mounted in portrait mode.
>
> Users can already specify a "rotate" option through a video= kernel cmdline
> option. But that only supports 0/180 degrees (see drm_client_modeset TODO)
> and only works for in kernel modeset clients, not for userspace kms users.
>
> The "panel-orientation" connector property OTOH does support 90/270 degrees
> as it leaves dealing with the rotation up to userspace and this does work
> for userspace kms clients (at least those which support this property).
>
> Changes in v2:
> -Add missing ':' after @panel_orientation (reported by kbuild test robot)
>
> BugLink: https://gitlab.freedesktop.org/plymouth/plymouth/merge_requests/83
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--kvWJmX0bB3Sab/3X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXdKN1QAKCRDj7w1vZxhR
xWYzAP9swi3Ck5m39PW81GIQcLneKM6b6W6P2ttPWSa7Zj6ONQD/bKTE29elYmKj
qBV37OFTj3w2AnLbcULyDanX9fnJkwY=
=t6kD
-----END PGP SIGNATURE-----

--kvWJmX0bB3Sab/3X--

--===============1620992091==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1620992091==--
