Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5169BB48711
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 10:28:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8297C10E48F;
	Mon,  8 Sep 2025 08:28:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hhlPoUiC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA2AB10E48F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 08:28:33 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587KiFYq003159
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 08:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oxxwm+ypezCwm6BPpi+u2vyfh4HZ0FHZ1ZRXEui1g10=; b=hhlPoUiCNfS27+hK
 W8kcydaEFIN7wbBcbZDohWadLDBGzBG+XqIIPwt7/lOJvl3HWf1IagYDkhdPuhkS
 l5W/q4Plc2J3JswDd5LIqGGniohUIqu0o5AAmF2zjSU73/vNvqhbalP43AJL3NND
 dMhU46/Pix6wWIY5xa7dvJUb3ZgHv6nbketj6G0VpA6Kh6mL0uqnaBGthAYw09Uj
 //jZJ/LZEeK9kFpl8c9dDrwZDKzsisiZ3pUYGvL84o/qatAhekCZcv1YmuS/xnlp
 CjT6VK//11XDQ24/OaGnZY/Ot/KihuSiibB0cFdnyFZFpCSRZdJPj9Qx8zIiJKPD
 CSQqpw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bws3vcw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 08:28:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-32972a6db98so7297124a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 01:28:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757320112; x=1757924912;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oxxwm+ypezCwm6BPpi+u2vyfh4HZ0FHZ1ZRXEui1g10=;
 b=GLPsuXVHm6xJHFor5mo2CP0uGObjMGTgfBomSimAHIjlnYsRbfXBQQxCfbrwlsvmaE
 rNHRFZxc5eZKnKmaJ6k5kiKw7TBYNzLz3nFhG8pRCwAcUQhbrNbMjDBo80bToiT6q83c
 ABEngjjoTFAwoc12KUVB/KeQVmVcvs3p1UeL4kv9X+u9dOhUkK3j2VaqUmpTvKVzLqMW
 l9anB+3k3kID7+1PH1GgRzrLe/FqNSYUDCBxaHEOGipWX2/9+gylYFhoiyKIhPOeKGSP
 djZ0WD/03X3Ro5kJYNEZpBGjw/aqXB2Z/q5RSajrR84ZhN+HF/m1B9lJG2ajDX4hifKH
 VJPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjcBrcF6AquGOqOWhCu4UnR/Dl/BpDAlrpli3LcgYUSeee0UZ/ib8Uveb5upjMYkw64hCsxgl8YfA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy83+ESjJKVJvypzTikL+oryktLZJd6QSnq8mzuR8xlJhsx00BN
 S4CSHtDb83OsnC7XgbVKnc5shQeALwMumbaLrCs+OzHZIk0egcdv05fXkKttWM+1L8VyayIKcoB
 oVIz5B+YQfBvSReo/aPJtBy/VEvFJRQJaeI2fX7Y8XX7AG3F0Gb3IEXnCnV+yGWd12KEQkUg=
X-Gm-Gg: ASbGncsPLiCBTOr91cljL8h6JTz+GK/9kNK9s+ZG90LA8HqrkI+vFRVCUjNQdc7XjF7
 qovl5uUzv+LST6R1wmMeLF7MJRMiw7pUg5FhC6jl5XjmTz+xzm//XMC3vSEDuCpZEUCHKUbx36A
 N9dTKWPCNRuHQktI6nU/SK81+J5y5qAR9bjiGskyUYPhxwy3YLHGFRaG+X0BOrv6fbOD+geju7n
 qXOdOqYaHDgCim+03HorwZ5BHmVGMrthh5gzy9BNOiyCnfVtb+me5WjnZqhgKe0vE+7ZvSu1AxI
 TYYDZAeQvkrcZsjc5yu5ElEI+rq8zyeG9IdFZqAhAzWT0zFUf0lqL4T5PrN7qhVg
X-Received: by 2002:a17:90b:1c12:b0:32b:dfdb:b276 with SMTP id
 98e67ed59e1d1-32d43fc847bmr8554013a91.34.1757320111808; 
 Mon, 08 Sep 2025 01:28:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZA7JoDEnmt7AqwJdt4pyUQnNwI2XcSGTu2xDVrasXY1aPxGl9PN4uLyeJFuDudO5O+4Dzlw==
X-Received: by 2002:a17:90b:1c12:b0:32b:dfdb:b276 with SMTP id
 98e67ed59e1d1-32d43fc847bmr8553992a91.34.1757320111383; 
 Mon, 08 Sep 2025 01:28:31 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a26bc9csm29157523b3a.18.2025.09.08.01.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 01:28:31 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:57:09 +0530
Subject: [PATCH v2 16/16] drm/msm/a6xx: Enable IFPC on A750 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-ifpc-support-v2-16-631b1080bf91@oss.qualcomm.com>
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
In-Reply-To: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757320036; l=978;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=8YnJ0ONhzBIexy/neyt6NTzPrJg4+1Ll8SHaMIGWprI=;
 b=/l1IvAErG5vS1H8AZRE6E1eJuAQqOfkFg2PgpjJbxAG0YmEzCJLWURhkAddQLIvu89grMp8AN
 7tnV9+P5wEOD63JzvVh74oiN3+mutYEfztOYd3dDeQff4WWaZUvRxaO
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: VRJNyFN-dKNO4YMTR1NbCnDBh6r0mKMN
X-Proofpoint-GUID: VRJNyFN-dKNO4YMTR1NbCnDBh6r0mKMN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX7hhzJ0VaW46C
 4b4MVGBJawuUU/6N9hPGyb5jE2xw3Mey+SppUXFA226OMBUVwJ5PtnGI7CP0PUcmM5iyVoji3IN
 FywH0NS6EmSHTqLCjgfCoAktY4TRkd8yG4XH3g3nDfYtOvxSzm8SykRWdHoNb7rWAUrZ6aZTLYA
 etGvN7p82CEJIXm/8EyFXreCb02Roo7IEpWC3sg1UQISQPHc60f12A81FkU7qU+WOgx8Wcz13Vy
 HYK4GjeO7mBlPBVBr+Y3owKlcpXsE+WzS6Bi2B5BLIZilFwiIBXDWuLHL0kkZO6MGGBT/BPjveR
 O/48HlY2cyEXYO8aVjobmtJBGDDKKNMEr5RETxJw+dIbcteUuEPmD8hNItnaVW/qvsPp+NVqGCV
 6JqlsKVM
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68be93b1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=cz-sm3QmoJLqeNSv7C4A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_03,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
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

A750 GPU has similar IFPC related configurations like X1-85. Add
the IFPC QUIRK to enable IFPC feature.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 547c046730a9b50a82cc9b27f08a5b1eeb08dced..6008f8b0144456c5652dab4c6393b3abb7d709c9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1525,7 +1525,8 @@ static const struct adreno_info a7xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			  ADRENO_QUIRK_HAS_HW_APRIV |
-			  ADRENO_QUIRK_PREEMPTION,
+			  ADRENO_QUIRK_PREEMPTION |
+			  ADRENO_QUIRK_IFPC,
 		.init = a6xx_gpu_init,
 		.zapfw = "gen70900_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {

-- 
2.50.1

