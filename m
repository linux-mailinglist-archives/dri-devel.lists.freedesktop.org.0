Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5044DAC8D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 09:36:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EBBA10E368;
	Wed, 16 Mar 2022 08:36:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB8A10E368
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 08:36:48 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 9CED75C0097;
 Wed, 16 Mar 2022 04:36:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 16 Mar 2022 04:36:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; bh=LYvPUsne0OssXP
 +/5PlEAgHCGbs81+fcpSmgItgTi4U=; b=HIiINhrdjNQajkS1/mDkMbHqx0uj7Y
 ecHc2xY2b17Ez/ka19qPijdxp66aEft5XSMkeqME0srBQ+1FQNWHxK3evVUSJbD0
 8muwchoVaKONCmfxfZkR0BI+1pDZI9pPqnjG8fiFuDuPCK9IM7efDJHPIec0cIhF
 R0GbeO6w4Bkkf98IZTQVTgmG3uxvf77x6ZMvJ1tJM7Rw1PW07MEWcMf+LuBbRXYQ
 KLRDEnG44c5s7OfPe48G+Gsi6m4q5XZgE/IRbqtpBTzZR+jPeQ3MazJFUKtJI81A
 WLD9sP5gqiTxqWsKl/DLNGNWgL0f2LrgdZZA9ha35K5pek2jjOZAdpGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=LYvPUsne0OssXP+/5PlEAgHCGbs81+fcpSmgItgTi
 4U=; b=iZtXrP6b6NPPpBimA06XnYz/9mLDEqYMx9f/zC6FByd2+GeJ6D+etnTpx
 zaGpc4809LSBHsydyLpzIhfJhAfZTFIEJcCeAVMH7o760xDYP9duE23I6hbAmdJG
 Swnk7gAV0Z5r182dMa5OMWcXzPO4wGVS0mCPRyW9pVOzMWZGehJbq/YNb75X8J4l
 aVQzVkTyAXoHTIZE3h9MNAf8xU7WSga7FseNpXZzy9VaeKY23V2ptCanBLUHgVgS
 5LEqkXpLFNEhY5bs2Rf2qq64T0hFpfiHumyXbZ8s4vLutd2Kf12ChPbXFI+5NpzL
 BG2zuXg4xVDE4SDHnvhVmMbeBpDMw==
X-ME-Sender: <xms:nKExYoRK5D-JvO8RGOvmWxJTlYlcR1HaMAEWjkP9bFG7-n0mN5ug_w>
 <xme:nKExYlxuzMBIAJLSW1Xf24B9Bvh9YnXEGAbhSHPxZtRUnKqp8DPEj-lBYCAWFCyJo
 jkpxGGEWLOqssdCNWE>
X-ME-Received: <xmr:nKExYl39YT5NiThL8CStYhqfAbaPny7nkqje6s67DJ6lekbCqpKPNFkf2SnII-k4GAiVnKj0H2-h9XwTFeGBzk4SJiwjLhmxgCGHJkk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudefuddguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfef
 geeikeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:naExYsDa-RXaGclQt4j3GnXgwZD39Qp_KiBzvfjiUZA3U8TqBbUGRQ>
 <xmx:naExYhhoLjvyGD2ns5L0U9LSWuydJJ-sdHInU9fSCjLK4GC8lurtuA>
 <xmx:naExYop-TitXcuizibyvfrMsTggmUdxSHf9y6Y6zG5j_pawes2ordw>
 <xmx:naExYvZPJgrsrAacIfyh3VOIKdZmSKnkLwWE1qCl9GNp1py9rmX_Ew>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Mar 2022 04:36:44 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: (subset) [PATCH] drm/blend: fix typo in the comment
Date: Wed, 16 Mar 2022 09:36:41 +0100
Message-Id: <164741979760.3389937.3373672456320099865.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316074648.7009-1-dmitry.baryshkov@linaro.org>
References: <20220316074648.7009-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 16 Mar 2022 10:46:48 +0300, Dmitry Baryshkov wrote:
> The documentation for drm_rotation_simplify() uses DRM_MODE_ROTATE_X,
> while it's clear the the comment should mention DRM_MODE_REFLECT_X
> instead. The example passes all flags except the DRM_MODE_REFLECT_X as
> supported and expects to eliminate this flag.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
