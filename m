Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AE2544E73
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 16:12:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E45A12A8C7;
	Thu,  9 Jun 2022 14:12:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A59C012A8C3
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 14:12:37 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 06A3E5C00AE;
 Thu,  9 Jun 2022 10:12:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 09 Jun 2022 10:12:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1654783957; x=
 1654870357; bh=gNYsik8nqVS6cCFgco/fTwol9HFsUQQ4C+jbTb0Pkpo=; b=Y
 mOlN80iAH5kIMHXEOHonqskDpQER46PM5MvReSlXjj2BoCAlSr0EmwxCyR7Uvz0c
 fMi1fzKW0ZRH8TRfpAsFiMRCHm/pEZGZL2VGFoCgmYzIe3TxPcVE+c5M43ZAojfR
 nTdl5PtyoTRCsGd91EGbMX1BMbIn054Z+SYrN+U9PC951sRxiBPe6N7nX2RRhoSF
 f9h0gJ7Evh83Arky1xzhEJBMsIk8Hw6rDk/oozrk1hFm75vTa9jGMh4T0EobQYrG
 1y5U+xz/cN7Cx2IM5iNJFawj+XyOAmnC803Yvcl2DVMrokEdaJyIAeNmQBZlBVoc
 oq/em68Pmg6bvQvZOhodg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1654783957; x=
 1654870357; bh=gNYsik8nqVS6cCFgco/fTwol9HFsUQQ4C+jbTb0Pkpo=; b=x
 M7BqJIgLvioLqn1pHhkr428nlWtXCCoL/oAUKwHiLqKff+H3Qmu64gvbDlxFdqs3
 n9PrMQXky+TcnihD52ucb2B0HasndDv3LfgO2EXCzAwfs18G+5M87hAe+9b9pD5Z
 FBJj9OoWBbRDETQjNZ7ypvZ3xS48fRcVFUpfvkTvuCwy+SBttwXFYneaXCRASQOj
 Z72dLBYN69gaoceCOmvIjGLK+dIl2JegAEkwybJSqGLQc40Z9sZVogfP6B0xSFCs
 WRRLo2VNOIEgi7ULuepLXrytH9XC6rC7O3xvvf9UJKMkThVgR+bbGq8RTwnvBxSX
 afxxSWR6ZxVO6KzhooTzg==
X-ME-Sender: <xms:1P-hYnJdgag9gqpkhdy8C7GgSEsphgLpDa2e-VAB7w_pKF70KXVWdA>
 <xme:1P-hYrJRF0JlnBn13AfKHjlud8JOx5RMVcjonkk0d-wY3wl3aHwgusrkRJhpRqztk
 UJgcqUjgSUwUd1SGbA>
X-ME-Received: <xmr:1P-hYvsMzLo9bVx-re4Pogqg2Jm2f2u2S0dpXtpGkmCqCRbBJTVHL3NIdxBAoLkuDGptjevfrCx1etXxuxsQksk0iwPdayiwdlymblc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtledgieelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepueeigefghfffffeifeehudeiuedvteegueefffevgfetvdffheehkeff
 vedufeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:1P-hYgZ10sLQfry1jBimpD7-YjBI3qU6-DzPV5qXLu17c0YZ3i1HJw>
 <xmx:1P-hYub7ilpCWIyZnzh0gZfRKERT3u6hP8NhaG1jFUqaCRFMXThV-A>
 <xmx:1P-hYkCBbJiPVsMdy1Yy3-3w_gUK8qBQXD0px2vZsEegWk4I5CmS2g>
 <xmx:1f-hYkMqVD_UZAonM4MghWBNa04zW_tmIOHYS9vjFVr62gKz7hkTcA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Jun 2022 10:12:35 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: "GONG, Ruiqi" <gongruiqi1@huawei.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@linux.ie>
Subject: Re: (subset) [PATCH] drm/atomic: fix warning of unused variable
Date: Thu,  9 Jun 2022 16:12:32 +0200
Message-Id: <165478394694.607768.18185681425162290628.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220607110848.941486-1-gongruiqi1@huawei.com>
References: <20220607110848.941486-1-gongruiqi1@huawei.com>
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
Cc: Wang Weiyang <wangweiyang2@huawei.com>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 7 Jun 2022 19:08:48 +0800, GONG, Ruiqi wrote:
> Fix the `unused-but-set-variable` warning as how other iteration
> wrappers do.
> 
> 

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
