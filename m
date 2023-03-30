Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8CD6D08EA
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 16:58:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CBC210EEB7;
	Thu, 30 Mar 2023 14:58:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4291D10EEB7
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 14:58:19 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id C278F32002B6;
 Thu, 30 Mar 2023 10:58:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 30 Mar 2023 10:58:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680188295; x=1680274695; bh=FHEfLnOGnOORrms71L0mJQRc3S0uhMl8wak
 h7BNG13g=; b=D4MlvVrayE9fCoxy0co2+h6ulYDMFKOp9bATtF1I+jOFKlsffd7
 7QZzq3apC4mvgGsTUGVzRKMREyAESqRmF7/PpQAtzlGIacod+rVmkaR5nbusnetu
 znECsD074YDx8Q9Lud2R4/CBPzPj47ZNXNDbGStBJPbBXVqNg1PMvdyQ8FLivcxZ
 RpJ79Ebt9LkNGhLxfVHR2mTLJ8b4JC34gywKofOrfFogHcf5tAZONwdbCpqOjGak
 IK+HyslBdUW3FC9bYT/GC/OH36mYusPmglXSPmFeENF0Mipy9+H2wqS5FKefE1tY
 d5MDut2PQgyjB87AxFd9nRgNaWOCb20Iu7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680188295; x=1680274695; bh=FHEfLnOGnOORrms71L0mJQRc3S0uhMl8wak
 h7BNG13g=; b=dJq+ZYPmwpwjhaTsoZwi5PEJm2C4BqrtWwlJqn9NJX9s3zVSxnn
 8GcUp00HtCB8jrAFPlPUX2TGmcGN0AGT7fJp7QONus0KPbtHW2a+qNhO7Dsywq6I
 bpv/DoKdIT+0SIeMGKuRPw190w9+8zQPlC++mY4uDJbssFlwvUd8x10n+9J4/99i
 MU5/NV35JoeURbvCRiMleDAqFTiHvkx8akL4VMu0By1pMp7Yve1xodQOJ6H7PmA1
 Tc4sN1Nqvi4BaxTczDCFiDr3+unMBc4mXu7vO4E34H2wWLeoB7aTkI/KxUD8nbXc
 GFqnLGkpf8xZsMicEqnrzs7MbQlQvAMp9nA==
X-ME-Sender: <xms:hqMlZPJmd8-dQMx750bGenrretKGnEzIbn3cudEkWzslHnbQhMiS2Q>
 <xme:hqMlZDJdYqflIdCG_DMJok_wrMD0G4Z1_Z7KfswZtIsbs98fBaO-qmRDifFNY3Yn0
 sm_Ng_GV0wTbI98Oao>
X-ME-Received: <xmr:hqMlZHvyFOK6do8_FNWtxnuzXC-Qf4BLKjLY9s2tlbI7S7HjDRxkFs2tbLHF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehkedgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnheptefgleeggfegkeekgffgleduieduffejffegveevkeejudektdduueet
 feetfefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:hqMlZIYsDY2JiaUCJz692Jlk0wc7VWA2GyMPlkdnp-s_v1ZS_W6Z5g>
 <xmx:hqMlZGYdaGDlgeTAEUc7t1avM3r3dk5_isbFiP77otvUzMqC1iMM7g>
 <xmx:hqMlZMDErKWYWNpAlufSLaKD_X4n0nSiAiD7Cip3Bt_ms_kM1bTASg>
 <xmx:h6MlZMl6fnQNI3BRRgAMcsaKzvCyG-iJkilgKn_BZsrQ2ElfV7gptQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Mar 2023 10:58:13 -0400 (EDT)
Date: Thu, 30 Mar 2023 16:58:11 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH 7/7] dt-bindings: display: add panel-timing property to
 sitronix,st7789v
Message-ID: <20230330145811.asot2cvux4ebbeqy@penduick>
References: <20230314115644.3775169-1-gerald.loacker@wolfvision.net>
 <20230314115644.3775169-8-gerald.loacker@wolfvision.net>
 <20230316215735.GA3940832-robh@kernel.org>
 <dd26836f-d54c-65d1-0acc-8a09745bb066@wolfvision.net>
 <20230329091636.mu6ml3gvw5mvkhm4@penduick>
 <d5a31f75-eb93-0ff2-cd5b-19cdec58e103@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d5a31f75-eb93-0ff2-cd5b-19cdec58e103@wolfvision.net>
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

On Wed, Mar 29, 2023 at 12:08:50PM +0200, Michael Riesch wrote:
> On 3/29/23 11:16, Maxime Ripard wrote:
> > On Thu, Mar 16, 2023 at 11:29:53PM +0100, Michael Riesch wrote:
> >> Hi Rob,
> >>
> >> On 3/16/23 22:57, Rob Herring wrote:
> >>> On Tue, Mar 14, 2023 at 12:56:44PM +0100, Gerald Loacker wrote:
> >>>> The sitronix-st7789v driver now considers the panel-timing property.
> >>>
> >>> I read the patch for that and still don't know 'why'. Commit messages=
=20
> >>> should answer why.
> >>>
> >>>> Add the property to the documentation.
> >>>
> >>> We generally don't put timings in DT for panels. Why is this one=20
> >>> special?
> >>
> >> For now, having the timings in the device tree allows for setting the
> >> hsync/vsync/de polarity.
> >>
> >> As a next step, we aim to implement the partial mode feature of this
> >> panel. It is possible to use only a certain region of the panel, which
> >> is helpful e.g., when a part of the panel is occluded and should not be
> >> considered by DRM. We thought that this could be specified as timing i=
n DT.
> >>
> >> (The hactive and vactive properties serve as dimensions of this certain
> >> region, of course. We still need to specify somehow the position of the
> >> region. Maybe with additional properties hactive-start and vactive-sta=
rt?)
> >>
> >> What do you think about that?
> >=20
> > I don't see why we would need the device tree to support that. What you
> > described is essentially what overscan is for HDMI/analog output, and we
> > already have everything to deal with overscan properly in KMS.
>=20
> Thanks for your response, but I am afraid I don't quite follow.
>=20
> How are we supposed to expose control over the hsync/vsync/data enable
> polarity? I only know that the display controller and the panel need to
> agree on a setting that works for both. What is the canonical way to do
> this?

So typically, it would come from the panel datasheet and would thus be
exposed by the panel driver. st7789v is not a panel itself but a (pretty
flexible) panel controller so it's not fixed and I don't think we have a
good answer to that (yet).

> A different question is the partial mode, for which (IIUC) you suggest
> the overscan feature. As I have never heard of this before, it would be
> very nice if you could point me to some examples. Where would the
> effective resolution be set in this case?

So, back when CRT were a thing the edges of the tube were masked by the
plastic case. HDMI inherited from that and that's why you still have
some UI on some devices (like consoles) to setup the active area of the
display.

The underlying issue is exactly what you describe: the active area is
larger than what the plastic case allows to see. I don't think anyone
ever had the usecase you have, but it would be the right solution to me
to solve essentially the same issue the same way we do on other output
types.

Maxime
