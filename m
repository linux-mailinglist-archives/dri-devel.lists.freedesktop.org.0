Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B096101B0A
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:06:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A2A26EB59;
	Tue, 19 Nov 2019 08:04:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ACC689167
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 16:56:43 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 406F622677;
 Mon, 18 Nov 2019 11:56:42 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 18 Nov 2019 11:56:42 -0500
X-ME-Sender: <xms:SM3SXT7MgQEz6fybTAmFetyWA56SV-nAeA00Vv7O8UtErYApgHQWow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudegiedgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjfgesghdtreertdervdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkpheple
 dtrdekledrieekrdejieenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegt
 vghrnhhordhtvggthhenucevlhhushhtvghrufhiiigvpedu
X-ME-Proxy: <xmx:Sc3SXTNRmeGnYMVNvpBzTZejQpY2gDFuXJ9i9y6XqJEH2F633sDUjw>
 <xmx:Sc3SXR9V0iRSBrZOGqLT6ax0pxckAzHtI9hdP0juSqMjB_i6zXph9w>
 <xmx:Sc3SXS5NTNQEhMtOca0aJyWT-NgcBFjS07Wp92X0OgIQBJXcNmeRxg>
 <xmx:Ss3SXZysoDI-vvhNLxDXVs9dvoHEx126-zB7nIEIfRNDp2qHFhceCw>
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id AAEF73060060;
 Mon, 18 Nov 2019 11:56:40 -0500 (EST)
Date: Mon, 18 Nov 2019 17:56:39 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v3 11/13] drm/modes: parse_cmdline: Explicitly memset the
 passed in drm_cmdline_mode struct
Message-ID: <20191118165639.GR4345@gilmour.lan>
References: <20191118155134.30468-1-hdegoede@redhat.com>
 <20191118155134.30468-11-hdegoede@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191118155134.30468-11-hdegoede@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=4eRdwIALHzSVDrGCE/A7ssqZDnT
 ZBwZw2DZ1Ti7cNoo=; b=CVfTjtCbyhRFf+YjC8+CwXXzwK0xE07rxtK9yUmxXQw
 DiulHQZxpiypCyy4+DlAzXSL5OtOp/Fgwb3LJtFHQGEkub0H5uhpNGTDirO1OgaI
 SBFR74cxH7EtEGgDELB6EwVtv8FphvR6jl1mMdCYXUA+dqT+iUuFcAMlQGd2cDTr
 B+jXf204T7OX5em7d0TUec7gcDLaAp4wA7cooXTA9BaIytJlLfAXST0r2foxOJk9
 zLpiqe3PpO8avgliYfl26yngxSGIAvjbbNCX8cVm98MBetADsJzugYeqadkzVSF9
 8KyPrOitXm0GVWieVtOLBjVQyH1g5bHW6YbUqN9/FRA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=4eRdwI
 ALHzSVDrGCE/A7ssqZDnTZBwZw2DZ1Ti7cNoo=; b=Zwq59umu1vlsTzIX/QRlT9
 YeWmibImSkEnZSEnOETLpIDuU1rpqTADTSId6KP0zhgrjdjaZeqCF3UOUPvgQd1H
 ntSUxNHZnhV/2teUIGa+WGrh5O7SsPMsSFeNYIAaNitIqDfKXblNhe03uqfAtJ7x
 XgBDgFhTCv/ZZqdA0/CqDMV0K1YZ45PfHDqhQWDGNMSPXpWHUCmj+Oy6mC+Mn4ZV
 PLR3WagBX+xtVFMSxHbjwSM8swPyqdIO6T14OR9jPur/f6EIPLN/+1cSD6Rvmqov
 chsId0z6mE9JfwuzKM6i0fbxdLRFVk0t3vgvKII+JN+oD/INkTZVxmSjr8+56lMQ
 ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: David Airlie <airlied@linux.ie>, Derek Basehore <dbasehore@chromium.org>,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mathieu =?iso-8859-1?Q?Alexandre-T=E9treault?= <alexandretm@amotus.ca>
Content-Type: multipart/mixed; boundary="===============1406198569=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1406198569==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BF73NQnaRilDmNOH"
Content-Disposition: inline


--BF73NQnaRilDmNOH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 18, 2019 at 04:51:32PM +0100, Hans de Goede wrote:
> Instead of only setting mode->specified on false on an early exit and
> leaving e.g. mode->bpp_specified and mode->refresh_specified as is,
> lets be consistent and just zero out the entire passed in struct at
> the top of drm_mode_parse_command_line_for_connector()
>
> Changes in v3:
> -Drop "mode->specified = false;" line instead of the "return false;" (oops)
>  This crasher was reported-by: kernel test robot <lkp@intel.com>
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--BF73NQnaRilDmNOH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXdLNRwAKCRDj7w1vZxhR
xQk1AP9XtVqOhNcTiaQxip6sZP71nBRozV9vdpHbK2EYlQUE5QD9E5jG7lAInqW0
SHEUcKaSUL7bHPydlDb95yu6iJuOBwg=
=6vLm
-----END PGP SIGNATURE-----

--BF73NQnaRilDmNOH--

--===============1406198569==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1406198569==--
