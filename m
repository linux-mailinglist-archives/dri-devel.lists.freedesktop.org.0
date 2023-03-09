Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 384236B1B80
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 07:30:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AE5A10E7A0;
	Thu,  9 Mar 2023 06:30:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED1810E79C;
 Thu,  9 Mar 2023 06:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678343396; x=1709879396;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C3FkxfjMZvBgVGOieJrIwTzMI8cNBGhSsDIDhNdTyfA=;
 b=SPZWY41/ghLZ5ThyaN8ydOTKFy9pqKKGkjhsDDlsv+BFOTiebGpevh4K
 bS/dHUr/67BCp+rQB38NrVqsnuV1jXh4Rx7twjxdge18eCyXud2xc/SZE
 3OVkavWX9GFEHTSsgkxJCuLB9rjOE0dscgefCIO4n6n05nV9rAWVbOhpC
 ErmAZurp2SLvCeTLDNK8jTnkH3OrQry5wRbZ3TkcjO4tVkZOgxecvzBJ7
 86ofdveZ38LRDlrchDthn9MjtISGauemwxG/8lWLEOrLzjRNaeGrb+b3P
 YRLCgoXtpTh+Es9FWfKeKZ9sxUtNSfSTUXryXUVGKLbbu2X3OKNiS0TJc Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="335070009"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; d="scan'208";a="335070009"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 22:29:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="1006614869"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; d="scan'208";a="1006614869"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmsmga005.fm.intel.com with ESMTP; 08 Mar 2023 22:29:54 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 3/7] drm/i915/dsc: Adding the new registers for DSC
Date: Thu,  9 Mar 2023 11:58:51 +0530
Message-Id: <20230309062855.393087-4-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230309062855.393087-1-suraj.kandpal@intel.com>
References: <20230309062855.393087-1-suraj.kandpal@intel.com>
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
Cc: Vandita Kulkarni <Vandita.kulkarni@intel.com>, ankit.k.nautiyal@intel.com,
 uma.shankar@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding new DSC register which are introducted MTL onwards

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Vandita Kulkarni <Vandita.kulkarni@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 .../gpu/drm/i915/display/intel_vdsc_regs.h    | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_vdsc_regs.h b/drivers/gpu/drm/i915/display/intel_vdsc_regs.h
index 4fd883463752..b71f00b5c761 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_vdsc_regs.h
@@ -46,6 +46,32 @@
 							   _ICL_PIPE_DSS_CTL2_PB, \
 							   _ICL_PIPE_DSS_CTL2_PC)
 
+/* MTL Display Stream Compression registers */
+#define _MTL_DSC0_PICTURE_PARAMETER_SET_17_PB	0x782B4
+#define _MTL_DSC1_PICTURE_PARAMETER_SET_17_PB	0x783B4
+#define _MTL_DSC0_PICTURE_PARAMETER_SET_17_PC	0x784B4
+#define _MTL_DSC1_PICTURE_PARAMETER_SET_17_PC	0x785B4
+#define MTL_DSC0_PICTURE_PARAMETER_SET_17(pipe)	_MMIO_PIPE((pipe) - PIPE_B, \
+							   _MTL_DSC0_PICTURE_PARAMETER_SET_17_PB, \
+							   _MTL_DSC0_PICTURE_PARAMETER_SET_17_PC)
+#define MTL_DSC1_PICTURE_PARAMETER_SET_17(pipe)	_MMIO_PIPE((pipe) - PIPE_B, \
+							   _MTL_DSC1_PICTURE_PARAMETER_SET_17_PB, \
+							   _MTL_DSC1_PICTURE_PARAMETER_SET_17_PC)
+#define DSC_SL_BPG_OFFSET(offset)		((offset) << 27)
+
+#define _MTL_DSC0_PICTURE_PARAMETER_SET_18_PB	0x782B8
+#define _MTL_DSC1_PICTURE_PARAMETER_SET_18_PB	0x783B8
+#define _MTL_DSC0_PICTURE_PARAMETER_SET_18_PC	0x784B8
+#define _MTL_DSC1_PICTURE_PARAMETER_SET_18_PC	0x785B8
+#define MTL_DSC0_PICTURE_PARAMETER_SET_18(pipe)	_MMIO_PIPE((pipe) - PIPE_B, \
+							   _MTL_DSC0_PICTURE_PARAMETER_SET_18_PB, \
+							   _MTL_DSC0_PICTURE_PARAMETER_SET_18_PC)
+#define MTL_DSC1_PICTURE_PARAMETER_SET_18(pipe)	_MMIO_PIPE((pipe) - PIPE_B, \
+							   _MTL_DSC1_PICTURE_PARAMETER_SET_18_PB, \
+							   _MTL_DSC1_PICTURE_PARAMETER_SET_18_PC)
+#define DSC_NSL_BPG_OFFSET(offset)		((offset) << 16)
+#define DSC_SL_OFFSET_ADJ(offset)		((offset) << 0)
+
 /* Icelake Display Stream Compression Registers */
 #define DSCA_PICTURE_PARAMETER_SET_0		_MMIO(0x6B200)
 #define DSCC_PICTURE_PARAMETER_SET_0		_MMIO(0x6BA00)
@@ -59,6 +85,8 @@
 #define ICL_DSC1_PICTURE_PARAMETER_SET_0(pipe)	_MMIO_PIPE((pipe) - PIPE_B, \
 							   _ICL_DSC1_PICTURE_PARAMETER_SET_0_PB, \
 							   _ICL_DSC1_PICTURE_PARAMETER_SET_0_PC)
+#define  DSC_NATIVE_422_ENABLE		BIT(23)
+#define  DSC_NATIVE_420_ENABLE		BIT(22)
 #define  DSC_ALT_ICH_SEL		(1 << 20)
 #define  DSC_VBR_ENABLE			(1 << 19)
 #define  DSC_422_ENABLE			(1 << 18)
-- 
2.25.1

