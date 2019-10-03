Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23203CAF70
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 21:41:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF2526EA6E;
	Thu,  3 Oct 2019 19:41:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C9C6EA70
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 19:41:45 +0000 (UTC)
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iG6yr-0006mn-I8; Thu, 03 Oct 2019 19:41:41 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 9365D2740210; Thu,  3 Oct 2019 20:41:40 +0100 (BST)
Date: Thu, 3 Oct 2019 20:41:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v8 2/5] leds: Add of_led_get() and led_put()
Message-ID: <20191003194140.GE6090@sirena.co.uk>
References: <20191003082812.28491-1-jjhiblot@ti.com>
 <20191003082812.28491-3-jjhiblot@ti.com>
 <20191003104228.c5nho6eimwzqwxpt@earth.universe>
 <acd11fe1-1d51-eda5-f807-c16319514c3a@ti.com>
 <62591735-9082-1fd7-d791-07929ddaa223@gmail.com>
 <20191003183554.GA37096@sirena.co.uk>
 <25b9614f-d6be-9da5-0fe5-eb58c8c93850@gmail.com>
MIME-Version: 1.0
In-Reply-To: <25b9614f-d6be-9da5-0fe5-eb58c8c93850@gmail.com>
X-Cookie: Reactor error - core dumped!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wolzDgDMk9sKmqcxXojGudZpWkj6Nd/XyboZ8g6aoLU=; b=oqZQ9iDTqA7nBBFIsZYY2eeSy
 ao5SiVDrx3xEQnnjGRGGGocTNZ2+mQZPM10gIsbI+nEWxKEXexTbz/5O7rVHh69Uv8ZM0zcs9vEbB
 nBcCTbbChcuSNDIwQk5hMraR+s1AH1yzLRS2/JE80ByH5Xzba4Haxhv8gNZX7Mh7EW4dU=;
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org,
 Liam Girdwood <lgirdwood@gmail.com>, tomi.valkeinen@ti.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, dmurphy@ti.com, pavel@ucw.cz,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, lee.jones@linaro.org,
 linux-leds@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0331630497=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0331630497==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="J4XPiPrVK1ev6Sgr"
Content-Disposition: inline


--J4XPiPrVK1ev6Sgr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 03, 2019 at 09:21:06PM +0200, Jacek Anaszewski wrote:
> On 10/3/19 8:35 PM, Mark Brown wrote:
> > On Thu, Oct 03, 2019 at 07:43:17PM +0200, Jacek Anaszewski wrote:
> >> On 10/3/19 2:47 PM, Jean-Jacques Hiblot wrote:
> >>> On 03/10/2019 12:42, Sebastian Reichel wrote:
> >>>> On Thu, Oct 03, 2019 at 10:28:09AM +0200, Jean-Jacques Hiblot wrote:

> > This mail has nothing relevant in the subject line and pages of quotes
> > before the question for me, it's kind of lucky I noticed it....

> Isn't it all about creating proper filters?

My point there is that there's nothing obvious in the mail that suggests
it should get past filters - just being CCed on a mail isn't super
reliable, people often get pulled in due to things like checkpatch or
someone copying a CC list from an earlier patch series where there were
things were relevant.

> >> I wonder if it wouldn't make sense to add support for fwnode
> >> parsing to regulator core. Or maybe it is either somehow supported
> >> or not supported on purpose?

> > Anything attempting to use the regulator DT bindings in ACPI has very
> > serious problems, ACPI has its own power model which isn't compatible
> > with that used in DT.

> We have a means for checking if fwnode refers to of_node:

> is_of_node(const struct fwnode_handle *fwnode)

> Couldn't it be employed for OF case?

Why would we want to do that?  We'd continue to support only DT systems,
just with code that's less obviously DT only and would need to put
checks in.  I'm not seeing an upside here.

--J4XPiPrVK1ev6Sgr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2WTvMACgkQJNaLcl1U
h9Auugf+M/zn9qkTET9ib5D1e+yMi2/IZ7fTAai9T2B+PpfoT99g1OPogSJsmjH6
HFm1fxQ2S4yyqCMx65spqqfXAj4vYAaIJ16BrkPv0ykL+QFaH7SyMZyvdMgYDsME
HmmjAAFt0Ljk6UMHcD6Vrcb9eqjkgioH3z/veVZaDY8M/fPzVTyIOEKCwnIB+3vo
mXiO62YHBVozTQTPVGfqkny8R4gz21SCuCdEs5n7WEyrNz5Sea/EDJ0cqYElJbLP
qPOeooxCrYZcTQXKiS4FnTZH4iAPT9Ly7zrmlxKT2V0PDhRof+X93bNuQ2p6iLQg
hZP2riCEv2AXWMZUQy8Mv4/5N2O+Mw==
=+gP7
-----END PGP SIGNATURE-----

--J4XPiPrVK1ev6Sgr--

--===============0331630497==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0331630497==--
