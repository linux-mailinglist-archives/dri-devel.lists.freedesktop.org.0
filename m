Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D20FF6C0232
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 14:59:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D85710E17A;
	Sun, 19 Mar 2023 13:59:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56A310E17A
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Mar 2023 13:59:49 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdtZO-00084S-47; Sun, 19 Mar 2023 14:59:34 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdtZF-005EpL-GH; Sun, 19 Mar 2023 14:59:25 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdtZE-0069Xx-JX; Sun, 19 Mar 2023 14:59:24 +0100
Date: Sun, 19 Mar 2023 14:59:21 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 01/19] drm/bridge: cdns-mhdp8546: Improve error reporting
 in remove callback
Message-ID: <20230319135921.bf3awq3h36kb4q3e@pengutronix.de>
References: <20230318190804.234610-1-u.kleine-koenig@pengutronix.de>
 <20230318190804.234610-2-u.kleine-koenig@pengutronix.de>
 <20230319131301.GF10144@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4l6o75go7fvuq2tc"
Content-Disposition: inline
In-Reply-To: <20230319131301.GF10144@pendragon.ideasonboard.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Jani Nikula <jani.nikula@intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--4l6o75go7fvuq2tc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 19, 2023 at 03:13:01PM +0200, Laurent Pinchart wrote:
> Hi Uwe,
>=20
> Thank you for the patch.
>=20
> On Sat, Mar 18, 2023 at 08:07:46PM +0100, Uwe Kleine-K=F6nig wrote:
> > Replace the generic error message issued by the driver core when the re=
move
> > callback returns non-zero ("remove callback returned a non-zero value. =
This
> > will be ignored.") by a message that tells the actual problem.
> >=20
> > Also simplify a bit by checking the return value of wait_event_timeout a
> > bit later.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> >  .../drm/bridge/cadence/cdns-mhdp8546-core.c    | 18 +++++++++---------
> >  1 file changed, 9 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/driv=
ers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> > index f6822dfa3805..d74c6fa30ccc 100644
> > --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> > +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> > @@ -2574,7 +2574,6 @@ static int cdns_mhdp_remove(struct platform_devic=
e *pdev)
> >  {
> >  	struct cdns_mhdp_device *mhdp =3D platform_get_drvdata(pdev);
> >  	unsigned long timeout =3D msecs_to_jiffies(100);
> > -	bool stop_fw =3D false;
> >  	int ret;
> > =20
> >  	drm_bridge_remove(&mhdp->bridge);
> > @@ -2582,18 +2581,19 @@ static int cdns_mhdp_remove(struct platform_dev=
ice *pdev)
> >  	ret =3D wait_event_timeout(mhdp->fw_load_wq,
> >  				 mhdp->hw_state =3D=3D MHDP_HW_READY,
> >  				 timeout);
> > -	if (ret =3D=3D 0)
> > -		dev_err(mhdp->dev, "%s: Timeout waiting for fw loading\n",
> > -			__func__);
> > -	else
> > -		stop_fw =3D true;
> > -
> >  	spin_lock(&mhdp->start_lock);
> >  	mhdp->hw_state =3D MHDP_HW_STOPPED;
> >  	spin_unlock(&mhdp->start_lock);
> > =20
> > -	if (stop_fw)
> > +	if (ret =3D=3D 0) {
> > +		dev_err(mhdp->dev, "%s: Timeout waiting for fw loading\n",
> > +			__func__);
> > +	} else {
> >  		ret =3D cdns_mhdp_set_firmware_active(mhdp, false);
> > +		if (ret)
> > +			dev_err(mhdp->dev, "Failed to stop firmware (%pe)\n",
> > +				ERR_PTR(ret));
>=20
> Why not simply
> 			dev_err(mhdp->dev, "Failed to stop firmware (%d)\n",
> 				ret);
>=20
> ? Apart from that,

%pe is superior to %d because

	Failed to stop firmware (EIO)

is easier to understand for humans than

	Failed to stop firmware (-5)

=2E Don't you agree?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--4l6o75go7fvuq2tc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQXFTgACgkQj4D7WH0S
/k6tzwf/QJF84dwfyio+iDK11VDsRsp4zsVNK6jU4WOZXNOS8+sh50UQZN9jATGT
j7CQ1nrKrsbuMQxV5N71UsU0E4qxqDBLmN6RWdinJdhCjiQgpfKRyBL7oI5Y8cCE
LK93jWExm8ckIV7ieb9LQlTXlqDmgxvBd+yiXOjwDp3C2lLzTi9d9/eJIRnXImC9
Q1rgIGiu0qoShYeNdB+PArl8ELZID/2PQix89k32KKE5Xl93G2F8ownfRRopquDa
b035mDY6EUEGhSD1fqlFtkf1K0vOonBFUerPQsK1/9/84dmgrnN6lK90CdNKP57B
RBESTSbSvvq8VMPZwq6Xf2v6OJ6z9A==
=ua5H
-----END PGP SIGNATURE-----

--4l6o75go7fvuq2tc--
