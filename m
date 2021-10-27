Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FA043D255
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 22:11:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D106E8E3;
	Wed, 27 Oct 2021 20:11:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C28986E8EB;
 Wed, 27 Oct 2021 20:11:22 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 9A7BE2B01463;
 Wed, 27 Oct 2021 16:11:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 27 Oct 2021 16:11:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
 v3nqF8/ES8uOusyD+TVPgfkaQFExcKgaizfNTjPsVPc=; b=L5tk+9gF2P6bUIxk
 OTAs5o+YYIWFA1PNQZ413piRdHNMFnCoQK1M5NFQvfokStZxAo3a+YtYnZZgpb78
 XrUgWuBdC191q+PiKiV780+sTkQrl/X6TNVqKmsMJXTENiJZNviSIltSXDYRnK3t
 2iv2uJMRF0UprJOStjIWjx8DbHH+9UzV7AGfszbzPk8A80qt2QSaqQfbUpistcqh
 DQQR8bH7/8pk+IMfGIlnZmCc4S5qDR0ISl+ostb94czVy5drbLP9B7Q+EeP0Qw6Y
 egnzvaGAnHM4B3kPW2Vn5jlog8LuGSZXzd0AJzfmekuJHDe3BXidd0AXm4G9M1/f
 dcKT3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=v3nqF8/ES8uOusyD+TVPgfkaQFExcKgaizfNTjPsV
 Pc=; b=QHozbKSfUY0Kv4dCcdgxhUm2R7QpkkyKaSxkugYA+uAOHZRZbj8Wjw8TS
 4T6Tpi8nR6l+fVQKFsweEatCSkSw8d4d6ZylhUmxSPXs8fvTyMAAu91KvieK4K95
 L/4LoW3Mf4xKMrEpaAeyoFyK6AKaHTLtg59hx/A/O8tNtKF8pLB/m29PA73YE2zz
 WH2EAhPhMspm8SyYqCNQmrU1oU6YjNqVHZRZVox57YZI6bRKL3f7y47JGDxvq4gt
 pfTX29A0JlXKofIgbqdvrDxl0KwTFDlkd17mCijWzFUobmpGv8d2ilCSvhfkAj22
 8+nTnkzsd3hRsem/RQ177SuvZg1xQ==
X-ME-Sender: <xms:Z7J5YWt5pdlxG4Y0Pqf4q7ODd_bNf_ATvwY_CWxQTFFW0pXQ7a8VbA>
 <xme:Z7J5YbfwJFewzUJDNDOVhvp_9h6jHbRdx6CG72_JCsLNTkCCTuAGvSRMvTXbjFBiF
 qJLw0g350zUUsskHxk>
X-ME-Received: <xmr:Z7J5YRxAE936rG_G_UzbeHl66ObDAvN-mj-ndHZr1yidyTBwPKr1bLNg_sqlRwGf1-KXofBrK81SK_3v0Pe9bYXYltAYdUsRjOEOtbU->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegtddguddutdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfef
 geeikeeknecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Z7J5YRPgfhNll4dkBqEpBSe5mOO9kNxCweRLxixDdUovvMCz1mqVdA>
 <xmx:Z7J5YW8-HpLxBHTtdzBDJ0hn2Hw79GQdM1sfntgFtSy9HZb9aP79sQ>
 <xmx:Z7J5YZXrMrQB4mEmQJVQ-nTg4gwgf4dhgzvMHagEpje6ADTp5BZAZw>
 <xmx:aLJ5YduGw0Xhvfncj5Vkk_cipbbbtRzb3uhUYMzyzUHDJ7eHL1LCR3D2lIs>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Oct 2021 16:11:18 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <maxime@cerno.tech>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Tian Tao <tiantao6@hisilicon.com>, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, John Stultz <john.stultz@linaro.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Chen Feng <puck.chen@hisilicon.com>,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Xinliang Liu <xinliang.liu@linaro.org>
Subject: Re: (subset) [PATCH v6 16/21] drm/bridge: sn65dsi86: Switch to devm
 MIPI-DSI helpers
Date: Wed, 27 Oct 2021 22:09:47 +0200
Message-Id: <163532324664.18245.7004780046171645998.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025151536.1048186-17-maxime@cerno.tech>
References: <20211025151536.1048186-1-maxime@cerno.tech>
 <20211025151536.1048186-17-maxime@cerno.tech>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 25 Oct 2021 17:15:31 +0200, Maxime Ripard wrote:
> Let's switch to the new devm MIPI-DSI function to register and attach
> our secondary device. This also avoids leaking the device when we detach
> the bridge.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
