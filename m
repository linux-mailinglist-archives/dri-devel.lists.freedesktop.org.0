Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A54907B1B63
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 13:46:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D7610E62C;
	Thu, 28 Sep 2023 11:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C6E10E62D
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 11:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9m2hVYVzwjAd+aVxv3+J+6wvoA5nJ7xMHz+j7RVsdy0=; b=Nw1JScU44FgHuMORcYN8cLCHng
 g3Xlp0r4recpdIuMLQu+yQlx3thvwBQDTN0fdwKmb5D3BRjuegnGAoz9hIAHXT8gY/tkij1XD3glm
 BacpOp8w0wA85knaSu0Dm39VEmqqn6fj1XQs2suecUKpnuycAjytbWJJFtpgtl/jwGam9dkQp50gZ
 UQvFdacz94+UWbugLZif39OwUMykYpulO60cij61OUIWmVkK15IqZq4s/3u7kkwHcFgOlALwgYgWT
 OoLlLOvc0SwTG3qzNDsVYzYyM824VPUiIloHw5HwyIotxa78eV/yWwNjygMNX9Yr6lpwpko06HIvm
 I7tTl1kg==;
Received: from [213.60.48.236] (helo=vega.mundo-R.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qlpSr-009FgI-5s; Thu, 28 Sep 2023 13:45:53 +0200
From: Iago Toral Quiroga <itoral@igalia.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/v3d: add brcm,2712-v3d as a compatible V3D device
Date: Thu, 28 Sep 2023 13:45:32 +0200
Message-Id: <20230928114532.167854-4-itoral@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928114532.167854-1-itoral@igalia.com>
References: <20230928114532.167854-1-itoral@igalia.com>
MIME-Version: 1.0
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
Cc: Maira Canal <mcanal@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

---
 drivers/gpu/drm/v3d/v3d_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index ffbbe9d527d3..0ed2e7ba8b33 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -186,6 +186,7 @@ static const struct drm_driver v3d_drm_driver = {
 };
 
 static const struct of_device_id v3d_of_match[] = {
+	{ .compatible = "brcm,2712-v3d" },
 	{ .compatible = "brcm,2711-v3d" },
 	{ .compatible = "brcm,7268-v3d" },
 	{ .compatible = "brcm,7278-v3d" },
-- 
2.39.2

