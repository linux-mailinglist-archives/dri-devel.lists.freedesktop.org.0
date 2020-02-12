Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3814B15BA9B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 09:13:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F297D6F562;
	Thu, 13 Feb 2020 08:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E42789690
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 17:33:11 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 39897989;
 Wed, 12 Feb 2020 12:33:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 12 Feb 2020 12:33:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=Ph0HEBBYD8cuPeB6SSEUOrtwhOw
 ZpbhaUeJyroiXa8M=; b=u1opWZR9iwjzle/JA4nhjMkBG/xGZZoIHAuDxUX4DS9
 Tib8T7LG1OOrpy+K7VKpNm1e4eLklAqfPTw2uql2Atw6d7yoI+mR+KV3se1rkPdo
 +ftqA5TAlRw/e/Ml85PSZuD7e3zjz/7NX2M1dYMFkf1p7C/aQdM1WUZ7TsZ3F9pC
 G5zBcwUc7rbt0qEPuQ50NPK3lrwgAzW0SPhxx0IbjaA35NQTE1/aZo+IWRyrct3I
 dHq/JyRMeFqzKybcM9jta/h/FIBf0NGXJ1RSze1FeaEfwrJHWJNQXgAAHc/FEEGK
 LVBqf5LFH07v5EBiXaIMRRuU1W8ypFbEhXhNoOgAoGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Ph0HEB
 BYD8cuPeB6SSEUOrtwhOwZpbhaUeJyroiXa8M=; b=wllJgZ2amXt6g6SINEPzH8
 nTdk1co7DEVZvcs8L4QiSJsiAg9xGsHFoiqvtaugawhjb5JbxbBQwpTsc/hGdolU
 N7Nh9qL/86bwxPJLAVhOJXZR3lrjEpaGT+JHFtKK3Q3QrXVIaCjzGO/rFcOtbZ2n
 7z2s8WCjeWZ2aSBvmGOgq2ranZ3+I8XEznH6EKD9ZP3QO5IIfSX9xlRnaCm6Bm8e
 xIx+aMFM3QWbPpcTg9YQvVNkW2OxK7y0sT8X/vsON6ipPjcI79EJ8mtaukYaLFEe
 ma2MhlhPViuJMLy2+zrg+USkhVsKspZ9q6LmQPl0hRu63eVwk23x4c7QGxPAvz+Q
 ==
X-ME-Sender: <xms:1TZEXgAxpv8z9Qsqe9TliCGkI943gIbHHrP6Gr7YmgeQDCBE2AyE4g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrieehgddutdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:1TZEXjNLeOSL9ugxF1onhUvSEIGFyc4ZPgq4ijzChRYN3QilNzphXA>
 <xmx:1TZEXhyrgC-Ee9HrMs5xSuS_-tka3qBDphIQc29WgPC4Tphh4vIrbA>
 <xmx:1TZEXrVioSt4Vq9Y68YrwDRTB9GPWlCaR3SE5FkMSE656Jhyt7gZnA>
 <xmx:1jZEXtEfZDMyCZBu2-KOS_pm-58nYHX_8q7bBEswgWnkqUoTbTw_Yw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 609563280062;
 Wed, 12 Feb 2020 12:33:09 -0500 (EST)
Date: Wed, 12 Feb 2020 18:33:08 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH v3 0/2] drm/modes: Apply video parameters with only
 reflect option
Message-ID: <20200212173308.lkbmelze3a3dq4tm@gilmour.lan>
References: <20200117153429.54700-1-stephan@gerhold.net>
 <20200117185100.dukz3e7np3z3df7k@gilmour.lan>
 <20200212152948.GA17735@gerhold.net>
MIME-Version: 1.0
In-Reply-To: <20200212152948.GA17735@gerhold.net>
X-Mailman-Approved-At: Thu, 13 Feb 2020 08:12:52 +0000
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0566138737=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0566138737==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6v55r2urgpdd4oms"
Content-Disposition: inline


--6v55r2urgpdd4oms
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 12, 2020 at 04:29:48PM +0100, Stephan Gerhold wrote:
> Hi Maxime,
>
> On Fri, Jan 17, 2020 at 07:51:00PM +0100, Maxime Ripard wrote:
> > On Fri, Jan 17, 2020 at 04:34:27PM +0100, Stephan Gerhold wrote:
> > > At the moment, video mode parameters like video=540x960,reflect_x,
> > > (without rotation set) are not taken into account when applying the
> > > mode in drm_client_modeset.c.
> > >
> > > One of the reasons for this is that the calculation that
> > > combines the panel_orientation with cmdline->rotation_reflection
> > > does not handle the case when cmdline->rotation_reflection does
> > > not have any rotation set.
> > > (i.e. cmdline->rotation_reflection & DRM_MODE_ROTATE_MASK == 0)
> > >
> > > However, we really should not generate such a value in the first place.
> > > Rotation values should have exactly one rotation angle set
> > > (DRM_MODE_ROTATE_0 for "no rotation").
> > >
> > > This patch set changes the command line parser to make sure that we generate
> > > only valid rotation values (defaulting to DRM_MODE_ROTATE_0).
> > >
> > > Finally it allows DRM_MODE_ROTATE_0 when applying the rotation from
> > > the video mode parameters to make parameters without rotation work correctly.
> >
> > For both,
> > Acked-by: Maxime Ripard <mripard@kernel.org>
>
> Can you apply these two patches for me?
> This is my second contribution to the DRM subsystem, so I don't have
> commit access to drm-misc yet.

Applied both, thanks!
Maxime

--6v55r2urgpdd4oms
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXkQ21AAKCRDj7w1vZxhR
xVcZAQCNE3LLf1eprjzAZ5iOR/HPHX76iqMqqBwKwxkN0FScmQD/awdxku90skV0
/mwBeH1PgPXF/ZPp60/beVoMZbHcxg4=
=aTv3
-----END PGP SIGNATURE-----

--6v55r2urgpdd4oms--

--===============0566138737==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0566138737==--
