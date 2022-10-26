Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAAD60DCE6
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 10:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43D310E232;
	Wed, 26 Oct 2022 08:17:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E40410E232
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 08:17:22 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 7FB0C2B066EF;
 Wed, 26 Oct 2022 04:17:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 26 Oct 2022 04:17:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666772236; x=
 1666779436; bh=HMXaYk/FEmnt44CMk9KX2cUBawvLNv9shtVssIskMYE=; b=Q
 D522Bw+hFx+JpbJ66QSJifWJQLQAtX9TTXPxPyTXXybYysGBHOfSzHLG6WQmyZ0v
 kU+N28GqTk/WboUbdshF9FwymETIQ4A4COZlaf0ZBGdeIlW9PW4sCaDfCw+qaQvk
 yInEXQPRX68fQeR199rBV5dWDJfj6K3a6RcTe/xFhdbb2UeWLf8KpvD16nmHoZiV
 Vai9A093rQUIuTe14kzXNg78LCL2G3IeelhVDjSq25V/EPGI+wmqqjjZY5ugSe/c
 JIfhKPAGnk5ThS5M+xC7SsIOMUEtMHe66DekXipfZpPypq0VThRvsalh308aRkgM
 RxSm+/Kec8dyRBFk6C0Yw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666772236; x=
 1666779436; bh=HMXaYk/FEmnt44CMk9KX2cUBawvLNv9shtVssIskMYE=; b=L
 OF/2Q1WNks4ak/mZNkS9cxULqF6AZIEpkqB6/QyGWDY6DeJ5PiRo7+QHS211zBaR
 2o8MzZo4PIZB1sEPeeagupFvPnFB//PlYpdXu1AuRfnQ6HFeha0742Loo7qxJdnN
 P4uYTD3I0Xk2+EdYuw6TJeA1oAtfFUGbKRPDkcRQ+wpPO6sH4bEVXHwJgs6AuHIs
 gwRg7w3QHae7SA8Wh7YP0YyvmYZ9DHxuJI7ZQQUBCbA3BRGUUwLlE3+9HDZjK42/
 +teHVHDpo3/NqI4SDWs+pZHpBcJLNwFdDFafeZR+KOLzv98y/BhDS1Sq/jtS6rSh
 7mtA+pR/6L1pAYoYSiqVA==
X-ME-Sender: <xms:Cu1YY1JnPpzjKi-cFl6LtT1sRZmwhBJKM4KN_QrNk1ksRVV2TJkNnw>
 <xme:Cu1YYxLG8zqdk1qIZ9MZ5Pj-rbGhmYf2RQ2BeNWNnzEZriGf7q0F4y9dZWAOcBnwT
 NC4VzLtp2YRoq-OsLQ>
X-ME-Received: <xmr:Cu1YY9vZt0lAHF8BIdmYUOw7Vg0zfOHAk5wgUGb1CmoWQm9BcofnSYzzukhhuVhVNzY2aRpaJvBmYcfO7PG2ChBEHBkDzGj6R0PbbOPWut_OIQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtddvgddtvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffvvefukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepmhgrgihi
 mhgvsegtvghrnhhordhtvggthhenucggtffrrghtthgvrhhnpeffgfeffeetieeigfegtd
 ekffetudeijefhveehhedtudekudevudeiffejheeljeenucffohhmrghinhepfhhrvggv
 uggvshhkthhophdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Cu1YY2bwyZX3iBRcXLus6DNXThqCgGHJsPapTyb0VbZd3oDOOmIgxA>
 <xmx:Cu1YY8bDQoN5vzSFqjw3matWBQqHkP5bQW7v8aXTQDEVbF9JwMCo0g>
 <xmx:Cu1YY6Dbv47Be387AzWFXO9zeM9P-i4E9BDTPPq7nzUjNkasMFgv4g>
 <xmx:DO1YY3uCrWfOzRGIaX5VF6EnMSkYL2A8COkrmmeoYNsb4pKYPRBKQynwIJM>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Oct 2022 04:17:14 -0400 (EDT)
From: maxime@cerno.tech
Date: Wed, 26 Oct 2022 10:17:11 +0200
To: Rob Clark <robdclark@gmail.com>
Subject: Re: Must-Pass Test Suite for KMS drivers
Message-ID: <20221026081711.zj7h2rpfd4kfkpqe@houat>
References: <20221024124323.tfyxcadyd4nz56jz@houat>
 <CAF6AEGuokyL+_ZsWeeMeyCcyErapka0ALZQ60bdWKvja3gcN9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAF6AEGuokyL+_ZsWeeMeyCcyErapka0ALZQ60bdWKvja3gcN9Q@mail.gmail.com>
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
 David Airlie <airlied@linux.ie>, Martin Roukala <martin.roukala@mupuf.org>,
 dri-devel@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 Arkadiusz Hiler <arek@hiler.eu>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On Mon, Oct 24, 2022 at 08:48:15AM -0700, Rob Clark wrote:
> On Mon, Oct 24, 2022 at 5:43 AM <maxime@cerno.tech> wrote:
> > I've discussing the idea for the past year to add an IGT test suite that
> > all well-behaved KMS drivers must pass.
> >
> > The main idea behind it comes from v4l2-compliance and cec-compliance,
> > that are being used to validate that the drivers are sane.
> >
> > We should probably start building up the test list, and eventually
> > mandate that all tests pass for all the new KMS drivers we would merge
> > in the kernel, and be run by KCi or similar.
>=20
> Let's get https://patchwork.freedesktop.org/patch/502641/ merged
> first, that already gives us a mechanism similar to what we use in
> mesa to track pass/fail/flake

I'm not sure it's a dependency per-se, and I believe both can (and
should) happen separately.

AFAIU, the CI patches are here to track which tests are supposed to be
working and which aren't so that we can track regressions.

The list I was talking about is here to identify issues in the first
place. All tests must pass, and if one fails it should be considered a
hard failure.

This would be eligible for CI only for drivers which have been known to
pass them all already, but we wouldn't need to track which ones can fail
or not, all of them must.

> Beyond that, I think some of the igt tests need to get more stable
> before we could consider a "mustpass" list.

I agree that IGT tests could get more stable on ARM platforms, but it's
also a chicken-and-egg issue. If no-one is using them regularly on ARM,
then they'll never get fixed.

> The kms_lease tests seem to fail on msm due to bad assumptions in the
> test about which CRTCs primary planes can attach to. The legacy-cursor
> crc tests seem a bit racy (there was a patch posted for that, not sure
> if it landed yet), etc.

And this is fine, we can merge that list without them, and if and when
they get stable, we'll add them later.

> The best thing to do is actually start running CI and tracking xfails
> and flakes ;-)

Again, I wouldn't oppose them.

The issue I'm trying to solve is that there's just no way to know, at
the moment:

  - When you're running IGT, which tests are relevant for your platform
    exactly.

  - If some of them fail, is it expected for them to fail or not. The
    ci/ patch you mentioned help for that a bit, but only for platforms
    where someone already did that work. When you want to do that work
    in the first place, it's extremely tedious and obscure.

  - And if some of them fail, is it something that I should actually fix
    or not.

The mustpass list addresses all those issues by providing a baseline.

Maxime
