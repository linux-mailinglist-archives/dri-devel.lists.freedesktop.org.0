Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD73B6BEC88
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 16:09:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A64D10E275;
	Fri, 17 Mar 2023 15:09:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D198310E275
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 15:09:26 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id BE6C5320098F;
 Fri, 17 Mar 2023 11:09:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 17 Mar 2023 11:09:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1679065760; x=1679152160; bh=VUJVOJUO003F9IRKc7lefze8QUtwKmhKX18
 LzGoyvwY=; b=UKINpZMGOuRheyFir+QVcfXxlvj5IrBJqPuDQKrO2SzktMN7xA3
 msUFJRxzQHYBf5txauT09qgUKp77ntffpfm4r9oiVMUIs9kRN7p7f/lNy/ApLPou
 M26YdDmuJdxb3HTf/3stM0EbSMhK+gTp5uKIYGv3QQoEThkLM4nmtF6+wstuqhzE
 rXi9yNzXIL10UkI5fHfh8u5ea/hkptY3WQ9bewuUmqxsBCg0dXMy1C8XDP3ls/Rb
 vsA0DIoyVUiItXTkB+74nxrpfOSMmYCNGk9lJBSF1U1sR32QedHadv9Z6LjIv1Eb
 lgt1onH6GettuC9l3EtMD0hSAQRbkCN82oA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1679065760; x=1679152160; bh=VUJVOJUO003F9IRKc7lefze8QUtwKmhKX18
 LzGoyvwY=; b=mnbuwKqnrdir0pN/QhBBdKcH+roabwg2CEmrNMsO7mH+w8hWbVT
 xdK36OEcGuQJ4GG79RWyx+L9bnPlxpRgpkBfjvUBkOUJZKufz8Q02Sc9KIsHyXBe
 vOHbSBdyBHQC1keNzBvyXWGiPifaAwgkIKCm4Eoo2d0HSexHkeRC0mxN06LYNmJ7
 aIHEwNyXfBTSE67l7eTNbBJE8qW3EbLw6BCf7qdIcVku5iNgEpO7jAxcf2AfmtCM
 jRAiDtvsD3WbJWe3y1wwd/PW9OR5+YQQSefL3wti5lCm8STrwJHWqQXj52YvX5MM
 KiVsNckFrQ453FIi1pjfx56w+wOnZ1uyKQw==
X-ME-Sender: <xms:n4IUZO07nVikveS58s7kin1DzvMHKg6DJnAg3YFOP3QPzOsu-xvgxQ>
 <xme:n4IUZBGOOwviSd9b-FX0Ui5ptQ_94HewAFUj-qXdvLe0ffhsAC2M_E742RsNQSrH7
 xMPQSqWaSknd-pWHCA>
X-ME-Received: <xmr:n4IUZG4bC_cgNQf7z4Tsi7HgEfPiJlcjSsqzBd3oZHtP29lLCPTJdXIXJkaD_HxcTo9W6aZCuEXYyJoMKSbMmOquVfDcdfU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdefvddgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepiedtueffveeiueeftdduvdffffffgeffgfekiefhleelkedtlefhvefh
 udduhffgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgv
 tghh
X-ME-Proxy: <xmx:n4IUZP3tqhwW8-1obd5PoNcFtsU47y9iWD5tsCGFF1nscK-sS775qw>
 <xmx:n4IUZBFnGM5aNee5vtmu0N6Em_QWbwsAOm3-SXoX1Q_AGpPnC0wAMw>
 <xmx:n4IUZI_Ej--7NBIW0ZOft1uqMdRWaBAFyobx4aKH85mhwQvVvKFiwg>
 <xmx:oIIUZI870fW_TkqiZQwvZg-kD57AsKGGKE8RLzz3fYjzgU0NB0ptLA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Mar 2023 11:09:18 -0400 (EDT)
Date: Fri, 17 Mar 2023 16:09:16 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: [PATCH v4 2/8] kunit: drm/tests: move generic helpers
Message-ID: <20230317150916.a3xrh25ywe5k77yp@houat>
References: <cover.1679062529.git.mazziesaccount@gmail.com>
 <1abd47784b08939ff08ff03d3d4f60449e87625f.1679062529.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1abd47784b08939ff08ff03d3d4f60449e87625f.1679062529.git.mazziesaccount@gmail.com>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matti,

On Fri, Mar 17, 2023 at 04:42:25PM +0200, Matti Vaittinen wrote:
> The creation of a dummy device in order to test managed interfaces is a
> generally useful test feature. The drm test helpers
> test_kunit_helper_alloc_device() and test_kunit_helper_free_device()
> are doing exactly this. It makes no sense that each and every component
> which intends to be testing managed interfaces will create similar
> helpers.
>=20
> Move these functions to place where it is more obvious they can be used
> also by other subsystems but drm.
>=20
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>=20
> ---
>=20
> Please note that there's something similat ongoing in the CCF:
> https://lore.kernel.org/all/20230302013822.1808711-1-sboyd@kernel.org/
>=20
> I do like the simplicity of these DRM-originated helpers so I think
> they're worth. I do equally like the Stephen's idea of having the
> "dummy platform device" related helpers under drivers/base and the
> header being in include/kunit/platform_device.h which is similar to real
> platform device under include/linux/platform_device.h - so, in the end
> of the day I hope Stephen's changes as well as the changes this patch
> introduces to end up in those files. This, however, will require some
> co-operation to avoid conflicts.

I think you would have an easier time if you just copied and renamed
them into the kunit folder as an preparation series.

That way, you wouldn't have to coordinate DRM, CCF and IIO, you'd just
create new helpers that can be reused/converted to by everyone eventually.

Maxime
