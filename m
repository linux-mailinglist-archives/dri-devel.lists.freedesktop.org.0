Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 753DF6A41A7
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 13:25:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0144510E3E8;
	Mon, 27 Feb 2023 12:25:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 004A610E413
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 12:25:44 +0000 (UTC)
Date: Mon, 27 Feb 2023 12:25:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1677500743; x=1677759943;
 bh=KxHXTwcaWXDVnXnSrUQ1EYBtmv+MOnvxpIZ/dNtSQkk=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=ZW9U5WWFYh6iBCEcCt/2ZCjnXsd7/2+S3RwYviS/7zHfCTplhIxv6RcTvkwAAUuV6
 e/ZiYQtimgB5VwjQ95AwxPsOQDc+pXrPYFHAUfJ1/c5dJgP37ssybm9+D/ixGrHhaf
 QLa90AG7uxzgWPJwGe+zrZ5z8I7XWGSV5yXXa8APG8kl7MZpTnFHETs/sjhNEILf1c
 IIzdi3kv+p+uQ7KX5a7436SV3M2gysurIQFhYU2ABWTnixIIqjf2dcFrUMo2AkI+G/
 DFrckquM98lrVXPbL/rriuohBfFDIiKD9bnjd96ygpBwr7HqhnYN6GOPGbKLsgOtJd
 DEHBRyNjswe1w==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm: remove outdated doc TODO for subconnector property
Message-ID: <20230227122522.117580-1-contact@emersion.fr>
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

This is already documented under "standard connector properties".

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
Cc: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
---
 drivers/gpu/drm/drm_connector.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connecto=
r.c
index 65a586680940..16a21de15074 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1598,7 +1598,6 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnector_pr=
operty);
  *   - overscan
  *   - saturation
  *   - select subconnector
- *   - subconnector
  */
 /**
  * DOC: Analog TV Connector Properties
--=20
2.39.2


