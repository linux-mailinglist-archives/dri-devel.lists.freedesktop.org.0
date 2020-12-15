Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CD72DBD0B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 09:56:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5F38914F;
	Wed, 16 Dec 2020 08:55:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C7889D56
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 17:22:13 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 5DFB6320;
 Tue, 15 Dec 2020 12:22:12 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 15 Dec 2020 12:22:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=ku9wX9q6tm7JaDRiHiN8wxzpzoJ
 47xBLml4yqeHVfC0=; b=ZUVhAy2lxhFnDE3u/TRivizjHJVT2tqBL/gDHInh4+t
 TwyWE+/3vjIMk3eX1GnKd+8QemdCFalT0PQxeAeceCAIQqARGd42N+slojFHASJo
 jBc7gZIvZBJX53EkSIzuPwluwDlmuLFR561whRiMzLlPYJ1Xx7q/10rNC7n23Efv
 qxO9G+K3frp5Ji3x5ccUgMXNxuBYNeY56bOHVE/ruAGuf8pIILyMjNFuemvXuFhU
 0sMAoFxrzBSKpvZF5oAbMy3qYTgTlLolF4g8InnKZXmoVM7vtW1dJllbaPAxL6zv
 RR79L9lxD5X3WZpG+BB05gg5YNs0lMFIHSiKtrCviXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ku9wX9
 q6tm7JaDRiHiN8wxzpzoJ47xBLml4yqeHVfC0=; b=BihxfT4prAcu252LOk9NVt
 8J3XecFdw9jK6kjaKB70KV8A71i4D6ASt+34b0WFWWQmRXDYpbjslFtxhrTQFgT0
 zOj0r3eJ1bvRU7+XA9esgcr/s/8Kjavmuy8Shm3U3sW0DIDysDsP95Kl2KaLGP4g
 DHxsSXKgQHHL3dmZE6lIYMq6KymZTcOrnl2RFPQbfFmvfwYBUcYJgLaTd5At6uSZ
 g69ooDl6FMKqBobHGuZVc3EqOcezGm/Nvstq0sbB0cL0gm8wLNAneZV8+fz+y1Vn
 5vTyFIhJIQHpMXDhKARZYYnkDuUR2PgSFe003c+S0TUbbTGRmLrEh+xBix5WtRyg
 ==
X-ME-Sender: <xms:wvDYX7gZF4xSojxi-tlOWT7GWqdEZsJShxupF4IIjS9xC3eTmkKLUA>
 <xme:wvDYX4_ByeiHfBKjK97rCPIszpJPQn3pZUurALn_EJaO3bkH2AJMYq0G01TyLoYBc
 afYwcegc3nKBG-9NDE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeltddguddtvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
 heegudenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:wvDYX7bpTrI3ELhUYy9lDVopuBpJXFqf9AtxDUW39jCS8ST7xxei8A>
 <xmx:wvDYX2vQ3Mb_EXY_vlx39GpOWyJSOrE5N6kPljQPjYyxBDhdwQn2OQ>
 <xmx:wvDYX_mB3rU4fmjFyxb9wt6Pg2JxT1GUOWADzaeTjVRuciuZxpQriw>
 <xmx:xPDYX7rK-mj8xwFNKGnX7AxsQpdXstaKj6lKRxoZzm9WwglnEiIQBg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5B3C324005D;
 Tue, 15 Dec 2020 12:22:10 -0500 (EST)
Date: Tue, 15 Dec 2020 18:22:09 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v7 5/9] drm/vc4: hdmi: Create a custom connector state
Message-ID: <20201215172209.2pvodheuz72qq3p2@gilmour>
References: <20201215154243.540115-1-maxime@cerno.tech>
 <20201215154243.540115-6-maxime@cerno.tech>
 <CAPY8ntCP7O9GOrAo0qutHR8g3aJGY4a3ps-sa8LS5LjrN2D+Nw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPY8ntCP7O9GOrAo0qutHR8g3aJGY4a3ps-sa8LS5LjrN2D+Nw@mail.gmail.com>
X-Mailman-Approved-At: Wed, 16 Dec 2020 08:55:47 +0000
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
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1790475552=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1790475552==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="abzchchsmtva6so6"
Content-Disposition: inline


--abzchchsmtva6so6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Tue, Dec 15, 2020 at 04:25:46PM +0000, Dave Stevenson wrote:
> Hi Maxime
>=20
> On Tue, 15 Dec 2020 at 15:42, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > When run with a higher bpc than 8, the clock of the HDMI controller nee=
ds
> > to be adjusted. Let's create a connector state that will be used at
> > atomic_check and atomic_enable to compute and store the clock rate
> > associated to the state.
> >
> > Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> I'm happy again
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Thanks!

Does that apply to patch 9 as well?

Maxime

--abzchchsmtva6so6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX9jwwQAKCRDj7w1vZxhR
xbxPAP9LJtPgKeKM23wKaC8uA3m7UShzkjiXaH85fUE7cCKElAEAiyWcl/F/ixcg
kvBl3w+hY3y1mL1uWYmMoDDVV4SfOgI=
=ANzn
-----END PGP SIGNATURE-----

--abzchchsmtva6so6--

--===============1790475552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1790475552==--
