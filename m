Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7569B43C56F
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 10:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB7C89B27;
	Wed, 27 Oct 2021 08:44:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62CB089B12;
 Wed, 27 Oct 2021 08:44:57 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 71C57580486;
 Wed, 27 Oct 2021 04:44:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 27 Oct 2021 04:44:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=M3eCyMtSzQvSRfpY5rVVZ9RVkh6
 FdSVbf6yAV0XO4K8=; b=NmzUZOWnydiuj2S8GXj5BmNeI6pr7rLla6OGpcy3C4x
 SL8j7TvqoSbEzq1BnX6ggFJ9W+aANfQZl2j2oQi9v/Y1m5VlmUeid+r32/oNygjM
 upk8Qq4jkUaPrI2deYOakvWggWGqh7tAdSbO6N9mvdMrVDLDIUmc5fbffoNGouNh
 MZYmu70iQwwuO+33jBTTnjaDlpwybEj6wVjaiv8aAaEMS4OMe3eo5UBCx5C4kyQ4
 amOz6taiTkfqGK39fTrH+gnmsS9doz5wve3bKXvLQgSrno6DoyVTo4WZEpLZxYlr
 DBse/nwb8rbo5KaCwCVggb670luJpaZaFc+kQZnDktg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=M3eCyM
 tSzQvSRfpY5rVVZ9RVkh6FdSVbf6yAV0XO4K8=; b=kLB2N0MuxPnehTteBVIRkX
 /FWES0DM/0mOGMwFgIC9OXlHVkiq1CuZmq/W3sxWzGNh0crFYT0d+G0VEUjA2iQk
 pa04vRIDZrh/PAvHzPbEjAS709vJwAf34g80ZGTsGDX3eelaifSfQtB8rWOuN/Yu
 iXEjjmXGEfwmbn/SUTDOzRNqbHz6BPHJLfE1vKcLwTPm3ETQQL09KS6Id93j7/jU
 um+uYClmfXLMaH86Ljyk4I0l26IQEHdyFK7KGVgDa+u+4uoOu0Y+8nGyyR+HfDQA
 tW6jd3ix17HW+ZciU5Mau1fBru7L7L1EzBE35SoIp1vqYVN6UjSihcCj1e3YxnQg
 ==
X-ME-Sender: <xms:hBF5Yc7BzLyYRk4GGfOgPfbDwi-tlppOdcEnk6ov_Gx9a12rI5hQng>
 <xme:hBF5Yd60K--rqAYW6wQgyM38yfJDwJ75W7rCk-uOFeWk_G4ANbXKO0HQF2GRzqsFs
 wAEeethTYlTMbTHrlM>
X-ME-Received: <xmr:hBF5YbfOI1J3dz9b8owKVh8tx87ejOgb4HxrCXD7nLcTpl3a4BWFzfyx1l2jGmgk3_CY57eC5E5-A0oKYCO7Wh2bSLCLLCDKHxMgSxJh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegtddgtdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:hBF5YRLajqxC-IThi0jmk6jZ-O0HSCCBD3mbj1wS6NLddJ2x3g8z4w>
 <xmx:hBF5YQLKmrGZZMo_GHH5FieCkwvCNX5HJtD2SQ7m2_j4WOcF3nXv_Q>
 <xmx:hBF5YSxrJCfl9CrpGyipV_FdO_GukTIjGidowzUsN_cGUsbkkxgyhw>
 <xmx:hxF5YbdWEcCvXgYet2d3aj7yyvMAGIwE6wZItn1hxaP9XNTHrlLpqA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Oct 2021 04:43:52 -0400 (EDT)
Date: Wed, 27 Oct 2021 10:42:45 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,	David Airlie <airlied@linux.ie>,
 Thierry Reding <thierry.reding@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tian Tao <tiantao6@hisilicon.com>, freedreno@lists.freedesktop.org,
 Chen Feng <puck.chen@hisilicon.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 John Stultz <john.stultz@linaro.org>,	Rob Clark <robdclark@gmail.com>,
 linux-arm-msm@vger.kernel.org,	Sean Paul <sean@poorly.run>,
 Inki Dae <inki.dae@samsung.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 00/21] drm/bridge: Make panel and bridge probe order
 consistent
Message-ID: <20211027084245.6wjqk3e6fa3jw5qg@gilmour>
References: <20211021073947.499373-1-maxime@cerno.tech>
 <YXGFz4o5fWrfGnGk@ravnborg.org>
 <20211025151636.dsc3akojm7ywoecm@gilmour>
 <YXbhSjsPXk944TlF@ravnborg.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aobqxdixyoh4wxno"
Content-Disposition: inline
In-Reply-To: <YXbhSjsPXk944TlF@ravnborg.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--aobqxdixyoh4wxno
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 25, 2021 at 06:54:34PM +0200, Sam Ravnborg wrote:
> Hi Maxime,
>=20
> On Mon, Oct 25, 2021 at 05:16:36PM +0200, Maxime Ripard wrote:
> > Hi Sam,
> >=20
> > On Thu, Oct 21, 2021 at 05:22:55PM +0200, Sam Ravnborg wrote:
> > > Hi Maxime,
> > >=20
> > > > Let me know what you think,
> > >=20
> > > apply the lot to drm-misc-next. Maybe wait for an r-b or a-b on the k=
irin
> > > patch but the rest is IMO good to go.
> >=20
> > I had a compilation error since the rebase of the v4, so I sent a new
> > version. John Stultz has tested this series and given his tested-by, and
> > is the kirin maintainer.
> >=20
> > I guess it's enough?
>=20
> Yeah, go ahead and get it applied.

It turns out dim is not happy with just a Tested-by :)

I'll ask around for an acked-by or reviewed-by

Maxime

--aobqxdixyoh4wxno
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYXkRBQAKCRDj7w1vZxhR
xcX+AQDa5hm15ZvQWQkhoaM7QT0BYcG/8gBhyw2NycTLJeU50wEAsbuKE/SJt3yK
G9CaUa4imA2133VPQCI/46bOj5VmbAs=
=1uwT
-----END PGP SIGNATURE-----

--aobqxdixyoh4wxno--
