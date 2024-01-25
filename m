Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BF483CD80
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 21:36:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD0A10ECB2;
	Thu, 25 Jan 2024 20:36:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2024310ECB2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 20:36:05 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rT6SA-0008Lm-CV; Thu, 25 Jan 2024 21:36:02 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rT6S9-002MZd-0M; Thu, 25 Jan 2024 21:36:01 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rT6S8-0087kk-2x;
 Thu, 25 Jan 2024 21:36:00 +0100
Date: Thu, 25 Jan 2024 21:36:00 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 104/111] drm/bridge: ti-sn65dsi86: Make use of
 devm_pwmchip_alloc() function
Message-ID: <usyijt4ljaup3q3nfaycabiply63pratgfzaqmiekxkgpt7epi@dxgcgpovh7cb>
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
 <0316aaec9dbfc0c73788bcd3ee532ae7ecadb180.1706182805.git.u.kleine-koenig@pengutronix.de>
 <CAD=FV=Xscb2kv6drrqBBT2MOA0cSO3=oVZ4Hw3sKTo-uUuqQ-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ymtarg5ua2vmiokz"
Content-Disposition: inline
In-Reply-To: <CAD=FV=Xscb2kv6drrqBBT2MOA0cSO3=oVZ4Hw3sKTo-uUuqQ-w@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-pwm@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, kernel@pengutronix.de,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ymtarg5ua2vmiokz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Doug,

On Thu, Jan 25, 2024 at 09:48:04AM -0800, Doug Anderson wrote:
> On Thu, Jan 25, 2024 at 4:11=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> > @@ -1374,7 +1374,7 @@ static void ti_sn_pwm_pin_release(struct ti_sn65d=
si86 *pdata)
> >
> >  static struct ti_sn65dsi86 *pwm_chip_to_ti_sn_bridge(struct pwm_chip *=
chip)
> >  {
> > -       return container_of(chip, struct ti_sn65dsi86, pchip);
> > +       return pwmchip_get_drvdata(chip);
> >  }
>=20
> nit: given Linux conventions that I'm aware of, a reader of the code
> would see the name "pwm_chip_to_ti_sn_bridge" and assume it's doing a
> container_of operation. It no longer is, so the name doesn't make as
> much sense. ...and, in fact, the function itself doesn't make as much
> sense. Maybe just have all callers call pwmchip_get_drvdata()
> directly?

The upside of keeping the thin wrapper is that it returns the right
type, so I tend to keep it. Probably subjective, but even if it the
function should be dropped, I'd suggest to do that in a separate change
to keep the changes easier to review.

> In any case, this seems fine to me. I haven't done lots to analyze
> your full plans to fix lifetime issues, but this patch itself looks
> benign and I wouldn't object to it landing. Thus I'm OK with:
>=20
> Acked-by: Douglas Anderson <dianders@chromium.org>

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ymtarg5ua2vmiokz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWyxi8ACgkQj4D7WH0S
/k62RAf+PSko60t1q9U2MN7yPyyXemjUk3sqeQNrJKVDUN98SlBIK1on50lPQbgl
GRmrYm7zrxLPLH+++EolvmiFNMWo6jT8Hh1rvYt95bHXHT93/qn2q8DYM8m/17nf
0v41vSIi1sDDiFD+txxgJiLR6428+0HigPkUT9diLDuvg0MSHpQFUg3kdhSHqCIP
D+TGqc5+VABNN4oHtUEhdhjQb+tM+xMQhHE6eRNos9j+a6wh07Y7t4ohyG7skOSH
kiwZ1Zh03xUw1/odVTt0ET1pym/OJK2zsDn1WKmkBkxF3bjtHDfLrfJv0n8jGB/w
TlDlZ43CO0Ii0m0KBBhZKMYZ2a99Uw==
=r7Cj
-----END PGP SIGNATURE-----

--ymtarg5ua2vmiokz--
