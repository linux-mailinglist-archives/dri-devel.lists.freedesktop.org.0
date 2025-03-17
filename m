Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAB4A65B3F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 18:45:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 583F310E43D;
	Mon, 17 Mar 2025 17:45:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZgMYlpOR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6603310E445
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 17:45:15 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52H9sQ6t014469
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 17:45:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BIfQsL2iT8Vojwl752N46gCkIs1NOpwnmBShRu8QyCE=; b=ZgMYlpOR55GnVOj7
 fBBw1lk7w+B7mvp39telgV+7q2pQ2PgqVjVzXtvUHuFv2X+p/o4RZTEAKRXocECB
 ouNQo9rS21GzhPkEMNKwjVqfOfkap4OXbFtlcbHuuGwXpbff0bL8RoGIqYUWYffl
 VesEkk3UAmA6qS1hkg7D/KP3uLro1YHlVnRcBzjTUlGr36Od4/oyTrqPUTo7ybeu
 5C8BjLXr4FAE6MEDreSJFznvHEvyZXbf2qPt3sNM01kf23hTZUJAuYhGeQyoilbq
 nptJ7e7gd05Gwk1U9dCvMPpc2+4MVfShexwxSygP58byvgNeiVs6oybcssCU50jA
 PnxU3Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1rdnkar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 17:45:14 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e8f64eb467so46067866d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 10:45:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742233513; x=1742838313;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BIfQsL2iT8Vojwl752N46gCkIs1NOpwnmBShRu8QyCE=;
 b=Hw2tDvW5aLxLQ2ishjZPSHjKBIdKz8TzmXMwfczu7tWZaaJkowAGlPHcVWKQeLIQnJ
 Ab11pBfMQ0mcRVpN4NCPX7U+bIrrnI6s/HXDVyBn28ym4Rq+BCKg4+btDxA2ki62rxDW
 l3fVj08LAn4XXOxC8laARM9ndgY5MWt8BZ1TFTlGYtOagTEhpH5JIk5vaWJGulZHSXb4
 PIdRTArxeE5bWd8NGnw6mjaza283mb0NDg/B2+2LRQ3EnKm5UrIguxTknnSmoJI+z6z9
 wn8Rxf2t4OhwZitJf6m5FKyi8t21rEdsPOUWnYklDwHDU4FVbRWNhYhQGRUwjb7S1p4y
 jxdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmVUhZSuIpu2+ri6aXHzZ/Jgz3QTFksih4vIGe53JgzVBuSlpuwJcDw39VIWuo2TqtcgTy/Z9Tmoc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzaDGHcVQ5tcSR/ZNmXn0PYh4W+2gA3so/7/XKagkg4dAqYE9sP
 Ep6/lS8caVrLEwS30SF6bNFZsP0V4daxgpq+wjE1HVDyzJeWn344hEw7+WPiITqTYFiOZqMLOGy
 4T7PewIfcLS3+Wb8k3Mm2ZLq/DJVnJwPiO6c+oW/FRW49dKehoz5TTCiURjoj0qtLG/A=
X-Gm-Gg: ASbGnct1TdOFJO3FEEfVbxROZWpTXrag66QINBgJpm3fN4Qe5Mm2XfJIyQyDRivoGYH
 LpiSkV4FSATNgp4+Kcy2D6XW400e2QIWP6/whGsqREDoPcwE+ZjT/4QsdfDj19Dx8EbX06PxcGV
 q8DkfIyCTsRkmq2nN/q/kl69ZZJ7T/76WT0JhSWqoj+gGuV4YlCPpoVNXgzTtZlPq7qSyhieKvi
 PI3ywnaHa4oWIaZbKbwvKwLx9dpNbJYYra8x+KcjmPtrEOWyhTefZtx87DsFzbtr1k3xM0vSa7D
 mJPH00Z7u9BLOBewstsw80y2uTlbNWYyui/ewf5JmArNaahrVAasTCP18Ag0sqMGlc5iF5ta1yB
 iybc6Bz+E+1pjomNL2lvmtEE47ZY3
X-Received: by 2002:a05:6214:20ee:b0:6e8:f5db:d78d with SMTP id
 6a1803df08f44-6eaeaa5a6b7mr224159386d6.23.1742233513514; 
 Mon, 17 Mar 2025 10:45:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYgxdPJBjLMewB5Os7FteoqkvzgM2ai7zlUrwns9EoES+m5mpM+FpX3PxuwQRQFq5RiVor7g==
X-Received: by 2002:a05:6214:20ee:b0:6e8:f5db:d78d with SMTP id
 6a1803df08f44-6eaeaa5a6b7mr224158606d6.23.1742233513034; 
 Mon, 17 Mar 2025 10:45:13 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30c3f0e9985sm16687121fa.29.2025.03.17.10.45.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 10:45:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 17 Mar 2025 19:44:44 +0200
Subject: [PATCH 9/9] ARM: dts: qcom: apq8064: move replicator out of soc node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-fix-nexus-4-v1-9-655c52e2ad97@oss.qualcomm.com>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
In-Reply-To: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
 Andy Gross <agross@codeaurora.org>,
 "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
 Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
 David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2293;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cXGjXqVy8K2SBVw5sm4rAWVu9NhYJGWmhFXtjX3HVog=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn2F+Hk+AmZlISZmVl7Lpy8dz0TRbk8xjIClt1/
 8vj+7Cr/ZSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9hfhwAKCRCLPIo+Aiko
 1QEOB/9oIWXP9+8fWr3P541oQaJjWj4TBJmLvCUTleczJ/+JGOLGxqemoc3v7V0oXDhOpswBqDi
 WEt/pceqTFyCcwIhooUPzKq4CCjbj2bA710wPPkkSzjyZkxMltoHOB+Z1SDWBd9Tk0hjZX4WZC0
 YYPrAUbnKPrcDFPEKpM2Z8Xlxh4xLbwPKvRBzcrWeqCzqgszf/LSY6/OBCWBYJo++JPbPUSDDTj
 wJMCFMNLkg+MWXK0ssjlsEKwEcJ6rlAb6REz/gRwhXTv/XWHUS3F/NwyAykfJ6BPtCR6Lq42bvK
 BndmfW5J9cf4mJoWj1QPk8q9wYriamZbAm+lwV6u1T3zYgbR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Fe83xI+6 c=1 sm=1 tr=0 ts=67d85faa cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=VZa1NNXYgzzwgHkDN88A:9 a=QEXdDO2ut3YA:10
 a=usmIGj8zAoogrc2OpcRK:22 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: sN9-WdZErU6yC6B-IyHt2r18mvEtaYF6
X-Proofpoint-GUID: sN9-WdZErU6yC6B-IyHt2r18mvEtaYF6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 mlxlogscore=935 spamscore=0
 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170128
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

The CoreSight replicator device isn't a part of the system MMIO bus, as
such it should not be a part of the soc node. Follow the example of
other platforms and move it out of the soc bus to the top-level.

Fixes: 7a5c275fd821 ("ARM: dts: qcom: Add apq8064 CoreSight components")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 66 ++++++++++++++++----------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index a106f9f984fcb51dea1fff1515e6f290b36ccf99..acd94f3ba0350c5dcdd8f80885ee643d8cbddac7 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -278,6 +278,39 @@ scm {
 		};
 	};
 
+	replicator {
+		compatible = "arm,coresight-static-replicator";
+
+		clocks = <&rpmcc RPM_QDSS_CLK>;
+		clock-names = "apb_pclk";
+
+		out-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				replicator_out0: endpoint {
+					remote-endpoint = <&etb_in>;
+				};
+			};
+			port@1 {
+				reg = <1>;
+				replicator_out1: endpoint {
+					remote-endpoint = <&tpiu_in>;
+				};
+			};
+		};
+
+		in-ports {
+			port {
+				replicator_in: endpoint {
+					remote-endpoint = <&funnel_out>;
+				};
+			};
+		};
+	};
+
 	soc: soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1529,39 +1562,6 @@ tpiu_in: endpoint {
 			};
 		};
 
-		replicator {
-			compatible = "arm,coresight-static-replicator";
-
-			clocks = <&rpmcc RPM_QDSS_CLK>;
-			clock-names = "apb_pclk";
-
-			out-ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-					replicator_out0: endpoint {
-						remote-endpoint = <&etb_in>;
-					};
-				};
-				port@1 {
-					reg = <1>;
-					replicator_out1: endpoint {
-						remote-endpoint = <&tpiu_in>;
-					};
-				};
-			};
-
-			in-ports {
-				port {
-					replicator_in: endpoint {
-						remote-endpoint = <&funnel_out>;
-					};
-				};
-			};
-		};
-
 		funnel@1a04000 {
 			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 			reg = <0x1a04000 0x1000>;

-- 
2.39.5

