Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5648D2D295
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 08:27:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8937310E808;
	Fri, 16 Jan 2026 07:27:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cDKpF6UI";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GEiqN6pl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C8510E0EE
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:41 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FMbUMp1240858
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=T0TMXQPqtA4+cBU8YRgxLA
 V4GrYtwj53rF4X6f/w0Fw=; b=cDKpF6UIGtOIC1uxr/epUYgZosWzU98ddK9MOc
 bZKXfOAZZrMXlBfkoLjVniWCq8u17U+Dcgy3gTDzHhZfqAVIZrSo7XGnhqDAiceM
 S+IbBiE3R+Z7w27hF9evOiEp1Dyl04wmZ08GBYAtaBP8kqMC39JSSu5lA1mLPaUz
 11UHd2RWwo1GLy21aX/IuF9lcdtvIPZeSlGtxPgaZ1AAU91oI8IsO5FBERN7M+3p
 VolyRTlqOJao/e7zFBT77xIGZXugpF7ql7VUj79pz/4pkP+AaLSeVZBPNjhM5eWT
 M0TfOqyJ0+JmZH//o9G8klUu6RU6xNa92qxQNewF9bl41LYw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96ss7aa-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c53919fbfcso442752785a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 23:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768548460; x=1769153260;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=T0TMXQPqtA4+cBU8YRgxLAV4GrYtwj53rF4X6f/w0Fw=;
 b=GEiqN6pl/6gik0Q7ehLU14lVQ4eexpuDYfR/9+ec/EoLabsqRqWGjfIaw0Et/VGEq0
 HwCmRKIwhBf7/m0tiH9tXB5q7+xHazhjAgA4MBkp7Zvfn2aJU6RGWkD/zb7zAJd1Foct
 UcZ0VWgnBIl+t3Cwo+ILT7cwi7aq7P2i+c9E6ay9fydv47ux1RxVwRcgE32iIVg7pWPH
 uOv6hFwWAsbTxQDiN3GOB9Ox1uC14qoQd/LNEkGY9CjaW4J3zd8pX5QFhEkPXlajcwlx
 6hGQPLWM/E7GaGeefknOQqMkKrn/TL8zf5Ljz6LrkUL8dRmKr9tP3fSEO4fyQLYj0Vrm
 ZfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768548460; x=1769153260;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T0TMXQPqtA4+cBU8YRgxLAV4GrYtwj53rF4X6f/w0Fw=;
 b=LkdS3vDNnFC6Vv7LDRGZLRkiUvlssxuIzVZB0MWcBDFOkV6FlDGQ6fNs4C6e6fPzpS
 cPIVAzeoXqww6oDCXG7i8cJfq4oU7X/Ibj/QB5UHR+FYXtHyV0yKvVkdj1JbkumupKNI
 YxdAwWLTNJLJ631Cn+I6VA9NpkqznDvavW8AWZXH7hazT9rsJrIOZV25JMeBssWsKjDO
 osvKC1WK5GZdv5MwWq5/xP0aiWElRpXmYHnPZTf/eLMTKTYvvZIys+1t//IugBaQJ65N
 fGGc3UOHW7jqBDrdz9m0o0B0Taj1RgFZ8YIwnc0mroSdTZ9ISkxWHVbFthKTh7MaMKrP
 h7HQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsyDIZWs+RWTmF7rneBhlUMgrqopk/oqLc0nH6FIhkzPPR0n9TMKPdPMcXEVYk78mMSXL02CgToGw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyk7F3+hr5ODQatorwP8qoFIoaVe7wgjc7N7FpS+4mrSmC9ofcx
 oB+y2q9Vmt/LWW50ElX1d4JYbMt51xdJOTXGm9nvOxt+0365h7bC9Is2itg8gC72ECgi6K3Da9P
 uuPf1AyYWn+PZzFyUnq6UM3j7gMqF+E/5r9NfUKnDgNJ65oqaTWAs4l6de56jd91pkdylTns=
X-Gm-Gg: AY/fxX429LwNZtNnQB5WjjtwQeuqSEiPUApPx1VdUlc5zAATTMSMZJcd0TyPBRE71Hk
 89Y96r3SC9IBd5/LY52096KXn6egzVg2/uOd8BT5qKPUZtbplbfiRNfjuJ2QckOl8KukDmuQZoH
 yfSHAywSB9dSMdvDeRVGr0XYeJZplUg7MGMfIsnkRkJZWCQREo2RNjA/hMcNNPILzHc0A0Pyy7O
 s8JIOU5cnlZ6Mh/g30D0JZ2ycuWcwmIQ7hFAHJSdgLmvUxGxVKDmdXEBJWh8LjGiGPKPCM5D0Fe
 7W0DKXPQrnYx0vhTZ9vJplk08Pj6bmelHj3u3Nxtm2AcbmJ9CCtKxttPl4btnz4ofNW3r0jGaSP
 oekSlAelcLMWTNVq7WUOaQVsfO3uk9XkEmWRkGNMda5BK3G3BlBVKgGu7cJSu4+j4FLidjZFDzR
 8YoR6G6SeO9783oV37AyYhYl4=
X-Received: by 2002:a05:620a:711a:b0:89f:9693:2522 with SMTP id
 af79cd13be357-8c6a677aacbmr301083685a.73.1768548460170; 
 Thu, 15 Jan 2026 23:27:40 -0800 (PST)
X-Received: by 2002:a05:620a:711a:b0:89f:9693:2522 with SMTP id
 af79cd13be357-8c6a677aacbmr301080485a.73.1768548459734; 
 Thu, 15 Jan 2026 23:27:39 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf3976dbsm516941e87.66.2026.01.15.23.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 23:27:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 0/9] media: iris: migrate to using global UBWC config
Date: Fri, 16 Jan 2026 09:27:34 +0200
Message-Id: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGboaWkC/23Myw6CMBCF4VchXVvSW0pw5XsYF70hkwjVjlQN4
 d0trFiwmeSfnHwzwZAgIDlXM0khA0IcS8hTRVxvxnug4EsTwYRmnDMKCZBO9uMo051WzlrJTSB
 l/0yhg+9mXW+le8B3TL+Nznz9HimZU0a9b5hqlXe+sZeIWL8m83BxGOpyyIplsQfkHhAFUFJpo
 0PHGtMeAMuy/AFoQ79S6gAAAA==
X-Change-ID: 20260110-iris-ubwc-06f64cbb31ae
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
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2466;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zc5bZgS5N9Mbgx60oLHQOfMAt62Z01sy/8DRrMk4RjY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2bmi0zBzKOcdbfe/DY8ZtA7d9ri0gV6cT+3VMqzRiypa
 FSfqc/TyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJOLex/xVUOMzPrjLtVbeC
 9/bYBg8F16e/7gXs3XJM4YfyKunoXJH0+jyhLSKvpY6Z/DrTqiITXHjY1Wj95xP7k/4Kybxdbq9
 hUL1AWGiSXM36uS/eMEpWSZeb/t2cfo5X7PWacxLqazi5Zt8WjlKOmW6gIfeT6cpGY8MMbuvIXJ
 uFkw7e2Z10Zn+tpLHQU9M3nGVGgd0P9vukzbl1QOFz6ePMmgnX5pywPdK4gXVxLsf0M88CWQxis
 3NbKrY+XeJgb/j0mQHfYp0/W9bdiEtUbrn0yyY76Hz0+66HHsv4MgS5vdyfdy4P1b+XmGFzo3nO
 g1NXze5YntozS6HLryCTRfOAgU3ccg5xBwHT9YskZRyaAQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: ndqqXbuPaEEN3zuf_UQYtVpclTsdOBra
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA1NyBTYWx0ZWRfX8Xey1SbBq5LP
 gBx4O+9lwc/XCC9ER/J7zTz3TN6xCGplxSbw3GcYJsPkfYrmjl29f6axkWkMxVqZopArZTNo+pE
 vW/nE2pjyXpHlhaKUqjkcdlD//K8MDVgjU0pcLxZYKPGriZKriPYMeVypw9cT98s8pKpw7EaL/3
 9eRZXb+MaHFEqxNqzW5r4TAK4MaO/17dhpFWY1rBLhEwClteNeNQ3GteckJGT2KpLN2HV3xQ4CA
 CuD5zwDkma0oXJsjqa7jO0MTkmoWbFIoqANHWoN1Ty5H8e/T9+9igjNyP4liLil+XUgAsNjG6Hr
 OrkwVkLHPT7G5hu9sUU2rBkBbQD6jUk+K/vHQ3Tkvvm97Oc50Cdys4hqr/+RWJew6dQELadO/95
 zYk4sgTakAveWVSicZLSr/eEodwlzLb8s2QZcglgEArTcS/hUYG9OUHJpJg2phI003g0Kch+SnF
 wHkHZxnHGOJDqfQf5Qw==
X-Proofpoint-GUID: ndqqXbuPaEEN3zuf_UQYtVpclTsdOBra
X-Authority-Analysis: v=2.4 cv=M9tA6iws c=1 sm=1 tr=0 ts=6969e86d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=sotOLrqpNFqtnHaJl_IA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160057
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

Having UBWC configuration in the driver is error prone. For example, the
driver specifies fixed values for HBB, while the actual value might
depend on the DDR type. Stop defining UBWC data in the iris driver and
use the global UBWC configuration registry.

Merge strategy: either merge SoC bits directly through the media tree
(with Bjorn's ack) or merge to the media tree through the immutable tag.
The drm patches will follow depending on the way the SoC patches are
merged.

Note: the patches are compile-tested only because of the lack of the
Gen2 hardware at hand.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Dropped applied and unrelated patches (they will be posted separately)
- Include printk.h, decoupling the series from fix picked up by Bjorn
- Introduced additional helpers to retrieve the data.
- Link to v2: https://lore.kernel.org/r/20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com

Changes in v2:
- Extended the commit message and added a comment for the min_acc length
  helper (Konrad)
- Link to v1: https://lore.kernel.org/r/20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com

---
Dmitry Baryshkov (9):
      soc: qcom: ubwc: add helper to get min_acc length
      soc: qcom: ubwc: add helpers to get programmable values
      media: iris: retrieve UBWC platform configuration
      media: iris: don't specify min_acc_length in the source code
      media: iris: don't specify highest_bank_bit in the source code
      media: iris: don't specify ubwc_swizzle in the source code
      media: iris: don't specify bank_spreading in the source code
      media: iris: don't specify max_channels in the source code
      media: iris: drop remnants of UBWC configuration

 drivers/media/platform/qcom/iris/Kconfig           |  1 +
 drivers/media/platform/qcom/iris/iris_core.h       |  4 ++++
 .../platform/qcom/iris/iris_hfi_gen2_packet.c      | 18 ++++++++++------
 .../platform/qcom/iris/iris_platform_common.h      | 11 ----------
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 14 ------------
 drivers/media/platform/qcom/iris/iris_probe.c      |  5 +++++
 include/linux/soc/qcom/ubwc.h                      | 25 ++++++++++++++++++++++
 7 files changed, 46 insertions(+), 32 deletions(-)
---
base-commit: b775e489bec70895b7ef6b66927886bbac79598f
change-id: 20260110-iris-ubwc-06f64cbb31ae

Best regards,
-- 
With best wishes
Dmitry

