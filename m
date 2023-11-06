Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEC67E1BB2
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 09:09:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1608D10E27E;
	Mon,  6 Nov 2023 08:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1D210E27E
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 08:09:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 14499CE0AE3;
 Mon,  6 Nov 2023 08:09:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0559C433C7;
 Mon,  6 Nov 2023 08:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699258140;
 bh=cQd+azsc2oimsjoDW+JNBoyhlpbKfDDSir8RkjpSStI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NZuFwbyfcJ9n4MbPS3NTDxWXf8dc/DZRPA2EkILBNwTduseifJa3Tm2dlWB/Qf6hk
 rueTRIMmZgWx8SFUOJwOVr3sNJXvZv4ZtRI1xl7dgGCQ1BVT8Okd2zCD4fTm2l4Qjq
 BLp1CCYqcLHHFDgN3tkIfGbUKPBi7EEhmKXD1QYA99zy1aflGkPASb2iUO6B+sgK8m
 zOmd+mKe0G6OY6G0B+TdyiR/FTcgBN+qPQsMOddBWtTlJNre6o1JJyuoOc+GoBWAmI
 GbA5i3KcgOv8+3smAVof21QsCdW4N/Zm4jqpMTMnvoYOvIc1xfG3c4v1GDrXVqL92K
 xtV5Q1aptclpw==
Date: Mon, 6 Nov 2023 09:08:57 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 3/4] drm/modes: Add a function to clear preferred modes
Message-ID: <sezmpwogythlst6hnmrpq4hepkdcd764vbgcojidlfotm5boa6@txbcylifakwz>
References: <20231102221309.1971910-1-hsinyi@chromium.org>
 <20231102221309.1971910-4-hsinyi@chromium.org>
 <CAD=FV=VUNdSzppccDO=y0iu_QR8nEe3poRLMmWvFMfZsnWZo4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zqnepkdr67hu4afr"
Content-Disposition: inline
In-Reply-To: <CAD=FV=VUNdSzppccDO=y0iu_QR8nEe3poRLMmWvFMfZsnWZo4A@mail.gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--zqnepkdr67hu4afr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 03, 2023 at 09:02:33AM -0700, Doug Anderson wrote:
> Hi,
>=20
> On Thu, Nov 2, 2023 at 3:13=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org>=
 wrote:
> >
> > Add a function to clear the preferred bit of a connector's existing mod=
es.
> > This is useful for edp panel to unset the preferred modes read from edid
> > if the panel has hard-coded modes.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> > v1->v2:
> > - fix doc string (reported by kernel test robot).
> > - split mode and panel patches.
> > ---
> >  drivers/gpu/drm/drm_modes.c | 16 ++++++++++++++++
> >  include/drm/drm_modes.h     |  1 +
> >  2 files changed, 17 insertions(+)
>=20
> This seems fine to me.
>=20
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>=20
> Since it introduces a new API to the core and Hsin-Yi and I work
> directly together, I'd probably give this ~2 weeks on the list before
> landing so there is adequate time for people to comment. That'll be
> right in the middle of Plumbers, though, so it might be more like 3
> weeks. If someone non-ChromeOS wants to review and/or apply sooner, I
> certainly wouldn't object.

FTR, I just made some review on v1 that still applies to that version.

Maxime

--zqnepkdr67hu4afr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZUifGQAKCRDj7w1vZxhR
xdH7AQC1JzbaPpA3miMXGslhsTqX06/6ak67NTh9Xg6ELjtkkwD/eI7TgL8/stY9
lgUDUqvMS5ffwioajaaqRDIPwJ+V/gY=
=Usd2
-----END PGP SIGNATURE-----

--zqnepkdr67hu4afr--
