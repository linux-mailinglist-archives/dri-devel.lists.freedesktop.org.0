Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E7B80897F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 14:50:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 810B210E8A1;
	Thu,  7 Dec 2023 13:50:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAD610E8A1
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 13:50:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 46774B826DA;
 Thu,  7 Dec 2023 13:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E4E6C433C8;
 Thu,  7 Dec 2023 13:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701957026;
 bh=yUAdx07yF2KU9PqNutuNANsFaNouztr1VRl3adegEvQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WY5eY4qleFFukLyeW/DfSt/h4TEHEctoCnActWjnndcS81FUCQakbLIGqKdJiscbT
 8wfMMT9YJD3FmMQI4sHcbWwVfMAFn8AyoSm4ylywnS1SOKa026wOFnOyLMh/7+jzL2
 JcUaU5Qv10LWQUwwb0ArEUR18EzSbDRwqEqOZU11UNl6S6X9nmn8CjXcmQSrRxNh5D
 rB3pOzfWabM+fcrrqpSpPnSz8aMyvYYgy+tsJKVW9uLdiQSHlMCvB/1TDq2L2TIlA6
 qb7qT1hZUGBTygecY/ZOYrapXdpHn6Fi6L+sk+8b+TjlNMB82Eba8GYSllsK0VGH24
 ruu+78aMBQ/8g==
Date: Thu, 7 Dec 2023 14:50:23 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH 4/5] drm/atomic: Make the drm_atomic_state documentation
 less ambiguous
Message-ID: <sonwtjpdr2uwalfp2m54gef2dzboresix2pselywz6y7oy7xux@a2rigro2uipu>
References: <20231204121707.3647961-1-mripard@kernel.org>
 <20231204121707.3647961-4-mripard@kernel.org>
 <20231205105106.06a34b81.pekka.paalanen@collabora.com>
 <20231205111529.3b75bff2.pekka.paalanen@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bkfrkc7r2zyw77m7"
Content-Disposition: inline
In-Reply-To: <20231205111529.3b75bff2.pekka.paalanen@collabora.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--bkfrkc7r2zyw77m7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 05, 2023 at 11:15:29AM +0200, Pekka Paalanen wrote:
> On Tue, 5 Dec 2023 10:51:06 +0200
> Pekka Paalanen <pekka.paalanen@collabora.com> wrote:
>=20
> > On Mon,  4 Dec 2023 13:17:06 +0100
> > Maxime Ripard <mripard@kernel.org> wrote:
> >=20
> > > The current documentation of drm_atomic_state says that it's the "glo=
bal
> > > state object". This is confusing since, while it does contain all the
> > > objects affected by an update and their respective states, if an obje=
ct
> > > isn't affected by this update it won't be part of it.
> > >=20
> > > Thus, it's not truly a "global state", unlike object state structures
> > > that do contain the entire state of a given object.
> > >=20
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
>
> could you figure out how your email got the linux.ie address for Dave
> Airlie?
>=20
> I got a bounce from skynet.ie when replying to all. Maybe there is a
> leftover email address for Dave still somewhere?

Yep. In my mutt aliases file :)

It's fixed now, thanks

Maxime

--bkfrkc7r2zyw77m7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXHNnwAKCRDj7w1vZxhR
xZoyAP9EdbE6gXDqu8hRuBbhbSCroTjuQ7Wqqu8yO/hG9W2l5wD/YD2nyRNmMvot
OMZ9aRz4J/7MtAUI8ryFj4BiY+5blAU=
=Anni
-----END PGP SIGNATURE-----

--bkfrkc7r2zyw77m7--
