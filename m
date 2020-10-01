Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94305280DC6
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 09:03:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7046E046;
	Fri,  2 Oct 2020 07:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F5989CA0
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Oct 2020 09:33:17 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3587E58023D;
 Thu,  1 Oct 2020 05:33:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 01 Oct 2020 05:33:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=X/hpZ4Y0ZMB/Qo1FM7dGX0+GqSj
 9NQP7x2y+aZc2fP4=; b=YhzrqexPITb9eIHNrD4+gScUkQE9DitYdPele8TYbn/
 aAEWxee68iNJfcXwf9lNRQSY8RoQAyTn7/r7Uc8AtgLd6Pix9os033nWhSLUZgSR
 hdZw+Hjp+KKXdDeeAfKXK6B4Qth+OzQWVoelivsZgkSWjnSatYxRsWAvI0j4XgyB
 TU45E9jc02aUSycslDFnu24K3+j44oni+YL0sDCyoPaI4eBUbi5m9MRBy+dcGRyv
 mbnwScdG1ShDDjv//5IbsN6lDDvQMPoo27xCgdQaHVn18o7jToZUKW4abBKVmIla
 yrre8y2tAE/tD4y3nDL7xY9dMyc0p4SChRrDKYHBRDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=X/hpZ4
 Y0ZMB/Qo1FM7dGX0+GqSj9NQP7x2y+aZc2fP4=; b=XMMnA9n6/Q1D1lx/9DuaNH
 gT8QDwdHnccc4+I9Pkc6SN6HnGAG1M2zPEwxGaYtUrud7fnaQLXn/xfzyCC2lcd0
 dvF0ckIdH30WsGn08f1wd3Osug2xXk9bzH12usPsIq3j+5yhqPrbUNSMkBOzDezy
 llTf9gDt5ko4UCd0oU4YdoCdz0skrbRg1OurSFFXw3O5MKaN6DHc/sWP8pCHhW8D
 3Dy46DrrdesxYxFdNHvDduQWYvlCvd20HPIVpIwUpoUaVPiH84P6LcL5sB44hs/x
 0Gm4iMFoSj3Trzz81PLPpVr04/AOC/tK/vDmF+ixbDLKVn71bmBH1XnL88mPhfVQ
 ==
X-ME-Sender: <xms:W6J1X5xgspymeynKSWFNkJt0la7rRLxavWxLaHN5PPdszCJEwfjFPQ>
 <xme:W6J1X5RmhZoxK5w-jflDomXGhjV0DVjF3ykDJRJ841Fg_MWiPTHdcCdNp8lEDR2FX
 _tIDYIf_tamWZCOOLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeeggddukecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:W6J1XzX9xYSzmVlJYcS5KAhqLdXSW1MbT87XxVcLbXJK87ZZt2s4Fg>
 <xmx:W6J1X7jZiRFibQhHDNXUxc4kcKFjVPwLKejm18BbWL3KinnCXVBW9w>
 <xmx:W6J1X7DHMNN6Pyy-GCiRrEAI46asTN6baF7HD_F38O7nItl5X7-sFw>
 <xmx:XaJ1X4LpRjezgGo5YhLqO_3i6ieTHU-tf-SxyF1S9lNHXuVJEIczgg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A2B92328005D;
 Thu,  1 Oct 2020 05:33:15 -0400 (EDT)
Date: Thu, 1 Oct 2020 11:33:14 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH v5 80/80] ARM: dts: bcm2711: Enable the display pipeline
Message-ID: <20201001093314.lhph4ykvtjs4bo3i@gilmour.lan>
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
 <cfce2276d172d3d9c4d34d966b58fd47f77c4e46.1599120059.git-series.maxime@cerno.tech>
 <20200929221526.GA1370981@ubuntu-m3-large-x86>
 <20200930140758.gummt3umouva3wyu@gilmour.lan>
 <20200930163823.GA237050@ubuntu-m3-large-x86>
 <eb0c0edaf22404fd69440a85bb78397a14d49ddc.camel@suse.de>
MIME-Version: 1.0
In-Reply-To: <eb0c0edaf22404fd69440a85bb78397a14d49ddc.camel@suse.de>
X-Mailman-Approved-At: Fri, 02 Oct 2020 07:02:50 +0000
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Nathan Chancellor <natechancellor@gmail.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1998691330=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1998691330==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="w2hnz5ekr63d3x66"
Content-Disposition: inline


--w2hnz5ekr63d3x66
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2020 at 11:22:03AM +0200, Nicolas Saenz Julienne wrote:
> On Wed, 2020-09-30 at 09:38 -0700, Nathan Chancellor wrote:
> > On Wed, Sep 30, 2020 at 04:07:58PM +0200, Maxime Ripard wrote:
> > > Hi Nathan,
> > >=20
> > > On Tue, Sep 29, 2020 at 03:15:26PM -0700, Nathan Chancellor wrote:
> > > > On Thu, Sep 03, 2020 at 10:01:52AM +0200, Maxime Ripard wrote:
> > > > > Now that all the drivers have been adjusted for it, let's bring i=
n the
> > > > > necessary device tree changes.
> > > > >=20
> > > > > The VEC and PV3 are left out for now, since it will require a mor=
e specific
> > > > > clock setup.
> > > > >=20
> > > > > Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > > > Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
> > > > > Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> > > > > Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
> > > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > >=20
> > > > Apologies if this has already been reported or have a solution but =
this
> > > > patch (and presumably series) breaks output to the serial console a=
fter
> > > > a certain point during init. On Raspbian, I see systemd startup mes=
sages
> > > > then the output just turns into complete garbage. It looks like this
> > > > patch is merged first in linux-next, which is why my bisect fell on=
 the
> > > > DRM merge. I am happy to provide whatever information could be help=
ful
> > > > for debugging this. I am on the latest version of the firmware
> > > > (currently 26620cc9a63c6cb9965374d509479b4ee2c30241).
> > >=20
> > > Unfortunately, the miniUART is in the same clock tree than the core
> > > clock and will thus have those kind of issues when the core clock is
> > > changed (which is also something that one should expect when using the
> > > DRM or other drivers).
> > >=20
> > > The only real workaround there would be to switch to one of the PL011
> > > UARTs. I guess we can also somehow make the UART react to the core cl=
ock
> > > frequency changes, but that's going to require some effort
> > >=20
> > > Maxime
> >=20
> > Ack, thank you for the reply! There does not really seem to be a whole
> > ton of documentation around using one of the other PL011 UARTs so for
> > now, I will just revert this commit locally.
>=20
> Nathan, a less intrusive solution would be to add 'core_freq_min=3D500' i=
nto your
> config.txt.
>=20
> Funnily enough core_freq=3D500 doesn't seem to work in that regard. It mi=
ght be
> related with what Maxime is commenting.

Yeah, it fixes it here too

Maxime

--w2hnz5ekr63d3x66
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX3WiWgAKCRDj7w1vZxhR
xWyxAQCtT5n06PgaXjEzDsoo3iXgImo6rhnYHyBeb1jzJfG1XwEAimejVcajmPWZ
7Drs6MnyiOSSnqXdn9aEsubATlxJags=
=6Z6g
-----END PGP SIGNATURE-----

--w2hnz5ekr63d3x66--

--===============1998691330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1998691330==--
