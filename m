Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 445DD49AFC9
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 10:25:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E048110E8FB;
	Tue, 25 Jan 2022 09:25:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9CCD10E8FB
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 09:25:41 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 25644580692;
 Tue, 25 Jan 2022 04:25:41 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 25 Jan 2022 04:25:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; bh=bT9BhKiMrpZoJ0
 ncm0KEXVol7X6NRNkjwK1y0fcLj04=; b=gaH5uyOv2LLxI4GZJy2FUcPv/hdYDs
 /0Tu5S0nswm6Sgkjts/S9c262TEhYAKSaXaH8iKf5L6Jznx2SLlHP5J4k/FEAQzP
 HKdYca1VmgoFy1KScL6HV0+PHCO46XffLXOM9BAFHkrchZ13pmWbZrdNh1txZh49
 M4TaiI8+C922ochUrKC5R02nciHyemS3I+Zsu1PlTNq5SqSctsm+iik6Rp2DibzD
 P3lrQH2kW2QbQSFk655ie+72RrA6jT9WCr3GFm0grsycASkm2Km7Q7hAgHzMsBsb
 SpqSXW2bq/f20GNJjy14ZYHvm2gA+nSB/5fQa1cWrN11sGY6Jqk3y5jg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=bT9BhKiMrpZoJ0ncm0KEXVol7X6NRNkjwK1y0fcLj
 04=; b=Tq8RXfBn5dab8aEFzkWMFU3IxE/jADYLuZHx3ezs1O5xmPkYQoPvypoWN
 UwIZjGMDvgjVuJ8nubi9j+CUCMpP1vOGaSMECX333vugPVgqC1WZ5f/yBjslSB+X
 vBmh8RLVGkaQKskeq0oK1G/96C5ZX6RdvCdNFZioZQcXp1emZXZqh2jueO8q5RJH
 FdTekCQv2xDStn99e9o5cCkKewBPmbmVF3njslIxwmL2EaRL/NaXZBJ6WeGDkawo
 YCiIVSxabm2itM9LnymiLnd/Ac4aPtfLLbScm4H5nl9yxWW1Wr+OOhPSbWDhj3oR
 Tln1Kixa+QvCZSoLAsrUZuJRZZ7PQ==
X-ME-Sender: <xms:FMLvYVfGw-XNAC5v4_ATeOa2FS_IXmPoXW_V6Vp8AWWhwqAjj1h1aQ>
 <xme:FMLvYTO5t0qaR5v19k4Q1maEesWnyUboXrZnyNUWN2mek2dbQn2-DWjbiyAcL831D
 s5XTmpFabCylAebOBg>
X-ME-Received: <xmr:FMLvYegEAs2eayWdY2oojcH5YKbKc0_kCQVFoSHe8uVJDVieyviUj6aU28fMKPTX7lWp3P4Dqt11lCGENXaRiO3Y6fBCC9ZxMgQSIGc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvdelgddtudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:FcLvYe_yBxUFswLzk2mvUQ0WMA2teL1y9KcZip010x2mNe7OvMA3JQ>
 <xmx:FcLvYRvuPItXj3PPNrkGsXDjffU48lJ_VsOByKKTxGQdlgLtuK6o3w>
 <xmx:FcLvYdE_qHLIHWfGzkoWM_G1AQGW-8X3Fp4-rOmaSMjWPrrrPLb-dQ>
 <xmx:FcLvYXKtSzhRpuGRCCQdgVVljf0lbhKJ-4VTn3fHawZsv5njbgEmEw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Jan 2022 04:25:40 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: (subset) [PATCH v4 09/16] drm/vc4: hdmi: Define colorspace
 matrices
Date: Tue, 25 Jan 2022 10:25:18 +0100
Message-Id: <164310270997.583056.15718047978731846053.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120151625.594595-10-maxime@cerno.tech>
References: <20220120151625.594595-1-maxime@cerno.tech>
 <20220120151625.594595-10-maxime@cerno.tech>
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

On Thu, 20 Jan 2022 16:16:18 +0100, Maxime Ripard wrote:
> The current CSC setup code for the BCM2711 uses a sequence of register
> writes to configure the CSC depending on whether we output using a full
> or limited range.
> 
> However, with the upcoming introduction of the YUV output, we're going
> to add new matrices to perform the conversions, so we should switch to
> something a bit more flexible that takes the matrix as an argument and
> programs the CSC accordingly.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
