Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1515561EF09
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 10:31:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21AB810E29C;
	Mon,  7 Nov 2022 09:31:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C39C10E29C;
 Mon,  7 Nov 2022 09:31:03 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id A714A2B05635;
 Mon,  7 Nov 2022 04:31:00 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 07 Nov 2022 04:31:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1667813460; x=
 1667820660; bh=s5Ta0jpI0BDmWXOPxpu4p2JtuPRK2eDPKDa3TUCk34I=; b=W
 /smNIsdAvGeNZkse5tf59Sns9mhqAlTnZ+IHIJnAuPpiGEv/b8U3BtZyml8JDr00
 mtIO4AtP0Ac86ARgHSz0AZDW4fY0Pl5axxFgkd/0To/x0SCrn9HJb8MW82rhJit+
 9aMHHaY0CdA75LWsjf/URGX3FkZXw2ro+yK649SQJQmCn6xxTjLJJ9SBXtzyDRmw
 toPWv53678Tp+7niVGdIq5trlJQVoSDJ51URAxpjYtUutSmmoskGVYF4nSNafYRd
 SPdXL9D9g3/2DRP6KhFudnE6hp9ernszr+CbvbYspwNYP8S1kTYvJe8DQlfElOF2
 5AcoBPkxHDrlXqgGK8DyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1667813460; x=
 1667820660; bh=s5Ta0jpI0BDmWXOPxpu4p2JtuPRK2eDPKDa3TUCk34I=; b=P
 2uPBK7fnJSkcodIFC2Yus1+M3PQJSKA7vb3nvw4DjHk1nEpI7BlRWRZoiqUcWFct
 CJOtxOnxfYfVlQ0lOGXbU7ggAwKTljf4QekfRs5VlZgKJj4BQYCyNnN5ZIKF8VSz
 XQEsuVbKQBkiFhpYDGFiwPUr5xfjy28I/OfeG8AM4ibjAmojpJY2okoWET1ijO3+
 iIo+XekPje+KJgThfo9kX/J9bVKCiD8xd5ysyIGRrlSRl1m/sZQXnP9Z//7NF72t
 BYKAq9XK5GRnYIq7s8KjDB0BIU26QC8wUWJm3cQM21M4zLPKKvbKgBILTvueV0h4
 0ybR9jRn5hRfL+CHZ8iPw==
X-ME-Sender: <xms:U9BoY0xoR8Cxp1VhDWekk8TJ9xTmhc6V0B76uVbivSsQ7VM9sXY9rA>
 <xme:U9BoY4TMIVz4qFfr49Bl-nrGvrVRKu_3Fj6im5Xm3HYOysgvt2KTSXp0LqKlaDMeY
 5L6Lkol4h4RHQ6lSUg>
X-ME-Received: <xmr:U9BoY2UEM5EnS0ZRhZ4QqtkKuOg40gpnwHrOxVNjgbLH_CC4bKb4ly7kdNOGRgkj3NqbwUJBKYsRO7T-Wd0N0kwHdaSV72ztjN5YdA9wiTn5Rw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdekgddtgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetgfelgefggeekkefggfeludeiudffjeffgeevveekjedukedtudeuteef
 teefgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:U9BoYygJq5AN9b3p2ZKil3FrOLTnc6QzTlzWcmpWZTZabFu-nsS4Bw>
 <xmx:U9BoY2CaMKAW4BWO6oFnfHwuv7KwIuTY2WzV4cGJFxO_u_weql1tcw>
 <xmx:U9BoYzKXyvBElukBkH7EdmM9rOqePVOGUa-Rc9ZDMU73T5l9nxBSRA>
 <xmx:VNBoYwz9dDL3ZaFnIjuYAnpcvLiSSNRv7zxjcJ_VwXGXWG6F5bDE3J7H2x4>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Nov 2022 04:30:58 -0500 (EST)
Date: Mon, 7 Nov 2022 10:30:57 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: Must-Pass Test Suite for KMS drivers
Message-ID: <20221107093057.5w7kdc3pjq77upng@houat>
References: <20221024124323.tfyxcadyd4nz56jz@houat>
 <f3341ef6-4634-39e4-9bbc-e49e0aa806ee@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <f3341ef6-4634-39e4-9bbc-e49e0aa806ee@suse.de>
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
 Arkadiusz Hiler <arek@hiler.eu>, Daniel Vetter <daniel.vetter@intel.com>,
 Phil Elwell <phil@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Fri, Oct 28, 2022 at 09:31:38AM +0200, Thomas Zimmermann wrote:
> Am 24.10.22 um 14:43 schrieb maxime@cerno.tech:
> > I've discussing the idea for the past year to add an IGT test suite that
> > all well-behaved KMS drivers must pass.
> >=20
> > The main idea behind it comes from v4l2-compliance and cec-compliance,
> > that are being used to validate that the drivers are sane.
> >=20
> > We should probably start building up the test list, and eventually
> > mandate that all tests pass for all the new KMS drivers we would merge
> > in the kernel, and be run by KCi or similar.
> >=20
> > I did a first pass to create a draft of such a test-suite, which would
> > contain:
> >=20
> > igt@core_auth@basic-auth
> > igt@core_auth@getclient-master-drop
> > igt@core_auth@getclient-simple
> > igt@core_auth@many-magics
> > igt@core_getclient
> > igt@core_getstats
> > igt@core_getversion
> > igt@core_hotunplug@hotrebind-lateclose
> > igt@core_hotunplug@hotunbind-rebind
> > igt@core_hotunplug@unbind-rebind
> > igt@core_setmaster
> > igt@core_setmaster_vs_auth
> > igt@device_reset@unbind-reset-rebind
> > igt@drm_read
> > igt@dumb_buffer
> > igt@fbdev
>=20
> Maybe we make this test optional? At least sprd decided to not support fb=
dev
> at all.

I'm not sure we need to make that test optional, or at least, we should
run it all the time, but skip it if there's no fbdev emulation, and not
report it as a failure?

Maxime
