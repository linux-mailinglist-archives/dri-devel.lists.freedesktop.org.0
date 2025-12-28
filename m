Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE2CCE488A
	for <lists+dri-devel@lfdr.de>; Sun, 28 Dec 2025 04:24:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB84E10FB04;
	Sun, 28 Dec 2025 03:24:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LxwRHhAb";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N3Rd0Hs5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB7210F121
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 03:24:13 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BS3FbcM1610611
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 03:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1uGVNstsP/UQQcLwdrzkGVSuVG5G5/ESRhIQYzvPwck=; b=LxwRHhAbR7kpNG1k
 oms2nloI0pLtwFoQaJmmTFjvFi92tWj8FUVYjz1W+W3NtwXo19okA7TySOiw0ht9
 xnpAnoeDIEzUv5rVFqrjg2jw1DkO61hqCa8hvExHqvnpEntFpCKkdMQaF3nTSGp1
 3BSwtU0w/xiSSCZofFTW3/eQW7hqZeb+QK/eDGZbCmbCav8D63Eu3KiR810jGSHn
 Kznsn3ddn8k4OijP3hvtYvXG/pK3YwSHJcax4mMHHv6vNPRhX+vZFwjByPzBfiWk
 ePcYWAuic3vIkXCJsj1nT6EmPw/ohvDyT8Qt2EAfPEZXOeNC0Ba+GpCz3FF8P5Re
 Wd5AyQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba6dr1qbr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 03:24:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ee04f4c632so159199461cf.3
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 19:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766892252; x=1767497052;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1uGVNstsP/UQQcLwdrzkGVSuVG5G5/ESRhIQYzvPwck=;
 b=N3Rd0Hs5hAC0eBH19BLmhz3tmcUYC75UTbMrQtKBQCH7ilw4TTYpRF90qskfy/7kCI
 T1uog652tz1cNppl9gM1Xnu/kVW4vGeGwvtOh+W7NlNF+MagOFHMq7WU5XfoDqcwbkF5
 pA7lT8u8sLUeRimmII3oAxq6p7axZQRLWJtJYEguYFxlYS47qVnSTaWdLpRfvfZHpNCa
 CVJUA3YRaj1wHR84YoEFgQpu2AcQGBniwaeItblhQkaSlUjcjAKRKfREWi6dlDrFy2R4
 acZkII6xd/9L5QT36aNrqsRs59nnLxdxXZmHO5YTd1QnzCpSpf888mymdb4xXVKvCKHh
 2bJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766892252; x=1767497052;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1uGVNstsP/UQQcLwdrzkGVSuVG5G5/ESRhIQYzvPwck=;
 b=LJQosKAAQZjkgVoEke6tHiBWVkjtEkp6+hmM3stKY+FoZ1MeSTvtz+N5PcaGste7f7
 Zpicx7hcX7QE6El30ph/tZk171BkcD3J4ScIUIvGmBYCsiPdL7VZ74pjWBMy0wfbTMqA
 3hQ0ci7rgWwZD64+c06oA3i8SR39Pe4StsfyYBHAOb+fcY3LizAZ7LCO5GHLH88+t23c
 NlJ5OXDmeADyC5gP+DxF8dwvDv6Q9QeYHUyDQrZ8C/+qXlaLsZ3T/7Osd7hZwyyLPBvq
 CjP9TlxePMPbxjuN8y2nSSNfS8A9QeVrg5+xJRvJ3b6OdO1CuHfEDaeHBtDsgkWvVqbc
 br8w==
X-Gm-Message-State: AOJu0YyDg6U2N3qYBLudu2CoZMl8f7Ai9xnEMpKOQOGjFP6pfX9VuBj8
 KtALDI0XqkJGQue6tkPHIbYU3+fFc5ZF+RxZHVVhhNOBNJL5MEQr1fwFxhPZUZuON5+Y+cyYQev
 3CdkMON/ZKLbdFoPuAFpR+nPycQR4XxDSSvLtT46sx8WEiNHKIPC61xnH1bRHMid+jtBVERc=
X-Gm-Gg: AY/fxX4aQ7PUWY/vmxIowt+NYDzsjyGoak5iggt/VxtrxPD4YC54tspRdo0HiUPlHkN
 igNDhVf1KTz9MubcCk9r31UClw5Fe2lkVJCM/f4tKLo9pEq3Z2ALPcneMsvMT0wc6eO3aqp/33y
 Mt1B93vyHcgj6fqpugDxTRMb+ejhhUeeVZLEVs+LZw5O1/CF8fz8Rg4AIhM8/S25uCVJcoW9xRK
 ZMHSaRoyVIMdgEIAb74PtdeHzzfIn8I+VCt5FrTA//FWfm6th5UCFjizBRjpnjbtxPHE1SRezeq
 oavFyRS3fVEiFW/1LQPgesffaN2iCZr9RDsMttqAf+xgsejuRWjsVIjLOhISurTSLGw+RD38gDq
 +Avk19gFPFMBd4wu6Ofk69PTwrDZTA0J7fCgChP31/QHaXFetRcaO9LvHU5KTr1zhJUzVkyM/0e
 KDkCXPxGoCVVKwPwBA9T9l3zk=
X-Received: by 2002:a05:622a:52:b0:4ee:2154:8032 with SMTP id
 d75a77b69052e-4f4abccfbf9mr411437631cf.6.1766892251880; 
 Sat, 27 Dec 2025 19:24:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHym4jtd6iruY/LtoXO0zkBjy8zwwzIIzsS7J759AFgV3YE7d2JZ9pTxvrevNx5At1xnVelTQ==
X-Received: by 2002:a05:622a:52:b0:4ee:2154:8032 with SMTP id
 d75a77b69052e-4f4abccfbf9mr411437541cf.6.1766892251396; 
 Sat, 27 Dec 2025 19:24:11 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3812262b36dsm72149561fa.30.2025.12.27.19.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 19:24:09 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 05:24:05 +0200
Subject: [PATCH v2 1/3] drm/mode_object: add
 drm_object_immutable_property_get_value()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-drm-fix-lut-checks-v2-1-50f5d1a260a7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2687;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=OHanLuFuc76947yU3WzGXKL8IflDYvhJa4SYngSj/Nw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpUKLWCqbtmVXnOVqIZM81gDqoe2k/c0O8gLZ0n
 bForL4+rpKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVCi1gAKCRCLPIo+Aiko
 1WTWB/981hNSUmln3Zng5VlQNM/WADygi9G5h+qTQET3GiZ+0xse3xCVH5B6wPb3tfWauiTsB1V
 1SY4OuuxrNu0qppPny8lc0OTl5FmYweB8YbelQeVDQvgZInG4KZiyZcPVJ/lS3jS3rOzOfNwdq8
 P/nKrWj56IWQ0hPTuBLCD+DRs33SgtkYHVz0cMgJ607UzUskSmYpnCcIEibsUMFM8LAsv3lWcRc
 sRoMMjTeLtDhGQj85wzbvKGy9MUlty1R/B0wqUu3om5EW0HUp3fGdjCmqNHlOn41ATNSumjuAMj
 1VJEsf9NVOmftK2w6E3K323j39kVG3EWuoESf3hEp6CSOJP6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDAyOCBTYWx0ZWRfX+/IjmG5RpVxS
 QWBraZRs+dORKduU97ZNL8nIyrxehSQVylHnc031QczRxxhP/y66ZQ8zqjop1etg3ZZTIqqV6jY
 ncMT+oibdSZspr7J2RN9m2GOmtEBdAmpNnlSb5xggJiqAtuFp4sSuNr+6qlsnLtZnh+o/zBYzW6
 jamZW9KyxkdHZ4MK/l80OFQagqfABB7dCa2QR55iw500SzqipkuENG8mkl9fZxo0uvYDNfsnV0U
 ueoqg0pIrRDo8jH6+Odey95ANWz8C+E+d0MG5y6+Il4rNEUICVpc+WBAypsp6O1DI9IiEcxM0ta
 0XMkXzc9ZwzaAXB1c774vhQmTZVQqBqm4xrSnqP4ZofhlSqhLoZICEhIonHsL9/fNTv4NuI2NkB
 Th0QTH0nOf5ZxqEqjBE+4/dOsel52yBrL+btKq5OjVZ3LnVDvNqXwONYOAqFFJD2B71pEhJ+LVi
 Vtr4CHrHK0a/zK7GW9g==
X-Authority-Analysis: v=2.4 cv=VdP6/Vp9 c=1 sm=1 tr=0 ts=6950a2dc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=uUhA93nX2LN1thLMeo8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 9Wh6K9LeJNMOuZnv7hq6TjmF6dquHxBj
X-Proofpoint-ORIG-GUID: 9Wh6K9LeJNMOuZnv7hq6TjmF6dquHxBj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 priorityscore=1501
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

We have a helper to get property values for non-atomic drivers and
another one default property values for atomic drivers. In some cases we
need the ability to get value of immutable property, no matter what kind
of driver it is. Implement new property-related helper,
drm_object_immutable_property_get_value(), which lets the caller to get
the value of the immutable property.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_mode_object.c | 25 +++++++++++++++++++++++++
 include/drm/drm_mode_object.h     |  3 +++
 2 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
index b45d501b10c8..2d943a610b88 100644
--- a/drivers/gpu/drm/drm_mode_object.c
+++ b/drivers/gpu/drm/drm_mode_object.c
@@ -385,6 +385,31 @@ int drm_object_property_get_default_value(struct drm_mode_object *obj,
 }
 EXPORT_SYMBOL(drm_object_property_get_default_value);
 
+/**
+ * drm_object_immutable_property_get_value - retrieve the value of a property
+ * @obj: drm mode object to get property value from
+ * @property: property to retrieve
+ * @val: storage for the property value
+ *
+ * This function retrieves the software state of the given immutable property
+ * for the given mode object.
+ *
+ * This function can be called by both atomic and non-atomic drivers.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drm_object_immutable_property_get_value(struct drm_mode_object *obj,
+					    struct drm_property *property,
+					    uint64_t *val)
+{
+	if (drm_WARN_ON(property->dev, !(property->flags & DRM_MODE_PROP_IMMUTABLE)))
+		return -EINVAL;
+
+	return __drm_object_property_get_prop_value(obj, property, val);
+}
+EXPORT_SYMBOL(drm_object_immutable_property_get_value);
+
 /* helper for getconnector and getproperties ioctls */
 int drm_mode_object_get_properties(struct drm_mode_object *obj, bool atomic,
 				   bool plane_color_pipeline,
diff --git a/include/drm/drm_mode_object.h b/include/drm/drm_mode_object.h
index c68edbd126d0..44a0d6f8d01f 100644
--- a/include/drm/drm_mode_object.h
+++ b/include/drm/drm_mode_object.h
@@ -133,6 +133,9 @@ int drm_object_property_get_value(struct drm_mode_object *obj,
 int drm_object_property_get_default_value(struct drm_mode_object *obj,
 					  struct drm_property *property,
 					  uint64_t *val);
+int drm_object_immutable_property_get_value(struct drm_mode_object *obj,
+					    struct drm_property *property,
+					    uint64_t *val);
 
 void drm_object_attach_property(struct drm_mode_object *obj,
 				struct drm_property *property,

-- 
2.47.3

