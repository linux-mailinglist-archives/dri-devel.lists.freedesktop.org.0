Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGeoJ/alnGkYJwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:09:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E59E17C066
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:09:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 489F810E443;
	Mon, 23 Feb 2026 19:09:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XdNsNsWv";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VAmO40sF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3314010E436
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:09:39 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61NIAtgI322296
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:09:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 S0JCApWIKIFxtoeFjcHtlOVvzzubuiNTLYafS3Jft1k=; b=XdNsNsWvxZaLB+WO
 1c9je4mRHs9lemIwzNeVaBTfpwvKr7B0M6jAGIFkItnEmwzraStnPI+eLsvh+Xg1
 9tqJOYWOtxI5zGygqqarte6g8YKv1SPyRAjTJDK/H1eUgLiAWwJbOlM+R5ZVO7Gu
 Zlidsi74Xn3WIUeJeLdS6qj+zGxJeuJaICoHVkiD27kVX2tzYfA0ZOwCh1kXu4+5
 JXAy4aZ6r6X+Z6maQBc488mYwlT3XgqPa5XsPeu0Kvlf54tMIfsLd/itCow9x1rM
 D5dq7NJNCG/xoZz2ALOSMmFhUqbSS2og4rxeBOS6jyP69+IusIvhhoGOhRfkNw7B
 1fcYwA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8y1m3v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:09:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2aad5fc5b2fso39177405ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 11:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771873777; x=1772478577;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=S0JCApWIKIFxtoeFjcHtlOVvzzubuiNTLYafS3Jft1k=;
 b=VAmO40sFpCwKAy2qPZgH0WRS4iCVSz94qWZYFvnKFxUjfCDdk9oGTMCCwzIH9zcqF7
 vaOzBIesi3k9iAOl1uqdV83ocs9B1wmh0+GZL83ons93TzvYFXAod8+yXrItL/DLGAQz
 vwnx3iDzYfWKawfrdQ9yuwTHk/QupqaTZPN9PxXs1Um1XZJ+jiXUC3VQMkZwrqLG/MSK
 8hUOdPuJSs2LxJGX6lfbMpZlne16hmtbSeMBIzEgtQMENCZLK/oWM6chPGEV0pL7ids+
 0t8VIGnFI5nh3Z1y0BR/4dVSw8fZw+a58XjQTnmJ6DRvNQJwvOKhxaZjCrBC5rw+mEaL
 Opxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771873777; x=1772478577;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=S0JCApWIKIFxtoeFjcHtlOVvzzubuiNTLYafS3Jft1k=;
 b=oL9dIJYaOvCylDyp8X+RHudOHb/9kz1l2gr5k4Dg2jPihMd9jpWo2mk+4xX1HvtA1k
 xEsu/RIjGwEiAoSsRVlfJUkQbOz9KXS7DDRx/dWphDMaZsti+CF9SLoHWFiGylW3GZ85
 UjSfbFcrTolnKmwOqBNMrm1WGBcfmmJneHOA0nkQVgJdhSzHZFULsEjb1EohbYsrM5aV
 9Sv4zqxD9UL2/6gu12WE8MvunO8zowMoHS1j01IGSFfaAHPwpw3G0IRGvhAuryIvudTP
 w4rLqEt0sid8Y95v4sj/P7fgEaw82ihaO7Olpqo/nIBsV4mQlh3khWcGgdRHVTzoXULE
 BGFg==
X-Gm-Message-State: AOJu0YwOf5JsmEN0Gt8p706xQ1NrAcnb1Y+Em7s49Zg0GpD9cTToC5V+
 oQiNYga5SBTiLlRVd2QLpSg9h28c9kKJtVDQnlpNUG+rxPh7sKYkF4XD2I1MUsNf3c9Md6cr8yw
 ghEVNXkOzjMzPQaE1TJz3Io1eoULb4uo5UeS0bVUS099WpH65rRu8cLtA5gg5+/JejlPtvu4=
X-Gm-Gg: ATEYQzylhmwZab+S1S9dILO5B3D1kT42R7/F6tqlPTJC3015RWjEEugSoorE8Qv/aPB
 ZZIqJDmnCt8D6aviNFFkfUcjoZZ8hZtSYqBKz2sP904y5/tnUjIjNP0aDOb8qHfyS5RYdI0uIQq
 0g+JwUF9b+ZWKeN8YPNXxJvKUz7as500HOdxo9SZjWoHxKsfSEHFb4fUyDpe8Zw0RV1X1CKc9jp
 aoVtK6ALx3xpiryZucY3qzu5Kh+Vr9/ax8DoJa/MbL9HCp9zLYcioZKht1hPLyvzryuoFbdJbLS
 kzA1s19WzKCBQoaKp3AJAq2nV89MkF6IydCHtccWAiReTRZK8KE2IRMv2wgb2aRzjf6GLDALqji
 OHv8/GgEFMpHMsHa8Y6P78cdufV1PLNP9t4mqs9/m90uUkAQ1h8Sm8Q==
X-Received: by 2002:a17:902:ce0c:b0:2aa:dee9:dcf4 with SMTP id
 d9443c01a7336-2ad7447b9a3mr88580595ad.25.1771873776832; 
 Mon, 23 Feb 2026 11:09:36 -0800 (PST)
X-Received: by 2002:a17:902:ce0c:b0:2aa:dee9:dcf4 with SMTP id
 d9443c01a7336-2ad7447b9a3mr88580215ad.25.1771873776239; 
 Mon, 23 Feb 2026 11:09:36 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad74e34e18sm83501505ad.10.2026.02.23.11.09.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 11:09:35 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 00:38:56 +0530
Subject: [PATCH RFC 02/18] accel/qda: Add Qualcomm DSP accelerator driver
 skeleton
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-qda-firstpost-v1-2-fe46a9c1a046@oss.qualcomm.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
In-Reply-To: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bharath Kumar <quic_bkumar@quicinc.com>,
 Chenna Kesava Raju <quic_chennak@quicinc.com>,
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771873753; l=4540;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=Iw0hzhN8TNwgA9xnHeYqChSsZ5/vTjuUaVZUYGjv0iQ=;
 b=6mfusuznwiKRoFz7lqPVV796aoLzrrTOSWeY7E+k/o91H+68GH9DCi4JNH+MgsD4WTZjhKMWZ
 rfXsJyoI0+sBQzXiPtXlgnu8MwGhwyzA7WTUYFVKS2pm+ZpHc4bQxcZ
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE2NiBTYWx0ZWRfX9hJ4c5n0E9PW
 WKbbgFtZgrVMBe5k2FZDBpHsD2zXLhfzbl4mOdPIV/Zk/NKh6IR2dT7hr1eqW/MgElM3vunBn9W
 MfHbJFO9rcjgpcOI/v9IGmpdRGiZf1TX3ETf6Bbf6ugymlCoP0OzczUCtMEJ2RDTa73/G0rmubB
 WGnhzYKOVnt+pnNTNYvac2zu9Mf6J6qQp+FExNCgibho5T/pLaAlp9XjqcQb24Nez+bRTPiwtPf
 6mx2sFXM6GbDi2bqk5StH+A8OtZcKaHRYVYNEJs6Gv96X0Rl15QSPcQPVpT2fN+DOYx+sjx4YnM
 aY3nD1C/Qlv/5K3zE5Zvf8Q0h1BH6ee/sS1n3LDiUtmpYjHSuiU9lAL97MU5ruwejkEeZiXIju6
 OX4ciTNjmXx9Ni7JquXHwI70hI/IUu2vrP2aQmsM3njw9BUsH11RLR11hvoQIxZQZQQYzkjqcwu
 nHZwq+8V832C3WSAJcQ==
X-Authority-Analysis: v=2.4 cv=edYwvrEH c=1 sm=1 tr=0 ts=699ca5f2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=YXnACfkLeW4vfmpQHhcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: p2q8PA-hAPr7HS0nSGUsei8sBrO0D5_C
X-Proofpoint-ORIG-GUID: p2q8PA-hAPr7HS0nSGUsei8sBrO0D5_C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230166
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,m:ekansh.gupta@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 2E59E17C066
X-Rspamd-Action: no action

This patch introduces the initial scaffolding for the Qualcomm DSP
accelerator (QDA) driver under drivers/accel/.
The new Kconfig option DRM_ACCEL_QDA integrates the driver with the
DRM/accel subsystem, and the accel Makefile is updated to build the
driver as a loadable module. A minimal qda_drv.c file is added to
provide basic module_init/module_exit hooks so that the driver can be
built and loaded.

Subsequent patches will add:

- RPMSG-based communication with Qualcomm Hexagon DSPs
- FastRPC integration for userspace offload
- DMA-BUF support and memory management
- GEM, PRIME and IOCTL interfaces for compute job submission

This patch only wires up the basic driver framework and does not yet
provide functional DSP offload capabilities.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/accel/Kconfig       |  1 +
 drivers/accel/Makefile      |  1 +
 drivers/accel/qda/Kconfig   | 29 +++++++++++++++++++++++++++++
 drivers/accel/qda/Makefile  |  8 ++++++++
 drivers/accel/qda/qda_drv.c | 22 ++++++++++++++++++++++
 5 files changed, 61 insertions(+)

diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
index bdf48ccafcf2..74ac0f71bc9d 100644
--- a/drivers/accel/Kconfig
+++ b/drivers/accel/Kconfig
@@ -29,6 +29,7 @@ source "drivers/accel/ethosu/Kconfig"
 source "drivers/accel/habanalabs/Kconfig"
 source "drivers/accel/ivpu/Kconfig"
 source "drivers/accel/qaic/Kconfig"
+source "drivers/accel/qda/Kconfig"
 source "drivers/accel/rocket/Kconfig"
 
 endif
diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
index 1d3a7251b950..58c08dd5f389 100644
--- a/drivers/accel/Makefile
+++ b/drivers/accel/Makefile
@@ -5,4 +5,5 @@ obj-$(CONFIG_DRM_ACCEL_ARM_ETHOSU)	+= ethosu/
 obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
 obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
 obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
+obj-$(CONFIG_DRM_ACCEL_QDA)		+= qda/
 obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
\ No newline at end of file
diff --git a/drivers/accel/qda/Kconfig b/drivers/accel/qda/Kconfig
new file mode 100644
index 000000000000..3c78ff6189e0
--- /dev/null
+++ b/drivers/accel/qda/Kconfig
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Qualcomm DSP accelerator driver
+#
+
+config DRM_ACCEL_QDA
+	tristate "Qualcomm DSP accelerator"
+	depends on DRM_ACCEL
+	depends on ARCH_QCOM || COMPILE_TEST
+	help
+	  Enables the DRM-based accelerator driver for Qualcomm's Hexagon DSPs.
+	  This driver provides a standardized interface for offloading computational
+	  tasks to the DSP, including audio processing, sensor offload, computer
+	  vision, and AI inference workloads.
+
+	  The driver supports all DSP domains (ADSP, CDSP, SDSP, GDSP) and
+	  implements the FastRPC protocol for communication between the application
+	  processor and DSP. It integrates with the Linux kernel's Compute
+	  Accelerators subsystem (drivers/accel/) and provides a modern alternative
+	  to the legacy FastRPC driver found in drivers/misc/.
+
+	  Key features include DMA-BUF interoperability for seamless buffer sharing
+	  with other multimedia subsystems, IOMMU-based memory isolation, and
+	  standard DRM IOCTLs for device management and job submission.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called qda.
diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
new file mode 100644
index 000000000000..573711af1d28
--- /dev/null
+++ b/drivers/accel/qda/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Makefile for Qualcomm DSP accelerator driver
+#
+
+obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
+
+qda-y := qda_drv.o
diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
new file mode 100644
index 000000000000..18b0d3fb1598
--- /dev/null
+++ b/drivers/accel/qda/qda_drv.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+#include <linux/module.h>
+#include <linux/kernel.h>
+
+static int __init qda_core_init(void)
+{
+	pr_info("QDA: driver initialization complete\n");
+	return 0;
+}
+
+static void __exit qda_core_exit(void)
+{
+	pr_info("QDA: driver exit complete\n");
+}
+
+module_init(qda_core_init);
+module_exit(qda_core_exit);
+
+MODULE_AUTHOR("Qualcomm AI Infra Team");
+MODULE_DESCRIPTION("Qualcomm DSP Accelerator Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

