Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHYDJW2mnGklJwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:11:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B5817C15A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:11:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58BDD10E43D;
	Mon, 23 Feb 2026 19:11:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pqFA/fbd";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IEMkFCBp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C2010E43D
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:11:37 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61NI5uvL1851867
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yRUzuJcFHmAaqmAyK9hpXfuGmZiOZ8PtVGzanUhu6Dk=; b=pqFA/fbd40J7GH0t
 61FyLOwfDSBvbMB0H48uB5tQBf1nMdwKyi7biOEudmKNLtZaCsHYrrY/RnXrULD4
 w4yAWFNMhi50p0mUeEzxYnRpAxzUsKqBh/pCA3yKoiiWVnVijCCw2Lr6ocNjAwS/
 yo/iHekskfL7+jZGq0dYD6AMhCUsw+aYBjxRqJigwofNqsASS6DqjbDCKDNjGeva
 ZhR57O96hFB0Ppr3UBZXQqFPhusEZciHCQ7Q0HMY+qI2KySKOkAPwz4wCWfSFwRv
 gVh0g8+HS7qHnwJT/iBLrycvZyJHCNIIhltkojxsTRyuAREntcMXPozM3Ft9BD7K
 1QpTdg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgte8rhk8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:11:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2aad6045810so47861295ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 11:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771873896; x=1772478696;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=yRUzuJcFHmAaqmAyK9hpXfuGmZiOZ8PtVGzanUhu6Dk=;
 b=IEMkFCBpGI+pOM6TfY0PJ0TuiTKk27Hn0o1jkjRKM/16Diiey5PsNa8Vmx8tcRnkvt
 uEL2GG1dXiCPyBGgDZNbgWsWY8E5zi5Q31I8NcDvKkL9cgx/P41bTPygr27CCFaa04zX
 f4Ar18jTGVcI7hyu1CYTExP2Ph1akwqd+2YSiqx141f1nW3ebansxW7YBOyavdzMntIk
 oHyRQwP4gBJXhr8Ujyy2DNwQMChS5yQRwbwJ96HT3TPuhjuJ4Sgii2mOhvjcMlD4VlcU
 9WfTuXcCepYup8RSR5gvbBlUDeAFSxxJ9vNosQBtHPkn+j8jDorwOnXsi9BZUEvcB1qN
 qt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771873896; x=1772478696;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=yRUzuJcFHmAaqmAyK9hpXfuGmZiOZ8PtVGzanUhu6Dk=;
 b=fdbxg8SyxGk4b1fNq94xVVq00Zn0clpmCdnQsokQWBm+OwcRzhUnb1s/D29eA29yOJ
 90MjjEJghi8uRA2VFzAapIyp+ccA07Z4rLVuLfDuK+MEytPQ/84PoCnWW5HIpCUBDR5y
 eoTOntiq/oZDhx3DbGnCaUEy1zsll05xYaXgH5lR6YHNScCQ9hd9cn5mff2FKbgk8rvS
 IWu3ulxy/VyjM7sWK7DFOQ9FetBUk0lzdZ/+2BY+/qitVtt6im7JKn92faHhyHCEXIOk
 rTbxhaBI+9YHnzNo+KWhslrvj7d1+/m3gf9hDzPT1gTYwx2eGwlZG88qNtqKSvO5WjLX
 aQuw==
X-Gm-Message-State: AOJu0YyVPm1mMIJVs56iZomdlmDC11yVgRl8m/jDxrW4tQ7idv66RBmw
 8MO+ZtRv5aSL4zFhtPlrQQkcn3YrKfeCASxl4sY6/X1+WrM3c15xqvIe+HqDYJFW/opT4DCEUZx
 hV9jb7JL9PtOSecuLz5M5z1GVvVCJ0xUGEjuGuLRok4VZvSjBP4rtVeGPmUe/KwhSAm6a5xs=
X-Gm-Gg: ATEYQzyRgcE4i/5zDYQroVrIV/zV1g7V42BUpbII52EFLAUog15GTSfUT75BUdsCjQK
 nBjZCC5A0jzEakO4y7yHvZ99w6hoJRbr3Ar/ZdmUlSIkhidpeN+B/q4UkHoWmY6/TTzgnF8SI3e
 J41qUVXQxNsEch3rrPM9axQHipVE+5t6spJoQ+MWDnYkQkr2lMFJm8NyCiHqzPzOCFZ22M8RgBj
 RqzGzeVq8xduz5od5JwSUBm/7W2UHOyh9zPptidsVcHdYDUFnhVRLlMnDoyuidV/L1tAEyvE38b
 edG5FWiY5z4L8cz97JudxBRzgHvKeUJk3xyZ+Ks6FHHcX5ziPGb2JZLEiWRqcsmO8JOyselsqCA
 5/Qowhy9oYwNy1WfNXa+DZv/59JTMlMpH+pshTLIhd03WnExTNkxIMg==
X-Received: by 2002:a17:902:db02:b0:2a5:8c1c:744f with SMTP id
 d9443c01a7336-2ad74525046mr99741225ad.40.1771873895860; 
 Mon, 23 Feb 2026 11:11:35 -0800 (PST)
X-Received: by 2002:a17:902:db02:b0:2a5:8c1c:744f with SMTP id
 d9443c01a7336-2ad74525046mr99740985ad.40.1771873895387; 
 Mon, 23 Feb 2026 11:11:35 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad74e34e18sm83501505ad.10.2026.02.23.11.11.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 11:11:34 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 00:39:12 +0530
Subject: [PATCH RFC 18/18] MAINTAINERS: Add MAINTAINERS entry for QDA
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-qda-firstpost-v1-18-fe46a9c1a046@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771873753; l=1237;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=Lyy5sl15dqp/AXuBfl18EdJ2b3DY11ZJbm74AYUuJlc=;
 b=U2RuZmqfnOzXIV4uEy/q/+tEABjRAyjmepjpnCpXNvRPVQEY3N8FyXUwnOR4IQspDW9EJCN6r
 /BSlCMecuL/A6nXKoi/ZCcCSKbs/ob1ERp+7UwIQROKZVvMOxgaov2G
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-ORIG-GUID: _MPcXfSf_9MsrRXP6gOqMi_g3usssP0z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE2NiBTYWx0ZWRfXy8m9hO0W0k5m
 Bg3zsSlnZFdzIPrdGdQuc5JQv5FVDsp8qhKzUElkwAPGKvPEn5qu/GMYDIKxfXxgBmwsuExs2Dg
 yyqdTaU1gXcU3187Cqu8xm1RfV9k9m45Bg359NIkY2I913e+Nt5v5yiVkoFP+Hqp8U+E1E0pmRQ
 ds2Z4Qd5mr4p40UgjK7HmsikEzXENeSEoKmjxeBoKUDN/ebIRc/wF/yKJEVWN0R9T8UHl78LVlv
 SXZJBvmogNcRxYKPBtzkLajX/FesnrpaYqSO7pT75CXQmxV+HKi9KS5c1qTLIg84AJucd5/AAqr
 KGOjfh/FohM3k8mIC7AiBqmIT9lvqX9UtxHWjL73amw4NDC99Npl4hzPDJSs+nvyK8zSaxSNFas
 PtAMRljql8jYxaVJO8qDBy51FvRR1xKx9Vnq1YPigIsInI/1iFZ5ksKvg46OHBw6EY4P8zQaYO6
 KM6U0Bof6csN1VbFykA==
X-Proofpoint-GUID: _MPcXfSf_9MsrRXP6gOqMi_g3usssP0z
X-Authority-Analysis: v=2.4 cv=WqQm8Nfv c=1 sm=1 tr=0 ts=699ca668 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=DP9mDQDU2fd_VHYdcv8A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,lists.freedesktop.org:email]
X-Rspamd-Queue-Id: F3B5817C15A
X-Rspamd-Action: no action

Add a new MAINTAINERS entry for the Qualcomm DSP Accelerator (QDA)
driver. The entry lists the primary maintainer, the linux-arm-msm and
dri-devel mailing lists, and covers all source files under
drivers/accel/qda, Documentation/accel/qda and the UAPI header
include/uapi/drm/qda_accel.h.

This ensures that patches to the QDA driver and its public API are
tracked and routed to the appropriate reviewers as the driver is
integrated into the DRM accel subsystem.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 71f76fddebbf..78b8b82a6370 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21691,6 +21691,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/crypto/qcom-qce.yaml
 F:	drivers/crypto/qce/
 
+QUALCOMM DSP ACCELERATOR (QDA) DRIVER
+M:	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
+L:	linux-arm-msm@vger.kernel.org
+L:	dri-devel@lists.freedesktop.org
+S:	Supported
+F:	Documentation/accel/qda/
+F:	drivers/accel/qda/
+F:	include/uapi/drm/qda_accel.h
+
 QUALCOMM EMAC GIGABIT ETHERNET DRIVER
 M:	Timur Tabi <timur@kernel.org>
 L:	netdev@vger.kernel.org

-- 
2.34.1

