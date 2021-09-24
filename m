Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA79417A23
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 19:52:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562116E207;
	Fri, 24 Sep 2021 17:52:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D2B6E202;
 Fri, 24 Sep 2021 17:52:42 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8C51B580AAF;
 Fri, 24 Sep 2021 13:52:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 24 Sep 2021 13:52:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
 ia436QPCukpfxP72nPmcx/c50Om/OFsQsCGFgGOE5x0=; b=qfDZXF9XFVLH2kBV
 jwCFwZz9fytyawMMpRl6N9m656bSn//DpMQn177Kq4jOdas+fyeuilOfyEkfUA9h
 A2nmH+ID3O0UNA7IToIhDd2CvSsMZ7d2O8Mw2A3w3ytf67FbAAfMArF0EML/fQPd
 Z+T23V2FOIn88S3tJ1TG+4BTJCV0YhIwDmON2cRI5Ud18fRrA2xYEJel3KbkGL2I
 Do3X/IWg82cMZReessbgYGjEnx76vAGiLauu4g5prFVI7L2V0kTpoTkhGTa4ovSn
 jJgnJ3GuTIvFFTJ6+Ke6Nys4roI8/AqdGCVZe9Te+tNrd9iwBSCma5yGLl71CSek
 XpWbHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=ia436QPCukpfxP72nPmcx/c50Om/OFsQsCGFgGOE5
 x0=; b=Z8zfTaLJBIfSqXl9gEWUU4QveoQs4RItz8MXyq5Lc/VPcLKWCsSgDBdv+
 t7T7DarXQhz1wUiC5cuWYOFIsm+8iZLqOtjpYKbFqoZXhkba7IGkqx86edM3jvRK
 wEEldiWeMjj2eGwWdNcD3hyJ1ossuPxXHVMEJkFmIkEuOsxAqBl08m5PSPmmbmvK
 nFVfzmD0W5CtvRmw230sPB/FxV5ZgeXjLLEc4orUd4cA2wM/sypekCnJU8IL6nNI
 EGzgaYwysQ/MGg80WuP/zeIJoA5vdc71PafwzNBSQtVDhWR4f9xmzOBXS++Br2Pt
 RFje4wJaHpeBjtV5R80d44sdAOhEw==
X-ME-Sender: <xms:aRBOYRXl88JwEZTJlfDMoVnui6mcXiyZR_xpLWG4XgKEsfQcZdi84A>
 <xme:aRBOYRmE-86kfulVoUlNKbpkFmLN1_lLWCgjacEON6KSp95brjjTIO29KYiO_t92K
 ES7xLlREfcQlPY2PLU>
X-ME-Received: <xmr:aRBOYdYMMob4wTDeFGncBCRomRi3xaM5ICUOPvm4d2_nFmqVSxgqK4czKv3qcYr4YVQQ6KXdLi_97a7Ih70k8XyT4Y9CznueEdRZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejuddguddujecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfef
 geeikeeknecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:aRBOYUUnA8m6msACFO0__nrETWTT4zzOxptFHzvUuEBFsG20kqp0vA>
 <xmx:aRBOYbl6f7F9lx1FehzTwCgF-LxZeKT8io3j8Qk9Qc2FLPfT1wY51w>
 <xmx:aRBOYRcT_CzWAsFz1_4VZGxv7REtgaLeFj1kJHrq8hhpQDriYXh3aw>
 <xmx:aRBOYV2XkAEOpb1mcGAbfACPKUckfPDTgxuu6NoM1osv9faLJkESwA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Sep 2021 13:52:41 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <maxime@cerno.tech>, Jonas Karlman <jonas@kwiboo.se>
Cc: Chen Feng <puck.chen@hisilicon.com>, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, Inki Dae <inki.dae@samsung.com>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 John Stultz <john.stultz@linaro.org>, Sean Paul <sean@poorly.run>,
 Tian Tao <tiantao6@hisilicon.com>
Subject: Re: (subset) [PATCH v4 03/24] drm/mipi-dsi: Create devm device
 registration
Date: Fri, 24 Sep 2021 19:52:27 +0200
Message-Id: <163250593261.1360097.490110278052393529.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210910101218.1632297-4-maxime@cerno.tech>
References: <20210910101218.1632297-1-maxime@cerno.tech>
 <20210910101218.1632297-4-maxime@cerno.tech>
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

On Fri, 10 Sep 2021 12:11:57 +0200, Maxime Ripard wrote:
> Devices that take their data through the MIPI-DSI bus but are controlled
> through a secondary bus like I2C have to register a secondary device on
> the MIPI-DSI bus through the mipi_dsi_device_register_full() function.
> 
> At removal or when an error occurs, that device needs to be removed
> through a call to mipi_dsi_device_unregister().
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
