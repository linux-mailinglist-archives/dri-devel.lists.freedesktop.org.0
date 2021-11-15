Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8709B450389
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 12:33:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B67756E8D6;
	Mon, 15 Nov 2021 11:33:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D6E6E8AC
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 11:33:51 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 13A073200A1E;
 Mon, 15 Nov 2021 06:33:51 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 15 Nov 2021 06:33:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=i6Cp4qqoOBe14ZgFWLAnguHBRY9
 thtZqs5YYbssWhX0=; b=NRbP1yBJmz2P9nb7MivqC0/3CxdbP8+xYnAn2Skx0hR
 /Z07i4CrjCGWQKonsv09s8rFUd7BtR0IG8hZoBpDu7YxsrgJuA0MWpwWPARvnccR
 mUF4OxXSt1D4llDbBx8i8GyM5hoa2AHA0fZGm7dVV4yOOQX4skbdBjJ8wENsPODQ
 n+17ypNL8T1CTFNESWtlX+vcE2zlcNblTPR0y7mK7jqDsVZQMEyZU5ZEkLGdBi4l
 f+BHYErVFTWbK3cRdAX24NRL0zZ6gjyc9c+KWzklZHacs+CE/9dE6G2y78X/cQFm
 xGyiu1NpuEy4EhsjvF/3ivu1O5knvlV/2L7UZqwVo0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=i6Cp4q
 qoOBe14ZgFWLAnguHBRY9thtZqs5YYbssWhX0=; b=DRDkjLm0UenOCxmrHgaxQ1
 fAHJLauMvW8AUo2mgrTLyIOXJjdyJIl/wNdn5rA/WpbzK0tx3QHRe4TE4Mkh47uo
 CZvPHYTHc4Uzxp80VJEbnzMP3Ej32L41tpcJOsE536J294I2ysIj1TL13vZNSQ17
 DYu+EkQ5ec6XJCHgQxI10hPfH8k4HZadHsUkXQglIqRMGB/I9FJPpeQgzZgnMY7u
 Pt2IbRkKiTRXvDBVyuRptgj5cDtv/bwP0NHn2avSdSd9g823WNCZa5JC0HTyI7wH
 Fd6jxU1KdE3Vf8syQOntggFxjDSkgb+aOlJsiHvgrV4Wauq0/wLeRRZG6+t4PtRA
 ==
X-ME-Sender: <xms:nkWSYW7_PnTi9oBt4u-7-eIqVtoDL-DqhweAm0Co47X-eeu1UFx-Rw>
 <xme:nkWSYf6xrT0wg_6Ne8hXgzsGJMo8P8aEXWqmnUgiIBOFjIv9jtUOch3r2tYxFA5TS
 c3rrXtFEgyjbMdRJG0>
X-ME-Received: <xmr:nkWSYVdVZ6ImQq-qnVBaVRo9mrqNJH4b5Ojer4OuVlRzDSVlV66EHdBw9MpZOg4k_yKvAd6r0RyISRdkJhwB00pG_mduazpS03YhH4Ll>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfedtgddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeeivdfhtdfggefgleffgfetieevvefhtddvhfehfefgfffhuefhtdeufeevhfel
 vdenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrghenucevlh
 hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvges
 tggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:nkWSYTLswl-a2ySU3LpHw05-gpRVKl7nwU-kH8u8gcrpW9XLNN2Qbg>
 <xmx:nkWSYaJBjzxcMJEuie9fkr2dzWNzVSlAP_H_PzlTla36wSHtuuZUpQ>
 <xmx:nkWSYUwaNfyQvYfWIrPVdt57USbW6YntoxPgYsiOp8_DP_8hrn_NCQ>
 <xmx:nkWSYRUhcJ8tNIpWPgGHGfseDXomfVp6CmegIYkiX-pHfGqMGOCkPg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Nov 2021 06:33:50 -0500 (EST)
Date: Mon, 15 Nov 2021 12:33:48 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jian-Hong Pan <jhp@endlessos.org>
Subject: Re: [BUG] VC4 DRM waiting for flip down makes UI freeze a while with
 kernel 5.15
Message-ID: <20211115113348.aylgkwrmaaomqrp4@gilmour>
References: <CAPpJ_ecMSA8A=c=3KDOb59M=+go7DYH4dNNbE2cqYgDioO=MRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qpgvaecxcpaoyprl"
Content-Disposition: inline
In-Reply-To: <CAPpJ_ecMSA8A=c=3KDOb59M=+go7DYH4dNNbE2cqYgDioO=MRQ@mail.gmail.com>
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
Cc: Linux Kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux@endlessos.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--qpgvaecxcpaoyprl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 12, 2021 at 11:22:49AM +0800, Jian-Hong Pan wrote:
> Hi,
>=20
> I tested Linux mainline kernel 5.15 (aarch64) with enabled VC4 on RPi 4B.=
 I
> notice UI freezes a while (about 10 seconds) some times.
>=20
> The kernel shows the error message during the time:
>=20
> [drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
> [drm:drm_atomic_helper_wait_for_flip_done] *ERROR* [CRTC:68:crtc-3]
> flip_done timed out
> [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CRTC:68:crtc-3]
> commit wait timed out
> [drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
> vc4-drm gpu: [drm] *ERROR* Timed out waiting for commit
>=20
> Here is the full log:
> https://github.com/lategoodbye/rpi-zero/files/7518076/dmesg-5.15.log
>=20
> It is easy to reproduce this issue by invoking GL related things, for
> example "es2gears".
>=20
> After detail test, I found it is related to these commits:
> * f3c420fe19f8 ("drm/vc4: kms: Convert to atomic helpers")
> * 82faa3276012 ("drm/vc4: kms: Remove async modeset semaphore")
>=20
> This issue cannot be reproduced after I revert the commits.

I've been working on those regressions recently, and just sent all the
fixes I have so far:
https://lore.kernel.org/dri-devel/20211115113105.103275-1-maxime@cerno.tech/

Based on the symptoms you provided, I think it should be fixed with
those patches

Let me know how it goes
Maxime

--qpgvaecxcpaoyprl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYZJFnAAKCRDj7w1vZxhR
xcKCAP4y9pmb6MnR5yzUyTIh8aA79lOK/NloUXd70TR0mU0WPwEA2w14ccqMXubE
kMenwG5Vky1y6x12a9PCIwtTidqSjQk=
=ufoo
-----END PGP SIGNATURE-----

--qpgvaecxcpaoyprl--
