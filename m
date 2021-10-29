Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4134C43F934
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 10:46:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA8B6E101;
	Fri, 29 Oct 2021 08:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE9B26E0FC;
 Fri, 29 Oct 2021 08:46:33 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id AFE325803D0;
 Fri, 29 Oct 2021 04:46:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 29 Oct 2021 04:46:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=KCDVYpvU8owzJh7ed25Fazx4JcC
 pQRN+RBqX3Niw3QQ=; b=cgEDtuQWD9fhkEryi4lv/HFBfjnu3f43dz27hM6UPYX
 FozRHxqlBRXWF9BgMo/xmZLAzu6VwPtLfWVlwaW/wto+bZyEB6fXSj6ExIA1YRwO
 3Jil8a/ldhzmmaYzXGNY0FUt5Sqy5LcSusjF4T+Y6nKYKMQxfuMO+kTcge332hEo
 CQoB5x4oaiwGE+dkjn/SfuVFsKBe2aIu6LBfzU37RF6enCBpLaJlaj+2Nb/MYVJk
 b6PRUc6uFiAKHpkF46YGjObyxfb5UvxqgYHLJxSiPqzLQiSCy28YtseEaq41BMRG
 8yvbFPA+l9PIIr09wH9PbY0RlgVJDNItSOKgjxasN6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=KCDVYp
 vU8owzJh7ed25Fazx4JcCpQRN+RBqX3Niw3QQ=; b=MFlfQ3yugWe95zkPk1nfPN
 r3k8qBMeeQ9awm+m9VJ2EOlku2PwJTicR3/Bgd8VpuBQ0tDD8/eIjDtAgqrhzzCD
 /S+p4Gu1XAwzkvilg+MFtTqqvDNAsdds6DvBIIOfAcvOoCW8CAfg7eckCd5Xz+fc
 8IWYXtTzh6JVSTGae2q9LaeEYu+3Ql3mQAvdXAucfdK2+wURmZAcV4qU7aI0Cpwz
 EDkawpscSb0RCF12VSxK2wPkfxEEU5mVcYmKgYFYDNLcTPJfX8GdsbwvX7iLyOLT
 4jR3eC9vGPZuUJwWEFeUhImkAu7h4kAYJBS8qCUGF9ImzmPmryaarOpa0emgI5gA
 ==
X-ME-Sender: <xms:5LR7YWCGd_D1F2eCp66aNu4TuftwP2v7R_nuYulMD9k1w9WdoO3thA>
 <xme:5LR7YQiTFC4DvZzqXhTWso1tWfxqMTODRt9gvtO7R1_VZnCbQZXl_4bHf7-hdbQfd
 yj6TABioLPHNT8zixI>
X-ME-Received: <xmr:5LR7YZkinI00WL0kZNg5fjFy8EyXfQqmUr-TqSu3bIKvNNhaygw26gY8jw1LPRB1bCTfBqtzJbP2t3vfKPA_5k52THo50Drl2Zyc3BpD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdeghedgtdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
 gfevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:5LR7YUydf2pVOywwoeT8_27csSyuDxqSrW6EUNxT-6vMjfBOOSV2JA>
 <xmx:5LR7YbQF_CUCsgVLoXmMrFW7faYULw55NG4PR-ztnCuCVflBqYTZpA>
 <xmx:5LR7YfbBRHSXwVZVeDkk9RVsp9Q2F-QhJ2Dbzi66pg_ftwi5cbH9cw>
 <xmx:5rR7YbwhTXXSm8OPMGy7PyB5unGEnFnmdtv8uIhk64eKie1c5LXD3Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Oct 2021 04:46:27 -0400 (EDT)
Date: Fri, 29 Oct 2021 10:46:25 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Rob Clark <robdclark@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Robert Foss <robert.foss@linaro.org>,	Jonas Karlman <jonas@kwiboo.se>,
 Daniel Vetter <daniel.vetter@intel.com>,	David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,	linux-arm-msm@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Tian Tao <tiantao6@hisilicon.com>,	Chen Feng <puck.chen@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-samsung-soc@vger.kernel.org, Xinliang Liu <xinliang.liu@linaro.org>,
 John Stultz <john.stultz@linaro.org>, linux-kernel@vger.kernel.org,
 Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Subject: Re: [v6,02/21] drm/bridge: adv7511: Register and attach our DSI
 device at probe
Message-ID: <20211029084625.a46nfh2xgw72m2x6@gilmour>
References: <20211025151536.1048186-3-maxime@cerno.tech>
 <CGME20211029062347eucas1p1431402205321b066349e3ccf432d2452@eucas1p1.samsung.com>
 <73c13cf5-ca36-f47b-f53a-11d4f015505c@samsung.com>
 <20211029080521.6tmfq4kjngu5slv7@gilmour>
 <f62174cf-5786-f9d0-3a3a-3c9919f27b1e@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yh5xjlqje4fw5lh7"
Content-Disposition: inline
In-Reply-To: <f62174cf-5786-f9d0-3a3a-3c9919f27b1e@samsung.com>
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


--yh5xjlqje4fw5lh7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 29, 2021 at 10:36:00AM +0200, Marek Szyprowski wrote:
> Hi Mexime,
>=20
> On 29.10.2021 10:05, Maxime Ripard wrote:
> > On Fri, Oct 29, 2021 at 08:23:45AM +0200, Marek Szyprowski wrote:
> >> On 25.10.2021 17:15, Maxime Ripard wrote:
> >>> In order to avoid any probe ordering issue, the best practice is to m=
ove
> >>> the secondary MIPI-DSI device registration and attachment to the
> >>> MIPI-DSI host at probe time. Let's do this.
> >>>
> >>> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> >>> Tested-by: John Stultz <john.stultz@linaro.org>
> >>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >> This patch landed in linux-next as commit 864c49a31d6b ("drm/bridge:
> >> adv7511: Register and attach our DSI device at probe"). Sadly it causes
> >> endless probe-fail-defer loop on DragonBoard 410c board
> >> (arch/arm64/boot/dts/qcom/apq8016-sbc.dts):
> > I'm sorry to hear that (but would have been surprised if it didn't occu=
r)
> >
> > This is supposed to be fixed by 8f59ee9a570c ("drm/msm/dsi: Adjust probe
> > order"). Do you have that patch applied?
>=20
> Yes, I did my test directly on linux next-20211028, which also contains=
=20
> it. What might be important in my case, my DragonBoard 410c doesn't have=
=20
> any display attached.
>=20
> I've also noticed the following error during boot:
>=20
> [=A0=A0 23.847651] msm_mdp 1a01000.mdp: Adding to iommu group 3
> [=A0=A0 23.866044] msm_mdp 1a01000.mdp: No interconnect support may cause=
=20
> display underflows!
> [=A0=A0 23.957949] irq: no irq domain found for mdss@1a00000 !
> [=A0=A0 23.958014] msm_dsi 1a98000.dsi: failed to request IRQ0: -22
> [=A0=A0 23.962229] msm_dsi: probe of 1a98000.dsi failed with error -22
>=20
> The above errors appeared in next-20211028 for the first time. I assume=
=20
> that they are related.

Yeah, it's likely that the DSI host cannot probe anymore, and the DSI
bridge thus cannot find its DSI host. Rob, do you know what could be
going on?

Maxime

--yh5xjlqje4fw5lh7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYXu04QAKCRDj7w1vZxhR
xUk2AQC0uLhgSMqV1sSAqDsP/BJGszwlAxfb4tdIvyHAmBofAQD9Fl4HEPpgrVL+
WsKlFE07tqj66bK/WeGsO/l1JEHdpwM=
=XMtB
-----END PGP SIGNATURE-----

--yh5xjlqje4fw5lh7--
