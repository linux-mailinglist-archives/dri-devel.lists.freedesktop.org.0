Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C93B554394
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 09:29:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52EB113BA4;
	Wed, 22 Jun 2022 07:29:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4294F113BA2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 07:29:51 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 3C01B5C00D5;
 Wed, 22 Jun 2022 03:29:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 22 Jun 2022 03:29:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1655882989; x=
 1655969389; bh=qpQsXRejsI5099x61Mrfm6AobkDq+7MXCwHTQ9iVnz8=; b=2
 CgCq34k2nBXyhUj3Udy0NS2MufzxpNTQFlDwGhgAKDFOafFIs3AdXACqqKWE++QE
 Eul/E1CREI+rQalyY5r1Ljp1MPySRRCh/+xgYhwTAUd7o21IOuf8n5dGlxKSBGfd
 SpD6DBQ+qMaB/BXB676xwVjniaDP0/2E9dQBliQ5fI5ZJAE01VzNZR1r3GOiMOYc
 eEcgWb/7iUHpOr1QkO67dWhn3syCm1dm2QuE94OPnvZIMq/m6aN0lFVq5dnyxAkM
 lepLA2w2q4tyWDdmQxuIh778INABM1sBEUhIKni499QBdh0X+cMNj2zxoMZpRI1o
 WZQjH5aK/pXGD2QCPKuIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1655882989; x=
 1655969389; bh=qpQsXRejsI5099x61Mrfm6AobkDq+7MXCwHTQ9iVnz8=; b=W
 MoEymr5od0X6+orniJreaujenHudYxcrsGVSjcljTuqX5TI9VEFok7VPkS3fwLh4
 7wT0Uk7sps1SY49zN5cOPcIBh97M/Rjfch/MPfoq8FwdahG84iVdWnnR1lujGTt1
 e/jSdBaRnzmVv0p45WFBCIt/8UKkdmy1Ow+TBxGD1F3Ue2pHteEvszz8nMU0WheW
 OPhEK1icwjLY79v0EWSSru2XUz6i4RUaoKw4em5jRZey1TrWfIT/18xLP27Rmeak
 2XTfjfyiPc1PIAlbId224wGL98nywR5Mk5pHVumb48kbiIuYr6OqIRlannIxrSw2
 qqiJQTBSWY3LALLW8XW5w==
X-ME-Sender: <xms:7MSyYkeZ8P-spzD8jGMKPn1C6MDrjAQ4sRCGFuLDYTSgHMnrrQaEIA>
 <xme:7MSyYmMpkUrBoCGw4HsdxY_4EUd9QsoefM2CzhB3SMzYSYQCJiAGKQDWQvdJ2aU07
 Fm4_uxly4d3wRSjXrA>
X-ME-Received: <xmr:7MSyYljpoSNCrMN2LlRBdI-w4p38wFR-b6PmFrreLY7Ta2vsJCikObtYKDXUT32Z3Aelbzf8Q1VM1rwI-xbGQPMItv8j-1-qEAhXK1o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefgedguddvvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhggtgfgse
 htkeertdertdejnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgihimhgv
 segtvghrnhhordhtvggthheqnecuggftrfgrthhtvghrnhepueeigefghfffffeifeehud
 eiuedvteegueefffevgfetvdffheehkeffvedufeeinecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:7MSyYp_WmFVfY0bsEuGXgT2qzP5x68Swr9Tb7Gh-YptMfEeatD-1gQ>
 <xmx:7MSyYgsAvruQiYusk_Yw1xBtZUjolIw6Rcwo3pEZhgHoCX3tGSGc1A>
 <xmx:7MSyYgGD-rjguZOZB_1W5vGYKMsjhIWoz4Jgh9klzokMMinseZzkKQ>
 <xmx:7cSyYl_Sc-SVJTj8hk1SaC7tRsNYlO3WlhrW676e3ENxbj-qnLr2CQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 03:29:47 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: maarten.lankhorst@linux.intel.com, airlied@linux.ie, jiangjian@cdjrlc.com,
 tzimmermann@suse.de, daniel@ffwll.ch, mripard@kernel.org
Subject: Re: (subset) [PATCH] drm: panel-orientation-quirks: drop unexpected
 word "the" in the comments
Date: Wed, 22 Jun 2022 09:29:41 +0200
Message-Id: <165588297922.13818.16761232359247281668.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621134401.10290-1-jiangjian@cdjrlc.com>
References: <20220621134401.10290-1-jiangjian@cdjrlc.com>
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
Cc: Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 21 Jun 2022 21:44:01 +0800, Jiang Jian wrote:
> there is an unexpected word "the" in the comments that need to be dropped
> 
> file: drivers/gpu/drm/drm_panel_orientation_quirks.c
> line: 196
> * GPD Pocket, note that the the DMI data is less generic then
> changed to
> * GPD Pocket, note that the DMI data is less generic then
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
