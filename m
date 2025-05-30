Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EE1AC9505
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 19:47:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0DE610E85D;
	Fri, 30 May 2025 17:47:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FLvuOCyq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D28B910E815
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 17:47:45 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UBo9aR018019
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 17:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 G3Yaqy14zRsDj/Izz9GTItYivVNTdDctP3/IaDWEKC8=; b=FLvuOCyqwowbjxsp
 yBk8vn5Sb1CkQ9OqQ/c3/gQWkWbn2Hia9PPIm0Ebc5BQvtUOcseAd/J4UK05Iq25
 jxo2avGTqcL3DcijyLXC+KeVKPWAvEoaCSjhmKE5A2jOwSLin+35hJ2zPWdhGdZJ
 nH87I7y4JLJwDElm7f/lhOlfYi0+sIzqmD5x3Jqpf/pr7+v9+n5veQ8RIJYWu/ab
 3wSkorySUWquBnxVQ1Wi5Vx6og4pMvLQvQe3QDPa4nDSZ/0MyKuv1dzmTW8vY8jy
 /FoT/DEISvDHyFc6/xcGQuTCx1xNHxRi7+1TToScl5xpsK+i+VC/JhV0tpyZtRSR
 P/JobQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46yc4ys3sw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 17:47:45 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b2c38df7ed2so1680770a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 10:47:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748627264; x=1749232064;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G3Yaqy14zRsDj/Izz9GTItYivVNTdDctP3/IaDWEKC8=;
 b=vRtoRGZE+JghiCgRfHP/Th26WBplCvo7ESabfAWQNadwVPde9X7uPkxs5fspj4z7it
 5zz260wlarXQvd8UqAuPXJsIkAzyJZbwH4V+rqT0LrPlTk92LXGg9PwrMRAxFA5barpb
 W1sv5hdH9K7HzD6W8wb93KthLZHVnYvGeQ/Wqu99rIt3CDg+quGu64c0fqTzvUnw+XyE
 ElaHfPknBrLsVcuKvQuaMG0UiPGMvUEODEtLXtLA63dOySx/QG/CaQPKb0xNqJOsuCiJ
 48KEE9Drs0qIRocVMg41EPG8Y60Uag9wp1dHusC50V5bZSG3MIaYDtErCYf0Pc068DyH
 FQUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUh/cOMgs/CfvVxgLMAFSJJDHlJ69PcTUIQKyURUT8xnV3MSd5ZCIYIx9Aj9dr7s7i8UrL060bQuAs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5KYRWCpNzPyANNUgbfDZxZQVkTMguC7LSIO9qY56XXSDkLqdV
 5eNDDp2Y4NOwkQAH2Mkx3geQSChMs7vKFnMCTkpxi8vNn9RNSI35YqG9avcSPi1nEqMxW9G9/Mz
 hwyMp3GP/70DAt2g7/M1oYeoPmKv7lUtMRt+ysAgEtmAhSVraBY8R9L6/ACaH3D68KB5KmZw=
X-Gm-Gg: ASbGncsW+o/vAG8ZSyZjW1ux3d/NNbLz2s8thU69cpA+zQmLGWb1nMKufO0E4sevnJI
 ncTqlutouwBnigLAQWg41HmSTq8GvCqYmAsP3OBT6JwU6RvSPhgLSgVrhkS0/0yanUKTcvbBCop
 cQE1Yo+GMY14Pjtg4yLczlE0ymAxvTzM1l7IHQhDGckY3psGg/5bBeb491m0GRZZI4W0ZcEMU5/
 dhQGQwn/WR+69ZHvmhVnwkSKn/Zp/SaEJuWlaSQBR3G8LP1N13FPAPvJBlxFhFL0Ag2kCyslkqa
 4zafrDyUc5iJojxjEf5P/7Utf/8ip782eXFJin8cWul+TLqva4rsZHJh6NbZm9rJPiuYhTam
X-Received: by 2002:a17:90b:54ce:b0:311:e731:523a with SMTP id
 98e67ed59e1d1-31241532eb7mr7091878a91.11.1748627264426; 
 Fri, 30 May 2025 10:47:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtRyWpC+3J4vARPUxNqzxp7BkyRVcIjF8pzurxuAfBXAhl/rjeV8CUFFYkLjSxulswmYqtTg==
X-Received: by 2002:a17:90b:54ce:b0:311:e731:523a with SMTP id
 98e67ed59e1d1-31241532eb7mr7091826a91.11.1748627263967; 
 Fri, 30 May 2025 10:47:43 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3124e399b0fsm1615381a91.30.2025.05.30.10.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 10:47:43 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 30 May 2025 10:47:24 -0700
Subject: [PATCH v2 1/5] dt-bindings: Fixup x1e80100 to add DP MST support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-dp_mst_bindings-v2-1-f925464d32a8@oss.qualcomm.com>
References: <20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com>
In-Reply-To: <20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Danila Tikhonov <danila@jiaxyga.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748627260; l=2367;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=7Nf93rJk1Jau571xR4KogJtaiOBtO9isp+SwjgHQiMA=;
 b=/V8/oYxYroVmei3jP22ho13u9RU9te5O8gMSJvS2fsv5LzCmRzxuZ7SWGvcuaJNzLm5NDHvH6
 Z+SX6xZyosxCjhFzne33X5dJrRH6cXF1LJw0ZmHLBJgAd87nGUHIeH7
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE1NiBTYWx0ZWRfX75PqONrW7Ka+
 3qInKu/Jc+No2FATJDhk0G5bHxxsKfiR/tJAI8fUS7zsqS5mJdyqiQS6ySMy9BGaJQRM+UuCAkE
 e4Z15fvUg3NrMMrUAH40uLIR51dvW/NGV8Ek4Brg6q+WcoKY2LimZU3eDkTmTwSj65GjGC1O9oZ
 gT8K5dKp6nVOd/f2LhrrGHN9ZHbGvL1aElgvubSDOhAwssWMxSs5t/KaB/R9LHcktpLz22UJd6M
 Y3m+8bkzvKNOIku2e+ONWsdGfxH83xk5lizHn0cF/2gn0Tp2P1y34mK5UUYSKSPD/IevQ1ZSjJt
 ucWlpwQbAes4U2cXrom05xAJ3RKk7tWh2bSHLzFv/6FzoFK6AAb0MwYNODQTbDNN1S7zw223w+Z
 MKCwzOHVFQIb/eHKW91NU+b7eXbGhKNuBeUwty2rkcmKHGjixAkABAxFirywF4zB7AWB9ob4
X-Authority-Analysis: v=2.4 cv=Ybe95xRf c=1 sm=1 tr=0 ts=6839ef41 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=l8kPDwqpA12hi6-TC14A:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: sSXu3Sv0qdnqW1iYjLFMhjQACp3h-C8w
X-Proofpoint-ORIG-GUID: sSXu3Sv0qdnqW1iYjLFMhjQACp3h-C8w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_08,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 mlxlogscore=763 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 mlxscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300156
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add x1e80100 to the dp-controller bindings, fix the
displayport-controller reg bindings, and drop
assigned-clock-parents

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml       |  2 ++
 .../devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml  | 12 +++++-------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 246bbb509bea..46a50ca4a986 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -29,6 +29,8 @@ properties:
           - qcom,sdm845-dp
           - qcom,sm8350-dp
           - qcom,sm8650-dp
+          - qcom,x1e80100-dp
+
       - items:
           - enum:
               - qcom,sar2130p-dp
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
index 3b01a0e47333..791de8a277cb 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
@@ -170,11 +170,11 @@ examples:
 
         displayport-controller@ae90000 {
             compatible = "qcom,x1e80100-dp";
-            reg = <0 0xae90000 0 0x200>,
-                  <0 0xae90200 0 0x200>,
-                  <0 0xae90400 0 0x600>,
-                  <0 0xae91000 0 0x400>,
-                  <0 0xae91400 0 0x400>;
+            reg = <0xae90000 0x200>,
+                  <0xae90200 0x200>,
+                  <0xae90400 0x600>,
+                  <0xae91000 0x400>,
+                  <0xae91400 0x400>;
 
             interrupt-parent = <&mdss>;
             interrupts = <12>;
@@ -191,8 +191,6 @@ examples:
 
             assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
                   <&dispcc_mdss_dptx0_pixel0_clk_src>;
-            assigned-clock-parents = <&usb_1_ss0_qmpphy QMP_USB43DP_DP_LINK_CLK>,
-                  <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
             operating-points-v2 = <&mdss_dp0_opp_table>;
 

-- 
2.49.0

