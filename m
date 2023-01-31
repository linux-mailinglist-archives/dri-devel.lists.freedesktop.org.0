Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1252B682E89
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 14:59:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2FC810E0FF;
	Tue, 31 Jan 2023 13:59:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F6F10E0FF
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 13:59:18 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id D0ABF2B06891;
 Tue, 31 Jan 2023 08:59:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 31 Jan 2023 08:59:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1675173551; x=
 1675180751; bh=0y8Y+PGqAVhDxS1WylSL08fuonRFPkUeiF8ychgtNHM=; b=b
 WTuqkbO4N4tTZY0b9QBPMgxL1uzEyvGCEGrVLCX8l+NgQDTpYNxSOHB2VH3fourI
 vd+Ewo5mIOh18vpw/pVJy6WHK8Zyz9O7IzxskYMHy9satJePTvOYlsMZFi/8a1th
 DoZxRdSoYmndQBNbXbho3D9D6OrFUlmlXUobM2ggYpI0Au5An3rXpbyDbw/AmG8g
 K/P1Br0Kmj9Py9bb0oo+NQtf3BEJaTQoY5eKuuZOSxOIMq7XlL8GduAERkG0T0KG
 fuBD+Xw1YMQ7yZtkDq3O1Amg4hYnmIkQlAqP7StTJZR1YbpBDkbUhdFM36peimNy
 7VAK+ZxYfjOHFftb8fVdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1675173551; x=
 1675180751; bh=0y8Y+PGqAVhDxS1WylSL08fuonRFPkUeiF8ychgtNHM=; b=d
 +wCAYB1T+hEM0YcU5TV4CP4KwKV1RpXTFZnpWikhqmL7Y+08j8BO5s/cVIW5nXgr
 thoaLnNhvWE6z7zS3fAxhzDhjha6q1fiMzT8en5BBR2g95NxeDmp27qonUmTR2D/
 /LXfqD9mE/J6aBnuvPUoUkH8UbkodYIwkM1mOiOdFfaWKuYgeOCrsQWvvMlnwPos
 oj7zekttLmRI+HVWO7bnIPxAKB5Hcrt750y/psfIG94COQ8+5O1R2atqw9uU+zcx
 pM3OmP9NjI7Co7GujGuWoyPxee06Ylx8DG8z4Dcx+KpVbaHtk1Mq9RsdIYAvvgPc
 87foQOYkaNOVeYpp7Sxhw==
X-ME-Sender: <xms:rh7ZY6UzoJ1ANpQ2UE7RQkKIZncKaEObYW2uRznl38X7PRPTxC7SCA>
 <xme:rh7ZY2lXrgVZ5rJdoSPfRSMK0TziM1KDgsaEe4yOMvD98qg5WeVQPhwnTG1Ql0IlA
 oTUrQjYhch_zMfm0XU>
X-ME-Received: <xmr:rh7ZY-bl76eetRnPpo6F88gqt3jceC4btGMJXGYMds0hcLMdHmjncMnZH61jzhPqfs0pT48Xj8d9K1-Vgag_4QSsI30t_QtfxvWxyrnX8z04eQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefgedgheekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepkeefffeiveetjeeigeelgfehffelleekhfdvfeeivddtgedvkefhhfev
 fefgveffnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpfhhrvggvuggvshhkthhoph
 drohhrghdpkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
 rghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:rh7ZYxXznLIXQrY-kwpd-cWt_yZLSpE3iD4XQo41NcnX5dNeGWfQXw>
 <xmx:rh7ZY0ki2Jj5XvLNrjobgOS7ch0pzxnKNgifF42B7O7kexlspfEXrQ>
 <xmx:rh7ZY2fLBq1jHYs0xh4AHbJhcODdHqXJ2gBjxwWRIhZOoy5MnrDgYg>
 <xmx:rx7ZY1r1g_oaVVKMTdLzHB5b1NOG5UQLPMZXSPjKvLHISO8EqOMfz49p21Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Jan 2023 08:59:09 -0500 (EST)
Date: Tue, 31 Jan 2023 14:59:07 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [RESEND PATCH v11 02/18] drm: bridge: panel: Add
 devm_drm_of_dsi_get_bridge helper
Message-ID: <20230131135907.3jqxdnsxiqxi5bwz@houat>
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-3-jagan@amarulasolutions.com>
 <20230126121227.qcnftqvgiz44egpg@houat>
 <CAMty3ZB6QiqgQN_zWEXULHiipQWU_VaWxDWf9W8OTVQvkACu5A@mail.gmail.com>
 <CAMty3ZDTuvYKQYpVnoUU_-b3znJiyR0yBADO-5_5+86KgwYv3Q@mail.gmail.com>
 <20230130125648.mlrtubymeooejvhg@houat>
 <CAMty3ZANxwUp8yOjo+EWHNngi7SoMYhm1FchM38v_EUDpLY7UQ@mail.gmail.com>
 <20230131124550.6oalx43vz26gi5wt@houat>
 <CAMty3ZAtOV-jzpoJHdctEES-Mf3eNSKyuuCSgR5V2R+=K2W1aw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMty3ZAtOV-jzpoJHdctEES-Mf3eNSKyuuCSgR5V2R+=K2W1aw@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fancy Fang <chen.fang@nxp.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 31, 2023 at 07:17:50PM +0530, Jagan Teki wrote:
> On Tue, Jan 31, 2023 at 6:16 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > On Mon, Jan 30, 2023 at 06:54:54PM +0530, Jagan Teki wrote:
> > > On Mon, Jan 30, 2023 at 6:26 PM Maxime Ripard <maxime@cerno.tech> wro=
te:
> > > >
> > > > On Fri, Jan 27, 2023 at 11:09:26PM +0530, Jagan Teki wrote:
> > > > > Hi,
> > > > >
> > > > > On Thu, Jan 26, 2023 at 8:48 PM Jagan Teki <jagan@amarulasolution=
s.com> wrote:
> > > > > >
> > > > > > On Thu, Jan 26, 2023 at 5:42 PM Maxime Ripard <maxime@cerno.tec=
h> wrote:
> > > > > > >
> > > > > > > Hi,
> > > > > > >
> > > > > > > On Mon, Jan 23, 2023 at 08:41:56PM +0530, Jagan Teki wrote:
> > > > > > > > Add devm OF helper to return the next DSI bridge in the cha=
in.
> > > > > > > >
> > > > > > > > Unlike general bridge return helper devm_drm_of_get_bridge,=
 this
> > > > > > > > helper uses the dsi specific panel_or_bridge helper to find=
 the
> > > > > > > > next DSI device in the pipeline.
> > > > > > > >
> > > > > > > > Helper lookup a given child DSI node or a DT node's port and
> > > > > > > > endpoint number, find the connected node and return either
> > > > > > > > the associated struct drm_panel or drm_bridge device.
> > > > > > >
> > > > > > > I'm not sure that using a device managed helper is the right =
choice
> > > > > > > here. The bridge will stay longer than the backing device so =
it will
> > > > > > > create a use-after-free. You should probably use a DRM-manage=
d action
> > > > > > > here instead.
> > > > > >
> > > > > > Thanks for the comments. If I understand correctly we can use
> > > > > > drmm_panel_bridge_add instead devm_drm_panel_bridge_add once we=
 found
> > > > > > the panel or bridge - am I correct?
> > > > >
> > > > > Look like it is not possible to use DRM-managed action helper her=
e as
> > > > > devm_drm_of_dsi_get_bridge is calling from the DSI host attach ho=
ok in
> > > > > which we cannot find drm_device pointer (as drm_device pointer is
> > > > > mandatory for using DRM-managed action).
> > > > > https://github.com/openedev/kernel/blob/imx8mm-dsi-v12/drivers/gp=
u/drm/bridge/samsung-dsim.c#L1545
> > > > >
> > > > > Please check and correct me if I mentioned any incorrect details.
> > > >
> > > > You shouldn't call that function from attach anyway:
> > > > https://dri.freedesktop.org/docs/drm/gpu/drm-kms-helpers.html#speci=
al-care-with-mipi-dsi-bridges
> > >
> > > True, If I remember we have bridges earlier to find the downstream
> > > bridge/panels from the bridge ops and attach the hook, if that is the
> > > case maybe we can use this DRM-managed action as we can get the
> > > drm_device pointer from the bridge pointer.
> >
> > I'm not quite sure what you mean. You shouldn't retrieve the bridge from
> > the attach hook but from the probe / bind ones. If that's not working
> > for you, this is a bug in the documentation we should address.
>=20
> Something like this, afterward the design has updated to move the
> panel or bridge found to be in host attach.
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/=
drivers/gpu/drm/bridge/nwl-dsi.c?h=3Dv5.10#n911

What are you pointing to exactly, it's not a MIPI-DSI host attach,
that's a bridge attach, you have access to the DRM device there.

> >
> > > So, what is the best we can do here, add any TODO comment to follow up
> > > the same in the future or something else, please let me know?
> >
> > Make it work in a safe way, as described in the documentation?
>=20
> Yeah, it is a clear deadlock. It is not possible to use DM-managed
> action helper in host attach as there is no drm_device pointer and we
> cannot move panel or bridge finding out of host attach as per design
> documentation. I'm thinking of go-ahead with adding TODO for adding
> the safe way with an existing patch. Please let me know.

I've been telling you for three mails now that it's not acceptable. So,
again, no, it's not acceptable. Do something else and follow the
documentation instead.

Maxime
