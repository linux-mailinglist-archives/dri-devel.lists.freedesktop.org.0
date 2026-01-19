Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6840AD3A862
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 13:17:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF5910E428;
	Mon, 19 Jan 2026 12:17:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="obq7xxVR";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WVNl0eYD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2010710E07A
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:17:20 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60JAJgoH1531138
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 K2DDNEPkGNzO2qo7B7YRZVVJuY+Bv0xW+0S4R/akcpE=; b=obq7xxVRcZHxETmd
 VDdDOoGStwDh+fET4bxhqYkdON65QHKWHeWeTm4BB5W6EVTvS0EIih2cMEDyTLvV
 bsU6Eiz8nkfjsVUGymdOTGm1DlBSVPwO/aTSh7PWJE8aso06SnD4utZWVcVCryUP
 8rKeysVHJOdVl51eEte5pALwYaSxrVxLkWw4nQuTQhb1P456qMX25yw7NRTyzxsv
 TCjaRHu36k+6fUCdN949TCXXYZenDWvDOWgF19DYHVe4RAQHpJFBHNDVWMFLsGhE
 lAV0PSHlcW2aaWizNbeI3h1oh1vwhQRV7dMDAvZs3SCGNkkCU0ewdueismQoaZkW
 8QKXGQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjrxrarg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:17:19 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-88a316ede50so94623256d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 04:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768825038; x=1769429838;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=K2DDNEPkGNzO2qo7B7YRZVVJuY+Bv0xW+0S4R/akcpE=;
 b=WVNl0eYD7I8RgA9Q5dxGV/vxiusTC5r89zFkmyfbIYi40sqqRqjl0+4tBr8Xnt+Sln
 8Tvasjw7OyIPrdHCUmW+T+1ngRBSmSO4mQOFGavR7rFviZ+YfUwbcUvm+CWP7+1ew1rg
 zekblLpPe1ePd9xRIW9pyJEzrwdE+cJHgJRq3ej+Wv/jHzjahMzvbYgTOEeVmqb3rPji
 wsgl6MRcZf6ZsHzSBLuAEDE5EyBRHKYH8200SautxTxX6RwVwX2cvSxsEFUTdPb2TVaH
 SSUrYpG2a0RCl1cfLeDxcmZOYQOo+ns4VwztNahoyU7mkf71p9G4QsvWhIMZudRh6nIg
 PHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768825038; x=1769429838;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=K2DDNEPkGNzO2qo7B7YRZVVJuY+Bv0xW+0S4R/akcpE=;
 b=DcsJk1DdLbWAhgjTvVTN5UW0QdVEsWVR/mvnfTm6SF2TFOQvjjlEYyHmxqcpGuG34b
 uhly4ajbXUVZ3X3QwKqBlLdTMSiL9dBIlnu2m+oudR3XKFOGTbS+GlWmCCqE5do1+3KY
 JYwAkhZMKGFDmMUzKF6zTj6IzaG3rDVde3UAyrFdG6KvOHpw1IzoiDykRyXERDbFCTq4
 /ehUnv/YlQb2we6SYMAFhqghHzmKCMUUSGmzf9cynUC2EvRS53UJrWFiU0EM8NfPO1Wb
 ivqVainOI9asVUj97KS6zymxvsdvtRO66Pho9N6BDTUK4fk/auGHa1zBvNqFipe4n7QK
 GfPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNI09iSrCJUiq1dHgL8YEuD6HCmqu03xYbVQRNVtfEALM2pVKpllZEl+AN+YjVvLipamrzxWx09Cs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyvvs89UxHo8w+OoyrRkqnapcvlZaBzeXH47ZhdeeSsCW/tTzTN
 94WFpJ6zbYMR+LtCHXudFtztbn3IlLN1wmiSVF+DHSRMTJMw7013UsLzCKOVrfiapKvdfNjnwr4
 YgeNQIaDrzo6obAkgZLWz+8kC9cgyVHEuPDBuNMeegDFul1fGhgzqDcA1WFucq5X6VNjXLp4=
X-Gm-Gg: AZuq6aLecyevBH31oPDTrnol8ZBjiRXN9QNciwwzg8nQXDBmJ/08utEPk+uF6dguWPB
 oZwXmwqzVo9unF6UjcTrwT+ZR3ewJQ4Rh1SNSv9qiVqapwjfT14+Hf9HAlD/rEtqc5Z76g0Dq38
 q5NF5q5ZaKPIkNlaUXQns6XPZa3NEKiGJ2GZ5v19g9V1hwsDrDDbDDzfYdR/d/yPtf2IfptqpCD
 9Zs1H8uNxnPyLBrkn28+pA102VY39B0Jw/m2sgx7EkgCrzmcZjCo1j3rqWZrSyZfqaUArP3MdQp
 MSMbe4moHuvig1jz3I2oE2KUVuPilQrtIeYM+N2S6CI21ZvTCF0nieOKj+1NCY6K2gCTZsIlij6
 IAFUrit8LsabCKcx8t7UWb1IV/T4A9KaLeB3/tnUuWPf28zo/sijwgIeBNWI9aY8jLH+BvCFAYN
 xYO2S0g383utpzMQK2DrFgbts=
X-Received: by 2002:ad4:4ee1:0:b0:888:8804:50f4 with SMTP id
 6a1803df08f44-8942dd2bbefmr164876086d6.20.1768825038378; 
 Mon, 19 Jan 2026 04:17:18 -0800 (PST)
X-Received: by 2002:ad4:4ee1:0:b0:888:8804:50f4 with SMTP id
 6a1803df08f44-8942dd2bbefmr164875746d6.20.1768825037967; 
 Mon, 19 Jan 2026 04:17:17 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf3a17b9sm3274641e87.92.2026.01.19.04.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 04:17:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 14:16:37 +0200
Subject: [PATCH v4 1/4] drm/msm/mdss: correct HBB programmed on UBWC 5.x
 and 6.x devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-msm-ubwc-fixes-v4-1-0987acc0427f@oss.qualcomm.com>
References: <20260119-msm-ubwc-fixes-v4-0-0987acc0427f@oss.qualcomm.com>
In-Reply-To: <20260119-msm-ubwc-fixes-v4-0-0987acc0427f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Val Packett <val@packett.cool>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1248;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=sKKQwB/Ww13iy8a902V0LopTAE5vZckjzbE46YxMyPE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpbiDL4X+M6uTUV039bM0Krcqx4R4SL7dj+wjPm
 +9j3R+CGuCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaW4gywAKCRCLPIo+Aiko
 1eUvB/wPKGLVePsM+jG46z8z8T+4NRTsQp6ZWb3KQgnHMdv7R2g9hGINKNTRd4SZmcpW+pnhiqr
 MHfy6JhzVE1CUOkt/zYlREuteQomH2O4/ZSIeuWDyQA0qbIy7QHGmll7eHGT53ryqMLQy0V5fKJ
 DiCAqYIrazrWIJ97wVg886OloVJaOV7FTc05DTSmP1Fe0AvA5QpUQH26XQaXQs2YxjhQomca2tl
 KF6/SzOGhUllXGYHzrgfdvmmlg47LTbtPTchGwFdFWPnc6bGOoeUH3uuIeE1OaJ1b1mY/UPd6vi
 440j+aJWPsEEZ/NLAREbFswRkbbTTk/bNEDQWEXJ/5bFkFIg
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEwMiBTYWx0ZWRfX9YLaFCrqnnUL
 V4hSDnoMf9vmF7XupPNWQOAu7o+IHmz1aCI7Yoqj8k+sC8S1DUBLgANr+j1ycD5ZS5b9jSUpJZp
 qZivpTE94xBVYcg2ZJ539ShZyYMRCDgggiXTPuR3p8EKHL3iHOxOneQSzjEqlKdq/dFI3cvWbQN
 3WthRHHanBfnfDtKdQG7+XmtEenkd8OnHjKQ2k/s+r6tSksWzK905p0BJMLSPJUidMia28Pey1r
 5mEzrJeWoaqUfhRzxU6B+2VwsIj4jVqdLhwWRYFdYzyGVMUX5CCdjbfRGAdqQdsrzPP0w+iqeTg
 ut+gOhH3j3wbWG5iQXnTnV4UGIfuBHYHVn5/1E5mcKplYzGswz4N3Jzhk2pqFCW0mn5mcBESjI1
 Dm1oUJp0Ooq8Tc4MGQgAwiURHs6zAYrsLK7BZxLi5RR14h6wYYT/0W1Rj8Gcj8V9io9hcUJGbPX
 Kkk3ACXViCJi4MyGHNg==
X-Proofpoint-GUID: mWdYv4OZe7lcCerGkbGgdEuk7brB-IY7
X-Authority-Analysis: v=2.4 cv=PPUCOPqC c=1 sm=1 tr=0 ts=696e20cf cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VBuLEOLxEfejlaYavu0A:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: mWdYv4OZe7lcCerGkbGgdEuk7brB-IY7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 impostorscore=0
 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190102
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

As in the previous generations, on UBWC 5.x and 6.x devices the Highest
Bank Bit value should be programmed into the hardware with the offset of
-13.  Correct the value written into the register to prevent
unpredictable results.

Fixes: 227d4ce0b09e ("drm/msm: Offset MDSS HBB value by 13")
Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index bf9a33e925ac..910242f5a71f 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -229,7 +229,7 @@ static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
-		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
+		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;

-- 
2.47.3

