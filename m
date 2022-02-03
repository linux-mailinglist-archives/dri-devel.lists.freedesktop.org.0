Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7CB4A873B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 16:06:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 794FF10EFF7;
	Thu,  3 Feb 2022 15:06:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B90A810EFF7
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 15:06:48 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1F6065C0189;
 Thu,  3 Feb 2022 10:06:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 03 Feb 2022 10:06:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=fxVG53M8x78Icg
 mPy/rgcjNx6ywCVfChsecjDc0TO1E=; b=oTbA75ck+yMXKd8H30SkzqR2052Wys
 FG822UvkYNWyaLJ9YZFH3J5/3mNs++6I6KXB7pCJoaSq1c85LmIs5FfIluO/WYy8
 KO5eqXz3YJ5uyXcbm0Zrj9fAbLHF490ZC0pnj+E6qkaul1GcutBRGyv+IBRl8viz
 MvwUyNq7EgN6u01rO8DvwRthmzsdN3vt6y56aKGj1wHzJnUB69XVfN385VoczWA6
 oTOqy+xPb4OiHktlp0YjRunPYpeqfKsj1TK+4Rj57CB94aEZmynKVy4kXRMPgl4s
 U1JgoqLCslktXmPYOtubwvuR/H/i3Wcwj1CzArVypUVPa9iNZ3KHJJvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=fxVG53M8x78IcgmPy/rgcjNx6ywCVfChsecjDc0TO
 1E=; b=kBkMXcN3AU3SrC2/GIR+yBO0cehKcOtJsfHYxL3Aqzo7i2PA1QZa14KLX
 JSalB2MeMMkEMibZ3/o5+rqeQtod2a+DdWfJXv1cUWPYNq4cvJHRN5kjbIFLXhyo
 hZr4qmEMtYdheq15+gd/c4QRXseqFL7FUdAruwQkE5yIi8Z/xiA9KVKAZoCOMYg3
 SCudJLFKi/LGX+t+3pC9FsWNKgGGibnLtSz2/Va8aWPdblYnnckgMCXkdePVWHSi
 +4l6wELyZoCJIb2JRQ9Tt6ufxlU/jwZX5lbQakzq3hz6dXjnvu5Kf6pO06/AQr/4
 LY+sKaousgL3xz5crhVyCWKlSC5hw==
X-ME-Sender: <xms:hu_7Ybgid0CddEq4_n37d9NZfo7mV0cUs7q4-sGNSfFlOt5rIXXpzA>
 <xme:hu_7YYA0gVWTjsrxc78Y25v5opcoOYCakahpocqgH3OfbapTB1emJGFbv93Ec56wl
 WJAFxzgMFPZs60Vipw>
X-ME-Received: <xmr:hu_7YbGyjtoknwolPYJT7mwKxOniMVo6ZkEWbq2WhrxnB6249A5SABB7brNg_33VpiXDSU-ca-ojSOTYFZm_cYR3p7l130-DHh2sxYI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeejgdejtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:h-_7YYSHXMEyG8BF-wOL3ghVTbKvIG5rGyF5dssrcRtKltek1YDMow>
 <xmx:h-_7YYwPGhhhXSjDzkTNaC1qVqg_HK1LK3Fo4GNivsw-OuoXMjb9vg>
 <xmx:h-_7Ye4CB-sd0RFWzRo2iyCuOarWFAxHHWJi2CVG9gEUsAC2rcUPaQ>
 <xmx:iO_7YXmpgytaxbdaWAyGC5Fy00yHgdaBRHyD7ydQlndkPQI62tD-VA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Feb 2022 10:06:46 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: (subset) [PATCH] drm/vc4: hdmi: Unregister codec device on unbind
Date: Thu,  3 Feb 2022 16:06:37 +0100
Message-Id: <164390079045.1265461.8351141389178744305.b4-ty@cerno.tech>
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
