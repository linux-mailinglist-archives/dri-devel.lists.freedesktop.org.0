Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEBBB9395F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 01:34:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 448FF10E025;
	Mon, 22 Sep 2025 23:34:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="E1FLgZPW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C71210E00E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 23:34:07 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MImbIY029818
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 23:34:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=m6ztTUa1Nhe291Dt3QY6n7
 qVtvRxyg0bpRvNd5kITc0=; b=E1FLgZPWQQqKCbHet7mgc23S2YPAxqBgIGCBo7
 F8/N7a7T7hM5JZCCHceCUCUCn1aiKp4j88BwNktkH4QSRgSImNJVq/Lh1btO32yi
 hne1s3ewJn1fmmf2lX7j9W2AoZcdKrwtw5WIv2bK8SLfK8KdR4FVajZ/BEI7xyW3
 liePs0S7WY/McEcJMSBlnh1nJTgGiHoX8dxGuKORiybg85TLFj1zuuvCBl+v4i7F
 VAKnuVvN+IZeQjBT7FnegKWgvXK9z715oG+2zU5YD77A8Wt2hfEV9okr1Tb1WGTc
 OPiyKP+ISTYladpR0urdkVEQhZB1hXgWOtpgeBSFcRVlvfoA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499mg36fhs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 23:34:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2699ebc0319so54164725ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 16:34:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758584046; x=1759188846;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m6ztTUa1Nhe291Dt3QY6n7qVtvRxyg0bpRvNd5kITc0=;
 b=Um9JqfdudSG2bLl5l+OLuR8sHDvW2kXnThUFlRTJtEtt++fENgxBgdV8M5dYKbegI5
 M25gzR9Sz5bfGNigfvu/mw2ubrmyLihMzajxomRasM7VbkGPelobuaPHfF8sCTeLJtI0
 gcB7CiqMiuqKBsxqQvxOrik/DOkm30wn2uWzL2MaENHjBp2dSpihVBSMqZWazV/edP4g
 mqLw8HAXSCEUewOwHHsilbC6B/9FVDI5Udw8Qb2mqu8DMEA3p8tTvLLZHPGiSGDjLutK
 +cyPU6S9WzJ5PysWEQZmzL93AklmEqB6MsQYU11KXgbUUGMXsX/A5hHGCsgAZGbgdo3b
 OG2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWA1rGbyBXMtO+Z4E9XU/wMKZAOmtjGwGaO+hZlHr3So6F1KUdyYH5QeYsQyGM3CthrRyO6FdsxB0s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNGjGSR3hdknzPqNbYIy+QWGHwKpIP0qHEmiIWloMSjeJHaecP
 3mh/KNBMuS3C/hbEyE2/0GSC9PuSQJjF1VQeZswAcIpyxny3JvIuzmBZoHWH+NHiy1vO8ZIen4C
 REYPkNq9H46u3NToL7wLse2Z0RyfMPVz4EKFt8ngsrhecj1I+6EQTvZRrGSFnDfKKzFA/BlVvcJ
 wk/Fw=
X-Gm-Gg: ASbGnctuV/a+PpWmHjevi9LnPv2UGhr379bJ1dooQ0TOn0LrYcYyhLbLPjCaKNO+WDg
 hRevCeue+E5o9DZj+bryGUMncOdJsol6PVtNHwx2sUnTSHlAWhxS3b93cyyKnDBaa58X1eMKnd5
 2EOtITD0BL3MRsfztFC4ie/T3hmJd2z5drybVegsHhxcPXnENBR6OjzZjkURXA08utKSI7P2svf
 9+UxGTB588YWVjK9RTO+6RbqPsYxLysZ+cwxJLDMI3htXFO6IRc91gBzpBj9A7dbSPbgwVHV54w
 eu/FdXHQM99FYD/xYxRr1xLfR2qYsvHC66z/Be9fAJiUwZn0Y5XuHI/V/eGzUeHK+hctZZ7I20I
 9hPVVATmMMeDJozk30nrsDPwJ
X-Received: by 2002:a17:902:d58f:b0:278:704:d6d0 with SMTP id
 d9443c01a7336-27cc41d1be3mr6027415ad.19.1758584045849; 
 Mon, 22 Sep 2025 16:34:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSbin/PIvKVcn/OXuhCk/5eExOX31UGaUEM1vyKmkyPKW8/DOkrYdu+4YvFnTtODfyJdb6Qw==
X-Received: by 2002:a17:902:d58f:b0:278:704:d6d0 with SMTP id
 d9443c01a7336-27cc41d1be3mr6027095ad.19.1758584045367; 
 Mon, 22 Sep 2025 16:34:05 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2698019821dsm143706275ad.64.2025.09.22.16.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 16:34:05 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 16:32:39 -0700
Subject: [PATCH] drm/msm/dpu: Don't adjust mode clock if 3d merge is supported
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-modeclk-fix-v1-1-a9b8faec74f8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJbc0WgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSyMj3dz8lNTknGzdtMwK3UQLcwNjc9MUS0szAyWgjoKiVKAw2LTo2Np
 aADo2laBdAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758584044; l=1310;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=NO6OCdz9v3Tc/Ktiqg3Wh+gypiA56gt1Z/XEzJOevmM=;
 b=FqqpcegGZLXcfSidwXQSnQCKvesciEyokTB8ipKxsrgPjY51xArxNhIg82ImuTocCxHkuuPGw
 VJFOYqL/PstDdIHfGPlZ+Z8RwhNoeEAsIRRkKI74iPOGYZqxpsIOTuW
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzMiBTYWx0ZWRfX2BPqs31lAYQ3
 60H5YUAOZuaTSOK062BD16pdhT0BnT6lGrZIdbW2LD/K9GTQcn/yjuMsvuE2hjgJKYHi5rC0k7f
 2+z6lKiVsTS2SotgoT1KZpx6qt24ZjiY+Yzzwkom3Yf1uwjm+eTo04NcFzEh8aR83jl/ZAZaScd
 UhWzQfYAyJb0xBlxlD7uaDkRkkpXHPgW9wrSn7M0xZ4L3wWXS4ScynGe2ptb/oCahX4lpKO8Ut7
 jHNf/xKTlqaRiaJGMXCg8A494m2RL3Tzp0rA9xexHQh4hICGpA8X1/SJZZ/70cu5KoTzwjS5iNZ
 bJD4kM9/fSvhJ+lFBuc+133iQ/Gd1ffZ7eEs5jaNRpDnBQx8/A50ANxkcCJFLhLRomwy+Ov93zg
 I78zEy2p
X-Proofpoint-GUID: Feea0BjB9mQ2tU4Ruuy-VVW21999HpHS
X-Authority-Analysis: v=2.4 cv=UvtjN/wB c=1 sm=1 tr=0 ts=68d1dcee cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=NBkOncM4Jvnk2V6n248A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Feea0BjB9mQ2tU4Ruuy-VVW21999HpHS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_05,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200032
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

Since 3D merge allows for higher mode clocks to be supported across
multiple layer mixers, filter modes based on adjusted mode clocks
only if 3D merge isn't supported.

Reported-by: Abel Vesa <abel.vesa@linaro.org>
Fixes: 62b7d6835288 ("drm/msm/dpu: Filter modes based on adjusted mode clock")
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 4b970a59deaf..5ac51863a189 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1549,7 +1549,8 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
 	 * The given mode, adjusted for the perf clock factor, should not exceed
 	 * the max core clock rate
 	 */
-	if (dpu_kms->perf.max_core_clk_rate < adjusted_mode_clk * 1000)
+	if (!dpu_kms->catalog->caps->has_3d_merge &&
+	    dpu_kms->perf.max_core_clk_rate < adjusted_mode_clk * 1000)
 		return MODE_CLOCK_HIGH;
 
 	/*

---
base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63
change-id: 20250922-modeclk-fix-a870375d9960

Best regards,
--  
Jessica Zhang <jessica.zhang@oss.qualcomm.com>

