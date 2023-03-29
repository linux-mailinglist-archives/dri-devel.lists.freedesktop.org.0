Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA436CD62A
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 11:16:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9AA710E165;
	Wed, 29 Mar 2023 09:16:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B64C10E165
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 09:16:41 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 6D58C5C0082;
 Wed, 29 Mar 2023 05:16:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 29 Mar 2023 05:16:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680081399; x=1680167799; bh=dklyY2cLc/yDrfewYfHoYxh7ZU+4CMdDwAX
 bz++KqV0=; b=CrRp2GoMwoCprrzkqXyCs6hl29PE5jk5SUuAmwcSioEUihCGjtd
 QQlBjVyow7xKPuwKPTG/y+5BJ95xPTxI3eqLifd7LT6QPlOmGf/QFKaN7pJATlXN
 x0B0o+9ndir/4HwhClbptZHu+ewc0WQvq/OpbBVHiUUTyE4bGvsehlv9nS6xf1kZ
 YWafQY7duV5W9DSwJ7I448Q9TxB5m86DipbJp2aH18GjPDJw3Na2KUAvP/9BYp14
 YcBW3k7Nn0q+BJfCyo2S57dqyuhz4RIXPWY6na6Kcfjr56238UQLYjLR0pj9L6sb
 8GeKe9s3qi11fUEHMjGvqqCRkYwHu2hvfBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680081399; x=1680167799; bh=dklyY2cLc/yDrfewYfHoYxh7ZU+4CMdDwAX
 bz++KqV0=; b=EROYHZaj3oKGYbjwiiDbMshFUQgi9reb674r2Fted9QtgZzAAti
 uFIwtAusal4gVFYmv1EXUdJVn/PFd9ue/oo7sYEf2G76WIFg89UivcKrUrtCv31F
 /qsFU1bKeOWkoSsWNvMMEFhqPg5rbfyKG1I/RV1sb4JT26+uxMH+XGcwHeMgU50T
 tY1sRsUaNf80K3L0Z5I4LGJjL5266sNWuWJVDgTgeJpk+pempdTxMmJSrrT6YcuT
 9iyBqh8l44EPYH3CkCblMsGY5DNIdo/AKpVTXXvSbRN57V71EjXe+kwdj5hTdklK
 QQ/cnelwZzyzE0QNTSMoUl25LMV7ryRA3Cg==
X-ME-Sender: <xms:9wEkZPniOfRZUBhq-KLFBpTjxXD7PKHew7HDz6ky3ByQEeBrorazpQ>
 <xme:9wEkZC12E3K7v1uPSfOkpbYRS7f6LGlhKthSdYYQpXZaJiurT00bRhzjsOLQ_iMVZ
 wDhzGK5ILCSX6t5ziU>
X-ME-Received: <xmr:9wEkZFoXUv3GNno8k8fO_BxSN4x_gPWs_R9bryiOHwabCVAiT8S0Wy0EA54>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehiedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnheptefgleeggfegkeekgffgleduieduffejffegveevkeejudektdduueet
 feetfefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:9wEkZHk5ynR7JvzlwiH3YRFFrxMc79goLtyDMHsD7DVAyaauP6YjOg>
 <xmx:9wEkZN3yjI_T4mYfGDLRCMs_1lAtz0m4ZkZYfJzaAzwJUa2U65vmzg>
 <xmx:9wEkZGuS2Mt2BpGFaPqukZbIILZX16LW40vajvfcJIGOVA_PlILIfA>
 <xmx:9wEkZHyqtMPUQ7_O_ph5srvL4JGCPoeUwjS5UndMOgPx-rtm08LpFg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Mar 2023 05:16:38 -0400 (EDT)
Date: Wed, 29 Mar 2023 11:16:36 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH 7/7] dt-bindings: display: add panel-timing property to
 sitronix,st7789v
Message-ID: <20230329091636.mu6ml3gvw5mvkhm4@penduick>
References: <20230314115644.3775169-1-gerald.loacker@wolfvision.net>
 <20230314115644.3775169-8-gerald.loacker@wolfvision.net>
 <20230316215735.GA3940832-robh@kernel.org>
 <dd26836f-d54c-65d1-0acc-8a09745bb066@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <dd26836f-d54c-65d1-0acc-8a09745bb066@wolfvision.net>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Gerald Loacker <gerald.loacker@wolfvision.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 16, 2023 at 11:29:53PM +0100, Michael Riesch wrote:
> Hi Rob,
>=20
> On 3/16/23 22:57, Rob Herring wrote:
> > On Tue, Mar 14, 2023 at 12:56:44PM +0100, Gerald Loacker wrote:
> >> The sitronix-st7789v driver now considers the panel-timing property.
> >=20
> > I read the patch for that and still don't know 'why'. Commit messages=
=20
> > should answer why.
> >=20
> >> Add the property to the documentation.
> >=20
> > We generally don't put timings in DT for panels. Why is this one=20
> > special?
>=20
> For now, having the timings in the device tree allows for setting the
> hsync/vsync/de polarity.
>=20
> As a next step, we aim to implement the partial mode feature of this
> panel. It is possible to use only a certain region of the panel, which
> is helpful e.g., when a part of the panel is occluded and should not be
> considered by DRM. We thought that this could be specified as timing in D=
T.
>
> (The hactive and vactive properties serve as dimensions of this certain
> region, of course. We still need to specify somehow the position of the
> region. Maybe with additional properties hactive-start and vactive-start?)
>=20
> What do you think about that?

I don't see why we would need the device tree to support that. What you
described is essentially what overscan is for HDMI/analog output, and we
already have everything to deal with overscan properly in KMS.

Maxime
