Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C47B4C13A3
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 14:12:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E74E10F35E;
	Wed, 23 Feb 2022 13:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A57E10F35E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 13:12:51 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 194A65C0036;
 Wed, 23 Feb 2022 08:12:48 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 23 Feb 2022 08:12:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=nbgbG/c43K1vzy
 jrVPdH2+bpUpw6Ekf8Lp1o096sJzo=; b=gNbXqYdtZInaxcnmKl5lnGMvW6dR9v
 ed856wrebzkNpp/APrreEnbOHqLI/kaouzEn/DC3ajr5Cx3B1IjcHpZ7xudgWlXn
 niuOadl98JdwufMEBMIVvK9khhAuOm1uwwLpDbdEYYP3gwpRj88ZHK24wsg660gd
 OskqpshjmwQda+ly9OMrZDv8L2YbNIb8zQLdQD4KktMFsE7aDM9jrZv/JywXYYlD
 aC5xHIrJ1KHI7lsvwe1sbI7urtn6HZlz27SUELhxqxMd4Q2KtkFCfK4u2KjFpWpH
 VS9GCY2g288wfJKA3q2hqCfIrfbbiRd0mjB1XWogWevBGVvoTurBbwbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=nbgbG/c43K1vzyjrVPdH2+bpUpw6Ekf8Lp1o096sJ
 zo=; b=b8gq2zKr8LRGyYyqj+ZJeeHLh0U089u/O91pXm4VMHAhtHHXJOEopB7zF
 c0bf0du7MpSG7yB1x95qBmgQN7Sm6BfLz+eQSVdu6qJjBPf+qyVBAi5lY0E97RNf
 pUsyWkPjJAjGhASt7XuJw3KbZcR3ISPMrCvJw/Fh2/ANre6II5IpDInBNVlqqk7f
 kgTPNBplKpDvUmBH3fniKysuf2oZnG3EIGGB6F5PNl8AergEtOpzUmDsXam10JMH
 px/ymaeLpEsTBlKZ2jON3vkVodkmGe37cP3YTZsLqL9Jwsq2MxCDFLxB43KdOe5z
 lAvqEhSTl+lDFhP/BdBhAQB7W+dTQ==
X-ME-Sender: <xms:zzIWYlP4ddmJduXsjzrs3IPUlVWYGJX4jvtcvxguFG-lM42pNs5DTg>
 <xme:zzIWYn9pz8L-xNutHvLX2pGXpdHhHy4n73ocjz57TiiU17Zp636pz2hRbGVPb0ODR
 AK3tBkE9ZOaYnl4bI4>
X-ME-Received: <xmr:zzIWYkRdjKX8SNPPnNCBZ3fPPU-AXhPugE5WnCD8ujN2q5CIJYHUWZZf2XPH5sUgHETtxaFp90Co2j8PYL56zKH-23D_tPNLjGzjsJg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrledtgdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:zzIWYhs6ItCA4mBJLxyh9oVje6WHo-rcJqdlz6VPiN8GAcp8XMMKtQ>
 <xmx:zzIWYtfD7pXs01IfqzFs1NbOyRoYYbXXdD0_YfrDh-5RbZ18h1VbGA>
 <xmx:zzIWYt0ot9c7bO1MT_a7-FQaJitgHQ0iMpkRN1nPuI1955oxzxV09A>
 <xmx:0DIWYk6Jh9oEC3_t6v_ojmlXEMynFit-0qScXCRQZ4CVFP-7bFeAFQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Feb 2022 08:12:46 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <maxime@cerno.tech>
Subject: Re: (subset) [PATCH] drm/edid: Always set RGB444
Date: Wed, 23 Feb 2022 14:12:43 +0100
Message-Id: <164562195772.1149979.17866222274266945563.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220203115416.1137308-1-maxime@cerno.tech>
References: <20220203115416.1137308-1-maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Matthias Reichl <hias@horus.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 3 Feb 2022 12:54:16 +0100, Maxime Ripard wrote:
> In order to fill the drm_display_info structure each time an EDID is
> read, the code currently will call drm_add_display_info with the parsed
> EDID.
> 
> drm_add_display_info will then call drm_reset_display_info to reset all
> the fields to 0, and then set them to the proper value depending on the
> EDID.
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
