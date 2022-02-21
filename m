Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B98834BD9FA
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 14:42:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2C5E10E317;
	Mon, 21 Feb 2022 13:42:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AACC410E318
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 13:42:03 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 560EE5C01D3;
 Mon, 21 Feb 2022 08:41:59 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 21 Feb 2022 08:41:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=dLzsGayzjfkfyVIzN8e6IoxbZTdXhaq4Y9NHq7
 1dDww=; b=TnVTTzghlUVs3QN2jSsUaEv74a0Tixlq+bJ1FuR/Dep8eTB6LqnHmC
 KM4aKdNuHJ7gA/sFuXIzX/CAJg03FSWpNQSq7B+3qKK1FzwPkAGScbYNoUqwx1Lt
 k2m8DwpH5RpW8TQtxdNxnHX+9g3iQ00jXSHZ8KQYEnL99gKverOuxmjuiEOB/KM4
 kMdxbfTLiRwOrS56eFIB5njhyRa39BQwPZC7yGKEMWIURnMOxwPc77PE1uU51Ecy
 c8Oq5NA0nPpychmjLFOLSrMDik2lo2G7V9U2hTQMDVhpJMOpK46BjGAaByJh20gP
 ic7CsurnkCRVFkS/OwWiIw0RXJKBObvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=dLzsGa
 yzjfkfyVIzN8e6IoxbZTdXhaq4Y9NHq71dDww=; b=gWj60AnUn5d96ngXY4lQDt
 pcmGIetsPANND7IfwPnB7/5vXfZxs5sKGqx5iNtiPjZa6TSS/GEQw0rEdNGckMlT
 +fcFZxA8BgMOzCtC9x3dbGFYXysMMUMRUCFfTXAmkwm9jim5JAM52tuy3ia7uLow
 hPBeEmvPuEQGZih/x5fw+s602DExrW5GWmFDyMF+e9jMGi3tZz6x2QkYADqUAuAd
 z5cORZhFz89+AVV5V288tk6IYFgzDz5aH9VtutWU2jOgVsRkeV5+mkhCb+UHwZgG
 hiaK+NwGbFE42An0GfuG2z2jSVbUB5ao+yGTg9cLIdmh3hJzL4l+DXCKTk8YjVkg
 ==
X-ME-Sender: <xms:ppYTYj4Fn4GNptJcseYx267FszB249yErsLsqgQPfHprSYTOTmqxzg>
 <xme:ppYTYo4LifBGOBJ1IhjrIlm8g8QSNTV7BwOkRCnz5L7UJ1MX8MCGUVDe7wOIi_2y3
 yQbsulWeOnJx9F9148>
X-ME-Received: <xmr:ppYTYqfXA03rrs5UIH-1CsMZJD87fBwo-7PoPlOOdR7MmOltzAdOiCtRMxgW_Ia_-9B3oLEuSpgFkwg7DhFQ3r6HW8ajysVkvZKYcsE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeeigdehfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepteeikefgffekgeekledtheduteetjefgkeeuvefhhfetgedugfektdeugeffgfef
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgi
 himhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ppYTYkJIOiPy0Zbq0dq2He-Sl3DCRAQDmEjs9m7cfEDhi7xDOG3z-Q>
 <xmx:ppYTYnLU13H0JCqq608Dnu9yb0PhWXIMy23b3SRYE4rNuduntF9EHQ>
 <xmx:ppYTYtx8wpd28ussjmX_kZsLf-402TYvgc1S_JSxuy_qY6OUgUcbNg>
 <xmx:p5YTYu_3AyX-I12VtxX-hbR-YOn9HT3EUjI-9DHp_hoN1LClXtKaXw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 08:41:57 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH 0/8] drm/vc4: Fix frame corruption when moving the cursor
Date: Mon, 21 Feb 2022 14:41:47 +0100
Message-Id: <20220221134155.125447-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,=0D
=0D
This series fixes a long standing issue with the VC4 driver when one was=0D
moving the cursor on X11 along the edges of the monitor, if we had=0D
overscan margins enabled.=0D
=0D
The details are in the commit log of the last patch, but the main reason=0D
was that moving along the edges with the overscan margins enabled=0D
triggers a full blown commit, as opposed to an async commit. Since that=0D
commit is on the cursor plane, it's treated as a legacy cursor update,=0D
and won't wait for vblank, so it's possible to queue multiple commit=0D
between vblank.=0D
=0D
Now, the composition happens in the HVS, and the HVS has a series of=0D
descriptors stored in an internal RAM, one for each plane. Allocations=0D
in that RAM are tied to the CRTC state, and freed when that state is=0D
destroyed. That internal RAM is also used by the HVS to store some=0D
internal context while it's generating a frame.=0D
=0D
If we get multiple commits between vblanks, chances are that the RAM=0D
entries used by one of the first commit is going to be freed and reused=0D
by a later commit, which will then overwrite the content of the earlier=0D
entries, erasing the context in the process and corrupting the frame.=0D
=0D
We've tested multiple solutions, but the one that seem to work without=0D
any cons is to defer the deallocation of RAM entries to the next vblank=0D
after the CRTC state has been freed.=0D
=0D
Let me know what you think,=0D
Maxime=0D
=0D
Maxime Ripard (8):=0D
  drm/vc4: kms: Take old state core clock rate into account=0D
  drm/vc4: hvs: Fix frame count register readout=0D
  drm/vc4: hvs: Store channel in variable=0D
  drm/vc4: hvs: Remove dlist setup duplication=0D
  drm/vc4: hvs: Move the dlist setup to its own function=0D
  drm/vc4: hvs: Ignore atomic_flush if we're disabled=0D
  drm/vc4: hvs: Use pointer to HVS in HVS_READ and HVS_WRITE macros=0D
  drm/vc4: hvs: Defer dlist slots deallocation=0D
=0D
 drivers/gpu/drm/vc4/vc4_crtc.c |  24 +--=0D
 drivers/gpu/drm/vc4/vc4_drv.h  |  30 +++-=0D
 drivers/gpu/drm/vc4/vc4_hvs.c  | 309 ++++++++++++++++++++++++++-------=0D
 drivers/gpu/drm/vc4/vc4_kms.c  |  10 +-=0D
 drivers/gpu/drm/vc4/vc4_regs.h |  13 +-=0D
 5 files changed, 299 insertions(+), 87 deletions(-)=0D
=0D
-- =0D
2.35.1=0D
=0D
