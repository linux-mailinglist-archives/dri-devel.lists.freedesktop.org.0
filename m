Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 776F110058C
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 13:25:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9DE06E4C7;
	Mon, 18 Nov 2019 12:25:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86706E4C7
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:25:45 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3DAAD206F4;
 Mon, 18 Nov 2019 12:25:45 +0000 (UTC)
Date: Mon, 18 Nov 2019 13:25:43 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 13/13] drm/connector: Hookup the new drm_cmdline_mode
 panel_orientation member
Message-ID: <20191118122543.GH4345@gilmour.lan>
References: <20191113164434.254159-1-hdegoede@redhat.com>
 <20191113164434.254159-13-hdegoede@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191113164434.254159-13-hdegoede@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1574079945;
 bh=sWWlid/E+k4797O5pgSxd/ZbjD9GpXfe0v4MSfYvWWk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I3vLP+VdC7r9VFHuOIJI+cG8kvnm9JmP7o52a3xD9Llw+7N9he7V6ERCrRnAwGEje
 2NGGRlZSWTVQn54OlRP5y026uG21gd7lcGwbA8URQW9x/MrQYJNtuhtizUPU3x2Ouv
 WvLvs0123hYZb8EDi+gYCa5reXn589XjlpoBmSjI=
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
Content-Type: multipart/mixed; boundary="===============0872204463=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0872204463==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Y8PUpsPJkqCiojFW"
Content-Disposition: inline


--Y8PUpsPJkqCiojFW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 13, 2019 at 05:44:34PM +0100, Hans de Goede wrote:
> If the new video=... panel_orientation option is set for a connector, honor
> it and setup a matching "panel orientation" property on the connector.
>
> BugLink: https://gitlab.freedesktop.org/plymouth/plymouth/merge_requests/83
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--Y8PUpsPJkqCiojFW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXdKNxwAKCRDj7w1vZxhR
xbZmAQCBUDo+LOumoX1a8NgFmFm4ayFfoEckLOmLG0ia3iH1xQEA5ptuVUwXdyJh
NOoS/lXI51nBEP9ipQ6299gwM5Ki6g4=
=Fxiy
-----END PGP SIGNATURE-----

--Y8PUpsPJkqCiojFW--

--===============0872204463==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0872204463==--
