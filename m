Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5516B14E965
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 09:04:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD0EF6FAAD;
	Fri, 31 Jan 2020 08:04:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 463586E828
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 13:04:24 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 696D221FEB;
 Thu, 30 Jan 2020 08:04:21 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 30 Jan 2020 08:04:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=l5P4QCsTB1wNgckOFhCEG0FD7el
 HtRpy/p/3gVc7KmU=; b=QKgaXrSZ7pwh3DQMEr0aEkBuZFiFUZl0x0annxGoTt+
 6nNvUp38trJB4MqQNbFpc0Nq92qCbFOPAmsgXzkFJ2gNhMbJtXtPHV5PNsHCcCVA
 riJsJvowAyQcper+Twrkd70gYLv0SsHGBcLjGZ56OUQXCPWDuPApYoci6M+QqyMa
 5zzv0YrbhoIyUynK8854SIfEN/WgpgeGsY3fEJC5+I/js25uPtM7jqUSgGUNN3ML
 7MsvzOyh9553yyn8FZD1nzmyDT1payB5cShhFP03YPLqqYin8i03aajl955xwg1A
 z/4Fl8yti1mfyvO68L32OTLVKY3ECgVS9MoN4s2I/UQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=l5P4QC
 sTB1wNgckOFhCEG0FD7elHtRpy/p/3gVc7KmU=; b=ufVMt1ksblqfsCyfrWWQra
 44sLAh3TyTfwmsW8ei5I378EubiJf/Iivh66hwDWL1huK1aqyaOM6tbKzJA4Pm6Y
 lEaX1pUxXWls+C97k8DrVkbmWf6beuWfEMS2OdDPfTuRRUivvutzgzhAYFWfi70M
 hL67Wm4ZGtN5eA0wd+GGAKE9PrNOWTboqUwlC0K8PLCfi75/AmXJ3driJl19vLLQ
 UGdMEEZsBHMLq0lXFPO5w4HL/Z3dPmM2RzuzsVa244k0IDkns2QvfqNa8ExlRxGv
 r3uO5bwx+VkJIXZ2TSqQa+y2jYRAnSFOdTYynzbqCvuiDgXjrAAmCTmcC4cYbACQ
 ==
X-ME-Sender: <xms:VNQyXkF8gix9Teb00SEFzgyX08rF1Jg3KE0wBuA-Cm4Gx_Ctswk-Cw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrfeekgdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:VNQyXglWm00NnjX6YXiY_wBweqmOVhLk5UqMZ73lUgCrSrECuG774Q>
 <xmx:VNQyXnk7hqFX5pFY7vrN2pk4QyHb6LGWusaO78oa2OR4RdTX5zQ_dQ>
 <xmx:VNQyXhuEg4uryv1slEzmyCVdD5j0baw7fjcz6u_aWKTrLyq8UcVr5A>
 <xmx:VdQyXt1dNw-yabVsaYr3nDeY8tnflBZNR5s815jfH0I83ElixJYeiQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 91B923280068;
 Thu, 30 Jan 2020 08:04:20 -0500 (EST)
Date: Thu, 30 Jan 2020 14:04:18 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] MAINTAINERS: Add Thomas as drm-misc co-maintainer
Message-ID: <20200130130418.fta4sqpbfkpj5tzx@gilmour.lan>
References: <20200130120643.5759-1-tzimmermann@suse.de>
 <21c31cf3-ae2e-e361-7edd-a45f7589dd9f@suse.de>
MIME-Version: 1.0
In-Reply-To: <21c31cf3-ae2e-e361-7edd-a45f7589dd9f@suse.de>
X-Mailman-Approved-At: Fri, 31 Jan 2020 08:04:00 +0000
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
Cc: airlied@linux.ie, daniel.vetter@intel.com, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1284564157=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1284564157==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bwtlakmb4jqkxgsd"
Content-Disposition: inline


--bwtlakmb4jqkxgsd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 30, 2020 at 01:09:23PM +0100, Thomas Zimmermann wrote:
> (cc'ing Maxime with the corrrect email addrees)
>
> Am 30.01.20 um 13:06 schrieb Thomas Zimmermann:
> > Daniel asked me to serve as co-maintainer of the drm-misc tree.
> >
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Maxime Ripard <mripard@kernel.org>

Welcome :)

Maxime

--bwtlakmb4jqkxgsd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXjLUTQAKCRDj7w1vZxhR
xUFtAP9mhNnAVOMQo3bczNdwg7jhCWEhRXUwg1kAIJ8h1mUmDQEA7n8vNTLP0bNe
GoIFf8VXLIZBZz+MWQYajEL1fdJcVw8=
=BiYB
-----END PGP SIGNATURE-----

--bwtlakmb4jqkxgsd--

--===============1284564157==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1284564157==--
