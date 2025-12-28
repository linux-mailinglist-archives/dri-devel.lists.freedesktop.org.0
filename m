Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6F0CE4896
	for <lists+dri-devel@lfdr.de>; Sun, 28 Dec 2025 04:24:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692F211A704;
	Sun, 28 Dec 2025 03:24:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="k4UPUn6v";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FruSLLQi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A02211A6AE
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 03:24:18 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BS2wnSi3244954
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 03:24:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3dHmK4Z0mEQYvLqijWN5ssYQ9ShWJJdkoUufTuuHqek=; b=k4UPUn6vP9bcXK1f
 rcaBMSgGNPCbld4EE5oJ23m4QoB8mb8LRWVjzK4q1vCegA/YAre4Zl5fY1RJUrJB
 /QAHePqkVrXSfLHt1CTCzZaHhfzVLuXMnQJmnVU5T466J54c/ULibA/mXau7uxUn
 V72OIEMHiwpTucSCdfdJUEy0JRmmzw6QEP/UBjYcwMQnyX8xcJFj/cHCh3nhw0e7
 FnmNWFZIedaoHs9lWcAJjTYKlS+vHH1W7IytwF0dgWyoQm6PXF6btMafZNbyAe8W
 rH4QXyeAZ/3OIbZYk2terhg9y04u/ajFblp16GAuOyhY+lGVKAW9PDWzKGGiwdUi
 fMSUag==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba8mf1hpx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 03:24:17 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-88a360b8096so213464516d6.0
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 19:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766892256; x=1767497056;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3dHmK4Z0mEQYvLqijWN5ssYQ9ShWJJdkoUufTuuHqek=;
 b=FruSLLQioXtBbDS2DqgvtP7DA719Yf99lb3dYbQ/OpkM9fvwOymFwyLvEKxYEPiKm1
 ZsKgQoFtV9OQbw16f2j6FOeZb7hyFrK99pC2NnKm5M+Vw9WUFcwDQqmBz5wokbDe9yKF
 rzjYh8b7r8eQxTPIoPqThnZrKDD9NV9b3nNIZgc6lBElJdlkTEytl8gfVY3X6vUy9LFK
 8R9XaG2ZBwRgMGTwVyL4EpWA+5fHoe0UEgBlrdtt5FS9UdEr2O7yof90FO59jCNAUL5z
 Q3OQDX8gfcfStdna8ZYz81c4xSNTTggJmJw95HAg/6HEVK6JeHpDEPvHZAY29W5w7qs0
 GSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766892256; x=1767497056;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3dHmK4Z0mEQYvLqijWN5ssYQ9ShWJJdkoUufTuuHqek=;
 b=k9ADljUfgbfXST7mljFErXhudUQrJpixexnHvXwc2ezk6JFH1uToa3weCHNssjXEuU
 Pt+1DZPgf4B1aaPiyYAxbxm7JQy2wPuCstedGkZvpNwc8P39x+09OVKfdsVT1DoKtE5Q
 +PyDkQf6+8aM6BPvgsiN4wRWihQpSL/uuJP2p/KRloJIk1w1/5XyxJKR4S0oWwGPWWkn
 NQhjlsP/G7byJgNI24KeWh/juXNq9zC/y30bxUHqA5FCbniOTZjeIAJgGjMaxoaaRPKi
 iS5Qex/QVf6NfVx5SNJ2LiDKD0Z7HwIpC59uE3smL6xCC02P8D0mZC9j+8E5cQVsVHSw
 H6rw==
X-Gm-Message-State: AOJu0YxhbvHfXAm9Yue/mBvL0mxL0Wv3UznD0ccDnHclOWVDkUf3w77+
 AdOQjR050ORabf9eV1APkz+RjJpHAhD+CRuagmW4yy918rLgPQ1WC4WjibPeMQtzSa4AYpURZ2A
 nHRA/+P9iXloYDzaBRdN2amKpp4Y8cGHkIXK+SyjyZfQcmEMgIoV/ZghPMOZM39ZmLBIKTuI=
X-Gm-Gg: AY/fxX4MVfMpuF1YX3e9cztwfA85+H4TYXYL05qnShg1hnaUVS3aCHCZJ+KA3odk12G
 g1Ppr9zXT9t3S/PDOWamKG3hsDah1oadgO9bgRwTrrgoSjgYs+aBlIs4BDwZ/hW8u2ZOOgFTM1R
 MffoUvD1nZTwwfF3SPkUXIW76XOI5/YhAkyf421/GRwGEvXqpn5FKbslLX1URI434TUuYW4QSOd
 o9XmzjIpqaLyhhTJQXR3THPrLgwyIj+PTcCSZvd0fK/IEtTNLc6veq46nV+qTroXK1rNYq0bhrx
 glsHevqh02oHdAljDqycgBh4dYvStkHUXULkFn7DVWPHJis1ZbNHLi/X3t0RT0R1a4vDq5NnHoe
 KvrKZrMg0oktVbZrbQqZxV+f8xbueusRJWao2e8Wc5r3n5PFwSYuE2J8wTP6VvY4l3umNc98/4U
 RQv7DsmjRDFEflUehxu7NdGxQ=
X-Received: by 2002:a05:622a:909:b0:4ee:1875:42fa with SMTP id
 d75a77b69052e-4f4abcd09f4mr411834071cf.1.1766892256460; 
 Sat, 27 Dec 2025 19:24:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7rnFmsC4exAxvQSHpB1xuuZUBoYW9vqYfhHAhmTqGWdfrHTe27lOp4ru7Isb9AMlvq7RjTg==
X-Received: by 2002:a05:622a:909:b0:4ee:1875:42fa with SMTP id
 d75a77b69052e-4f4abcd09f4mr411833851cf.1.1766892256029; 
 Sat, 27 Dec 2025 19:24:16 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3812262b36dsm72149561fa.30.2025.12.27.19.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 19:24:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 05:24:07 +0200
Subject: [PATCH v2 3/3] drm/atomic: verify that gamma/degamma LUTs are not
 too big
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-drm-fix-lut-checks-v2-3-50f5d1a260a7@oss.qualcomm.com>
References: <20251228-drm-fix-lut-checks-v2-0-50f5d1a260a7@oss.qualcomm.com>
In-Reply-To: <20251228-drm-fix-lut-checks-v2-0-50f5d1a260a7@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2119;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=MShYdDKdFUHcrHqdYR2kRbGAF0dVfrFIaZJcWDlIW7g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpUKLWgTT7o1EDCbJr87OcCnHW+Vd1tXrMXtG8i
 AXrXELA0PWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVCi1gAKCRCLPIo+Aiko
 1fCHB/49Xr2ORljZCm1hynreogxCv1NqbFHUtI1Iw14YGFMA1Z9EXjf1SXSZlHQ8Sag/qifTS+X
 avKm3KjwjQGIhqZ+8UGs4RiS3x2hg6lrDzqqOnX9RfH1i0YYvw7WKMyopKqw9b/y7EKQjg9JI2w
 ToNRi9PgLT6R0RbpDg/0jeSBtcKTD0L9f2/c3qs7yEwWyAOubY4ue9HR5drfOkvSaWUygIEvl15
 0Pt0MTj1iJHefu8vS41zFO1I741K456L5hxZhLzcn/fSDbB79eye6ji/QI4a2OwyZeugDnYjSxG
 4xbbM431/e2jm0juvpdiipkpq/AlbY85tqyumRP32Egepcyy
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: MauENrhrYDGbW_hgQwZPwFlI4d_tuBLj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDAyOCBTYWx0ZWRfXwpziva7AgyAM
 gDfXSnkLufKFAuqI0v9DweTEX5cQGggZfD8hCtn8/Sg958PEoMPEO5rxe7Wbsgr+xQTpsT7zYOw
 AGQpLsnTsDJt5EUJXGfkD2t9osYh5m26bL6e8It3qMXzPnJymngOUkNSPTNTE5CtjUNHzyMv03D
 wmADFFGoqFeZDu0NYbZMNVQ6jXHjFUI1HC8uk7b1wtRzBMrEAQZ2m6jF94OV67oX4I0ABwZ6Wfp
 cm8+vQmXRL0gBqI8nXJ+MKcza1IZvn1t3nj37IEYmnCdCJQ/xGH/bzbn2ufbsdy0ftvMZEfk3F1
 wu+iUamdN/h9wP581S5NHujB/iSjQAw0MK07gqy2B+UcQn2k7gwIR7TAKlNg2lCPsdgT3Ft6EFu
 VSUtskJwDArjaQ302wtNEFBkm9twTy+dIjqNAtbgynYT96MEcOcYltBe8Ihe8/ZoC8XeSX7XUzR
 xCuLh1c/1lO2B9HQwhg==
X-Authority-Analysis: v=2.4 cv=XuX3+FF9 c=1 sm=1 tr=0 ts=6950a2e1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ZkoTrUv0hqWFqrPu6skA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: MauENrhrYDGbW_hgQwZPwFlI4d_tuBLj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280028
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

The kernel specifies LUT table sizes in a separate property, however it
doesn't enforce it as a maximum. Some drivers implement max suze check
on their own in the atomic_check path. Other drivers simply ignore the
issue. Perform LUT size validation in the generic place.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index dff1fdefcbeb..8489823a9773 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -413,10 +413,19 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 	} else if (property == config->prop_vrr_enabled) {
 		state->vrr_enabled = val;
 	} else if (property == config->degamma_lut_property) {
+		const elem_size = sizeof(struct drm_color_lut);
+		u64 lut_size;
+
+		ret = drm_object_immutable_property_get_value(&crtc->base,
+							      config->degamma_lut_size_property,
+							      &lut_size);
+		if (ret)
+			return ret;
+
 		ret = drm_property_replace_blob_from_id(dev,
 					&state->degamma_lut,
 					val,
-					-1, -1, sizeof(struct drm_color_lut),
+					elem_size * lut_size, -1, elem_size,
 					&replaced);
 		state->color_mgmt_changed |= replaced;
 		return ret;
@@ -429,10 +438,19 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 		state->color_mgmt_changed |= replaced;
 		return ret;
 	} else if (property == config->gamma_lut_property) {
+		const elem_size = sizeof(struct drm_color_lut);
+		u64 lut_size;
+
+		ret = drm_object_immutable_property_get_value(&crtc->base,
+							      config->gamma_lut_size_property,
+							      &lut_size);
+		if (ret)
+			return ret;
+
 		ret = drm_property_replace_blob_from_id(dev,
 					&state->gamma_lut,
 					val,
-					-1, -1, sizeof(struct drm_color_lut),
+					elem_size * lut_size, -1, elem_size,
 					&replaced);
 		state->color_mgmt_changed |= replaced;
 		return ret;

-- 
2.47.3

