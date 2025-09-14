Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D49B56A52
	for <lists+dri-devel@lfdr.de>; Sun, 14 Sep 2025 17:55:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC1D10E24B;
	Sun, 14 Sep 2025 15:55:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.b="XKajB0d1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic306-47.consmr.mail.gq1.yahoo.com
 (sonic306-47.consmr.mail.gq1.yahoo.com [98.137.68.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F345010E24B
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Sep 2025 15:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1757865323; bh=vM/gtEmAJoSfkWAjMw92+Y58qfB3JrZ/VALMKex+F7o=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=XKajB0d19tZw2xdBEJoee76ug3KRMH+EKeAbaYiaDArsgGqw60/fE1k2nxPb6KW52ZeuQoAi+Y8I3hk2BoCjioyukmJIp8C5ycOH1qMuGDWX/1eCtCWaSXCvkWBLWWinYI0sIwpPuaD09FHE4OMshoIXl4WGwlxEgkRupv/e4OlY/vjbCERScgbuHWyMdLT/PeAClicDU1hmsh6gYipRuCi6avF96Fva+t7ytfxBSHxcCXS9//AwF2fB1ykO2V1f5iDL0nuugnqI95T/SwPRkpbe4GUpI+riEWpiRC+rauL+FcSrpC3T1GUqxx5ZksRYGSQeu73D8vlisE8JErjmIQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1757865323; bh=l7X43ztcSScGa3WFiWf6WnU+Xe2VuOIBJ7SfzQqMS30=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=YGVVf0kYrjKc66+FRfWwHxcPoDBoim2zeK5OWHXGsGs1chMlhhc63vOXHCwPRNghVVlRrt47Q0X/imOhGYK8ktc4k4wYG0jEazAAYBO05OV+A80lYYcAwjdGxATipUAlOjQf0quHGafZx9MM8nnEVAtoVruMFEibXUMVYG4h2hhKjJYQkheHh452CguEO3/AbZ6bWVSeu02TVfqOGNfMYe9AlQbM4IW85i0M2M/Q+V6mWP8pizqdsD6sjAF+sUxjb7P7mxVGWPG06a7ZPPqC1/cvuH/1p6g7CRXPJ0qa5PEZEBqPnLiEL4rfZu3zuyMeE9ZxU2KVn7MzQYpwuYsvOA==
X-YMail-OSG: DuGrgwsVM1maqw9S6GHksCwUZ1KyeF.CnCbA2PIrzUxOZToCOnkno3GPqJK3cC7
 JdhjxchcAm9yO0FxF3mWYwxRf9ULjdA6v9MDCFwz5TQXU8QGxy3AI1OIpP9iouq5GV.RWL9lxg8v
 bOoqF0B0DtH8AjU1k.KFNPDVMaOKzG_wlVlI3MIWRmkCktqskcAhH5afE5efWvHw5NIoSxap.guN
 yMZjx5KedZfWO6j8BqW3KZyJgkod9NKg7UR4r9aJbPkBpKunRMRSp9QOstczdUCLWuUTJd._xWi1
 nLWHZhQHMbXKPfiCmU2X3zWZq8n5xAu4fNZpVwA8JZggKKpmXxirBb4iK4BLmLkulMFb9hwiJPh.
 bIJm1Eh4iLlN5wKv9YBv_HwWOifTAavdQbq.uKTXoApK1fdQzu8yPoojOLzyFIXg6z1Zw0srdMTA
 Gg4Ud9SxNSDNngTpDGnaFast0qiSc92c6.BXs7AybD_D9pLpS_7fsP54DAfW0twnUY8qBTP.1Z1t
 5DjxY1vz4azQuMjzan5XKUpGlyC7Kyueu45xXeTAy8gLCvn2B9tp26Zxy6NfyZaGXKKQDE5a9oe9
 o5hHM3l9edTIB73pCPvePTsWUaPFwV1Cm2ZFFCR4j4obyMrQiwE4pj3Rkhg9HUl8bXDU_aWjeEbS
 hUEJ8scEZ8mFpzfYiK3AhH8PzMbsTFJ9wQBVrlZRwvBuFYrl4j1FZeYiIntTy4mYMnrPBZs7mBPv
 Z9Gp1xEx8.elfGlcVsV6RU5Al_JNe8G8V2CeVdue7kd2Du.xI.pZc1Y.QZsGJjsHGY8vZIER7d5w
 FtJdEy6HFnEYuOA12L.pjAQ7voCMzbP9iUixoIGbhT5Ez9qeatDVCU8m4w4z0fdCxntuW_SprXLe
 Py7CcVGkYnMW746snblgtoGJMtd4S6W7oKxgf6_GP2GWpWgZK7Gen_0Kb4g5zQZpKolQc0anTWZu
 GdZZ.4Ptp_QXkOZxnLFWo59zuphi6QpIr7OUA2Z1OnVANV28ULci.jqwmuLCjpe9Ved6FhA_DidK
 xgr.Be4cnCbNTsRUOMvKcdsW2CZ_dgML.QxDJ3v0iIFrKZUZd_x86nTGa1HsBALP_.cUCoNepmOF
 V6m2Ao827W0xASbwjBnyKgVx9dE_EPLM41hyOE7fHrfZxyzArXHEAISz6fvjV8vpExS9iYCWvKU8
 1HlA0cyKJu2PdOY1O7qwdZk0BzqWofw23kwyRyFIu_IBjeJBeaOXwyRDMktkDSTwz4kPOKuX_dZO
 CwpcFQwRrscC.s5qCuGNrZjqe50mtMp6J3EGlTMRh3KqptVd1BJ.QMnENNh5chnDFyFdjBaY0OAk
 RE1uQdnVrhgEK5VdMBjqYkO4tVt7ZnMtwT8CAhnT7RpChub07J3aCWBXfEIKW4oZU1fPTKtcdqMy
 KjLIkj9FOGjmWjEopntGGXN4anTImJbsDluXXOfzosPf9FAOJY0myn1lZkBo3TZuryNXIK87AXf9
 AkI0RBNxbJxstJd5XysaybnqI4m4Je3q85kfXxKEcH64ZHTFdxHSXm4jMm5_yMNhUhGTml5W4Wmp
 UftynWVnXQZ7J7.lUj5SYTtZHrTWV4OE5LS8JpCGgIJiXl0x8NFb3RwhhuU6gJGUPG3pJDHe4u3X
 yjfFu0rYDbUPgvct0lfoLPnBYt8haR6__c4AjGfGEBfLR66HtsZUtE96rPDlAyEIdeX_MGkluhuv
 TXHdYAiqsSDe5xh5eUlYRArfpcPUoxJ_nEKtjqXjKoTB3VK5TM.71CBftznkjqDB9QJzMrfqyBcR
 4elVgOPpSoiAyCEABB9d3AJr5QCFvadmrh6NqNNHYX18UzQcbA0Nca90DYaXwNyMYbGY7yaQhAab
 whYM5vG0jIvPI9G2S2gWbQKpEfFknLzzMpwxgHZgtEHgzQpziDRf4KpYQr5.MdOTYaXNvAKacGtd
 BGNZbLEi8QusGqn1H9ql4jcEaqr.T0u8jOGeaHchC4lFqZYrD1xHJByznqgG_yHE_34zNk_HfRF0
 3JV7rw8zy3E7q43M7z2084aC3wVPazXNxnn.6CJdtKcUdtDbupQahvll1TbsBAu46Uf3t_Vwk_y3
 4ad8IqsLWhXKRSZKHDRpdSJaz9ebxQSiweXxzGe5KEktNDpaZY84DyVla75.FF_dAIBqDy4Cg.9R
 _.R1eJ1rguRLbQHUn1e0bSwPim3W7sPcr0E8QtduvbAv9CFO8LY0Mdjd9yKzD2fRx3VUSF.zgPhn
 0WD4R.Lv1p1dzGDUK6qzsITAIv7Qhu2cHn0uqIePeOrzteXBDFhtNSf.g0aZdopMeD0dfvRC.NUk
 P7GuRiW8sSk6xD.d_RrUMb0CDxE7zLA00UAjx9S2ALIeUSdtcSA--
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: 4a193f5c-7fd1-46f4-bcf0-ac13f7988e18
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.gq1.yahoo.com with HTTP; Sun, 14 Sep 2025 15:55:23 +0000
Received: by hermes--production-ir2-7d8c9489f-8h97t (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 663aa411e1d97799b38b5afe608e5826; 
 Sun, 14 Sep 2025 15:53:20 +0000 (UTC)
From: Ruben Wauters <rubenru09@aol.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Ruben Wauters <rubenru09@aol.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm: gud: replace WARN_ON/WARN_ON_ONCE with drm versions
Date: Sun, 14 Sep 2025 16:50:52 +0100
Message-ID: <20250914155308.2144-1-rubenru09@aol.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250914155308.2144-1-rubenru09.ref@aol.com>
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

GUD is a drm driver, and therefore should use the drm versions of
WARN_ON and WARN_ON_ONCE. This patch replaces all instances of WARN_ON
and WARN_ON_ONCE with drm_WARN_ON and drm_WARN_ON_ONCE.

Signed-off-by: Ruben Wauters <rubenru09@aol.com>
---
 drivers/gpu/drm/gud/gud_connector.c |  8 ++++----
 drivers/gpu/drm/gud/gud_pipe.c      | 10 +++++-----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/gud/gud_connector.c b/drivers/gpu/drm/gud/gud_connector.c
index 4a15695fa933..62e349b06dbe 100644
--- a/drivers/gpu/drm/gud/gud_connector.c
+++ b/drivers/gpu/drm/gud/gud_connector.c
@@ -561,11 +561,11 @@ static int gud_connector_add_properties(struct gud_device *gdrm, struct gud_conn
 			continue; /* not a DRM property */
 
 		property = gud_connector_property_lookup(connector, prop);
-		if (WARN_ON(IS_ERR(property)))
+		if (drm_WARN_ON(drm, IS_ERR(property)))
 			continue;
 
 		state_val = gud_connector_tv_state_val(prop, &gconn->initial_tv_state);
-		if (WARN_ON(IS_ERR(state_val)))
+		if (drm_WARN_ON(drm, IS_ERR(state_val)))
 			continue;
 
 		*state_val = val;
@@ -593,7 +593,7 @@ int gud_connector_fill_properties(struct drm_connector_state *connector_state,
 			unsigned int *state_val;
 
 			state_val = gud_connector_tv_state_val(prop, &connector_state->tv);
-			if (WARN_ON_ONCE(IS_ERR(state_val)))
+			if (drm_WARN_ON_ONCE(connector_state->connector->dev, state_val))
 				return PTR_ERR(state_val);
 
 			val = *state_val;
@@ -667,7 +667,7 @@ static int gud_connector_create(struct gud_device *gdrm, unsigned int index,
 		return ret;
 	}
 
-	if (WARN_ON(connector->index != index))
+	if (drm_WARN_ON(drm, connector->index != index))
 		return -EINVAL;
 
 	if (flags & GUD_CONNECTOR_FLAGS_POLL_STATUS)
diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index 54d9aa9998e5..3a208e956dff 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -61,7 +61,7 @@ static size_t gud_xrgb8888_to_r124(u8 *dst, const struct drm_format_info *format
 	size_t len;
 	void *buf;
 
-	WARN_ON_ONCE(format->char_per_block[0] != 1);
+	drm_WARN_ON_ONCE(fb->dev, format->char_per_block[0] != 1);
 
 	/* Start on a byte boundary */
 	rect->x1 = ALIGN_DOWN(rect->x1, block_width);
@@ -138,7 +138,7 @@ static size_t gud_xrgb8888_to_color(u8 *dst, const struct drm_format_info *forma
 				pix = ((r >> 7) << 2) | ((g >> 7) << 1) | (b >> 7);
 				break;
 			default:
-				WARN_ON_ONCE(1);
+				drm_WARN_ON_ONCE(fb->dev, 1);
 				return len;
 			}
 
@@ -527,7 +527,7 @@ int gud_plane_atomic_check(struct drm_plane *plane,
 		drm_connector_list_iter_end(&conn_iter);
 	}
 
-	if (WARN_ON_ONCE(!connector_state))
+	if (drm_WARN_ON_ONCE(plane->dev, !connector_state))
 		return -ENOENT;
 
 	len = struct_size(req, properties,
@@ -539,7 +539,7 @@ int gud_plane_atomic_check(struct drm_plane *plane,
 	gud_from_display_mode(&req->mode, mode);
 
 	req->format = gud_from_fourcc(format->format);
-	if (WARN_ON_ONCE(!req->format)) {
+	if (drm_WARN_ON_ONCE(plane->dev, !req->format)) {
 		ret = -EINVAL;
 		goto out;
 	}
@@ -561,7 +561,7 @@ int gud_plane_atomic_check(struct drm_plane *plane,
 			val = new_plane_state->rotation;
 			break;
 		default:
-			WARN_ON_ONCE(1);
+			drm_WARN_ON_ONCE(plane->dev, 1);
 			ret = -EINVAL;
 			goto out;
 		}
-- 
2.49.1

