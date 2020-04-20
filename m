Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D821B01FC
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 08:55:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E90D56E23D;
	Mon, 20 Apr 2020 06:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC5E6E129;
 Mon, 20 Apr 2020 01:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=KJGMy6qN76yx7ax6LuAFFNBWUTNhaNlEH4GjR48Hg1o=; b=ISoQquZurSP+DdbjfC2/kZDoun
 +CE5CvUHZdMKHKy28y3uwYPVzQMqz8SizGvSeY0sB+HF19SRJTs4S6O0GZPJ3IEI6v5ZWsHgoWP8r
 jO+aLciAznsxr8Bhp79sp6DgPtd48t+wcGc7kMbxc1hZzC2ry4ppXayHH/DC6zTu1oLkcoA/oNnmm
 HTKm0cyDBGXy12JjVMdyKi3R/aZUmTiuT8ZM7TK3XtOJFDKV7N/Mjbc5XTiPf0PFvifiajzPviaVp
 WHcdmdAY7KPk3Ba30oorh66zUeMO3j/Y+LBQSSUkhAUTId1M8KEk8HuAdPMauXtYZ7jUpm8S1EQYU
 /dIQhzXg==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQLZh-0002EU-Vy; Mon, 20 Apr 2020 01:50:18 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: amd: display: fix kernel-doc struct warning
Date: Sun, 19 Apr 2020 18:50:14 -0700
Message-Id: <20200420015015.27991-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.16.4
X-Mailman-Approved-At: Mon, 20 Apr 2020 06:55:01 +0000
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
Cc: Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Randy Dunlap <rdunlap@infradead.org>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix a kernel-doc warning of missing struct field desription:

../drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:331: warning: Function parameter or member 'hdcp_workqueue' not described in 'amdgpu_display_manager'

Fixes: 52704fcaf74b ("drm/amd/display: Initialize HDCP work queue")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: amd-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |    1 +
 1 file changed, 1 insertion(+)

--- lnx-57-rc2.orig/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ lnx-57-rc2/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -139,6 +139,7 @@ struct amdgpu_dm_backlight_caps {
  * @backlight_link: Link on which to control backlight
  * @backlight_caps: Capabilities of the backlight device
  * @freesync_module: Module handling freesync calculations
+ * @hdcp_workqueue: workqueue for display manager interaction with HDCP module
  * @fw_dmcu: Reference to DMCU firmware
  * @dmcu_fw_version: Version of the DMCU firmware
  * @soc_bounding_box: SOC bounding box values provided by gpu_info FW
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
