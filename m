Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AA61320F7
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 09:05:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 547FC6E7E2;
	Tue,  7 Jan 2020 08:05:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B70890CE
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 07:55:03 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id A2F47220C7;
 Tue,  7 Jan 2020 02:55:02 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 07 Jan 2020 02:55:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=yn5V1ILcZ0kXEAzZg+JzlKT4KJW
 MwKW3bisUeNMYdZA=; b=Qe+AkwozbnL83siBhs0HNucL4maZbd3UdlHCmHzdsSu
 FTGLuq6x3VAo4j4jbLLXs2zuWxsvkEF5Pwc5jlFlNTpdvGdaYNh1hYaeA9opoA/0
 oD3/aoXaQVsxWR2V1MG+r30RBvTWbv9SyKEFAVSX6XBt2dYpcdFZL5kXUXoE2p0N
 dxfMuUFEJQSONLs/HaHLFPfBqI7Hjh55AqlAHJrrntB9bwGaUxBSm6yJhsdXHFBw
 gpDoLgWVxh1kdrxjBvOH1t1Q78PPUgE91tyjVQfwPeJdjHfchas5WQkmBAMqAfuY
 HadpnksNT3I3MHAmrwGVakUOl8l6Y413Vt8H2okU/QQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=yn5V1I
 LcZ0kXEAzZg+JzlKT4KJWMwKW3bisUeNMYdZA=; b=FtsWrF226MAkiL1ot199v5
 6kBiNJx+xvOOcyNlkejkrscTtWt3VbJCwaRZaqKWTYMyH8MnBy4FhQ+HhLGmM1dr
 xqtwBmfUxxVFVgDT+ahvar/jDfexus5RrvJKlbEvv8Hm7oA0LYG8/4NoQUTEz6OE
 glwXaEltNAlikG3CqJ/sX0PDokrkYoeH5sCNnm7LZh1OPrumkaGM6DYA3iG9Blpb
 /P+BDRtTLN5/1rM61O8K2UkUIQuyxkRdcBGQDMxGFUyka617CDP0XjvwhLw0fFFA
 WgjzxMqe1pUl8ksueuyOJJRjNZBB8UahlBgY2Jo+cHMtkRktJK4t+NtTZE2zmT5g
 ==
X-ME-Sender: <xms:VTkUXkUyRI46-g7DlLfiv26dWN7Zo82Ry6PvyzTprHw5JPuSS7EPFQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdehuddguddugecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkpheple
 dtrdekledrieekrdejieenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegt
 vghrnhhordhtvggthhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:VTkUXp3ZpLGFt3ZoNob1bAOZGAn0QMBRMyiFsAV2TMFHH3Lzo7GfNA>
 <xmx:VTkUXlcTghyGXhUBnzKq3cJsYr1jFomlHdqEx-9Jy4M9RWQ_1oyhjQ>
 <xmx:VTkUXmVoGho5uV6TNIez03CgbqaKp5FPpFVfgRhI7GooZwAhp6rdLQ>
 <xmx:VjkUXuy2tBvO5JyTLRCPOgdGiSGlY439d9Ouj6NhkF_9_lZbP9KUpw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 62A5B80059;
 Tue,  7 Jan 2020 02:55:01 -0500 (EST)
Date: Tue, 7 Jan 2020 08:55:00 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Yuti Amonkar <yamonkar@cadence.com>
Subject: Re: [PATCH v3] phy: Add DisplayPort configuration options
Message-ID: <20200107075500.br66fzynztpl6jc5@gilmour.lan>
References: <1578313360-18124-1-git-send-email-yamonkar@cadence.com>
MIME-Version: 1.0
In-Reply-To: <1578313360-18124-1-git-send-email-yamonkar@cadence.com>
X-Mailman-Approved-At: Tue, 07 Jan 2020 08:05:10 +0000
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
Cc: mparab@cadence.com, praneeth@ti.com, linux-kernel@vger.kernel.org,
 jsarha@ti.com, kishon@ti.com, tomi.valkeinen@ti.com,
 dri-devel@lists.freedesktop.org, sjakhade@cadence.com
Content-Type: multipart/mixed; boundary="===============1812002674=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1812002674==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="du7252vquuj4pt2d"
Content-Disposition: inline


--du7252vquuj4pt2d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 06, 2020 at 01:22:40PM +0100, Yuti Amonkar wrote:
> Allow DisplayPort PHYs to be configured through the generic
> functions through a custom structure added to the generic union.
> The configuration structure is used for reconfiguration of
> DisplayPort PHYs during link training operation.
>
> The parameters added here are the ones defined in the DisplayPort
> spec v1.4 which include link rate, number of lanes, voltage swing
> and pre-emphasis.
>
> Add the DisplayPort phy mode to the generic phy_mode enum.
>
> Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--du7252vquuj4pt2d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXhQ5UwAKCRDj7w1vZxhR
xXypAQDrUSF7C03RKFJRzD9tHtHNlDkcVO86S8hSOKHQRGzFFwEAkJlAb74qa+8U
+zrWeY3JxNz41kmUxYlakFQ2ySqNgwc=
=l0UX
-----END PGP SIGNATURE-----

--du7252vquuj4pt2d--

--===============1812002674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1812002674==--
