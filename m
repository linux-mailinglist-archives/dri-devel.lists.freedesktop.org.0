Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB4BD1BCAA
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 01:20:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F27DA10E570;
	Wed, 14 Jan 2026 00:19:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kuKQCbhT";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CofAYN5I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C79E10E37F
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 00:19:56 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60DNHcHm1424706
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 00:19:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kT48Gh8ZEybWr5oJNkZWcqfokdQKTKrcVUWBmWF3mMg=; b=kuKQCbhT2iqKBNLs
 5MJqCHG9QobaIDWui2IDBvjmB6XNOfyZHUJw8ErysEHkFvDo0yQJmXqrAqkvsI5Y
 Cs2m0PDIiVTXkKIJFgwz7ZNsJI7MqPD0NvdFAQuTLJlHWfkfRoOnO63Fk2MbFN2+
 4UL93nPadqflq9o5MFcKaE3JrX3Fn/50Op8wSRLhxjcXV9XiEqM7CAoTA5JUDbay
 93Eb5EHg2kaF8Q2zanLF4kAY4q1NxZY9QTqfcOjpF8gYsvStgNrS/VVg1QdV0AU0
 59aIRPaNHKcyKOXhWj3+u8W68xRUL//F5ea1xB8hVIC7dekftERlsYM8D3O7inLk
 AgYmxg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bntet1594-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 00:19:55 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-88a2cff375bso206578916d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768349995; x=1768954795;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kT48Gh8ZEybWr5oJNkZWcqfokdQKTKrcVUWBmWF3mMg=;
 b=CofAYN5IxXOmW3eVB0qBDXU2Vd8BA95XHGKE+sfi9rSLquz7dNRqM4TyKajv1Lgx0T
 e1/00JDPSl9cW28wU+viy7QtOR95qJiUjH72IvsvMFo9kQFJZvjJy3Za5xeb98yyvl6r
 NAezKIx8RNVAZB8VXptawWWlnKqsLjIDFYGkrIvx4nel91AA3vsNa4OaOY5H8YTgcpE/
 xjFeFsLzsjXtyA4x9cJn55pqMXeMm0G5YejkcPmCpYM1sbyjtKg1RFgTkHXOMTFxtfwR
 EvXl8nz6FZBLcM97+RgdwUtqXiuDznuLy0OmDIF+atwpiwE8A3iWfU7iSzF1TXLIsj5e
 +E/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768349995; x=1768954795;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kT48Gh8ZEybWr5oJNkZWcqfokdQKTKrcVUWBmWF3mMg=;
 b=OC6UelYpCsH3YzWSe4SfZHZujUEVvfIXsgJ7lPEFIP0xr9LNsDwlSpgTqjJXCcj5Lb
 alZjR1Dh+oUdz5LEawzvEHk/VTW/gZyAiXdL6AKNzlEOtUFNPxqQYlj2zdUThOyrqXGV
 Uapn3D0zxz26F/9+qjJ4ryxxBsD6nhGplNyW8HrE5Ot5kkBH7ySOVUKuM0/jqAeX4fr6
 4nwFRoN1ilec0xThJ5CEvcF8YlypexBox9wHKSYpWNZ7YdS9ETTHxvdMq2IghMjEewJD
 UyeLbhb5XNJSA1Kbj2n2cu2Qsov+76hjDJ5/zOvt4dcL6bhSGQP/gTWvNLASU3+ohdcN
 UmsA==
X-Gm-Message-State: AOJu0YzApNkbbqSrzUuSWoglUz0cvfZZZp2WHsgaHDoZtS6qMVRV4124
 DMycsPYv1+5f8fXTn+i3YdECbUrZC3tmVHquEYQBGdN9uQliX9tuAzoUEp3OJxk+4isgSaFM160
 n0AC810J/HfIfSlRoMXpXzHPsB5dlfsIifoTTjAy78NFIQEaB2rM4DxrfyGxln/byIUGgR7M=
X-Gm-Gg: AY/fxX6Xa7mlB5BeovRFDecwjIN3XAdPCVNiZcd53ekdxn9EJJQO8iNLeUx40xB0h8T
 DcbhxTTStvmyOaNwBq9eswFpBWKRKEEjJamQIozuqz4fvh50vdjHZ2YnAevTq2mG2J5vIF3cC76
 RUzttAHxpziS6ebjEEmaWvrnT7kYrWdo83AzSxYiMe9kiAfU5aRUYI3DVF1uiUu5d2lKLSqrlv0
 HjD/ujpwb3II1SmdSD7hFZJw4z0T2XEHZMPn2e12U1xlJB0B55NfgmUphd6Y547nanh3iePmI/K
 WYbV9yVLE2SGcz+JYRgltBxW+ydQWNVmCL7WQrc9tqakMkA+7OV5MzUq2pOEQuACiB+mMR8GvPY
 qr8xPUws3GJ0ZGVwAI74ZAs+IfnxZ2/YYmRGVOskufi1/I9pVnZTsI/jqaoLqZp2y3fLTOw5ATR
 7wjLm75kfUDC8vzRqlFN2dvDk=
X-Received: by 2002:a05:620a:400d:b0:8b2:f145:7f28 with SMTP id
 af79cd13be357-8c52fb1d058mr146354285a.33.1768349994654; 
 Tue, 13 Jan 2026 16:19:54 -0800 (PST)
X-Received: by 2002:a05:620a:400d:b0:8b2:f145:7f28 with SMTP id
 af79cd13be357-8c52fb1d058mr146351485a.33.1768349994199; 
 Tue, 13 Jan 2026 16:19:54 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59ba101accesm159500e87.5.2026.01.13.16.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 16:19:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH v3 0/3] drm/atomic: restrict the size of of gamma /
 degamma LUTs
Date: Wed, 14 Jan 2026 02:19:48 +0200
Message-ID: <176834997569.1930094.10133613563248496827.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260106-drm-fix-lut-checks-v3-0-f7f979eb73c8@oss.qualcomm.com>
References: <20260106-drm-fix-lut-checks-v3-0-f7f979eb73c8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5csTaUSBTVaYwYhpA23ndkRbqlSM-cXa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDAwMCBTYWx0ZWRfXwngMivPs0F0o
 VHMUXDMz7RE0CWPqxgiGw7kt77g7t84c8Vd2OLQEL34LZ15jgI8AVS7mp9sRyyP56sBTSKmFFHm
 2AqwZzBk2evcYLQKGoRtBP9CS+mZwjhnG+pbq41nIrjDe/LZyGzA1+6/BCh3dzb8n1D4bMLTtEq
 LrpTMzFIzilVoGeZCHEnT+XEFsU7FFhzGGKWVHzUyIiHVTU+vqynJMnHJsvTECI+tMYOO0iCzkQ
 BTpSXhM/BC6QJZ/TQuSONXv9On6ICO8K0Q/fvnTS62oJLVi8D+VRSjkM4cR2QF/AgvNcoD+n6co
 gC+5gDXxqHq9hy+gdjUdUHsh3BGIwEIOHLxKWyw4V3sfcb+tTPOH7WzhqagS042euMLI4eoAq5C
 +1O7gi4+7u1GQh4bjSlKvVEge2q28qkOwkKG4WLpGU4W+eEHPs/SfDQ0o5efFfMr3pQdAYJzGjd
 nCBMHt2t2k4Q0SPcobA==
X-Authority-Analysis: v=2.4 cv=TMlIilla c=1 sm=1 tr=0 ts=6966e12b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=srJBafmTjFzwu2qPh78A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: 5csTaUSBTVaYwYhpA23ndkRbqlSM-cXa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140000
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

On Tue, 06 Jan 2026 05:09:54 +0200, Dmitry Baryshkov wrote:
> While picking up the Gamma correction patch for the msm driver I noticed
> that kms_color@invalid-gamma-lut-sizes and
> kms_color@invalid-degamma-lut-sizes tests fail. These tests attempt
> submitting LUT tables greater than the size specified by the
> corresponding property. The issue doesn't seem to be specific to msm
> driver only. Add generic check that LUT size is not greater than the
> size passed to drm_crtc_enable_color_mgmt().
> 
> [...]

Applied to drm-misc-next, thanks!

[1/3] drm/mode_object: add drm_object_immutable_property_get_value()
      commit: 66c9c0cfe765af7f30eac880da0fa047aea8617d
[2/3] drm/atomic: add max_size check to drm_property_replace_blob_from_id()
      commit: ca59e33f5a1f642d13ae0e558fdbdd9aaa9fe203
[3/3] drm/atomic: verify that gamma/degamma LUTs are not too big
      commit: cea6e6e8717e81de266aa496f44088b2b960aa32

Best regards,
-- 
With best wishes
Dmitry

