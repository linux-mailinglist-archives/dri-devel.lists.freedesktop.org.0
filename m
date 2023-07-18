Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C79C4757DD3
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 15:39:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE4E210E34E;
	Tue, 18 Jul 2023 13:39:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190DA10E34B;
 Tue, 18 Jul 2023 13:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689687545; x=1721223545;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ycfc1Qu++37+7R/tsMCorNFBQkLWTq5T/YeJnCbFapU=;
 b=QgzH49GfL6SESQpKDOgmg+2SXI6xEdhXpmPpcMJrUVtbTOMYJGh/hQqu
 0/58MpY5h6jNlOZJ4xmYLQDRRtMUg8E/6vHjxgvH+f6BN2WPlwcOMUhVa
 GX5NNXT789el7ysCRcKSaNXEJg8bTQFBhsRZXJO/c+S/PJILYPqHNLM9i
 MT4pTEz5AsFrL2UYVJWC0N+9DOnGbfEtJ8ZdZ/7Q6iCpu/tG8kznw/PT2
 tISNR1tGDk82E5mQEZJXcDUzdNKnrxqEm/OvLTITF4TsHwRc4lMMXIcOY
 8ed1Xfb5STfIWt33uP+J3seLzHPjIHpAgNUdHuYYaQx3OOUMPFFQJZnV9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="429968938"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="429968938"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 06:39:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="673922157"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="673922157"
Received: from ygaydayc-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.35.242])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 06:39:00 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v5 1/9] drm-tip: 2023y-07m-17d-16h-04m-53s UTC integration
 manifest
Date: Tue, 18 Jul 2023 15:38:28 +0200
Message-Id: <20230718133836.574781-2-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230718133836.574781-1-andi.shyti@linux.intel.com>
References: <20230718133836.574781-1-andi.shyti@linux.intel.com>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Robert Foss <rfoss@kernel.org>

---
 integration-manifest | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 integration-manifest

diff --git a/integration-manifest b/integration-manifest
new file mode 100644
index 0000000000000..8642016b34817
--- /dev/null
+++ b/integration-manifest
@@ -0,0 +1,24 @@
+drm drm-fixes 38d88d5e97c9032ebeca092b9372209f2ca92cdf
+	Merge tag 'amd-drm-fixes-6.5-2023-07-12' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
+drm-misc drm-misc-fixes 05abb3be91d8788328231ee02973ab3d47f5e3d2
+	dma-buf/dma-resv: Stop leaking on krealloc() failure
+drm-intel drm-intel-fixes fdf0eaf11452d72945af31804e2a1048ee1b574c
+	Linux 6.5-rc2
+drm drm-next 6c7f27441d6af776a89147027c6f4a11c0162c64
+	Merge tag 'drm-misc-next-2023-07-13' of git://anongit.freedesktop.org/drm/drm-misc into drm-next
+drm-misc drm-misc-next-fixes 59bba51ec2a50e3dc5c3ee80f0a23207346303ff
+	drm/panel: Fine tune Starry-ili9882t panel HFP and HBP
+drm-intel drm-intel-next-fixes f6cf3883df471abbcf1553127681dc244c8ff8dd
+	drm/i915: use mock device info for creating mock device
+drm-misc drm-misc-next 41639b3a8b0f1f194dfe0577d99db70613f78626
+	drm/bridge: anx7625: Use common macros for HDCP capabilities
+drm-intel drm-intel-next c5741c5c1122b7944d9af185c83ab7056153259e
+	drm/i915/display: Do not use stolen on MTL
+drm-intel drm-intel-gt-next 8529e3777b7644d41105a06141574a24795f8348
+	drm/i915/gt: Do not use stolen on MTL
+drm-intel topic/core-for-CI c0ea2fa0491287dea97b384bec1b5a614408b8e3
+	drm/i915/gsc: define gsc fw
+drm-misc topic/i915-ttm 1e3944578b749449bd7fa6bf0bae4c3d3f5f1733
+	Merge tag 'amd-drm-next-5.16-2021-09-27' of https://gitlab.freedesktop.org/agd5f/linux into drm-next
+drm topic/nouveau-misc dfc4005f8c172eea359f9db08c3b2b0ff0153699
+	drm/nouveau/disp: move DAC load detection method
-- 
2.40.1

