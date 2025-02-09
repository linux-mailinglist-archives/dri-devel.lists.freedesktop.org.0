Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9DCA2E0EA
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 22:43:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A5C10E08B;
	Sun,  9 Feb 2025 21:43:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3BFB10E097
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 21:43:06 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 62CA0201A0;
 Sun,  9 Feb 2025 22:43:01 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun, 09 Feb 2025 22:42:54 +0100
Subject: [PATCH v2 3/3] drm/msm/dpu: Remove arbitrary limit of 1 interface
 in DSC topology
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-3-9a60184fdc36@somainline.org>
References: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-0-9a60184fdc36@somainline.org>
In-Reply-To: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-0-9a60184fdc36@somainline.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1941;
 i=marijn.suijten@somainline.org; h=from:subject:message-id;
 bh=MISpjNQDduNCQaMv+FDe9UPH/b1M9QDcUgD33v4LDzE=;
 b=owEBbQKS/ZANAwAIAfFi0jHH5IZ2AcsmYgBnqSFiMrpbQ6WiYf+MMArHU1I7Px3DbgZzKq8lk
 3W9qK7uUI2JAjMEAAEIAB0WIQROiwG5pb6la1/WZxbxYtIxx+SGdgUCZ6khYgAKCRDxYtIxx+SG
 diK6D/9E7oN6A/G/3pmaZELoM0OFBnd+tUkLTENa+EUGxCiRrM9Jl9UZdpdDgI4Ea0n7WysXog3
 Lw61q1clOL7e13anQXZwr9dhyKqnKrkFAU9mbYuS3Nb0SUhlDPOSTjhw79fR3eOe/iep5/8g17y
 hnQrAhRafDc2WOYxqNgqtVYtMeIDR+fzfkjyxG7VaHWmUTJWHXZEUfDC0G2pAy07yJlmNr+H8ym
 9ektnEPZWOHZg4fVhAsa+NoXvOIFeEVINX8Bv7ggNID6fiCCjQFbFRgCowxbz5K16lEBWeHKkoa
 G6JygUN4ckbRVLpkCpfkxBQWul7F+HM0ulQr+/tiWNsozzYwiCOESiK9kQhxboJe0hqiqJVYYey
 r52TeK9RrlQEspoheHJ2jU1HJwZNLRz9E+8qX+lhBNZZDmnhftfCf9WZq9C3tkIqvgwwLReyZq4
 KuHY48uvJ5IPKz0lxrp+bXrQIv5XqHjLJGn5PSjUiuWkYS3R/Ypt6o3kdHGAh01WsMKTIShJt4R
 /UPrPdo70PPc443pwR7v6UPt3Ws2Zl/SjpCM01YG0p6hwW/ZkssdK7K7OsF9NnoeK4w/wopBe8R
 S2jWDYD60LANft8bu6rvF6m8rk+3Fu+g0ElU9vvzrup6KKj2d+j1DZgqC9AAXvWwzA1p+8CyKaV
 iC4T4SNPjMj9shA==
X-Developer-Key: i=marijn.suijten@somainline.org; a=openpgp;
 fpr=4E8B01B9A5BEA56B5FD66716F162D231C7E48676
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

When DSC is enabled the number of interfaces is forced to be 1, and
documented that it is a "power-optimal" layout to use two DSC encoders
together with two Layer Mixers.  However, the same layout (two DSC
hard-slice encoders with two LMs) is also used when the display is
fed with data over two instead of one interface (common on 4k@120Hz
smartphone panels with Dual-DSI).  Solve this by simply removing the
num_intf = 1 assignment as the count is already calculated by computing
the number of physical encoders within the virtual encoder.

Fixes: 7e9cc175b159 ("drm/msm/disp/dpu1: Add support for DSC in topology")
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index b585cd17462345f94bcc2ddd57902cc7c312ae63..b0870318471bd7cceda70fd15ea7bcc8658af604 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -686,20 +686,21 @@ static struct msm_display_topology dpu_encoder_get_topology(
 
 	if (dsc) {
 		/*
-		 * Use 2 DSC encoders and 2 layer mixers per single interface
+		 * Use 2 DSC encoders, 2 layer mixers and 1 or 2 interfaces
 		 * when Display Stream Compression (DSC) is enabled,
 		 * and when enough DSC blocks are available.
 		 * This is power-optimal and can drive up to (including) 4k
 		 * screens.
 		 */
-		if (dpu_kms->catalog->dsc_count >= 2) {
+		WARN(topology.num_intf > 2,
+		     "DSC topology cannot support more than 2 interfaces\n");
+		if (intf_count >= 2 || dpu_kms->catalog->dsc_count >= 2) {
 			topology.num_dsc = 2;
 			topology.num_lm = 2;
 		} else {
 			topology.num_dsc = 1;
 			topology.num_lm = 1;
 		}
-		topology.num_intf = 1;
 	}
 
 	return topology;

-- 
2.48.1

