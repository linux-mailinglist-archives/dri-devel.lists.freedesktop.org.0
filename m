Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E831A4F195C
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 18:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE1110E8C1;
	Mon,  4 Apr 2022 16:35:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 214AA10E8C1;
 Mon,  4 Apr 2022 16:35:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BE6A3B816F4;
 Mon,  4 Apr 2022 16:35:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BADBC34112;
 Mon,  4 Apr 2022 16:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649090147;
 bh=3b1F2B8ms+UwG0xj2WiyH5qONSrPe+dWWcXNb6zQy0o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nTtiZGf4j3527eIXyN6IBwA6tFHTmzoFd6AXHs0oS4piaexE4NBzSdqQA0f5D+f0T
 p1ijOowJXQHOl0JwYzm3J3s+lyW/MVzwkTslJkdyBjLIeg34IMOsnSTAQPTeWtJ9Fd
 ettqslusBGsL7ERlFhDesNKQqYulYFggNhCRJgwOQxjLIYOc7Z5LF/qqVadYK3uxtu
 c5NeRsy/xwF5JOW720Iudqzz8L9Q7YGRA3y+Jn1z/DDoyCYeXCN4Gh6eHsX7qL8hjO
 O/wni6rH18ZW4HsLJReVlw3jbB5aKGxsUJ0lUTWCPF7RfC6HDeT89xKllW/GRzQCi4
 yZLaOurXRI2Qg==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH v6 13/14] drm/msm: Update generated headers
Date: Mon,  4 Apr 2022 22:04:35 +0530
Message-Id: <20220404163436.956875-14-vkoul@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220404163436.956875-1-vkoul@kernel.org>
References: <20220404163436.956875-1-vkoul@kernel.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update headers from mesa commit:

  commit 28ae397be111c37c6ced397e12d453a7695701bd
  Author: Vinod Koul <vkoul@kernel.org>
  Date:   Fri Apr 1 16:53:04 2022 +0530

      freedreno/registers: update dsi registers to support dsc

      Display Stream compression (DSC) compresses the display stream in
      host which is later decoded by panel. This requires addition of 3 new
      DSI registers to support DSC over DSI.

      Signed-off-by: Vinod Koul <vkoul@kernel.org>
      Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14967>

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/gpu/drm/msm/dsi/dsi.xml.h | 80 +++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h b/drivers/gpu/drm/msm/dsi/dsi.xml.h
index 4dee6f0bdda6..d1b2a17b0a66 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
@@ -704,5 +704,85 @@ static inline uint32_t DSI_VERSION_MAJOR(uint32_t val)
 
 #define REG_DSI_CPHY_MODE_CTRL					0x000002d4
 
+#define REG_DSI_VIDEO_COMPRESSION_MODE_CTRL			0x0000029c
+#define DSI_VIDEO_COMPRESSION_MODE_CTRL_WC__MASK		0xffff0000
+#define DSI_VIDEO_COMPRESSION_MODE_CTRL_WC__SHIFT		16
+static inline uint32_t DSI_VIDEO_COMPRESSION_MODE_CTRL_WC(uint32_t val)
+{
+	return ((val) << DSI_VIDEO_COMPRESSION_MODE_CTRL_WC__SHIFT) & DSI_VIDEO_COMPRESSION_MODE_CTRL_WC__MASK;
+}
+#define DSI_VIDEO_COMPRESSION_MODE_CTRL_DATATYPE__MASK		0x00003f00
+#define DSI_VIDEO_COMPRESSION_MODE_CTRL_DATATYPE__SHIFT		8
+static inline uint32_t DSI_VIDEO_COMPRESSION_MODE_CTRL_DATATYPE(uint32_t val)
+{
+	return ((val) << DSI_VIDEO_COMPRESSION_MODE_CTRL_DATATYPE__SHIFT) & DSI_VIDEO_COMPRESSION_MODE_CTRL_DATATYPE__MASK;
+}
+#define DSI_VIDEO_COMPRESSION_MODE_CTRL_PKT_PER_LINE__MASK	0x000000c0
+#define DSI_VIDEO_COMPRESSION_MODE_CTRL_PKT_PER_LINE__SHIFT	6
+static inline uint32_t DSI_VIDEO_COMPRESSION_MODE_CTRL_PKT_PER_LINE(uint32_t val)
+{
+	return ((val) << DSI_VIDEO_COMPRESSION_MODE_CTRL_PKT_PER_LINE__SHIFT) & DSI_VIDEO_COMPRESSION_MODE_CTRL_PKT_PER_LINE__MASK;
+}
+#define DSI_VIDEO_COMPRESSION_MODE_CTRL_EOL_BYTE_NUM__MASK	0x00000030
+#define DSI_VIDEO_COMPRESSION_MODE_CTRL_EOL_BYTE_NUM__SHIFT	4
+static inline uint32_t DSI_VIDEO_COMPRESSION_MODE_CTRL_EOL_BYTE_NUM(uint32_t val)
+{
+	return ((val) << DSI_VIDEO_COMPRESSION_MODE_CTRL_EOL_BYTE_NUM__SHIFT) & DSI_VIDEO_COMPRESSION_MODE_CTRL_EOL_BYTE_NUM__MASK;
+}
+#define DSI_VIDEO_COMPRESSION_MODE_CTRL_EN			0x00000001
+
+#define REG_DSI_COMMAND_COMPRESSION_MODE_CTRL			0x000002a4
+#define DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM1_DATATYPE__MASK	0x3f000000
+#define DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM1_DATATYPE__SHIFT	24
+static inline uint32_t DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM1_DATATYPE(uint32_t val)
+{
+	return ((val) << DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM1_DATATYPE__SHIFT) & DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM1_DATATYPE__MASK;
+}
+#define DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM1_PKT_PER_LINE__MASK	0x00c00000
+#define DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM1_PKT_PER_LINE__SHIFT	22
+static inline uint32_t DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM1_PKT_PER_LINE(uint32_t val)
+{
+	return ((val) << DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM1_PKT_PER_LINE__SHIFT) & DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM1_PKT_PER_LINE__MASK;
+}
+#define DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM1_EOL_BYTE_NUM__MASK	0x00300000
+#define DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM1_EOL_BYTE_NUM__SHIFT	20
+static inline uint32_t DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM1_EOL_BYTE_NUM(uint32_t val)
+{
+	return ((val) << DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM1_EOL_BYTE_NUM__SHIFT) & DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM1_EOL_BYTE_NUM__MASK;
+}
+#define DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM1_EN		0x00010000
+#define DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE__MASK	0x00003f00
+#define DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE__SHIFT	8
+static inline uint32_t DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(uint32_t val)
+{
+	return ((val) << DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE__SHIFT) & DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE__MASK;
+}
+#define DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_PKT_PER_LINE__MASK	0x000000c0
+#define DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_PKT_PER_LINE__SHIFT	6
+static inline uint32_t DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_PKT_PER_LINE(uint32_t val)
+{
+	return ((val) << DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_PKT_PER_LINE__SHIFT) & DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_PKT_PER_LINE__MASK;
+}
+#define DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_EOL_BYTE_NUM__MASK	0x00000030
+#define DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_EOL_BYTE_NUM__SHIFT	4
+static inline uint32_t DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_EOL_BYTE_NUM(uint32_t val)
+{
+	return ((val) << DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_EOL_BYTE_NUM__SHIFT) & DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_EOL_BYTE_NUM__MASK;
+}
+#define DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_EN		0x00000001
+
+#define REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2			0x000002a8
+#define DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM1_SLICE_WIDTH__MASK	0xffff0000
+#define DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM1_SLICE_WIDTH__SHIFT	16
+static inline uint32_t DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM1_SLICE_WIDTH(uint32_t val)
+{
+	return ((val) << DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM1_SLICE_WIDTH__SHIFT) & DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM1_SLICE_WIDTH__MASK;
+}
+#define DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM0_SLICE_WIDTH__MASK	0x0000ffff
+#define DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM0_SLICE_WIDTH__SHIFT	0
+static inline uint32_t DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM0_SLICE_WIDTH(uint32_t val)
+{
+	return ((val) << DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM0_SLICE_WIDTH__SHIFT) & DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM0_SLICE_WIDTH__MASK;
+}
 
 #endif /* DSI_XML */
-- 
2.34.1

