Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C107BB0AEF9
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jul 2025 11:14:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1318410E0A5;
	Sat, 19 Jul 2025 09:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ajGrBT/U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 156CD10E0A5
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 09:14:50 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56J4ESq2032308
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 09:14:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=5wZDc5GWMWk
 tbr2LV45DqbpFgPyVLPIoTjpMyPCwwzY=; b=ajGrBT/UWPZPh3lDzNJCKksjJ58
 ScqhDdABcfpZ1w+Pw/FlHyanswabIFUYVjxiW2c0uAWzDWRwhDruiy58CXBe0OHV
 tYpBE68t5FVXquVTi88ZGucL9ul5eejn66A2LNvUqvRRgMg06QXf59zjKFaLuEBT
 zR+jQbGo1syi62E+OhIjEf5iTcn20thjkNH1cVBk4+XztCEfN7mSH9aMtbRzVkpb
 riEdOQqJSPb1nrNToDEWSsDUyFU9eeosMMGBXXfa/H6gvhX3ar95EbIygdcA6e5l
 icOxtA7C1CHRR/J/cQFL3S0tWECv3zJR3n5MqA/1tL76U9qbiHl1LZydpVA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 480459gcu1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 09:14:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e33af599bcso472553085a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 02:14:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752916488; x=1753521288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5wZDc5GWMWktbr2LV45DqbpFgPyVLPIoTjpMyPCwwzY=;
 b=FyNXeLK2FaVyOr6RKwnODZD/MTDO1+3gV/1c1lFFf8+UMegMI+hMcV0FQf9DV2LSdv
 V0cQPYQlx8LS0FafwXMYZUi4GZGH7cn0B9PjkTMiEczP25+or4y0bdLJNFMqXQqsRyrj
 Y45FAxm9aWl9IN0JGn3jodaytfr/Di4DvT08ezlS3OBdXdR+xGr0rjfeEcEWxAfze0OK
 MQLL4bKkwqzPuIspecGWcPTplm0rslvlIwnbHb0SRyTpIBD1CBCDtqmHbJyLJcUzfHid
 owj/beSU+A89qqo3wdlzD43qsuAC0pD483qFiBxgZdtLHWCj3WwbyG/tnY19heWl7rQs
 qHlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhdV0ZTdg8oJD5c55SUpVowZJYuf7YlHd95xOfr+g06GyO5IBOEIZRuoQ2N6X12J7ysE71i0kwcVg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yza40ZaiBUlPYv5z5h594OCQ9Sn6NgTcsyO8fQ8yupRPEnztdUi
 v3NJKkCiokcFfsbUwRWJEjdZQlpdJrwdyhN49IcWDUvZF89abx8pW3k/NvNnvMmvmycYJdmuX3T
 f9HRPHwQkgrEOsp/cwk40R1c1n23fnhSjgr/VQLT4rwfcD2JvRPv1sQUC1fjCaR2LxsVDPZk=
X-Gm-Gg: ASbGnct4oS1aIrXCH0shb+CEK5DpUTUFttS2wcoY7MowiEIthqvSCPa+RC/a1jP6hCp
 iAqwmh+hIfsw6Mp9aiEa6QbuffBFlUwaTng+19kltKISjcMSK9p1+xUilVB8FqH2ykzhEbbfb1f
 y72xg9g0WVnFuEhHupyuQVid+bJCzjq6it9Mb9A7asTBtY/WEkEkVdxZiv+nswlRT/5UvdtwE/u
 GD+j593YZkL8T1335I6VVJjbaa5wYGIqzMlSZ/u2AmWaxgBBXxizdBqssCJ5hmuyTGOJ8bMrnDc
 4pdF6B+Yi2Ne5N0NrVrCDG6t/eP2rAd4JEy0G0s2K2KKok2q4BCepFWP0t9ImpAgB4aFcBwjm3K
 vJ9sqdNQ066FOKwtUacwNdJWGU+jT9q/VY36XOhAZZciohyudfPFr
X-Received: by 2002:a05:620a:4050:b0:7e3:4415:bd05 with SMTP id
 af79cd13be357-7e34d9f79e2mr1305488785a.60.1752916488074; 
 Sat, 19 Jul 2025 02:14:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDAN35XkTBQM2UPvbexmAbV/sfM9zAiC11TqR3XTg/5fyKgjdicRbMY+x2+0LlwRcobf3JYQ==
X-Received: by 2002:a05:620a:4050:b0:7e3:4415:bd05 with SMTP id
 af79cd13be357-7e34d9f79e2mr1305486185a.60.1752916487632; 
 Sat, 19 Jul 2025 02:14:47 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-330a90d4ffasm5480891fa.6.2025.07.19.02.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 02:14:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
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
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Danila Tikhonov <danila@jiaxyga.com>,
 cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yongxing Mou <quic_yongmou@quicinc.com>
Subject: [PATCH] dt-bindings: display/msm: dp-controller: allow eDP for X1E8
 and SA8775P
Date: Sat, 19 Jul 2025 12:14:45 +0300
Message-Id: <20250719091445.3126775-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: c4FfXdCB00jkds7qFgymmBpi5D9PdUKz
X-Authority-Analysis: v=2.4 cv=fdyty1QF c=1 sm=1 tr=0 ts=687b6209 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=jb3qBSlP78txkkNFhucA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: c4FfXdCB00jkds7qFgymmBpi5D9PdUKz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDA5MSBTYWx0ZWRfX6Whtl8ghei25
 jFXgaLqPiLdBSvMvJEXnIbh90G0gS8DyI/JvK3KIOCWkc+yDjBPgx6m+YFkcY1OJwr0nz1eljsM
 4YqFEJRVq2U0gD5P/siY1orhWJxsrJP1H3XvhqLy74lNgrwY0MdTloXZ/KgmxHkPE2B/IbXjHPM
 i7CbAFn0ZUUVsEUqJGSDOD1WYYZiZVW0uhK0Q9JC5H3Tvilyi1UOuTpWX13KZs7ZXAzLvUDFXVR
 sVNSckOGz7l246p9k7YYr5QFaHHcNiXJEOEbvignbEyOf7IFuGlXzfOf+ucS+4OxCQr+IWwwDyy
 GyfMDpCV7RQlYUeiGqfuBAKFjpR8nln/YLVVBjZGwOlfPfZFz49Er2QbJ293LPxPQIiJOp3oNEv
 pInW532pQmRSav04o2WGActZiSeZ6aWyd1lwx+flNkQm5X91KnVgzXDxfwKciStIwYtVsNE4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507190091
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


On Qualcomm SA8775P and X1E80100 the DP controller might be driving
either a DisplayPort or a eDP sink (depending on the PHY that is tied to
the controller). Reflect that in the schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---

Jessica, your X1E8 patch also triggers warnings for several X1E8-based
laptops. Please include this patch into the series (either separately
or, better, by squashing into your first patch).

---
 .../bindings/display/msm/dp-controller.yaml   | 26 ++++++++++++++-----
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 4676aa8db2f4..55e37ec74591 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -176,12 +176,26 @@ allOf:
       properties:
         "#sound-dai-cells": false
     else:
-      properties:
-        aux-bus: false
-        reg:
-          minItems: 5
-      required:
-        - "#sound-dai-cells"
+      if:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - qcom,sa8775p-dp
+                - qcom,x1e80100-dp
+      then:
+        oneOf:
+          - required:
+              - aux-bus
+          - required:
+              - "#sound-dai-cells"
+      else:
+        properties:
+          aux-bus: false
+          reg:
+            minItems: 5
+        required:
+          - "#sound-dai-cells"
 
 additionalProperties: false
 
-- 
2.39.5

