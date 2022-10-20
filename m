Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B91A0605A52
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 10:55:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C7610E171;
	Thu, 20 Oct 2022 08:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F02310E171
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 08:54:57 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id BA5DD320091A;
 Thu, 20 Oct 2022 04:54:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 20 Oct 2022 04:54:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666256095; x=
 1666342495; bh=4rvEUQHLinZ953Ckv3ZJXD6IyGHy1Sk4CLCkqVLAxEU=; b=D
 UiAoNFpq/zMh/KcAuKq6hx8HnZpGUrA83W8LCgBpABcuhHLwMW+VPdiXRcLvZnpS
 kUIS42PN+0rUBMuX+qJt7+R6AiVLCRbl1JnZtVdZMvXqlCPtn1HXGbHfwqIIr7eD
 Z9D1MPgqkqsgAH2i2UczWDX2SYbCVASOEZUh3BOgIFvC7jmAKF5I2TtbXwVl9QI7
 ji/1BtizzqC+y333ycsbbwGyR0Vod3glUEHFLOAw9xdOZJ74wlZ9GEiKz+1b3Ioj
 mg1vUC9U8L2paSM1AhZ78g/iUa17kQdVneYj88rlm60yX9A+TjoqrHotI8J1Dtxw
 RMiOA/aGdlnZtQE1P9J1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666256095; x=
 1666342495; bh=4rvEUQHLinZ953Ckv3ZJXD6IyGHy1Sk4CLCkqVLAxEU=; b=C
 yzc0lptJ2ypRWCBr68xcMVb+1YZlQwES2HzomIP+jpUz/1jSygPVG+a8whHB7ltd
 OxPNF7ptcYVNCa5CO09P1SucNnfStUy0LYkZ4Lq42GbtKxGy7eIDI+KgIKMDmhJ4
 ve1W9AE6dWbn/MGolkd8PjLUl2n3UekQo20/ckj1FOwPSHqkfmecQpnFXv9NsJnD
 VpHpcyyOrfMAnlSAUxVxt6deYRUAa9gw39O/lUyEz2aEYbMD3ao6EboYjdZXZOvj
 hmm+FBxLUwjDaLRj8Q0fm/qz5Hk1kf0V7MY1rMBpL78NfWR41TKMBxaWvfDj6FFz
 B5uQ4X1EC8PwKpw2+K3xQ==
X-ME-Sender: <xms:3gxRY_jOGsc34QE1MnAiVFxsp9l6x-bFyilTbVKHqScg_exKwvxa1A>
 <xme:3gxRY8AL8wBBPNsBxJGi_tiYKP2rxEvSsLtcJdxrtPmguq8XawVzMjiUHWW5GnuBY
 rye-Ae2bUDacgwplc8>
X-ME-Received: <xmr:3gxRY_HYahC-JfOCsw2sfm8x75ZywTyVLqAw6TW2Ar1RCdJWm6NKksbvBL5QcC9loB4uLVuKzT0_OwkXh4J4rakfam4N5G9Op-Y3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeliedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvegjfhfukfffgggtgffosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepieefieeglefhheekledtteejteeuleetueevkeeuveffudehffefhffh
 hefgheeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:3gxRY8RQdj3aaW_aOdmVKbfrHOODf-cT0bsxNvlYia4OBozE0N95xg>
 <xmx:3gxRY8w_5CAnAJg9yhrvtooJRMhhIxqz0E38MqCD4hgcHqr_UJpLyA>
 <xmx:3gxRYy4Od0upy9Sfdkd99ihS3EXN4dwCOKkKt3U25fYy2g57vl-Nvw>
 <xmx:3wxRYxpdShsekcBAL5MisRpwJ17ZcFvmw01bEssBh_wV8zbrBriwyw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Oct 2022 04:54:54 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <maxime@cerno.tech>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Daniel Vetter <daniel.vetter@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20221019143442.1798964-1-maxime@cerno.tech>
References: <20221019143442.1798964-1-maxime@cerno.tech>
Subject: Re: [PATCH] drm/connector: Set DDC pointer in drmm_connector_init
Message-Id: <166625607017.966723.7501590694333464840.b4-ty@cerno.tech>
Date: Thu, 20 Oct 2022 10:54:30 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 19 Oct 2022 16:34:42 +0200, Maxime Ripard wrote:
> Commit 35a3b82f1bdd ("drm/connector: Introduce drmm_connector_init")
> introduced the function drmm_connector_init() with a parameter for an
> optional ddc pointer to the i2c controller used to access the DDC bus.
> 
> However, the underlying call to __drm_connector_init() was always
> setting it to NULL instead of passing the ddc argument around.
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
