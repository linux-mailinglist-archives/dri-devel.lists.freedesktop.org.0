Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 145197972FD
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 16:16:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB1510E7EA;
	Thu,  7 Sep 2023 14:16:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B108510E7E8
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 14:16:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 372D1B81E58;
 Thu,  7 Sep 2023 14:16:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76AA4C3278E;
 Thu,  7 Sep 2023 14:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694096168;
 bh=8JrzSlPOHU42GkQamw58PH/veXFBL+Cm8CkXRD1KyBs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aDRHKrZszzGp/6+LOcfk9eZT8hKdqPBDm5GWZU8g9kZIgK2Yjnc1ufry1hSWZgstG
 aK6gQnBBm6C+Wbv+9fncPONMT5VcYt0fdjp71vEZADzucV5uXCc4DFjyjg+og/Wn81
 J497F5KUv2CKlV/uiYBHPga47FLQqObrIuC8gOvxfGY8b/0OuMEtxKa0e7BOetzecu
 8GLFbbjjG5C/2+kg6zKONPV9itQ0dkYZS/a016VIAgAH4yHwUttlDL6mvhZzY1jjmi
 VhD2FnUdJQQsD+WNL8I3CyB1O4CGo08Q0V5aaaQARs9Y6+QzJAPPMD2RRXFE4ytRLj
 N3uP4SxNexslA==
Date: Thu, 7 Sep 2023 16:16:06 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [RFC PATCH 04/10] drm/panel_helper: Introduce drm_panel_helper
Message-ID: <5lumjodqq4r5ycy3ch4bo476as6wzztuokounc554x55ds3j4t@olco7idlqyvv>
References: <CAD=FV=XUhzguFCC=aKzHFMV0bBnZzkHXP_tx+P=PNkVr=8SnTA@mail.gmail.com>
 <mumiep5q7x7qj7k64h3cyodxrgk737iy5rum5keguquwymf2gy@3qruwfrqjgy7>
 <CAD=FV=VEene+nr1us87iA+bomxzQ039r-E+wqvizvFGbxXjDvA@mail.gmail.com>
 <wwzbd7dt5qyimshnd7sbgkf5gxk7tq5dxtrerz76uw5p6s7tzt@cbiezkfeuqqn>
 <CAD=FV=XcUVvg5Om__dD=i9zu7ZtQmvWicms9yN7w0c2nWGhqYg@mail.gmail.com>
 <p7okuysh442hulqls3ekbaar2bguqv67fum3gsb2cj75kjvdpx@uebwlgvf46sy>
 <CAD=FV=Xr4nZUeHY-FdiedcV=BuP5szNBEHPKjdRnA7c+3MADqg@mail.gmail.com>
 <nahwibpea2akyg7swbdb3f6xyv7fqs35v5spqbjfzfchxnoqqz@glgg5core75d>
 <CAD=FV=UKSc4mNjWcvLCXT9Tdeok=xRjA0oVoLKVkq+kQ9-4M0A@mail.gmail.com>
 <CAD=FV=UZOxT58=jx4=iAyjXGnON_qROy4puosT0WfB5yy+2Ndw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5nfgr3jzpbtcxkrl"
Content-Disposition: inline
In-Reply-To: <CAD=FV=UZOxT58=jx4=iAyjXGnON_qROy4puosT0WfB5yy+2Ndw@mail.gmail.com>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--5nfgr3jzpbtcxkrl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 05, 2023 at 12:12:58PM -0700, Doug Anderson wrote:
> Hi,
>=20
> On Tue, Sep 5, 2023 at 9:45=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
> >
> > As per our discussion, in V2 we will make drm_panel_remove() actually
> > unprepare / disable a panel if it was left enabled. This would
> > essentially fold in the drm_panel_helper_shutdown() from my RFC patch.
> > This would make tdo_tl070wsh30_panel_remove() behave the same as it
> > did before. Ugh, though I may have to think about this more when I get
> > to implementation since I don't think there's a guarantee of the
> > ordering of shutdown calls between the DRM driver and the panel.
> > Anyway, something to discuss later.
>=20
> Ugh, ignore the above paragraph. I managed to confuse myself and was
> thinking about shutdown but talking about remove. Sigh. :( Instead,
> pretend the above paragraph said:
>=20
> As per our discussion, in V2 we will make drm_panel_remove() actually
> unprepare / disable a panel (and print a warning) if it was left
> enabled. This would essentially fold in the
> drm_panel_helper_shutdown() from my RFC patch (but add a warning).
> This would make tdo_tl070wsh30_panel_remove() behave the same as it
> did before with the addition of a warning if someone tries to remove a
> currently powered panel.

Ok, that works for me :)

Maxime

--5nfgr3jzpbtcxkrl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZPnbJgAKCRDj7w1vZxhR
xYdXAQDS1cue4E9OGS5pb/O++U6pd9L1ArAFEFEdqpxuMiBe3gEAiNmyCk2ECIUW
yQIGM7RiEMhRg+3HAkhmIIFKRYuv9AI=
=kxSy
-----END PGP SIGNATURE-----

--5nfgr3jzpbtcxkrl--
