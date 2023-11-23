Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 335487F65CD
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 18:55:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E4F310E127;
	Thu, 23 Nov 2023 17:55:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA8C10E002
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 17:55:21 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1r6Duf-0004l4-I5; Thu, 23 Nov 2023 18:54:53 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r6Duc-00B5eH-W8; Thu, 23 Nov 2023 18:54:51 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r6Duc-006rAv-Md; Thu, 23 Nov 2023 18:54:50 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bjorn Andersson <andersson@kernel.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 0/3] drm/bridge: ti-sn65dsi86: Some updates
Date: Thu, 23 Nov 2023 18:54:26 +0100
Message-ID: <20231123175425.496956-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=789;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=UdqEyKWEhB8vKQSCQi5bxn4ek8oRwGkHlU56smh7UHQ=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlX5HRsQYySQSCSAHNfK2CmA13+F2cJ+FulOqBe
 R4zLWzONp+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZV+R0QAKCRCPgPtYfRL+
 TpsvB/42O7eajRHJVMezMW+o+JvV9MTWg5kAauLp/oRTgOMm8QK5N1ZL3xXH5/7Gmh30nusAQ8f
 tLpRV2sGJIir7g3lFTQrtCQEc2Ru3a0gSpUfBUa09QdARGtEbwqJjUQwLB3EYO2k4N8pm5z33bf
 B3KNZykAnC1/HabMGdXbf9QOmLfUfsLsQMSKJ6civ+m3vHwBq3KEJrKsvGRqSPESzChs2WNEb0f
 VP7S+d5IEnG7Ye2D+5yzw5YK/hzioGXct013UUEp2SDuBahbjar7f1qbrMl1zfnn+xxthQSweZC
 aB9exZl636sh8IO3c/lTNaSdRh4gHoz5vKLNFkoH6MDvSVKB
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

this is a series I created while starring at the ti-sn65dsi86 driver in
the context of my pwm-lifetime series.

The first patch should be fine. The last one has a few rough edges, but
maybe you like the direction this is going to? The 2nd patch probably
only makes sense if you also take the third.

Best regards
Uwe

Uwe Kleine-König (3):
  drm/bridge: ti-sn65dsi86: Simplify using pm_runtime_resume_and_get()
  drm/bridge: ti-sn65dsi86: Change parameters of
    ti_sn65dsi86_{read,write}_u16
  drm/bridge: ti-sn65dsi86: Loosen coupling of PWM to ti-sn65dsi86 core

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 146 +++++++++++++++-----------
 1 file changed, 83 insertions(+), 63 deletions(-)

base-commit: 4e87148f80d198ba5febcbcc969c6b9471099a09
-- 
2.42.0

