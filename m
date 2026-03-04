Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFPlEgM1qGm+pQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 14:34:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F28422007F1
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 14:34:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E5810E9DB;
	Wed,  4 Mar 2026 13:34:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="O/ztgHKf";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gFzBjCI1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A923A10E9DB
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 13:34:54 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 624BfNKb152707
 for <dri-devel@lists.freedesktop.org>; Wed, 4 Mar 2026 13:34:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=HLipzHtNz0347Atzc2Kkxo
 r/aWoCZHXx6S5h1We9pxs=; b=O/ztgHKf4sJ3GTya0BMnCjbcEojVV8FLSJD2xH
 M4151s99hWeeXSVyNSzlWwWQh90oAFV3nS87YpxP+FPDVTtAouzfJMoHiLlTgqbI
 UA5i1HJoIXEsCKodTQnZliSnAJTYPKx7yEGog9jdpYuoLzn1R3lJ+bKnbUNyODAT
 ipUMU45gf+99e1OI5zpr5NKo0kHSj0rngNFA4w/eKKDlpPCyv7e8yU4G8nV1uYuL
 j6vmye3cfYq2PnCX9a+U31HJ8Z1vXUySRD/lYjGZEuiK+ZTEYG1sURVxOMaU1bHR
 sYafzXGiZOfS48NtA9WRkITrY+SkZ6Vto9WQq7Bwg4wpNQ7A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp3tvks40-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 13:34:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-899edf01747so297387056d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 05:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772631293; x=1773236093;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HLipzHtNz0347Atzc2Kkxor/aWoCZHXx6S5h1We9pxs=;
 b=gFzBjCI1JL4YuhMLCAoxbInm2rJ+HW2Y7cXobZE/k9w7KifTupYLDxdEO2sbZtIu7b
 s40db1cQg3gjiibR1go1vnYdV9lFnvw6lNxuZODGbdgnPBBVB5SKXMYmeAOT4zIDwbJX
 dtnO1vol0PKz17Nn4+3BkPh0LEySpCQVWFYaX75yy+hq8sgukA55cn2mv/HO7E6bVW40
 QxVMYH13P4xVvfPHpRj6+X/b8o3RycQ5yCULxGXN1Hr30lSxWkovQmKBfATEh4u/5d1M
 0vGJOk2nlwrc3DYlRBnDfNu3HgGialBtWaxROOAFr/k/QytYwJk28YU+fpVbqvflXui+
 SloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772631293; x=1773236093;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HLipzHtNz0347Atzc2Kkxor/aWoCZHXx6S5h1We9pxs=;
 b=nB7gRetFfreKLXw6VTbZyJA0CkjuRmsoKtoBvben79rs5451taaqHbg998cqdLpReB
 t/Qe9TTLj+1IimrJqWcMU6CHp/XupNVbJRRHhXVpUfLUuSXFHNcXNsa+LIn+SKHVu5nf
 Cd9/88F8WAR+ZhHM2wdZEBo9lwFf4UJujI3NPDQLZj30VLME9aBa/AcLmGMCKELFWwti
 ZH9ZdhUVkhLFGVbI7nHAy/COX2Vud6eZvDpEGiUNFxolkrjpjTTq7TA1D63KG4mWpZQP
 9ifkUvz8lEG+ouSNuDRo5PcPEaqYJirfpnbfBIyPrspByK/qqo7J/vJBOrNy1fPCI3W4
 Ts7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhv8y0bN25QIiVAwy9cykxz2XFLqV9grYLOlYxmCUKO51mUDpGwgPQrv9mvCXV9ohtYccmx7y3YmM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJ4ePVIYpMqR8AIf+aEK7AZX7S2QLT2z069yeX0oGT5wYk7fOx
 laICuIPiv8ZJdfOwzFvCyU9zrbGvbVNdp8MDqzd/PNUYbi9qX7XES6qV1SI4n94t4USw5sQwHIN
 1+TGLdfUPBLbtoPebi7x6iiprnyoX8bQ96SEEDzIZ00o8IXBDv/Qa9GZN/2G9vrEEWmpwy4M=
X-Gm-Gg: ATEYQzxrfPbGCY+qlzaaiEH6tCgEiPTxfwefQ40hYNRiwByWUKpE5lEg5+L65T5G14u
 FG+ChT1uJpQBIVRkYxC4RmOhlsXvhr6ebm9xY3svms3b1/BctaFdVBcwXgCPRA7pMNgLiQ+5IiD
 8NhSP3D4zZOkjMtw2hHpNi20p4xTKxY+YSUd2FLcNC7lG7/JqEx4GRE7HwbBT7MOgWdEAuCop+J
 H/kBrWlpxE42JmMS70GJDpMv4ma0Y50c3CYLqUgSHqguCsIN5sySct6SNdJWxOtChg9bySTNC6N
 aDKwEAxKPTiR0HJbW/DehZ3ap/9XyLY6hWRgKD+GtXSUlaCyoJGad4V8WAvb9PNcFINr2rAKQoE
 x10tXTnqo3U75sqjVaVVgN+YcuhjTLA6xjGj/4LuuYkoiBf83+u2gnXl6YFSS6JQa8nTgH3ZVXP
 xKMQLBUUide4+UZ9iLnF+k/XweyjgvAqQArrg=
X-Received: by 2002:a05:620a:460b:b0:8c9:f996:81f7 with SMTP id
 af79cd13be357-8cd5afcaf8emr196315685a.81.1772631292939; 
 Wed, 04 Mar 2026 05:34:52 -0800 (PST)
X-Received: by 2002:a05:620a:460b:b0:8c9:f996:81f7 with SMTP id
 af79cd13be357-8cd5afcaf8emr196312585a.81.1772631292360; 
 Wed, 04 Mar 2026 05:34:52 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a12e0c9027sm227974e87.73.2026.03.04.05.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 05:34:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 15:34:48 +0200
Subject: [PATCH] drm/msm: restore GEM-related IOCTLs for KMS devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-msm-restore-ioctls-v1-1-b28f9231fcd2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPc0qGkC/x2MQQqAIBAAvyJ7TlCLor4SHaS2WiiN3YhA/HvSc
 RhmEggyocCgEjA+JBRDAVspmHcfNtS0FAZnXGtq0+hTTs0od+Si4nwfop23Xe9qa73poYQX40r
 vPx2nnD/PtDhtZAAAAA==
X-Change-ID: 20260304-msm-restore-ioctls-2a1792311a09
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2402;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=kD9iQZhrDCzY4iHY2Yf+yM62TAsQ6gaeXZOVKSytBo0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqDT7RUX3NLufZ0XzdhId4k4XcUaqtMAx9YB+X
 2ukgNDM1IKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaag0+wAKCRCLPIo+Aiko
 1e6YB/9DA+I0kSqsifjh+vpUo4Lg0gT2NC6G3GAAgwINLAKvRXg2wdNEggQ1KY68yjXoVD2mT49
 dn+O11mRX9ph6tBpRYsHUB/kz6USnQdQi5wmuBM4MVj/w6a/LOBEse+/BDtyD9igyyrx9ANeRiC
 qHRF0Liii2oAUyjhGnLbNj/0C+WayA1b6P7FJzNjfA6Zbpoi6hq5aXAH6lGolOFG79qeWcRXGf6
 oc7ZGXlpNVYlTxdvgN3aZsCgaYhPDzeN1CCuADX9kvMp9hIeGXBnK4JpwCh/ymTztoSlucNcQzg
 gQI9OMK7kC2p5a7zu7AF2I9NuF7QXyueDHMj/sbjCk3s19ad
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwOSBTYWx0ZWRfX5YPjYtIbH7jf
 CofwHE8plekg0LGWk0eVQyYGYXeod993tCqA2g0OBoRWAZLmzwmWPtuCBelBgsfW4rFcrudvxe8
 f0awy8bURbah5dk1YY6fUoQG1S7dgqysbPKgoCGrvY+TenaCnlwIyUFaA+wodpLG5U+PL+XrA5g
 MsiXqajvtJ7/NwU1jv0QJ/Coj/NfPhBbvC9vKfhUCb0fYdGlr6GJ5P1NMR2LLjGRSGas4Z11IZI
 DgWLata3gYv2uIhPbEzHazJ9f+wLRHdLx6wklpjSbVeupSLVSGvBlakMjyOQ/KRiBY1fJrzs+KQ
 +sP2pTFoHgwwk/KWR1USeQbcWpLNq1UaO9qZX+P50jzqZe01qwK0rb30jErBflgOZfE7bbrWXtk
 cxxl9r2lSUbnOvgZArH9kcdJLx4FL1wqG5bo4Sp/T45d7k4p/TRpfuF4WBAuMeLAwjc1E4TRSr1
 vyu2UQbQtKOC+jIOVOA==
X-Authority-Analysis: v=2.4 cv=VYv6/Vp9 c=1 sm=1 tr=0 ts=69a834fe cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=WIlXRQO1osv3555SrS0A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: bEp3vDPbl3m1juGbT4E6qZ8KkLqkXZjI
X-Proofpoint-ORIG-GUID: bEp3vDPbl3m1juGbT4E6qZ8KkLqkXZjI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040109
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
X-Rspamd-Queue-Id: F28422007F1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

The MSM GBM backend uses MSM_GEM_NEW to allocate GEM buffers from the
KMS driver, imports them into the GPU driver (msm or kgsl) and then
uses them for rendering / blending. Commit 98f11fd1cf92 ("drm/msm: Take
the ioctls away from the KMS-only driver") dropped all IOCTLs from the
MSM KMS devices, pointing out the need to use dumb buffers, however dumb
buffers should not be used by the GPU for rendering. Restore GEM-related
IOCTLs for the KMS devices.

Fixes: 98f11fd1cf92 ("drm/msm: Take the ioctls away from the KMS-only driver")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Note, here I assume that dumb buffers generally should not be used for
rendering. That doesn't seem to be complete truth as Mesa kmsro on MSM
devices uses DRM_IOCTL_MODE_CREATE_DUMB to create buffers for resources.
---
 drivers/gpu/drm/msm/msm_drv.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index ed2a61c66ac9..f82c9a36a166 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -799,6 +799,14 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(MSM_VM_BIND,      msm_ioctl_vm_bind,      DRM_RENDER_ALLOW),
 };
 
+static const struct drm_ioctl_desc msm_kms_ioctls[] = {
+	DRM_IOCTL_DEF_DRV(MSM_GEM_NEW,      msm_ioctl_gem_new,      DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_GEM_INFO,     msm_ioctl_gem_info,     DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_GEM_CPU_PREP, msm_ioctl_gem_cpu_prep, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_GEM_CPU_FINI, msm_ioctl_gem_cpu_fini, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_GEM_MADVISE,  msm_ioctl_gem_madvise,  DRM_RENDER_ALLOW),
+};
+
 static void msm_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 {
 	struct drm_device *dev = file->minor->dev;
@@ -868,6 +876,8 @@ static const struct drm_driver msm_kms_driver = {
 #endif
 	MSM_FBDEV_DRIVER_OPS,
 	.show_fdinfo        = msm_show_fdinfo,
+	.ioctls             = msm_kms_ioctls,
+	.num_ioctls         = ARRAY_SIZE(msm_kms_ioctls),
 	.fops               = &fops,
 	.name               = "msm-kms",
 	.desc               = "MSM Snapdragon DRM",

---
base-commit: ac47870fd795549f03d57e0879fc730c79119f4b
change-id: 20260304-msm-restore-ioctls-2a1792311a09

Best regards,
-- 
With best wishes
Dmitry

