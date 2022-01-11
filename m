Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A288048ADF6
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 13:55:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C03B10E1A7;
	Tue, 11 Jan 2022 12:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 255A110E1A7
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 12:55:07 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 230652B000AE;
 Tue, 11 Jan 2022 07:55:03 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 11 Jan 2022 07:55:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
 lxwd64f4TfoXS+vU2lIabO5GPFm0LWcub4CmBhQ5J9Q=; b=dhqt+xCgcI1VhkH9
 A6q56F5dCb8vLH7onI7WMTdmqTXrvZC9jtAV+MvID3QfUOPlsU3TBpfEY/WB0YD1
 ofp8Qi1F9YD9/ZMEypCZjzCEpciOcodHS8rxzdn8Wh9VPxR8yDTFaxoMV3cOMQaA
 8mStGn3A+tXjHEp/yKL+lOF3rZJYw0TLI8PcD08iS7b6Bhq6X4Lp3a/On2vNoQZS
 1MZx+n5TI3f2hdr3GSB7YThe6hoB18Np0QBaa12/pB8ofE4cxdHcQgq6ORP/VCkb
 l2e5y/uGT/M3Cubeyw8LxNp1/gT1b9x1p42QU8FeN+ZfL+Su1EThPrsXlCaEx2NX
 VkRVHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=lxwd64f4TfoXS+vU2lIabO5GPFm0LWcub4CmBhQ5J
 9Q=; b=eDWUc2Jdo0JotyL0gp2SVTNWp/CvmUfZYcbWXsncJ34EzYq2Mua38jkw8
 p9ez0RPOcUFHgxPt1YT5cHSVmORyixLg5/voi8LuQGX/vegWWrHZF0qRYPFMPJdl
 BThJfQccJle82tJR9ia97CYu2hZDieSyQTqcsl9BH2V7QnQZBU473Qeb/yxuxdhz
 H0ITiIvPDQcRyPfUlHpB2Ti4SKF7D4gLMCKLsn3tNR/0y5up48x6NE9tX9kMW3cY
 xeIJvEmiHY4YwkVX78acihkDglwuvUVQvWwRaqqTp3+HqETS9+8WEdVqQzNkkpO3
 9orr8bW16qdNnYUAI/wnfLPs+iHGw==
X-ME-Sender: <xms:JH7dYXEOLpS4IJFzc8lDDJA6N9gARmG6KpEbnQPFGwHZzWLP_szF5Q>
 <xme:JH7dYUXItw6pEvFBRtoNVGpCl2Tjw0zjUpSGwfupZ-WUQCl54IBd3NhXbGaXMJBUk
 cSn-4SFCjZ-83OTQxs>
X-ME-Received: <xmr:JH7dYZKbKs_Jh7FUy1BUsJ3bNUkM2btuS9Sjvjpim8csUYR6feQb9rdk_vK8cdPbDDQISa8hCp0VxsMv8rrvhuruB1c12kUydhq18FI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudehfedggeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejuefggeekfffgueevtddvudffhfejffejjedvvdduudethefhfefhfeeg
 ieekkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:JH7dYVHVZMg-Gw0rxT3zHL0AL_P9m1CVzpwt0ih5nGzKtrTnv0rboQ>
 <xmx:JH7dYdVdhQteotLLdOe0tCWBEVt7y_JX4e2BO4-B1JvnNAa78weqkw>
 <xmx:JH7dYQPuWHFGj2xj2BvytDqZ9XtLV3QwOYi0t8Jbn0kjmoxch7TtaA>
 <xmx:JX7dYUNqh_oxkw-6hgWG4bI_FFL8UVvWC6Se0U48CYw-yOM_OxXgpZIf6Aw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Jan 2022 07:55:00 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Ray Jui <rjui@broadcom.com>, Frank Rowand <frowand.list@gmail.com>,
 Scott Branden <sbranden@broadcom.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH RESEND v4 v5 0/4] drm/vc4: Use the firmware to stop the
 display pipeline
Date: Tue, 11 Jan 2022 13:54:56 +0100
Message-Id: <164190568949.817599.3855426533627905672.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211215095117.176435-1-maxime@cerno.tech>
References: <20211215095117.176435-1-maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Dec 2021 10:51:13 +0100, Maxime Ripard wrote:
> The VC4 driver has had limited support to disable the HDMI controllers and
> pixelvalves at boot if the firmware has enabled them.
> 
> However, this proved to be limited, and a bit unreliable so a new firmware
> command has been introduced some time ago to make it free all its resources and
> disable any display output it might have enabled.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
