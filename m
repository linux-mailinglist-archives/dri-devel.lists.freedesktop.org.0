Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 555684BA606
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 17:34:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E8010EAC9;
	Thu, 17 Feb 2022 16:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87CE910EAC9
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 16:34:32 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 62C3B3201F5F;
 Thu, 17 Feb 2022 11:34:31 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 17 Feb 2022 11:34:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=fxVG53M8x78Icg
 mPy/rgcjNx6ywCVfChsecjDc0TO1E=; b=P8p7Y83t/TVMyhzPvqG4m9NtXpU58E
 k6JeMWrsjistVeBtgEfKFwJ+nD4G5omNOexQMmKrJ1lUauTuvY+GRNGpT70bXtjF
 mRJrh8RAnTW6HPul0Hzj8eaXK/8b5EJUKWQmJEnYY1PxEktZjXYH767ZuOAVZocM
 w1LxAT4tIf2vqkmdP/ogxMw6qVfkN89lFMCow4kfdCyvfaXGNd1PZbCOjBRiUXna
 NxZH4ioGKoWAHpiIxVvVVdvl0gSmzktRsKn6z2L7fpLphj5bBlu1ESu2c81bWxdW
 nD964EtDdR0DHLYbScIsxrcb2mogf+9443F5nk1GHU5NGJbELpbB/lyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=fxVG53M8x78IcgmPy/rgcjNx6ywCVfChsecjDc0TO
 1E=; b=i9mJLRPX5RICQonYO/7ECiW0oUT9VzONzQkVfB3nXbui7vOs3wF5/edyu
 lkPnQ1pOtZsu0y4+BfXR8KEUb7zIw83Iklv6MODM4zsBNrKWmS37XRUgpXoJBCw2
 TiZj4TRQ5Gc5t7/K9KqBrwyakb7cEmJ2CrjAPQD/q/VxYNO00JEMePNwHCZo/DEs
 o99iLzgsJFj2X5FEujB+27XkNDMfaWjsfrGTCh2mr6YZLzV4vwt1KB9o5uulPMIY
 B/WKxYiLuhUOiGv3IMECjw8n47wDa21RkJ0iHf5YPLd4GeQdPTws97yqIiV27YmH
 N12uuYBZNqJTDje4bO8my2abVmuHg==
X-ME-Sender: <xms:FnkOYlaDull67H_DuPtaWmNqxlgwo4kruFMCB_tbhKUFQewGvuAuPw>
 <xme:FnkOYsZLp7WdHv9fUp562-CrXLqdtCCfP4LOYU8ZXX5OJeJSdrJskewhVd4iCeYyt
 guMbR3e14mldtQ1N8Q>
X-ME-Received: <xmr:FnkOYn9_NyxsdsQg7iEcMxQkPod5FphQ8dMzfmRbPYnJhnAn9yHjilpJj8IK8Gbh6-GqXsgV2bwysfPg3PCfHKMPStVXiTnJJV_lPsM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjeekgdeklecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:FnkOYjrPJKAjwWJLGzAai5UUphKMIQxoXrfdR_I9kgHEFNxkIEzVUw>
 <xmx:FnkOYgocltMb2Q3sVs5e8zLC8mwuyFTYqBJYtgQ5xslnys4JMCQhUw>
 <xmx:FnkOYpSIOfpsWOWLpLxxcToR_l7JP92Bwj9kYioxm9I7u4gcUuuAjQ>
 <xmx:FnkOYsdFUUbr0iFa1bOCsdTtYuFCpIMsmK-L0qpN4LiT0GbIPgPfzg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Feb 2022 11:34:30 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime@cerno.tech>, David Airlie <airlied@linux.ie>
Subject: Re: (subset) [PATCH] drm/vc4: hdmi: Unregister codec device on unbind
Date: Thu, 17 Feb 2022 17:34:23 +0100
Message-Id: <164511565828.1144757.13322962669495269972.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220127111452.222002-1-maxime@cerno.tech>
References: <20220127111452.222002-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org, Dom Cobley <dom@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 27 Jan 2022 12:14:52 +0100, Maxime Ripard wrote:
> On bind we will register the HDMI codec device but we don't unregister
> it on unbind, leading to a device leakage. Unregister our device at
> unbind.
> 
> 

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
