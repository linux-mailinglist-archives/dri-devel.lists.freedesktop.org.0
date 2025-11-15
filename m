Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C5FC5FF53
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 04:42:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 463AB10E28E;
	Sat, 15 Nov 2025 03:42:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lV0SugJZ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IYAszwSS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E573B10E28E
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 03:42:54 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AF2XuiH1258849
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 03:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=tp2SrjM3ut1J2CotAoX20o
 6lXiPU098YctdSdpLfUHo=; b=lV0SugJZ4X9IqMom3rdI7sgPsrF1Rl8nk0Zujz
 6/rqtD2n1bTHntoSU9aMcNNzvOEK1J9FD1NNqJmIB40udjdEGI38RlIeklPfjCTF
 tFLTcz6E8FiqHtyyI2IC7t5DCIxYPucotHlBjPxYAFYAtraWDAQ1QCzUf+QZ2gGZ
 riONBOMXDPDyutpc1pc12lrnuASLAMXsNSlOL+fDte+WnByRIHhylzJh0C2YqDg7
 hFPK8cRsHSZYsbB5UkZzBqrEk4i73RnwBvIDWQRbpQuX+MkCex7iZRJmMge2zrFC
 6K0+DMSnnKoOYUQYbEsCXckJPpFp0Nh9pFjy+hlj4EJLtz0Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aeguhg3es-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 03:42:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ed6ceab125so77834691cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 19:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763178173; x=1763782973;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tp2SrjM3ut1J2CotAoX20o6lXiPU098YctdSdpLfUHo=;
 b=IYAszwSSJoQPDDt7+VvIerp2c8iNpTedHDSPUgvobG9J0mZpVA4zmIgr6mWM513rMi
 n4nc7KwEWaygH973/9dNV7CcerenjYhEr3HlazPUhbkSDbOyIsLXej17x2pouEa5x+Q6
 ZCj1EEYdA+KPRdky0dmWK2AyQenOHbK8k/4hz5owHZasHo3j/CV77oCW9dIkWVaDn/0B
 w6kdY1m8cExtjFxeZkRk6shAz5ACuE/ahc+jUnh0IM3nSdV6NuBjAAg9fmSSgfrrev3Q
 5wbYv3eyGfn0h+r+/uVJnad2s2OG5/4ImXFxY03eoiI4QRhd1Hk6g4wUqlQ2JYKo50+l
 gCEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763178173; x=1763782973;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tp2SrjM3ut1J2CotAoX20o6lXiPU098YctdSdpLfUHo=;
 b=Zc5N9yqw7GwqM+sNEq9GCjRXslOq2Rsnva/4UHGtWBaEShN5nlqZCSeprADIGN+Zzn
 eule5onbdvnSbtck7pAttEN1+EKXRoZ4QxQlsaqf8t1i4oM71k2/cAX7EqNjMj/B9CTN
 kpcJ56PjZBB28wrXuLB5KGTIDHevjzAqAre22Lbh0wS1OufMhtJUtjHYRHEy7K3bfO/R
 AVRqNydiGqieqGQhEUjr9wv/jAD6uvvu9V8ijcq7FUpT47Fd7ReKQK6/56dcHNk1NAre
 DAGCqr5oyxZH1Qofhkrna2fzo3JIeEDZZeid4SSTABuxUM4qCTjhJuoqv2fVO6YO7EIA
 xLbw==
X-Gm-Message-State: AOJu0YyHTftNJOIzpEVfT1lslIfLLdOS17PpHCJk55jwI7pJg4Q/6XUW
 +lQBxAGCt9umbR+pgtMiXdw7KcC8HSBlIUa+TUQUXNV08EXVVLZg1S92j8sbyZv3St2Ye0ZGP0x
 LsaKRj3DH27QDOS99dBd7J0k+hqf142zSVDwqQJF7IaiQfoeaFMirSNw1zx4Vdzo/D3ml/ms=
X-Gm-Gg: ASbGncs2ksSzbwHnS0rcG4aX0G4D+/uHCVw3P/4nl0kMhvpq1dmroYUYJ6N0EE0M15v
 OyN+REBJdL9I81rZPurtYYkhWIK/+ffL+crfgdQFLtg6li65y0Eqc9bh27wumF1Z6Rq9rRujx/H
 a0jUbHASoO/rzKh5Ya9T0voTkBhOV0iw+LPachpAK9pPzza16qXbM0KmTpiwbQgDFpHRq4rfEJM
 EusGbo3UbTB6Pr+QxaKjdMhJAJTCemX1WvuzXcSMjBPUEdjHX3DdSdp3k0xPahT64PMsJ5dz+oq
 Woi3Ny9j/QFXSAto/5IUoKxoELAytACd1mxH/sAfVMUpeNpmb+UvYUD2PLomWHTNDKVmM7BgV4b
 DIYCeluGqTexTnRSEztq/6QSTMaRj/Y0Yah0ox3qQRQZOizIhws/7Jf/FSMRu1AFrz0eCqLKrgJ
 Vt5vjuWI7IBoT5
X-Received: by 2002:a05:622a:1343:b0:4ed:43fe:f537 with SMTP id
 d75a77b69052e-4edf215b06amr82603361cf.76.1763178173143; 
 Fri, 14 Nov 2025 19:42:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXyrH6DMsBG0plYgS9XMaYlKbJKjEyuvQp2iQjMHxRCVfSG63Qze/dppmv24ucgzgaTnMWug==
X-Received: by 2002:a05:622a:1343:b0:4ed:43fe:f537 with SMTP id
 d75a77b69052e-4edf215b06amr82603201cf.76.1763178172715; 
 Fri, 14 Nov 2025 19:42:52 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5958040578fsm1475880e87.78.2025.11.14.19.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 19:42:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/3] drm/atomic: restrict the size of of gamma / degamma LUTs
Date: Sat, 15 Nov 2025 05:42:48 +0200
Message-Id: <20251115-drm-fix-lut-checks-v1-0-3586f5855bc7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALj2F2kC/x2MQQ5AMBAAvyJ7tkm36uIr4kAt3aCkRSSNv2scJ
 5mZBJGDcISmSBD4lii7z0BlAdb1fmaUMTNopWsiMjiGDSd5cL1OtI7tEtEMQ6Vr1oZIQQ6PwNn
 4p233vh/1emBeZAAAAA==
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1377;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=212f04+vA1L9p4RIj1VyYlO61ApIYXhcl1xh/Mmyias=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpF/a7CVPaOu6IdvBY2A1EDME8rINrM/I8HPhlv
 BhGJkPLFrCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRf2uwAKCRCLPIo+Aiko
 1STEB/992pzirGjCzs5QhcfsrJ4JhMOAy0zI8Mmx2xAruD+ZsuG8rxhnxJdoWFkPNsVKPixHB5l
 I+vbaMa4o38dH+S7ezTj6CnagM1Y2s05SUkUm01KvCNGuiTEuUCm152B1FEZ+8jOFxEShqIqoAa
 gXXUj4CsB610T2zW82Nm01aIndapup+SUPcduWUtN1zD4VI0Y36dl6EUx+Lp10nWUdQMo2K5Bli
 8qE2J78F9XoHkIC4Lj5ulUL15Wao5YZsPHH5rrUHxVz0x/fBx2XQPS0SmBEdvVg8zXQEH1Zpuzu
 aDnUpjC7PaM5F7akJyXy7KFjv3vo4etW1VZZrYWzqSwOyJln
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: RVee8yFvoU3L0giT5ZYB25ANzwSQ3J0R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAyOCBTYWx0ZWRfX/owEKwozUAhD
 PWXhCf9oCJ5ctc+SciuZ76Qdz2YmvVLMLNOx6IeUKBI24XiZDbBvCZUju5iniRNU71S368+9jeQ
 h8wJ2NQxzvhmfGDUl5A2vzOq+NCQQGEBMMRzqn/2ZigNc06KCn8wxtWyhfQFPmTdVf1FpGlHqMH
 xniFqHQplkyOsg3dpcGC+bsFFLGtHqcNvyfDEvQF0EC8czrv4ivZaahhVjYqy5+UkyC1tPzzkyg
 PIxIsi9nH26QZNuQmJnkghWOUXJBNR8yI6XnanvQsxA7m/fmBFLjkzAfzKicGkcErZJTyPPbOAT
 jHOuHQYqaNYI3Tzr5Hls3jINggi3sdhDu4ikeTehLLEO2RQYyj4igfC38CHs7mTKAmr34LZ2Ecn
 yFe8PnfrNIz2jZRSId+p99Mzh0FBjw==
X-Proofpoint-ORIG-GUID: RVee8yFvoU3L0giT5ZYB25ANzwSQ3J0R
X-Authority-Analysis: v=2.4 cv=boJBxUai c=1 sm=1 tr=0 ts=6917f6bd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KipMzqLmMTXpIc6q-14A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-15_01,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511150028
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
Dmitry Baryshkov (3):
      drm/mode_object: add drm_object_immutable_property_get_value()
      drm/atomic: add max_size check to drm_property_replace_blob_from_id()
      drm/atomic: verify that gamma/degamma LUTs are not too big

 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |  5 +++++
 drivers/gpu/drm/drm_atomic_uapi.c                  | 23 ++++++++++++++++++--
 drivers/gpu/drm/drm_mode_object.c                  | 25 ++++++++++++++++++++++
 drivers/gpu/drm/drm_property.c                     | 11 ++++++++++
 include/drm/drm_mode_object.h                      |  3 +++
 include/drm/drm_property.h                         |  1 +
 6 files changed, 66 insertions(+), 2 deletions(-)
---
base-commit: ea07a751fbf3743490a463ce6cc5828e6dc3c660
change-id: 20251114-drm-fix-lut-checks-4bb325e24110

Best regards,
-- 
With best wishes
Dmitry

