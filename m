Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CA4A65B3D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 18:45:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D68110E43C;
	Mon, 17 Mar 2025 17:45:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SUyJSoRU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F50710E43B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 17:45:11 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HAnT5e031930
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 17:45:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oI8X4OOQjroDHAkkPzLdr0WBC9OWilOtC8rBPPB07GM=; b=SUyJSoRUOxH9Kzpb
 Vvl8fhigo+vUcfa6LVVdpCqsTjSjyAoWgmMxNRx6jSDXAAZctIvwbBpbVrAoWGrr
 r/q/T9uzD7BqenFSjgCusCLpOp1le3Oj/6uJaDrJOzw1ZyC+3v3tsiowaBTLRXc/
 oTDN7qBiBNksunyEKo71xIl2M3wCmYritX7XvF4EpH1XrHOjQtSpKkW7/fFrxjWi
 bX7T9eKtMmEPST43Kt8ywg9cFUk2CYXsYOA22HQuUfSAJJkzV/Ev+bNfTvzmW279
 SZ0JTyCJbINoeGBmLVx+29PJosRBgfgLoFsR3fx78612V6jCvp+uYODMCRVFVanN
 1B8HyQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1utwg2u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 17:45:10 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e90b13f5c3so104488886d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 10:45:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742233509; x=1742838309;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oI8X4OOQjroDHAkkPzLdr0WBC9OWilOtC8rBPPB07GM=;
 b=poTxqp8faWJZCjYVqi/FxqODE1Y6kVQmFBiLcP5SNFnvwm8ZFTxXjKajTrmMQmC33A
 pjN6yxTGKPy89bhsTD4rmefRv1PwKEk/jKDLQd2kBjTxwKGVwp9GNEOckm+H1Hi7caVr
 sqztH1Eti/PoA9RzEBRSRNyGnOd34fwOB9EDPhKxW0B5qfiYbg9qFbHp2mEuP1ZIPRD7
 RaUdIeb3PiTQDeQ1jWaxbJXWoYgE82GAKpkJAOAUjXfSxvqYHTHhD22KI3q9J9zmEd5K
 u6hUAEM2KBKkXFiZabve4iWYv1Rg6XwmHTuZRj3EnDOn9C1zUBHnCD410p38JdxivDR8
 3i5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2PjxKTG6sPqBS8RhkpMhntCRKe+fEKmcA4lM+f9Us0QD71SiNmk6ymOuxVLbE/H4y+BYPEmnSljU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTFEptYW/Ufus5AcvCkEFI6gjzZO7fz7dUp8ty5MMSmJh9X2F8
 NhqKFTQ7R6X/FY4gTocRWM/8qYUqSnGmcs9643I4JX//BReqbW+XjlkOfyFNBgQPgc2/tkst8VB
 in/m33hrtIn91rmSRotX0YdwfNoqZoVjr74fw29LdY2Ak8CJ1+96Wc/L6EO6ZfyRyuNA=
X-Gm-Gg: ASbGncuh2Z0zm4x/+dHEa8WfuqDG3WAS1jZvQyQ8A4J+QGICnxxmDk7xto1mh68ToFc
 WoQ7X11hpk1IeebnIyaO7sHR5gNwiUbujmMB/BdkdEfin35gRFYE2lt5WwMeH/7AsW2cH/E/bwr
 2Yeh+Cq4vo8OejPZsW1NMw+RRZiHDJTZit04rzH+Xi5DHbeljU/Wf7SB50iQ4t+MIqvd7KLq+wp
 gLXkvzkv0PkUpYxDBlkh25zFk0eLdRfxRTSp+CNimio35EGJIXZc5jcUO8ejWM6X3ai/9pUiky+
 SaKZx2i0ajIbdW5q17q6Eh/vutqRo3RnWeVe6L0s/TNc6EZXh29msLZDU8DvVPXX4HwiFcbY/8R
 t52JQq4y4Hn8tEN2Y3Mg3x4AUOg5v
X-Received: by 2002:a05:6214:1d22:b0:6e8:feae:9291 with SMTP id
 6a1803df08f44-6eaeaa5f7efmr173160716d6.24.1742233509605; 
 Mon, 17 Mar 2025 10:45:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxv7impz0+MvxZjln6Fe8dQxZU/4AX0gumYPVdGY1SSFXkkPRf0pdd6esVsnXV/XW4UYLO+w==
X-Received: by 2002:a05:6214:1d22:b0:6e8:feae:9291 with SMTP id
 6a1803df08f44-6eaeaa5f7efmr173160326d6.24.1742233509287; 
 Mon, 17 Mar 2025 10:45:09 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30c3f0e9985sm16687121fa.29.2025.03.17.10.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 10:45:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 17 Mar 2025 19:44:43 +0200
Subject: [PATCH 8/9] ARM: dts: qcom: apq8064: use new compatible for SPS
 SIC device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-fix-nexus-4-v1-8-655c52e2ad97@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=918;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=6oexzQF1OoJvGK82ren40uxDYNIho3CwgfGuz5+Kfjg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn2F+HXznEfgII3QjF7M+kfeptlRMJIBFPK5UQ8
 bqCCEPsXrCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9hfhwAKCRCLPIo+Aiko
 1cB0CACrq2R9bp0kI2bQnj3zv7W6gk+12hq0bs1B/+7+e66Y7Lz958tNrpNvJa13mFJIHrAoNOM
 +i6M1wRCOLbjcrzQ5baxlxr0w+n6u4wiQO9ersrC5DWyYfyZ5ecbTXmUuEyxjitF7nlf68Edtl8
 sez4B9QeWD6QBqVHUmjMD7rPi6W6CLpcFq5cykUj6Y5kZ0Igln8VM3noGo4IUh/wYMkNm96P8oD
 Ai9GhmZhg1Wfa2pno8y3oMqRKl2oWz3K5Pc9m5oBiHCAFN8UyOV648S2i4DY8N0nz8jpyhcAhH7
 M9l5Fs2iqflxej5NdQoJrkjozsJ0jSNT0KdDtGwKwllGKgrZ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=67d85fa6 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=p_EMIZExALG5VSdhSekA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: skZ0Qc1qr49xsY2Uyq9vNHEblcitX3P1
X-Proofpoint-ORIG-GUID: skZ0Qc1qr49xsY2Uyq9vNHEblcitX3P1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=601
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
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

Use new SoC-specific compatible to the SPS SIC in addition to the
"syscon" compatible and rename the node to follow the purpose of it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 522387700fc8ce854c0995636998d2d4237e33df..a106f9f984fcb51dea1fff1515e6f290b36ccf99 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -402,8 +402,8 @@ saw3_vreg: regulator {
 			};
 		};
 
-		sps_sic_non_secure: sps-sic-non-secure@12100000 {
-			compatible = "syscon";
+		sps_sic_non_secure: interrupt-controller@12100000 {
+			compatible = "qcom,apq8064-sps-sic", "syscon";
 			reg = <0x12100000 0x10000>;
 		};
 

-- 
2.39.5

