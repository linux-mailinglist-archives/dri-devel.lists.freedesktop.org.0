Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7925754621B
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:29:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25DDD112394;
	Fri, 10 Jun 2022 09:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4EB9112394
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:29:32 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7FFB55C01A6;
 Fri, 10 Jun 2022 05:29:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 10 Jun 2022 05:29:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853370; x=1654939770; bh=ym
 BhDJF4q6mehOBaWADfPA4QyEuYhC+KMn24ivptCcs=; b=v2Krq3oor+zaSafzJu
 qPh0lOEtprTmUlRU/MVfLGlVL+OsW+ZtFR1xXcEsXqxeNnlGW+5mtN7+Bm46Avcu
 R/GKbntFWZ6zDhqC7muy7mrATO0ptOfFrLnwY3wzHz0OTM/Aj+xhcDRSYGdxMgw/
 9PE//+KlJvnqt5KtlZCKafFYyDK3c+D8tu5LW0QRNLEWckELapu2zjmAWa1khsig
 TUlS9R5ePMOR02v8aXAGerCdS7I1OiR6dddctMR0zTfhu+s1x23d4+mbHVz9RIV+
 1sAi5DB3cG25E+kOSHt2odWpKiJpIKCuEvhL7xsBGniC9eZtU3jr/iREgP9oJ+Kb
 LvpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853370; x=1654939770; bh=ymBhDJF4q6meh
 OBaWADfPA4QyEuYhC+KMn24ivptCcs=; b=fbuWFpuhGavo6F9kjGmR6nMsAPx/K
 /myC4pcE8ARKIH/N9rs3Srp/+kMrvsSngfx9w2juwYWl7Htv+jx2r5zb06j3M6F3
 z7RNsbflWqdRv3kfkuwsck/wUJdAES+C1tenVShh+lZAcxb/xRCtL2SJpHufNEdb
 CCG8vKsGAhSFagYEVb/WPSD6TazjQfb9g2PrC5CszWpjJ6LgQaLfeR8ZuNCop8QK
 CxyG9ZiP/YeG+YgBl9paBfy2plQmDiY/TEdMooMx736AK1vYtNDZ+jPztmzqe5Hw
 eXmDvgQJtLlHz7H/H/izL/C+yS+4V7UJ608NSCIOL9nvUn3Znge9xTfvA==
X-ME-Sender: <xms:-g6jYhvIOtKwHmrQZZYfP0_3sGV9O56LjPOK1L-QIWKLPcNgEGVnyA>
 <xme:-g6jYqeRqX1FxPp-RViinTg1THi-oncanscW2qCTmaBnklzuyFF-vfETXfJOhg8a7
 3e27suJ9VhJ-2UmNDw>
X-ME-Received: <xmr:-g6jYkxmY-lzyXGgTgNx8X2ZCycmroZ_NC8G7zf7OqfkkFYR3lX5T6Xqq53vsYcdp-dW8oorKkbrgkUSLKIi_i6w2_WAhspZHuMk2p0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:-g6jYoNCLiigrBCYKIfSUUY-Vh3J4ZoZ-BzyLViNqYq2N3nKecuRNw>
 <xmx:-g6jYh_Ie9JhvAH84HUHo4ZinPARdVkLgo4EgSDYlczyArGvGM3b7A>
 <xmx:-g6jYoWr-rNx9SD-8CKbCH3KvqhRhAq1nII1kM1GfwB_-YcV6CS62A>
 <xmx:-g6jYtbDxkcw0pYVGDzEDyddVwczOPGjkFnOcBhElO8_0gtcn5NYSg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:29:29 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 01/64] drm/mipi-dsi: Detach devices when removing the host
Date: Fri, 10 Jun 2022 11:28:21 +0200
Message-Id: <20220610092924.754942-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610092924.754942-1-maxime@cerno.tech>
References: <20220610092924.754942-1-maxime@cerno.tech>
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Whenever the MIPI-DSI host is unregistered, the code of
mipi_dsi_host_unregister() loops over every device currently found on that
bus and will unregister it.

However, it doesn't detach it from the bus first, which leads to all kind
of resource leaks if the host wants to perform some clean up whenever a
device is detached.

Fixes: 068a00233969 ("drm: Add MIPI DSI bus support")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index c40bde96cfdf..c317ee9fa445 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -346,6 +346,7 @@ static int mipi_dsi_remove_device_fn(struct device *dev, void *priv)
 {
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(dev);
 
+	mipi_dsi_detach(dsi);
 	mipi_dsi_device_unregister(dsi);
 
 	return 0;
-- 
2.36.1

