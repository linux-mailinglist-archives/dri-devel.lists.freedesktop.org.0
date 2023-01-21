Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 543446768E7
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 21:10:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7969F10E413;
	Sat, 21 Jan 2023 20:10:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F3310E3D3
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 20:07:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 449B460B72;
 Sat, 21 Jan 2023 20:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 168D1C4339B;
 Sat, 21 Jan 2023 20:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674331674;
 bh=Q0hzBvhkYRvL3+RhjNwIHXfHfXuNAPsza7XXaSmgDoQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=CFmqekT/AyyCu2GLGxZ9L+k+Fpink+u9Ms94bWf4m2w99sqMd6gKzeYk5Vztcds3A
 meQRPpk5E6jv4uYz8Dz4gLjSuDWnaDsnfZh3qOmqX5mgoQSIt7HJPVhVp2+Kzu1d1C
 gEDuvefH5X1CKCkevHuYNlgKT7mPiNNoV0Jbna98mpwcTRoI46z2PHmcAifPseRLxD
 HTWFSPkKQcgI59joSanAW1fmmkHGF/lnAzFMWqzLTCvbldcoBxMrcGSjZ6BaWApyM/
 CsMft3iotfMVoKt1tYPnUQIPMDIj+O14cfzwzODvR/PmqdJ0u6opSJmmnQmc6a19XC
 OnG0o4XRjr6hw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 07F45C61D97;
 Sat, 21 Jan 2023 20:07:54 +0000 (UTC)
From: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 21 Jan 2023 21:09:01 +0100
Subject: [PATCH 83/86] drm/xen: Direct include headers from drm_atomic_helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230113-drm-include-v1-v1-83-c5cf72d8a5a2@ravnborg.org>
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
In-Reply-To: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
To: dri-devel@lists.freedesktop.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674331667; l=841;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=SxDO6n2x0DH9C8qV7B220M04D/fc/HUQDkSZfSqJrBQ=; =?utf-8?q?b=3DspPHf7HoOrT/?=
 =?utf-8?q?29Kx8qX4cW2e2QL5oW1Qny+FeA0wJaYa5IJC23Uod+rPFrtGdGgC1lKBCRABXZAV?=
 lfw0QTMlDKXpa5gFXvAACHGyfa7zTe4XeQs9O6vTNttPazhvH+RB
X-Developer-Key: i=sam@ravnborg.org; a=ed25519;
 pk=R0+pqV7BRYOAeOIGkyOrSNke7arx5y3LkEuNi37YEyU=
X-Endpoint-Received: by B4 Submission Endpoint for sam@ravnborg.org/20230107
 with auth_id=22
X-Original-From: Sam Ravnborg <sam@ravnborg.org>
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
Reply-To: sam@ravnborg.org
Cc: Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sam Ravnborg <sam@ravnborg.org>

Direct include the headers that otherwise comes indirect from
drm_atomic_helper, because drm_atomic_helper will be reduced to
include only the minimal set of headers.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/xen/xen_drm_front_conn.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xen/xen_drm_front_conn.c b/drivers/gpu/drm/xen/xen_drm_front_conn.c
index a1ba6d3d0568..04fa1cdf7205 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_conn.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_conn.c
@@ -9,8 +9,10 @@
  */
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_probe_helper.h>
 
 #include <video/videomode.h>

-- 
2.34.1

