Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B5ACE48F9
	for <lists+dri-devel@lfdr.de>; Sun, 28 Dec 2025 05:02:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0469811A86F;
	Sun, 28 Dec 2025 04:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Muz37/He";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eQq14eTz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30D5A11A894
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 04:02:44 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BS3kmVP1812290
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 04:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 arjhpi8+qGbxWhcL6W8JUcOjwqn6XDw6bd+kn0lzFcM=; b=Muz37/Hej5t/bkPw
 VaS8uOKDyUTIDL7rtceX2OwSn6XhhJ6kNRdasFTr9dB7L86exxH8GJh/lLxReQ9b
 4prBZfExpufj3C7OP53ojUGaLMC5rB54RXY1p0UIRBIU9pKS8N15jCF81TiQqkC/
 cIEomWXGEzhxWqRtQKcH/juo1XEamUJh9D9tx/cmUHSfnNzSQf3qhKL5uIJ4gLif
 A9dA7nte3kTzI30V6i94AgShtCbn9vGEVIT732qFp8LisqG6LglPmHbQtx7KLNWU
 3WAMJcdWTbOVwwNwSfG6Jrxwj822W9g0M7GKBgPaUg6kZPqHwEq5m9YHChO71lIM
 exMXKg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba87bsky8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 04:02:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ed69f9ce96so280182011cf.3
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 20:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766894563; x=1767499363;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=arjhpi8+qGbxWhcL6W8JUcOjwqn6XDw6bd+kn0lzFcM=;
 b=eQq14eTz3sul10XzD65Dt1V4PxwFbAVNXNwjw1KjZvTBDk4Fww3JUgFoBvPVKZY17t
 o8pV8azxRspHcY8LA2138OheYscme9YkImDh2iC+xldDaHgk8OpHg6cZZc9duTrNQxk6
 ryAc22hZ8QyuGvRIHn1a6J5oXMX8NKgMEedyCffptefyVhuiLBjaaC9C0ejyiJ45lxJt
 PBDlTNaho2PYIubcSni8QTAj9u5xAfOyw+kWLbqqsvJdb7taTKnmbNj7OjKYt7VhUeQa
 FLpyA5y5hMMYEzErZl+r39WwwNPJGTClrHH1MHSeXQASqgU81tl2QpsFHLcfc0x5JdjF
 DtMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766894563; x=1767499363;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=arjhpi8+qGbxWhcL6W8JUcOjwqn6XDw6bd+kn0lzFcM=;
 b=ZYdlg+gTgz9Or5pnXbsy4sPu/pak4WBPe4TvwWbT1xCt1ag4OubHVGPQkXKKBsP+kt
 NGU+Bt95jJ2uNy1TMscy5SEOvaPo/PKNVmjpHYVu/WhBad+JxdzxvqoKzj2dEl8Z+sa0
 /+SU+UMGMbzCVl3y0KqgVif/baJeBEi84wry3qw6OeLGXTUeuzUIhv1w4vTLQzMrBbY0
 bLNMwlyupsJQRYc5zGRg5EfYtrf9FbAVaSejsPCNqyT5MTrTQh75pAOwdtYl6sM5ubUa
 Phpcg50dhGKkK+5tZHcCwACSzhUm3DKnFA1HYGODZESUA1memwTukTz6fIBCqFCA1EnA
 o6xQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5R1XbYgUwRIO8pFczW01jT5/Pb7/fQ1ObE3I2uK9KM/kINc1JHRHuNt6qn2V3E6X2gbnPZGf4eH4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRoMOqMvkyjfePJag6ln5roNna9OcaEN1nLjRIzP7qPgQw/PUj
 OFf+jHy1q7Zg4x53ubEYViq/MOP3UNlSvF9KN8CO/Nmj4y3inxrk1fj0sJnspEiWitAGTUrSO+M
 kvLp6h3osxqXXK3CSzdSiBPlEpM2+MgSLpT7RzAP4XvJkayQDJkSA1SFjXILM/4D7opqMAx0=
X-Gm-Gg: AY/fxX7oNzwNHXAVeBd+XSxqC48X3GKirqu85jH3uWC+YoClRQwh3geHsrriRXGTO7o
 7evqklxoOIVi9drVXayDD7OBJQ7AXSPjEhAbjIuOKJVCxYC0ToswE3MGKXGvLH0n+O5Mt6mHiRg
 WGONj5YUXyCCiGnunm0jSQPgXIQk2t2IIyqlEIx3OHU0gmFu0+h4qCVGiEfR/OPYsWBq8tUBNF0
 zSpMeTxXz2Z6nsJ6xO+RqAFadN6KHpN23/MVeG8JFsDSGeBxB6Vyvr5iHTqRGbLSiFs/rnin6N/
 bPupZ4qujsen8cYyoITil8DLnoQ+U6lKgl60oHzmLlE7m4N5tqzdzempw7ye/XoqO/FOUexOWOz
 BUUZ2nN1xKLks6fesTQzfTwlP5zzt6AtR3AlXymm72BBoHlSTxQr48wEikg/T/oCzvUaArHlKzT
 PDYFG8eztDXUSRj7gel6dzAQs=
X-Received: by 2002:a05:622a:19a5:b0:4ed:aece:b331 with SMTP id
 d75a77b69052e-4f4abcef65bmr405971951cf.27.1766894562586; 
 Sat, 27 Dec 2025 20:02:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjwlhdAkWEKQJLXeipUEE3TsK0r68DKPQO32dQw5IES/ATdDN83UnZEGSb7qmG18xos6ZFkg==
X-Received: by 2002:a05:622a:19a5:b0:4ed:aece:b331 with SMTP id
 d75a77b69052e-4f4abcef65bmr405971741cf.27.1766894562139; 
 Sat, 27 Dec 2025 20:02:42 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a185d5f07sm7840348e87.12.2025.12.27.20.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 20:02:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 06:02:27 +0200
Subject: [PATCH v4 1/3] drm/msm/dpu: drop intr_start from DPU 3.x catalog files
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-mdp5-drop-dpu3-v4-1-7497c3d39179@oss.qualcomm.com>
References: <20251228-mdp5-drop-dpu3-v4-0-7497c3d39179@oss.qualcomm.com>
In-Reply-To: <20251228-mdp5-drop-dpu3-v4-0-7497c3d39179@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3891;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KGT0ib6f0S9x+W7J89kuc0HaNX2OlP5UrNenSreVEj4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpUKvbjejpcXIDufPZRcwKyaBy2RNUdXd4ttop2
 FP3OZLwRx2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVCr2wAKCRCLPIo+Aiko
 1QbXB/9B1mhe4T41K7aJyN0cYdhvDYqNU+LDp9NdJ/cExGkosJ7mVG3PE1Vi531K/aKKAqJwvVh
 UqWZlZwrQ1hYIWcatRCRn9VXlj5Me0azR99qyjvGEU3VGCMPYAkZrXsBDiHHNQYA9IYF8mp06jK
 nnCU3abw0xK+aZBmmaTh9mXBxE++Ppk2u/78WrSECtoQ9X2cOqD3sm7AuFN8LOFuszMg4n9akb1
 oRDU6W/CspOwKmUhmj7QXtQ899nKhORkYN99ZIwTt7TpYFvBRoku4DD7eqO66+87CG8k4CYUrcN
 f5W6flKFzieHKk0b1YXjzXtQ9tT6HppIQb2eIwTKMUaCI0sH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 90htYnlsn1COwhZ_kMDUn8VLHezmY6Rc
X-Proofpoint-GUID: 90htYnlsn1COwhZ_kMDUn8VLHezmY6Rc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDAzNSBTYWx0ZWRfX6XTcQox6w5u0
 r5Ig4HHzupMhNWQpiRn+G9phcc8e//po6W9Yiey+gIbjqnHzY3fUvUP+NN7SH9fsjQ/Qd3aRz7u
 u/F1FCqVB3pzrjo3DMo1GfETUojho55IwpU5WBFEuSQyHqI5Bbo3/YotXGsFyAjCa3ltcsAe9nD
 Bi8ahW4gRJrdKvH9eA+uUmEhP+KUC51LvtYnmpWEdcpJwrsvYVZV/JAgogtZszmqYtnPnf4DPMI
 3vEgptpKCPWZUmN0RueElUp0Zu5kl5Sj3fQHLX3rXAgLZmOTvxy5biDFdeNUHY0Zoy3Xtfca8qB
 qQvqGUaNNL5vDielp79Xl+NDT69BoRiKj8I0ZxCj/7omBLi6fqwEz77x6vYYwvbQ5HQy+EE3oND
 g3S4HVreXw1PcoOH8WgDturS9lbqKjUYozNwwG9V1JIerEmyXw5EWsu/OyPFjFFPtmOBZoXvoVP
 tj2QUWm0YZs7B3yQmVA==
X-Authority-Analysis: v=2.4 cv=do7Wylg4 c=1 sm=1 tr=0 ts=6950abe3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-wdOMmJq3JXEukoY-DMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_02,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280035
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

DPU 3.x don't have separate intr_start interrupt, drop it from catalog
files.

Fixes: 94391a14fc27 ("drm/msm/dpu1: Add MSM8998 to hw catalog")
Fixes: 7204df5e7e68 ("drm/msm/dpu: add support for SDM660 and SDM630 platforms")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 5 -----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h  | 5 -----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h  | 5 -----
 3 files changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index f91220496082..b1b03d8b30fa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -42,24 +42,19 @@ static const struct dpu_ctl_cfg msm8998_ctl[] = {
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x94,
 		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x94,
 		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x1600, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x1800, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
index 8f9a097147c0..64df4e80ea43 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
@@ -37,24 +37,19 @@ static const struct dpu_ctl_cfg sdm660_ctl[] = {
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x94,
 		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x94,
 		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x1600, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x1800, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index 0ad18bd273ff..b409af899918 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -36,24 +36,19 @@ static const struct dpu_ctl_cfg sdm630_ctl[] = {
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x94,
 		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x94,
 		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x1600, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x1800, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 };
 

-- 
2.47.3

