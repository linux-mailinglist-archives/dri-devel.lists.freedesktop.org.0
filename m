Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F094A596B9
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 14:51:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B6D310E292;
	Mon, 10 Mar 2025 13:51:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nVmd/kXu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9037B10E0E5
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 13:51:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6140B5C662C;
 Mon, 10 Mar 2025 13:48:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3019AC4CEEB;
 Mon, 10 Mar 2025 13:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741614673;
 bh=Es9DYIbOCvddMNCMB1N4LXfb4XFWVevll/hVNIpQhQM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nVmd/kXuTHkNgqXj6PX0a8/D1eHIl2hMZq46609cklZPZPplSUZBmOoFKBdHhWInY
 nkxGJ6l2TktZyjTEZS8ExDZdlM2NXb9oP9oM34XirJ5I6Xcc1x87VwvIC2HhEGvYkm
 DFIv5IO4Yj71yMYO+TVfamSQ6u+JaAZJV5Ak5SxOztl/ND0p+oC4aGgD9SOf9PTXAs
 jhAcI3kkvQwbfHkbh4ejxydYl+MNVpcuUA2DwQulF/NMH915rRPbyorkjwJdaCYPaE
 eWWdoPgsbk/cyXdHQ9QGnaPek4QWu2YVn0rbv0gy+3nsT4KmqlpKjaQJ+H7dWmcsyW
 sfl1toAt091eg==
Date: Mon, 10 Mar 2025 14:51:10 +0100
From: Maxime Ripard <mripard@kernel.org>
To: David Turner <david.turner@raspberrypi.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 kernel-list@raspberrypi.com, linux-sound@vger.kernel.org
Subject: Re: [PATCH V2 2/2] drm/vc4: hdmi: Add jack detection to HDMI audio
 driver
Message-ID: <20250310-efficient-nonchalant-lorikeet-e14fc6@houat>
References: <20250304193912.5696-1-wahrenst@gmx.net>
 <20250304193912.5696-3-wahrenst@gmx.net>
 <20250306-delectable-quixotic-polecat-ecd2c3@houat>
 <CACXvZi-NT1e8YXJEmcHyf29eSr5NSL2fdLXfQb5amCf_YFL16A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wbzi2mywobytncqp"
Content-Disposition: inline
In-Reply-To: <CACXvZi-NT1e8YXJEmcHyf29eSr5NSL2fdLXfQb5amCf_YFL16A@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--wbzi2mywobytncqp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH V2 2/2] drm/vc4: hdmi: Add jack detection to HDMI audio
 driver
MIME-Version: 1.0

On Thu, Mar 06, 2025 at 03:47:27PM +0000, David Turner wrote:
> Hi all,
>=20
> On Thu, 6 Mar 2025 at 13:39, Maxime Ripard <mripard@kernel.org> wrote:
> > It looks fairly generic to me. Is there any reason you didn't put it in
> > the HDMI audio helpers?
>=20
> I originally wrote the downstream patch last year on 6.6, before the
> generic HDMI audio code existed.
>=20
> I just had a look at doing this.  At the moment drm_hdmi_audio_helper
> doesn't manage the snd_soc_card (needed to setup the jack) at all,
> that still lives in vc4_hdmi_audio, so I can't see an easy way to move
> this over without a lot more reorganising.


Ah, yes, of course. Most (all?) the other drivers just use an external
I2S controller so the card is mostly likely going to be described
through simple-card.

I guess we can always turn that code into a helper if a similar case
comes along in the future.

Thanks,
Maxime

--wbzi2mywobytncqp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ87uTgAKCRDj7w1vZxhR
xQFtAQCcn+WnymsJWLNDwnp9IG/O2RDSYMTmIETZ3NFuaaeOwQEAsQZReyCZR9rK
Ql1QslSWA5ClgWPNFPgISDUHS2WpFAE=
=Vj9v
-----END PGP SIGNATURE-----

--wbzi2mywobytncqp--
