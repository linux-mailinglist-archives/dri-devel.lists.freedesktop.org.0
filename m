Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D468B61F302
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 13:25:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA10010E2F8;
	Mon,  7 Nov 2022 12:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F398510E2F8
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 12:25:11 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id CB2DB3200951;
 Mon,  7 Nov 2022 07:25:08 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 07 Nov 2022 07:25:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1667823908; x=1667910308; bh=8zbcJPjw6I
 Bg2prP+2YZ7c39PRUZiLjGL6NLamslrCQ=; b=i7v+HKoT68Yj/H9ge7J+TH/mv8
 nln1uIVWt7OXdH9oTX3dq+TjqxOYrYpU6RKQbGQ/aXjJU9Jh2tk+o3C7I6Fzdn01
 m5y2GXnrbqTqVXdhlCwb2vZqB6tto0ffcHnk4Hj0dpZFQXDhs/EtSYoe2Ta3BbQw
 IuAyGTkPXmr5DSCWx6ENPnyjdNSl9lVguyUEbMnUDLDriyyWqyBSL4rcZE3OvE4x
 Omx/xxT/EYBoXxdiZIthnx+zaLUDruj3AIttTnqbmbMeCCfsWgNy9/qxV/0qWvnv
 sSLd83VgsRZsJlksnT1gbA0rtYBYwr0E0Pl5rM0yNTooulcy7scZIV6rJ53A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1667823908; x=1667910308; bh=8zbcJPjw6IBg2prP+2YZ7c39PRUZ
 iLjGL6NLamslrCQ=; b=SRWpX/MomPQWny7iBPt8NmW7wUPfxNmgRMGJIsVWXv/S
 Jzq0ZFeDZ+kR70RtGQ/zadTphiWoAksP/PlcQBJ6FC3flJLXhREvDSrvYG77Ma1q
 6TWST8bFsYRpmQjxlrwwg1ZGpyEA9TgDSTydOHzx9XuTE/mLLf69AE7f+bpKndle
 2EsWFHxCc+DtZScWMf/7Jz57jAkv5MXTBMMT1AcOw5prXyHrmv8Y4idRiVb9e7jW
 YMNvbjSCJGj1eETMD7baEd1aRrTC38FSgSTHK8cK4W1fnxdlhEwqPSkKMSzdUMks
 8yAnB/peGqg/OIKVGJ5uXUvwYjNaon4OuOegn22ZcQ==
X-ME-Sender: <xms:IvloY3l87bh-n3PmDwJghNGij4k7K6MCd2iroNKP4nOkJ449ALOyBw>
 <xme:IvloY63RdBDcFO13gYxZj2JXxHcP9dKI8NjbJp_SeLzaqq3V2nl7_aOauYASXxTZ7
 NWzPPj6IyYvNnYP_Os>
X-ME-Received: <xmr:IvloY9oM-z5hJMfyVu5i49BpvJXP2MsHYVXhC83YGZ1wMQpVzB2J2snpP6-In5QmZYNUcOQpbEE6W5ZiWZATwmM1VB7ZPvpBF8BNQuNMioenLg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdekgdefkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheehfffh
 vedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:IvloY_nAS4ikOCawbgDU3YSNZ4wbGNPzuL5hIdDq3RAB8g-HbzDLKQ>
 <xmx:IvloY12kcCfrKpvJn-Usw0ytBt_X8yUDW9BkZBNJUI7HYaA-R1VnJw>
 <xmx:IvloY-slRKspol3OO_qRRtqSigBoQKO08YBYvjo-_wK9F1m5UkwO8w>
 <xmx:JPloY5J6IsqGyE33nufbHO6Vcb-3AfJuziuhAh3mTZdUmECmwdnPpA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Nov 2022 07:25:06 -0500 (EST)
Date: Mon, 7 Nov 2022 13:25:04 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm: do not call detect for connectors which are forced on
Message-ID: <20221107122504.tejlb24bjbaxw5t6@houat>
References: <20220826091121.389315-1-mrodin@de.adit-jv.com>
 <YzYrNJbfGcch1UtX@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="62xmu4e52wowxf7x"
Content-Disposition: inline
In-Reply-To: <YzYrNJbfGcch1UtX@pendragon.ideasonboard.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Michael Rodin <mrodin@de.adit-jv.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, michael@rodin.online,
 Sean Paul <seanpaul@chromium.org>, Alex Deucher <alexander.deucher@amd.com>,
 erosca@de.adit-jv.com, Vincent Abriou <vincent.abriou@st.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--62xmu4e52wowxf7x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2022 at 02:33:08AM +0300, Laurent Pinchart wrote:
> Hello Michael,
>=20
> Thank you for the patch. Sorry for the late reply, I wasn't on the CC
> list so I didn't notice it.
>=20
> On Fri, Aug 26, 2022 at 11:11:21AM +0200, Michael Rodin wrote:
> > "detect" should not be called and its return value shall not be used wh=
en a
> > connector is forced as hinted in the commit d50ba256b5f1 ("drm/kms: sta=
rt
> > adding command line interface using fb.") and the commit 6fe14acd496e
> > ("drm: Document drm_connector_funcs"). One negative side effect of doing
> > this is observed on the RCar3 SoCs which use the dw-hdmi driver. It
> > continues executing drm_helper_hpd_irq_event even if its connector is
> > forced to ON. As consequence drm_helper_hpd_irq_event calls "detect" so=
 the
> > connector status is updated to "disconnected":
> >=20
> > [  420.201527] [drm:drm_helper_hpd_irq_event] [CONNECTOR:76:HDMI-A-1] s=
tatus updated from connected to disconnected
> >=20
> > This status is corrected by drm_helper_probe_single_connector_modes sho=
rtly
> > after this because this function checks if a connector is forced:
> >=20
> > [  420.218703] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR=
:76:HDMI-A-1] status updated from disconnected to connected
> >=20
> > To avoid similar issues this commit adapts functions which call "detect"
> > so they check if a connector is forced and return the correct status.
> >=20
> > Fixes: 949f08862d66 ("drm: Make the connector .detect() callback option=
al")
>=20
> Is this really the right fixes tag ? The call to .detect() in
> drm_helper_hpd_irq_event() predates that commit.
>=20
> > Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
> > ---
> >  drivers/gpu/drm/drm_probe_helper.c | 16 ++++++++++++++--
> >  1 file changed, 14 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_p=
robe_helper.c
> > index bb427c5a4f1f..1691047d0472 100644
> > --- a/drivers/gpu/drm/drm_probe_helper.c
> > +++ b/drivers/gpu/drm/drm_probe_helper.c
> > @@ -289,7 +289,12 @@ drm_helper_probe_detect_ctx(struct drm_connector *=
connector, bool force)
> >  retry:
> >  	ret =3D drm_modeset_lock(&connector->dev->mode_config.connection_mute=
x, &ctx);
> >  	if (!ret) {
> > -		if (funcs->detect_ctx)
> > +		if (connector->force =3D=3D DRM_FORCE_ON ||
> > +		    connector->force =3D=3D DRM_FORCE_ON_DIGITAL)
> > +			ret =3D connector_status_connected;
> > +		else if (connector->force =3D=3D DRM_FORCE_OFF)
> > +			ret =3D connector_status_disconnected;
> > +		else if (funcs->detect_ctx)
> >  			ret =3D funcs->detect_ctx(connector, &ctx, force);
> >  		else if (connector->funcs->detect)
> >  			ret =3D connector->funcs->detect(connector, force);
> > @@ -340,7 +345,14 @@ drm_helper_probe_detect(struct drm_connector *conn=
ector,
> >  	if (ret)
> >  		return ret;
> > =20
> > -	if (funcs->detect_ctx)
> > +	if (connector->force =3D=3D DRM_FORCE_ON ||
> > +	    connector->force =3D=3D DRM_FORCE_ON_DIGITAL)
> > +		ret =3D connector_status_connected;
> > +	else if (connector->force =3D=3D DRM_FORCE_OFF)
> > +		ret =3D connector_status_disconnected;
> > +	else if (funcs->detect_ctx)
> > +		ret =3D funcs->detect_ctx(connector, ctx, force);
> > +	else if (funcs->detect_ctx)
> >  		ret =3D funcs->detect_ctx(connector, ctx, force);
>=20
> Those two conditions are identical.
>=20
> >  	else if (connector->funcs->detect)
> >  		ret =3D connector->funcs->detect(connector, force);
>=20
> The same logic is used in two places in this patch. Could this be
> factored out to a separate function ? It may even be possible to
> refactor drm_helper_probe_detect() and drm_helper_probe_detect_ctx() to
> share more code between the two functions.

I just had a look, and it doesn't seem trivial. The obvious way would be
to make drm_helper_probe_detect_ctx allocate a context and call
drm_helper_probe_detect. The thing is, drm_helper_probe_detect will call
drm_helper_probe_detect_ctx if its context is NULL.

I guess we could have drm_helper_probe_detect allocate the context
itself if it's null, but handling differently the back-off and freeing
logic is probably going to add more complexity.

I'm not sure it's worth it for simple functions like this.

> This being said, I'm not sure this is the right fix. Beside the i915 and
> nouveau drivers, the only callers of drm_helper_probe_detect() are
> drm_helper_probe_single_connector_modes(), output_poll_execute() and
> check_connector_changed() in this file. The first two functions already
> check connector->force and skip the call to drm_helper_probe_detect() if
> the connector is forced. Only check_connector_changed() is missing that
> check. Wouldn't it be simpler to return false in that function if
> connector->force is set ?

I guess, but the drm_helper_probe_detect documentation states that it
"probe connector status" and "This function calls the detect callbacks
of the connector.", which I guess could be interpreted as it always runs
the detect callback but won't do more.

But it also returns that the connector is connected if the detect
callback is missing and thus it feels like putting it here both respect
the "probe connector status " (even though it's forced), and the general
idea behind that function.

> Another question is whether it is valid for the dw-hdmi driver to call
> drm_helper_hpd_irq_event() when the connector status is forced.

I guess drm_connector_helper_hpd_irq_event would be a better choice, but
it seems fine to me. Especially since pretty much every other driver
does it that way, I'd rather assume that the driver doesn't have to
track the connection status itself and leave that to the framework.

It's more convenient, and it's what virtually all drivers are doing.

Maxime

--62xmu4e52wowxf7x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY2j5IAAKCRDj7w1vZxhR
xdtoAQCeP+2Wy8wUXcqRzZKIAKffBRxySoBZdpo5YkatBmicRAD/QMBsVrltHoGT
gs93r8Yu1m+T4e+2ll1xHXWPrgObcQY=
=6/I8
-----END PGP SIGNATURE-----

--62xmu4e52wowxf7x--
