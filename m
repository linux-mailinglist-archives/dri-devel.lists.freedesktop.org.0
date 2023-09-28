Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 160C47B1B65
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 13:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7EF810E62E;
	Thu, 28 Sep 2023 11:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF1D10E62C
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 11:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3yLxFjj2fMjZyeI1u5MhTpkP8PqVEo0RwESmQ/j1u3I=; b=dMXwVB9CbKSWQYnBCR5HALV/h6
 GD+lSkrsp2CsUKAXxQhX+nS78gTXMH1D6c2d7IbcGWROmjkV9TSSTp73JTzzmif+gIO0bRC9YBqBW
 1myrSKkUrPnAomreNpnTFO9kjhlYWzv0FV8TBv53uTyfHSv39fgaYmBL9wLyN6nUe8d5e1YE4/pPj
 qxEaGiBaiCOA2Uk1ALbz4YYrYz5yIAemHyEnOo5TbBfgWS+oJmav6AClU5it1NPSycGsKovnedryf
 5Rs3oJVXhYvVb4tSzytDpSPA/kS5Lj/hLqaBq6GUbki92OWOcxoIaeWRhuTTo0phoILLnaARxw94D
 zieh/RDw==;
Received: from [213.60.48.236] (helo=vega.mundo-R.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qlpSr-009FgI-2q; Thu, 28 Sep 2023 13:45:53 +0200
From: Iago Toral Quiroga <itoral@igalia.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/v3d: update UAPI to match user-space for V3D 7.x
Date: Thu, 28 Sep 2023 13:45:31 +0200
Message-Id: <20230928114532.167854-3-itoral@igalia.com>
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

V3D t.x takes a new parameter to configure TFU jobs that needs
to be provided by user space.
---
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

