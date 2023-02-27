Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CF26A41A1
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 13:21:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2929610E02F;
	Mon, 27 Feb 2023 12:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45FFF10E02F
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 12:21:25 +0000 (UTC)
Date: Mon, 27 Feb 2023 12:21:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1677500483; x=1677759683;
 bh=2gsijHGDwrnzALzF+7cosJfnlhNwAE8islUZrpoNIME=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=DfoGID6NsisJFQGFeUrgDMG6ijADvlFgsXkiWzc89YWhVWLHeef8eIYi1rR5K75f6
 rr+l8TaMUv3Qe0cb6eq2dvv/gcb8PcDSzzpDs7zj/QSXopi0AfDhwEJGNzVMCqwR1X
 uyFolXVzG1Lr70J+1hOHW7y2SVw8YC1BadLEu3oYdx2+xyNUnZi2/uI3jz1OTDSagl
 aDZUaMt5gHu+Ccl+8K30pEdL0TyYOIG3UdLBEFLMDrPWsfybsI/yBiKglEgFbhPFhB
 NAwRP4kBdTU2CdZHpccwAI3FQxHVOb29LlFzy2hvKySjme5AIWIHuP7ySC3QPYSwoK
 A7b9e7HI3+sXA==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm: document TV margin properties
Message-ID: <20230227122108.117279-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>,
 =?utf-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add docs for "{left,right,top,bottom} margin" properties.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
Cc: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
---
 drivers/gpu/drm/drm_connector.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connecto=
r.c
index 9d0250c28e9b..65a586680940 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1590,10 +1590,6 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnector_p=
roperty);
=20
 /*
  * TODO: Document the properties:
- *   - left margin
- *   - right margin
- *   - top margin
- *   - bottom margin
  *   - brightness
  *   - contrast
  *   - flicker reduction
@@ -1651,6 +1647,16 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnector_p=
roperty);
  *
  *=09Drivers can set up this property by calling
  *=09drm_mode_create_tv_properties().
+ *
+ * left margin, right margin, top margin, bottom margin:
+ *=09Add margins to the connector's viewport.
+ *
+ *=09The value is the size in pixels of the black border which will be
+ *=09added. The attached CRTC's content will be scaled to fill the whole
+ *=09area inside the margin.
+ *
+ *=09Drivers can set up these properties by calling
+ *=09drm_mode_create_tv_margin_properties().
  */
=20
 /**
--=20
2.39.2


