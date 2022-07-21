Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7445557C8CE
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 12:18:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25DB58D747;
	Thu, 21 Jul 2022 10:18:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E2F8D741
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 10:18:06 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 328955C015A;
 Thu, 21 Jul 2022 06:18:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 21 Jul 2022 06:18:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1658398683; x=
 1658485083; bh=jBXiLVgk+MQp/+/KkFRnF6nXtE8UOCN9j7zexhft9E0=; b=q
 P6DaS40vgonigFjaliX4liAyfE8smTw//MKsSgAPj2mUNTXdTOgSv3O0JiV2YLlp
 f2dP9bo1LmAZfxwhH/xr3BPczGJI66MwBPdideLuAtLciTbfzdi5+ySzGcxMJG7p
 N5X8WF2JkyxkP0PVZY2wbm4FR+BwrZXp/Ak/dj3k2XoiPjy1Ud6UmuTPo4Rt/FUQ
 ScjLlYfvQlIp99VChFa30paR4sMdtuwp4jvDUi7HRYmlcSrl1EbcWUqdy5SJxwa4
 iqWPphM5KvEm2pKwKrr/55QtJrFAEJmyKjkjz7ElMOayG7mrSC2yMYnaXqOlJ6s2
 jcSMlIaQhYhZvUvPE76hA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1658398683; x=
 1658485083; bh=jBXiLVgk+MQp/+/KkFRnF6nXtE8UOCN9j7zexhft9E0=; b=x
 z24LuBoVORoPOkRQrJkfbsmxDDxN2xFx1MFkOfYVVaYUwQyamYxWa4+Hp2Q7ApPQ
 qSuraCkVYvPn+XRAJ4rnRWZf7elNfxWfMCaBpG1SpkOlaTtyOzTdDOoG9+zcUn4l
 C3ljfy4pPwATu/WWDJ6jTCrGYJyxtD917ubDWs70laJjbOSu4A8DHucqX9zaBRuB
 6fuZLNLmxrMyTwGtT41kGQWhnhmXghNgVbVZA9DWk9I7WmUL7q6jrjx35AFeKfRX
 5kanFd3wRKMfmZKIMkT17wrMGXj4FTHNtqdQjLytkXT263cZ7N5if9AVcXvcuTMe
 Jqxa3Ktw1LZ0QE9d+iUBg==
X-ME-Sender: <xms:2SfZYngHsISrNFiCmyltRDk_qsrihitkYR2K80ipNKiI9roIwkkfqg>
 <xme:2SfZYkAaP-AQ_m_h-spklUR6uZijXJ5HeELGagNjZnuebhvJk2fo1EeFWWR4pi08S
 muFTghAQ8HRHg2d4CI>
X-ME-Received: <xmr:2SfZYnEF1NZpRzcs0Jx7TbUT2quTzOULgCLBnguUtODA8pE3uqtFCPWM2fxCVXWxH_PhcafDfj1EudI4HWGlEzwCFw4_cGMY4t5IYoY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudelledgvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfgggtgfesth
 ekredtredtjeenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrgigihhmvges
 tggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrhhnpeeuieeggffhffffieefheduie
 euvdetgeeufeffvefgtedvffehheekffevudefieenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:2SfZYkRDOTx9QPtwgl3JTghlpm-nVlEZlvDHUaByne33EU2wWvJRTg>
 <xmx:2SfZYkyAxE0lK830dWlFZZh7m_-rUUyDJ_nsrunG2iBo3oEUw3rdFQ>
 <xmx:2SfZYq6E5Vbe6ylmEw8v3r0aQBsPGfks9oho5zjwEr1zQgSSx0L3JA>
 <xmx:2yfZYny0o0U_yPAX8ShUKQ59kfSEnGWmrCnFdr0WXt5RNFZbFFEDAg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Jul 2022 06:18:01 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: mripard@kernel.org, maarten.lankhorst@linux.intel.com, airlied@linux.ie,
 daniel@ffwll.ch, tzimmermann@suse.de, liuzixian4@huawei.com,
 dri-devel@lists.freedesktop.org
Subject: Re: (subset) [PATCH] drm: correct comments
Date: Thu, 21 Jul 2022 12:17:57 +0200
Message-Id: <165839867634.1851550.16192375926600499733.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718015357.1722-1-liuzixian4@huawei.com>
References: <20220718015357.1722-1-liuzixian4@huawei.com>
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
Cc: linfeilong@huawei.com, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 18 Jul 2022 09:53:57 +0800, Liu Zixian wrote:
> On failure, these functions return error pointer, not NULL.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
