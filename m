Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EBE43D23C
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 22:10:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33DA56E8E1;
	Wed, 27 Oct 2021 20:10:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A29D56E8E4;
 Wed, 27 Oct 2021 20:10:33 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 823562B0145C;
 Wed, 27 Oct 2021 16:10:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 27 Oct 2021 16:10:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
 SfHFdmNUMEROr2FnpySNzZN1D2vhf81wn9oDxHs1jZQ=; b=TMwmqbZURILCzJj/
 Gms9REb1eqUaLgGKCOT76iLE+3kpKO6ZtwRGHQRYi9wtcWAJ/4mCdr7fOdkglzNt
 dJh6gDvniTW1bRBkH1/LtTAGlLg0PMqjIdg2OMaOiBN5Dz/D4jnSb/dPieX4LNB2
 JNDicOwoxrlW6tFD+xMONXpEPEfoLU114qRJPC7Gx9HAaQB/aFyAH+ikLDdb4tsv
 svw9la86LA9sIklhMZjEgNa35jWWjfGBzEwPZuknMFErcUcvZp7SlbNarG1QXYpA
 mKonZOQleZa5uUE5D2GG7fo+moDwJCaRknaP8PhRnHC4mdTy/cr8cdzyiN8tKF2z
 ZfnKcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=SfHFdmNUMEROr2FnpySNzZN1D2vhf81wn9oDxHs1j
 ZQ=; b=Kn2orcD+wnIyhwLT4c1kGJiMPpl7Pv0J3bIAcOnWDKSsvcTJNarTTxToq
 UFj27FeqJNhi1mt4TVJXzqxXbHIHijW0woiXXfNf5aDku5FBnS9lCfofjMgFXwE6
 1EeGsIFaxLuxz+DOgND2fralMo9UWr1OTKffMcFJVANh9fY5NqJ03hK9X5xc8y8y
 7t+OGLUtenxawAbsFBiSQTirmRYG5uaBIWzwBsdygbe0YxdgVWti9CPK4HRkH9+I
 jJU6JkPuxsS8UC3GPC9s06wfnk98Gc9W43fcOpUEJCrunksDcDYFNukIAqMRjzNM
 2cXKV3gJ4nI+faOre+KFKg9YIpwDw==
X-ME-Sender: <xms:NrJ5Ye3zOpWLqHQwY6nH2mnmjEuvU2RTCP8Ehu9c0csG_YlfaGdwpA>
 <xme:NrJ5YRHmsi0ml1Up0itVrudrFMEjjVMn8Odt0hAAG3zE73na4FQecubgbknLesumT
 oWE89LDT4-L-XVxons>
X-ME-Received: <xmr:NrJ5YW6T6_xBP_utLHXIFQL1ea4bhBuW58_5NRoo9T_H5UT6Kqalq_SW5T92AEmr5GgbCIGKr-LT9j6HxfbZp_lUmmAIkDcTVmEhUahP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegtddguddutdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfef
 geeikeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:NrJ5Yf0FDun9HIPsQVIo_xiZ6ZrO30SUjoPXefZM30tlsa9mk9xJPg>
 <xmx:NrJ5YRGf2ftUDQ615IVvJZl_J0oRlVu7O9MYYjemCzrNtaf-3sET8g>
 <xmx:NrJ5YY-cJKOabhifB-f33lnPGx60Mk9HPneErEIcXi2F2SrMdYsABw>
 <xmx:N7J5YdU806q_JJfyjt1w03-_kl0HlOa0hmhvJKbflUpJJSgrU8ZRuEfatHQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Oct 2021 16:10:29 -0400 (EDT)
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
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 Inki Dae <inki.dae@samsung.com>, Chen Feng <puck.chen@hisilicon.com>,
 linux-samsung-soc@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Xinliang Liu <xinliang.liu@linaro.org>
Subject: Re: (subset) [PATCH v6 06/21] drm/bridge: lt8912b: Register and
 attach our DSI device at probe
Date: Wed, 27 Oct 2021 22:09:37 +0200
Message-Id: <163532324663.18245.11634676316195271418.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025151536.1048186-7-maxime@cerno.tech>
References: <20211025151536.1048186-1-maxime@cerno.tech>
 <20211025151536.1048186-7-maxime@cerno.tech>
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

On Mon, 25 Oct 2021 17:15:21 +0200, Maxime Ripard wrote:
> In order to avoid any probe ordering issue, the best practice is to move
> the secondary MIPI-DSI device registration and attachment to the
> MIPI-DSI host at probe time. Let's do this.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
