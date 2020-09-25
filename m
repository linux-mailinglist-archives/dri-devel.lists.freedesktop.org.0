Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AFD27A810
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:06:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B10406E2D8;
	Mon, 28 Sep 2020 07:06:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067776ED0B
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 14:57:27 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 64E08560;
 Fri, 25 Sep 2020 10:57:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 25 Sep 2020 10:57:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=B1dEF+CGw5EeEFhU9sVTINfHayv
 /iFEBrY6kEJImUqE=; b=ru4XrfleDL/ypPKESiZ9rcmc6yhpenjO2PMQLQtx4am
 HFxOoT1A7ZxBKUJy6rHXhyGWjD9QJXIIf+XQUNYSIg5d32vgmQFXnNiBPmPJPeNb
 yteCtlZT1E73RIayQBmIIjYqK0/ChrxSZQ6xrHC59LXCP5C4NCOBzo5HMZEEj8dI
 kN04pWgmtDL5MNfSyGNIi1YDDydIBURXgPG/q1yVOCn3wFibDFpOJHDWW5URSH6g
 ud7xmriOc7c2dCfOughNrjtvdXVktD4/O1Ho0mxZsk5IeINThLO8gJbd4ji4Fr7I
 yXlHHryBK22uRhC1zJBzIYwDzrfd1MCnUbpT0LtLCDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=B1dEF+
 CGw5EeEFhU9sVTINfHayv/iFEBrY6kEJImUqE=; b=Rl7O50oudGAcoIPgtiwiit
 g6mAJrbxf+flahUmLODrBPXdoRS0DLTH1qb0j0zlrbm3FZ4hJ08eCvuClgWvppku
 Ky5Q5B5s14hyXx4eoTv50p9EgWIWz9h/Dzuj5udWWrP8F7ZQOyNsSgN54rTNtEuE
 VPh/QEfl0RsPCkqp7bgKiArXym9CSfI47za3qKrRVrsJkig0df+vWJjSvCg9B+i8
 i45z4rf4JTjpx46vxWfL/4b5+mnTXuYE/FhC8NT0Za+kOlDejqCCtRFsRGiCi2t0
 Q2pPf0d6ZQFLWbMLHfWVXjxNDdPEBsjqmAcQBhfupiFVl0Sa+SBd1+hT8vu4kUgQ
 ==
X-ME-Sender: <xms:UgVuX5pYV4POzvlJ0FoblnRzr5b3Q1eKyNRD4PQUazaEnfYEeRvvqw>
 <xme:UgVuX7oxuefhKo0ZHwdDdHUXjXDoWq5BaOZ2GQV_mdv513mvUPs0w3XolxVdx-udL
 btr84m-dBzWArzMUpI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtgdekudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:UgVuX2OgXyeYZQE3Vwm7UPe8It3rSrdrGf8Bviny7Azpnd2mUW3X_w>
 <xmx:UgVuX06o96fpkqDrrbl7a44ExOQFbxZvqMmXHj4vkuibqE6tDtdFnA>
 <xmx:UgVuX46B1A1eW_GrEQWbLuUICrd2_m-HL_rJK_Z3n-kzHDGpaxQtpQ>
 <xmx:VAVuXyQIzjm11aSKNkwpDPOaiTMiIrK5aihoZy3oLHRm-8WxF06mQQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 853923280067;
 Fri, 25 Sep 2020 10:57:22 -0400 (EDT)
Date: Fri, 25 Sep 2020 16:57:21 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 1/2] drm/vc4: crtc: Rework a bit the CRTC state code
Message-ID: <20200925145721.2s5zyfyyqy4egvjj@gilmour.lan>
References: <20200923084032.218619-1-maxime@cerno.tech>
 <CAPY8ntAjiBeAoB=PZzNWW_5Vi3ZstXnD59GSkPXoeBj4XbGt0Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPY8ntAjiBeAoB=PZzNWW_5Vi3ZstXnD59GSkPXoeBj4XbGt0Q@mail.gmail.com>
X-Mailman-Approved-At: Mon, 28 Sep 2020 07:06:24 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0572823927=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0572823927==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2fuxyhc5zfqry4ai"
Content-Disposition: inline


--2fuxyhc5zfqry4ai
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 23, 2020 at 03:59:04PM +0100, Dave Stevenson wrote:
> Hi Maxime
>=20
> On Wed, 23 Sep 2020 at 09:40, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > The current CRTC state reset hook in vc4 allocates a vc4_crtc_state
> > structure as a drm_crtc_state, and relies on the fact that vc4_crtc_sta=
te
> > embeds drm_crtc_state as its first member, and therefore can be safely
> > casted.
>=20
> s/casted/cast
>=20
> > However, this is pretty fragile especially since there's no check for t=
his
> > in place, and we're going to need to access vc4_crtc_state member at re=
set
> > so this looks like a good occasion to make it more robust.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>=20
> Based on the issue I perceived with the previous patch, I'm happy. I
> haven't thought about how the framework handles losing the state, but
> that's not the driver's problem.
>=20
> There is still an implicit assumption that drm_crtc_state is the first
> member from the implementation of to_vc4_crtc_state in vc4_drv.h. To
> make it even more robust that could be a container_of instead. I
> haven't checked for any other places that make the assumption though.
>=20
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Applied 1 and 2, with the typo fixed (and the fixes tag suggested by Daniel)

Maxime

--2fuxyhc5zfqry4ai
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX24FUQAKCRDj7w1vZxhR
xUHTAP9p611rq4mT+RJdvpocTSngpm0vmVm/yVEsjh18mq68cAEAkcQqrlQvCd58
2eaU9z2PgEANC8ulHvG1EV3RvLhxTg8=
=XMzd
-----END PGP SIGNATURE-----

--2fuxyhc5zfqry4ai--

--===============0572823927==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0572823927==--
