Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4993D5098B9
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 09:20:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 171E510F554;
	Thu, 21 Apr 2022 07:20:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C1AA10F538
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 07:20:13 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 3C5773202232;
 Thu, 21 Apr 2022 03:20:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 21 Apr 2022 03:20:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1650525610; x=
 1650612010; bh=CW6LrdsWpz2RH6/dNzPwyMkRcM7DeDOtHNCwvq7UaRk=; b=W
 24sYv1dovmI0N5O72DMV/2wQBlifkHc5VdQCOYK+3KXGcR1cqEQa1E1VKEE2n87X
 vEdKVISRhilv+6kaqr93UG1RjwRQqVCXG2jsO/DdFqQ/KrUUIm8+paD2CDxrZbpE
 AtlHwJ/6bTBf/4BZWG23ilQ/VCH0AwIqXQvgnzle7c5DADkHUw0hnrWb2FMPaGbn
 K8u5BMeMWsDGGuCF5wpJLGg1cpXabFfOp1HumYchV1JStNiIHFWpwATKGyR6Xb97
 Ln2GDnLrV1Em0aZmFZRijoLsm9CUXTN9B1E+aroW9ucd+xGgr1cb6kQXHxSjiM5C
 DJRpDYFTysLUyUFBzwYew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1650525610; x=1650612010; bh=CW6LrdsWpz2RH
 6/dNzPwyMkRcM7DeDOtHNCwvq7UaRk=; b=iPj6+FyLQG0eltLkgp+9yCtjKdFpw
 P+X3Kzk3Cs8aCXt98pCmQYisJxKc61YW3uTlJ5t1YK6+XYGXW+nzrm3Zd6rvc7b6
 rsHOIQ1tl33vXoyWxZ+AZGL9BGsYu0pOWo6/UEAax5+CkeLoMVcBcORjXCab68Bu
 rAkGdFuiBEx89cLYC9cElAnmZL5gUnqdAA1hBqfUSHJfacko4EoTY/ELzfuCBXYs
 bEf/b8lvCFqN+cvCqgHXteexJzwd2cCUwWGTI7mZ65lKBjbr8xSVO7oK53c6dhQt
 wlwPSSlZWP+2YNqM2CbBO5uQbzCFBJk/kDuD+xDBwpuyw7q/ii1FpQgxA==
X-ME-Sender: <xms:qgVhYunhw2pDxMWI-9sxCur7DSbs6JmONEPuHvi3PhdQS6pc-YB42g>
 <xme:qgVhYl2iIAuAVIv9FQLTQnTTYXDBcgEFZLYuZvixtA4nw5qF-eeGlLJL5iBQhFhRI
 35SCegaaxUbkV1OxUI>
X-ME-Received: <xmr:qgVhYsoH4VnZTy6eYSwZLWtzVyDtZEIT5vffnp9HXcER3dX-vv85NYKYwB6bSEEa2WvzuXPvZNPjLQSxG3wH6Yj7UZ3o1DaT-1EOAI4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtddugdduudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepueeigefghfffffeifeehudeiuedvteegueefffevgfetvdffheehkeff
 vedufeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:qgVhYik56xCshjEjjJRVLsiCEk1bki8dmqznQS0SFthzQ17JsMD8JA>
 <xmx:qgVhYs3wkQVVAfTyZ0v9B1dzNMo1uqN5fKEpnfCX7JAXI6VQ-l-akw>
 <xmx:qgVhYptRXsEdp3nbnrYNXLlyJMvAbd4pi8EJlJdplRk8GHlizjDrPA>
 <xmx:qgVhYltQOhtC5Xt8flqVAlbHqMGVWDf5f3nJmXzzneAivrA8kLCEuQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Apr 2022 03:20:09 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Clark <robdclark@gmail.com>
Subject: Re: (subset) [PATCH 1/2] Revert "drm: of: Properly try all possible
 cases for bridge/panel detection"
Date: Thu, 21 Apr 2022 09:20:07 +0200
Message-Id: <165052560307.696645.16914083635478662154.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420231230.58499-1-bjorn.andersson@linaro.org>
References: <20220420231230.58499-1-bjorn.andersson@linaro.org>
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

On Wed, 20 Apr 2022 16:12:29 -0700, Bjorn Andersson wrote:
> Commit '80253168dbfd ("drm: of: Lookup if child node has panel or
> bridge")' introduced the ability to describe a panel under a display
> controller without having to use a graph to connect the controller to
> its single child panel (or bridge).
> 
> The implementation of this would find the first non-graph node and
> attempt to acquire the related panel or bridge. This prevents cases
> where any other child node, such as a aux bus for a DisplayPort
> controller, or an opp-table to find the referenced panel.
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
