Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B48BCBD8B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 16:40:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B50B6EBB9;
	Fri,  4 Oct 2019 14:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C92AE6EBB9
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 14:40:33 +0000 (UTC)
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iGOkw-0003CN-8p; Fri, 04 Oct 2019 14:40:30 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 56EEB2741EF0; Fri,  4 Oct 2019 15:40:29 +0100 (BST)
Date: Fri, 4 Oct 2019 15:40:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: Should regulator core support parsing OF based fwnode?
Message-ID: <20191004144029.GC4866@sirena.co.uk>
References: <20191003082812.28491-3-jjhiblot@ti.com>
 <20191003104228.c5nho6eimwzqwxpt@earth.universe>
 <acd11fe1-1d51-eda5-f807-c16319514c3a@ti.com>
 <62591735-9082-1fd7-d791-07929ddaa223@gmail.com>
 <20191003183554.GA37096@sirena.co.uk>
 <25b9614f-d6be-9da5-0fe5-eb58c8c93850@gmail.com>
 <20191003194140.GE6090@sirena.co.uk>
 <a9f668f9-ad26-4e18-178a-8403b8b3b1db@gmail.com>
 <20191004113942.GB4866@sirena.co.uk>
 <b6318ba5-e76e-dc1c-6921-a702abf6749c@ti.com>
MIME-Version: 1.0
In-Reply-To: <b6318ba5-e76e-dc1c-6921-a702abf6749c@ti.com>
X-Cookie: core error - bus dumped
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sdQIBbOXBwzFgH+w4lhhVo+Zt37yuiiDYZ+TGwQZASg=; b=lxBwAiZXpgjJ6SKZpBNusOjRW
 YldjtkMC4YgiMNF6azYMG/L8Ymms7j6dGPRgb6/OudyY7UIQzHSHbX7Gjl6DlBlyiXrO2L2agBCxf
 +hnxCb52rSLdMtVnoG8zORokOx2kE1pYyT/TBMbRrV1GX2yr8ILfEesXrBEnqz/q+kDQI=;
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
 robh+dt@kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 pavel@ucw.cz, lee.jones@linaro.org, linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Type: multipart/mixed; boundary="===============1290676362=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1290676362==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V88s5gaDVPzZ0KCq"
Content-Disposition: inline


--V88s5gaDVPzZ0KCq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 04, 2019 at 03:33:13PM +0200, Jean-Jacques Hiblot wrote:
> On 04/10/2019 13:39, Mark Brown wrote:

> > Consumers should just be able to request a regulator without having to
> > worry about how that's being provided - they should have no knowledge at
> > all of firmware bindings or platform data for defining this.  If they
> > do that suggests there's an abstraction issue somewhere, what makes you
> > think that doing something with of_node is required?

> The regulator core accesses consumer->of_node to get a phandle to a
> regulator's node. The trouble arises from the fact that the LED core does
> not populate of_node anymore, instead it populates fwnode. This allows the
> LED core to be agnostic of ACPI or OF to get the properties of a LED.

Why is the LED core populating anything?  Is the LED core copying bits
out of the struct device for the actual device into a synthetic device
rather than passing the actual device in?  That really doesn't seem like
a good idea, it's likely to lead to things like this where you don't
copy something that's required (or worse where something directly in the
struct device that can't be copied is needed).

> IMO it is better to populate both of_node and fwnode in the LED core at the
> moment. It has already been fixed this way for the platform driver [0], MTD
> [1] and PCI-OF [2].

Yeah, if you're going to be copying stuff out of the real device I'd
copy the of_node as well.

> > Further, unless you have LEDs that work without power you probably
> > shouldn't be using _get_optional() for their supply.  That interface is
> > intended only for supplies that may be physically absent.

> Not all LEDs have a regulator to provide the power. The power can be
> supplied by the LED controller for example.

This code probably shouldn't be being run at all for LEDs like that, I
was assuming this was just for GPIO LEDs and similar rather than all
LEDs.

--V88s5gaDVPzZ0KCq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2XWdwACgkQJNaLcl1U
h9A0xwf/U7Fm4ePiL2y1R3tDNXQn6f+Ur82WCmb5QG5/fkiK7tKAiiqjZdb4UiQ3
UoCAY3wUBeivTw0fCmNqy4kzoR8YY+pOlVu5Tp1j2XMTO/xZTTfnW6oYBJai4evk
6rUCxFl/STljjjojTz+dph2hqLkBwo1HbPKqwXXHvy54CIalHfRma0AbN4t1qySt
WftXW83OaF82QqZLtf21nnKfAuve/p8nPEc5wjF06ZFLqv2LLRBEwJWXc2L3O0NC
FgOKXCWKQwidU2XcgS67Kxtz0vviOhugRZm9boLYk/63sMjOnYmS6+9OzzSgFXCI
Q+eZGtEugXuSLTew99ZJm9Hw3FTj7Q==
=SmQ4
-----END PGP SIGNATURE-----

--V88s5gaDVPzZ0KCq--

--===============1290676362==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1290676362==--
