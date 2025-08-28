Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CEAB3ADC5
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 00:48:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AB8E10EB00;
	Thu, 28 Aug 2025 22:48:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="B6BlvEHF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4016410EAFF
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 22:48:37 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SLWZwK024737
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 22:48:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 G+WQfJRfJ+ojjNuByHH0CbbmaQV8ss9XcUKP18Ee7Z0=; b=B6BlvEHFZ2mfXJia
 x8Y2FH2KPv9Y3Yn4r87ZmUODfQXjhnMlCGXFaNDO2mCr1S/j9Qmn8PTeOYixJtH5
 EREyJqsa/GIIdNWAgMsQP87srTHGmj0xwgxl1WzrhtsJOBu692MuU8tKcWOWFRVM
 Xd7XD8ccqcIx0ZS0PNfC+8OGnAzucl1rXzVfku6ECW2CIQASX8znxWvztLU92AQ7
 +r5TjDEY75qcEJEIFsZBAgVk96QGYhN8XyzdbpsjPVzKKZ0J+NEOB4zjbzy1nBF6
 nQK+u0sRAPTU35Jf6p+vmKclNV+rGbmli5b9BUYeO6IHU6AWmiwxPnWOLrAEL/+E
 Qj7N8Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5up1v3u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 22:48:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b30d6ed3a4so2562591cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 15:48:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756421315; x=1757026115;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G+WQfJRfJ+ojjNuByHH0CbbmaQV8ss9XcUKP18Ee7Z0=;
 b=Jfdg4T1qdeswYWaMIwkcfuC3FLpnwTH0gwFXdXskOV9NaqyapCKxELoNWtb9wZEz8i
 JD16aavR1Bbwtlpucx6COQYS+TCZLJESics37J7SFdNlZlTRvBY1QAAJ/L6lUwfmvuhP
 gZB/xDcp5qdBNRl42teDtOZIuboC6h72JuWd0vh/cgj8m+tZEfS6YOyCkWvhKvN4K+Li
 VP8zE3r18GTjgaNh38ThyYhlXZYbgJZNvwhDtHc7WeMmyRSBV4Ji+8Zu4gifgpw0QLpb
 7IQAaCDTrFNMy+uFjhWh6421Rjyq4z+wQ3AzQM9DNIDLYR3xMIku7stxb5bN+lhfJQMo
 QyaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTZhps1I1CNkV7jepJ8BgAKbi3qFsLHAnoTvXGoJ514I8UwsL08e+gtbXp+iYSUtW+L62bmrWtLAU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYzv++NA5mpIdALIfiFb6UvuhCSpyucG66iM19RJECPJLOIxVW
 4FEHMIEt0rMZCtUBCrIBypes2BGQedXSYRsI5hZtLDpkvBOGc227H8RbLm3hsDtQFaf7w29SGAN
 QHLBm+y1JoLLkHRC86l9Vq6keRBg3yXv9X5DB+HH70qg3wNi2QpECTe0KnjzXk0ECks59Dsk=
X-Gm-Gg: ASbGncv0sU/fwklepSejb9DhsRp9YWrsqeL9N7YbzGv/G7McDlGMgHz0I6ZPXKAAkgI
 kfjQ4pDMoThI0m0Dcdgj6i9jVU0Ei7/eRuK5101znFyNwCLSGSycYTfY+xvrbwqGKuvVzX12ecr
 ebAIEqaCyIOpwaGtQhE8jWUz2hXkp4AK8tHQ57LXJvxPP38XYFsNgBfcUxEhvIuRFmsdp2y8+D2
 mS1xFAkNJ4D6hjeMSNxjlq7cI/njDBZwkwW796xh3H/CfGLz8aqlk3Vi/NP6NOJSL78fV90n/zQ
 ra+wdVx+gmr9FUtRnVCePhyjLD7zqwwCYoHuZpQlAq0GDyBi3Q4is+TfEbglbkk4b8m5lRnaBBs
 CyA/ZN+p6mW1gPzyrDUM4sN0jIiElfFCcb2E8j/DU2PxznHVzVArP
X-Received: by 2002:a05:622a:428b:b0:4b0:64f9:decf with SMTP id
 d75a77b69052e-4b2aaad0920mr343641381cf.41.1756421315546; 
 Thu, 28 Aug 2025 15:48:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFm1EpMVEwDrDbJgOawMde18SyT48ZLYFgZYxxlnkKlKJBpSV8cG8pnZW7P4h8bSc3I/QCRBA==
X-Received: by 2002:a05:622a:428b:b0:4b0:64f9:decf with SMTP id
 d75a77b69052e-4b2aaad0920mr343641131cf.41.1756421314975; 
 Thu, 28 Aug 2025 15:48:34 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f678452e1sm143807e87.85.2025.08.28.15.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 15:48:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 29 Aug 2025 01:48:21 +0300
Subject: [PATCH v7 8/9] arm64: dts: qcom: sm6350: correct DP compatibility
 strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-dp_mst_bindings-v7-8-2b268a43917b@oss.qualcomm.com>
References: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
In-Reply-To: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1018;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZkVsyVv2vIclITxHSKeCRDNao5rKWcCBXSWeGP43FaA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBosNyxmDIKU1FWxpw5qkI4IleTgCRIf37TGB75q
 y/8eWDgmmSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLDcsQAKCRCLPIo+Aiko
 1Qn4CACvdDokyDQ6C7VsJFvZZmp5DdMfytpyhmZAZh9fT3RIKIlB5h2RiTJdcd74uapEPVpke/y
 UI3uJ6RbN5Sj4pS8kEwnp0iz4EkgRbgAzLOEEqRGTXv4UjH8danqFRirlJ8jJPNM6xbx9oFIYrY
 yqeT39+MQjSKmf1Insyxfe4LOdu3TRjtT+XYNir0f89cOk6SfQOHBP/b0mPA/IqtonvVo8hiSn2
 +s2ZQ+9xCpxGMdHfz33C99dW4ayKouSOFmcbtfZLllIh5zSXwn3yOMnA9J5sY7r4Y1AHWo5fTDC
 Qpz/7QAZPCOL3tgTOozM0Wnoodq+JQAOF1WB+mw/lmXcWXbz
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: HpHYHIa4AEZEO7-vD7_lxSkV48o8XMd9
X-Proofpoint-ORIG-GUID: HpHYHIa4AEZEO7-vD7_lxSkV48o8XMd9
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68b0dcc4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=P5fMS2Mpt_njWCDp3nYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfX+j4xvfKqxURJ
 BPgaARV6Wo971dgjm6ZJWq0P78VkjEA/WQld2WqFuzprBAeV5FYVSDMEzZU4/NuHdKwxumcJ4qp
 382TvWfC0InWCh899XOVAdeNL8r3fsRqIjp9yNxLn7DJqhojPeQaqf3R95JORFXERbu+9t6Wmyv
 PkJrTO3cTBd6ZC/KPUw9vHc9p6bfI0pNdyyIzZc6mct+aiLUGH7Uc8qri6WdnYf76F6ZeZ8Vqbo
 RmSR3ylv1SpyVOYgIz8WH+/qNj76756GhPuKBZKKkWMHyfeM+/Vw2bQlgOqpL6TtNzbgyDa4ugT
 6gBFFtlnR+lvf9JIn0Q+f1k8rkWBJPRJUNLsinodJVO9Lnq1Zrv/L079bLGjpBl0o2mT8dL8oKp
 dfHo3FEi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031
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
this change.

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

