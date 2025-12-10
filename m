Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B18CB3E29
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 20:43:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4279D10E783;
	Wed, 10 Dec 2025 19:43:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dw7RkObN";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dm+paE+4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F41B810E761
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 19:43:06 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BAIRKIY3082211
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 19:43:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ucvlwZxhUO3+pYRWRBKqgclemaPm9AbJrEzW63oPi/0=; b=Dw7RkObNqH0/JArg
 Z/G0xdd2MGP8Z+gzWqBxf51kS0nY0viSOr+MbPd9eZyKAe/S2rZPHFLJnZYtbC5Y
 96Cj+zHDK6p0EtBtSGPYNTteP81YQSCQG4nQZcuTWEekGMkHBcFIZe8DBUFJzCDf
 0MP7Al5ID5YYexklfnJ2AmcIf7jLD+xUXlRZ9FUlOo7SfXAfvWmGPL6OTUCZ85PJ
 AYgso6wRsfBgSt0w5gF9shnTHrMYbOGhJDXThEb+Sjy4/0g6FkEVoyaMbWrfrpvC
 lUQTV2n000avc4jmvxZbVsjh2kr+d+PQk6jx7Fgmbg1V96ny3cQpdZYsBcjeyhaq
 GSJ4Yg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay2e0jnpw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 19:43:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4edad69b4e8so3451351cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 11:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765395785; x=1766000585;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ucvlwZxhUO3+pYRWRBKqgclemaPm9AbJrEzW63oPi/0=;
 b=dm+paE+47xAWDanGGUrrmYaD/to4JzcRuFjMxo3n7Omft5/F56D1zrBDw+qN1c3J2h
 egR7WZXytmNi0ZAdVl6RL8+wi7nSS1qHd1lx6Wuop2NjOS00nmNiZROCtNPgtHZDjKR5
 h1ve7IkP1QjLReQeLkGl8Iors9ARtx7Lax/SNN8d498MYIKyQe6oXLVrCg6pKgsgGFOg
 OwMVgjYE3Kg3UCCZvt9yW+fzge6LH73wqTXw7NisOI4nGQqoCSb8FhpUicEsVHhEMOOn
 1tH6lyy5/fPU41AVf+tBWnv47kM6te3DmZf8O5ouZom58/NMkIebNp68EYkT8P7jbokT
 1YNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765395785; x=1766000585;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ucvlwZxhUO3+pYRWRBKqgclemaPm9AbJrEzW63oPi/0=;
 b=mGS+vNGQp+Memi9O5NGkYQD4cYqJUMLFIclxxRVncNwoQvFQSS2DId6WKldomBpTxY
 yS0lURA1uz4s178dBzTrinPcTj76o06kB92M055gvuDLvMlUuCEr+iy8e9F5SLEQvv7F
 1mrsLHQvqB/34WpgfAyTGo4RMdssbaHXaBrdIFUmWXp4g9qe+NYiXWMW91XEtrHVi0pt
 GGFTw2sbXdrBrsnLx4UMYwz17EylNbA5xuTawrJjN4neToBBrtICF/w1tfDVCeppU8Mc
 QnvTo+Ld6KsAw18H8yqNuRnUGz/rgNzF5ewyZh5wm9Sup2aZkqtybMioGJEfc54hIXDA
 mEgg==
X-Gm-Message-State: AOJu0YxvST4SeU/G/mzeQp8+sobIwIUhtiwdTeIfsrkDGMtBb/FlFEFh
 cssj9BRReGJeHM/wq8ROzznHAhfXRUhs+imyYDhKRZXFd7pIKIQeQejZZrJ3A0oHDJtVlUiviBm
 tRrlvGn0XhKgaquVR8Y5AyigwWyVpt8ZB6pluZUNn2lebXxyqL6YWFBX1iWNzEvSvojTogx4=
X-Gm-Gg: ASbGncs38eSpLP+JW+K/+IJWXHUyjWK+l9h2MISKycjHfdlEuuMilSgSJNQwJ1WP/Kh
 ZwuO8IY4RUjnqUF9KZMArLJjvQCEEyKATq7NZJdHknfalBJbdg2erviO6oMzWBXeyVnbrWp+Wnb
 UE9ANNwcf2AqMdZmH+yeoeCB+cG2gThhkyobrkmdhM9/K/lHMTMc9qCV6ko0U70QBEwIZrEHenG
 cN6t1/OhVv7ZCooQPlKvXIsd0DwxO3Hz+3oZZ1aqRpiS6P7lb2QPVPrvObcpuQnzuD9ct0O70Rr
 4p5b9i6ttbF+FeEzN99AjIcIPLjLmC15Uf2/OrR+3X9qwD6d/JhXG6lgFQiDxnY1O794PRT0z1C
 1DgCASQTSM5q9fnd5XeYvZokYUQKC/ZbzAVom8+3FFQHewFHqanN5O8tTE2MFDKEdbut5zggjmp
 R8441uaGag8AZfh+vf3FhBt9E=
X-Received: by 2002:a05:622a:10f:b0:4e8:916f:9716 with SMTP id
 d75a77b69052e-4f1bbdb9ca6mr10009831cf.36.1765395785476; 
 Wed, 10 Dec 2025 11:43:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTGVZDJO7OhmU9jVRqnXNBJECkkrpq7sqjcnTZrOyIk7WxcjjzjnM4z7PCglHDaysmLPP26A==
X-Received: by 2002:a05:622a:10f:b0:4e8:916f:9716 with SMTP id
 d75a77b69052e-4f1bbdb9ca6mr10009541cf.36.1765395785026; 
 Wed, 10 Dec 2025 11:43:05 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-598f3199e93sm104845e87.96.2025.12.10.11.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Dec 2025 11:43:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 21:42:59 +0200
Subject: [PATCH RESEND 3/3] drm/atomic: verify that gamma/degamma LUTs are
 not too big
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251210-drm-fix-lut-checks-v1-3-10ae38519f43@oss.qualcomm.com>
References: <20251210-drm-fix-lut-checks-v1-0-10ae38519f43@oss.qualcomm.com>
In-Reply-To: <20251210-drm-fix-lut-checks-v1-0-10ae38519f43@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2033;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DcbmKAWOVk4DBQnJAwa8CKdQ1Yq3s2UIfNjf/wSOuus=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpOc1CNBQVt5lVuntwMtvsG9k/gNh7wXlfIuESB
 sIMSN+2yj2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaTnNQgAKCRCLPIo+Aiko
 1di+CAChX+sjkc6W9zAEjAlx5O3DSDT0vvEM/vEgYbtgD/Dms0BzFm6SWNX1DU6BMRju6vqsYHa
 JQP56xB4W9XhjdjrpX3SrCN0O4ECzuB1+1NVoUaCdjUIk9ZNwrIAGQBcePAyFyq0Rve3BNFAnWd
 WdnwCXcC2W1AWBVt8jtUqXSCxizsf6gcnVtwqs6a11rDP5pZGHB/cKzTmnL3gOGZK6TDxbjNipT
 IGYHa5UtHcnuaTUM2nI4bhE32SiQ9iJUvh6nkYpCQfyT4+FNm235+CqQjLUGqTJAn137h4+h0uc
 NPGL42BqOOgUh471X0NcvJC8tkC51mjyZXVPF9bkD7Ng747p
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDE2MSBTYWx0ZWRfX0UJn5MHDOfpq
 Ty03xvK2quo/lLhHPcLhZ2AjBOoZbi87fgXiv78eY69UmnkrCz8LHBKd9ye7HFiFNqWKSFImQSM
 5APmTi2PQKosUTXCnM4+HHcYMtmZqSClIraa6FeUXgDgPmgnPM3x9cnCH2FLS7IDwjaMQmJwKXw
 vvLIvp+3/ntKLkmzfmqvUEv8RgxiDctgCjtv4ainUIznPnN7L1Ng0V+JT6MQWY6kZn4Yq7AjqGu
 1kN3L2OVzAj2+QY30N7FoyEGQ5s1YuGyEO7HqHC0N75YS34Zd+c9PDlSaU5NPuT3zBls3HzXTqc
 dCYTOiaQY+4SPOr4hLF/Fen23CAcwzgthmHLqszd5jRdCgpnFUjd2ec3KM0KI0CWYXlGJDcc0mz
 UIKgokmpwgQK48M6BURMMHtJGdQznQ==
X-Proofpoint-ORIG-GUID: keAWU7_A5fsfu7ApFtaEmuR7Uh_xv5EZ
X-Authority-Analysis: v=2.4 cv=G5oR0tk5 c=1 sm=1 tr=0 ts=6939cd4a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=bAolQom50hykzV7YMrMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: keAWU7_A5fsfu7ApFtaEmuR7Uh_xv5EZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_02,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100161
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
 drivers/gpu/drm/drm_atomic_uapi.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 7d2076f1006e..178d983b2378 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -384,11 +384,19 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 	} else if (property == config->prop_vrr_enabled) {
 		state->vrr_enabled = val;
 	} else if (property == config->degamma_lut_property) {
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
 					-1, sizeof(struct drm_color_lut),
-					0,
+					sizeof(struct drm_color_lut) * lut_size,
 					&replaced);
 		state->color_mgmt_changed |= replaced;
 		return ret;
@@ -401,11 +409,19 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 		state->color_mgmt_changed |= replaced;
 		return ret;
 	} else if (property == config->gamma_lut_property) {
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
 					-1, sizeof(struct drm_color_lut),
-					0,
+					sizeof(struct drm_color_lut) * lut_size,
 					&replaced);
 		state->color_mgmt_changed |= replaced;
 		return ret;

-- 
2.47.3

