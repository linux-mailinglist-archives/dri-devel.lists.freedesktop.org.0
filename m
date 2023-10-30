Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C037DB51F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 09:29:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB0110E240;
	Mon, 30 Oct 2023 08:29:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB4C10E23C
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 08:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yxN7mYxByQSsX0eXQ3xLRy77SqsaK9IU4oyvB7iqeh8=; b=fc7oKqfHpcb0ms/EfV39eR1UUf
 EcG51GKYIG2YzMfMQyGLxmQZwgHPLHa0GjloVOo9xyOay9vw4tIl+gW/HnOofUlQ4dluUvGZZyHFU
 Vqqx8fwjkxceanZwRtuwHXoUM3/CrfXrW4RLn0t3UMbOYx8LldoE/R3E2U9d1jPU6IKNaBLRvK0dM
 uOz2OVbnmFhanXxXoqsUFN2m74JJAoptXFcpbLTph6KGGpyvNKVWbEctODfPHyvTNlRxHPxMKhvF6
 /1rO0R7tYtkEouGY9WEwd73lkZkzheSoF5ptrKEh2RStpzGFJH1WcTOXzkfhg0QUyty45CphMEDIx
 xzUGmasw==;
Received: from 229.48.60.213.dynamic.reverse-mundo-r.com ([213.60.48.229]
 helo=vega..) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qxNeB-00Ep4m-VO; Mon, 30 Oct 2023 09:29:19 +0100
From: Iago Toral Quiroga <itoral@igalia.com>
To: Maira Canal <mcanal@igalia.com>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/4] drm/v3d: add brcm,2712-v3d as a compatible V3D device
Date: Mon, 30 Oct 2023 09:28:58 +0100
Message-Id: <20231030082858.30321-5-itoral@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231030082858.30321-1-itoral@igalia.com>
References: <20231030082858.30321-1-itoral@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>, Emma Anholt <emma@anholt.net>,
 Melissa Wen <mwen@igalia.com>, Rob Herring <robh+dt@kernel.org>,
 Iago Toral Quiroga <itoral@igalia.com>, Stefan Wahren <wahrenst@gmx.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is required to get the V3D module to load with Raspberry Pi 5.

v2:
 - added s-o-b and commit message. (Maíra)
 - keep order of compatible strings. (Stefan Wahren)

Signed-off-by: Iago Toral Quiroga <itoral@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index ffbbe9d527d3..1ab46bdf8ad7 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -187,6 +187,7 @@ static const struct drm_driver v3d_drm_driver = {
 
 static const struct of_device_id v3d_of_match[] = {
 	{ .compatible = "brcm,2711-v3d" },
+	{ .compatible = "brcm,2712-v3d" },
 	{ .compatible = "brcm,7268-v3d" },
 	{ .compatible = "brcm,7278-v3d" },
 	{},
-- 
2.39.2

