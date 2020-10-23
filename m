Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07773297DA3
	for <lists+dri-devel@lfdr.de>; Sat, 24 Oct 2020 19:05:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 020856E905;
	Sat, 24 Oct 2020 17:05:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 155516E125;
 Fri, 23 Oct 2020 15:10:44 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id B87B35C014F;
 Fri, 23 Oct 2020 11:10:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 23 Oct 2020 11:10:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=+GwpoAOk5CgKo9WK1gZ7MrIquGJ
 OvS1gGK1GZxx/HJg=; b=IMIOJcvCDcR1V4VnFQl9gOP97kk3FcclX66xWnLvMvQ
 fmNiRD+e2jY9RsOGyMISmidadj0rJgilJU1HX7raWewR1xi89flG95LdvBG6lYTD
 7f2PjY1Z+4baQrORnstpS9xPyeTo+AFXtO9WgIun2xvMlUO722rEel0S0CWRC8CR
 XLUnFIicWOmpwBgG0S9M4gaWtPLcSqsWLcqYCWa2oE6SgOaxAc4wMIe1slZOWfB9
 SvPb2Mg2ly7jQLhWbvTc2KDLNA/+2ds7XHq1W6YyyBs/ZmE8CR6gKl2I/cIUxxuu
 fMAkib5YyPrAmoass5y4rNF+F+hKUBonarkYBIS+/cQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=+GwpoA
 Ok5CgKo9WK1gZ7MrIquGJOvS1gGK1GZxx/HJg=; b=X2SNSB6km77+Zb7mXhXi7y
 SZKJ5pn6pqR4FfzrV/ECuF/8ihERmqVik+4/QJYFWW1K5/xgDmV/EFjBpV2LmxHb
 DyOsByExBddX0zBJln9NMQ1iqu5GBK4PE1hor+O206OCEBKTex4oFX3mB50k7EBJ
 fenlxNtveYkUhxnK4gnUAZyRKyx/BPLDNR+d6ytBp9is3TGsDf+RfZzLDsWZbWAi
 Y9jbORxbtHUU3NEfiazoDntxUrVUJe1Z9OcriAy+5Xg81bztj6bJse94nVtO3QYw
 qkOOQQ9wiLHXPLLHMGf5yCXpjRMXPFt372MaWKO7DmcpJ/z53RUo0WdmJpy8cSKg
 ==
X-ME-Sender: <xms:cPKSX9r16mchfyXUmKSeamQJBOStllOGcvKWlX9Eh0ENKzNoC83vTw>
 <xme:cPKSX_ql2lB-ocV1kMKeQKbwElKrNPysaam5MNqW_INKbqLjUOiWZx1bA-cPNfdB5
 eeclA7DH0jMxP-DJ1k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkedtgdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:cPKSX6OfD6RK7cz-XqRtbVVcjUBoFK1O6ZVAAeAAW5axXsyJkRBpXg>
 <xmx:cPKSX47WOq0MBib4PFYKhtFE1ISiFRthQdc-yoEIIdNdd4TB-wvCzA>
 <xmx:cPKSX86y_Mkf4-HcAHLZeDdZC4YYAucQNg0WBIy6ZgC5snX-Tf5l4w>
 <xmx:cfKSX2TiPe8NNsFaTGbZXsFnQmYBOnQcM2DK6ukfUB0hYj0SlW3L-Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 432F3328005A;
 Fri, 23 Oct 2020 11:10:40 -0400 (EDT)
Date: Fri, 23 Oct 2020 17:10:37 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 2/5] drm: Compile out legacy chunks from struct drm_device
Message-ID: <20201023151037.oh7dpqxm5jtt5bf7@gilmour.lan>
References: <20201023122811.2374118-1-daniel.vetter@ffwll.ch>
 <20201023122811.2374118-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
In-Reply-To: <20201023122811.2374118-2-daniel.vetter@ffwll.ch>
X-Mailman-Approved-At: Sat, 24 Oct 2020 17:05:18 +0000
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============1571421758=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1571421758==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tkgsn6srbhvuaavv"
Content-Disposition: inline


--tkgsn6srbhvuaavv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2020 at 02:28:08PM +0200, Daniel Vetter wrote:
> This means some very few #ifdef in code, but it allows us to
> enlist the compiler to make sure this stuff isn't used anymore.
>=20
> More important, only legacy drivers change drm_device (for the
> legacy_dev_list shadow attach management), therefore this is
> prep to allow modern drivers to have a const driver struct. Which
> is nice, because there's a ton of function pointers in there.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--tkgsn6srbhvuaavv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5LybQAKCRDj7w1vZxhR
xRhOAP41lf2ie23y1eSDBKsDxAXl1BAFiKc21kX1dgZij3HLWgEAm5SAvbo3AFEX
pQ7IhrYZLB6wrVzoXU9msF3zSBPXqQ0=
=2BeL
-----END PGP SIGNATURE-----

--tkgsn6srbhvuaavv--

--===============1571421758==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1571421758==--
