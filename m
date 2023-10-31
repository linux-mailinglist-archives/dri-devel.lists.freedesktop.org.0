Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 484697DC76B
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 08:39:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87EE710E40E;
	Tue, 31 Oct 2023 07:39:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9E2A10E415
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 07:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=De/PIfkZVAOyTSP91PR0+gMsXQuIhR9hutDnDNGhWn0=; b=G9hUHRdT++O/1+D/N4JHwi3uc2
 Xjhi2sFxsq8Q8KQ3DVXLthnFFMWoMivphquUM3Ny0736uudakbPTHSVpmylOwfZoZNKxyqTTnNezl
 TRdyr+5W8kyeqhAZf/RFmXeA7eQCoO9Gbdg3w1Ko783OZlmu/R0WZ1BZVdgKvWk7ATraiK5dQ/DWU
 f66SFF8UzOBkjwM1PPBurTRg4Q/9dXaWPwv5SpoWEKV0Wyy8do3NnMzvrUPWQXJoDqFjlHGhpVc2P
 tbzFNs/tClt37KVqN8RGScscZ/4QNDFHlXTraL/vOV7jjsZHGRhMuw6GOKD2DzXmsiDJM2jQDdEOZ
 rHW10Djw==;
Received: from 251.48.60.213.dynamic.reverse-mundo-r.com ([213.60.48.251]
 helo=vega.mundo-R.com) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qxjLW-00FHU5-Fz; Tue, 31 Oct 2023 08:39:30 +0100
From: Iago Toral Quiroga <itoral@igalia.com>
To: dri-devel@lists.freedesktop.org,
	Maira Canal <mcanal@igalia.com>
Subject: [PATCH v3 4/4] drm/v3d: add brcm,2712-v3d as a compatible V3D device
Date: Tue, 31 Oct 2023 08:38:59 +0100
Message-Id: <20231031073859.25298-5-itoral@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231031073859.25298-1-itoral@igalia.com>
References: <20231031073859.25298-1-itoral@igalia.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Melissa Wen <mwen@igalia.com>, kernel-dev@igalia.com,
 Rob Herring <robh+dt@kernel.org>, Iago Toral Quiroga <itoral@igalia.com>,
 Stefan Wahren <wahrenst@gmx.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is required to get the V3D module to load with Raspberry Pi 5.

Signed-off-by: Iago Toral Quiroga <itoral@igalia.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Maíra Canal <mcanal@igalia.com>
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

