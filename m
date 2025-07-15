Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7248B06378
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 17:50:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96CF510E5FA;
	Tue, 15 Jul 2025 15:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pQEGVn5D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 599B310E600
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 15:50:46 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FEHcr2005981
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 15:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=2AcW1BhEgDlmeNBSdQyzH3
 pkKxWbz32d24bGDkO+/0U=; b=pQEGVn5Dv17L6DISZnI07Toff6NA/DaTEf46dY
 BT1tvHmQrg1VLklO5hv9ad8uT22ryr2PkcDvQt95AdFZTgk4s7HtTP2KD6v74BXo
 HQmW5eAO7uDrSgrqBG1UFEt1Qxv+8o2JQgonO/slXMDpFANWvUplTY/imsilwKPz
 6QLdNLniGl9vTKNVW02LFnUeAAsJfzqeg0fmcGjsWKcV+yrXxrAQddNM86ce2X4e
 LdlF/hS1+t7lx8z4h+6gm1ooRfkn9iJF7LcxGgBuPNYuQjlzvEMdmbB2teFDNOm/
 kiSXdTCcQfAHK3sjg7g5VuUHA6eHSU/TKhLr7lfpuVv7D70A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxb0vmr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 15:50:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e1aeab456cso348580585a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 08:50:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752594644; x=1753199444;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2AcW1BhEgDlmeNBSdQyzH3pkKxWbz32d24bGDkO+/0U=;
 b=kw4LpT/sdhoqhtXT42Rt3P3BJrv/KaQlYP2dVhGMk0b9SiY0FZktKp7OnAtBmnaf35
 f8w+f45uDbQTBkxmvk42AuXilOhqTXcdpELbgA5G7WO2YvTzrNGtVa1CDaa0tbm0Avb8
 FjbhWf+T8HKOXcxl+PpspcRiAzor6EODu3xQDT5Eo0EZ7Y5zzEhX6Jlujl9JeYvfmrk4
 6cQwSqMCL5rErSf06xcPo7IZ9CBn6uFp1OSb7Cpa+qXp1f6jwvRw/281GKZP20qOFZxo
 F7or7qowkLMzuJibnM95EgMlu+9wh28069MdRPe0pqr4UMgn77WVA/X9SyWRHH0vaHbC
 P59g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTlM1KR4Opv6RMPayBMiKuDgEGO9oKXARs88Xj8k2mUkTigwdrx7puAPCx5ZX3WVLp9+Q1OL+WUnU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyqu9N9IkEEiUw7rMjAzR4AlhN/1uvYeyQrA8gu2qvcff1DLCVX
 9yuKa1K4fNUWEKwJSaQAJZhMo0FGNH3IMsqtq0hD8xkPtL69kiClkUX4Wwd4/z+9fLFYCO6giRJ
 CatVvbdP0mO7Bx4T4pf9qiPVUB28nLdEQJpQaxnU/bEmPciL3QAJm2k3glVg9qhMKNaQZn7U=
X-Gm-Gg: ASbGnctCD1Fv8tHqKAd4zKQCE0rbn8vEVqsyYXDWOLuVf55eGDr+CQiIMmy8qwYvFzx
 oS+9Mh+9DSN9k1ns9fwhEHO93/uhyoMcQYnLw3g1SprqrxumB2VO38xUnoud0rtu6/G5qLJmlVh
 7C9DznbKvBhLYDzXvkKrPIA4/Heq8kKN6srf3t4GIegWildfRYDrztd09KzD0IPKq4GvCIUFybQ
 N590SYxc9Ah785ZPnxPcvPoNgcBbMEo9bp1KFdOqS5BOfj0tH8WnLP9CIltBsJlDtPq+7vq9eWe
 b/4wOy9cQXY9EZsyJaPVKmBb1rtvUkLoVaG+25t8qdasvX+VoYxgp0I5eRNNeuEnz3sXYefdeIF
 C7l+gWEUwOo3qv2UbJWT4AeTH7U4I0lMsA2RWu7eeYwTNuG0/BpSS
X-Received: by 2002:a05:620a:472c:b0:7d7:891:83f with SMTP id
 af79cd13be357-7e338d264c6mr486435685a.50.1752594644274; 
 Tue, 15 Jul 2025 08:50:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrxYhCkGKF/J8/9k5Ypj9qfEmAc1PmrxBkRJd163wQETFD40VBBA4U2idmT11OhS/43lnZgw==
X-Received: by 2002:a05:620a:472c:b0:7d7:891:83f with SMTP id
 af79cd13be357-7e338d264c6mr486430585a.50.1752594643555; 
 Tue, 15 Jul 2025 08:50:43 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55943b60786sm2308820e87.145.2025.07.15.08.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 08:50:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 18:50:37 +0300
Subject: [PATCH] drm/msm/kms: move snapshot init earlier in KMS init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250715-msm-move-snapshot-init-v1-1-f39c396192ab@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMx4dmgC/x3MQQqAIBBA0avErBtIS4KuEi0qx5qFGo5EIN09a
 fkW/xcQSkwCU1Mg0c3CMVSotoH9XMNByLYadKdNNyqDXjz6eBNKWC85Y0YOnHFTzjlrhqEfLdT
 4SuT4+cfz8r4fE4pXNmgAAAA=
X-Change-ID: 20250715-msm-move-snapshot-init-b1fffd54437d
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3669;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=uVU4qfB9epMCD8J3LDlRZCEMKms3Mo4AdZkgzHl680A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBodnjRCX8PRuLqC3PhqWisV8FTS/LZBRS33D4vt
 9r54Nq5mImJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaHZ40QAKCRCLPIo+Aiko
 1TemB/wOWabSbpAVUdpuqEgBsVBkcM4kWTZlNSLw8MTSO8yEie3avz/PZOJbEqbH39/8WwNKErB
 0fGXWGf19X964Zk91BWY7sjnUS2t9G5orqYoJChUdfNXcDQTglHpqrlPtNy5UTYmAp6xWXu8879
 vu6q9lv3QkF39V6/klZ9iRl0LS++VPxUAS8wMAtaBNSRTHQk0j2wNFurnyjIXoGBy5QYO+4ENj6
 +8FS3PtXYTDStz1jgzgV2iwWoidl28EbABqQiE1fEbPKO3DXB4+HQKfQ0E1lnuugGjh1+vxBLhH
 bOPmbM8E/SXXfA+hk/PFeEMerXDhfjeQTuZQAjF/SkU2wPRV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: fxnOsbL1fqaQ2jsx2xPNs8gHn1IpyqTh
X-Proofpoint-ORIG-GUID: fxnOsbL1fqaQ2jsx2xPNs8gHn1IpyqTh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE0NiBTYWx0ZWRfX6rmyEeOoT/Kq
 4i5r+EOtSn9Fc0QAtbxZhfj2EDAYfVMlM73KOGXreDKTgrhQAsl0bnJHQjgOUeigfT+IDU+32wx
 zp8clyOs/JLlJGDZZ7kr2JbiWQPsZF8cPu0qmYER77YQALsWeRtjQfW+ZTObYYxzjx/0eK+BxrD
 U6uRG7DRGWAzsxXJqRuvzNuQKeCyBFLMkiZDdJ67uuswm4dvadiRVCWL6wkDSntr4JrAiuKBtAl
 MQl+PTufPIQOkQXSUvfdHaIlpUz5XobiFAVF1A++D7x6cD9YHJGRQae84E7b0gfjpA8rot08y7o
 fUhYVCbJpDuB4EWZElHxBdRP2Dka/3c66axXRtetf+OjcayBX1g1QFyjHzzz/0QChCrrtjA2j7E
 CBzV/lhPxxbzHLQZOcU3NvbeHmsog/DeEpaNWdcmEs6YWAnERg+p871vFcErtBlus8tryjNj
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=687678d5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=B_53bHkj_faIvDvQsBsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150146
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

Various parts of the display driver can be triggering the display
snapshot (including the IOMMU fault handlers). Move the call to
msm_disp_snapshot_init() before KMS initialization, otherwise it is
possible to ocassionally trigger the kernel fault during init:

  __lock_acquire+0x44/0x2798 (P)
  lock_acquire+0x114/0x25c
  _raw_spin_lock_irqsave+0x6c/0x90
  kthread_queue_work+0x2c/0xac
  msm_disp_snapshot_state+0x2c/0x4c
  msm_kms_fault_handler+0x2c/0x74
  msm_disp_fault_handler+0x30/0x48
  report_iommu_fault+0x54/0x128
  arm_smmu_context_fault+0x74/0x184
  __handle_irq_event_percpu+0xa4/0x24c
  handle_irq_event_percpu+0x20/0x5c
  handle_irq_event+0x48/0x84
  handle_fasteoi_irq+0xcc/0x170
  generic_handle_domain_irq+0x48/0x70
  gic_handle_irq+0x54/0x11c
  call_on_irq_stack+0x3c/0x50
  do_interrupt_handler+0x54/0x78
  el1_interrupt+0x3c/0x5c
  el1h_64_irq_handler+0x20/0x30
  el1h_64_irq+0x6c/0x70
  _raw_spin_unlock_irqrestore+0x44/0x68 (P)
  klist_next+0xc4/0x124
  bus_for_each_drv+0x9c/0xe8
  __device_attach+0xfc/0x190
  device_initial_probe+0x1c/0x2c
  bus_probe_device+0x44/0xa0
  device_add+0x204/0x3e4
  platform_device_add+0x170/0x244
  platform_device_register_full+0x130/0x138
  drm_connector_hdmi_audio_init+0xc0/0x108
  drm_bridge_connector_init+0x318/0x394
  msm_dsi_manager_connector_init+0xac/0xdc
  msm_dsi_modeset_init+0x78/0xc0
  _dpu_kms_drm_obj_init+0x198/0x75c
  dpu_kms_hw_init+0x2f8/0x494
  msm_drm_kms_init+0xb0/0x230
  msm_drm_init+0x218/0x250
  msm_drm_bind+0x3c/0x4c
  try_to_bring_up_aggregate_device+0x208/0x2a4
  __component_add+0xa8/0x188
  component_add+0x1c/0x2c
  dsi_dev_attach+0x24/0x34
  dsi_host_attach+0x68/0xa0
  devm_mipi_dsi_attach+0x40/0xcc
  lt9611_attach_dsi+0x94/0x118
  lt9611_probe+0x368/0x3c8
  i2c_device_probe+0x2d0/0x3d8
  really_probe+0x130/0x354
  __driver_probe_device+0xac/0x110
  driver_probe_device+0x44/0x110
  __device_attach_driver+0xb0/0x138
  bus_for_each_drv+0x90/0xe8
  __device_attach+0xfc/0x190
  device_initial_probe+0x1c/0x2c
  bus_probe_device+0x44/0xa0
  deferred_probe_work_func+0xac/0x110
  process_one_work+0x20c/0x51c
  process_scheduled_works+0x58/0x88
  worker_thread+0x1ec/0x304
  kthread+0x194/0x1d4
  ret_from_fork+0x10/0x20

Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Fixes: 98659487b845 ("drm/msm: add support to take dpu snapshot")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_kms.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 6889f1c1e72121dcc735fa460ea04cdab11c6705..56828d218e88a5fa597755c8ea20da781929386c 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -275,6 +275,12 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	if (ret)
 		return ret;
 
+	ret = msm_disp_snapshot_init(ddev);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "msm_disp_snapshot_init failed ret = %d\n", ret);
+		return ret;
+	}
+
 	ret = priv->kms_init(ddev);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "failed to load kms\n");
@@ -327,10 +333,6 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 		goto err_msm_uninit;
 	}
 
-	ret = msm_disp_snapshot_init(ddev);
-	if (ret)
-		DRM_DEV_ERROR(dev, "msm_disp_snapshot_init failed ret = %d\n", ret);
-
 	drm_mode_config_reset(ddev);
 
 	return 0;

---
base-commit: 8290d37ad2b087bbcfe65fa5bcaf260e184b250a
change-id: 20250715-msm-move-snapshot-init-b1fffd54437d

Best regards,
-- 
With best wishes
Dmitry

