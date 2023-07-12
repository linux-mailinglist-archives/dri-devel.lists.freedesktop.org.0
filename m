Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 374D2750A2D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 15:57:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8CF710E536;
	Wed, 12 Jul 2023 13:57:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5483B10E53B
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 13:57:53 +0000 (UTC)
Date: Wed, 12 Jul 2023 13:57:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1689170271; x=1689429471;
 bh=YAg7CD5tLq5zt3AGc8ufTHPVU9Fe33Xw6PxBNuCLX2Y=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=ol4LSpZ3Om94qcHZkcI6cshuOBdLqTBKfrukh0L9NsV6Xd1tweA1F5488ngPlY/0Y
 NtxPm3lw9KprFdLDYKzQmzsIHAUtHgILJc8zgdLMFol5GmQ8O8yFKxVSgWJUFxvBW5
 RloaC/bZgf0SKTzwzKI8ds0+9ZQ4jpOJ+SM+uBWYtVxo1lJFUS28lPdeZeXqXUVvqN
 9x/aGa7dnlhupgGrFaCyLcEqN+NBDJMLG6btDdhNZxQExh5rTREtmlVNdQ/uGynY5F
 rxxT0gbw6WtoAaEDJBttB6++j32pwX8AIX1uPdDTJM0ky68I806qq3yUp3g3nThXB8
 1e+4TiRMpIi8Q==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [RFC PATCH 3/4] drm/doc: document PAGE_FLIP_EVENT | PAGE_FLIP_ASYNC
Message-ID: <20230712135723.173506-3-contact@emersion.fr>
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
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Explain what the event looks like when both flags are specified.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com>
---

Driver developers: please confirm or deny this documentation. I'm just
guessing here.

 include/uapi/drm/drm_mode.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index c32b171c0ba7..cb4bbfe15d3a 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -950,6 +950,9 @@ struct hdr_output_metadata {
  * When used with the atomic uAPI, vblank events will be sent for every CR=
TC
  * included in the commit. At least one CRTC must be included, and all inc=
luded
  * CRTCs must be turned on.
+ *
+ * When used with &DRM_MODE_PAGE_FLIP_ASYNC, the page-flip event will have=
 the
+ * same timings and sequence number as the previous effective page-flip.
  */
 #define DRM_MODE_PAGE_FLIP_EVENT 0x01
 /**
--=20
2.41.0


