Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E83D4A8735
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 16:06:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CBF110EFD7;
	Thu,  3 Feb 2022 15:06:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C0510EFD7
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 15:06:41 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 768715C019E;
 Thu,  3 Feb 2022 10:06:40 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 03 Feb 2022 10:06:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=iKW1b2tzBqDpaJ
 Iu0uGnuD4vtG2UBzqWfN+9LiVTmB8=; b=o9TdNR9jX0ZogLy++sCnvjSRMICqZv
 2kjU6VCptMudTCSSqQFPQnwqazfsMYyoQRJaf0mqwWYsJpym028UU6jS3spmSXvD
 NEw1N72VSBXbQhhV+q8JY7X+ghjQi4bJ7BAaq7UGarcvTgsx2wslO9elKQt6qq+u
 MpqCpfBtBnLhZvyVtL8i/fM0HfiS6b1UzO/sqdpKvLkUPIZR34Y/Vh3dgQR5CpYw
 WEo8yPQ16YlASojHkrgVi9pUuWQKjh6YlcEiyeWmhbP41OZ+GHr/xzHrVfa6GeVz
 a7QXo7eLTnauv5AgobPKNSMxyr+Lj8n899c+HD4mx8p4oANEkNMWQrQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=iKW1b2tzBqDpaJIu0uGnuD4vtG2UBzqWfN+9LiVTm
 B8=; b=jH3AIXEmpu94kyYfYlmSeNdFIViilJwh6cREQ5xyeB0E6VfjA85FycU/7
 GxmBAK1HcJnxTtOQRUpwGZ6YceUQRK86mwqMJQDG72yuMOZWvWGCx+SEBkkfwcX2
 EjNTnE+QTLVZJApjHsE5Dm5IDUV2d0jz6d3vvbPhJl26QgYLkHemM0/VHK5+pnqw
 M2/re3PXgvSh2Iy1Jdr1bxDdilfhLnYuRoh1vNrqhRK/r53mWiu9QxnaDUPHYTs1
 W4NaP0SRgNiBUqhJoyKfrnVxb8tnqDDr8CThW2lnHZniywfh0Bjys05pparoeVRL
 p/VZKKRCZ7TX2WBhBXcTs3bA76wAw==
X-ME-Sender: <xms:f-_7Yd0kGM3L6cy5Q9y5oljPBvv_6HNCwmw4RcSrmwO8heFDOvF9pQ>
 <xme:f-_7YUFcGO4zD83eR_KfIh1YX9wRQC7GpNky3gh4FPJ19BWgyNbOrQkai-d53C4uu
 w6YBkjbp6FpDbZDLww>
X-ME-Received: <xmr:f-_7Yd4FjqT86twOwmLfjzi5Bjh8a8Rv3pBUJllbpRF0kogM8j1k2nqLurhyWoPuUCgTAKvtEBoVsV1UsEDBA4YaXu0D2unyxWlZr9g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeejgdejudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:f-_7Ya1fSdtSPpfrlPMAU7btmxNYZ0bRq_2M_vyZ0nuLP8xuycJuLQ>
 <xmx:f-_7YQHv8r8C48_lH17Rzja5l-fOVKageNm-FbwITs2QT5IwSIat9A>
 <xmx:f-_7Yb9F_bA6ovkYfwkEmimnYtOh8uGTIX-22sShWD1u418Q-xPDEQ>
 <xmx:gO_7YeYhYgSwJx5099nZMRl2gTcrGlf5tuJXGeJKC8FGWj85SUVhDQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Feb 2022 10:06:39 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: (subset) [PATCH] drm/vc4: hdmi: Allow DBLCLK modes even if horz
 timing is odd.
Date: Thu,  3 Feb 2022 16:06:34 +0100
Message-Id: <164390079045.1265461.14563806459775996668.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220127135116.298278-1-maxime@cerno.tech>
References: <20220127135116.298278-1-maxime@cerno.tech>
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

On Thu, 27 Jan 2022 14:51:16 +0100, Maxime Ripard wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> The 2711 pixel valve can't produce odd horizontal timings, and
> checks were added to vc4_hdmi_encoder_atomic_check and
> vc4_hdmi_encoder_mode_valid to filter out/block selection of
> such modes.
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
