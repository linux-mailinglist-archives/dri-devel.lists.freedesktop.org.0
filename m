Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 600CF29FFD6
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:25:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 365606ED00;
	Fri, 30 Oct 2020 08:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB706E8C2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 09:26:43 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id AA99A5C013E;
 Thu, 29 Oct 2020 05:26:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 29 Oct 2020 05:26:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=ZsDCOor/dZa1AuBrIdWSYniSl0T
 PBxRCurlkV/eLGUM=; b=WIwrVD+dIO2L0AU9ZClCm3ep/RlH7VXDwaYlZAqk5s5
 0Z06CtFyPox46YMi2PbHxCv2HjwFA9EGxaWI3+7CS2JxywsMpZLrmyVgXcVgXjZ+
 qV+RGF3Jp6PPW5iBL9EilGBO/rzjZzshQr3w6DCAlXswCqYgRL1srxhHK6FbI4tS
 sFoV7ZDbTy901yrGsrIMFPJVjHGZ8eCXwoz09tOMNGz4f0K6RSLZBwWiXqtEy8QZ
 ie6NJsJjr6XqEXIFiIdB81LPIaAIMEbW+KQZLCjUwql3SrAx1SbNF4yiBVni+giD
 zCdfR3QS9wAs7V0uoKuh4JsYn3lQGPYUGMd7kOsezWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ZsDCOo
 r/dZa1AuBrIdWSYniSl0TPBxRCurlkV/eLGUM=; b=GaCkQFZIBpRobaV83rEFyN
 /GSRyCagUiBg/Phavk5IwZ7jg8oNSIKhgzSrLl++hFK4kvAv2cEe27clLbOhDEwE
 /PKGUfa61YpLErdCOZHs3lK54JIT9ROAHWJqNGoQKd7cQGJ78EqOOQ1E9R5AbaRb
 B0/RR8vPoDPhatO2a11rHrwnGg4cVHEQr/omnF95YIdzgfJQZZ7OToNigKwn2aL+
 WptEt+FI5+Ryy9YO99mxdB4Cjaa+3PEXAA9nwkJ429kX+0swwN0K4MQOHX9s5qMR
 EhEIssob2gbMga7QuCmgdczJGrNnjI6Uk3ROo4dQQe5+vC8VtNRWyE0l1z+TNDGw
 ==
X-ME-Sender: <xms:0YqaX0OWRTlsvbnxQuMmU2HS4OVUvEQxmFI3eiFNJMpGGzE16yYAPg>
 <xme:0YqaX69IW8-4N4BEA-BrLfrNRJtPBlJERtv0XFt6HlX6tERcNxnyMmHZs0cGRrwgL
 m1XEd0gChIBjCyzkW4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrleefgddthecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:0YqaX7SE3wdFfZW-mq3ZZJd-OIATyaG0c7kd6RbByiUI8QvDxBm0GQ>
 <xmx:0YqaX8ukON6acNW9OI_plMqQlJua6P3_PKHjGBQuV38YPbCBzmaQRg>
 <xmx:0YqaX8dQlLMooVHV_isf5D5d4yxvv9rFJqYEuN_esfLiSaJtRs1xYg>
 <xmx:0oqaX74V_Vx5tnbQINHy051Yk8AFL26L2Kmen9ZeSa3cid63YEdJPg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8CAF43064683;
 Thu, 29 Oct 2020 05:26:41 -0400 (EDT)
Date: Thu, 29 Oct 2020 10:26:40 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH] drm/vc4: Rework the structure convertion functions
Message-ID: <20201029092640.gtw6bshpzq36zg5s@gilmour.lan>
References: <20201028123752.1733242-1-maxime@cerno.tech>
 <CAPY8ntDz_mOx8sKfOTO0zRVMiPivX7yLHDUvrk-KVVD_feAicg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPY8ntDz_mOx8sKfOTO0zRVMiPivX7yLHDUvrk-KVVD_feAicg@mail.gmail.com>
X-Mailman-Approved-At: Fri, 30 Oct 2020 08:23:17 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============1286484267=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1286484267==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zy7h36hgp7q63h4a"
Content-Disposition: inline


--zy7h36hgp7q63h4a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2020 at 01:49:29PM +0000, Dave Stevenson wrote:
> s/convertion/conversion in subject line
>=20
> On Wed, 28 Oct 2020 at 12:37, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Most of the helpers to retrieve vc4 structures from the DRM base struct=
ures
> > rely on the fact that the first member of the vc4 structure is the DRM =
one
> > and just cast the pointers between them.
> >
> > However, this is pretty fragile especially since there's no check to ma=
ke
> > sure that the DRM structure is indeed at the offset 0 in the structure,=
 so
> > let's use container_of to make it more robust.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> Otherwise
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Fixed the typo and applied, thanks!
Maxime

--zy7h36hgp7q63h4a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5qK0AAKCRDj7w1vZxhR
xUxWAP9rYI2sNPlyqVj0SxsUakKFszX6/pXHXhw9/on7NGM2nAEAxRQRIAOugX7B
55AOcyiH9DI2i5zbcg8ICyEAb4rWBgo=
=hz6L
-----END PGP SIGNATURE-----

--zy7h36hgp7q63h4a--

--===============1286484267==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1286484267==--
