Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F741B0CE20
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 01:28:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D28310E28A;
	Mon, 21 Jul 2025 23:28:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.b="DLh7c1ng";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic317-21.consmr.mail.gq1.yahoo.com
 (sonic317-21.consmr.mail.gq1.yahoo.com [98.137.66.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067B110E28A
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 23:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1753140511; bh=A91AAcTAlI16PhcW5HAKMoeQaMv74rtX9ewBgIvhwh0=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=DLh7c1ng495twwlng+IPhOt+G9Dd/as1REECXOGytOf/sqJo28dMXgHcrdCVJY+NuQnVEOf8WGxYqsEnrSyzsNSyz0By9AcgWWK/EGxK3CRwI48rbDd0GL+EVORx341YFAcKqpgiIHgzT4wkIbe+vuqYo30ZD0x2oCKpt23nJhemVVcGZjuafHwUOB5pvg2lGvfwfmV89RjLC/lnMW2lRp9Z9yAroojgFtbyInRT76onQ6VqQhUK/A3L4K1xj9K57eDnTq6GjTpbGEYUpnz2X2JtT71yjrMcXoV5c5pDT1a8FlVCfVhkiO6107iwZuqmJfFobAocCVU7EmgJs8Eb6A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1753140511; bh=7EpFAs3n3RVEYi+eXEo2Y3vbTY6mQaHy/oD680UUkJB=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=RV9tu8qR87zE/FUSUXOVvlzbs6WksdlUnViO4E1QgDnJXFVmkNx4Tc3eEqYO1unwc8180FJnp+4pTqusCkpCbBgvnYVOkH57mORE3jHLjSHyqZGKMp3gCLPc8wa/kMExb117C5azIbkvau67RBlkBwQ3oQjffUy2xFuNAnfbu+/hgK7Kh8xS8GlH4ApJ4TItAq7El5TztPoqksCJ8KUL0oJnvWX+fgBZIGpdS0KmzxRurhDwXFRYW0F1JA2VDf2i5lV0ntgLBmvupeM0CfWLxGq+gXFmccNgLN5xeYBCWMIBLgfBgYXoHUaYC8Rv4WRPCPlE5wo07etNWeqq+gMIwA==
X-YMail-OSG: q3RZDQAVM1lg91ADX9SgAUWbcB4F.nrrjqIt.W2Azv6UDY2p4qFHKlSJRcOeFry
 KSjo.FhCmucfr6BdcU1eA3C_tz53vWA0wXk2R7lE9FV_SZM5IbKVuBqvR0VKzNXerHU3HWQTs5ya
 8hcU0pkyIJwyZOMrwCjJnohthFLtH9ktaHWqPERJutUVqtbW9IH_TplOaEc.sD7wKN_pyLAAa6Nv
 uNE5rjbrgsfwsUYQ.cE2BdHYohGYe5KzNs5_tfwS3Hale6maqreo4CelXvyLdjHzuL0tY0Yb2K6i
 9VDNV9kA.M4bK3SRkSA9W2jEZBumiRbZFzGJB8y39G2VtGOrWz1clCnhDbIvW0aRefF4FfPdhtuC
 VC1SRRx4Brc311cyMx4NJMQGBbTVJTG6graJvkTqJ0qAeeb427w5mZrZpv5v5qti49n7pNOiBiWY
 L0AcUeumG7rpp1jPkXNFGBtUDf2fPAaFpvTHzCcZAubCBJlUVcn.WFae.._u21RN1uD0gu3ewQBI
 eq2maUUGGItXpTQ8B09A4VoNikF.BJrGmxCvy0J1jPEL9_74G_cs6RPxjqzFc67aVNzVVomKQ8AK
 txHt2wsSDQVf7uo56dWskhUhF41H.FJ9A1hQt5KxTmP0nHKxLC6Dn3aHfrUOMfjiXdaCVqnEm_6B
 fehHYVwFi_XxNYRHoXx5ZrP4PNHwZIGE345imzy0olyFLIZBhUAguApRwo7eQ96pGYlCEr8fJ48.
 FIjz7cQvYkSJML7lBVroNjtZRqXwv4GW3PBS352AZAu_Uf.aBG5q70_PoieS1MGK0zXcSmhZH56c
 bYHxWTRLCKsMw5N2nxvSHaJKqKFMJ9PYV0b0Man..uvVkMlw0hzIfe6VJlDWKU7zDdZdy_r0B6ru
 dqaBnPoCNRvOGc1Bj7jyF4oULiik5S20SLGOr5LJW37OMez6WAoSDmjVI3Qs9IJ_HjgwmMxz3MIW
 .gCHeSjdI6YUsfZQmKnt_z_1cG7hKvlw1mE2EsWIumTuNTQNJLamPA1ytEz0lo7RgSciIunVwD5A
 U5QU3uiIyHr3EKTV_jKOpTitJ9_xg6qrQSjoN1UNGIkz_G5Oy3.qB4jwZPlE6H5BEaq4FhMPbQvz
 X_rCjNkKJB9nOGmnJpoylp3fy8s2ARyVZ1FfgFQyLyCvZqUTHbZ0q62x92EYKX2Ar.yXjpJt4yB6
 yDimqIFhWWaiDbUrlXi8KJ3acWnPUHjbmktc1q1j6YO5ouY8vDpZGHQjGT0nF1MZ_d4IGDQSnMuQ
 yzZJxfl1YBxy48eI4NeaWSSqQ0bT9_uuY_g.Xt2OsPIyTP4k4q8C_Ppwlm2Hhu46M2sYVdC1zWVa
 JjSbXAXO2Bs4CAEJgMhgVbrbd0v5M0atIe1ei6qSYOiqD_ki_TyOxqvt96sCkIUUgevMBiEh5rZK
 89Tcp6GKEch.nSPBrPwYgKix8eCftVI.kFoits4J.JaJD07I3Kp0SIqwErkw.HJciPiiEkWC1TS9
 UdOAQvXPhOIj1irusvTBcZDBr801R9pcgFdBSeMhf6SY2_K1SOoi1iqpl3Gx1pjz2MqNnj4BVMZJ
 2Kb084Q76UInmZ_v7JVQPBV4sJ2InPfU_58ANELoLelq5Sr6JIiqeOuRx1khcS8xhRb4HEI2LeBL
 yQiCH4iXkZPGZT12p4KE2PHBTEu2jH9EFpdrL6uKdaXPCWM7m6p.k1S5_mWVZew1jBKbkOBwIins
 tdWVKp3jitb_7O5Pr5F96I_fCvutjgqbpRpYboS8kczfp.HCkO8wTUdUJUADP9ynC077p2KwKfbF
 oR05xa2j4DTAgbEjwqdvQV1Pl9AJR3zenHFjZzVFZA1tWZHs__X3uHsBwQksjGIQEvpP0HnjpV1V
 H1jlPKPUDjNrWsX8.1CZKcmv_bf0fKwsZ4wdzyb_LRkSP9kD8zooATwE6gW2THptOhsZZx0aSJSo
 nZtHdSUpOPVSoV1WSGUwPotA8leXTZs.xnaiOWjHQ.PCpvoadAufoIyWjRJs4OGiXqiQSKtksuAP
 6zZefbLIzEBGciY3tHJ4R2XiSMkE6zv7AwMeB_qAL.65apN4Q_kc9g9WmYkZ4QMpOmsCl8QZBl_I
 bEd40_JQMBXeUrWDfZFYxzPr8BqVuXFBgdhh_Z5.YYA8jw5Y1S_Fj1HQ6YpbWeLo3V.MQpo4HSVt
 Akri0PyqZmN6T_Z0.Rm_pmrIJxanTdqYVnHqu7Vkp2Jq2lslYna1CJEStZGdsp60LUmv78EW.tkX
 RWQsZNhU7RuFjQXax3VrmBeksvlPB8baruT3BkqYeJmnm6gyPOZrP7N.bi4Wuqw4b62um15I6
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: a627b7ad-e902-4a36-ae28-0ee32e157ef6
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic317.consmr.mail.gq1.yahoo.com with HTTP; Mon, 21 Jul 2025 23:28:31 +0000
Received: by hermes--production-ir2-858bd4ff7b-c77nt (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID de26d5190053588a6a416cd8bd16b8d6; 
 Mon, 21 Jul 2025 23:28:28 +0000 (UTC)
From: Ruben Wauters <rubenru09@aol.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Ruben Wauters <rubenru09@aol.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/gud: Remove unnecessary logging
Date: Tue, 22 Jul 2025 00:22:03 +0100
Message-ID: <20250721232210.12578-1-rubenru09@aol.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250721232210.12578-1-rubenru09.ref@aol.com>
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

The debug logging in gud_disconnect() adds zero detail and is
unnecessary, as it only prints the function name.

The same functionality can be achieved by using ftrace, and is
highlighted by checkpatch, stating the same.

This patch removes the debug log in the gud_disconnect() function.

Signed-off-by: Ruben Wauters <rubenru09@aol.com>
---
 drivers/gpu/drm/gud/gud_drv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index 5385a2126e45..b52a12cbba3e 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -620,8 +620,6 @@ static void gud_disconnect(struct usb_interface *interface)
 	struct gud_device *gdrm = usb_get_intfdata(interface);
 	struct drm_device *drm = &gdrm->drm;
 
-	drm_dbg(drm, "%s:\n", __func__);
-
 	drm_kms_helper_poll_fini(drm);
 	drm_dev_unplug(drm);
 	drm_atomic_helper_shutdown(drm);
-- 
2.49.1

