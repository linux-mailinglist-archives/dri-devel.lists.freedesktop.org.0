Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE41BFFC6D
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 10:07:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2980E10E8C7;
	Thu, 23 Oct 2025 08:07:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dRJs/DMe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A638910E8C8
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 08:07:16 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6UGna018586
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 08:07:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=KgSVmbG0CXT
 s53n44YyJiTznjurS7MAlfi9QKa58wbE=; b=dRJs/DMe/B2FAT5FnYpZzC1r7CV
 aN0SffoHW5d32GcH4bIL/wb3J87BwN4UA50SLQR4H952UwreSlK6qgScQtXem4Ln
 yWWb3q/jRqVjmdUTTX1ecYy8u7AdW6sOxGt5JD60mYxC/acZTlFIr7mcLIdyCnPf
 sU5oy4jvBxDPPthLj5CtKdbHifxsRXxB9IsW3sXU7nRRuLXQLKRFB2HAAV+Qgss3
 YOSWWxjkSmj49jTSf9bmQRyXChS93sk7m6739DnFn0ylZnOXvpIRQSmvxCMlHccW
 WE61PieIatYguwZjLwJwdUzSvOeCMWET40SCpNcwKdQxlcClju6f8I8gk7w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pqsnw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 08:07:15 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-78105c10afdso509836b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 01:07:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761206834; x=1761811634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KgSVmbG0CXTs53n44YyJiTznjurS7MAlfi9QKa58wbE=;
 b=xF9Tmo5m6wH6ZNF9DrMOIXBKDeeUnpmG6u9ZfqsNalaa0B2b1tDROlMsk+2UXRqHNm
 ptHHHzEJLeK61kqpB6osedwVSmYssfQB59S3Zwvt3ChTaJSQ6H4vwOt1o6HBIw1R5bmm
 T3io/QWnw3wFxtzmU35gstf7iHkKu79yvZsDGMEZqWy9pmsaCuagiRPvnp2k0ZhM6CO6
 C9Ph5P/zze8jTsStWIOx6Mqip7qKA2IPcdawCAG140KWFoETGIDYnXshZv7rog2hjAGk
 IunZWw1gx/U1Z/dbzy+mn/Dvs+g5qY95S/M0A9tqBXk9OEPgLV6JeEouvq2F3GhTKDZS
 pqkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSxNHDD8y9q3tkSmtA+Vgyi206cIYA/DhCyNaAKeXnNaMnS8O0kx6/7ce/1vUi0yuJ57MBChC/MQo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeMSUBBjA7Nbv7GPDLD/fdK/6WDYAT19WN25wSDAQyTdw+KvIN
 YWh6o8+3+sjAqn+TUrtpSsLR4mWMrtgP2GRTjKWAPdJdszQV/TZDb2x6D6Dtv3dJRDzQ3hrEhMD
 8Sgm5dZSayguh/HiumYrzqud9KUXJoZciGbKtwUrJ/D+gqaQNm6amZmv6F866GQpdzqGRwNw=
X-Gm-Gg: ASbGncv0Wkwn5Qqe1UboG0C5ODla2YLKFX1QlVpHVujm0VUqDq7Ey7nrqscDgcsB56Z
 D/lqX/74WhilkapNZUT+QYyXuVYzhdC8aNy+K7fOy6tyrLJD6Ol9hIrbFJhLojfCU9ZXTZX0aaS
 2REsMiGOu/HLfjPq8TdHXowbBZr6V/PE7yjHfCAeZDcudtzJXwdGcbiiMH4rHK4MRCjJ/MyCZD4
 /jzHKN1g44cxSPfGse7qvY1G1YViiemHmMwtHE6xKQ8DoojtHAKqH8sE5MdBm5D2ZEihlOyjyOx
 HG+r12jr2KF7UhaZC6i7yQcSCkjbRk2+jIwScHknDa9DLahtJsj+A75zc8jCzXQUEc6eTnl7KwZ
 i6jXdewGkNcFqqO0rcZJ7c3UVfwkHyy6tjSJ3Pll5g/7rBRCnmg==
X-Received: by 2002:a05:6a00:2182:b0:781:1e08:4459 with SMTP id
 d2e1a72fcca58-7a220ab550bmr33261076b3a.18.1761206834381; 
 Thu, 23 Oct 2025 01:07:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQU6DsEGqLwTWykfWX9a0n5WaLRPXfiL2M9UpRfxSjYlgMKuoDnFRY1LaCZvZ8nIr2wQVy2w==
X-Received: by 2002:a05:6a00:2182:b0:781:1e08:4459 with SMTP id
 d2e1a72fcca58-7a220ab550bmr33261043b3a.18.1761206833922; 
 Thu, 23 Oct 2025 01:07:13 -0700 (PDT)
Received: from yuanjiey.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a274a9cec5sm1676410b3a.20.2025.10.23.01.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 01:07:13 -0700 (PDT)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH 07/12] drm/panel: Set sufficient voltage for panel nt37801
Date: Thu, 23 Oct 2025 16:06:04 +0800
Message-Id: <20251023080609.1212-2-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX6RiWKAZZAvAQ
 /9YTtxa7DRL/M3dQpGB64uvpHk7jXB2erxm5YrKT6bHKU/Yrl6Tkq0mrr6T+kckaYs+iR4ryvA2
 R73OG/jHxWnCjhG0jHGBuCDn3E25tZzQLvs41HUH7Rrr8gNVxyeLepKCmp+ujVkhvflHWEbQLDM
 xlse91gajU70ICYzNRi40Y/JVXIvW1pBsd1xLj9SlzYatsrkJBvc6mopGqRc4d4XGH9FqnFQuao
 SqTg0HECZbm8SHS9YHtToSjcoVSkV38B7Gjz8hDzF14cBsI+h0plfRH65Y0/BOmUk4gHDeowkHo
 +7AH0XLmmgyucyaUn9bkUmpU2jDHFI7PX8TNKzJujdk13ibBxRwpmUEXs7UkA54BHf/v58wSWsF
 bULI871AaVYALDxEB5/XDnkQP9lazA==
X-Proofpoint-GUID: KdcCD-dFlPQabgqOeUY17PHJoJnBa0cm
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f9e233 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=L7xdKIvrZdzy1bmArRUA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: KdcCD-dFlPQabgqOeUY17PHJoJnBa0cm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000
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

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-novatek-nt37801.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37801.c b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
index d6a37d7e0cc6..7eda16e0c1f9 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt37801.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
@@ -267,6 +267,11 @@ static int novatek_nt37801_probe(struct mipi_dsi_device *dsi)
 	if (ret < 0)
 		return ret;
 
+	ret = regulator_set_voltage(ctx->supplies[0].consumer,
+				    1650000, 1950000);
+	if (ret < 0)
+		return ret;
+
 	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(ctx->reset_gpio))
 		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
-- 
2.34.1

