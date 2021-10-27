Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CB643D251
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 22:11:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA8B6E8EE;
	Wed, 27 Oct 2021 20:11:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E71476E8E4;
 Wed, 27 Oct 2021 20:11:12 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id A27D92B0145A;
 Wed, 27 Oct 2021 16:11:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 27 Oct 2021 16:11:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
 shiJul1mQKPfcLaf/IXGlVDGbuTJtsLwoYecWRH8h5s=; b=FrOuLA6kiFULF/W8
 bOkva2AzSpC3mIna7uusOxBYJ4v3CJVsQPgnww/e+TpJDps5Pua44X6bY6R+FuVW
 teFQJjhaIMpYriTkIZqdJr4rr2r6azICTMq21WTpm0yHeonUzwItytoSeHAUUxEr
 2sjOSUDwjf1UNikW+x2X9/ZiMWyObZHyupookTwE2UV1kWxB0YSS4GhiLdHyoUBb
 SQUDV2Qird46/gy31oXhGe4BENALfu4Uh1UqTiLJQqPGgWdJfx1o5pFTAuXakTL/
 +SdtOPcr+NuTFvAN6kirbZhkpaINNPVfUNS9eSl3IJ/Iwo509kuO0Gvi7NPhrWLt
 JYd50A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=shiJul1mQKPfcLaf/IXGlVDGbuTJtsLwoYecWRH8h
 5s=; b=FmZLD8WjKEZlqCpe8Hlxi9IBe+uhtEmorOVP+jj8XIvm4JRiUa1bzNO5o
 xvyJR1BlsDNXkUFZVf+AO6aUu7Em+rALP1UQuOPzFJ9Bn76ds9F2boqCzZ/Q2+vq
 ne2rwPwkwkygHm0K4Js6Xh0pMaeuIKj509C1eOrmeFErpPjTb4R/vOZqlajIIH7w
 BR8CTdrR1CIezdPrPJVumh0NULgY3+Y8QviFzFQEHyXpmxke1L/RCllZckgosYPW
 qfRkpiQh0yw7wWAYRxieeBA58xNPQZSvUWCB5kcb0BRRMK8y8eSde89HBX987Njl
 RDThtVLohNtpVWoxLuk5l3eWlGmJQ==
X-ME-Sender: <xms:XrJ5YclaS_vptATwCMXLviGbdiTIFHr26f7BvgabJGiu0vVhqR36Jg>
 <xme:XrJ5Yb1Z6Pmaa91N7dB2hRiU5SJ1jyMlOIJ4ZiSwg2dpXeBWJT4ziQg6NE6aAT_ft
 E4EvvwzCbyxzUgrRy4>
X-ME-Received: <xmr:XrJ5YapbKsBE-zHqaP_pkbhjM6R-HrP2PRY2eDmuANP5bvVfcNTYxK_tV2XCLNKuGUh7KUPYVU5YQT8Q0rMVctcirHnKIa0q8zMt-4fY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegtddguddutdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfef
 geeikeeknecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:XrJ5YYkv_xFpRmspD8iyTGtr5-0kIhIetsphdq7a7sEZT2t5aJAnug>
 <xmx:XrJ5Ya0X7MobEXkzi0TakA5k8hKJyph9_jvQELJ5jBYVuHxWshpQ_w>
 <xmx:XrJ5YfseLt6-4PmhncYd1DE_HH1yyc0dXSDkX3s4LGW6S8mcSXGc_Q>
 <xmx:XrJ5YRDEgqC9UbGa8k3rvFbf6N70fuK8RUnzHGZ52ubD5Et1qD319MiNv3w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Oct 2021 16:11:09 -0400 (EDT)
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chen Feng <puck.chen@hisilicon.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Xinliang Liu <xinliang.liu@linaro.org>
Subject: Re: (subset) [PATCH v6 14/21] drm/bridge: sn65dsi83: Switch to devm
 MIPI-DSI helpers
Date: Wed, 27 Oct 2021 22:09:45 +0200
Message-Id: <163532324664.18245.3408176601159276611.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025151536.1048186-15-maxime@cerno.tech>
References: <20211025151536.1048186-1-maxime@cerno.tech>
 <20211025151536.1048186-15-maxime@cerno.tech>
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

On Mon, 25 Oct 2021 17:15:29 +0200, Maxime Ripard wrote:
> Let's switch to the new devm MIPI-DSI function to register and attach
> our secondary device. This also avoids leaking the device when we detach
> the bridge but don't remove its driver.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
