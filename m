Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCykA1+mnGklJwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:11:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7888017C12A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:11:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE10210E438;
	Mon, 23 Feb 2026 19:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cd8dPuZp";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YOK534qc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9055210E43D
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:11:23 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61NIkRYh3698602
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HZaGUVE53+HTX2lkLB5p1TySzSvMtZiR+5hs3hFD9wg=; b=Cd8dPuZpje7fWAeT
 yxEByrcBsGi2F4lNVI3AN3QzaOy78t674wtLxB/yvNOdLIbP5svl4HTOc+hjxBT6
 WP4tuHywwZiyPjlRRGwSqZ/xUzE9XCLpU/sjFypeaRDyGBhWy4tMV2E3iJtWJ8tK
 UTl5hLEGABFHDUOSJ72j9YWqoickDpBkBDv0IU4Vh8NENuF1xG8W9uqvWhBa0gGE
 NJUfA7wnOujWFe4MNQSDPZlaHXrqoCMhzFMAlPOfWF8YQiFkfHkEzBAkODtZmuXI
 SmlGXBn6NmuKSOFi0npMihEmvAviMxO3p4/OlT2MHyAF8rJvs+VjFkwIPaV/Mqmj
 /EhmPw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn819mmg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:11:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2aadeb3dee4so384047515ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 11:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771873881; x=1772478681;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HZaGUVE53+HTX2lkLB5p1TySzSvMtZiR+5hs3hFD9wg=;
 b=YOK534qcubgTLUovAnUd1bo16/a/pBiCZOmqmCbAsHvZEDGYa3E04MaCKDLn7JtITQ
 pOXJZzL4RrUhBbTseaXG5uFPTw1/n6MP9zZ7NNJ0GJvNtn3zmjsDW3sWtDL9RzUM0IaQ
 G+HYMeqZjn4Oqp3ZoO7zt6+c7Q6Q7nNoZXX3im7PH8HFEHLRA/Na9ddm+utcKOjWwRsD
 qB2yqknnHzhRTZOwkkpKVlBuCBlKP7Q/EJ1kqSZwOQ3UFKBft0sxiQ1EJLwF1o+Xkhck
 lYYfgWP6xl0s0L1tnYd0vJUvUJ78MBrWDjKqVlsH6nUbx2MctnM7sFsb6hCwhN+Wj/jN
 /Q1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771873881; x=1772478681;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=HZaGUVE53+HTX2lkLB5p1TySzSvMtZiR+5hs3hFD9wg=;
 b=IHhunoJbkT27c5y4L4cQiEq+JHQP1HazDV5Zj+3cegphJPXdIVvVMFEt4d3xhgYNnU
 BQNxTVaRjaqoEh8cT5Yvo5Dz63ZfH8qyz7jchqkiUN5UcvGypuo8wCkCmE4UF46FhLEp
 C1ywbNATJQQEFvBCNvj2bDYGagqGnTM2ygjg0/KTbuXqSExXsE6NrjLsecpyW8jbobum
 zu6D7nlzTYC1y9ZamZPZPXhUKJttwgh2kYAFCQhQ4GGbH6Jip51MhZpEXmCQ0pChMZ4D
 ds5I3nWUw+WE8hVYcZUXCvJn1Viu8m4GyB2erNAYD8CEXjAVmx0yzNPvhISuMLWPCgPd
 kwRA==
X-Gm-Message-State: AOJu0YyejtfOFw4Lg8mq//uIfJsPU048s25J+ov7otqyIeMFY31IVKws
 ozG+iP0mNVbYLUwSS3b4azo+R6fmhPGgiXzSRUFPhy+f03GmGjXU6fcYBcIjx7XsmNy/o49wH+E
 oFEb35v6q2s4EMxFlAG7SIpqG+7dVxEc34zslj7p/SYRum9MQbWnNcB1YEwOd3OXtAbHBWcI=
X-Gm-Gg: ATEYQzyZnCAtgfYaeHk8gLdX7InFVYwu5UPZZP3DGEBmQce5ZUEBAMgt2lYdM69YzBB
 eHMtXBAQtbK4uHOJlvZH602B/I554mVEEfX5awbhu4n7yVOjvZGIQdo0mJ/CWesXSMHVvO6Vo1I
 IIV8rTzl+ThXLTFVayPEzEdUHu5oH16c4+1KWBIrtsxHbA+bqg+7xhWWgLalzJhvXFasCKO1a1X
 ENoDW6J9FbsMzVdA0/O91qRg8Ymk35NZqQxURnadQND37knxgOZu5mSR5hUhasSz0gUWK7gyCMr
 +KmGuephpof1GWggDQsp82xWemP9esmMrSgw7WUnd7PrUbvnCbNPUJTQkC+9TuZdQh5OZsbw3o0
 mNa1F/fzz+aNGLUQE+b89bJ2/krAeM0G9GVHwb+sMmI+ep/nByPnkPg==
X-Received: by 2002:a17:902:ce0c:b0:2aa:d04b:73af with SMTP id
 d9443c01a7336-2ad744e0f51mr85545105ad.30.1771873881309; 
 Mon, 23 Feb 2026 11:11:21 -0800 (PST)
X-Received: by 2002:a17:902:ce0c:b0:2aa:d04b:73af with SMTP id
 d9443c01a7336-2ad744e0f51mr85544695ad.30.1771873880713; 
 Mon, 23 Feb 2026 11:11:20 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad74e34e18sm83501505ad.10.2026.02.23.11.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 11:11:20 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 00:39:10 +0530
Subject: [PATCH RFC 16/18] accel/qda: Add FastRPC-based DSP memory mapping
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-qda-firstpost-v1-16-fe46a9c1a046@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771873753; l=17200;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=In824aYdTZtiBe3D/1mBer+pKP5XT1pFDVVL+e0V4wY=;
 b=4X9x+B3ZUgfatV9QCIxkEcWhNzkJJNPP5aWlq8gxklcmqruDEuqwEAGcBDXH+tT8om5k5Ab4I
 GyWBHirqRMnCCiAu7HVTDlFCVn/vGDp8b5GhSihOLsGdlv5FVVRi0/9
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-GUID: DXBpzIkJE06HsjoHMkKz_7PFL93XuEnf
X-Proofpoint-ORIG-GUID: DXBpzIkJE06HsjoHMkKz_7PFL93XuEnf
X-Authority-Analysis: v=2.4 cv=CbsFJbrl c=1 sm=1 tr=0 ts=699ca65a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=rEPeaROu6cVHm8VQ6AkA:9 a=VNHnRFp1g_w2UU4Q:21
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE2NiBTYWx0ZWRfXxVqkRmVS9SgF
 U3536tysmSar6IKSahWsaH0tpu1jINSWwIrCryWsUG78zvHnrtKbCi7X74nDSfakWFqh9F6suYk
 ELjwNbz+PEA2jVtD4SOx2nro1M6Ux0rxu24ink8UKD7B4rVUqkC9w2JB2di1fpZtuMs0fsQaTzK
 vn+XXUaWPFS8fmWrFfhG7yKi+sSk8GYQFNhQADh/IR8gvPgKkET0XiUyoshlnaJtt/VsXIX9kR/
 hs0ldq3db1oGMkqMY+auJp71fRqgHP7sy4cH36vYu3sZKNqsBWfFArE3+QsdC3AJnPJ5buK/cCn
 Y0QM4x5wWJHByUXJxh6UMYoUCVFlhEQRcccUIVFztFQa3+lRnxtYnjQZuVr/z4aNy8QFumYF5Mn
 8bZHcFl82N4fw/NxRkL9w26gIs4HVjen3Jz4Dw61ExP6o3/XS6ctIBJp4eIPTcpW0DJ0OlEIxbd
 MdPH8g7dJ7+hj54Lo8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 7888017C12A
X-Rspamd-Action: no action

Add a DRM_QDA_MAP ioctl and supporting FastRPC plumbing to map GEM
backed buffers into the DSP virtual address space. The new
qda_mem_map UAPI structure allows userspace to request legacy MMAP
style mappings or handle-based MEM_MAP mappings with attributes, and
encodes flags, offsets and optional virtual address hints that are
forwarded to the DSP.

On the FastRPC side new method identifiers FASTRPC_RMID_INIT_MMAP
and FASTRPC_RMID_INIT_MEM_MAP are introduced together with message
structures for map requests and responses. The fastrpc_prepare_args
path is extended to build the appropriate request headers, serialize
the physical page information derived from a GEM object into a
fastrpc_phy_page array and pack the arguments into the shared message
buffer used by the existing invoke infrastructure.

The qda_ioctl_mmap() handler dispatches mapping requests based on the
qda_mem_map request type, reusing the generic fastrpc_invoke()
machinery and the RPMsg transport to communicate with the DSP. This
provides the foundation for explicit buffer mapping into the DSP
address space for subsequent FastRPC calls, aligned with the
traditional FastRPC user space model.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig    |   2 +
 drivers/accel/qda/qda_drv.c     |   1 +
 drivers/accel/qda/qda_fastrpc.c | 217 ++++++++++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_fastrpc.h |  64 ++++++++++++
 drivers/accel/qda/qda_ioctl.c   |  24 +++++
 drivers/accel/qda/qda_ioctl.h   |  13 +++
 include/uapi/drm/qda_accel.h    |  44 +++++++-
 7 files changed, 364 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b67d5b1fc45b..e53a7984c9be 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1046,6 +1046,8 @@ CONFIG_DRM_TIDSS=m
 CONFIG_DRM_ZYNQMP_DPSUB=m
 CONFIG_DRM_ZYNQMP_DPSUB_AUDIO=y
 CONFIG_DRM_POWERVR=m
+CONFIG_DRM_ACCEL=y
+CONFIG_DRM_ACCEL_QDA=m
 CONFIG_FB=y
 CONFIG_FB_EFI=y
 CONFIG_FB_MODE_HELPERS=y
diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index 2b080d5d51c5..5f43c97ebc25 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -163,6 +163,7 @@ static const struct drm_ioctl_desc qda_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(QDA_GEM_MMAP_OFFSET, qda_ioctl_gem_mmap_offset, 0),
 	DRM_IOCTL_DEF_DRV(QDA_INIT_ATTACH, qda_ioctl_attach, 0),
 	DRM_IOCTL_DEF_DRV(QDA_INIT_CREATE, qda_ioctl_create, 0),
+	DRM_IOCTL_DEF_DRV(QDA_MAP, qda_ioctl_mmap, 0),
 	DRM_IOCTL_DEF_DRV(QDA_INVOKE, qda_ioctl_invoke, 0),
 };
 
diff --git a/drivers/accel/qda/qda_fastrpc.c b/drivers/accel/qda/qda_fastrpc.c
index f03dcf7e21e4..25b5d53ba2d6 100644
--- a/drivers/accel/qda/qda_fastrpc.c
+++ b/drivers/accel/qda/qda_fastrpc.c
@@ -487,6 +487,40 @@ int fastrpc_internal_invoke_unpack(struct fastrpc_invoke_context *ctx,
 	return err;
 }
 
+static int  fastrpc_return_result_mem_map(struct fastrpc_invoke_context *ctx, char __user *argp)
+{
+	struct qda_mem_map margs;
+	struct fastrpc_map_rsp_msg *rsp_msg;
+	int err;
+
+	rsp_msg = ctx->rsp;
+
+	err = copy_from_user_or_kernel(&margs, argp, sizeof(margs));
+	if (err)
+		return err;
+
+	margs.vaddrout = rsp_msg->vaddrout;
+
+	err = copy_to_user_or_kernel(argp, &margs, sizeof(margs));
+	return err;
+}
+
+int fastrpc_return_result(struct fastrpc_invoke_context *ctx, char __user *argp)
+{
+	int err = 0;
+
+	switch (ctx->type) {
+	case FASTRPC_RMID_INIT_MMAP:
+	case FASTRPC_RMID_INIT_MEM_MAP:
+		err = fastrpc_return_result_mem_map(ctx, argp);
+		break;
+	default:
+		break;
+	}
+
+	return err;
+}
+
 static void setup_create_process_args(struct fastrpc_invoke_args *args,
 				      struct fastrpc_create_process_inbuf *inbuf,
 				      struct qda_init_create *init,
@@ -517,6 +551,29 @@ static void setup_create_process_args(struct fastrpc_invoke_args *args,
 	args[5].fd = -1;
 }
 
+static int setup_mmap_pages(struct drm_file *file_priv, int fd, struct fastrpc_phy_page *pages)
+{
+	struct drm_gem_object *gem_obj;
+	struct qda_gem_obj *qda_gem_obj;
+	int err;
+
+	if (fd <= 0) {
+		pages->addr = 0;
+		pages->size = 0;
+		return 0;
+	}
+
+	err = get_gem_obj_from_handle(file_priv, fd, &gem_obj);
+	if (err)
+		return err;
+
+	qda_gem_obj = to_qda_gem_obj(gem_obj);
+	setup_pages_from_gem_obj(qda_gem_obj, pages);
+
+	drm_gem_object_put(gem_obj);
+	return 0;
+}
+
 static int fastrpc_prepare_args_init_attach(struct fastrpc_invoke_context *ctx)
 {
 	struct fastrpc_invoke_args *args;
@@ -658,6 +715,160 @@ static int fastrpc_prepare_args_init_create(struct fastrpc_invoke_context *ctx,
 	return err;
 }
 
+static int fastrpc_prepare_args_map(struct fastrpc_invoke_context *ctx, char __user *argp)
+{
+	struct qda_mem_map margs;
+	struct fastrpc_invoke_args *args;
+	void *req, *rsp;
+	struct fastrpc_map_req_msg *req_msg;
+	struct fastrpc_map_rsp_msg *rsp_msg;
+	int err;
+
+	err = copy_from_user_or_kernel(&margs, argp, sizeof(margs));
+	if (err)
+		return err;
+
+	args = kzalloc_objs(*args, 3, GFP_KERNEL);
+	if (!args)
+		return -ENOMEM;
+
+	req = kzalloc_obj(*req_msg, GFP_KERNEL);
+	if (!req) {
+		err = -ENOMEM;
+		goto err_free_args;
+	}
+	req_msg = (struct fastrpc_map_req_msg *)req;
+
+	rsp = kzalloc_obj(*rsp_msg, GFP_KERNEL);
+	if (!rsp) {
+		err = -ENOMEM;
+		goto err_free_req;
+	}
+	rsp_msg = (struct fastrpc_map_rsp_msg *)rsp;
+
+	ctx->input_pages = kzalloc_objs(*ctx->input_pages, 1, GFP_KERNEL);
+	if (!ctx->input_pages) {
+		err = -ENOMEM;
+		goto err_free_rsp;
+	}
+
+	req_msg->client_id = ctx->client_id;
+	req_msg->flags = margs.flags;
+	req_msg->vaddr = margs.vaddrin;
+	req_msg->num = sizeof(*ctx->input_pages);
+
+	args[0].ptr = (u64)(uintptr_t)req;
+	args[0].length = sizeof(*req_msg);
+
+	err = setup_mmap_pages(ctx->file_priv, margs.fd, ctx->input_pages);
+	if (err)
+		goto err_free_input_pages;
+
+	args[1].ptr = (u64)(uintptr_t)ctx->input_pages;
+	args[1].length = sizeof(*ctx->input_pages);
+
+	args[2].ptr = (u64)(uintptr_t)rsp;
+	args[2].length = sizeof(*rsp_msg);
+
+	ctx->sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MMAP, 2, 1);
+	ctx->args = args;
+	ctx->req = req;
+	ctx->rsp = rsp;
+	ctx->handle = FASTRPC_INIT_HANDLE;
+
+	return 0;
+
+err_free_input_pages:
+	kfree(ctx->input_pages);
+	ctx->input_pages = NULL;
+err_free_rsp:
+	kfree(rsp);
+err_free_req:
+	kfree(req);
+err_free_args:
+	kfree(args);
+	return err;
+}
+
+static int fastrpc_prepare_args_mem_map_attr(struct fastrpc_invoke_context *ctx, char __user *argp)
+{
+	struct qda_mem_map margs;
+	struct fastrpc_invoke_args *args;
+	void *req, *rsp;
+	struct fastrpc_mem_map_req_msg *req_msg;
+	struct fastrpc_map_rsp_msg *rsp_msg;
+	int err;
+
+	err = copy_from_user_or_kernel(&margs, argp, sizeof(margs));
+	if (err)
+		return err;
+
+	args = kzalloc_objs(*args, 4, GFP_KERNEL);
+	if (!args)
+		return -ENOMEM;
+
+	req = kzalloc_obj(*req_msg, GFP_KERNEL);
+	if (!req) {
+		kfree(args);
+		return -ENOMEM;
+	}
+	req_msg = (struct fastrpc_mem_map_req_msg *)req;
+
+	rsp = kzalloc_obj(*rsp_msg, GFP_KERNEL);
+	if (!rsp) {
+		kfree(args);
+		kfree(req);
+		return -ENOMEM;
+	}
+	rsp_msg = (struct fastrpc_map_rsp_msg *)rsp;
+
+	ctx->input_pages = kzalloc_objs(*ctx->input_pages, 1, GFP_KERNEL);
+	if (!ctx->input_pages) {
+		kfree(args);
+		kfree(req);
+		kfree(rsp);
+		return -ENOMEM;
+	}
+
+	req_msg->client_id = ctx->client_id;
+	req_msg->fd = margs.fd;
+	req_msg->offset = margs.offset;
+	req_msg->flags = margs.flags;
+	req_msg->vaddrin = margs.vaddrin;
+	req_msg->num = sizeof(*ctx->input_pages);
+	req_msg->data_len = 0;
+
+	args[0].ptr = (u64)(uintptr_t)req;
+	args[0].length = sizeof(*req_msg);
+
+	err = setup_mmap_pages(ctx->file_priv, margs.fd, ctx->input_pages);
+	if (err) {
+		kfree(args);
+		kfree(req);
+		kfree(rsp);
+		kfree(ctx->input_pages);
+		ctx->input_pages = NULL;
+		return err;
+	}
+
+	args[1].ptr = (u64)(uintptr_t)ctx->input_pages;
+	args[1].length = sizeof(*ctx->input_pages);
+
+	args[2].ptr = (u64)(uintptr_t)ctx->input_pages;
+	args[2].length = 0;
+
+	args[3].ptr = (u64)(uintptr_t)rsp;
+	args[3].length = sizeof(*rsp_msg);
+
+	ctx->sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MEM_MAP, 3, 1);
+	ctx->args = args;
+	ctx->req = req;
+	ctx->rsp = rsp;
+	ctx->handle = FASTRPC_INIT_HANDLE;
+
+	return 0;
+}
+
 int fastrpc_prepare_args(struct fastrpc_invoke_context *ctx, char __user *argp)
 {
 	int err;
@@ -678,6 +889,12 @@ int fastrpc_prepare_args(struct fastrpc_invoke_context *ctx, char __user *argp)
 		ctx->pd = USER_PD;
 		err = fastrpc_prepare_args_init_create(ctx, argp);
 		break;
+	case FASTRPC_RMID_INIT_MMAP:
+		err = fastrpc_prepare_args_map(ctx, argp);
+		break;
+	case FASTRPC_RMID_INIT_MEM_MAP:
+		err = fastrpc_prepare_args_mem_map_attr(ctx, argp);
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/accel/qda/qda_fastrpc.h b/drivers/accel/qda/qda_fastrpc.h
index a8deb7efec86..b45ccc77d9d1 100644
--- a/drivers/accel/qda/qda_fastrpc.h
+++ b/drivers/accel/qda/qda_fastrpc.h
@@ -260,8 +260,10 @@ struct fastrpc_invoke_context {
 /* Remote Method ID table - identifies initialization and control operations */
 #define FASTRPC_RMID_INIT_ATTACH	0	/* Attach to DSP session */
 #define FASTRPC_RMID_INIT_RELEASE	1	/* Release DSP session */
+#define FASTRPC_RMID_INIT_MMAP		4	/* Map memory region to DSP */
 #define FASTRPC_RMID_INIT_CREATE	6	/* Create DSP process */
 #define FASTRPC_RMID_INIT_CREATE_ATTR	7	/* Create DSP process with attributes */
+#define FASTRPC_RMID_INIT_MEM_MAP	10	/* Map DMA buffer with attributes to DSP */
 #define FASTRPC_RMID_INVOKE_DYNAMIC	0xFFFFFFFF	/* Dynamic method invocation */
 
 /* Common handle for initialization operations */
@@ -276,6 +278,59 @@ struct fastrpc_invoke_context {
 /* Maximum initialization file size (4MB) */
 #define INIT_FILELEN_MAX		(4 * 1024 * 1024)
 
+/* Message structures for internal FastRPC calls */
+
+/**
+ * struct fastrpc_mem_map_req_msg - Memory map request message with attributes
+ *
+ * This message structure is sent to the DSP to request mapping
+ * of a DMA buffer with custom attributes (ATTR request).
+ */
+struct fastrpc_mem_map_req_msg {
+	/* Client identifier for the session */
+	s32 client_id;
+	/* Handle of the buffer */
+	s32 fd;
+	/* Offset within the buffer */
+	s32 offset;
+	/* Mapping flags */
+	u32 flags;
+	/* Virtual address hint for mapping */
+	u64 vaddrin;
+	/* Pages in the mapping */
+	s32 num;
+	/* Length of additional data */
+	s32 data_len;
+};
+
+/**
+ * struct fastrpc_map_req_msg - Legacy memory map request message
+ *
+ * This message structure is sent to the DSP to request mapping
+ * of a DMA buffer into the DSP's virtual address space.
+ */
+struct fastrpc_map_req_msg {
+	/* Client identifier for the session */
+	s32 client_id;
+	/* Mapping flags */
+	u32 flags;
+	/* Virtual address hint for mapping */
+	u64 vaddr;
+	/* Pages in the mapping */
+	s32 num;
+};
+
+/**
+ * struct fastrpc_map_rsp_msg - Memory map response message
+ *
+ * This message structure is returned by the DSP after successfully
+ * mapping a buffer, providing the virtual address for future access.
+ */
+struct fastrpc_map_rsp_msg {
+	/* DSP virtual address assigned to the mapped buffer */
+	u64 vaddrout;
+};
+
 /**
  * fastrpc_context_free - Free an invocation context
  * @ref: Reference counter for the context
@@ -332,4 +387,13 @@ int fastrpc_internal_invoke_pack(struct fastrpc_invoke_context *ctx, struct qda_
  */
 int fastrpc_internal_invoke_unpack(struct fastrpc_invoke_context *ctx, struct qda_msg *msg);
 
+/**
+ * fastrpc_return_result - Return invocation result to user-space
+ * @ctx: FastRPC invocation context
+ * @argp: User-space pointer to return result
+ *
+ * Returns: 0 on success, negative error code on failure
+ */
+int fastrpc_return_result(struct fastrpc_invoke_context *ctx, char __user *argp);
+
 #endif /* __QDA_FASTRPC_H__ */
diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
index 477112ad6664..4eb932e2c9ae 100644
--- a/drivers/accel/qda/qda_ioctl.c
+++ b/drivers/accel/qda/qda_ioctl.c
@@ -192,6 +192,10 @@ static int fastrpc_invoke(int type, struct drm_device *dev, void *data,
 	if (err)
 		goto err_context_free;
 
+	err = fastrpc_return_result(ctx, (char __user *)data);
+	if (err)
+		goto err_context_free;
+
 err_context_free:
 	if (type == FASTRPC_RMID_INIT_RELEASE && qda_user->init_mem_gem_obj) {
 		drm_gem_object_put(&qda_user->init_mem_gem_obj->base);
@@ -223,3 +227,23 @@ int qda_ioctl_create(struct drm_device *dev, void *data, struct drm_file *file_p
 {
 	return fastrpc_invoke(FASTRPC_RMID_INIT_CREATE, dev, data, file_priv);
 }
+
+int qda_ioctl_mmap(struct drm_device *dev, void *data, struct drm_file *file_priv)
+{
+	struct qda_mem_map *map_req;
+
+	if (!data)
+		return -EINVAL;
+
+	map_req = (struct qda_mem_map *)data;
+
+	switch (map_req->request) {
+	case QDA_MAP_REQUEST_LEGACY:
+		return fastrpc_invoke(FASTRPC_RMID_INIT_MMAP, dev, data, file_priv);
+	case QDA_MAP_REQUEST_ATTR:
+		return fastrpc_invoke(FASTRPC_RMID_INIT_MEM_MAP, dev, data, file_priv);
+	default:
+		qda_err(NULL, "Invalid map request type: %u\n", map_req->request);
+		return -EINVAL;
+	}
+}
diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
index 181ed50b19dc..d402d6715b41 100644
--- a/drivers/accel/qda/qda_ioctl.h
+++ b/drivers/accel/qda/qda_ioctl.h
@@ -89,4 +89,17 @@ int qda_ioctl_invoke(struct drm_device *dev, void *data, struct drm_file *file_p
  */
 int qda_ioctl_create(struct drm_device *dev, void *data, struct drm_file *file_priv);
 
+/**
+ * qda_ioctl_mmap - Map memory to DSP address space
+ * @dev: DRM device structure
+ * @data: User-space data containing memory mapping parameters
+ * @file_priv: DRM file private data
+ *
+ * This IOCTL handler maps a DMA buffer into the DSP's virtual address
+ * space, enabling the DSP to access the buffer during remote calls.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_ioctl_mmap(struct drm_device *dev, void *data, struct drm_file *file_priv);
+
 #endif /* _QDA_IOCTL_H */
diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
index 2b7f500db52c..9151ba7adfaf 100644
--- a/include/uapi/drm/qda_accel.h
+++ b/include/uapi/drm/qda_accel.h
@@ -23,7 +23,8 @@ extern "C" {
 #define DRM_QDA_GEM_MMAP_OFFSET	0x02
 #define DRM_QDA_INIT_ATTACH		0x03
 #define DRM_QDA_INIT_CREATE		0x04
-/* Indexes 0x05-0x06 are reserved for other requests */
+#define DRM_QDA_MAP			0x05
+/* 0x06 is reserved for other request */
 #define DRM_QDA_INVOKE			0x07
 
 /*
@@ -41,9 +42,14 @@ extern "C" {
 #define DRM_IOCTL_QDA_INIT_ATTACH	DRM_IO(DRM_COMMAND_BASE + DRM_QDA_INIT_ATTACH)
 #define DRM_IOCTL_QDA_INIT_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_INIT_CREATE, \
 						 struct qda_init_create)
+#define DRM_IOCTL_QDA_MAP		DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_MAP, struct qda_mem_map)
 #define DRM_IOCTL_QDA_INVOKE		DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_INVOKE, \
 						 struct qda_invoke_args)
 
+/* Request type definitions for qda_mem_map */
+#define QDA_MAP_REQUEST_LEGACY    1  /* Legacy MMAP operation */
+#define QDA_MAP_REQUEST_ATTR      2  /* Handle-based MEM_MAP operation with attributes */
+
 /**
  * struct drm_qda_query - Device information query structure
  * @dsp_name: Name of DSP (e.g., "adsp", "cdsp", "cdsp1", "gdsp0", "gdsp1")
@@ -143,6 +149,42 @@ struct qda_init_create {
 	__u64 file;
 };
 
+/**
+ * struct qda_mem_map - Memory mapping request structure
+ * @request: Request type (QDA_MAP_REQUEST_LEGACY or QDA_MAP_REQUEST_ATTR)
+ * @flags: Mapping flags for DSP (cache attributes, permissions)
+ * @fd: Handle of the buffer to map
+ * @attrs: Mapping attributes (used for ATTR request)
+ * @offset: Offset within buffer (used for ATTR request)
+ * @reserved: Reserved for alignment/future use
+ * @vaddrin: Optional virtual address hint for mapping
+ * @size: Size of the memory region to map in bytes
+ * @vaddrout: Output DSP virtual address after successful mapping
+ *
+ * This structure is used to request mapping of a DMA buffer into the
+ * DSP's virtual address space. The DSP will map the buffer according
+ * to the specified flags and return the virtual address in vaddrout.
+ *
+ * For QDA_MAP_REQUEST_LEGACY (value 1):
+ *   - Uses fields: fd, flags, vaddrin, size, vaddrout
+ *   - Legacy MMAP operation for backward compatibility
+ *
+ * For QDA_MAP_REQUEST_ATTR (value 2):
+ *   - Uses all fields including attrs and offset
+ *   - FD-based MEM_MAP operation with custom SMMU attributes
+ */
+struct qda_mem_map {
+	__u32 request;
+	__u32 flags;
+	__s32 fd;
+	__u32 attrs;
+	__u32 offset;
+	__u32 reserved;
+	__u64 vaddrin;
+	__u64 size;
+	__u64 vaddrout;
+};
+
 #if defined(__cplusplus)
 }
 #endif

-- 
2.34.1

