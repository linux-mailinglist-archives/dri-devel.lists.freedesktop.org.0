Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7EA49AFCD
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 10:25:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 771F110E972;
	Tue, 25 Jan 2022 09:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7E3310E8FB
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 09:25:39 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2F757580699;
 Tue, 25 Jan 2022 04:25:39 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 25 Jan 2022 04:25:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; bh=YTp42yyOdtYSkV
 6bC8LpTVAwXlpxum5cJVfJnWGJ/N0=; b=Nqsu5YAD5l3JtFE3Dy1TSKCeRrNky7
 p11+kZnpNH6ptEWfSkFtoeGy8Gd4zX17elGNBSscSf4xIOkFK8C4LA/d/YNCgdCC
 89UWotSxUziKy+RpWQtgSdm2BSUUU6w7eg2FE04zqROXu0mHbOCsO9nkX8nZXlEP
 It3eAFq5eTdFWjqKcf0gKR0kx2QIdDPE4bJJcZtERzcUBkpyLTjzLS7YU5XVLjt9
 tH4d+nguUFtQqd6c55JG2KtRWYSzYAMgjZ+5ergXEdlMszom7zWTz9st3KK4957C
 ezO3xzp5KtaIsXglQRhVZOyhM46H9ZcNd55p8ZhHBBUgCYrbZBYhI6tA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=YTp42yyOdtYSkV6bC8LpTVAwXlpxum5cJVfJnWGJ/
 N0=; b=Ial7euNw4giLokyrFXfXsFPwtrxRm7D7u44+Nn+HyOSIGeR7lTKi/j3qc
 wwOE8H05PpFYcbdXjq129uvCtXZkWQr3HWaMIpsdZ2XNvNLbMxQ3JLzPu1HJCmR1
 whaNb5PdoCYcu6UpB+6moTsrcecdsyergHgJQGzVmTCw2aU0JsN71LQUzJcHXgK6
 6ddqCZ78br9KpvTKN2qznTobRvf3kQZrULnD0bmL5OTMfhKl7axz1PqhCH93HHVc
 vs/rZWz25GpAVfkTCusMcqBwBzdvl8wxnKpCR0W2X4n8IAhfIiLFJQYp8fmXuEPg
 Vs4AvM/ztGFKT5H60nlH/GkF0BVWA==
X-ME-Sender: <xms:E8LvYYoZPkOqG_mUXxwoAxrRxF-jaBwMwEaVUAml7uPyRfBaQx7TTg>
 <xme:E8LvYer3kOtocFFiCCgqaixGIG2AT2zt-2-GmuM-Kg5JGMDvPKujqS-002O1aOwWK
 LMNJFgxNyLf2L24alw>
X-ME-Received: <xmr:E8LvYdMijvrbLPweLwjZNNR3p2NA53LMiXD4sZHRJnoZv2gYUVvgLQhUrBU2GrtFLFDb3wy1jWbuQyaczFZ0rP5gEhwT9dpZpjZrMbY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvdelgddtvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:E8LvYf7RNbsxAWFpOyqvu77k01vHnSvaGPiws43t0unmk58SHOdBuw>
 <xmx:E8LvYX5hACcQLVIhVDitf1PD5qjTaFCkEzvVox2xZhlceNXm99lg2A>
 <xmx:E8LvYfhSz5cEv3Bl_VRxui-uiROcrKA27fwFQ10zs1V35n0F36pG_Q>
 <xmx:E8LvYUFue3hSR6uKRUocSQhNy6aHsTADVqesTqgoiMlHIpAuIx_WKg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Jan 2022 04:25:38 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: (subset) [PATCH v4 08/16] drm/vc4: hdmi: Replace CSC_CTL
 hardcoded value by defines
Date: Tue, 25 Jan 2022 10:25:17 +0100
Message-Id: <164310270997.583056.9626935737332521592.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120151625.594595-9-maxime@cerno.tech>
References: <20220120151625.594595-1-maxime@cerno.tech>
 <20220120151625.594595-9-maxime@cerno.tech>
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

On Thu, 20 Jan 2022 16:16:17 +0100, Maxime Ripard wrote:
> On BCM2711, the HDMI_CSC_CTL register value has been hardcoded to an
> opaque value. Let's replace it with properly defined values.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
