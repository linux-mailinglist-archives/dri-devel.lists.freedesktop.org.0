Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA1FB97C55
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 01:04:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9250F10E66B;
	Tue, 23 Sep 2025 23:04:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ABnV+FdM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BAB510E66B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 23:04:04 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58NLGAOV011040
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 23:04:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=58K3+b60HdHpTovM/JEe3D
 u59tHhPSrkRIfHHVYoxDc=; b=ABnV+FdMXhX7JUNBe15zXa/3R/etn09KLf7J/0
 vbec0V8l7Sx3wLsOb1Ln6FFti6YiDWoYrMWafh3HTuGwLmq1ndBSMobZ7rXh0uLC
 WkxY9s1CMqMN4xSDgnOAt6JrcAhMCg4x79EfnpM/4+mF9Os8DbE0p+GVyBdNmmHP
 zUQpjlaefYyXklr01umgSofiyjJOxYfsKyVF4VniysnrX51r+g7Krw/SgeJ4tnz8
 0b0ZNdHcI58c0q09+gXfOeMhml38sAHV4d9M8Z2Ollbl0HL+lQowOOvRw1sjW+ph
 Y9tnqa6p/eV1Rd48l9VroTCu5MJBXR3pOtrDQERzQe4wgI2w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49buda9uxc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 23:04:03 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-27c62320f16so21175645ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 16:04:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758668642; x=1759273442;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=58K3+b60HdHpTovM/JEe3Du59tHhPSrkRIfHHVYoxDc=;
 b=ubc20uRKaKW9m5kltNUanhUEWCxoS4wRLkC26qzJOA3FiBZwv+G7KppPEhrlixjkny
 wxbW6v8+6A00e1dP0o+9vGbusOxMbzmbxm0onAUxwNuojPMwHyrXjYzY6tC+FJPQfuhF
 HWnEB7DpGrCJgBuqQrZlIYPSQ5bM3qLuLkFDP+DTp99AEFh01LmifIcTYXIVy2yzVBrF
 xbVvGZPknYKqAWGiInMDVUKS9pgER4MHaBnHzpbJB5+SNZXpAJ3b8DtCHso6vsfmLnKT
 bRQb6jXhQ4Qeq8IftQbZL31pjYi9I+nKLd5VWI/PGk/oxuPzetwuezg8T6Z+hLHbp7TV
 KMmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOuqKqdRG5m+iVrkmmTqTqL7CCw/PAkHQHp1YsOJ/Z2M62+CiTpqf/AmqrcU/ZK/wt2OZsHk+5ysQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzW2y56wzMpeGYXGj96eSoWIxDLmQXdW0Z7VUATEgVa8Bfyrf6
 DtfaUhIe//MVAxn+rB6PC7w+VpJWWGdABbWKGxlatMv8G6JmIliMioxjxeN00oqN4YfORWAg2lk
 KawgBiNHbvyIkzlNomftF4sR5L2SHjxXhm5+2hvnTgEi3O4UExCDQ/wFzXXAkQBbdqrt+9Zc=
X-Gm-Gg: ASbGncsUWUDRm5UbHvdrJqVPbQB+0jBq/Oeo/t12QNNRtVxhmEKiJDLmsGSwDi/xsNg
 noxCfCdi4p37gfMJOvdI5bXEn3Pq46rZcyHyWrSLq2H1P9bxDXU47FLLX2lFRPQvneUklzW8UJI
 acL+kTGeH+XZ4emKvxnNCAchQCsUrvK7mRCLpT64f/gOUpYlpil+YNmfeZwCFMAgsrxigltq9q3
 MjTzRyFRt3LOksYMC8j4Eco2OOPmkfI4BCBg3+0GATkp/hJvg3sguLeiHDPCzZ6NJ3HRl8WJE8r
 4ewcm7ONjV3QABORcrqyy3gYy16ju5VyIUO49YFrmN/6xWe6zVVoXmPT/UX6KWSluIszj0hjgQ+
 tPKfQz0knKtjQdp32YlBXhAX0
X-Received: by 2002:a17:902:c949:b0:271:ac7a:8f18 with SMTP id
 d9443c01a7336-27cc874ceeemr61296355ad.43.1758668642018; 
 Tue, 23 Sep 2025 16:04:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWMuXsMqeWdHfG3Q0iSdhZ7PqeKemSONOKLfnKqk8Y8tAkzzt9izQUa/a6kjFlS0LoMYgzhA==
X-Received: by 2002:a17:902:c949:b0:271:ac7a:8f18 with SMTP id
 d9443c01a7336-27cc874ceeemr61295985ad.43.1758668641543; 
 Tue, 23 Sep 2025 16:04:01 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3341bdb4fafsm264159a91.17.2025.09.23.16.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 16:04:01 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Tue, 23 Sep 2025 16:03:50 -0700
Subject: [PATCH v2] drm/msm/dpu: Fix adjusted mode clock check for 3d merge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-modeclk-fix-v2-1-01fcd0b2465a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFUn02gC/22MQQ7CIBQFr9L8tTSAVqAr72G6QPhYYlsUlGga7
 i527eYlM8mbFRJGjwn6ZoWI2Scflgp814AZ9XJF4m1l4JR3VHFO5mDRTDfi/JtoKehedFapI4X
 6uEesequdh8qjT88QP1s8s5/938mMMKLVRTqNRhycPIWU2sdLTybMc1sHhlLKF/pr6metAAAA
X-Change-ID: 20250922-modeclk-fix-a870375d9960
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758668640; l=1426;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=fW9hN+Uot5XeGTW0vGy7LlwwOKsTVabOSGy8umKLsfY=;
 b=0WPsi2JqiBm2EAsShjs4ZE0gIwAhchYvRRbOHTVrR4FFGzoOoV5ogBbXidPFi9QwWPCyDf9Ir
 LbTKbrjVP5PCMP5epH26433j6V5fCB7+pSKqa5m+cWHNu7z+Q2uaEmG
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-GUID: QhC4ZYUqjN2V2zTM2mqEwptISOfu9cwc
X-Proofpoint-ORIG-GUID: QhC4ZYUqjN2V2zTM2mqEwptISOfu9cwc
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68d32763 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=Vw-sYGc2aXT8tV8L1nQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDExMyBTYWx0ZWRfX/XoAV4+isFwY
 ziVlAz+MS1Wsz0le5VnvydQYsAbp9zUZOO/hGWgIF2lNGxrPknfuByx5nLRMAtf3BOhAe1QgGqD
 OgDi3C358Lcp/m/YKNwPxil/U0HV+i+nWC06tmCsRQBlLFbAAvoyhI7p46LbI/gZKWGy2xwJ528
 1cDxpC8eV4FgIWh6sZxzLlOQuZ4h+ImP6FM+Bk2VxjX9KGVbMO3r6rEMb0gjsFooTft70Xs/C4X
 ao0J2bRw/2pg4zxjsDS0Kc16oclSpwTATGosZhj4ZCKfracNjz7mfFAHC0SYFwcJGzsnREle9Eg
 NXEQ73mWZuZ2SH7R1WebEZ7atJihrf+Hb0Xopusjg8ZRfqFT7WJXW0JyV83TEL6aDOvJatpsquV
 +n4nTcdB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_07,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230113
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

Since 3D merge allows for larger modes to be supported across 2 layer
mixers, filter modes based on adjusted mode clock / 2 when 3d merge is
supported.

Reported-by: Abel Vesa <abel.vesa@linaro.org>
Fixes: 62b7d6835288 ("drm/msm/dpu: Filter modes based on adjusted mode clock")
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
Changes in v2:
- Divide adjusted mode clock by 2 if 3d merge enabled (Dmitry)
- Link to v1: https://lore.kernel.org/r/20250922-modeclk-fix-v1-1-a9b8faec74f8@oss.qualcomm.com
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 4b970a59deaf..2f8156051d9b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1545,6 +1545,9 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
 	adjusted_mode_clk = dpu_core_perf_adjusted_mode_clk(mode->clock,
 							    dpu_kms->perf.perf_cfg);
 
+	if (dpu_kms->catalog->caps->has_3d_merge)
+		adjusted_mode_clk /= 2;
+
 	/*
 	 * The given mode, adjusted for the perf clock factor, should not exceed
 	 * the max core clock rate

---
base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63
change-id: 20250922-modeclk-fix-a870375d9960

Best regards,
--  
Jessica Zhang <jessica.zhang@oss.qualcomm.com>

