Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70413D0DB7A
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jan 2026 20:38:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F97410E1A7;
	Sat, 10 Jan 2026 19:38:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LX9KQVa/";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RN7vjhGx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EAC910E109
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:01 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60AJ9I1n830003
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jf2DMqzpH2JNy8Ab3F/hxDhzYlf86bFDL8kNrSEC6cU=; b=LX9KQVa/Z4wfQlyb
 Gnk652sr1zmAP0AftssihFWn38yvYultqDsukCSI36Pia3/M0AD8DJRd9QDpijIv
 TU+uGP6j9l0eEa3JvXrwMWiK/cMwsbsVRKwhMksW0FDgFqX9wBc25gRC0A8YL4zV
 4Pj0u5R5UYneTAO99aiUPwp82KYAQLz9MCqWkOZBXFymkim/f7HjhJHxi3Llz0J/
 w7uzdXLIxaWHjT5r/3To6nCoeYGFafXuj8DKMtsP/WJi+5W3dtSsVvZNQuFjLTij
 Nh0QORW8Gg63s0AHiW+vSCiTzoZXFYQwOA/SBsGoNbwNJvOVq/1dzsc97zB441Ub
 rWxXBQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkfhah3rc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b2e19c8558so1255146185a.2
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 11:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768073880; x=1768678680;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jf2DMqzpH2JNy8Ab3F/hxDhzYlf86bFDL8kNrSEC6cU=;
 b=RN7vjhGxUjHxk3B4hvIiQswvvdOZCusSMvXCxJaX8dvNPYhPydRLkvBbAKst2tg2fE
 Oek6ItopQ9Ky35ftoz30UCL1Ja3siQI4BGGGjiGutpGRZYu6XXo7pn2ZvONxRytRnGc8
 J0ZFEhnnv9GweLPWRN+7agNOrFi+z/zGt0e9uAi5MLye4hgRWD4rmmcSKpaVzWx5O6Fj
 Ybvn/Fl/PcPmAeX742YB1j2QUfnNAqQTDZNYOgNDVOBW0ABRRF8URv6bX1Q3MLFU8Ark
 2afQCBYwBCwqu3Xw9lOhWpCQgr39lhLOGh2tMsTFjsIvSH+TYn9zPpGju5+W+AC0yaJv
 fbsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768073880; x=1768678680;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jf2DMqzpH2JNy8Ab3F/hxDhzYlf86bFDL8kNrSEC6cU=;
 b=Oxn/9JLV4FRIbjPCJ/G9XKApKgc1+mG9m7mgwgcvAj33XEqxWFDqJG7wCo4crO2L31
 2GxY5XTAwkg4qoWv7TRbU0nzbukGGWSlkm97jrRKbl1ay8KacRrlG7KRbKGJGWVNVzC7
 9Ydl9Lf93963DAqkcpEqL0G85wXg8RI1W3hp4WgkNDWMRf0zMTKsbl9oo6WiowGAAuvn
 VATKb649a67VzTeg+lD9AXELoqtHPi33fLRo9IHH5ldWlDgeJCovv1LQWfdn1O0463La
 l7tlgzXDUhmDDuneorXOFELvbIRJG0kn31P4PrkJ3QAEcwGe5ooK4HUxYrnuAE95qJ0U
 NsAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVExxlqNR0aop3yHER/SXGyOSYCcT8rnVn8Jc5NXzcFYLw89MqJyxE9K2vWqmU0V1qEuC8CvZvldC0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzD8bOl5B1WX+GXd6csBwP8HJSfXn6uRrZIQogWMG6u3biVZ2So
 9NFhS4pOhxvJf/GYNd3NVHbwaTMHoxhVAo9PUZt77CeB9BYCKfQkNHhjlGnodyWp5tTxKSpnxIQ
 qvcKm9Zb7bdvO3kt68+Vur1iZ0HEVy6Lv4od39pLsU9I7i5s09Z/LNpA8SyFXmtIQgWid880=
X-Gm-Gg: AY/fxX50XvOHucvFabREQbO4ciFvOGh4mvqH+ezJIbk3qwPemLaA6ro6O31NxskZhnB
 j15ldo129jXL+x8QThKKKl8MVHfo1+UjHoIPDsWq12IlOPD6CnUCGiAmpYluO0uHUPeoiqp/m1P
 tQoyoHN9oRh92VHEq4tFSSBm5Bs8pyb5adigBi958lhgehcTtcYdwA1SD2gC4+W2IOsLjB76o+s
 E6rm4Qlp2WZXFwiyrAY+/ZqoYWrlJ8zCEW0bWY299QiRDBzNI/5AtaPhPSIn4ew/tJqD3LdkjaP
 H26KhhZ/VhCRs6yO9KMHkx2ZqdBlhtkdI9goLcy4lsNWe4YS5vTFp/RjaIpr760lvPZR/i8cAQH
 yz4mNAWdmJKewna35swnB143Xm/ouzkTZbSlfhpHOho6rCbsMvLAIimL1oIz360umdq+b8ow8FT
 uW9/nk5XgeXXbXN0z0u8+jYC8=
X-Received: by 2002:a05:620a:44ca:b0:8b2:de6a:ca with SMTP id
 af79cd13be357-8c3893f51b3mr1951175485a.52.1768073879586; 
 Sat, 10 Jan 2026 11:37:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGYu67S8+CPprNVyWfVMgX0OZCAew+jbVfBF0vtbN3BVGruygTn82tAUaHZh9q2joA/HE7yA==
X-Received: by 2002:a05:620a:44ca:b0:8b2:de6a:ca with SMTP id
 af79cd13be357-8c3893f51b3mr1951171285a.52.1768073879121; 
 Sat, 10 Jan 2026 11:37:59 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65d0f6absm3539700e87.42.2026.01.10.11.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jan 2026 11:37:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 10 Jan 2026 21:37:53 +0200
Subject: [PATCH 01/11] soc: qcom: ubwc: add missing include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-iris-ubwc-v1-1-dd70494dcd7b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=720;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Pev46xI2YfYCEJWpoooLY3aM1pLiw3PESsmECFYvSaI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpYqqSTlADnmSJixHP1i4iUNQp2Ni2QraKzhFRg
 de9h9q5MmyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWKqkgAKCRCLPIo+Aiko
 1ao3B/9bRdX/gIVDx8irfCSbubecqdZX2hosHW8QH6AQ263XimJTNOzZLckyYqiqjEPTywu+00K
 baULI1Geph6PkbOa2tSonjMdaVTdoqpySuYs6gW6lQHkhxSzAh//IYw5ciXiGI3AI/MyoXPifFy
 lJfhXeDiD1o2rjl66XJlvF/RH0QEHiBcgYVYRzN6jrI87MhX9fyzacBCXYR5K/40UpPwxt5kgvN
 zLp+r2GGp2KcSS/bQ5u9H/3BcjUJ4mpi1j9Y0WB5sMlMkvbWxHYHdTzd7hjCXlcTq8F21KvcbE6
 pPbB+FYyohLnIjzqpQXxYvXbmLlD742an+iRMvpo18QOZe60
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: U1Mr9AHWl4RE7odEQI1GapubetEcRhvM
X-Authority-Analysis: v=2.4 cv=bOEb4f+Z c=1 sm=1 tr=0 ts=6962aa98 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ALiPkwqszP5KJWpCD6MA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: U1Mr9AHWl4RE7odEQI1GapubetEcRhvM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3MyBTYWx0ZWRfX4EkBhlYSNkbb
 ww3zdqF1BzKKdebfYeAuZRHdGi4ObJcKASGESn+vHIdoNqXo28BQUh2Mlb0PNRLTSbp7Av0S6pp
 NgYaUXGKj6JaLB9wCdQUtR5IxyY1m9tyJ8QBtT+30QV0ptJnZnJipdDorHdmvfSti1OF/sM/b76
 rBr0xzQ/mwLozsIVs4E9YF8wWRQpK06WDf21fsEElkhb0qvDmd2OJz3qm5+bf6LG53Tp3c+C0sC
 TCXzp0kgqeCb/YjkWP6WhysIQHMMVMcbu5KCgYib/sESUOUEwvnEnf5Zz5LLXTiRSA3LmOOaPwh
 cwJ1ZKhkaaLw9UYCmY9IsZtaNhBDraQqu4OYFWumTlTglwb/BzJMGJUdNnOXUJkIaA1F8L23gGt
 zbrTC5Jaotne02rg3LdiE/mCnGrXYBkdxePZBPvw8gyBLQyh8cAWPAVsiRAKg/nCtiIForElU5t
 wLqVSsLyIpKadKqk9GA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601100173
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

The header has a function which calls pr_err(). Don't require users of
the header to include <linux/printk.h> and include it here.

Fixes: 87cfc79dcd60 ("drm/msm/a6xx: Resolve the meaning of UBWC_MODE")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/soc/qcom/ubwc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 0a4edfe3d96d..f052e241736c 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -8,6 +8,7 @@
 #define __QCOM_UBWC_H__
 
 #include <linux/bits.h>
+#include <linux/printk.h>
 #include <linux/types.h>
 
 struct qcom_ubwc_cfg_data {

-- 
2.47.3

