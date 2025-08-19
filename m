Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B41ACB2B79B
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 05:34:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01AA910E525;
	Tue, 19 Aug 2025 03:34:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jBOq9EoF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0354510E529
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 03:34:30 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57INVbAu026366
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 03:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 c7ZlGnJLq3+8VPdDBGrjVATTNbjOXYsVFry4SHltG84=; b=jBOq9EoF/fhoB11d
 p/8AZMQlBQkJLJl1pz1YzheO7gBtxEC3pb81u2V4V2gvrfZvq2r/4FDxTkKbecgS
 5eG8kDSO/TlPhTImxtVrbePWdrtCS1lV5WC8bWmlWXLh/r4ynV5gka8QBw6EN1nO
 iOvYF499PhiS8KfmZ+jvDonAE0CP4vD/WNGPOiBo98Y1zZe0Wf6P65iGJup+Dw2u
 6eATT6JK7jmg7YRPbKDpNWtzOAspNgUL71Un8eBtqxUxreYWJ0C1DtQk+LXKlGwW
 B2+F4hGOZKp/35KMDVghHwuz28kKBJzVHvHNoAVd1VaDinDBcVLmKfDREOSxGbjJ
 7I0ong==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48kyunu89f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 03:34:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-244581c62faso50922785ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 20:34:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755574469; x=1756179269;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c7ZlGnJLq3+8VPdDBGrjVATTNbjOXYsVFry4SHltG84=;
 b=t3a37mTtuxcksO1QQxqcm6TYLORIyRGyGSuB4bfwWzRjV6BK1ZuLK04g/wrsH1ch9+
 O/N/XniRIZma8Jlqe3cOWFtserdkjzDFLHSIhBLvcMYzuxSmPkIZItcx3D3bpJwZyxJf
 oC8qt4l4+MBE1wjn/McSF6Nl8kdTgM4eWaV9D3F+GeCrC/fYG/9SGbhT+70yFGoW7voX
 vS/5xCo5WjNYyEFjU9pIeuU8XxRrQBFZ7H+aVDasn2ZDoBJRrzUoebVgAEWxMjVTi0o5
 +neA+6mux/jCC75YigsuP/ZLzgo3pFhlXsdiLBzNsFsoapMAvVq+bYHs2yVDdrXOdZOG
 gH/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIo8+lQeP5rpF3Tl9MH/9Bo3aYWyZZhlCZ3UlepRgcWtBnbwRoyHBvwanzS6yz8zuIz3GUBjPMn24=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznZZNYksBfHfGcLGcfSd10J7hPNvd4gHdQXjW6RPHPfPlc0L/U
 LDKpOZnBCAdXfAm1fWOO8c/aa33pu5yZeJJg/EtSiVuuov7ZkkORQJu3J1bEr4ten8k1JTDZNr4
 mSHYayedsP+Yre0pZZ0S4izYF2aZr66f0Jz0viaRwGpFIz73YNKYXRyCHcKV8bKtwRUavf+o=
X-Gm-Gg: ASbGncvXYyzPGJM+t9kzLQARZHx98PxB9Zbv7zHUTWBRm6t7El9gQLSIjP0DAwwFbWO
 EwMELUnBQedO32cagCECobMK8SDfI5t05BeTPb+CRBwU1JtVqN4S4aVlaTRY3yUG2wdz+jUTY5R
 Arz1YjZT9AaTYZu85ZQc2/qL690W+toLLl+BKDQvtRZAm16qCS7hjm/qHtynYDf2/67QWt4GU6q
 yNBxoeCIvSG929cTHvppenNvDDxNFsxqFRmLzpwrubGoM/O2Eu/NvCLNfoa/JAQwnw9S4lTGfYn
 HdDJEQBwZdm+5rCNUbIfjXj3zzHuj/LFMO1CcG2Or4RMJk6YJgxplutLgLeEGjm4d5jODjU=
X-Received: by 2002:a17:902:d4cc:b0:235:eb8d:7fff with SMTP id
 d9443c01a7336-245e0482f9fmr10590125ad.28.1755574468911; 
 Mon, 18 Aug 2025 20:34:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1JFgru4hf1iy17i0CObbmSg5dyLheaV4AtduwGDjvOBwcV3Gq7ppd6xpwIwMmE6ACKsiVUA==
X-Received: by 2002:a17:902:d4cc:b0:235:eb8d:7fff with SMTP id
 d9443c01a7336-245e0482f9fmr10589795ad.28.1755574468461; 
 Mon, 18 Aug 2025 20:34:28 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446d50f55esm94486325ad.82.2025.08.18.20.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 20:34:28 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 11:33:32 +0800
Subject: [PATCH v7 5/6] drm/msm: mdss: Add QCS8300 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-qcs8300_mdss-v7-5-49775ef134f4@oss.qualcomm.com>
References: <20250819-qcs8300_mdss-v7-0-49775ef134f4@oss.qualcomm.com>
In-Reply-To: <20250819-qcs8300_mdss-v7-0-49775ef134f4@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755574427; l=977;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=jx21lmx5MGZ/FfsdeqVGZncpC/OsVU2to6SdDDH2l5M=;
 b=ImYRC7sd2hDvtu9kDUR4j9uSNjtTCgqBVkh1MYWwvd6QNeGLrdTV3xFIkGqkEQEAfQekghy19
 TIZij5TnEnoBeShRac//+ic8blMQwGeM0RSHAJpsmLH3sryOvrEhsrP
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-GUID: dsNr4MmC0qDitkZqBeYWl-Tc_fQHsbas
X-Authority-Analysis: v=2.4 cv=N6UpF39B c=1 sm=1 tr=0 ts=68a3f0c6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=56KCLgTT6E_AFdM1kc8A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDA3MSBTYWx0ZWRfXwS+a0auGDZyA
 hSGAJ0aAkdhMUenBebspshclp4iNkxftLDYJNQ+dMr7a5bZTOsGczzqBEZpO+ZXfOnKQ68IcIAW
 tEGFNB4UGh9HTywrWeguzwkLQxSFfsc8HCvrspBE6FeetzUzAlFJVXiD3yP0ddE74jwqwG7l5Qk
 l2FD0EOZwPNhID2NyeHzIhE+FzIlnKGoI0UFkJeORTOH17OM75sZG/yoMNMWwjU2NIzbGFLCob8
 p+/u/vp9PL7y2YF0ZxuNgNwvFFgm3TSWUuuww0ty5CbJDoPfZyZgq59SYwRStvRGy2baHeBzEk7
 pWDAPHyRIKqQ8sriG2wo6/USzUW1zA3I5FhyZSEB/VeBod1mfcElMGh/m+gQTQbqPOaFUybIe+g
 bKawBum8
X-Proofpoint-ORIG-GUID: dsNr4MmC0qDitkZqBeYWl-Tc_fQHsbas
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180071
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

Add Mobile Display Subsystem (MDSS) support for the QCS8300 platform.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2d0e3e784c044db8ac0c478446d211a982cf0350..db2f0064eb72e8a990ff4806f60be74d3ff8dfa9 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -555,6 +555,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss", .data = &data_153k6 },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,qcs8300-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sa8775p-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sar2130p-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sdm670-mdss", .data = &data_76k8 },

-- 
2.34.1

