Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C366B4BD861
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 09:55:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F9F11281C;
	Mon, 21 Feb 2022 08:55:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C7311281A
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 08:55:37 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 870DC580229;
 Mon, 21 Feb 2022 03:55:36 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 21 Feb 2022 03:55:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=zcdXYKD7AIGXfsVFdjjk2+yAJ6zsZ8B0f4omWG
 U4udk=; b=LVxkjzRmQ4i/fCDy8Ek6wbLyQWNE22E401IzR2k13N3Ew037DuZLmi
 90/AdOlQQhkoKP0QzB4gbeJGr18LbcLmBzV8ka9qsNurIaBsjLYunuxvmyZG8Xi2
 hLcPwTKTqhs5iEj1cbAVJhKsmISL69uUAPmvZnzjLsfXCwUTHeJOaNyswUWg6WJ+
 miYx1ovsB7VqI0r55amRpSaRiZL0Ak7+bHM/EtrmlX+kUJi9Jkyj/DC+hxwrjDuV
 7myTB+f8OwKY8/BErNQMSfa2Kuc2iJ4o5mLqbiQHcliVzv64PfEWmE5hrnhfaH0m
 zs0da30wSrcgNKNjdJvOW/JA8pFGRJJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=zcdXYKD7AIGXfsVFd
 jjk2+yAJ6zsZ8B0f4omWGU4udk=; b=Q26jmJCQeassQD8bDmdKizI0QTqNcla26
 Z/sXnrDLuGaL9HqS/i8YzFk2xmSMg5qT/kGsVZyoLqSTwsIyBqXyq8RkY1BwuSFt
 QliDhtgjgX+f//x2hHtBd0x9iJ/e9wbClQ53Vq8ySt2L5I5z1MsYD9spxcgoRscu
 QaDu5sly+LhYn7wj37qZFFT4P56NisZ7DFvxHeADJ2Yo3eCcecgr07VYmoM8WjSm
 ivXsSrxXOySf62FF2HZLDdgb+1ARoSIGDx5b2+B8HLOZurpInf8VZT3E4HoqDgSz
 I5T2YtcS/CmqQ8PBVPs8UiGfEjktjTOzHthV6fN+nwMwzPlzufzyw==
X-ME-Sender: <xms:iFMTYkhhyhwq3q1gNDcLdP3q8C2Gcn0xGoGTIFTl5cf-mLt7sYkBUw>
 <xme:iFMTYtA36Hu-MfKjDgBkfzvgPIo3849S-J6pti4CJExQLCHTJVSCWNEU_UEJ7qt-V
 q_DIkav7joDmQTtBy4>
X-ME-Received: <xmr:iFMTYsH7JC_CWS-AKr917Bjxwqh6SbbwsRdMCucyfFiuWAetY7p88YlWByv5qdFb009yJNgva4gF729RxR0r-7ZfzvNueqUeOdzPO1o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeehgdduvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
 gfevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:iFMTYlQDvgXohLsYkaWvn1BTfIex5vySL60NfMqFYxzkcJyz8UNl_Q>
 <xmx:iFMTYhynmE5168aSv0qT-xR_Dqtkvj78qdTou6E4xuMW1lj21zzrFg>
 <xmx:iFMTYj7r2HOg3-c1NHjZOOf6MpAPn-q2NINtiX1xYM_81dmCIx7vEA>
 <xmx:iFMTYmo4J-9O2AlAD-UW1T9vmr3i44wDDqBByzDzzOKwQaNNj9QSMg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 03:55:35 -0500 (EST)
Date: Mon, 21 Feb 2022 09:55:34 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Subject: Re: [PATCH] drm/msm/dp: switch to devm_drm_of_get_bridge
Message-ID: <20220221085534.qw2x6mge42uo4fl6@houat>
References: <20220221073339.10742-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kcae224eyodkfp6e"
Content-Disposition: inline
In-Reply-To: <20220221073339.10742-1-jose.exposito89@gmail.com>
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 dmitry.baryshkov@linaro.org, swboyd@chromium.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--kcae224eyodkfp6e
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 21, 2022 at 08:33:39AM +0100, Jos=E9 Exp=F3sito wrote:
> The function "drm_of_find_panel_or_bridge" has been deprecated in
> favor of "devm_drm_of_get_bridge".
>=20
> Switch to the new function and reduce boilerplate.
>=20
> Signed-off-by: Jos=E9 Exp=F3sito <jose.exposito89@gmail.com>

Reviewed-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--kcae224eyodkfp6e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYhNThgAKCRDj7w1vZxhR
xQ/3AQDoqp/3uuiqU47wvaKsMT4OkQ8oU6uBZBmILyZXiEmPlAD8C7QMIh6RfG/2
cMb7pXNT5FUCHu/NDIb0I9E7Cig+gw4=
=WH80
-----END PGP SIGNATURE-----

--kcae224eyodkfp6e--
