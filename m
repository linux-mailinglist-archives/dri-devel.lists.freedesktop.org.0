Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D73D0DBC2
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jan 2026 20:38:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505EC10E260;
	Sat, 10 Jan 2026 19:38:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="c1V10UK/";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SiB2k25c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE05C10E257
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:13 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60A9woQB4027116
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WX+tpGOx/XtA3egSToWa4xfPKV46G8xjtDhhWctRh90=; b=c1V10UK/4Z7EOUEL
 VubWdwbGMKEsMipAXSUStR+oQKY7IVA5K9MHTFKF8s/1oZ9ZEoTpGrebj7LiAdqZ
 gDkbpBDZcfjFKnBFuRgXkuE7uzQ2/maSo/pFN+hI1onRY9wNjyk1fxvTWQG/iD3Q
 RNX0wCtUMJPaMZF4kqdB+DDROPlCPQnxALABJrZg5DpvxBmEIgQe4cIz+fe45K/H
 wsbxGo82Phzgo0vb1VnYW84uVP9650YV2R0dC53O0iDTOQL2LyXwYPXPJtKqoNUt
 LTj+9VCS3qLTVLPR5C6Maafl8hlM8fXK9XSK7HYfpwkTYYbpQkr1vrzBdfL7kAiq
 8Niplw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkebu17mq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:13 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-88a3356a310so127073616d6.3
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 11:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768073892; x=1768678692;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WX+tpGOx/XtA3egSToWa4xfPKV46G8xjtDhhWctRh90=;
 b=SiB2k25cO6QdWkXgMWZOam7z3F8dfmpMIVrxI3xPS0NFcFvIsIjAzON7eKgE5fcVJ6
 p8MWfo7rD5hNVDCEQ1yzCEeovCMDufzjKQnL1U3wct3ACpD2OqzvgjHn1DNRcN2Sk27i
 uALD6GNOdjmsTQ44Ts2wqVek3vVVDiLB5uNy4Xf4YXY2PZi82Mns5wXPy30LE6sK+DGu
 KE68V/imq9W8HGiNrqaVUXIAhD0KFaOBYZR8QwKL5pCki0O0wlXDSxhUOpZNkm7Ybcwf
 y/bpmgX3RGRM2Sfdl4QsbPdx7ICnku5NTTQkBDi2niOpoLjC+Twt/+xvXLsqwFPRRkPS
 rFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768073892; x=1768678692;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WX+tpGOx/XtA3egSToWa4xfPKV46G8xjtDhhWctRh90=;
 b=Gj9NGWCkMp2Q5HaZVpWMwE57Eb7vGb38CdEuM04VIhpgZ6X9d0sqFxTSh81PPp+gr5
 Dge46/1okpE5ueSfMw9flSSEQ7wXsDZNbrHyASxNcICXyP6m/rVPEyTInQ2W+4HL7kSo
 vhnQbnwMEsFLI97fR0Pmtcj3J7+HqAoYAIgH9Hw5KZR2AxbLLhveLykqiQrY9MJY2kUT
 iCuZGR6QMov/q2JHMW+Cu30P6oGTPXzd90ghmLuPMyWu888u3MRYkD52i4tO/k0ahITQ
 UgjfomoUy7zSIUV39KmRtg2kO3hfkVVqybn+8lZB3fxTQswW+qpOAL4Do/qiP4EU92o0
 B5tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX16Du4trY6W7K1V3zS35J3xkYdCUb6fMeBF/K5Jizk1x94ihbLBWimXEW1YM3408a7q3TEYqSBPaU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yytpy0kaNx3wXft4ImCcsNKXMupfMzhNDagJMIajnJV5NJT8iRK
 z7J7KEfTK0G15DFDNa1aT4/m2vDKEppifNSDWtVW6MXmqnDpU7M4c/QsUt3LiZv/yZz9R50KSK/
 374njkK4/DzTpMAcpb6BRhdJbIzz7/F+jTRqXGqJ/2zL+IRWKMz36PTquGIO0OEjOroIVPSA=
X-Gm-Gg: AY/fxX4oZgQXWy4PbqowGuQvIZwfz64OKEnmSTFVkuR1dozAuweRilHe2QrLGKZcCSG
 EaSjrp5Rbs2fJd4aVupnmOBF0UZYdFPwNrb6fPibFEqIbzr1RG91+SC8URkijpVZR0fXbHqLRgH
 4wg9vU+U5qwaQlMNjVIcAEEYQXZqyaNKXvBu00zj8GVnEasez12I6ynDiIXTnxyRSdxzYb8h8kt
 KtiQBFkR0H2aUZVLboamD6oc4NZ12c65CLDPvcAegjrFm0d1w8qODwNTJn1NOBEmEcLUWklbX1Q
 6gs8HVswL8xg7otAgEgjOyW1IRUB15aeiBp0laxddq5ze/TV+yAifsOJVB/GIN0t8vACMiNR17N
 8cC7z7bexH3s8SrILhWBcNg9OSZ4q+MeBQOZIZnhaz+cCYoBfwoO8jYy5ZPftz/d1Yzrm1e01N5
 mD5XCGPYBXsdiyT3RUKejEYN8=
X-Received: by 2002:ad4:5968:0:b0:7e3:cc6e:3c89 with SMTP id
 6a1803df08f44-89084270b69mr217618796d6.56.1768073892501; 
 Sat, 10 Jan 2026 11:38:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECeV6PNptdKbFZIIGvq91wxzn+Aus3ciw0GrkSflBtIOmUWwgKzzKf5agxfyj92y7TK4QHFg==
X-Received: by 2002:ad4:5968:0:b0:7e3:cc6e:3c89 with SMTP id
 6a1803df08f44-89084270b69mr217618496d6.56.1768073892115; 
 Sat, 10 Jan 2026 11:38:12 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65d0f6absm3539700e87.42.2026.01.10.11.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jan 2026 11:38:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 10 Jan 2026 21:38:02 +0200
Subject: [PATCH 10/11] drm/msm/mdss: use new helper to set min_acc length
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-iris-ubwc-v1-10-dd70494dcd7b@oss.qualcomm.com>
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1301;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=JslXq2UN0h55ZGQKK6W5GartLCm1dfjuGB41CNjkyvM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpYqqUNvcF+p8D3B3QRC8FSeYNjnIpYwnquqU/d
 9hcYY8M45eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWKqlAAKCRCLPIo+Aiko
 1SZfB/9ZRCI45bpqc/DRBI659ZGLEIRrafmzdVFMrFYbxdM09ocXLYE6qaempIc6CfhkqVsz63h
 M8N9L0NnAADdAbLKM/cb2NF5wV+ZYT6hO84trAB3IeziCx64FjWpU/xbdTZQZYmCpFD9doXruqV
 akdyqY9fQ2BPYpAdqu3vmDV7EmUcVABo5ki8FLdI4o/eCbpvFrm8MRA9yddaE8weXm1o2Vk98/N
 aDZ4zQHoq+le9fRJ8254bJKU2Pq2yhqBrnXz3OsyPaRr2I54yVXTfSRzCcUw3LzTsDNIJWK7j7y
 UxsDTmxpaOgAXIw7+9kNFJBaW6tgdzayNJ/hF1XZ+63weYoN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: H8MgnWjRVmAYUsRzqjftx_xjSHuCnSNQ
X-Proofpoint-ORIG-GUID: H8MgnWjRVmAYUsRzqjftx_xjSHuCnSNQ
X-Authority-Analysis: v=2.4 cv=LeYxKzfi c=1 sm=1 tr=0 ts=6962aaa5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=F1F9tmq6QbaLjm51Hh4A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3MyBTYWx0ZWRfX4RCvL4y00Jln
 cDrddAAawlUJ0LM35Ek+7TVdJTyRBtOMX4PGOLUnzijQoGmXEJnaGzAJLGRJWY8Akn3hQ3GveGP
 BGdQnBbDJ3DL+2QTvwlIFtGownC/oMQjpWF+2/JG6GQt3FvA+UU/yxz1We0oURkrhEN6Hz4VLAf
 wDp7C3+aguNJD8h+yUViU0bESeyg3XisW4y85LrkrjCPEQe0QgSKaSx2TQUbGTJ6nubUXy6d6vU
 GEoEEOvGIQAKHKRn8+LV0/FCU11Mr8Rw3y676C6LBUMBpQkQGSNlVg/9KGsF/c3nMp2J1l/3Zmm
 dwpMtl2H9lnxWNIYyjLDnaxP1Z7BwHKsDGvfhqbTyG9fXn127sPL2+wwFiBBTMV2hYM0AFi1lxp
 BDKV6ooCfTxU7pRcO6M87SoGKTLKkHRNUlKVFoO9MCkb81Wn5zH42gZb/YeO3aw92lHj/JbTZDu
 4vLEQA4AfTPNbtDUmTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601100173
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

Use freshly defined helper instead of hardcoding the checks in the
driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index bf9a33e925ac..da266753df69 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -175,8 +175,7 @@ static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
 
-	if (data->ubwc_enc_version == UBWC_1_0)
-		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
+	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }
@@ -193,8 +192,7 @@ static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
 	if (data->ubwc_enc_version == UBWC_3_0)
 		value |= MDSS_UBWC_STATIC_UBWC_AMSBC;
 
-	if (data->ubwc_enc_version == UBWC_1_0)
-		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
+	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }

-- 
2.47.3

