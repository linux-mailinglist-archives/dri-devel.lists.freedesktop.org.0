Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D228AB41DF9
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 13:58:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8EEF10E867;
	Wed,  3 Sep 2025 11:58:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bzIUovPG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C105710E7B1
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 11:58:38 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BEmpk013885
 for <dri-devel@lists.freedesktop.org>; Wed, 3 Sep 2025 11:58:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xQ0VgVzHDcE4uOAStGZ5b6EnRBy9KiNlbxxY6hsWIic=; b=bzIUovPG3BMXIJE3
 naUIFc+2DyPMw2h+LczbgGu1jclHsoN8VCUQ+yFZNrezB3UtBKPEMf04Hv9R5mIp
 O6hYIF4y547t/h1UcoLdQDldYBLANhwlyo1Xp3edIhG39G7ryBbi/YbNX1Dg9fGu
 Gigro37yurymbGug5g5wlU6/aiMSVr80teukh+T2EQO23Iz4dlDNrXfxwoecRO0k
 D+Ob/lLffUstSgWCW2FBgrRZ6CMO0f1DKLu/sj9umM745FVI1hbslap0o3oQTWaU
 WRuqOvkDMnyKrIvFRSVtTKt0r7UdfwP6iZFcvoneIPCiv/kg4g1O0ZbggEMWgUK0
 EQ91AA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wy7dye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 11:58:37 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-72023d1be83so54838466d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 04:58:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756900717; x=1757505517;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xQ0VgVzHDcE4uOAStGZ5b6EnRBy9KiNlbxxY6hsWIic=;
 b=touHMI7b7MsG4aSrZMwdiRmuiwcPo04GL7OsS3kHc3Sh71WPqQ2U1CBXl1nlGMzib8
 5ycGwjOslb5PVrdEWOzC1XjLKkate8ByUAJtfgGYE5xiRM3jy86Huzajzy31lMrpvMul
 bqD4ujcANnfe8RBlmEHWg0Az4bDdpS4BUbpDR7HEhGlAxVwt4zv3qMf/Tqb5PoT9whvx
 UXBaC+T/Ll4ZOD5Px2Ba/2Ky7JONJJJA8H+gsNDe7HStL4DfnU6ZaECrMSwICjaFFfLG
 647u0p78CoY9Utqhd10hbyBvORLwQjtA2JQM5XjMre3g0+oFHXcd+wou1OC7+79o1RBs
 q8hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsXLmPyt2Wgi7hEsV7d0WNsE3zvBsekoqc3sKGqdR4ESxb7RxRHVDMWJgcnDKQKz6HBbb2Et+602U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIdiCCLfZBG7x8EUxI+2TdrQfopxGwjrmUX94djASy/czvKcvV
 9vdAuqrpcCWSQWvnjSwRPPKjXE9hgUNkLjVHyfFylnc6wFXDcj7uc1+b2V8cea36iVOsX+XHwrv
 J+LhUC9ebR3ii1KFT0eWkIvqLSIl3wk15+xHijhs57GkOCb1+GXPiusYs7fsNArOaHlx2e6M=
X-Gm-Gg: ASbGncvNj1Wphk9gvzK6pfnO8lmGc5zMA9r8Q71JE7DRetNpknUjaZrE7CeqsPWA8Oe
 FMvGt2E5C4n406+zAuPFaG2v9vtSLjBZVJKSgUZpEmvHm/9qliV78Oo0mwYWy0XybAhoKR49vwf
 SKnDqQIc43RGpKgJmxmPbCn8j5u5rihK7Me952NfZ59JT2PozrBh4yxrzNrRvOy3fIiMwsVxCfJ
 FTTcm8Iiiij8uqt9YXfGZWkRnICNL/Mo7H3MLBHf+Am9LNKkmb8IeuN8bZR7vQ69tUJDnCMMlS6
 UGkn8bPbOWPU+q/+k1IQMZjdCqhIJNq1BQOTdM0oVQERIN0tDsM6vlXiUs6g/1lvY/C5b0bfrbV
 iI3yHtxbgWRyXuLOiGwutZv+pR3Xd4LmDcN+2PYs5PDNWg3dJ+nEU
X-Received: by 2002:a05:6214:1247:b0:70d:adb1:bf55 with SMTP id
 6a1803df08f44-70fac8c859fmr134683416d6.49.1756900716948; 
 Wed, 03 Sep 2025 04:58:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/mtRqJfmERu7M9/61r/Pib5S1ya90D2+A5xz4iBPgz+esnd9B+FBxUWnhDBpOXm8CXSuJVg==
X-Received: by 2002:a05:6214:1247:b0:70d:adb1:bf55 with SMTP id
 6a1803df08f44-70fac8c859fmr134683066d6.49.1756900716415; 
 Wed, 03 Sep 2025 04:58:36 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f50d30b0sm9891421fa.67.2025.09.03.04.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 04:58:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 14:58:19 +0300
Subject: [PATCH v8 8/9] arm64: dts: qcom: sm6350: correct DP compatibility
 strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-dp_mst_bindings-v8-8-7526f0311eaa@oss.qualcomm.com>
References: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
In-Reply-To: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1329;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=yuqF992JkLqD1kIJyjnt6Zn+nJH3RP1HSBd3vUxQH58=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBouC1Z6lwJuo/b5AI8h777G/1hkQvXZ9IsEFm9k
 bhyfe5y3dWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLgtWQAKCRCLPIo+Aiko
 1dYVCACUXNIiv7h7eyL5vYKr7mFPQgMkaSn7VDwtt0sBRf+f2in+SUE/FrMpVthcL/nSvFLbb8+
 7mkuNjq/wOhUXy+vGEMhzcyB0nU/L6BIFhJrNIikkKPqPLmAKzRnUkNKGDmSyvI2Wb5iWzzMi9k
 MYlRoNWHEoTCUhNV0pYhl/4smxY7U9xGhKarlcDcKgu4+Z3ufQPhzNp724HMk8YwkYuDDl2T3te
 k4KfUm98eINpKaB0FxMJiyMT1dfIzqQvZAYmYIq+lXIrP7RV0lZcUgPamnFUTXYff7Jm18uakkf
 ZEahvzkhOsHoHL97hCurVxOLYtYgAcdaGuUN4bgEeXOJhKB5
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b82d6d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=llJQ5I4GozCAaw4gE5wA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: V1ERlE6tNbq_Fjh8BPuzw-0I9bmGLkiM
X-Proofpoint-ORIG-GUID: V1ERlE6tNbq_Fjh8BPuzw-0I9bmGLkiM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX8mJdPtLQUdMi
 BWUIq7o9wlE7wirhgbc+tsiizaFaVI1j/ewMhq11RILbR1m8Po3zU37EiOYMmWGG5sOZMPOu2TD
 tIyYbXDMKw9wFRYPVyqSIjaTt7xFcJU1UKdAspi5xpkSs7detdMciT5j4dM3iMXEzlnPHABzdtG
 rUKmCoXYBQCMgnrL5VWiPEPR7bugK1LdetEdviU3FQmmK5yTWXZBUft1iWcfJKasaGisqrF8Liw
 Sh/5Jxi65dZ33GgFBRpfb65D6fxHcapGNRPOG8MX8Qvih4AJLLGsTu3Un84qdfZTHCP3VF2a1f3
 lNC+rTlSIRVuQpjwZSBwcy9ePS52/9tC9XtK42ExnVpRDVf7LxScOYUvofTr8HfmD3WzqFsGst6
 +3ulWx1b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101
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

SM6350 doesn't have MST support, as such in DT schema it has been
switched to use SC7180 as a fallback compatible. Make DT file implement
this change. DisplayPort on SC7180 has been supported long ago (and long
before we added support for DP on SM8350). The driver will continue to
work with the old DTS (having qcom,sm8350-dp fallback compatible) as
even after adding MST support the driver will have to support old SM8350
DTS which didn't have MST clocks.

Fixes: 62f87a3cac4e ("arm64: dts: qcom: sm6350: Add DisplayPort controller")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 2493b9611dcb675f4c33794ecc0ee9e8823e24d4..8459b27cacc72a4827a2e289e669163ad6250059 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -2249,7 +2249,7 @@ opp-560000000 {
 			};
 
 			mdss_dp: displayport-controller@ae90000 {
-				compatible = "qcom,sm6350-dp", "qcom,sm8350-dp";
+				compatible = "qcom,sm6350-dp", "qcom,sc7180-dp";
 				reg = <0x0 0xae90000 0x0 0x200>,
 				      <0x0 0xae90200 0x0 0x200>,
 				      <0x0 0xae90400 0x0 0x600>,

-- 
2.47.2

