Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C2443D22C
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 22:10:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D726E8DF;
	Wed, 27 Oct 2021 20:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 726D26E8DF;
 Wed, 27 Oct 2021 20:10:15 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 4AC9D2B01443;
 Wed, 27 Oct 2021 16:10:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 27 Oct 2021 16:10:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
 YqIG4beLHrKx2CQYEuFvUKIZ7msOpNzgMgV9uXujSl4=; b=JPaYoJmDyFt4LAW5
 UW8XK2yNxeyth4ohEWgYJiwMB7bN93KdKvGV7HiIHIbxcdIEY8fgXXFNQ2srQL0w
 M9f/1RQjW812tV582xmcWg/lgpFEExFe/Wx3FCp7eHcfXymIEOZp/bxWcB5fJOk4
 GsJs2rHjCONcCLejbzbV060lUCvqpubrhGJkXPSNSeQRcG3oCdWNNPZEjU3bXJJB
 Ck0FTh1uEXzWgcknI4vX3+AJDaCnzY2d/ixZRAjsuICOht9EPEhpux1+v5N/d2+J
 nKWa2nnbqC9yg2zcYPFvyCKnr9Ca2Je2fwY3z+NknHxAM2OGMnMk7MAk7O1b4SI2
 F1sKVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=YqIG4beLHrKx2CQYEuFvUKIZ7msOpNzgMgV9uXujS
 l4=; b=kM3sr5JrdtgfWr80u8NPRJbSQxOEq2ZVd7+Qo46+OaaL72LoWZ/Tl5Imn
 isyxsHl6JRGG67Fvv4RArW+9I2KSi2hDVG4uUmVTdbR3bXtFwcqrPG/wI91gbloz
 KuRxIsKdWIO+c/zc81w9t65x4m00rYcjKnqJHChXVrNDHJQiG2f+WqJjrXG+TAjl
 J8P+zBxiAZVhuly70sTwvb/ktIw9t9aBGb5Ll0mWZ1Pomt7Qz4wmXfzW3HhG6Uo1
 F5jWnKOafv/26VkkJAw1IusjCKFFxS67grukVYDR5zg6EnmYkGxqZQWz3x5pfp4L
 k+cOIctTBSKXp0CfqyLplJUA1WJIw==
X-ME-Sender: <xms:IrJ5YezcmEYjJR0YB08eZj4xGSaM7KxS58qLKkNiOm4xX23bDWN0aA>
 <xme:IrJ5YaQ0GP8rn6baOd9WT4LG7wsgT8P3DFn-Nui4LoVqRSRcEd8YHSEfqNOMQ8NvL
 71vKni_WLhUKAtfQvA>
X-ME-Received: <xmr:IrJ5YQUaKhP6wdb4DXq7NTCFPot6mmhE1idOUAVsBCOGYj2Zj_JVvfA4C2yQOSQo6Ake8rkJxzSMlyRi9qPeZFozRAM_nxMAe3d2DK0k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegtddgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejuefggeekfffgueevtddvudffhfejffejjedvvdduudethefhfefhfeeg
 ieekkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:IrJ5YUj-zJPXIUI3Pf-5ysWyFurX5DU7gYmpA4jYWvv9Bwh3-L1slg>
 <xmx:IrJ5YQC5YDHrlRE7toPBaZ_bkq46chPNqw7cwVIl6vENh7ZDRRqhKw>
 <xmx:IrJ5YVJhS_lwooZzOid3qrpFvxhIwKXjgd0JMaFBK1snaed-zNU2ow>
 <xmx:JLJ5YRifQiIMsARLIgycOfAXFqgzC_8kvbbYzXebOg1s8I8g9iQbOfCaEcs>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Oct 2021 16:10:09 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Thierry Reding <thierry.reding@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <maxime@cerno.tech>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Tian Tao <tiantao6@hisilicon.com>, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, John Stultz <john.stultz@linaro.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org,
 Chen Feng <puck.chen@hisilicon.com>, linux-samsung-soc@vger.kernel.org,
 Inki Dae <inki.dae@samsung.com>, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Xinliang Liu <xinliang.liu@linaro.org>
Subject: Re: (subset) [PATCH v6 03/21] drm/bridge: anx7625: Switch to devm
 MIPI-DSI helpers
Date: Wed, 27 Oct 2021 22:09:34 +0200
Message-Id: <163532324663.18245.11170472647174710257.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025151536.1048186-4-maxime@cerno.tech>
References: <20211025151536.1048186-1-maxime@cerno.tech>
 <20211025151536.1048186-4-maxime@cerno.tech>
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

On Mon, 25 Oct 2021 17:15:18 +0200, Maxime Ripard wrote:
> Let's switch to the new devm MIPI-DSI function to register and attach
> our secondary device.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
