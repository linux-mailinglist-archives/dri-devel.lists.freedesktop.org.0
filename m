Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C02A143D253
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 22:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A20A6E8F0;
	Wed, 27 Oct 2021 20:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F4F6E8E5;
 Wed, 27 Oct 2021 20:11:17 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 4C77E2B0145E;
 Wed, 27 Oct 2021 16:11:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 27 Oct 2021 16:11:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
 ySF9JRn706s7zmRIoAf9tZWmKkEHJFad5JFYbmq8svk=; b=CQasF4dn9WVlE6Xf
 x41OY/DkqYhJHqfcH4Ra+nyQfOM5MraojRX6kEsaZ0WgaFaZM07NsFsA/w2Fek3y
 xAA4G6iYxaY7slBDABBFE/ArcAxiQhqO4OHyCkePhFKmL79Ixm3MrrRga+BXffOj
 xjEaTb6F2gRwqDlMF1iYCcJNXS5pdmK8sIvQDHBvWRmQBsdyl5Qg/s/eUVZjmHZN
 FTWKby7+AqRhNHB/WgS6C5gdv9i6V3GfmMT11peM5hcsv57HqRM+6NcUcR/mJ0E5
 OAuzcegix+VhF+zpNir3DahJNi4tI9PYkU9pLzTk8sT50cu2aZYLPc3P4pG79p5q
 6ouKWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=ySF9JRn706s7zmRIoAf9tZWmKkEHJFad5JFYbmq8s
 vk=; b=UkLeJBWJESrGwVMNXQVn136H4VkMX2VMKLdDV4+o1nXMo/v6+7GSKujIj
 eeufa5rMuhWb+5NitvkJ8PL9U12hQW7RGcKDq6u226Gj+0WLcbuweExSQmOHnf9D
 IYENqGY+biQ4ltOByDnyjyY5W0V/zcQsjmfzkRJ070l6gqIHMB78qBhy5Q1noNs7
 9IO8vNvtc56WsI1FcgErnuHXmniXkjEAYBnVp9dJxRfF1W0PSMztgjxKnCTDHRmO
 eNSy2Sh/yuropT+QelfREAGVJ8YkhZzsoQI1ozOcdkIZJ+h+Zz9d/MbsVU910kmK
 3yPp9dJmeLeJ1IPaQSPSHgrLrWJ+A==
X-ME-Sender: <xms:YrJ5YeRmhzm4AXbDfo5tgonAyH8Ng8pSOsz7-HBjXhKeMyPTDZEMqw>
 <xme:YrJ5YTzDPf_oCqSD8JDG9Qyt_R9ydfrmzP3IMvSHKU6-9GlR5w56vIXrX7skVUGq8
 yr8DxKGyWdfnsfbLgc>
X-ME-Received: <xmr:YrJ5Yb1gZCVLt1eJkUIjxQM9AnObCiEwdgvy_4dzI9pDZAdlsXNhbJdn--K-7tdK9X9eTPeLSJL7VotuLQmodeGFHivvQYP5-obO4n8V>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegtddguddutdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfef
 geeikeeknecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:YrJ5YaBqxnNlYUDHMQ7wdrp8fbfvQGtRuoU2IHVZDowXAcUk-BAmuA>
 <xmx:YrJ5YXjqCte8JJNJ7X6VpOHKR5XfF6abeYH4uvNeTscr3OBJAVGd-A>
 <xmx:YrJ5YWpB1BXLc2BlWcJsrj4ddzqLFdkDAMkHnD1Vu7EHMwEVaYfaug>
 <xmx:YrJ5YdMEfeCcUQAlfHckZDg0WyO6HquNWFv8KyopwdnsxzDpkJyFt6PMz7M>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Oct 2021 16:11:14 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Thierry Reding <thierry.reding@gmail.com>,
 Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <maxime@cerno.tech>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org,
 Tian Tao <tiantao6@hisilicon.com>, Rob Clark <robdclark@gmail.com>,
 John Stultz <john.stultz@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Inki Dae <inki.dae@samsung.com>,
 linux-samsung-soc@vger.kernel.org, Chen Feng <puck.chen@hisilicon.com>,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Xinliang Liu <xinliang.liu@linaro.org>
Subject: Re: (subset) [PATCH v6 15/21] drm/bridge: sn65dsi83: Register and
 attach our DSI device at probe
Date: Wed, 27 Oct 2021 22:09:46 +0200
Message-Id: <163532324664.18245.6918999551451173330.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025151536.1048186-16-maxime@cerno.tech>
References: <20211025151536.1048186-1-maxime@cerno.tech>
 <20211025151536.1048186-16-maxime@cerno.tech>
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

On Mon, 25 Oct 2021 17:15:30 +0200, Maxime Ripard wrote:
> In order to avoid any probe ordering issue, the best practice is to move
> the secondary MIPI-DSI device registration and attachment to the
> MIPI-DSI host at probe time. Let's do this.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
