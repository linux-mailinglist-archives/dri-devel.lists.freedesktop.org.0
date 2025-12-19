Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D369CD1710
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 19:47:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D66B10F08F;
	Fri, 19 Dec 2025 18:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="MQXyKwIE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3912A10F07E;
 Fri, 19 Dec 2025 18:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=29bFBqNh7gMbtS+CkFMD3+tvUazk9p3Y16DWfFrntG0=; b=MQXyKwIEdZLL0WoGvpSFHvj2Co
 tiU8UxCqxYUJmHMKIJxUIJpksvoDsc3qEx6sHTMn9AkAlAv5tNRmNYoJ4KdAMOKPPHpt+OjuTX1qY
 lE6jfZWaSRGtalpGuh1WtJGuLPba5EInBJxdhbrx8ZJoz/gBYi2fseMpw53YqctSSEKc2VqRiURNR
 NN2l1ZO3K3rH3PRZu8heKHmfRk/YwMB/gBoS8W8EGs/kvPd74g5O0dnpw5dmxdQosp+Ye8nx74nlX
 IdP67d732KpukFC+GGz3vlMgt75MGeZMDoJz/1bvJED7UlINUGb8kHLXLPu44gDU7ayEID0tFLZUo
 EUL/n2mA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vWfUy-0000000AqkV-3tEf; Fri, 19 Dec 2025 18:46:44 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 14/19] drm/msm/dpu: dpu_hw_vbif.h: fix all kernel-doc warnings
Date: Fri, 19 Dec 2025 10:46:33 -0800
Message-ID: <20251219184638.1813181-15-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219184638.1813181-1-rdunlap@infradead.org>
References: <20251219184638.1813181-1-rdunlap@infradead.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Correct or add kernel-doc comments to eliminate all warnings:

Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h:19 Incorrect use of
 kernel-doc format: * set_limit_conf - set transaction limit config
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h:29 Incorrect use of
 kernel-doc format: * get_limit_conf - get transaction limit config
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h:39 Incorrect use of
 kernel-doc format: * set_halt_ctrl - set halt control
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h:48 Incorrect use of
 kernel-doc format: * get_halt_ctrl - get halt control
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h:57 Incorrect use of
 kernel-doc format: * set_qos_remap - set QoS priority remap
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h:67 Incorrect use of
 kernel-doc format: * set_mem_type - set memory type
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h:76 Incorrect use of
 kernel-doc format: * clear_errors - clear any vbif errors
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h:88 Incorrect use of
 kernel-doc format: * set_write_gather_en - set write_gather enable
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h:93 struct member
 'limit' not described in 'dpu_hw_vbif_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h:93 struct member
 'set_limit_conf' not described in 'dpu_hw_vbif_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h:93 struct member
 'get_limit_conf' not described in 'dpu_hw_vbif_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h:93 struct member
 'set_halt_ctrl' not described in 'dpu_hw_vbif_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h:93 struct member
 'get_halt_ctrl' not described in 'dpu_hw_vbif_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h:93 struct member
 'set_qos_remap' not described in 'dpu_hw_vbif_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h:93 struct member
 'set_mem_type' not described in 'dpu_hw_vbif_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h:93 struct member
 's' not described in 'dpu_hw_vbif_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h:93 struct member
 'set_write_gather_en' not described in 'dpu_hw_vbif_ops'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

--- linux-next-20251119.orig/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h
+++ linux-next-20251119/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h
@@ -17,7 +17,7 @@ struct dpu_hw_vbif;
  */
 struct dpu_hw_vbif_ops {
 	/**
-	 * set_limit_conf - set transaction limit config
+	 * @set_limit_conf: set transaction limit config
 	 * @vbif: vbif context driver
 	 * @xin_id: client interface identifier
 	 * @rd: true for read limit; false for write limit
@@ -27,7 +27,7 @@ struct dpu_hw_vbif_ops {
 			u32 xin_id, bool rd, u32 limit);
 
 	/**
-	 * get_limit_conf - get transaction limit config
+	 * @get_limit_conf: get transaction limit config
 	 * @vbif: vbif context driver
 	 * @xin_id: client interface identifier
 	 * @rd: true for read limit; false for write limit
@@ -37,7 +37,7 @@ struct dpu_hw_vbif_ops {
 			u32 xin_id, bool rd);
 
 	/**
-	 * set_halt_ctrl - set halt control
+	 * @set_halt_ctrl: set halt control
 	 * @vbif: vbif context driver
 	 * @xin_id: client interface identifier
 	 * @enable: halt control enable
@@ -46,7 +46,7 @@ struct dpu_hw_vbif_ops {
 			u32 xin_id, bool enable);
 
 	/**
-	 * get_halt_ctrl - get halt control
+	 * @get_halt_ctrl: get halt control
 	 * @vbif: vbif context driver
 	 * @xin_id: client interface identifier
 	 * @return: halt control enable
@@ -55,7 +55,7 @@ struct dpu_hw_vbif_ops {
 			u32 xin_id);
 
 	/**
-	 * set_qos_remap - set QoS priority remap
+	 * @set_qos_remap: set QoS priority remap
 	 * @vbif: vbif context driver
 	 * @xin_id: client interface identifier
 	 * @level: priority level
@@ -65,7 +65,7 @@ struct dpu_hw_vbif_ops {
 			u32 xin_id, u32 level, u32 remap_level);
 
 	/**
-	 * set_mem_type - set memory type
+	 * @set_mem_type: set memory type
 	 * @vbif: vbif context driver
 	 * @xin_id: client interface identifier
 	 * @value: memory type value
@@ -74,7 +74,7 @@ struct dpu_hw_vbif_ops {
 			u32 xin_id, u32 value);
 
 	/**
-	 * clear_errors - clear any vbif errors
+	 * @clear_errors: clear any vbif errors
 	 *	This function clears any detected pending/source errors
 	 *	on the VBIF interface, and optionally returns the detected
 	 *	error mask(s).
@@ -86,7 +86,7 @@ struct dpu_hw_vbif_ops {
 		u32 *pnd_errors, u32 *src_errors);
 
 	/**
-	 * set_write_gather_en - set write_gather enable
+	 * @set_write_gather_en: set write_gather enable
 	 * @vbif: vbif context driver
 	 * @xin_id: client interface identifier
 	 */
