Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 173BF756400
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 15:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3272A10E243;
	Mon, 17 Jul 2023 13:13:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3769D10E258
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 13:13:23 +0000 (UTC)
Date: Mon, 17 Jul 2023 13:13:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1689599600; x=1689858800;
 bh=BgHYcfI/OdkCVJ+9YqDXLHYNiN1Ru4k9bujnCXL11M0=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=ljRyQnn8KPzAeySdZhBUYcM2NFDaqmS6hPOpWqwrLeonNbAK8rcpFWhHgLAuFs2gC
 WQNXHDtQlNQZ8th18igUWU8kjiBeg6ppPdyvoaggt3LELPIdZ9hYUgbN1HATwayb7k
 PgLtYpzWX0R6pmNGCqwpMAEC4jaLtnO0V3WWY7dWdgvBJy9mGbB8EtcgR+DP88iQsD
 DXlm3K3qCqPKHddqdfEyMOBideOgTvT3Vp91A2R9Ps0eKAJdRs+1tydQLcExPT6RiI
 7E5kaa2mkUdBNVVw+Phgee2RObJRrfuIppefJMyP11V1jcqKPHte9suldCbOS2Dba4
 5A3yuriAAqGoQ==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm/doc: add warning about connector_type_id stability
Message-ID: <20230717131305.616855-1-contact@emersion.fr>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mention that the connector_type_id is not stable: it depends on
driver and device probe order.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
---
 include/uapi/drm/drm_mode.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 92d96a2b6763..ea1b639bcb28 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -488,6 +488,9 @@ struct drm_mode_get_connector {
 =09 * This is not an object ID. This is a per-type connector number. Each
 =09 * (type, type_id) combination is unique across all connectors of a DRM
 =09 * device.
+=09 *
+=09 * The (type, type_id) combination is not a stable identifier: the
+=09 * type_id can change depending on the driver probe order.
 =09 */
 =09__u32 connector_type_id;
=20
--=20
2.41.0


