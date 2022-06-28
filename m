Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CD155E1DB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 15:34:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E725F11A081;
	Tue, 28 Jun 2022 13:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C3411A081
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 13:34:34 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id A02FE3200201;
 Tue, 28 Jun 2022 09:34:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 28 Jun 2022 09:34:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656423269; x=
 1656509669; bh=crPaYHNsWWDgLp8dvvmYAtwm5BlQZxJ/DePOpw+qVAw=; b=J
 vCLHKeWFG+GAX6L965t7EwqHm6cRcCZ8KSgtuzFFvcvALzt1dgLRtbV4mxsWWARy
 ETlAgXiChBNcqJf61cwU3P4Cvo4aDgH/JNOk3aLZygSKpQDQtkfnRwgd9LeRiJnb
 wUfZL+c/SRssMmBfLltCyyCyPBQtl/KBuRHc7U8c2dAGaJG+aML8yufznmmOi7vU
 zF2fju4rqeHVtRGo6OxXB58QmSIw+vjvVi3MvEbv9tnyIA+B83BCNvX/6wlliXgN
 yYVVOMDXz9GBPijwv8MFVodo57nz/qAFJIn7LWujXASpBV9K0b9JJuzieaRWSdz2
 jNfmfK8nN1WbrMdCLsXjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1656423269; x=
 1656509669; bh=crPaYHNsWWDgLp8dvvmYAtwm5BlQZxJ/DePOpw+qVAw=; b=B
 YDmklychW1waRdI2WUDIWOYxmvc0u/YXv7gaHnmidVl3pPfI5n/2DkuD/eTf4lYg
 m4WRRVLYYJtXE0PVQghl04iIyjrHUXRnzd3JsBzWGoKncc58QeSoR17rKWrOUW65
 4YqSetgeSpZWltInyrNwtLsC4UpyF0ws5FfZmjGt3VvNM9/x3Mh/Sa1Gj5+wTjfv
 bi7Za4KSZNnh8IZzlgF8D0prPlwhu41PwhXwWWHsdCbGxzhS/xvRrojAJUCtalT6
 IOpPdRHgKFIBSbwA8cUC2Yi3fKPtgvs32fTm5uM26qzqZcX9X2c3Qo6XLuIw9vKG
 UGWJV+r9H5f3uxC2QEqcA==
X-ME-Sender: <xms:ZAO7Yl-ns8F3zMge4JviK-EFTrFoIZDY6LwcuOd5b3APztajbbbSbg>
 <xme:ZAO7Ypu5Z9dh7HjlH6EV09KDSYZjwJ-Sy6pDFw37lCeMaugrRTePTFh5RLdf2-o82
 S8JSP3XCaQ9y6yA6Bg>
X-ME-Received: <xmr:ZAO7YjChL2ST_hmCCNiJxqUaWgDr2iB1MM1ztbMMvy2diNEl0uuIzDTMYTl18SF2sNkNO76Y7F_hG_oEIfDtxS-NO0XvzQugQeMxq7o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegjedgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfgggtgfesth
 ekredtredtjeenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrgigihhmvges
 tggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrhhnpeeuieeggffhffffieefheduie
 euvdetgeeufeffvefgtedvffehheekffevudefieenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ZAO7YpctPPBobKMb5g-sXNRtixp3igSqATXm9gHWlbQgDtCD4GqODQ>
 <xmx:ZAO7YqPXDJBuLg5OSUy-POQ3qu5LcTn6L5xrNaCDrTLK9nR1ORlVuw>
 <xmx:ZAO7YrneXoS2ND9148vz7Z-zr17Slk5QSobvbzGibUuxCYiboLhk5A>
 <xmx:ZQO7YnpJl3pBqhTfTB1ecVFPpr1yz4mcHn_fyZX-PyghjGgIATEo7Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Jun 2022 09:34:27 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: maarten.lankhorst@linux.intel.com, daniel.vetter@intel.com,
 tzimmermann@suse.de, airlied@linux.ie, maxime@cerno.tech
Subject: Re: [PATCH 00/33] drm/vc4: Misc fixes
Date: Tue, 28 Jun 2022 15:34:25 +0200
Message-Id: <165642325448.636367.6661737488096063384.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220613144800.326124-1-maxime@cerno.tech>
References: <20220613144800.326124-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 13 Jun 2022 16:47:27 +0200, Maxime Ripard wrote:
> Here's a collection of small fixes that have been used in the downstream
> kernel for a while, affecting several parts of the vc4 driver.
> 
> Let me know what you think,
> Maxime
> 
> Dave Stevenson (21):
>   drm/vc4: drv: Adopt the dma configuration from the HVS or V3D
>     component
>   drm/vc4: plane: Fix margin calculations for the right/bottom edges
>   drm/vc4: plane: Add alpha_blend_mode property to each plane.
>   drm/vc4: hvs: Add debugfs node that dumps the current display lists
>   drm/vc4: dpi: Add support for composite syncs to vc4_dpi
>   drm/vc4: dpi: Add option for inverting pixel clock and output enable
>   drm/vc4: dpi: Ensure a default format is selected
>   drm/vc4: dsi: Release workaround buffer and DMA
>   drm/vc4: dsi: Correct DSI divider calculations
>   drm/vc4: dsi: Correct pixel order for DSI0
>   drm/vc4: dsi: Register dsi0 as the correct vc4 encoder type
>   drm/vc4: dsi: Fix dsi0 interrupt support
>   drm/vc4: dsi: Add correct stop condition to vc4_dsi_encoder_disable
>     iteration
>   drm/vc4: hdmi: Add all the vc5 HDMI registers into the debugfs dumps
>   drm/vc4: hdmi: Reset HDMI MISC_CONTROL register
>   drm/vc4: hdmi: Switch to pm_runtime_status_suspended
>   drm/vc4: hdmi: Move HDMI reset to pm_resume
>   drm/vc4: hdmi: Add HDMI format detection registers to register list
>   drm/vc4: hdmi: Add MISC_CONTROL register for vc4
>   drm/vc4: hdmi: Correct HDMI timing registers for interlaced modes
>   drm/vc4: hdmi: Move pixel doubling from Pixelvalve to HDMI block
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
