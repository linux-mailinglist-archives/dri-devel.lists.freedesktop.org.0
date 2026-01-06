Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A34CF68F7
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 04:10:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F85710E120;
	Tue,  6 Jan 2026 03:10:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DFd4TSda";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CLWuLUnv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A057D10E120
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 03:10:00 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 606185i12784968
 for <dri-devel@lists.freedesktop.org>; Tue, 6 Jan 2026 03:10:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=ZTfa9wA8T0PaE0E1zoWe0d
 puxT/D7unhHfcCbxzfev0=; b=DFd4TSdaGjKEdGf+wA1frYDd66dXOS3fwpfd09
 L2pvdmVjlp3o5efikasJ1hqFGW27Ei6E2EEa7dM/3cN4PgjTeYuljnMYL6KtnQz7
 hNlZbJcKcUyNoQEiEhxlWzpDy6/g5NYuZ48wWW4aGhnK+zewczKTLPBEb2kYpG8a
 Wc+5/vrTL6QgqKZBOjOVpEVLaRmqaZ7Eq6zT/pEbsMdKg0kSeodbo561dTiTsbEv
 URNe3Fi3+zTiTXD9FNRwHamKWlmj+oGh8rGSAPWcvDe6jXL7HMxP6JgUIwWP9G9E
 qM3z0S/RKdss07e2Dv2h4pntA2Sgwl+35eDh4WKmTz0Tn1Qw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgrf7g94p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 03:09:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4edaf9e48ecso18500061cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 19:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767668999; x=1768273799;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZTfa9wA8T0PaE0E1zoWe0dpuxT/D7unhHfcCbxzfev0=;
 b=CLWuLUnvZ2GRE7j5K5ec3z8xBH+ASKWQ4ituQe4pGS/uNR+fP6CSOoCksuVH+TKju6
 RtnBjAjZGkmvch4iXo1ovc/xY1rRB4Cf2LqWkJ+IoElNvWzkDPhBwOxtSU789ZQpTttl
 Gi8s3RzIiRmMsV+TIYVGmz2BX9+LOy2l9J+tn01NGr40rJl45I9f5qHCvwGhGEgd6rFW
 0TRL5/JQ6bQh6iUNTx5KTZgN0BuyfmMo/7LBe9NBpwxMNmXYvmkh7001Qwskogt1mgPS
 7pd4xH5liPP+OLlTwLi78RSJlVl/y7UUbpuTcLs0+oQ99wi0nKPfhi2Q+NseWWhbIFCR
 3lbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767668999; x=1768273799;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZTfa9wA8T0PaE0E1zoWe0dpuxT/D7unhHfcCbxzfev0=;
 b=iDWQwP8y6tePx2tED0+eIGmSDxiyO/CwhpyYfwi7BLGkDcRSIzEBLrlCW2rTiFp1/3
 +4Y88Z97qZvpKkyxHO8Wqh5bpC1bDtqQYC2a6U9Ew9eIs0ogyG7/50lrgy1c0Fau3Bbz
 QamdrS/BUdnN5v4/lOyuXkbEgCSo05xF5gvSy2N4NdXQm3vtGfBwFcaLmS+MKn9ss2x/
 ctASNkLMLGL1H0v3r1rMEaXspF9iEeDDPLnhZkDShYAX4vxNsvk/ZTovKCa3l2qAKbMv
 OmF+G3wMVPUO0QmEUFITi3u8kXjC+9tffcNiHzP0HtpDACPSmxW2CNfPcS0dIkBiCGzj
 5VRQ==
X-Gm-Message-State: AOJu0YweuGLnn8a3O/m3ApWaabT8sV1spp3gh3xFoqCvJ8tZRN+P9Z3W
 A9YuwlFjI0jAIhnoofYr+Hi7xPdbHrcal3v3+WW8gPdpiAw2P9CeeRRJaOIFOJeDnJfQg4nDhVT
 X4kQTZ4GtVtewk0MNP1RqCdiOCf5F+u0bztUbL5Py2sWpQqdz0d5OFjneJtETqPw6gnWLJv4=
X-Gm-Gg: AY/fxX7HWfsACsEQmVHJn91VY6ogQgBslqoANaNdbw9dcfHZ/X9Pfv8bO/TG8HsPR1v
 wSD0OIm4gn/o6YKx/U4HinNOZSn09vI6W4Cl7N8NXqWfMTc/hJnqxWyX9/nACD0poigu8vE8Nr2
 /EVlv5vU9HewQWkQ8HF8lXcxPEeB+8ZJomuQ3p0Z2+xsu4N7qqQYIQXWLYacKrs37G/QPz6oyjv
 SaNrGpp+6hTnhXomH1cZe8eA3iBxuGJ1Rbfu2Uz/2U5apK/mqiJabHehulO6je8iwNirKjUw7zo
 F3zvHMpmGsgZIXLWN7lSCY6cZ3a0UY2CPipNKAAefbAOAyvr8te/9m+d3FzaDemvPN4zI/djGFf
 3w+7y1/a5QrEqGNB7SpDDoy8luOHux3tYjmajQmRylM847WfXur/2PfhLNM00Ju3O2gBuP1IqZy
 bpzuPIk5V3XnGQxDuy+W6hK6U=
X-Received: by 2002:a05:622a:4ac3:b0:4ee:4a3a:bcf5 with SMTP id
 d75a77b69052e-4ffa78583dcmr20493591cf.67.1767668998885; 
 Mon, 05 Jan 2026 19:09:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtMMytdXKOdfWr9jpNpiYTarVWG9byyZNEtfvBoH7+SDJ2bhYWIKAl7W2ZCBk6vxjgpVBdHQ==
X-Received: by 2002:a05:622a:4ac3:b0:4ee:4a3a:bcf5 with SMTP id
 d75a77b69052e-4ffa78583dcmr20493351cf.67.1767668998373; 
 Mon, 05 Jan 2026 19:09:58 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65d0d22csm242869e87.37.2026.01.05.19.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jan 2026 19:09:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 0/3] drm/atomic: restrict the size of of gamma / degamma
 LUTs
Date: Tue, 06 Jan 2026 05:09:54 +0200
Message-Id: <20260106-drm-fix-lut-checks-v3-0-f7f979eb73c8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAJ9XGkC/23PwW6DMAwG4FdBOc9dYnCHetp7TDuEYEa0AmscU
 Kuq717TqtqFS5Q/sj87VyOcIos5FFeTeIkSp1FD+VaY0PvxhyG2mg1aJOdcBW0aoItnOM4ZQs/
 hV6BqmhKJsXLOGm38S6wVD/TrW3MfJU/p8pixuPX1xdEWtziwUFK976gmasLH5ySyO83+GKZh2
 OlhVnXBfwmx3pRQJbIdtc7j3vot6fZcOPFp1s/n59am8cKwFsV8KFZ5iBLeXxcY+Zy19XYHqIo
 xbT8BAAA=
X-Change-ID: 20251114-drm-fix-lut-checks-4bb325e24110
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1983;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zd7KvTkjp3RluqiZkKPwKlyuKSXMCiArD2cEpi+mKn4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXH0DYJMUCmQ8UL075S1QSsUvbl0tseCtCXkN+
 8XptjZVvRmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVx9AwAKCRCLPIo+Aiko
 1Q/vB/0RdUlaSsb9MVSbrumP+g0aTu5modvg/i19dR7jZIzr6ErKRD/nCxGksViadJ4fLxhB5Xd
 RhzOFbFaDOpYTqm5fuGs7b8kK5E1zOJbYPl9op9KNjaiy6FtkDHhDgF/2YKl74n0/gQXIPjCaja
 8t/kmsRhwzAzwGYZjDPM1+hE1wkapJUKtI9pLAalDcSZBDjBe9yz40u+xvSt8E6JEl5q3weIcot
 5Y9vKH2LcKOXKUGhRwamyiSINyfzUgb3tN+ZrW7T6ijgWPeypBVNDS6/YYTg7yn4bRzYRpJJBJM
 DUh3mmqK9d78nvTIbDdjRKL8exswJ6qPpyDyIf/xWlMDdpqv
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: wU_IXZdTJxdAsmFx08RX5vQ9dcictLIC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAyNSBTYWx0ZWRfX97vw3BmtBHdF
 XUMRhuuueG6CYQJ5s78PWA8+dIxkgDJqkjSsq/ccvlU8clrvXCmJSetIGgPEQfi5NAA7XiLlK3h
 gdlcBQijgDlx6oncJU6Gs1IApNxFu1qisqDt5FoGVDbXE1n9hGJSeZhlgpHoibIvWcKg1Os2sZM
 EPusjMp7YCwYs5Guxv/mCMOCMve93WQppuByStKlNON1osYWiF47hKMEGkPlvQE8V2Eua8lWe4s
 y8/JelBovXl68UvX5rxbAD/2+oSMUu0XcoxxE9HIdjp8UKZorBxPuNCbX0c1x7ElSgJkewARRMp
 xJPBM4p6NQb1AHSnLuBaZhjCK8u8RGtuRW2FNdH9eqVrC50WsdL3rgZbQDsQsoqhaBv4YERvi78
 MIVlqo/ACtzA/wEY5xPRGVDE+UYrNBS0V1WD8CuiR3z4U9hf23w+2ue2y3JRGnCPmMdeVfJWOyt
 nBen/G8ThU+NGimlzKQ==
X-Proofpoint-GUID: wU_IXZdTJxdAsmFx08RX5vQ9dcictLIC
X-Authority-Analysis: v=2.4 cv=FK0WBuos c=1 sm=1 tr=0 ts=695c7d08 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KipMzqLmMTXpIc6q-14A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
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

While picking up the Gamma correction patch for the msm driver I noticed
that kms_color@invalid-gamma-lut-sizes and
kms_color@invalid-degamma-lut-sizes tests fail. These tests attempt
submitting LUT tables greater than the size specified by the
corresponding property. The issue doesn't seem to be specific to msm
driver only. Add generic check that LUT size is not greater than the
size passed to drm_crtc_enable_color_mgmt().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Fixed elem_size type (LKP)
- Link to v2: https://lore.kernel.org/r/20251228-drm-fix-lut-checks-v2-0-50f5d1a260a7@oss.qualcomm.com

Changes in v2:
- Fixed comments for drm_object_immutable_property_get_value(), changed
  it to use drm_WARN_ON (Thomas)
- Reordered arguments of drm_property_replace_blob_from_id(), moving
  max_size before expected_size (Thomas)
- Link to v1: https://lore.kernel.org/r/20251115-drm-fix-lut-checks-v1-0-3586f5855bc7@oss.qualcomm.com,
  resent at https://lore.kernel.org/all/20251210-drm-fix-lut-checks-v1-0-10ae38519f43@oss.qualcomm.com/

---
Dmitry Baryshkov (3):
      drm/mode_object: add drm_object_immutable_property_get_value()
      drm/atomic: add max_size check to drm_property_replace_blob_from_id()
      drm/atomic: verify that gamma/degamma LUTs are not too big

 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    | 18 ++++++------
 drivers/gpu/drm/drm_atomic_uapi.c                  | 32 ++++++++++++++++------
 drivers/gpu/drm/drm_mode_object.c                  | 25 +++++++++++++++++
 drivers/gpu/drm/drm_property.c                     | 11 ++++++++
 include/drm/drm_mode_object.h                      |  3 ++
 include/drm/drm_property.h                         |  1 +
 6 files changed, 73 insertions(+), 17 deletions(-)
---
base-commit: 349d4efadc1f831ebc0b872ba1e3a2b7dd58b72b
change-id: 20251114-drm-fix-lut-checks-4bb325e24110

Best regards,
-- 
With best wishes
Dmitry

