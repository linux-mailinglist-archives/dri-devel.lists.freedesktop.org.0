Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC089B1F17F
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 02:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F77210E205;
	Sat,  9 Aug 2025 00:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AeqcSjQ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19DA010E24E
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 00:35:40 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578ElWbS007839
 for <dri-devel@lists.freedesktop.org>; Sat, 9 Aug 2025 00:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bOPqaygyz1VOMQKkg7WWHDM49dkikPWmvYtJ6Qfvgpg=; b=AeqcSjQ6V54+/n8k
 degUFSHzA1jYAR6Cnb/jnjHLc05nlzwYXU/C0IZpkFj/52KUxn+PR/vdNJo9V0T5
 4KPbzl9qOeLINoGIoubbNSPN2Ib2XHUMVLY071KTYOxH1buG0QLNLv51+4af2S0g
 bL3FOZ1Bv699JQztT5va2Qpq1dLg4yeU0B+j2/v9ue22BpWRWpWapTZQMPEistWr
 mvpFoc7imTfZfba5aNhawYnMUT5SetJj/6ZzHlzv06z/5qzW8gSc97GWL9L3Yo1M
 JhPBJLyoldCPhykn5k2k8JFgzGt4UcEN7G3EtSt2xvjjZ9uCy5BE/xdSIx0UVJj2
 I2QTpA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy73h8a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 00:35:39 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b42a097bbb1so1278812a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Aug 2025 17:35:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754699739; x=1755304539;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bOPqaygyz1VOMQKkg7WWHDM49dkikPWmvYtJ6Qfvgpg=;
 b=M0DYE/G4hRrig9zTN9Q+N+tiklzuDwgRm1ob5FM0mRqC9zxx0OFrIwRAgRJ7dOF8iX
 zqbX3Fqt1fsv7E4A9Zn4sltjgbhYpIFK9j7QrzlaZmpUBrNAgwgnJdufsSfEGseRTvai
 czgWaphc7PV2HdP3riC1dmE0wYdh1x87ztbBFLhpkVizhYBufE+/pO9h/OEZ/wMvjGrW
 TI72iQZoA/mJEcppidTqVBK2URlbZuio8tOZg8KJq/mcpiDhWy6pfPB84dMtSzSYggQY
 a7Wlmzv/ibGtmG8OVdeo7bmWjRlDk656I8y5N9LdUE0WDw0i6+b79NyyDbVstdrqsRYM
 MejA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1vaU+56who0wmxmN66xsKKXIwDvD2gL8gI9bIqKbEH9+wRQx17mR8WHPP36pz4Vxt2hCVaB0Tzqk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyntQTeYmc0MdMFRJm7KiTS+NSPfzyF+IHeWc4MpGC1Asqe/jc/
 GaHglx/B7LBUMqUBMF/CCn93hPAEqWhvJ1S9Y//puyCjj5zfEaNr65G0KyYnz2cEUdtnD5bHoJJ
 2N+W4Jpex/CeW8xCjFpshqJa+YUgQj09mVnTrC4GxXu3D3+pMPE93nLQcpWjLWcxTf5Yu/jM=
X-Gm-Gg: ASbGncvlGkHd7qXW94k3grF/uPy5Og0Ll8Gzj2ltuEvyT0jIGMxnR0XzOfYtAwXEKRu
 WPO8xnaZfZNrmcVDAL9u7teWp6AXqe4AUhz96bfzzWoXYB9+HoMrkflGtabba7arAfvF1Klu/Hn
 23DzAVdDZlv/UsDP+WG3ZmN9a5VPO2ShXNK8BVeHi6QGsr60H/phkymx2cQ2iGDSA5Kc3Nt42hN
 YXGAApgNg+kF0bUac8GB5KNjvmebRm8pg6PFiywh2fXktHdKCyGUtkqpAVJ6W1EenAIiA9l3sdW
 2VmGn7ubdwAHKUWA4/9U3TvHnQKU0UwOuqG+eCBktgPQh68OS+Vpc5EMEvW7AIWMWkJQdIRurSY
 /6qfyR4gh3RMSTcxUn0YWETj1
X-Received: by 2002:a17:903:1b4e:b0:242:9bc4:f1c9 with SMTP id
 d9443c01a7336-242c22a0e73mr68472475ad.56.1754699738797; 
 Fri, 08 Aug 2025 17:35:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG90TkpPOHu3ik+v+Qlm6PmhiW122lbzmzkgxapd9Ri+VnBLxN8IwuH859qvbq5t5KTGtZyKQ==
X-Received: by 2002:a17:903:1b4e:b0:242:9bc4:f1c9 with SMTP id
 d9443c01a7336-242c22a0e73mr68472205ad.56.1754699738343; 
 Fri, 08 Aug 2025 17:35:38 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef678dsm219865355ad.39.2025.08.08.17.35.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 17:35:38 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 08 Aug 2025 17:35:14 -0700
Subject: [PATCH v2 02/12] drm/msm/dp: Fix the ISR_* enum values
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-hpd-refactor-v2-2-7f4e1e741aa3@oss.qualcomm.com>
References: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
In-Reply-To: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754699734; l=951;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=4dI75xSUxUaqLwUMy3UReh9bT/U4ccPbg+CHWdIsNCg=;
 b=9v7t/t5zjvmt0SS7wNe7gTFJ1P3lQd6ZvEw9FvAt79V9e3RldlmDsTJIL0pzQssWYKovivqqU
 IliiZxToWPaBt9Ldj8dLeYd1tzf06Yme4Xmh0XGrjLZQJwBpdZRzhZN
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-ORIG-GUID: 39ntdq3HpqcyFMiBVuCvTYPliIPknstc
X-Proofpoint-GUID: 39ntdq3HpqcyFMiBVuCvTYPliIPknstc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX4PESfiD32FUB
 eTcKlLRdGvCspr4R23of4vpuuukzrBdfdNb4mHPu5bGv6WypyTkvAdomq7UzGf/hEez/HXYyy3u
 dkYT1Z7pc0Mbtd+RKWBghhv7D5DYxhNj2vFZNUm+sB4uNTVHDYWWcLekfrY1OYgKU2YLL1MvJUK
 zoZ+L65S4YB/ttp7mSVCXCDDtFU4dl9RtdTs1HN3Ui/uFeGdSTzJZ8iQVEsPIrZVmVCfsujf8ZQ
 Xem0/GoSgtwOhizKI4O0QVON0KOOGDh9UQAFRCL1bPyLtOLm9LfoAkttmWJ8TUptH1EbM6s7SCn
 ozmLUKZY6/+dknGyOzToye5EvVyElA2aIplWIMwfdi45VkKT44NTqkBcfC63+nS03+qfEVbzVCl
 ZZ61ANLt
X-Authority-Analysis: v=2.4 cv=LNVmQIW9 c=1 sm=1 tr=0 ts=689697db cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=rrNbjNIy7db4sKJtjcAA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_08,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060009
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

ISR_HPD_IO_GLITCH_COUNT and ISR_HPD_REPLUG_COUNT are not in the correct
order. Swap them so that the ISR_* enum will have the correct values.

Also, correct the spelling for ISR_HPD_REPLUG_COUNT.

Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d87d47cc7ec3..bfcb39ff89e0 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -38,9 +38,9 @@ enum {
 	ISR_DISCONNECTED,
 	ISR_CONNECT_PENDING,
 	ISR_CONNECTED,
-	ISR_HPD_REPLUG_COUNT,
+	ISR_HPD_IO_GLITCH_COUNT,
 	ISR_IRQ_HPD_PULSE_COUNT,
-	ISR_HPD_LO_GLITH_COUNT,
+	ISR_HPD_REPLUG_COUNT,
 };
 
 /* event thread connection state */

-- 
2.50.1

