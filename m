Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 448B7458FFB
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 15:09:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C2F89C93;
	Mon, 22 Nov 2021 14:09:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5BEA89C93
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 14:09:32 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id EBC7F5C01F5;
 Mon, 22 Nov 2021 09:09:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 22 Nov 2021 09:09:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=j
 xxN5b1YOQwiAkxp613+8q24NggXlkcYxWYUbf7zZYc=; b=m0N0uG0plcY3Ok1t0
 x/PF+Htvex7tdBECQGtQmkKHDNmm7d9NS4zhXHCuOjoAWJr4pyi6kQ7yg2e+wdZy
 yf0Sk3QLyoAi/R8yrgcc+uAHniHl7ifyYgPBt0DvCHD17U9Zlf/vtFtbPXPcKqH0
 wR/2y+JqIZHuet1gBRvh1ibzDMLio1DnkNoBj4X7JFq+7XEeLN2crWUCXzNQX7a5
 +LVcCWTH6qYUIH4PaoU4CThE90xfE8Y6yJhA95pwMoeff/2nfAwK0NKhaCWNwRrt
 qOYDPCMfixZzBew9AYrlxHBYGwondZYlAC1WUiB+SKIHUjop36+FL3d5a7p6rlBP
 DmVUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=jxxN5b1YOQwiAkxp613+8q24NggXlkcYxWYUbf7zZ
 Yc=; b=Wmh0dioUwMh1rwWOh3IrEw/lIXhx/PEu8mbTniy4ezI38qsHF0/ChHPnm
 cRsl7n3w7cSmrhmo28HLGDNXoT7wc9r5GdPWSX98gJjN4gyoDo/MlQuUTCoLlO/s
 xnCtjaKLsxt2hM44qCoeu1I+0dT0u2yk3xrQcbwE5gXeWKsCt/p5NbZJSC6nguaC
 W/YM4tCBHj68ZA97WbS3BnqwILTi8At1d3Pr4bmAenVgpvKSf78Has/jAG6Zh4aU
 ZPXdTI67jhj6H9fI+ywpLJ51WrkNutP18AjYJiF/auXYINwU1Xvcc15yGKOxILsh
 3ndjaHd61bhWBMzRy4Ewhv8Ng/btw==
X-ME-Sender: <xms:m6SbYY-QiqZqQyhfTH8fMcWqECRzK5PVyesPSPhJdjI8iXa782dXLg>
 <xme:m6SbYQsjqvSZvFMujEqBzL0Igj5tiGYqKHljQjtM2uJmJ8MW1Ola-GnHu_TzFyiMT
 s2Z3XgHsp3UfcTd7jE>
X-ME-Received: <xmr:m6SbYeAlcdekosSz8plGz6-BK3bdJorDgrbRkkD2W0PB6rs-DGaOMoRfyXPstho8HCubNHtWJNL5IOKLmPYP5uX3_CUWaeNcSx4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrgeeggdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepgfejtedtjefggfffvdetuedthedtheegheeuteekfeeghfdtteejkeeludeg
 vddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:m6SbYYfMl9K-2K6toXXrx0QXIh7hkjSdOP9yCLPSR0jDVzACFRNw1A>
 <xmx:m6SbYdMjG-e_AA1ph00nOInciGdjXgFwmGiXW_EZyj30ue8i-H8uxQ>
 <xmx:m6SbYSlvKEqmB3Mzb_dllQyeLeZAKxzatwZM7lahjNtPVAExcqoPcA>
 <xmx:m6SbYWhGNffJhjdnDFak0J-b5dyQCJNRJ8TDmPIHIFE5BKbh3xnP1A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Nov 2021 09:09:30 -0500 (EST)
Date: Mon, 22 Nov 2021 15:09:29 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v5 4/7] drm: sun4i: dsi: Add mode_set function
Message-ID: <20211122140929.22cmvnxxapp752ic@gilmour>
References: <20211122065223.88059-1-jagan@amarulasolutions.com>
 <20211122065223.88059-5-jagan@amarulasolutions.com>
 <20211122100759.qw6lvwb33ciemg2y@gilmour>
 <CAMty3ZDDQR-OkjqEfb1ZYZG+oLN2ZOv-2GLxs3AdeDHqUD8fjQ@mail.gmail.com>
 <20211122132847.ds4gtk2unq3fkagy@gilmour>
 <CAMty3ZAzwKtABZqJhVDmgOVpnZFg66z6Bc_pn3Fm9=658RPG1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMty3ZAzwKtABZqJhVDmgOVpnZFg66z6Bc_pn3Fm9=658RPG1g@mail.gmail.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, linux-sunxi@googlegroups.com,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 22, 2021 at 07:21:57PM +0530, Jagan Teki wrote:
> > It's perfectly valid to dereference the pointer in atomic_enable, and
> > that patch would consume memory for no particular reason.
>=20
> Again, I'm not pointing any mistake in dereference and certainly not
> understand about what memory consumption issue here.

You add a struct drm_display_mode field to struct sun6i_dsi. It
increases the size of struct sun6i_dsi of sizeof(struct
drm_display_mode).

> I'm doing it here since I'm doing it via mode_set in other drivers. No
> problem for me either way.

But *why* are you doing so?

There might be a valid reason in other drivers, but there's none here
(that you mentioned at least).

Maxime
