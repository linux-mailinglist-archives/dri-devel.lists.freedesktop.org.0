Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB184E63A2
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 13:49:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB4210E968;
	Thu, 24 Mar 2022 12:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC9F10E964
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 12:49:07 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id DE8F032009F3;
 Thu, 24 Mar 2022 08:49:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 24 Mar 2022 08:49:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; bh=vpgfnZwA9u1I8a
 +3FjlbRyQBDCa2x3IAHHPysPfq9Vk=; b=sLaJhMSLjCYRReNusBc4js4BHwjVY+
 /b5AT5FuY4KzsedjbcDnwYdXQ/1ydFZXSVx+HVps3Se895b+MrZ6ga5kYVibHZEO
 i4K8bb0QcztA00mzg+wB3flFWOa4+l0SIzWXy6yW1O8y6SuCShZ5D57+Rgk6iRDW
 f0TWJd9zR+xpUJxs13+0NfqO03LCYngSpRXqerliiwLFGbNxKyPaaMV5/ZRnmK0h
 CxYVCw5RAO7U5lkSpJ3EXkUCv6++W0TVNW7DchOjn23aNaLEaNHhtJi0bQEdEdRa
 g2YacaZFfuOinHQMwsqpaWPCbZedunrFpFj/XMUUHFh6ComAYYK5mCyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=vpgfnZwA9u1I8a+3FjlbRyQBDCa2x3IAHHPysPfq9
 Vk=; b=ky/MH9H7w7SV4eO0RNMc477d+81CiabJK4e8Zg9UtLT3M1n/fFRJZaMgi
 unO0k+LFjRl+ptktp9jC7p29PuUhOK/NotKgSfhT1Uc8fABrAqZ7QuhZiqbpBirw
 ROb8KpCg+PMg6hlyQBETRj224eMBsvrrif7WgXdS9Rp/Z8zoRrML84JHlQDzxZiu
 mqwqWsgtJXVPEffy58QKqZ3XCk33d1ecqdHNWm8a1n38mzuWEFs4TxWy8LpjWZKb
 fMI3XrILEy6ljhA42os5FF9qeIztAyViOnSXlX/jcndKg2/Kq0Q6qNz9yPRTIHgx
 Rsz1MYwcjmZP3o/rff7G5G+wZJ5fg==
X-ME-Sender: <xms:v2g8YuPnqytgc5N7rKX50_khGcXdCoekUljrwjk6X24HoAH-V4wvgg>
 <xme:v2g8Ys_JwfFPTiRO2YON7IVdXulTVn-xkZDG-ojjMjGtufrLgHTMxlT3j6VH0cgi4
 JnibwlTSpU8WgN7C6M>
X-ME-Received: <xmr:v2g8YlQ_B48ayXC1nVp3JO4xRl-ZpW1UmZ_aLY9aUbHjaoVGR4oqK7Gby-NIXFS8cmdzeonUll9ljbh_W9xsuGORVjVyQqdwLD67BMA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudegledggeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelteejleefvdejffetjeehfffhtdeugeffleejfeekffelteektefgveet
 vdekjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:v2g8YuvaTufLTZuhg5PZ7-7tVcdtjEtqyuUP8GwCWiKd5Wa4P1W2wg>
 <xmx:v2g8YmccKiypswK8LRZolvqoDP7jqfuEwH69iULYhcCqeG0GYGZatw>
 <xmx:v2g8Yi0-TaWt4VFCWsdanOYnb4j_XGnFbKKEwxrctQViQA6-lc2AYA>
 <xmx:wGg8Ym6MTMhmQN-te8neAle4RQ5_HkFLbUIV7qoZmsXwFPe1USBxTA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Mar 2022 08:49:02 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: [PATCH v6 0/7] drm/vc4: hdmi: Yet Another Approach to HDMI YUV
 output
Date: Thu, 24 Mar 2022 13:48:59 +0100
Message-Id: <164812613018.1175549.5443959253858996678.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222164042.403112-1-maxime@cerno.tech>
References: <20220222164042.403112-1-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Werner Sembach <wse@tuxedocomputers.com>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 22 Feb 2022 17:40:35 +0100, Maxime Ripard wrote:
> This is another attempt at supporting the HDMI YUV output in the vc4 HDMI
> driver.
> 
> This is a follow-up of
> https://lore.kernel.org/dri-devel/20210317154352.732095-1-maxime@cerno.tech/
> 
> And the discussions that occured recently on the mailing lists and IRC about
> this.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
