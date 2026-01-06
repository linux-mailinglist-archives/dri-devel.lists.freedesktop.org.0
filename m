Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4119CF6909
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 04:10:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 759F410E25C;
	Tue,  6 Jan 2026 03:10:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lwUUksny";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CMg6zvol";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF1D10E329
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 03:10:07 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6060npLG203342
 for <dri-devel@lists.freedesktop.org>; Tue, 6 Jan 2026 03:10:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Kxx8tCQDWmw4x8+Q9ke5IQIT8BfxOOcptitDY8TgftM=; b=lwUUksnycBGhL7QM
 V7gx5qNFpCeiw+Cna0vJBDJK68qs4bZ8FgpYN2vvSxqr48Jwi+fn9yBdAVrBFEoE
 O4aFpKBK3flnHCxiJ0GH1BqkaubH7c9a53awgHWdIsahx+IbK6TiDNGpLW1c7w+8
 Vy5/6B2aI2NqKSXUgvuEjgHTgRPfq36QkxCf7iJAZ4ERtP45bL9OFhLOqe7hrRnC
 JYzb+tUQU3J0HFSseBUBFsjKwk3NA0jJ5gHeR0AmHiVqpcTHnjWnEeyv7w/P25be
 XNXQbV3jNWWB/vJ6/gKGB7LnJofobF3QDBJpIqUYDyLqvtQG8Kc9dinFdY4k2GUc
 mOsoFA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bggqu1jyt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 03:10:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b22d590227so75942185a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 19:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767669006; x=1768273806;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Kxx8tCQDWmw4x8+Q9ke5IQIT8BfxOOcptitDY8TgftM=;
 b=CMg6zvolpnfFAJIrDEiG0MLWmGpB7Gi3VE4IZs4h/ei7aAiQdQ3niR41aajfXDHe/b
 tIRqLPZvP2SUiOdmkQWI5FtJxuW7CBIg9H3b51Y9xAmeEa7nfjj+yVOkvdr12veek1CK
 6TlwDPQqBOPRTIuvu6JQ3xgWwYOtH7svoFxArJ4qjwL6s31Xt7x55RwyfEtODPuD9dDC
 9gzzSgeaL8guiuoxsnBK8hGzNxdBLVbBbQghjjytN61/BfZftJvYtFYlhu1GiMMnyftm
 WBhsDO3T29y3116U6AS7m0AC5a1FzefAJJYxwaj4Ld+GIkXWBE2SpB+F0w74c6JVKcDY
 7o4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767669006; x=1768273806;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Kxx8tCQDWmw4x8+Q9ke5IQIT8BfxOOcptitDY8TgftM=;
 b=TCkHff2FaVhjps23IR8WRJbsExRW1yOD3ZYDUv6kBbIiamJEzbl78ol4BP9OrwdcdW
 F1Vo3rdHmxE+UznwKyaN1T1qmnjmmmDbtuYNsA9VMCBB2/HaqArWCg7hOrRZMruap5Cg
 dBL8zUJxRFbjktCDZjhbQoepc6CYveSnneKqsfRkluYKi+f9OMG5skw7JjL9rUCs5qw4
 faHxwBoCXqBtNtAOW8rau9reQwxHSbo4HAyqQudEBUQpV8djtLdtukqoZQtS/c3ZnaRy
 MckczLvAgE0sF55Zaew2mmTaGQ2oyrLy6Th2PaMy9Yh2JLQK8Jd3bPI9xbNiebJGzILf
 n1BQ==
X-Gm-Message-State: AOJu0YzkpDTN2a9M0RNzwp/C3s83ld0zA8Wbprw117ouB60GdHPIYS+r
 4VrPON6URrV7yVVDCnyL6k4Xbqe51HFo9yibwEdlmHG83wB2S4R7LvRZ1SR8DaszkiccA2rzDIc
 2lTg4egRmbj6mytRq4KKSpMDqJGE9fGdMJn6WnMRXpuljUCcJFDjyq4JvRv8o4WQO3gQGcAY=
X-Gm-Gg: AY/fxX4sULlgjRRwnX8n1olaNmmcpXtW3fDbxRtlFpKk5UcNlV/yA0M/cgxrd6UjobU
 L6quLB8NEubA46YB3PmJ9YghBU4c3Hnj1Gmk/gPRwKdYqMaCJd/EmZ628Hdnt+FJWiypnPq7pEg
 yaCZbf2eY+gI1FBCMjD402bGTVOp7GVujwsx9jPv6RPHwlrhv9vGeCvgKVRujSiPcyhQhD7vGND
 G25QzA1eH7Dbb4Kwa4Q2m+C1XVjywUFbsdTmbvT6uasvlmlbiRQ1NipdICRUkPmyn7ywK2sj9DA
 fovb61NLzFvFWLoDfsVdFzicmc6bPElLH1DBGttD0Am8Q93mcJFgnVSeHPFJlnvwxlxZeBBWAvh
 dhdLQuJ3Z9OIfR2zQyUrKo8HSjBk+vTPKi5QJUIaKj6WpjnFb3MQ2N6T3R45eX9v8ZvR/B2OFUT
 3oGikybyuWShsp67i4Bs8eK5Y=
X-Received: by 2002:ac8:5a49:0:b0:4ee:1903:367b with SMTP id
 d75a77b69052e-4ffa76a1174mr27538961cf.5.1767669005982; 
 Mon, 05 Jan 2026 19:10:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUYnowTv6MsozrIb8LDtbiyw94oAdi29kas9IpHmTtL4k6cthbrQfc1CLNz0JLTyR/dDvm0A==
X-Received: by 2002:ac8:5a49:0:b0:4ee:1903:367b with SMTP id
 d75a77b69052e-4ffa76a1174mr27538641cf.5.1767669005516; 
 Mon, 05 Jan 2026 19:10:05 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65d0d22csm242869e87.37.2026.01.05.19.10.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jan 2026 19:10:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 05:09:57 +0200
Subject: [PATCH v3 3/3] drm/atomic: verify that gamma/degamma LUTs are not
 too big
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-drm-fix-lut-checks-v3-3-f7f979eb73c8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2133;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CQUkj+reftSe9Iid1OhLuxp7qZp+MAIvsJPwVl+a6RY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXH0EwOmRyu9Cnxu6D/YykRTPVffVqbMsthR9k
 9TD4SOlAxWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVx9BAAKCRCLPIo+Aiko
 1V/0B/9FfTKkq3SbmSHXtswAti0IbUrsa8ReI/ywGQd5c497iNP8yFMbfaCFlF1iHUVlyYY2o6+
 uA33c0tVXM/epG/henHRiaSdzoHTVkmhbIQ1if8GnDD4Wbo/t9P6Vn67MPf/e7POjuXlpMw4IkV
 6yO3M2fYtLv8dL9fQLg1Mj3LUyqYqaUPgoYVAu6TfcOapTs+Gl+eySbYzVYqX8ab5/NOtHn9YLF
 /DLHinUl/NmfbfDQ2voVT/EvGt7mrelzzYvYAYHNJbR8o8x9namlclukOvEg5oTqElL+h7xUN4j
 WA9Gh7hoQ2qV8iEkYsCUzBKczr0ifWgWpniuQ5iAxYG7Q/XZ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAyNSBTYWx0ZWRfX9R7Yi7+CK8Ig
 hHJSJy57jxD5nT/WbBSw0wXSdLctXSebFuRXy4e+8qI8HsSqwckBrApFRUDvI2bjpSYzLchsLG8
 Azp5lcXz+PknUu2tESEqw8fC5WMIvcr9hOLucrlboOJmeA4JFYkmra5bz4xfua9+ZN++R9zHJzx
 cCCR2JX4D63VNIfgVzAcM92EVWRELmEOM87b2rAe+wX54iRsrOe8yBiOSxXEBkGP1VZ6gZhKJkF
 cUk8TSmJnfOh1X0Yw4EhE64CuaWladD9GHvGsWQAnLQPMSIQl3bgDfRxLUbflgDlsZ7jLLYIsDl
 fPzQiupVAvgNnBDmNWxbW565t0t6InYvdDpsE7zMdotP487CBMt6TRy1Rle6aQlGlC6ZsRlGBiE
 FFnOZQHqns40fvz6KROVei8enO0rsbKRq+jilKM2Wpag4wuFajwNFuj2Bwwf9YYBxRw9BgW722A
 5+8s7auT83ZcgvJ2dyA==
X-Proofpoint-ORIG-GUID: rMfzO5v5wasyyfw9VvdXlKL3fxxYuhj1
X-Authority-Analysis: v=2.4 cv=fr/RpV4f c=1 sm=1 tr=0 ts=695c7d0f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ZkoTrUv0hqWFqrPu6skA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: rMfzO5v5wasyyfw9VvdXlKL3fxxYuhj1
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

The kernel specifies LUT table sizes in a separate property, however it
doesn't enforce it as a maximum. Some drivers implement max suze check
on their own in the atomic_check path. Other drivers simply ignore the
issue. Perform LUT size validation in the generic place.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index dff1fdefcbeb..dc013a22bf26 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -413,10 +413,19 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 	} else if (property == config->prop_vrr_enabled) {
 		state->vrr_enabled = val;
 	} else if (property == config->degamma_lut_property) {
+		const size_t elem_size = sizeof(struct drm_color_lut);
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
+		const size_t elem_size = sizeof(struct drm_color_lut);
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

