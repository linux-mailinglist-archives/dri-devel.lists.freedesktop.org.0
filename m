Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9FA417A20
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 19:52:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB40C6E204;
	Fri, 24 Sep 2021 17:52:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A6286E203;
 Fri, 24 Sep 2021 17:52:44 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 95CFB580AB3;
 Fri, 24 Sep 2021 13:52:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 24 Sep 2021 13:52:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
 6WakdUbiWZn3GzMR84xbI52pTQWpDwrFi/U0te25GWA=; b=HVeZxJb8O3xsKKWQ
 RnV5/R/0oG8RG/TaMY3R+KnJ5yFbRPNVo+qUllpvH94M1ldM1qQM3IDEM9iKLWnX
 Uek1Kjs/od/hoiE8UEc0Uwo8M/YpU8PQ3Y6Ycx0sBn5dutKAaKchZH6Sh0bE+azl
 fU05O/cd1RyQHFutmdPrGNpxIeAQToeO84pRIn2f0Gy0NTcBx6iXtzTCXBtCOLir
 ewbtMf86mGBnB1GZ/3CXxsMIEkWAufIXZ3aN1zfFtAsD96tT1nfKQa6s0fv/z9Xn
 4cpsP4tJiEfo5zXsiyOk5UCdw7YfXj/KR8+ZYi4AJpbRXSUm7aUMBTy8NIRTpeKv
 iYIW2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=6WakdUbiWZn3GzMR84xbI52pTQWpDwrFi/U0te25G
 WA=; b=Q+aKfJtPy++1s8uPjo+8sFuHcbwlORBMHTBvCswoB+fAmoPlPfmel67vY
 fwbT9ws0SDyu593B5SQKubfwtlBUEqHsSpCD7elTw6UNxgTX5WKIJLaPuU7RyMbM
 HjQ2ESVsgUSRoQiZm1/XvA8R57icuFGeZ0SAbO66j8H4veCsil8T0Nl6zdIiXoWs
 +gFVCnhXJ8TLi8LGWTz9sDpn2GOvbaAtoTn+Uhje5g4uaBCJFcTCJeHnBgljxy9s
 U7p95lczoL3urNNRU+0XI5rGlOSfxsiaJE0tirrKm1YdCw28MZyT6pjHG5ZQYX3C
 oavhIRbE+ibbV56H9knMU1+cppBcg==
X-ME-Sender: <xms:axBOYRYFp65S3kOCqLkX-niuf9AB59jv_2PvFxdT870eLRNYytZblQ>
 <xme:axBOYYYK7Xep3kKFPd4Jxld7y5lPJdLAggx-7l7O-RqXKxmbVkMKSJ1cRtMXtW-m5
 a42r_mwck4IihZGWGc>
X-ME-Received: <xmr:axBOYT83SuZLqhNGGhAmjnA-j6qRpRu4EGUIctdTA6ZZbGt6J-sPW6iWK0kjdouwOjMP0hsBjYKHgRfVTdmNDAOYCetgQ-TfmXwD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejuddguddujecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfef
 geeikeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:axBOYfqLM5ApJWRxBG4jr1q5rzcZTrOiP4RdjiWl3ezeacMGLAAIqw>
 <xmx:axBOYcr5cMixnh-gL5fsHpBuT3AcnXKZM_pq9I4P_dy_9jp4obMVAA>
 <xmx:axBOYVRzpMseIUgz_7WGO0wDfiZFnDCAL-NrWiKF9WPMlY0Gr0Kmzg>
 <xmx:axBOYRraZlZs5TzL2DS-xcECl77MeCbn-411XUq5ILC44LV7tsYLdg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Sep 2021 13:52:42 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Jonas Karlman <jonas@kwiboo.se>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <maxime@cerno.tech>, Sam Ravnborg <sam@ravnborg.org>
Cc: Chen Feng <puck.chen@hisilicon.com>, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>, Rob Clark <robdclark@gmail.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 dri-devel@lists.freedesktop.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Inki Dae <inki.dae@samsung.com>, Xinliang Liu <xinliang.liu@linaro.org>,
 Sean Paul <sean@poorly.run>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 John Stultz <john.stultz@linaro.org>, freedreno@lists.freedesktop.org,
 Tian Tao <tiantao6@hisilicon.com>
Subject: Re: (subset) [PATCH v4 04/24] drm/mipi-dsi: Create devm device
 attachment
Date: Fri, 24 Sep 2021 19:52:28 +0200
Message-Id: <163250593261.1360097.8686151745001327070.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210910101218.1632297-5-maxime@cerno.tech>
References: <20210910101218.1632297-1-maxime@cerno.tech>
 <20210910101218.1632297-5-maxime@cerno.tech>
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

On Fri, 10 Sep 2021 12:11:58 +0200, Maxime Ripard wrote:
> MIPI-DSI devices need to call mipi_dsi_attach() when their probe is done
> to attach against their host.
> 
> However, at removal or when an error occurs, that attachment needs to be
> undone through a call to mipi_dsi_detach().
> 
> Let's create a device-managed variant of the attachment function that
> will automatically detach the device at unbind.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
