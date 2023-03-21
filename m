Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1284D6C34DB
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 15:57:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A047910E211;
	Tue, 21 Mar 2023 14:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8511E10E211
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 14:56:54 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 6A7185C00FD;
 Tue, 21 Mar 2023 10:56:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 21 Mar 2023 10:56:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1679410609; x=1679497009; bh=Kr
 zg0wsgi3e1+bN2uZEn+LdbVtw9+KSDVRGMqDt0WbY=; b=rOFJfN0ZWr4AOuVBov
 h67qAC7OEWFK6+Lcmoxr4zy9jam8b5UPcV4rttDgUYhblJwTiNkoPAZ8S2f4QXqI
 khWQvUhOMUEXRA5Tnh3pnwhqy2vYe6cUxkaI8XKypB/U3jv5bWB4Gml3l2M0vqRI
 8mJa7sS91lwUUOuEiTaCZduzUxOZFgbgLsj5Q6hKNQV6TS7MUWHp2lqfLTR9w6/n
 wvZ3/6VplK1vWi4bxTNvF2DJzRBFZuFpLluihrbUXyRbWuZzCLxjldNoxRCDnsIh
 YDK98MSyNUuENuemqGZkDWxgnuS1pz1N9motRBRTE1SifM2zDEmsDjkPoL7Wh7W3
 8gPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1679410609; x=1679497009; bh=Krzg0wsgi3e1+
 bN2uZEn+LdbVtw9+KSDVRGMqDt0WbY=; b=HyLtwTHXPYjFq/3VilH0N4YsaxI0U
 CEVCkcQlv5EwGi/cmTpvzouxVUQuETIwpkz+XgS6rlxpVg52+XbaPvXlUdLCoEPu
 AQvzDhp84NU/D85de731dJQcXhKYsKOgUGNHvoRJntDpBN74Jj4m3vuOGhBOl8By
 6fijWW30/KVCyv7WzBJscCRUvjulbNSCpJfZZrudFjKXijsxQPuGAglSLDxEtw4p
 OPLG56lSNeXsyN7rffp/TVlZADqDIlHO8bVrrpx7C5ghZtlnnt3w3pjQxodFl0cG
 GeI19nlM6sIQuSxgfTk+N3MeMbugxnLsuiQ5013S/CAV/uVWXsUdr9C3g==
X-ME-Sender: <xms:sMUZZDA6TTiiQ4dKff3RNcFHbyTWFupKfv2GGsBnqNxInfOMRe7y1Q>
 <xme:sMUZZJgCX-c8oV6GxFI7VLrIiN9jaNV7_l9x0KlRcYr5oPFPER9Wj36o_WfAQR0CD
 FN_Coh-rwk1WVrOFbE>
X-ME-Received: <xmr:sMUZZOkCSQvDPdl7-gbbxEhgX0ekXFynCmUVMplv-HGOGMFE_nz8a4YF-NtdDJfMqLa8zKqL3MfvqsUKH2hS0cbRwOGXzhM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegtddgieelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeuvdejfefhueeukeegffekieejtdefkeejuedtueegleeijefgjeeigfej
 hedtteenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrghenuc
 evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhm
 vgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:sMUZZFz_YmheqIOzHQHDNT-qXP8dWAxzYkM1ntWuaip3sD4Hwdvbsw>
 <xmx:sMUZZIQmp9BzpaaH9ozAMrLOrqi1LiQ9PiH65ob3FXOqZpXIWk9sZg>
 <xmx:sMUZZIaaXH7DIfEVzrygybErvVHAUBAoHB21dttCxAYwxvnJv8Kdtw>
 <xmx:scUZZJL7YCbwJh8p6dSlsi-QwqvWQhUHCD9XhyeqSW73288P1g_s1A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Mar 2023 10:56:47 -0400 (EDT)
Date: Tue, 21 Mar 2023 15:56:46 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Roman Beranek <romanberanek@icloud.com>
Subject: Re: [PATCH] drm/sun4i: uncouple DSI dotclock divider from
 TCON0_DCLK_REG
Message-ID: <20230321145646.w6kr7ddurfxpg5rt@houat>
References: <20230320161636.24411-1-romanberanek@icloud.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zucvqkk7astyp3jt"
Content-Disposition: inline
In-Reply-To: <20230320161636.24411-1-romanberanek@icloud.com>
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
Cc: Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--zucvqkk7astyp3jt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Mar 20, 2023 at 05:16:36PM +0100, Roman Beranek wrote:
> In the case of DSI output, the value of SUN4I_TCON0_DCLK_DIV (4) does
> not represent the actual dotclock divider, PLL_MIPI instead runs at
> (bpp / lanes )-multiple [1] of the dotclock. [2] Setting 4 as dotclock
> divder thus leads to reduced frame rate, specifically by 1/3 on 4-lane
> panels, and by 2/3 on 2-lane panels respectively.
>=20
> As sun4i_dotclock driver stores its calculated divider directly in
> the register, conditional handling of the DSI output scenario is needed.
> Instead of reading the divider from SUN4I_TCON0_DCLK_REG, retrieve
> the value from tcon->dclk_min_div.
>=20
> [1] bits per pixel / number of DSI lanes
> [2] https://github.com/BPI-SINOVOIP/BPI-M64-bsp-4.4/blob/66bef0f2f30b367e=
b93b1cbad21ce85e0361f7ae/linux-sunxi/drivers/video/fbdev/sunxi/disp2/disp/d=
e/lowlevel_sun50iw1/disp_al.c#L322
>=20
> Signed-off-by: Roman Beranek <romanberanek@icloud.com>

This is similar to
https://lore.kernel.org/all/20230319160704.9858-2-frank@oltmanns.dev/

What's the story there? Also, how was it tested/confirmed?

Maxime

--zucvqkk7astyp3jt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZBnFrgAKCRDj7w1vZxhR
xW1uAP9976ZsRECK0eQpWRQZgu8XVlengWG8ooPy6U2I7N47ZgEA6brbh4HoKGtV
lwnpwiadCnsprq26idTI18GGtM6lrAY=
=giCa
-----END PGP SIGNATURE-----

--zucvqkk7astyp3jt--
