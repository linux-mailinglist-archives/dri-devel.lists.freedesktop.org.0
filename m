Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB7E61EEF2
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 10:29:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8567610E296;
	Mon,  7 Nov 2022 09:29:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 181F910E296;
 Mon,  7 Nov 2022 09:29:21 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id BEDDC2B064E2;
 Mon,  7 Nov 2022 04:29:16 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 07 Nov 2022 04:29:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1667813356; x=
 1667820556; bh=sGLYX2Q2sLh8y8xtw0Tv2vfldq1F5epWcW2IPDL3KK8=; b=k
 Vm1CA+OdtyijBHy9h8vxDhuIim/jvDL1C/OvhSQOlWdZ1jOAx1SZPRUkkyUHKfG9
 46twnGuA+abmurO1+6kUBEQ4LB+4LDNWdIzlD7Zg/7HrRPxWUwqp7/IwFohA3Z00
 85eAH0c/Tm2lYmvucMQTjRv507xyq72W6ps7OfUve8pukItvJzFfB3/sBCPAbLbP
 SEFlYg6lK50vDELC18HNPjV5auDd8o6S1PVDZKiKV4fAgVVTUV+mSdlh7i+QwT8k
 xusNBh/bIH64WETyBADL7xtYDNL7Q0VUjGipkA8STqTaPFTRO/DQQFwgrvnnbDZx
 HsTM61ay94eMoQQaKp7+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1667813356; x=
 1667820556; bh=sGLYX2Q2sLh8y8xtw0Tv2vfldq1F5epWcW2IPDL3KK8=; b=D
 nEl2QDdhP0UhL1Ce2mBEKjENER1JZF6wEEMDgxy7JfuhnYj0DfHLIMcGXcyoBr1N
 F7qihNnpjK6sEbADqcj59TD7SIS9kPn94pX0LNbx8rsc8r2DpxkN6dwl43Mq4mdc
 VOiWhZQDntFAZifK30fp/qZcoxzBx4l6TqIF7MfQjNOmS84+mgN1nrFD2iQGXx8p
 CWZQV7V4+tjcSRPPyCyPYkbpmZmwl/G7Qhpqj+zEMYg+vy4aYv8iRfrfhypuIbze
 GPANGVlQjUUy3sopEIPNUGIBg+E2fS0R5bm4pr7fR6x5yaYZWMkrYxfqoOFJhrwK
 0TBpBRWSfhBOEzDQ9qZKA==
X-ME-Sender: <xms:689oY2doS-knzTGSj4jVwOr6dtysxeUFRVvujfBEeYQgI9_eXavXOg>
 <xme:689oYwMa0u12BDHOZa7DmhYziPcuAoe5o3ToiTlG4oqsmPKYFRkcAkNN_uokE3xkU
 PxURsBVcFGKDSgjoI8>
X-ME-Received: <xmr:689oY3gd-JFj9FRuG121Gl7xU2Jkn6mil0HGcpbw7UeCG1BZDD98gER6gM6M7MLr4tC466ugmAIVb2ozvN71pGI05lY0Ec4Ky5G_D0i81JCN5w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdekgddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedtkedvtdegfeehveefkeffgeeiffdujefgtdfgleduteekjeejteefleej
 ffffgfenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhn
 ohdrthgvtghh
X-ME-Proxy: <xmx:689oYz_IoZCpRKOHRnNwRlGNiN7P_Ky1qo9E_AbHkF7US4_Kp5chjg>
 <xmx:689oYyuhImctyyOldYB9YoA9M8CDAvvoTW8sRHtchFrnwxvbuY2tLg>
 <xmx:689oY6HdFWUDPL9spyiLR7cOuJeYjszTl80LUtI_eZ5siNAAbq-SFw>
 <xmx:7M9oY74DjEG9KgxalP0QBDUY0FuEiS-KTYKSFJYzglHKi9YRMN4c8YzAkOk>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Nov 2022 04:29:14 -0500 (EST)
Date: Mon, 7 Nov 2022 10:29:12 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: Must-Pass Test Suite for KMS drivers
Message-ID: <20221107092912.q7tcsv4gmmsohmx3@houat>
References: <20221024124323.tfyxcadyd4nz56jz@houat>
 <CAF6AEGuokyL+_ZsWeeMeyCcyErapka0ALZQ60bdWKvja3gcN9Q@mail.gmail.com>
 <20221026081711.zj7h2rpfd4kfkpqe@houat>
 <CAF6AEGs3j7wmjM10o2Dpw4mgTJC7L4SXHPZkJm_DjeQVG5H_vA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAF6AEGs3j7wmjM10o2Dpw4mgTJC7L4SXHPZkJm_DjeQVG5H_vA@mail.gmail.com>
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
Cc: Petri Latvala <petri.latvala@intel.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Arkadiusz Hiler <arek@hiler.eu>, Martin Roukala <martin.roukala@mupuf.org>,
 dri-devel@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 27, 2022 at 08:08:28AM -0700, Rob Clark wrote:
> On Wed, Oct 26, 2022 at 1:17 AM <maxime@cerno.tech> wrote:
> >
> > Hi Rob,
> >
> > On Mon, Oct 24, 2022 at 08:48:15AM -0700, Rob Clark wrote:
> > > On Mon, Oct 24, 2022 at 5:43 AM <maxime@cerno.tech> wrote:
> > > > I've discussing the idea for the past year to add an IGT test suite=
 that
> > > > all well-behaved KMS drivers must pass.
> > > >
> > > > The main idea behind it comes from v4l2-compliance and cec-complian=
ce,
> > > > that are being used to validate that the drivers are sane.
> > > >
> > > > We should probably start building up the test list, and eventually
> > > > mandate that all tests pass for all the new KMS drivers we would me=
rge
> > > > in the kernel, and be run by KCi or similar.
> > >
> > > Let's get https://patchwork.freedesktop.org/patch/502641/ merged
> > > first, that already gives us a mechanism similar to what we use in
> > > mesa to track pass/fail/flake
> >
> > I'm not sure it's a dependency per-se, and I believe both can (and
> > should) happen separately.
>=20
> Basically my reasoning is that getting IGT green is a process that so
> far is consisting of equal parts IGT test fixes, to clear out
> lingering i915'isms, etc, and driver fixes.  Yes, you could do this
> manually but the drm/ci approach seems like it would make it easier to
> track, so it is easier to see what tests are being run on which hw,
> and what the pass/fail/flake status is.  And the expectation files can
> also be updated as we uprev the igt version being used in CI.
>=20
> I could be biased by how CI has been deployed (IMHO, successfully) in
> mesa.. my experience there doesn't make me see any value in a
> "mustpass" list.  But does make me see value in automating and
> tracking status.  Obviously we want all the tests to pass, but getting
> there is going to be a process.  Tracking that progress is the thing
> that is useful now.

Yeah, I understand where you're coming from, and for CI I agree that
your approach looks like the best one.

It's not what I'm trying to address though.

My issue is that, even though I have a bunch of KMS experience by now,
every time I need to use IGT, I have exactly zero idea what test I
need to run to check that a given driver behaves decently.

I have no idea which tests I should run, which tests are supposed to be
working but can't really because of some intel-specific behavior, which
tests are skipped but shouldn't, which tests are broken but should be,
etc.

I don't want to have a nice table with everything green because there
was no regression, I want to see which bugs I haven't found out are
still lingering in my driver. I've been chasing bugs too many times
where it turned out that there was a test for that in IGT somewhere,
hidden in a 70k tests haystack with zero documentation.

So, yeah, I get what you're saying, it makes sense, and please go
forward with drm/ci. I still think we need to find a beginning of a
solution for the issue I'm talking about.

Maxime
