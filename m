Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C38417A17
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 19:52:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E156E1F8;
	Fri, 24 Sep 2021 17:52:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D4406E1F8;
 Fri, 24 Sep 2021 17:52:40 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0167B580AA3;
 Fri, 24 Sep 2021 13:52:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 24 Sep 2021 13:52:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
 5shTf/rLsmouGFJwGzkB3yCCHN8LmpUpikRSH7xC5pc=; b=plL9t1nC/q5thHvW
 GL/twB90EiNMCsNtX5yIDXCv26abgmjSrZaGmRXZnDmnhmw2br9q7sfwqSNv48lt
 6/LaKEQEnUm4y9N1BR2x0QACqLWmxjVmJX41zHnGv4eqs3Nled4TbXOYj771zYmA
 bJzZoX1ExBhJnTF2XoZe00HXIO9tQBB7j7ctwNG2ssckq7EKDdhKPcuVvqmQOlPP
 ma6sUAtNaZzdFllC4aWIr0RBckuWc4C4Hb/Bcr4Q72PRj7yVeVN0tgP9r9rcLi22
 wbhEr5HosLqd7LIwVgtUx9pZgd/wdS6MJcy8A5NMkBWdjYYIQnGFy7ncdmLiHZpA
 bGSnQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=5shTf/rLsmouGFJwGzkB3yCCHN8LmpUpikRSH7xC5
 pc=; b=AoAEou4vzIm0V5JQHTXq+/zKlptk8HeZ0Hqx4xha3bQKM2JAdkKv4AAo3
 1L7Nm2FmTJ36SLER5FxqSZOFueGFL3EYFuc9CvL9xLxT4nD+HBF4Cookpq+dhV8L
 CI5yW1EUA6XJ5Pj3RnYAjuXR/Ti0tq5EG2cXXRas4EWy58MBzEcYWYNjZZbtM9eb
 xlqKWKgFRtoInpQ0d/WRkIQdTfWIVvJqu1k6DwH6/+MOIDGC7i/602k/dFuWxOZV
 LtcumadZWallD+VJWjzDr3d8zQBnusowJ1Pkp4E1O5gfxf2SUZaCYp/AbLIRNAli
 ApGCKOu6hFZ0S+mBXKysYL2zjxG7A==
X-ME-Sender: <xms:ZhBOYWJbs4frrSuolLOwhV7P3Wxj4NPGB05KfpCxXLOZKCStZuMrZg>
 <xme:ZhBOYeIQxm2B5Xm2rfIMSgUKZJIPSs49FME0x9SqLrHcnH5e8NVIzDU55k1C-T29G
 NZC-1-OrbxBo3z0hbU>
X-ME-Received: <xmr:ZhBOYWuUODSm_xBbq_nG-5AvIEhhL4V3qxBzNuJI6pAzehJQVud4zLfhU9MjPZxVnZi70nLYZkBEQCzP96TjQPFBcFwObntZGzcO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejuddgudduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfef
 geeikeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ZhBOYba_9vJHxk_jo-SRy1-LfWRRGT_9mG6uEy9K3U487M5kzcNYGw>
 <xmx:ZhBOYdboWO-RWPc26rVb_G3pxZXK343B7spld1e1EuXH5GBnCTgptA>
 <xmx:ZhBOYXADOoSHmRsLNr4Oa2Xfu3zgHBQsiyuy1h_rV_yrUfONXC5l-Q>
 <xmx:ZxBOYTao8op5pQ94_s8FRGQX41s3k-G7kCdjGer0hPsU1j3FrgrLVA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Sep 2021 13:52:38 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <maxime@cerno.tech>, Sam Ravnborg <sam@ravnborg.org>
Cc: Chen Feng <puck.chen@hisilicon.com>, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>,
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, Inki Dae <inki.dae@samsung.com>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 John Stultz <john.stultz@linaro.org>, Sean Paul <sean@poorly.run>,
 Tian Tao <tiantao6@hisilicon.com>
Subject: Re: (subset) [PATCH v4 02/24] drm/bridge: Document the probe issue
 with MIPI-DSI bridges
Date: Fri, 24 Sep 2021 19:52:26 +0200
Message-Id: <163250593261.1360097.14194285777494289884.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210910101218.1632297-3-maxime@cerno.tech>
References: <20210910101218.1632297-1-maxime@cerno.tech>
 <20210910101218.1632297-3-maxime@cerno.tech>
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

On Fri, 10 Sep 2021 12:11:56 +0200, Maxime Ripard wrote:
> Interactions between bridges, panels, MIPI-DSI host and the component
> framework are not trivial and can lead to probing issues when
> implementing a display driver. Let's document the various cases we need
> too consider, and the solution to support all the cases.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
