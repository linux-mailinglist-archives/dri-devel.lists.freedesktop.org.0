Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5A5D38CE1
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jan 2026 07:36:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE6E10E1F3;
	Sat, 17 Jan 2026 06:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mcDteEPV";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fvuht+Na";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C393210E043
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jan 2026 06:36:00 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60H4m4Hj2821426
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jan 2026 06:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=1iSIAGNrGGkSorkUrHybP7
 sUtLOj4ZU5tkiLrYXIrCs=; b=mcDteEPVVjgYJNT2aGc7YtApBbfgWDpLQAB6Rw
 XXwWYOFSvCIzRuEap6TJJAFol/k6ZjgFrahqHHTCv8ZyISipLpLF9nlysRZzAOR1
 lLJjijBGlnUL/AbOu4RvUFygpkct9Cpdkv/wPV4d+t94gpTdkZ0te4tKq7yutPE0
 XK8fg86uLJJpIY09zuIDm7KpeCuBkO8+QMCzBUscmQdc4zKO1GXXP1cpsLfDUy4U
 5AHWfhXZsWX6fnoLQ0+vJJad2k9OdcugJ2a3OgXAKiwmzHR+1tVoPCmknqw+5DnX
 myvKazqA5qbGQwIQHOgjxuK4tjB8WyWtPXN1agENcvsvsPTQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br3q985hv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jan 2026 06:36:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c538971a16so615920785a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 22:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768631759; x=1769236559;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1iSIAGNrGGkSorkUrHybP7sUtLOj4ZU5tkiLrYXIrCs=;
 b=fvuht+NaSg6z8ZWkbOPQkDdDq6iCqSF11WPOAUEit6ztPDFG+HKBemDc1Nl5hKUn4P
 Wxp0DRyYHy2xsf1uYtz+zzKpWaSDtoQh2tsKE+Vb/njkryRfNBI6avRImM2Slc18MWPr
 +W0G4Pcyykw8NOU4rTq4lHA9cY3w9REHEMR/zCRvSKcbmW4IiGQ3mUSCA+MMN2GXzkmm
 LZQAGzoslVR24IIwdStKCk7V5xSmFhIy8UJefT7AjsE69DziajUXh7S0GT3+JbGF2+bE
 Sf4SxkzICmv/pOaOLHAYgWNTpWgym7gA0mY2bjUmySeDVylF0EQrYY/TPaGa51fC8aHk
 WM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768631759; x=1769236559;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1iSIAGNrGGkSorkUrHybP7sUtLOj4ZU5tkiLrYXIrCs=;
 b=k0vjYcETyiTuisgcDI5GPqFgnV0/9kVbXN5/8cyn13dszLjnBAjk54dDMyYJlYoPir
 eqMG85vy9lfwyHT5DHaBSS/NqVeylYU1+IZAGL5timcDGMRgMJ9qM9XF7cyFknySRcZb
 b2EzsXlUHHtwKyD81qS3mkXMm+kAhj9tvnXfL04smPn9xHGtNvkUT5mRkGYtwHQ1z8q8
 eePtjtKHAjj9t8UmUrSL7TBgegFjoLCkTz+jIZgeq3Y++lM+mVKLzEqWXznn9iOOp+m6
 TGsVyNi9ipqbyb2BjYfbPi/i/2VQ9EcmNFSAvUE9pk0lLhZ20pSCxu8OmaV8UxuL4nPS
 IDKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZ8JtkscbQjNFkj6TkBFEToXnlIEo5Z098NoE1OPocCU8SzOB/xcf/p96fpV7dkpUFWfc7GkeNNeM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyb/FOyTPhDkY1Gv/X+PDz0IXmRKpdg3P4J26zJ5RsiPjbn9G71
 CMhR0iMUmP1XDwCsr9W54uyq26zAEKnrFBdZw+q56IjW7NQHN+beDN4nftuI/EpzTbMbWtGkDS3
 DAhdaM3Y6DQj9R1iK89L0tP9eGlce0YuZzAwe+iZaGNZ6LRXpm/8UJRUYsTA05HaztHZc+MQ=
X-Gm-Gg: AY/fxX7fb80GQ8rl+SAXPMbkI6GDu9do7Jzof7nV1ZdTnX1Frz/9SMnHd5JltBOGzCO
 /LKJnsWBwD8uizORJNExDvcdT/4q4RuSnyzwGBHxuqjFbEpwpyAtefIDtHwTNkws1r9t1kANe8e
 t43yqYrnxydUDp/ZxSZ9aDYXHIUw32TKBt5Cw7Xus5Z+7i+DB7NrVrMkMNI+9vGza8rYCcEkdrm
 MTKnJphmI2tW0I+7QPjKaXC2wglBH4dtpAE9MxX7HuieY/oetrW5MU5gT9/vFp/19T2pn/8cajs
 jdAkoZGAJfN8Hmpw1smRBoADKd6hNBJa3i8CS2NelYLwLBRI491RvX3JX7BkH9yiHek2hT9S8ma
 Mcy2vYLWEXK5dSyT2Pp90TtUystb8XI9+FSEUsB2f/sPu8gFANDtTj9d7ihdBysVE/DBPRRDOOW
 fm0NrwScplq2C3oDZuKafntMY=
X-Received: by 2002:a05:620a:2d87:b0:8c6:a749:3361 with SMTP id
 af79cd13be357-8c6a74933a9mr457675085a.41.1768631759078; 
 Fri, 16 Jan 2026 22:35:59 -0800 (PST)
X-Received: by 2002:a05:620a:2d87:b0:8c6:a749:3361 with SMTP id
 af79cd13be357-8c6a74933a9mr457673685a.41.1768631758615; 
 Fri, 16 Jan 2026 22:35:58 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38384e790fdsm14049851fa.23.2026.01.16.22.35.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jan 2026 22:35:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/4] drm/msm: UBWC-related fixes
Date: Sat, 17 Jan 2026 08:35:53 +0200
Message-Id: <20260117-msm-ubwc-fixes-v1-0-d5c65ea552c7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMota2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0Nz3dziXN3SpPJk3bTMitRiXWNTgzQz8xQLM4MUUyWgpoKiVLAEUE9
 0bG0tALqlUHpgAAAA
X-Change-ID: 20260117-msm-ubwc-fixes-350f67d860d5
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
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=817;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mEiXyz3E0C/8C/OEmdDzBTl/B0+VTZUOuLjDeTlkZ2I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpay3LCexxQWNuNf5Bwo1GfDaeKRFNST6mP+5MR
 RuA4akOZq6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWstywAKCRCLPIo+Aiko
 1VGtCACV+GM/f9mZ7H9m7cxSCTa6NmJCm/gSLkiqnweGDdE+neyRgWKCjhjGg0/wSNljRdubbPI
 LVhFYbnexBV0dQb0j0+ab8aay+/6qcdPUvj8xmiiF3BoWetIOuugdDgIR4YoMM5kP4CcDKmsGqp
 F1s3GsUih/4acrtTBsWd6wGX/GfsJ0PXzbc+K8ev+oDsNBB0KySX4I/sgx/WUaxeJ6a4ZGaVq3v
 9zHO+kaBfAtR2YvHYbmEqlA8oW0bG6FNh35+jsxeDzLIn7HBqTWKHfs72cBR3vLw3OjIS0ZJIuJ
 8Tvi8+i8Zxma2sD+5+DpkOUURJ0+KMfIcOrjjxexRhwR8HOa
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE3MDA1MiBTYWx0ZWRfX7eTlXUvv2WBf
 elCMqMoY3ecsnTDSkbDTTboGwJSybX8m5LFbDVa2mDnv431/N98BK2qZrp+6I6L0EtSIO4FVCO2
 /w7uXvvAuSN1Aizo4yLvsk+vXh6ZhSW3FLBeVmTeMSxv+uyGDqWqvtAqeOhiqk1I5AIbN8Td2JP
 ni/WnXycDSaA5C1avLgstEiS05VPSV563L7azhZSi3JrXzinMSYIOgiDmijGzr/h2Xun4SpY/iU
 2RROXkhT7VWMiThxw2ygN7aaiU+4xYbqzKfPMrxdeDgyd798vbzu9KMFeUK1beS+Sr44AbduIbN
 CapEpRiKPcZcf1xeuZDH45vbKuWowhglLhJNthwsCA1AOvPAPrmkJQFHnDvZ7BVuQo2dcdjg5Ob
 QH+DE3OtQ/Bdxx694896wsXSl0blTOhldklqjW+zTacZMEI6029aHHml8PLATHE4AfOnec37cMj
 WO2B/diaeDyH0TTz7cw==
X-Proofpoint-ORIG-GUID: dUXf6VaKi64ZckJmzWfqc6Z-VfT-svQg
X-Proofpoint-GUID: dUXf6VaKi64ZckJmzWfqc6Z-VfT-svQg
X-Authority-Analysis: v=2.4 cv=dPurWeZb c=1 sm=1 tr=0 ts=696b2dd0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=4HV87y4NaVraivzdFb0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_09,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601170052
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

Fix several bugs, possibly causing image corruption when using UBWC with
the drm/msm driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (4):
      drm/msm/mdss: correct HBB programmed on UBWC 5.x and 6.x devices
      drm/msm/dpu: offset HBB values written to DPU by -13
      drm/msm/dpu: program correct register for UBWC config on DPU 8.x+
      drm/msm/dpu: fix SSPP_UBWC_STATIC_CTRL programming on UBWC 5.x+

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 55 +++++++++++++++++------------
 drivers/gpu/drm/msm/msm_mdss.c              |  2 +-
 2 files changed, 33 insertions(+), 24 deletions(-)
---
base-commit: b775e489bec70895b7ef6b66927886bbac79598f
change-id: 20260117-msm-ubwc-fixes-350f67d860d5

Best regards,
-- 
With best wishes
Dmitry

