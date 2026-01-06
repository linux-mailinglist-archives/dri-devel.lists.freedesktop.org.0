Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B12CF6900
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 04:10:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C0E10E132;
	Tue,  6 Jan 2026 03:10:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ONFjEibD";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N+94uW9c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F6410E132
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 03:10:01 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6060o4d5204518
 for <dri-devel@lists.freedesktop.org>; Tue, 6 Jan 2026 03:10:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1uGVNstsP/UQQcLwdrzkGVSuVG5G5/ESRhIQYzvPwck=; b=ONFjEibD5yK5fUZy
 O5ag6J+2m/+8CBwmtvt4LSZU9L5KntQcAK5CVDHinePnOYXiYO2YS3lrETDyHRnA
 E1olvjB6uj87vvQDLg9RylNdvo2dcVM+Mqvr4PiH324NOVtV7oUU8EHa9UHq/0Kh
 cKGupaPsGx0P+AjPLbvFZpuLffSuSXr/yPCLQUWfRc14/pSZBMFu5xCkgH41F1vU
 ts2nh+n7RlzxlxJ9Lgnb3RS5Ve++IFvyY07EAcEoO8o5W+tW2clCGHzwwtqni9hk
 3h9ct+ernGUnS++aewPRtYZjEL0VrZVthuoxqZL5jpVYI7iUfznjgcICgICzU154
 2uRy+A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bggqu1jy4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 03:10:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4f4ab58098eso14562871cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 19:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767669000; x=1768273800;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1uGVNstsP/UQQcLwdrzkGVSuVG5G5/ESRhIQYzvPwck=;
 b=N+94uW9c9WZhkRibvGEhJx1wctimZP7h9R/UkHIQy4BbWVpd7bvXXT5hrSpHuXxXvi
 NMu618PucHw95HgH4CN/arrFd15GTdsF5viWVUmS+yOFFkYtXxm20f2K1umonKCTViNN
 pZv2wjOyvu0/O4xokMViyeQY3MJpWwNZOH6G0kRh3bjFtzM/Px6Ijc+px4IJOmBYnDf+
 Iuh9E0QfRxqkyoGEWGMB/CebrsOxWJhO2e8MhJ2aXYfKm8Utmr5rn/NDtE4LdsyVI2vi
 tXw59MgPrrSvNoN9qpz5NCqGCsg5W1WUqB4fYIXWj/FXXzmZpmMrZbyj/ojJrv4rCjWD
 9Bjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767669000; x=1768273800;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1uGVNstsP/UQQcLwdrzkGVSuVG5G5/ESRhIQYzvPwck=;
 b=pBO6eAZQCoVGjbTQjq+BkpA9Fmf2/XGIn02l8MQKj6az42CwhxsHxZB9sVPkmQYoPW
 K2xu6GXbOntDzLUlHD86Jky5oAQgABDi6Shu8CS1f76GZ8qa83GFpRLJxiq/zB+Ilb38
 zRQa4A1m63hrkUsh9pSH6udHq8+9W0VjZDmcUo15UY6/e/6fRtgR3KmfnpBu+Sc27y6r
 rcald2oJ3TIoubYOaBldmg3u/8W9e0u8FquYg8aQ/5E1r5QKRuLhG5QeqUMo/zYrQ6bJ
 F8OeEqMriCMf2uigwxNd6B4YBsduFtYBIbh6AJHnceG4AKg6WEuwd4gyNfkDRGAnLbGJ
 xeOA==
X-Gm-Message-State: AOJu0YwRQ3v9DhGyZWUayjI8v+gBrd4Qu/qcbNDaLatywgGl3krUL98c
 5c6MZ+Fdo2W+B5VYdsnfE5OAKfDcpVjNE6TPYJYhWCzUqscDip8swMTqiRw5Z8hTYslQ2FKa7eX
 s7AOUhxbJ9dYh3U4rwjNp058MQDQcIE0gu5KH9ng0ZY7k9Mn8Q0FhwubC8adLFSysBFeFJ+A=
X-Gm-Gg: AY/fxX5xZSIyucftkhL1jB+VorpXHL83V/uz3ApQM1YPCUfxHXbFtr+serdRxdryM9H
 zO5Jpc8ZdxsHZlggckpadpL2Ab54BhaNVmr0shs2eJKdjFtlRSn7xCXesfX/WV5m+YwWUBSuBx5
 dBVJplSe9LE9LqTXutWdPCx4H2ozfDQMp9QvBoSQqrIhDSCWE00SpE+OHM9oD9ADNspgOucNrUm
 vwGfdeLP/nPfwlZ+uFVCXTfxS5dzmpJle8F2HkgQ9DYC0nhOZxOe89M3gkabAaCIxgjJYcPMA8D
 5jRARbMRbLqL0MUldPSr0hJ0kusVqXCvMkech5uvHxIGG83bHzzuzFsLJZKa8U1m6dAchWDhS9/
 a+UjK/nlmSlDME9dF6mGlx6XUVCMURfKr26gLy8MtsJi2E+TOvxSHLgXtU5OAIA1eOs3KpJmLwV
 iL8QVbVykbZv96ohkixpgtE3U=
X-Received: by 2002:a05:622a:5c98:b0:4ee:15af:b938 with SMTP id
 d75a77b69052e-4ffa7819d0cmr23555521cf.70.1767668999916; 
 Mon, 05 Jan 2026 19:09:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6gVe9gCbUT6aZzLT7RdSvNX2QeKy9mu54pHXwxlm6rpJqOM6kkyLcNKbwzAr7F+zpdY6IDQ==
X-Received: by 2002:a05:622a:5c98:b0:4ee:15af:b938 with SMTP id
 d75a77b69052e-4ffa7819d0cmr23555291cf.70.1767668999498; 
 Mon, 05 Jan 2026 19:09:59 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65d0d22csm242869e87.37.2026.01.05.19.09.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jan 2026 19:09:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 05:09:55 +0200
Subject: [PATCH v3 1/3] drm/mode_object: add
 drm_object_immutable_property_get_value()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-drm-fix-lut-checks-v3-1-f7f979eb73c8@oss.qualcomm.com>
References: <20260106-drm-fix-lut-checks-v3-0-f7f979eb73c8@oss.qualcomm.com>
In-Reply-To: <20260106-drm-fix-lut-checks-v3-0-f7f979eb73c8@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXH0DlMWQWECsl/rW26AE+Le0PH4Z89ea3vpjg
 tWGIWCs/zGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVx9AwAKCRCLPIo+Aiko
 1SAyCACnEjzdAMzpyfkO6PvtCf+G3DKX8uG1K088anOusXdpHWWFhRk3GtMnCS5LCYqNRKYUYwJ
 Ytbagn9GTFUuoGQLESfr2Tf0CnjUDMKiTEXwNiGZysydZrW9zBqnJUMnRn8pOvinh4vXvVFKhrf
 6c+WcZ0aSoNz54T/S0liD47Zhs5bMoJKvlMVLXP0qYjiceK3dPFRaSc2sl857rTvfCxxPa0WG6R
 OzStJU50ourr5HiMlCX49zusfzqsjkfF0jgbMblI1D6b3Db2/VRobXLtfeQOstro5PjC+ijLS0K
 GuxXxLdYyF0BZq5TUBES6CyaTl9+jrINf+WW2rxJAkB3imVF
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAyNSBTYWx0ZWRfX+gOv9Jan/n0P
 sgnzviqjpKTGiv83qxSr+PDFnBbiOQfxsZkdr1ankB1BT97VAz2AtRs2Jto0yCIW5Y5lkAppx5Y
 L4zd/nJgZ5AZ1TOBS24qyhmrMEiYXXLovTiWXOeV+YeyS+o4+ET3UiNaRhg56NJdaB4VSgvjn8n
 lJp+6IRPYivfyRstWkRhwtXJxX+i90BN3kChU5bDEN/4PAG1OKNgWLGc+tzksy/kNjbGRergRqv
 w+XhqaxlDFjJTaq2euNkFap9OsTy8Ec6oBjc/x2zIIzTYibqEeqeYMbUZ85q6IIb81RCbbKWjYM
 YPy55SxWjRe1Q60zUa+FyMgpI5CCcAPalCf3HFijhnAvU1TAGsAKWRJD+wS9SoNCpt7hFyBjDYn
 jgxEoXHktpjXwKHTAOVK5jUk98uVFbje633ygkts7jUYY2BOO0PlkHn2uYTOMkLQAdAHyvHEaSH
 6XvSuI6LHYF68er41rg==
X-Proofpoint-ORIG-GUID: yaGNlTQhgGjPwQSJj-836Tc2LUq1ZwnJ
X-Authority-Analysis: v=2.4 cv=fr/RpV4f c=1 sm=1 tr=0 ts=695c7d08 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=uUhA93nX2LN1thLMeo8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: yaGNlTQhgGjPwQSJj-836Tc2LUq1ZwnJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060025
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

