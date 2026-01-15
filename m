Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA348D22D0B
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 08:29:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 849C110E6C8;
	Thu, 15 Jan 2026 07:29:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JWdUkPAy";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KC599o3Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 853C710E6C5
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 07:29:18 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6gFes783893
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 07:29:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ih7YS3OMF9nyIk8eRvbGlEtAYQc1C2qkylBgX1JHA3o=; b=JWdUkPAya1vw6Ha6
 tuxrqztRlb6d6UPyODapJfG/4WFlSfGPsR6gSeulBEi/WwOId5W8QatoqT95S+xd
 FXsf7amXdK39OohD1QSrT6EF0M3ZSSg3LNewn8X1LHRDYaYrYtUYikWLZ0hTmpFy
 4kqCgTbms4j4NVu/Zkzqk1Ni+m03B2euUAd5javLeczQqsTpOpwvtb4KkLxlEzQR
 9o1gNhVNk702OwdiIyjnTSgjtWw0cbOhkwPu3Ee978t7SiyUhp0K+Gld3BoPCMst
 /xx4G1xVquVji89u2E0vO/MFPkSMXPC5/awTr7THJK85hbpDzkSF9JV4aWGNkB8W
 vYcalw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbj5jyy9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 07:29:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c38129a433so173760185a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 23:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768462157; x=1769066957;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ih7YS3OMF9nyIk8eRvbGlEtAYQc1C2qkylBgX1JHA3o=;
 b=KC599o3YaGPGXbATSBIWDLsEZ3higSR5CM20p94AxHlx+2VJ11qpHuIO027bNIXVCV
 8K8TewIMOIK5uazICbwyKQGbXw94N0O13b2HVZF+ScLmvM80sMPOyUms8aghOBZv6xGl
 PrmpgnbeULdH/q5HbHQvLw+z0shvumZt+kDPvZ4gYnsKjajlYnzo52jAfok20Y587vZL
 pZGuIH0Y3ngil6Whgr4eeBchUGDJig/hPq5PC83N+4aD1Bmj+/Y4eRNF5p3eyTzCHDBw
 K1TFDtE0+qcZtR6YLFBSO2yPgltZ+vyP7tIATp5Yf/wBg3tAQAFvwAZOARanAqDTqN0z
 R/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768462157; x=1769066957;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Ih7YS3OMF9nyIk8eRvbGlEtAYQc1C2qkylBgX1JHA3o=;
 b=s5FYQhG3I3zhKOPdrVNkWYAj1ejWyTR2LQXrTr8va0GPyLh/R8KtOS0t89ELLyf4nJ
 m1/9/3QzegV2c23uoFx/wh2MxWwSAnQDxUQ2ihiQbRCWG+PxTAEdvgjAh+izBvuUjAPl
 h6iSlgTKkYqNgVzO5Tj2YTeCNV39OLSSVYOYvQSTu6CnnOTLGnP6EgxY7j3KW0p6dThz
 PRkc9l0XUpc+yGP+/PnGE8oznzqvlVjoI2+iu82TkggK3wYl3RLYdZ0amGPYrlJPN1xa
 5EfHYdDr5rseucQzHqTBfPRum2LZqvavNpG3IJxrz92YTg+2Qp2QU8s6bc4jVvtt3tWt
 3D3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyHtoGdmghwTwADS2X97K/0EB4rKrP9OdaNG9uYU5LJ5lBBlHi226BDJRRDu3PCYzQ3I04MYUlIyo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy608X4jGVVEWItktaxDrV2qb0ad1re5NYlqXu42ycGNO7hWQhZ
 xqF9YBP/txKSM9O8BHmiu5/dJmB36I77opw5cUQlCyRHYp/g3ligGE0I3EHi+bv+/jeJ/kIwXB8
 jHZcIjY/IXYRtwlwt6HDfv7EnTgenKCdhTjYCU/Zp5mO0l5aSX1xn2RAy2/V8OIRtwZFaxGo=
X-Gm-Gg: AY/fxX49dNXrobSJ/T0q2MjdZoq+cV+8raRUMJ5EOna6AnARXO7ylLr2NyXJxcUzM8j
 6gMLkZpEcVHX+s4Xd1LSfe78LRLnVuMtQjJ4IybplWOQpKdzAvAz1EtGEtK6F0zmL75QfLXbOKh
 rQP1bIBBCUKLE2TLDw69j03YV8Oek0G5K3rKmu1iwz73asNFdZhHyMfuXmvo2Ek1xtNxiIik9tD
 OnDwEjkUOc6efRCa8lsMe2UcpmG4OvKJxHT/EGFwd3VY3CvtrAungfh5Ke5D2zKXe2IaLokqT+v
 I6vwJWZFOpNTwWAaHSL/VA6jriY41H02L8PJXG0+y+WLYAbnhbOGPIcNCN4hHSUGTo8JtDVREId
 nbNM4sf1R6TpZ4eZyLpTy+RjcQnfBQOrsaf4udQl0RG1UNRkD7F2vqqd/5fP7BRY7VFdogKdVDx
 Pb99tYKhv0uuXTbbWOi/PQCow=
X-Received: by 2002:a05:620a:3724:b0:8c5:2f89:6904 with SMTP id
 af79cd13be357-8c52fbdcde9mr656949085a.45.1768462156907; 
 Wed, 14 Jan 2026 23:29:16 -0800 (PST)
X-Received: by 2002:a05:620a:3724:b0:8c5:2f89:6904 with SMTP id
 af79cd13be357-8c52fbdcde9mr656946085a.45.1768462156353; 
 Wed, 14 Jan 2026 23:29:16 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-382eb7b1a4dsm58078801fa.17.2026.01.14.23.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 23:29:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 09:29:07 +0200
Subject: [PATCH v3 2/8] drm/msm/dp: Fix the ISR_* enum values
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-hpd-refactor-v3-2-08e2f3bcd2e0@oss.qualcomm.com>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
In-Reply-To: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1093;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ww/3qknDh3ls3uKJd9KJ6MipP3FzUf7GXLi0EYvbbNM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpaJdD8iaVfqQctF1fuYMmitxW2AoGGVd+jarYM
 1Fc+aQwmJCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWiXQwAKCRCLPIo+Aiko
 1RfXB/44P3jjfjIOIC2l0lP7Ir9d1o7Aixod0q7u6GLW2lFftilClKP7EunTO8cq+IgD3nTQoED
 XV+1shE9OCnUlvjQq2UFbAgh0AcfRQfTG2Y6ubtE2vu9Hl25KyfOLUuy+h9kPHcHC0d5jDuxMWi
 E4LdltEClbLp/C8+TGTVB953f653Aag/iSvoXlR7IzS2b9SCUECWHRptR0AXXuTztCnMRjJPAJB
 S1TsGwMhl5sTTae8WVxKHrTcvv93akl9G0vMgDcZ6FBDtTdnZx047GjVgy/K5AzWnTKlJgU1r0c
 1HD89JZ+9p+z3Nqe/P1ckmPFpMj87sTH26EtwBFAta3m/Mmh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0OSBTYWx0ZWRfX6K/FiQzCkQqS
 EMgFTsXXFGoV5UbIHcDGPA1U0aTE8HM4qZsmddHkhXYYDQ449YbMc7pja4hZCLwOkIuXcALeDj7
 12AYKjFPzx65yHOkxP8ZRLB4AhrRUIVfkxkrc2ERoevX74DurqP8bjDon4WqcAmexj0qSpTnLHE
 5IAtI5O8r1Q4H55s0067WE3N5ewSFZmQNFCzpqnGIYwZW6ZTAKtgXUYYUQ7fKpSC4XnmoATmsYe
 qQxCGGAQfAvBkiBbJvCVsFEtwFSRM+CuEvHTm1BM1SCPc3p8kKGl11drIqctkLqRU/F2tckqJYS
 EDnGRdlFl3tjAnooxqXAeCqU+i62qHcgi+HhQu3c7aa1vX7qUqvN6iQQHi0GGYzbsemLLdHoVwA
 eQ1Q942jK4Ljkzl5j5HJjPoHJ92tIiYHbgRJVF+emneqM3krkhwUjisv/cEpdFqZHcbFhWLa1l8
 YI81BXMPkc1i0dk/mwg==
X-Proofpoint-ORIG-GUID: I6NO-1VYhqm-8EggLH2ABKLcedkd_Q_i
X-Proofpoint-GUID: I6NO-1VYhqm-8EggLH2ABKLcedkd_Q_i
X-Authority-Analysis: v=2.4 cv=aapsXBot c=1 sm=1 tr=0 ts=6968974d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=aneus3DpQx8xEqIVSrsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150049
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

From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

The ISR_HPD_* enum should represent values that can be read from the
REG_DP_DP_HPD_INT_STATUS register. Swap ISR_HPD_IO_GLITCH_COUNT and
ISR_HPD_REPLUG_COUNT to map them correctly to register values.

While we are at it, correct the spelling for ISR_HPD_REPLUG_COUNT.

Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 476848bf8cd1..5997cd28ba11 100644
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
2.47.3

