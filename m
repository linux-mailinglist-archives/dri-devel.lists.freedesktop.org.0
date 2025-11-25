Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B29C838C0
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 07:49:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF18010E34F;
	Tue, 25 Nov 2025 06:49:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FzGbr7hU";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A7RQIScH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3069B10E350
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 06:49:31 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AP2gepg1699020
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 06:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=OMLdFutodWp
 WHUQwzTx9cYTOE2PbYgwc5aWDG8hPTMs=; b=FzGbr7hUJh58BwhxTL7jr4/MvVM
 d1v9HaelRvizsBBOD6RCFrBjvkKiB8WonI0EVHh6WemqUaUV0yAorgKbP4SW+AKT
 GWsefpJiht89SYwlRQpefVTZdvHhqaI2e/0zVHVjH9sD1ybMOu1i3mUtn42Kjmpb
 0bwIuU0dm6sFWeNNEranwkPh4OpBYLiAes3QyDRaSpoAkXCc+mDutU+62l+Dn8kW
 Sv0Z2Ov17Bb49afLEwXfbuFqb4lFz96KkryiZRMTp7KHyhQqihIwG5s7wsSC7nti
 hkDpGxOlPhXXX0paxMbchyys735MatGGbMcdWGLjU7PgTCXIUI3wmA8ILbQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amp56b1c7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 06:49:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ee0193a239so50078121cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 22:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764053369; x=1764658169;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OMLdFutodWpWHUQwzTx9cYTOE2PbYgwc5aWDG8hPTMs=;
 b=A7RQIScHW70XNULmPad/kSFQIvOVY1uwvfqOwb0lNBc/bWfyYJHpGJjDQbkTIi5Yhn
 mnMVFrUBPuOp3MeKcbdNmGKsYUi+BCxIU2QUgdHzo6ecD3wOhNx6uLrlRXm4R1EJtLLl
 a01NafYPnAIQydkWplsvMY/g0QzQ7iyz5sNGxlF1qnLYEGnEcVjHbco4V29Z6W4KNXLs
 +TM+QXffHG6u2YBj9piAk52DMU1hb81eSEW5HexboXgvWKWAEw/y1ZJtNdphSl5Izwnt
 eU8odI4mDtc6ME1eE5ydZDhUu0noJw2zjM6orRIhsKUhSyfnFYERPr+gPILU4bt8QRov
 /vCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764053369; x=1764658169;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OMLdFutodWpWHUQwzTx9cYTOE2PbYgwc5aWDG8hPTMs=;
 b=bPeNNg89B0baFOin/3A9agD89rcxmDUOptW1RQmhrWKpoF0XlN8cEQk54ytKCukB5I
 lYmV1ce9PYG8GVQld1zvtgic4n/sfUM8M02FzjrXLZCuqYUOmE3me4BW/rP/kU5MhPoZ
 Z3xvw1xOJTlCdMFH3OLmdPMpZule/V2hvlQPXshFbb/EMR4j01HTXonyejSR+3BRSeKL
 7eHl6krbQC9A8qk/zl8V3k4SSBN6TnRB7RASAMsIPNyUDNDnjG4t/lef2UuJ7HoNcMtg
 oG892g0UfuBEzGYcHlVH7vjCytOsZ/Pf2fqRWQX7GPcQPXio3miHlLAiwrwWEaH7wqca
 Bxyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrjHhoDG5mkIdROJ3TwrYU9bEO3VikMj3AN6jgUb2ytczGQE58I7MQCb/QfL+L7Sti3yh9X/IisZg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyS0hc2BnJoaQCXbeNC1O1zXw8LB+DcFYo0V3vJbVwpm0f5Zf0k
 zcT9axQhAQvj8kkp1Ae3UFRDYaNoqn5W9Xk+KHNKJdIAJXGrb6hNpSxML4+qCcB2Pjnv0cwCW5m
 RRrOMetvJ6PCdYlTIvnxV8S3eimleN1jcuS+bJuPX5PXvZlW18wlvTx2WfKTtnQCHAhVCblo=
X-Gm-Gg: ASbGncs0scSDKP9bkLVwUeR6MEcBb2IMhQD3jMZKaDK7jxtZA+lw7MiYjbMQqyggqPJ
 qNaUPp68ZqphGJBGdh+fij/JrkETUMdDWOGuZ3Du/zVG3sqSXGX0b9f6Rmi6HpWn03uCGEozXiy
 EKoFa9R5ArFlQzCzslJKhET3DOEE5GpTnXTtRWIxnC6FAHBy2OPwqGxItlOEDls1V/8AaLDjbO3
 0LLKcfHQcOtOAAWLQDvn8jtJ+u20b7ejX7typ2J2o9Jvkm1YYvsy/fKViLWHzMBflsgr6Dwnysf
 uXmikBLoVFW1OLCfrJhSXy/VrT/IgyZ0RRNML+4DzF/kXQFgFaJ3eWsxzxU1YCIzlEf8VcCtzie
 9tXSKlftdi0f9h8UcN+8tVHMwjCoe21NfW+8cj91B3mkl9Su73S0lsLtI+jhHz/95THNPwyw=
X-Received: by 2002:a05:622a:1b8e:b0:4e8:83b8:9e7f with SMTP id
 d75a77b69052e-4efbd8ca5d9mr22384101cf.14.1764053369629; 
 Mon, 24 Nov 2025 22:49:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHiWneXixXB3xjrJUwkHgPebGASZPAo0VwGDiJADDtvYnesA26C81fRxH8HLYpaCJG40TQhxg==
X-Received: by 2002:a05:622a:1b8e:b0:4e8:83b8:9e7f with SMTP id
 d75a77b69052e-4efbd8ca5d9mr22383761cf.14.1764053369213; 
 Mon, 24 Nov 2025 22:49:29 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ee48e3edb9sm100645971cf.22.2025.11.24.22.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 22:49:28 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 yuanjie.yang@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 07/10] drm/msm/dsi: Add support for Kaanapali
Date: Tue, 25 Nov 2025 14:47:55 +0800
Message-Id: <20251125064758.7207-8-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
References: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DfhQOc2VKKNk8FQFv90jqIwn9QGKcFtZ
X-Proofpoint-ORIG-GUID: DfhQOc2VKKNk8FQFv90jqIwn9QGKcFtZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA1NCBTYWx0ZWRfX9dZ6liWTYzID
 fVt6ykOAHjnz41Fw2JcPGt6KF8poiKeghSypn7pgxyjEMvN+5Fgquc7F46IwMIH320C/3kCv0FT
 ZsImjXJEdfmJikboOoSz4TBmbigOzWWjGstV4U1rZiTG/hEe+wOhGe1K2+v6mWxL6PCk/JU5W24
 6/q6Z1oEyZ2pMqeIUeXtiT13NMfljAV4jkEZjDnDemWzjxAunZaek9omrYudEBqpJIbsX3adhEl
 5WPzcZuvZZGqgNTMkp8YKRsAX+ffZo5oC/7K9t0Usr13/PeBbAdgsdyfs43mCgWRqX85i5mG5Xw
 wuLlE0ydF9aj6T5707cUoCf6nwX5Z1zMrBYqb088OdtT8Niav033DDWwx40lA+1ehOyFUpN9EJL
 cb2F4wxLY8cZJXYJz51tfKO6a5COag==
X-Authority-Analysis: v=2.4 cv=dPWrWeZb c=1 sm=1 tr=0 ts=6925517a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=EGddA7oXPexY6v9tJfMA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250054
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

Add DSI Controller version 2.10.0 support for DSI on Qualcomm
Kaanapali SoC.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 13 +++++++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h |  1 +
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index fed8e9b67011..bd3c51c350e7 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -205,6 +205,17 @@ static const struct msm_dsi_config sm8650_dsi_cfg = {
 	},
 };
 
+static const struct msm_dsi_config kaanapali_dsi_cfg = {
+	.io_offset = DSI_6G_REG_SHIFT,
+	.regulator_data = sm8650_dsi_regulators,
+	.num_regulators = ARRAY_SIZE(sm8650_dsi_regulators),
+	.bus_clk_names = dsi_v2_4_clk_names,
+	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
+	.io_start = {
+		{ 0x9ac0000, 0x9ac3000 },
+	},
+};
+
 static const struct regulator_bulk_data sc7280_dsi_regulators[] = {
 	{ .supply = "vdda", .init_load_uA = 8350 },	/* 1.2 V */
 	{ .supply = "refgen" },
@@ -332,6 +343,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 		&sm8650_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_9_0,
 		&sm8650_dsi_cfg, &msm_dsi_6g_v2_9_host_ops},
+	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_10_0,
+		&kaanapali_dsi_cfg, &msm_dsi_6g_v2_9_host_ops},
 };
 
 const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index 38f303f2ed04..5dc812028bd5 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -32,6 +32,7 @@
 #define MSM_DSI_6G_VER_MINOR_V2_7_0	0x20070000
 #define MSM_DSI_6G_VER_MINOR_V2_8_0	0x20080000
 #define MSM_DSI_6G_VER_MINOR_V2_9_0	0x20090000
+#define MSM_DSI_6G_VER_MINOR_V2_10_0	0x200a0000
 
 #define MSM_DSI_V2_VER_MINOR_8064	0x0
 
-- 
2.34.1

