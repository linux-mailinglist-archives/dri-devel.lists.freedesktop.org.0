Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6535C750A2C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 15:57:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4333610E538;
	Wed, 12 Jul 2023 13:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C45910E538
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 13:57:46 +0000 (UTC)
Date: Wed, 12 Jul 2023 13:57:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1689170264; x=1689429464;
 bh=WUWnam85ns9qZ2nPTb/uIxGLMmqFSzAAl5Dt0DC42HM=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=Ev66R5U4bZWd0I8fE+VdjOmqI+QKvsbtHTYJpwcjq2pRbJuoi476ObnQfxP44Ay3a
 YpA/OHIcD4ZZeeSGWkLtyo8WwsTSR5tzZozymE/1QXX9KEltn9B7dnZI3XMLUIvs/H
 fU54NkLkpC/HvwtNC2cZhaYGNOJN/NXsv+VHAQ/jeD3CpcMK/7Cya2AbuKMcP0svjD
 9Sp77t4aSA8kmUZlLYvcBqowOSTJiLUnRAxgKiGZachF/q5PVJRKImckPpBJfOlzvy
 yKXeEg01NUsxxbDbF7BZLQDZHR0YUkhTRuCZtH/IVLzcAMdXcUpf25d9DGm5goC9mH
 CUmicYjCnXb+g==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 2/4] drm/doc: document interactions between PAGE_FLIP_EVENT
 and atomic
Message-ID: <20230712135723.173506-2-contact@emersion.fr>
In-Reply-To: <20230712135723.173506-1-contact@emersion.fr>
References: <20230712135723.173506-1-contact@emersion.fr>
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

Explain which CRTCs get an event, and uAPI requirements.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 include/uapi/drm/drm_mode.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 92d96a2b6763..c32b171c0ba7 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -946,6 +946,10 @@ struct hdr_output_metadata {
  * Request that the kernel sends back a vblank event (see
  * struct drm_event_vblank) with the &DRM_EVENT_FLIP_COMPLETE type when th=
e
  * page-flip is done.
+ *
+ * When used with the atomic uAPI, vblank events will be sent for every CR=
TC
+ * included in the commit. At least one CRTC must be included, and all inc=
luded
+ * CRTCs must be turned on.
  */
 #define DRM_MODE_PAGE_FLIP_EVENT 0x01
 /**
--=20
2.41.0


