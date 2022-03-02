Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAF14CA1D2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 11:08:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7607310F36E;
	Wed,  2 Mar 2022 10:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA8210F370
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 10:08:06 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id BF9825C02F2;
 Wed,  2 Mar 2022 05:08:05 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 02 Mar 2022 05:08:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=GfLg9rjpbvy/srX8hjHXkfGyM4M2WLC0N4v+Qc
 KupUQ=; b=mTxcmcCAivD7gILquO9Z0Kcs1Lx5ycEVa4dmL3k2uZ5fEhuDjH/pLX
 FANo3Jnl3cixoVlTaxUVt2sFJBizOSDqTLkUJ/NDvVG5XUGTGyKVT67jG+QMmFbM
 nHyOMyFvEHrEXuqBgS880IYkAt4ObNA7HllT/GUZM0bIqoHvRIbdsskR1vu9de4g
 rpPQrIwQK9kV53IXhe25hJoTOY4g9dyLgWZNCAtTopTSqX0Jr6EtaqXb99h15RP0
 FUg039nDMpvfl4VfP7Z8rrPUQhTCI62sgam0HO7MhvqFS9ybe8c3aX/QNUNix65f
 OG04ExLfFnYFyigzIiu5297uz/DJeqPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=GfLg9rjpbvy/srX8h
 jHXkfGyM4M2WLC0N4v+QcKupUQ=; b=CXG9kJEc+9sVLTPEBBiSnq7qZw1DAyOB7
 yhylwsqxj0dRllv3bOduuWDujf9LKni4fjvRoduPSFu4WCrfoaAT3aSFjWDRtDci
 yoVo/VXrHwMpmswRSvruw6TJWl1nLZh/ar5alJAvkpuFDcEYq/FVUTafQ2xo0Jjn
 befpVmQfDj2UdfwpzcWx0Iyb9dnXMluag7iHT1U7TG9goDR0VZa9f/NZdX/F6jlY
 MnjOdBwK/tMT6Di85WnR9hIDxAdh+Eoi582o3sWzxsD6KbOYtXZq5LyES6PEE2lq
 ku9qGpx7Gw/kRufA6k62QHRmL5oAUahBq+RzLqoLM5m44M7mEAUPA==
X-ME-Sender: <xms:BUIfYq3qUEHZ09W0Xi1G033-moBt2AaX4INj1NPG7SVCsm7829BuGA>
 <xme:BUIfYtF1vSdFd34fJNzK6mdASg7pDj82Jln7xKfMyE4VMfoq244R8VGLAzUgf6hE0
 K3V_7ccTdPgohLXJfM>
X-ME-Received: <xmr:BUIfYi5IkfXkMk6bscVdlBuRCH_E27838-crpE6Mi_exTYLr_v6zsSNg2-RfqFXWX3ezOhUbCUWiUD88r--2Cmk0WHKCQtpJ1L5Degk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtgedguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:BUIfYr17AMkWFcZQhz5LB097M2nH1MhqKb7NrkkCop7TbRUewVmfww>
 <xmx:BUIfYtFB4DhX-hmlje_Mm1RRA7PDDQjdPHu9j7lLHWzjbsjpirvo1A>
 <xmx:BUIfYk9oMB5l4YEEEogqi6-4Mqc4Tk4ou1jyMl0s0vwFe3ZsE2V6rQ>
 <xmx:BUIfYhighr08teBZ6L4uXnM--WiPsg8gjVgF_DobJlFLs9YWLDw97Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Mar 2022 05:08:05 -0500 (EST)
Date: Wed, 2 Mar 2022 11:08:04 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V2 11/12] drm: bridge: icn6211: Rework ICN6211_DSI to
 chipone_writeb()
Message-ID: <20220302100804.n2nm3yk5yif67tjt@houat>
References: <20220217002530.396563-1-marex@denx.de>
 <20220217002530.396563-12-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yk6mzl3c54cb5qcd"
Content-Disposition: inline
In-Reply-To: <20220217002530.396563-12-marex@denx.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--yk6mzl3c54cb5qcd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2022 at 01:25:29AM +0100, Marek Vasut wrote:
> Rename and inline macro ICN6211_DSI() into function chipone_writeb()
> to keep all function names lower-case. No functional change.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> To: dri-devel@lists.freedesktop.org

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--yk6mzl3c54cb5qcd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYh9CAwAKCRDj7w1vZxhR
xS9kAQDHXCWr3oWbTMkTmif9UcowycOXTtdid4ISpM6PopyfqAD/U0N9Lu8396BJ
62TmSNEdGFAnjeI61uB2USq7Tjunawk=
=tz8S
-----END PGP SIGNATURE-----

--yk6mzl3c54cb5qcd--
