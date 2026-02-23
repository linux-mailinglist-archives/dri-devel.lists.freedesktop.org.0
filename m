Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPH1KQWmnGkYJwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:09:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB1C17C082
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:09:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5529310E421;
	Mon, 23 Feb 2026 19:09:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RpEkL3VY";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g6KqfGKv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE8E10E421
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:09:53 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61NC2iJG3151827
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lsNmoBqASYHT9cEHp6wiIElpPi1KeWEI5rpj2+q1iIA=; b=RpEkL3VYvUKXqlya
 rYKRGcHWELDmVNYUNjnxgaIdhwD3KZgSYGrqLnKFuPWyuvoQM1Xt/tB8z+itdjaL
 hUMX7cRvkVeH1g+D5hG/1D5cI4Ai56L1IOftdKHXVO9Vaazy29/L5DUIYI7z2weP
 jzqBj92+V55qvY8gekJVzOhP4EhUq7Vjl8qBLKzi/7fi5OMOIVIIr1ZybznKDKaJ
 rLqgDg2+tvUKMjunp9+3WWW/IG8ukDYG21pMIKylZ0a0yqugjrbgXAENI4aHIQm+
 YuEhYfWYiDAF1iL+8ObVpGRdMq7Iv4sVPPiO4Y2Q6lpjgmnH0QNyyU2apjaYbDhh
 6QBuwA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgpj89byh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:09:52 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2aaf0dbd073so57487505ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 11:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771873792; x=1772478592;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lsNmoBqASYHT9cEHp6wiIElpPi1KeWEI5rpj2+q1iIA=;
 b=g6KqfGKvh0irZW1K/p789K02BnzVQgoQ1tTN6JEauNLjqQaIhZm1Zvdj0v1T8IwDNr
 o8sSoGAJsB31wcKi5zuN+63MKpw5ublzKPxUK2nfqVO4QFIerZDtd+OK9+szwPQaQ7Rh
 smijVomajtheLAl5cRDsCRT6Rk5Ty63EOkXVn5Tfy/D+7iKmVhLps/750Oml94DJC5Q9
 ZEJ+HlDrlKl4SOuw7JexlTbehgtqE2fQ1PwmO24mfj7ZUPhGkAzYLvQwIVj38OekLVrp
 eH9eCO7E8BshS4J6NQHfbKAgtK99JfLLSHJlCmRj8Fyv/ZI11KZPFwTlOtPreixKe6lN
 ZGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771873792; x=1772478592;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lsNmoBqASYHT9cEHp6wiIElpPi1KeWEI5rpj2+q1iIA=;
 b=Hmn/SVYIRWX1qARk6IKzUn17ppIPGDKHZkPdtPtbV7h6yS/kGtWxSMJq3g1VT/xkWi
 p/8H//hC+XFnbad5jPSzDa60BL6MUf8UIHX7SWsczGWPvqlolOhTqNcBgasT88AAnpSI
 +Z7qBLziRIRsW9U4nurt0zw19HoXhms+RvAdJkRfqhyuimVUf1R8S7UoQ4AsoaCO6to+
 V5qOqJjqbWs8lg9lMpHfe6LSs1MQHR4/GQ0zn0Hdi9Qn74ZZXQIyO0H6g4ral+MAXRFQ
 SdGYmyvcbZk92sM7OD5YOcJH37jQjeR64kKXw3wTA62cnrMizmQiy/CDQ6l08TyIwcoS
 f9iQ==
X-Gm-Message-State: AOJu0YyLu76d5ZmrvCxaSnwIJlVCZCdfUgqGpUGST9YuMVixynBAi6RH
 M1H8Wq7mAzjqg7/SoV6Zr35xEq3k1vKnSSEvmWHFAGLLaNEMX9cHCEJn4lYdEm9Flz4/B0sEBtI
 wQegXvbIaL9yefRYmcCDp1/JicK3xVV0Adlt1wQSvWh89r+o++XRQulLdZK9RFPCF7n8oXlk=
X-Gm-Gg: ATEYQzx0zXnX4510F1JYlFo6eiXArNLMrVRDCqEJmfGloQ7hvQlbcKzIgX88Z2k700u
 kL+rzAz79EJ5n9iSry/PlPaBQrMwxqtvXDRoh/U8SEzXRI3ztaMp6TCwc8mxpBLl5Vxbdc2zRRL
 /zc2ZjtYFpNgd35ux1AVG9zL9AR/YLYQrh5olur1E01tlEWUQgMtpec8IngDxdlvyIQSrZDqdIc
 V4T2FSCndAHyQYKUWdjfPyHekjmZ895l/grvf97SkX0pmwLQXyo2Vqxu9PaT9qYAazKU9aLn21C
 SpDAzINzWCnDhcl9N50YmYRyEyVjayRJ56ybmxM/fSfR2helzG1gGXOotU0+2V7pxLn8zdTCh5h
 BphziBwSjdigGA/ZffGT0VXBajOFJYBUBIYJG9gtbGv4Tlcp8oSlTVQ==
X-Received: by 2002:a17:902:ced0:b0:2a0:d629:903c with SMTP id
 d9443c01a7336-2ad74516615mr88514105ad.30.1771873791652; 
 Mon, 23 Feb 2026 11:09:51 -0800 (PST)
X-Received: by 2002:a17:902:ced0:b0:2a0:d629:903c with SMTP id
 d9443c01a7336-2ad74516615mr88513935ad.30.1771873791111; 
 Mon, 23 Feb 2026 11:09:51 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad74e34e18sm83501505ad.10.2026.02.23.11.09.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 11:09:50 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 00:38:58 +0530
Subject: [PATCH RFC 04/18] accel/qda: Add built-in compute CB bus for QDA
 and integrate with IOMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-qda-firstpost-v1-4-fe46a9c1a046@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771873753; l=4943;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=kVGIvUQYd8fYwcDgOBRxiOF7ByQocRT92vAbYBLm9bM=;
 b=rUIy5HgCLDRhZVp2IzTGLrvCMsULd21ubbtDKIPuQIn9m/tfFsvEGy2LbREw4uK3leLblRQUp
 ul4rak0R2xhAnwPvhY8PF/SfHK0rFwibTRGVhaul0H1g9UdEczMQ+K5
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE2NiBTYWx0ZWRfXzpRF6tgx7c+a
 mUgMlQp8vxdqVet8uj8YbCSM3doTDHxw2fw+HG7i+N/krnYDqIh+UMXMFTr3VyHhkus1Ae91nFT
 gDexcJUSELbGqLfW1diaLqfe/tMClUJdvPl8QX7MHhpAYWxRKjZuvdnylQRVxH0R0tBLPH4b/+1
 TPTQLqtDN5uqdZb3M8xYu6sSfE0VgjM7H88ISFaSs+H0igUglYnXqd3bVtMm1jUnf2+f02tRWSS
 Z4BJ4GKTvfeQnBzM9iDvnf4Jp5Svmds3HY7UpDGbTnNXr8voBccalSHBI6txR76hIPftkGAq+N2
 yi337Nsw8RVLgqYa4vOb2BDjrC7WLs/0p3SODgY5RZKj49RjCWOy465lBs4Vh/B2ht8abfiPfHu
 ilZEL0GUFMUf898gyurw3HfPYYPuoI96aC6pJi3WEaJn77Nn6UEy7Ikxk726OcMCu0Zce54jzN1
 d4CA+KpXvBSECzgJMWQ==
X-Proofpoint-GUID: cZ7rOr9RGtXrMe-Pfn_7uXz7CRG3QvSY
X-Authority-Analysis: v=2.4 cv=Z5Lh3XRA c=1 sm=1 tr=0 ts=699ca600 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Rss5_8j3o1z-bWaeIIsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: cZ7rOr9RGtXrMe-Pfn_7uXz7CRG3QvSY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 1FB1C17C082
X-Rspamd-Action: no action

Introduce a built-in compute context-bank (CB) bus used by the Qualcomm
DSP accelerator (QDA) driver to represent DSP CB devices that require
IOMMU configuration. This separates the CB bus from the QDA driver and
allows QDA to remain a loadable module while the bus is always built-in.

A new bool Kconfig symbol DRM_ACCEL_QDA_COMPUTE_BUS is added and is
selected by the main DRM_ACCEL_QDA driver. The parent accel Makefile is
updated to descend into the QDA directory for both built-in and module
builds so that the CB bus is compiled into vmlinux while the driver
remains modular.

The CB bus is registered at postcore_initcall() time and is exposed to
the IOMMU core through iommu_buses[] in the same way as the Tegra
host1x context-bus. This enables later patches to create CB devices on
this bus and obtain IOMMU domains for them.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/accel/Makefile              |  1 +
 drivers/accel/qda/Kconfig           |  5 +++++
 drivers/accel/qda/Makefile          |  2 ++
 drivers/accel/qda/qda_compute_bus.c | 23 +++++++++++++++++++++++
 drivers/iommu/iommu.c               |  4 ++++
 include/linux/qda_compute_bus.h     | 22 ++++++++++++++++++++++
 6 files changed, 57 insertions(+)

diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
index 58c08dd5f389..9ed843cd293f 100644
--- a/drivers/accel/Makefile
+++ b/drivers/accel/Makefile
@@ -6,4 +6,5 @@ obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
 obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
 obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
 obj-$(CONFIG_DRM_ACCEL_QDA)		+= qda/
+obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda/
 obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
\ No newline at end of file
diff --git a/drivers/accel/qda/Kconfig b/drivers/accel/qda/Kconfig
index 484d21ff1b55..ef1fa384efbe 100644
--- a/drivers/accel/qda/Kconfig
+++ b/drivers/accel/qda/Kconfig
@@ -3,11 +3,16 @@
 # Qualcomm DSP accelerator driver
 #
 
+
+config DRM_ACCEL_QDA_COMPUTE_BUS
+	bool
+
 config DRM_ACCEL_QDA
 	tristate "Qualcomm DSP accelerator"
 	depends on DRM_ACCEL
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on RPMSG
+	select DRM_ACCEL_QDA_COMPUTE_BUS
 	help
 	  Enables the DRM-based accelerator driver for Qualcomm's Hexagon DSPs.
 	  This driver provides a standardized interface for offloading computational
diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
index e7f23182589b..242684ef1af7 100644
--- a/drivers/accel/qda/Makefile
+++ b/drivers/accel/qda/Makefile
@@ -8,3 +8,5 @@ obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
 qda-y := \
 	qda_drv.o \
 	qda_rpmsg.o \
+
+obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda_compute_bus.o
diff --git a/drivers/accel/qda/qda_compute_bus.c b/drivers/accel/qda/qda_compute_bus.c
new file mode 100644
index 000000000000..1d9c39948fb5
--- /dev/null
+++ b/drivers/accel/qda/qda_compute_bus.c
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+#include <linux/device.h>
+#include <linux/init.h>
+
+struct bus_type qda_cb_bus_type = {
+	.name = "qda-compute-cb",
+};
+EXPORT_SYMBOL_GPL(qda_cb_bus_type);
+
+static int __init qda_cb_bus_init(void)
+{
+	int err;
+
+	err = bus_register(&qda_cb_bus_type);
+	if (err < 0) {
+		pr_err("qda-compute-cb bus registration failed: %d\n", err);
+		return err;
+	}
+	return 0;
+}
+
+postcore_initcall(qda_cb_bus_init);
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 4926a43118e6..5dee912686ee 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -33,6 +33,7 @@
 #include <trace/events/iommu.h>
 #include <linux/sched/mm.h>
 #include <linux/msi.h>
+#include <linux/qda_compute_bus.h>
 #include <uapi/linux/iommufd.h>
 
 #include "dma-iommu.h"
@@ -178,6 +179,9 @@ static const struct bus_type * const iommu_buses[] = {
 #ifdef CONFIG_CDX_BUS
 	&cdx_bus_type,
 #endif
+#ifdef CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS
+	&qda_cb_bus_type,
+#endif
 };
 
 /*
diff --git a/include/linux/qda_compute_bus.h b/include/linux/qda_compute_bus.h
new file mode 100644
index 000000000000..807122d84e3f
--- /dev/null
+++ b/include/linux/qda_compute_bus.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __QDA_COMPUTE_BUS_H__
+#define __QDA_COMPUTE_BUS_H__
+
+#include <linux/device.h>
+
+/*
+ * Custom bus type for QDA compute context bank (CB) devices
+ *
+ * This bus type is used for manually created CB devices that represent
+ * IOMMU context banks. The custom bus allows proper IOMMU configuration
+ * and device management for these virtual devices.
+ */
+#ifdef CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS
+extern struct bus_type qda_cb_bus_type;
+#endif
+
+#endif /* __QDA_COMPUTE_BUS_H__ */

-- 
2.34.1

