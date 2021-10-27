Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 215DD43D224
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 22:10:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D17D6E8DE;
	Wed, 27 Oct 2021 20:10:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B42326E8DD;
 Wed, 27 Oct 2021 20:10:08 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 3DA6E2B0145C;
 Wed, 27 Oct 2021 16:10:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 27 Oct 2021 16:10:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
 OEUnNxv6o47yZt3CaZaslEJSkBnk95kl/cfC/WP4Kas=; b=RSmgW7F7HAluJYxy
 3H1Q8msaeifG0We9dyHf/c53qYmf3BDU+qQfPNpa+hSGlmjA1RoAUEfecbpqM9fj
 uhlIWege4wu4lPPXzcbWXfGpw/NarmN/n/TP61IP1vBCFKVgW1Hk6YP2KWgfog/1
 ySYIjXfWOHt3tTll6O3oncDe2n3GS35zyaGRuP/IznecZQJ5tHBQUoNgG47Vk2UH
 TNsqxQEGcskV9Ket04l/Omu+Hb3TxO9pJbBUVPla98q6QStFyOm9WC9nEZYh8YO3
 34U53d5HLbgdcNNspO0zPleu3aN3uXyoqOY/bPoHlaYNloek5rziPvAAAdD4BWVx
 9F3fXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=OEUnNxv6o47yZt3CaZaslEJSkBnk95kl/cfC/WP4K
 as=; b=IYwgjpQ+kjq+DDfvO/ggaCZoP3jos1DUlqWuYvrhEWy1o/Vym9rzR6OVM
 ZS43FI2+zgdmo6WsQPBU8zZEqmDpFnNkBvdOV8dfCvj0TNjjv9JONeUDym9JE7hW
 k6Vediw5eQCcUltMAj7mvRHG1knsFgGlDDZjVmGekt4IDzmu0mxn2q8ZdRmrTiP/
 cEQrsUV1Wj9oYMnZom86qM0ih6I481mbei1hOEjwpBkoVqo5rzqxJbMifrxCKVlb
 Yv09rzHBpKNJLQJwvAQEz1zZmIfI0urtnQRdPepAAvdoUulTj6WEU0uRGsyMVg+j
 rQMhaz4aiyPMbLkl6Ott4dquYVA7g==
X-ME-Sender: <xms:HbJ5YUtZ_ehjx-oLK_QrtM7TCwozDxDMPiTXSfBnTHbpnubITc3PnA>
 <xme:HbJ5YReDMnUELX2h8UnYHKGV4HUrENTIFQV80DzxjZIVs9RCMDeAufWkjkLNkeo7R
 ZgI65XC6YF5ceuuWtw>
X-ME-Received: <xmr:HbJ5YfzS3ApRxnPBc783x6-hiwhudueBVQG50f9Hg8ADOgBfDf6jKH6my_C-qu1g67WijJlT4arHBTNuqKIc2ra1sJWSadHpHKw3QTp9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegtddguddutdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfef
 geeikeeknecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:HbJ5YXOpx1I_0_qG3i4zMAPLVy7LCPU1AICAOfVDRi_qNsdxq9y6OQ>
 <xmx:HbJ5YU88iM3uBGdwcmEaWfubsz4xRZ4WLTjLhb8l13LYTHLUaBWmow>
 <xmx:HbJ5YfVD64TQFyk6Z7-eU23cAhyOicGXx0T1hnH6MNSk_knVjM1ewg>
 <xmx:HbJ5YTuPb2pd08hXcdhcZXpDQ_fXkCRqEWyPsduGFf0fmdtFjEobqo3oOec>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Oct 2021 16:10:05 -0400 (EDT)
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
 Kyungmin Park <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org,
 Tian Tao <tiantao6@hisilicon.com>, Rob Clark <robdclark@gmail.com>,
 John Stultz <john.stultz@linaro.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Chen Feng <puck.chen@hisilicon.com>, Inki Dae <inki.dae@samsung.com>,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Xinliang Liu <xinliang.liu@linaro.org>
Subject: Re: (subset) [PATCH v6 02/21] drm/bridge: adv7511: Register and
 attach our DSI device at probe
Date: Wed, 27 Oct 2021 22:09:33 +0200
Message-Id: <163532324662.18245.159145989929728376.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025151536.1048186-3-maxime@cerno.tech>
References: <20211025151536.1048186-1-maxime@cerno.tech>
 <20211025151536.1048186-3-maxime@cerno.tech>
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

On Mon, 25 Oct 2021 17:15:17 +0200, Maxime Ripard wrote:
> In order to avoid any probe ordering issue, the best practice is to move
> the secondary MIPI-DSI device registration and attachment to the
> MIPI-DSI host at probe time. Let's do this.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
