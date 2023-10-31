Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 872A57DC76D
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 08:39:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 676AB10E416;
	Tue, 31 Oct 2023 07:39:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF6A10E418
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 07:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wjkfA18vskmNpwq7uCNBs7pSL6GNgLLuP059XVeOTOI=; b=MkjxmaIfzpb2fodXDU2+I0m+bt
 tpGiekNhBPCx2qnvqa6reui58D99bNsjrtEgR7Dnz3K3ik8EomJbsDYSOOaysjMufrqLHW6N5p9Lz
 rXl52CeviBKM0YwHz34Eyoa9SX5q2pBsR5eBJ/yqj5KKoAlY6ICQGm3qBUHtKnDdnpdnmI79Nn6OG
 vIHYehHtYxNqovYMm/V5ljot8VcbUw+C613YKj7cfO2r9ktj4eXvZUVWS918k+kQmlchxDGb4ztUp
 GX/sfmj9BnPVC78th+jdXR0kbAXSDqATWbePnCs2/baYo8hhUJHdXo9dCgQ+z2D4Qd1yg2oZd9xxz
 I8dPD+jg==;
Received: from 251.48.60.213.dynamic.reverse-mundo-r.com ([213.60.48.251]
 helo=vega.mundo-R.com) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qxjLV-00FHU5-13; Tue, 31 Oct 2023 08:39:29 +0100
From: Iago Toral Quiroga <itoral@igalia.com>
To: dri-devel@lists.freedesktop.org,
	Maira Canal <mcanal@igalia.com>
Subject: [PATCH v3 1/4] drm/v3d: update UAPI to match user-space for V3D 7.x
Date: Tue, 31 Oct 2023 08:38:56 +0100
Message-Id: <20231031073859.25298-2-itoral@igalia.com>
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

V3D 7.x takes a new parameter to configure TFU jobs that needs
to be provided by user space.

Signed-off-by: Iago Toral Quiroga <itoral@igalia.com>
Reviewed-by: Maíra Canal <mcanal@igalia.com>
---
v2: added s-o-b, fixed typo in commit message (Maíra Canal)

 include/uapi/drm/v3d_drm.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
index 3dfc0af8756a..1a7d7a689de3 100644
--- a/include/uapi/drm/v3d_drm.h
+++ b/include/uapi/drm/v3d_drm.h
@@ -319,6 +319,11 @@ struct drm_v3d_submit_tfu {
 
 	/* Pointer to an array of ioctl extensions*/
 	__u64 extensions;
+
+	struct {
+		__u32 ioc;
+		__u32 pad;
+	} v71;
 };
 
 /* Submits a compute shader for dispatch.  This job will block on any
-- 
2.39.2

