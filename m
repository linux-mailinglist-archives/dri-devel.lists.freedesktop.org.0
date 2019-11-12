Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E58DFAB84
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 08:56:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37DCB6EB92;
	Wed, 13 Nov 2019 07:56:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 395 seconds by postgrey-1.36 at gabe;
 Tue, 12 Nov 2019 18:51:33 UTC
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED5E6E513
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 18:51:33 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 22BD25EA6;
 Tue, 12 Nov 2019 13:44:57 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 12 Nov 2019 13:44:57 -0500
X-ME-Sender: <xms:pv3KXWwifJDMNIIWVRDXXS8FDx_nBRcfS9CvF8QC0uncfpjwedNuAA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddvledguddujecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujggfsehgtderredtredvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuffhomh
 grihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecukfhppeeltddrkeelrdeikedrjeei
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghhne
 cuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:pv3KXYGMevO231q_x8hP8krJU5pUX27Ak2ag3hVnEvXiXo9DOGY2Ig>
 <xmx:pv3KXdbLaiyCsc9IHrpGnCVqVBbgZPXxydZO-Mrqu5gN05a4MYgajg>
 <xmx:pv3KXbgUgIcTKpeMXfuBVqyY0ccAkVGC-_XZRnMOM0xN5xURS7iMGw>
 <xmx:qP3KXUI_b3yIHQLaeG2Gef7wk-IwYrnYtSLvOiqo3n1Kc0vgJfAEgw>
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 72B728005B;
 Tue, 12 Nov 2019 13:44:54 -0500 (EST)
Date: Tue, 12 Nov 2019 19:44:52 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Torsten Duwe <duwe@suse.de>
Subject: Re: [drm-drm-misc:drm-misc-next 5/5] include/linux/kernel.h:994:32:
 error: dereferencing pointer to incomplete type 'struct drm_bridge'
Message-ID: <20191112184452.GB4345@gilmour.lan>
References: <201911112308.UOBDjIac%lkp@intel.com>
 <20191112092239.GT4345@gilmour.lan>
 <20191112121013.GA31859@suse.de>
MIME-Version: 1.0
In-Reply-To: <20191112121013.GA31859@suse.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Wed, 13 Nov 2019 07:55:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=WPhjTV+N0y90NUE4Hot1ZzQMW/U
 I0ao2Hv7ppf+MaJM=; b=TzEToz3T8uwBeGqV90QdLrYhdt4K41ajP7GBvXOs29+
 umVVIpEI69txgZSZqPMu7aTT+8tGOE87iDMWiK1UCwNXck4HIz5Ykxrojw/tCqof
 gUZ1et/PasHiC9kpPISZOJGChhhZELWxT/xu7RV9E5Olgw/oCbVcCJEoa/IoGQMq
 lr+iERJRNIJ+P/UHZ3h99jBFPNGuqMRj9cL4Kw8cqHFfY5xZq7lxfdPuKrNFDylp
 WcWTBkrBdx9MXZVkHlujok4+4/nPVN53XSFpnaeEEVgBN0MQ+hsknuc9/FhpOMhG
 M/A/j5dUyR4huo2wX8KTH2Ebd83O8jRGSrK5PrkvzmQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=WPhjTV
 +N0y90NUE4Hot1ZzQMW/UI0ao2Hv7ppf+MaJM=; b=rzkBhmIvlxXpP1nSFJRvKH
 ooHiUKdwrAVB2MTkZs2T2aSiFHgmkC2vsX6SNBjC8jvMlR3BgsRNZbI9oh+vpBvt
 swCGNbzmwoKWxEFL8/bi9AtWfbttLxNw47rABdVePkp/pUTgGhbAFAXSX6puYtnn
 tNQLtnVwKaad9mCjvhHhdcIbW4ZhPXtVboV95gloWEmm0hp5ArTtDDvsouuGDv6y
 TsIwzIDojCKOgGXO+FkVFjnmeKcSUIK9e/nWw4HMTRBpgFsACl2mRmVmASHFCtYY
 JiDHCmZqUp99iJ9lRzuMBfEDlZzIklHSWKh3nyVAm+F4b8+ALCsY2DHu/Nada1PQ
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
Cc: kbuild-all@lists.01.org, kbuild test robot <lkp@intel.com>,
 dri-devel@lists.freedesktop.org, Vasily Khoruzhick <anarsoul@gmail.com>,
 Sean Paul <seanpaul@chromium.org>, Icenowy Zheng <icenowy@aosc.io>
Content-Type: multipart/mixed; boundary="===============0595470099=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0595470099==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VIT1Kna7lLfXMiZV"
Content-Disposition: inline


--VIT1Kna7lLfXMiZV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 12, 2019 at 01:10:13PM +0100, Torsten Duwe wrote:
> On Tue, Nov 12, 2019 at 10:22:39AM +0100, Maxime Ripard wrote:
> > Hi Thorsten,
> >
> > On Mon, Nov 11, 2019 at 11:53:20PM +0800, kbuild test robot wrote:
> > >
> > >    drivers/gpu/drm/bridge/analogix/analogix-anx6345.c:48:20: error: field 'bridge' has incomplete type
> > >      struct drm_bridge bridge;
> > >                        ^~~~~~
> > >    drivers/gpu/drm/bridge/analogix/analogix-anx6345.c:52:21: error: field 'link' has incomplete type
> > >      struct drm_dp_link link;
> > >                         ^~~~
> >
> > It looks like you didn't compile your driver after rebasing.
>
> FWIW I compiled and ran the rebased series, based on 5.4-rc6 + 025910db8.
> Who needs stable in-kernel interfaces anyway :-/

So that's what you did? Yet you were saying that this was tested on
top of drm-misc-next and linux-next...

> > The first error here is pretty trivial (missing drm_bridge.h include),
> > but the second one is there becaus the DP link helpers you rely on
> > have been removed.
> >
> > Can you send a patch to fix this? Otherwise, we can just revert the
> > offending patch.
>
> https://patchwork.freedesktop.org/series/68031/ passed me by unnoticed;
> I wonder why I Cc'ed Thierry on every single patch? A simple heads-up would
> have sufficed.
>
> Now that I have that series, I'm confident I can update the anx6345 driver
> accordingly.

Thanks
Maxime

--VIT1Kna7lLfXMiZV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXcr9pAAKCRDj7w1vZxhR
xaUsAQDiAMZVDDFTq9IeWnbGJ4wVAx+SMor6jJ+JKVQGin1DhQD/W4Jq47GkzSY4
sLzocM3lgkyewg2JOCmcBjQAg6nEVQI=
=pU/0
-----END PGP SIGNATURE-----

--VIT1Kna7lLfXMiZV--

--===============0595470099==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0595470099==--
