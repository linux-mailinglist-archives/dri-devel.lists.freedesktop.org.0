Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 540F621D623
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jul 2020 14:42:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 695956E226;
	Mon, 13 Jul 2020 12:42:07 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BFC96E226
 for <dri-devel@freedesktop.org>; Mon, 13 Jul 2020 12:42:05 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1594644126; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=qvFYV5gSdJN7uGe/5cfb+tk9FUbHSiqsuZE2Uf3f6Vs=;
 b=hWuEls5h01ZYYd3A0uLmDe3s8uHDcRgVadFlU0/o7BmskinL5n2SsSDsA0UAKvHa07ooQa9l
 7mJBqM2X1U17RSGzPgVVfifb097YxKVGn6zDWRaXjkZ3xeSo6T0/GRkS6hyHVzrEDQ+V/GUr
 ka+uVL1F2+JYBbUudyG1wUzBlkg=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5f0c569bee86618575b6bcd6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 13 Jul 2020 12:42:03
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 13E3BC43387; Mon, 13 Jul 2020 12:42:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akhilpo-linux.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D7B2EC433CA;
 Mon, 13 Jul 2020 12:41:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D7B2EC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=akhilpo@codeaurora.org
From: Akhil P Oommen <akhilpo@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v5 1/6] dt-bindings: drm/msm/gpu: Document gpu opp table
Date: Mon, 13 Jul 2020 18:11:41 +0530
Message-Id: <1594644106-22449-2-git-send-email-akhilpo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
References: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, jonathan@marek.ca, saravanak@google.com,
 linux-arm-msm@vger.kernel.org, smasetty@codeaurora.org,
 linux-kernel@vger.kernel.org, mka@chromium.org, dri-devel@freedesktop.org,
 viresh.kumar@linaro.org, sibis@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sharat Masetty <smasetty@codeaurora.org>

Update documentation to list the gpu opp table bindings including the
newly added "opp-peak-kBps" needed for GPU-DDR bandwidth scaling.

Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---
 .../devicetree/bindings/display/msm/gpu.txt        | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.txt b/Documentation/devicetree/bindings/display/msm/gpu.txt
index fd779cd..1af0ff1 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.txt
+++ b/Documentation/devicetree/bindings/display/msm/gpu.txt
@@ -112,6 +112,34 @@ Example a6xx (with GMU):
 		interconnects = <&rsc_hlos MASTER_GFX3D &rsc_hlos SLAVE_EBI1>;
 		interconnect-names = "gfx-mem";
 
+		gpu_opp_table: opp-table {
+			compatible = "operating-points-v2";
+
+			opp-430000000 {
+				opp-hz = /bits/ 64 <430000000>;
+				opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+				opp-peak-kBps = <5412000>;
+			};
+
+			opp-355000000 {
+				opp-hz = /bits/ 64 <355000000>;
+				opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+				opp-peak-kBps = <3072000>;
+			};
+
+			opp-267000000 {
+				opp-hz = /bits/ 64 <267000000>;
+				opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+				opp-peak-kBps = <3072000>;
+			};
+
+			opp-180000000 {
+				opp-hz = /bits/ 64 <180000000>;
+				opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+				opp-peak-kBps = <1804000>;
+			};
+		};
+
 		qcom,gmu = <&gmu>;
 
 		zap-shader {
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
