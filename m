Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AA4AAC4A9
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 14:53:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4F810E688;
	Tue,  6 May 2025 12:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QdkUrvRc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C1FA10E687
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 12:53:52 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5468no32014062
 for <dri-devel@lists.freedesktop.org>; Tue, 6 May 2025 12:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=AgmcAWolgCiPWNjO4wriq7
 aohKZcAwprjCNfGs2zXa4=; b=QdkUrvRcGUMl+tnKigTOVSVpUZ/sKfBbjRwWxV
 sTqicwSp3duCZaLX14bY4RySYzPhFK1/BRTSlQx+06rKhJmSlkrf1hsN0uN8Dd99
 ox4EWtqD4aHmbhuA/t+duN+TeFo4Skxv6HXndvSFitGvCOtu8qAYFxZamz25F0H1
 nCKPevvnQdSmr/RykTyHyBvNjXO/n0UNBIQsQ2GmWkPqjCL8D/Qj04FEAhMnqCI+
 pRB1HCQAKb+JB1hI21Flw+yZZbiXHRxklOXGQVeGOzc6lTbT1AclMOM9ymR5N1s1
 j/hoA7+3r7snI2TEbPJ6OnbJgzqsdzU5TuHAW+nMPt2AT1Hw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5u42b8v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 06 May 2025 12:53:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4766e03b92bso100301351cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 06 May 2025 05:53:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746536030; x=1747140830;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AgmcAWolgCiPWNjO4wriq7aohKZcAwprjCNfGs2zXa4=;
 b=fIF82DqpWoGfxvq5aikHaD8KBuoFbW6vKa/EkpCQZSROpSaYJZVthzaKqZOxlcff4a
 tmjEigOb4To6SxtUy7TZ4aSLNkw7f0CAO03parxO4XkgjB0cKjsMorC22yLwR1IZLFdG
 RvSVXShMDPhE92GXlBDBTObB+fhAaR3xunRtPt+OqsOSjq1ZtLJVIA5KBibh4AvCqzK9
 MgwaywYe/gWOoCwfcZNigrGZS+MXH32JLyllHsvY9GpLHaLiGvFfsONqxFkrxMd+p8bn
 z9Fi4+NnqSWpn5ku0JjqLJoUIH0K1omYI55oMp40k1dYf9Se8ep6y+HTXCu2H2HoPTOs
 5caA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpjPCaxgNQoHBZc/hnCBQKdMpxZj89zDLS2etxaZ00C0zxH44g5Ghd07TEunolzcNcLaXyxksMj6U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9BEHceVAg/qL19NKWWX3kB99BciAVkgXWPJCIygutNnvcEGzU
 UXNYfAgnHVgZ/UMXt3v0/UYQQJLP5pVVuJs5p9IVktJXmh7o8a7zlukU3yvIv53CJqmrgt6rCD7
 AfvUHgoV9lwpiDiLGSRxD18s5wZPp9HvvJNu3Chs990SlXY6zdUoqmgnWoUs1EKNmbQg=
X-Gm-Gg: ASbGncuV6uQVBdXnhg9cOmHFgZ2aS6F9MJPnIwD8QfMVvdL7iyzMagku9FketvE/FQK
 BLctR5X4Y2gKjDN4RkA0ftYms3NkuL8Q9VN3+LvfdtfggBboPf82MMBKGNjiOm1FWld1ml+m8i8
 TFGCjzu7/LQUEZNuTzxcqEuJSQ/Hv3oRbRcqpjNy/H82WO+EouwJbE86N8Yy7EzZsc7sUoXdKUO
 zt8xHgT4TNUG4uOwNaR5RfQPFMnjMxOXVNDhArDytIjtpz+DjX/YcDxBSCoj6kI21WN3AtKFhgG
 37Kdt7vrs2NVFfnykuxemaeMb0Rdvxb+8UA5pRhbLJyEy+Lgdded98XxRlkeP0arOmhA01U0MvX
 k3QYP+tDdbsZWB+Tyy67zecrD
X-Received: by 2002:a05:622a:230a:b0:476:838c:b0ce with SMTP id
 d75a77b69052e-4910c3954d4mr48099231cf.13.1746536030550; 
 Tue, 06 May 2025 05:53:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXsqKKERRcPxEdrvqstmJGewVow5qWh99rnHUM6amWIecro3btKP0XXWIMwlYB2tixxvB4cw==
X-Received: by 2002:a05:622a:230a:b0:476:838c:b0ce with SMTP id
 d75a77b69052e-4910c3954d4mr48098721cf.13.1746536030166; 
 Tue, 06 May 2025 05:53:50 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3202a89f22csm21568221fa.84.2025.05.06.05.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 05:53:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 06 May 2025 15:53:48 +0300
Subject: [PATCH] drm/msm/dpu: remove DPU_CTL_SPLIT_DISPLAY from SAR2130P
 CTL blocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-dpu-sar2130p-no-split-display-v1-1-b619c0fddea5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFsGGmgC/x3MQQqEMAxA0atI1gbSamWYqwwuqo0akFqaURTx7
 lNm9Xmbf4NyFlZ4VzdkPkRliwWmrmBcfJwZJRSDJevIUYch7ag+W9NQwrihplW+GKTUX9i2lgc
 aXs50DsojZZ7k/P8//fP8APu7NDlvAAAA
X-Change-ID: 20250506-dpu-sar2130p-no-split-display-442eb0b85165
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1806;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=aCKhQ5Lb1Tbcv2cIcyI7sgot7I/f5b0mNTjY2gFri0Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoGgZcZXlpZXsBrmJ6mYd8gCprsu5r3HsOH21/f
 Qun5IG99seJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBoGXAAKCRCLPIo+Aiko
 1fbpCACk67EUrszUXYFDfhykF/xPSvfXYmeLZ7SoRQp1KkTZCkL5HW/yZmgOCklEiDpvHlz5HeK
 NcACb+qSoOFki/bm1i8iau3yUYd5eIalGF5caokG8SIJH1wEqM4xVlvMfUvZQX+VMab31levnYa
 VD0cMGuGL8OcRbCErhmT6PRDfF2wKUC73lJhURmqpYC7zTOSO5hY/y9Bq+zJXaMUY+Gs/tF4Rmi
 YE2hNx4y6UXT7iAFRFEmJGjKQWAJViipg4pom/NW1ynDO9F0SPjnitUZInizwsm4sI3nGF0+BUG
 w2nIuCDnJHz1nmcSa1Xxaj5uSaHmvZU5ktNOu4cCRnfhxj+v
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=KcfSsRYD c=1 sm=1 tr=0 ts=681a065f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ApOX_RYdNeUh17kXzE8A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 7ZjalVNXpKXYVtfDmB9AC8kHhIcM8E8f
X-Proofpoint-ORIG-GUID: 7ZjalVNXpKXYVtfDmB9AC8kHhIcM8E8f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDEyNCBTYWx0ZWRfX3iLuOpQ0eUuq
 6iErPHCoBRi1hPvPXnrLbBhbv2ntIuuuotOzX/oxA0sldEp+luVVHxevrE+QOtx9zEZIgmLQUI1
 81LWSX8OyTTtkJnw6Um7L+yhfr8m5sw1ov3nNoVj39ssxHG70PyFC1gmJU+FXhPRMzT0SyQTaZX
 WX8SGmN2rJ/sxuwelyHsNFcPWb/VkIsc6BCxaVjoEhh79Jbzzym5KhwQujBcxA2lLbwIYgFceYo
 lIJKzblD0UEmaIEsZFjLCUAIf7FfDfqyh8b2FIPNA8Rbd8jFrq2vYltHD4Gh2z5JzNNMusWIEpT
 GeHDOafvLaI+pn//MDAtz4hu9By5Xc+V1ieG4VGPHiFpw4vYDEbartKsQmNV+QGbefR9rN+D7QK
 7wAkYALDnrB+s9sXX8fjP13DcdX/9f42A7GuQNKcwV0MjUsQJWZWB1zfFCxmRCBJw/Sz5y7z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060124
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

From: Dmitry Baryshkov <lumag@kernel.org>

Follow the changes in the commit a2649952f66e ("drm/msm/dpu: remove
DPU_CTL_SPLIT_DISPLAY from CTL blocks on DPU >= 5.0") and remove
DPU_CTL_SPLIT_DISPLAY from the CTL blocks on the SAR2130P platform.
Single CTL is used for all interfaces used by a single path

Fixes: 178575173472 ("drm/msm/dpu: add catalog entry for SAR2130P")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
index 22dd16c6e210e9520ecb7a851bee402032fa1ee2..5667d055fbd1d8125c3231302daa3e05de5944c9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
@@ -27,17 +27,16 @@ static const struct dpu_mdp_cfg sar2130p_mdp = {
 	},
 };
 
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sar2130p_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x290,
-		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = CTL_SM8550_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x290,
-		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = CTL_SM8550_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,

---
base-commit: 0a00723f4c2d0b273edd0737f236f103164a08eb
change-id: 20250506-dpu-sar2130p-no-split-display-442eb0b85165

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

