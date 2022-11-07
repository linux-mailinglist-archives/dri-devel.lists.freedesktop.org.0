Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A43CC61F36F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 13:37:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E424310E2F9;
	Mon,  7 Nov 2022 12:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2C3B10E2F9
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 12:37:02 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id EDB50320095B;
 Mon,  7 Nov 2022 07:36:59 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 07 Nov 2022 07:37:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1667824619; x=1667911019; bh=KQrPwGZwWv
 2mRYbgecNO6AYQgjjUZID163dgb8oNFlQ=; b=fOC6FdsUvRTutTBOiaX/TEqd9X
 v6kAfxqtHDbVbzs+qJy89/GJTBm1shj79kby+j47T4bqwNGAjxhOzTrLlS60OrvT
 gz6IQ7McdbrN8/qG+iSazzK7rqr6sj15qoQQGMhdvUv0TQLOETz3nGAoMLD/tb6c
 UAGoj+FNpNnmCK3wMUsiMSMSPrHBsc1tllTmijXArVdKlbiws/sBeYa52kZFpolQ
 ITHzHFGUWUYXnsgw2iZBpNGvhI77VhFN5OWFb6tjBoO1JDSo7whrlRjdADBT8hju
 vN0NPxDMHfyrjFI/6Z8L7sQr14neUNH9InumMDXdAaQdmE2w6ya4+vmGICTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1667824619; x=1667911019; bh=KQrPwGZwWv2mRYbgecNO6AYQgjjU
 ZID163dgb8oNFlQ=; b=RBf22NxZj+inpwt3sN1DoJZ81jLSYd2mcf5XN7+l06pq
 QO7c1Ky3gZPa/bAilUOSyfCNatV07ArgIAmyfQcfhneUmSgxn9beNs9KHmhogtgC
 9DmDeQzXslxgZPrcqxXdXZzSJInlHaD59kJiioyrMvLYQB2AvvW+OqOWREFh0RaN
 8DluLgGfmj+syYaS//snrq0sQQmUlXd+DP/e412JG029uW+2c9Am/iDDRtNb2Wec
 W7fqDjvJntVtLiuxksGf3vW9bCFjlEGkAWmTUNpNEvCwQcoHMhxXxRJsuAYT6RtG
 p5UWD8mFz/JMF34NrQ/tOR5/XyLqKFt6U9VwKMihag==
X-ME-Sender: <xms:6_toYxNr1c4xPGwscslUqR4jSLsKXBCpzHOYNnnDsE8H5gs1QXezEA>
 <xme:6_toYz_Fi0Z82JCREaOtX53bHXMA5InAHsFUmg6oQFvNtEXh0-dbnHVsqPp4jjlfl
 QTnY18UIN8QzvTrjFQ>
X-ME-Received: <xmr:6_toYwTuLQyl9xRRC6yTr16bcWNjTgxFfoGqk59DDE8wBgLb1oflsfVoOEgtgoZk7B6nRebijlc1mhtNP91HMSJ2F1FP84hzxvDrEqG0HS-Lgg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdekgdegudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnheptdelkeejiedufedvhfeiffetlefhiedvleeigfeiuefghfdvleeiffejieeg
 teejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:6_toY9tb-ZuRr-KECNpjqNgZK72pqsxFNNAAsU7vB8CEtAn9Edp5Wg>
 <xmx:6_toY5ei2kUsIDiKBKbolnJYHlM0M4HWZQgjmpvB3xkq0w_ito-QFg>
 <xmx:6_toY52ARYK_zXGOj1RRGF3gqJJUQz-X1bNzdrwJQiIA4rRest4YYA>
 <xmx:6_toYysiWIN_CHoa1YIPlLiqLaD95dnbBd4DmHYXMOQO-WV1cgjkBQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Nov 2022 07:36:58 -0500 (EST)
Date: Mon, 7 Nov 2022 13:36:57 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Michael Rodin <mrodin@de.adit-jv.com>
Subject: Re: [PATCH] drm: do not call detect for connectors which are forced on
Message-ID: <20221107123657.24vbgep3jqeklb2s@houat>
References: <20220826091121.389315-1-mrodin@de.adit-jv.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5bflugsm3vwfqg77"
Content-Disposition: inline
In-Reply-To: <20220826091121.389315-1-mrodin@de.adit-jv.com>
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
Cc: David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 michael@rodin.online, Sean Paul <seanpaul@chromium.org>,
 Alex Deucher <alexander.deucher@amd.com>, erosca@de.adit-jv.com,
 Vincent Abriou <vincent.abriou@st.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--5bflugsm3vwfqg77
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 26, 2022 at 11:11:21AM +0200, Michael Rodin wrote:
> "detect" should not be called and its return value shall not be used when=
 a
> connector is forced as hinted in the commit d50ba256b5f1 ("drm/kms: start
> adding command line interface using fb.") and the commit 6fe14acd496e
> ("drm: Document drm_connector_funcs"). One negative side effect of doing
> this is observed on the RCar3 SoCs which use the dw-hdmi driver. It
> continues executing drm_helper_hpd_irq_event even if its connector is
> forced to ON. As consequence drm_helper_hpd_irq_event calls "detect" so t=
he
> connector status is updated to "disconnected":
>=20
> [  420.201527] [drm:drm_helper_hpd_irq_event] [CONNECTOR:76:HDMI-A-1] sta=
tus updated from connected to disconnected
>=20
> This status is corrected by drm_helper_probe_single_connector_modes short=
ly
> after this because this function checks if a connector is forced:
>=20
> [  420.218703] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:7=
6:HDMI-A-1] status updated from disconnected to connected
>=20
> To avoid similar issues this commit adapts functions which call "detect"
> so they check if a connector is forced and return the correct status.
>=20
> Fixes: 949f08862d66 ("drm: Make the connector .detect() callback optional=
")
> Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
> ---
>  drivers/gpu/drm/drm_probe_helper.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_pro=
be_helper.c
> index bb427c5a4f1f..1691047d0472 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -289,7 +289,12 @@ drm_helper_probe_detect_ctx(struct drm_connector *co=
nnector, bool force)
>  retry:
>  	ret =3D drm_modeset_lock(&connector->dev->mode_config.connection_mutex,=
 &ctx);
>  	if (!ret) {
> -		if (funcs->detect_ctx)
> +		if (connector->force =3D=3D DRM_FORCE_ON ||
> +		    connector->force =3D=3D DRM_FORCE_ON_DIGITAL)
> +			ret =3D connector_status_connected;
> +		else if (connector->force =3D=3D DRM_FORCE_OFF)
> +			ret =3D connector_status_disconnected;
> +		else if (funcs->detect_ctx)
>  			ret =3D funcs->detect_ctx(connector, &ctx, force);
>  		else if (connector->funcs->detect)
>  			ret =3D connector->funcs->detect(connector, force);

Actually, I think this creates a regression on vc4 at least (and
possibly i915?), when the HDMI scrambling is on.

When a monitor is disconnected and then connected again, the mode won't
change by itself, but it will lose its scrambling status. The way we
dealt with it (and documented here:
https://lore.kernel.org/all/20220829134731.213478-9-maxime@cerno.tech/)
is to have detect enabling the scrambler again if it detects a
disconnection/connection transition.

If we force the status on all the time, then we will never get called
and we won't have the opportunity to enable the scrambler again.

Maxime

--5bflugsm3vwfqg77
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY2j76QAKCRDj7w1vZxhR
xTcUAP9V9xOy2LNHa7/fMYA5Z7sYXjL2GlmIUclgeS7bW5j/5QEAprhRBnxKejDN
QTE3BQ/mTviTf9ppaOtoDwqxoirqcw4=
=YTjk
-----END PGP SIGNATURE-----

--5bflugsm3vwfqg77--
