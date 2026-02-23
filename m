Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cA9GOlKmnGkYJwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:11:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF6217C113
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:11:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B2D10E43A;
	Mon, 23 Feb 2026 19:11:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VaMxXBFG";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AiuOTez/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C672E10E43A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:11:08 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61NGFSV63936387
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hyVWr6Qau3rhDJHT+sQwBpb2oQCOb8Vk2I9d75FaZu0=; b=VaMxXBFG93TIrk2d
 Dg8CUSu3Ouswh19mxirbiUlrO8SFCYUxvRL7lS6ly1ked5N697QC1S3KfBTw6VwK
 BgsPr5xGTzLipAkUp81HBcwJxWmEd3VoPF1u/2wv4GBugO3ptAj2gauAX+sE/BRt
 +Q3hqtdR5EhCQfR3RhhysO6QVFyFC0TSvcYWI+BobF/TpsxGGlhNagOYK26wjc3G
 +EfadqkG35CbLLykuHWSXMUep72l24B9l8XICsxgQRMdVB4kcbva6bt8dGSeccVO
 tcSpNSD4w/YtyI9hr08PmbQmthPtKHqcQyCFyw0fv1R9+jV+sMQSpGdkWXdjyL/H
 q4xE/A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgt8mgjnk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:11:07 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2a7a98ba326so70509945ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 11:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771873867; x=1772478667;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hyVWr6Qau3rhDJHT+sQwBpb2oQCOb8Vk2I9d75FaZu0=;
 b=AiuOTez/FjZSX3T6T+McTfEO9U8/4ZJsrkmFaPvX1PM/qOqhVAYejaor4Q+jDKSQo2
 3xWKxPHir6YgJxNOnFWKReDlQeviTHENrhgWosuJBhxeV5W+UGuC6pdIaFxb0rL5Y0tr
 AWp1vkJPYPufIk/9POWYQClC+Ob/B07jtOXQqOEeFRHlg8CGzseVpNi02txgvQ/2sAsW
 flWiisJzDLRDzngj1fKrytF31Xa1Mb+JdeEFsNnRUiNxyAekNGaEFEsiOkg/V7BR44J5
 0oOkMdPDyqyaZtB9tS/eT2j/NANclva5NIpORBWLfSk0foMlLRjXm8XtFJzYV3v4hEOM
 JR/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771873867; x=1772478667;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hyVWr6Qau3rhDJHT+sQwBpb2oQCOb8Vk2I9d75FaZu0=;
 b=Frh0vM3NFSJlGdJN1VqTvor53o5eHlncusUbrdG7OKH7P3R+peyqqVoQOYeA4fO0Jj
 OIS6n/ynP3nbp+FTB/C9zBBKad9w2W1sw3PUxUDrAkQn6xsSkyT6VqmxqE0aTEQPwPuI
 3dRrs4WmR2BmPtzhJVltABBl3VbDPp7n50qZhjJjGp1yf8V3wDhEwZXlZiyffk6mtNNp
 gf0C4zhbvTWjBSFA3EOeFRxqmBiXKRDgoLc2N8kNv9KIROLZnX91CmyJOFYlkYz/i3cr
 6vf7eYZTof1wUqZXYcAbAzqnUMd45GDraHo4vYqjzEntexUKDAvq4ZZB6aNCP2OBoXfz
 TKqQ==
X-Gm-Message-State: AOJu0YwP4Q0pFIFUTLq4Yfw06Mlek7bXAfdKe1EWUFB3nOLKrDZKWiF7
 d22JaDW12spQCBFJXLUtqwc9eXNECNzkpz14nxQiPEoqqS++OXDSqPnuMNK4/AMJXN3IHZXMeWj
 Cwex4d6Z8hp6Wo+/nXtnjq5papK3Rny8VYNh+DS7Bl1hwZoXIRQaiUcfJBJ7v94APe34fnHg=
X-Gm-Gg: ATEYQzx49a8PlXKqbghG1kPmRI7Sz+d67zkndmtD8mvUwYITuyPiFC4bUqGIaKh0pBp
 h+E3NtlVWPPgoEBBEF2mahdscR0KUon6OcOt7sYuB7J8zTaojZBEXmfCePpYBnKhyKJD90iD3Xq
 PYgy8FGFz8tNrov/4bm4QY1qcGf5vvQRnP9bijZ6/CbAna4HLNtfSZDkAApKb+6ecsaACiuu6Bu
 SAs1guUpMqcbR25MyQrvHEtXTzPwYeFqHbEhuZHOI5bMW+DH9Amh+1fMXjVeXDIwPSLGSTZ+WcM
 3p6i5uffC+ICRNqFPkALMRlF6T3JJWFAwKDws0ZpN+EzQ6XuEEvzwRE8nwW77lj/xnOBAsKgH10
 9E5rSsvo2/aqlmIEbnQn+tIAjSEHS3nGOjTjZxcaQIyfENeomSTVVcA==
X-Received: by 2002:a17:903:388d:b0:2a9:4c2:e50 with SMTP id
 d9443c01a7336-2ad742841f4mr98514235ad.14.1771873866479; 
 Mon, 23 Feb 2026 11:11:06 -0800 (PST)
X-Received: by 2002:a17:903:388d:b0:2a9:4c2:e50 with SMTP id
 d9443c01a7336-2ad742841f4mr98513765ad.14.1771873865955; 
 Mon, 23 Feb 2026 11:11:05 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad74e34e18sm83501505ad.10.2026.02.23.11.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 11:11:05 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 00:39:08 +0530
Subject: [PATCH RFC 14/18] accel/qda: Add FastRPC dynamic invocation
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-qda-firstpost-v1-14-fe46a9c1a046@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771873753; l=8065;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=LP9i9ig3VGFbL0Tg+t9lMqkV/Cy5BCef5+MBvLQoGoo=;
 b=MMaaD/3fgwctLex7y+a1+TjziqZMaPbxIFndYu5wqWZj3DdR9N3avZnwlgQUVmh/wq/G1Mj4F
 THPXli9Fs4RASCdG3h3jMVTjKpg2a6ExM41ymAu16lbjaw1zWtuF1Ij
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Authority-Analysis: v=2.4 cv=J/unLQnS c=1 sm=1 tr=0 ts=699ca64b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=e3qgzkqCo8F0wNjWc_sA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: hglp1eUJih__4xAJusitbSCwbWj30J7W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE2NiBTYWx0ZWRfXygceaPiF245s
 74IGmIdYQfU2HJRJ8lqFL9BAtKoROAFR/SuT6KFPP+WujbvGmQO7w/XYwvnZGn2yp6aot6kaIMn
 RiC/PMx/sqfaROej8rQyOfeRSmYCwyns7fW9RLlTQX+yJskukmRf7Z/cMOhH6Rt+0fWRn234vOB
 /SxdwteNQJ3F4Io29zDNGRv0Z9mftccYxjM7sEufaW3jRYEy0VEMa9Y3NyuyC6VtEQhuMz9jfkW
 nBUH2/YrvPP+YXQpBlGHuiwBBAgetOeeUVScfz3VqUzmzmo3HwmMxqIVVFkU3vGrVJ3334J9yhM
 XYqvP03gLJjhhwxyrFxrc6sz9m7Ls4FraZhyhHkL9DV8NbTDaC6Al/02Dz5CzyTlpqTUCTIOOoT
 oLwGz5I99j5iMseu+G2Vx63xQ1UoN9d3KhyUH9z6NhMM7xWBU9ecSUyRkBhBGTgcbdKtIwAhgTo
 IeiQggAF690zuLBnXMw==
X-Proofpoint-GUID: hglp1eUJih__4xAJusitbSCwbWj30J7W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230166
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,inv.sc:url]
X-Rspamd-Queue-Id: 5CF6217C113
X-Rspamd-Action: no action

Extend the QDA FastRPC implementation to support dynamic remote
procedure calls from userspace. A new DRM_QDA_INVOKE ioctl is added,
which accepts a qda_invoke_args structure containing a remote handle,
FastRPC scalars value and a pointer to an array of fastrpc_invoke_args
describing the individual arguments. The driver copies the scalar and
argument array into a fastrpc_invoke_context and reuses the existing
buffer overlap and packing logic to build a GEM-backed message buffer
for transport.

The FastRPC core gains a FASTRPC_RMID_INVOKE_DYNAMIC method type and a
fastrpc_prepare_args_invoke() helper that reads the qda_invoke_args
header and argument descriptors from user or kernel memory using a
copy_from_user_or_kernel() helper. The generic fastrpc_prepare_args()
path is updated to handle the dynamic method alongside the existing
INIT_ATTACH and INIT_RELEASE control calls, deriving the number of
buffers and scalars from the provided FastRPC scalars encoding.

On the transport side qda_ioctl_invoke() simply forwards the request
to fastrpc_invoke() with the dynamic method id, allowing the RPMsg
transport and context lookup to treat dynamic calls in the same way as
the existing control methods. This patch establishes the basic FastRPC
invoke mechanism on top of the QDA GEM and RPMsg infrastructure so
that future patches can wire up more complex DSP APIs.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/accel/qda/qda_drv.c     |  1 +
 drivers/accel/qda/qda_fastrpc.c | 48 +++++++++++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_fastrpc.h |  1 +
 drivers/accel/qda/qda_ioctl.c   |  5 +++++
 drivers/accel/qda/qda_ioctl.h   | 13 +++++++++++
 include/uapi/drm/qda_accel.h    | 21 ++++++++++++++++++
 6 files changed, 89 insertions(+)

diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index 3034ea660924..f94f780ea50a 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -162,6 +162,7 @@ static const struct drm_ioctl_desc qda_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(QDA_GEM_CREATE, qda_ioctl_gem_create, 0),
 	DRM_IOCTL_DEF_DRV(QDA_GEM_MMAP_OFFSET, qda_ioctl_gem_mmap_offset, 0),
 	DRM_IOCTL_DEF_DRV(QDA_INIT_ATTACH, qda_ioctl_attach, 0),
+	DRM_IOCTL_DEF_DRV(QDA_INVOKE, qda_ioctl_invoke, 0),
 };
 
 static struct drm_driver qda_drm_driver = {
diff --git a/drivers/accel/qda/qda_fastrpc.c b/drivers/accel/qda/qda_fastrpc.c
index eda7c90070ee..a48b255ffb1b 100644
--- a/drivers/accel/qda/qda_fastrpc.c
+++ b/drivers/accel/qda/qda_fastrpc.c
@@ -12,6 +12,16 @@
 #include "qda_gem.h"
 #include "qda_memory_manager.h"
 
+static int copy_from_user_or_kernel(void *dst, const void __user *src, size_t size)
+{
+	if ((unsigned long)src >= PAGE_OFFSET) {
+		memcpy(dst, src, size);
+		return 0;
+	} else {
+		return copy_from_user(dst, src, size) ? -EFAULT : 0;
+	}
+}
+
 static int copy_to_user_or_kernel(void __user *dst, const void *src, size_t size)
 {
 	if ((unsigned long)dst >= PAGE_OFFSET) {
@@ -509,6 +519,41 @@ static int fastrpc_prepare_args_release_process(struct fastrpc_invoke_context *c
 	return 0;
 }
 
+static int fastrpc_prepare_args_invoke(struct fastrpc_invoke_context *ctx, char __user *argp)
+{
+	struct fastrpc_invoke_args *args = NULL;
+	struct qda_invoke_args inv;
+	int err = 0;
+	int nscalars;
+
+	if (!argp)
+		return -EINVAL;
+
+	err = copy_from_user_or_kernel(&inv, argp, sizeof(inv));
+	if (err)
+		return err;
+
+	nscalars = REMOTE_SCALARS_LENGTH(inv.sc);
+
+	if (nscalars) {
+		args = kcalloc(nscalars, sizeof(*args), GFP_KERNEL);
+		if (!args)
+			return -ENOMEM;
+
+		err = copy_from_user_or_kernel(args, (const void __user *)(uintptr_t)inv.args,
+					       nscalars * sizeof(*args));
+		if (err) {
+			kfree(args);
+			return err;
+		}
+	}
+	ctx->sc = inv.sc;
+	ctx->args = args;
+	ctx->handle = inv.handle;
+
+	return 0;
+}
+
 int fastrpc_prepare_args(struct fastrpc_invoke_context *ctx, char __user *argp)
 {
 	int err;
@@ -521,6 +566,9 @@ int fastrpc_prepare_args(struct fastrpc_invoke_context *ctx, char __user *argp)
 	case FASTRPC_RMID_INIT_RELEASE:
 		err = fastrpc_prepare_args_release_process(ctx);
 		break;
+	case FASTRPC_RMID_INVOKE_DYNAMIC:
+		err = fastrpc_prepare_args_invoke(ctx, argp);
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/accel/qda/qda_fastrpc.h b/drivers/accel/qda/qda_fastrpc.h
index 744421382079..bcadf9437a36 100644
--- a/drivers/accel/qda/qda_fastrpc.h
+++ b/drivers/accel/qda/qda_fastrpc.h
@@ -237,6 +237,7 @@ struct fastrpc_invoke_context {
 /* Remote Method ID table - identifies initialization and control operations */
 #define FASTRPC_RMID_INIT_ATTACH	0	/* Attach to DSP session */
 #define FASTRPC_RMID_INIT_RELEASE	1	/* Release DSP session */
+#define FASTRPC_RMID_INVOKE_DYNAMIC	0xFFFFFFFF	/* Dynamic method invocation */
 
 /* Common handle for initialization operations */
 #define FASTRPC_INIT_HANDLE		0x1
diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
index 1066ab6ddc7b..e90aceabd30d 100644
--- a/drivers/accel/qda/qda_ioctl.c
+++ b/drivers/accel/qda/qda_ioctl.c
@@ -192,3 +192,8 @@ int fastrpc_release_current_dsp_process(struct qda_dev *qdev, struct drm_file *f
 {
 	return fastrpc_invoke(FASTRPC_RMID_INIT_RELEASE, qdev->drm_dev, NULL, file_priv);
 }
+
+int qda_ioctl_invoke(struct drm_device *dev, void *data, struct drm_file *file_priv)
+{
+	return fastrpc_invoke(FASTRPC_RMID_INVOKE_DYNAMIC, dev, data, file_priv);
+}
diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
index 044c616a51c6..e186c5183171 100644
--- a/drivers/accel/qda/qda_ioctl.h
+++ b/drivers/accel/qda/qda_ioctl.h
@@ -63,4 +63,17 @@ int qda_ioctl_attach(struct drm_device *dev, void *data, struct drm_file *file_p
  */
 int fastrpc_release_current_dsp_process(struct qda_dev *qdev, struct drm_file *file_priv);
 
+/**
+ * qda_ioctl_invoke - Invoke a remote procedure on the DSP
+ * @dev: DRM device structure
+ * @data: User-space data containing invocation parameters
+ * @file_priv: DRM file private data
+ *
+ * This IOCTL handler initiates a remote procedure call on the DSP,
+ * marshalling arguments, executing the call, and returning results.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_ioctl_invoke(struct drm_device *dev, void *data, struct drm_file *file_priv);
+
 #endif /* _QDA_IOCTL_H */
diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
index 4d3666c5b998..01072a9d0a91 100644
--- a/include/uapi/drm/qda_accel.h
+++ b/include/uapi/drm/qda_accel.h
@@ -22,6 +22,9 @@ extern "C" {
 #define DRM_QDA_GEM_CREATE		0x01
 #define DRM_QDA_GEM_MMAP_OFFSET	0x02
 #define DRM_QDA_INIT_ATTACH		0x03
+/* Indexes 0x04 to 0x06 are reserved for other requests */
+#define DRM_QDA_INVOKE			0x07
+
 /*
  * QDA IOCTL definitions
  *
@@ -35,6 +38,8 @@ extern "C" {
 #define DRM_IOCTL_QDA_GEM_MMAP_OFFSET	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_GEM_MMAP_OFFSET, \
 						 struct drm_qda_gem_mmap_offset)
 #define DRM_IOCTL_QDA_INIT_ATTACH	DRM_IO(DRM_COMMAND_BASE + DRM_QDA_INIT_ATTACH)
+#define DRM_IOCTL_QDA_INVOKE		DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_INVOKE, \
+						 struct qda_invoke_args)
 
 /**
  * struct drm_qda_query - Device information query structure
@@ -95,6 +100,22 @@ struct fastrpc_invoke_args {
 	__u32 attr;
 };
 
+/**
+ * struct qda_invoke_args - User-space IOCTL arguments for invoking a function
+ * @handle: Handle identifying the remote function to invoke
+ * @sc: Scalars parameter encoding buffer counts and attributes
+ * @args: User-space pointer to the argument array
+ *
+ * This structure is passed from user-space to invoke a remote function
+ * on the DSP. The scalars parameter encodes the number and types of
+ * input/output buffers.
+ */
+struct qda_invoke_args {
+	__u32 handle;
+	__u32 sc;
+	__u64 args;
+};
+
 #if defined(__cplusplus)
 }
 #endif

-- 
2.34.1

