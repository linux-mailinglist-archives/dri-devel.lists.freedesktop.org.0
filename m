Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMbTJkRTpWkR9AUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 10:07:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F67A1D53E5
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 10:07:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5702210E465;
	Mon,  2 Mar 2026 09:07:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KxEzbdGC";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HgmacrNZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F53F10E465
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 09:07:12 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6226hA0C2504612
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Mar 2026 09:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kXwg+e8w3nJ4trgH31uq0Czj0o2II8vsG1Y2JNLZRpM=; b=KxEzbdGCs4hAdRn4
 vsYCcuDDN+XEaSmt5f3FIsF1ze23z72sfGKzX+E92H/HfsKiVVmq/fDrNZZ03m0s
 x8JmTmx60LFfn7HIQ5BxWKFfp3cYkt1aE/B5hfHfFF3eIPQVtMV/uN9Sejb55VV8
 2JYNilAlhSQHpf8WrYvjxrhsYehGM3CQdd/QbHNDMe482Btm2Uz+Uxm2EbenrDgi
 ngK93U9CD2xEggZoMGI9bD4i9FSYZHe2Uqbxok9z4zKS0vKCBqXBFZXnMnoS2z1j
 A8fQNOLa5d92YUwXaADpaAOnk5QDWtx96q2gHnq52vUcKlAnLz8kwAL9phBi4JJz
 05OKyQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn5herh37-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 09:07:12 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-359918118ebso1122485a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 01:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772442431; x=1773047231;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kXwg+e8w3nJ4trgH31uq0Czj0o2II8vsG1Y2JNLZRpM=;
 b=HgmacrNZQQBc8WoWD9k5Dig4lWYpGFx83E8Jg3oVKafxQuhN8rUJm4ISApUZOK254J
 tGUR5u+1L/KzrdfhGX6/oiFiOmUVAfHd78qdbSLuIC8v6zKPV9ZSqy4VtRXfgLUbfobR
 leWMdgAgFmRYsAg39FEgPT6tG8n05/Cww5dwR3a5R5GyZAXnsVi3Fdh6LaHeMAUG+fBG
 DTbFuJ8gF/PcmHwViljQ8yMSMoqz+v7OfoYyd+v5rPeePrwInHTQgSbF6tcfxlutcjGe
 GQHswzz95prrwDBQD7FxspBO1CtpCDGUE5GBhdxJPXMXdeq1ANA2SrhzVXqVm1A7l3qp
 /pQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772442431; x=1773047231;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kXwg+e8w3nJ4trgH31uq0Czj0o2II8vsG1Y2JNLZRpM=;
 b=gAdOGXflgfn6CljaC1FfvRhbs0M8npLia4tgI59qbpiFU7AgUp0uLTfQloaEOwl1WQ
 r9BfwdgbXmbOCeLK+cqVhkg8q//ZpSnrmv9qdpql8nSbc4/KdiKBcDEdqR+o/yKV6MNw
 owCzhSa8I7uKkbHkKqOARxD69tIqBuzevysyBzoFgVqvF7WAxiY/h+WJ16xMArYtlPBx
 ITHquwZwG7MKZL+tE0FRXyceehJL+2h8Z0TkMTGmZqqEtATO4XODYJ5nRoWB2ibKT+vz
 rv+rwLP3He0N+dk7lIejr/iwC7gSrSAjUFPvc07pHzxKOy1EJfS+jmtP6a1pAyX4h4nd
 oNJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFBT/IuUpjx1Bv3RAEOCf8iPumTu54XtHJX7ePpr7fngKI/o6BbJNpEw/2OO7vG0lgp7GnigvZVtw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDvEOB/yBWld0MFssKSA0oBqvyczoLksB/zoovSmrbZ+VfY1/3
 TwrTs4o5Zriim45WcbS/DtDt9UBU8hsfPB99L1rvfxlN7ZreE22DcdG5G8zvUA83W8nW1+YY8SC
 PMyfKNKCj843V1aUbmI/mA3q5JUJVIvLZ1EUUyLVnBz2MVgkgylcdn2xtQlAm7Mj12GnlIFg=
X-Gm-Gg: ATEYQzwKsRPSDeAu41ou3ZoC7VgG9fPMjovalPQl+rP56pHVM8m3V26DCR29TR4ppnv
 nBWFl2tbMp1blPyR5u9MJi/0wTAd+AVvM2oSqr+XkHp9R5iroxVUV0QHd56nVG7Eb1BzD4V0v5s
 v21Q1JAJoQRQiNUT0HeC7TpQC8SZ8RF6Sz1hI/wrijNuFS9TTBdLJEzYj6LP+/Wqmci4YPtjmto
 fQY1vLIdGs5z1ZZHfKEUqaYLdrplY9nv6QPwYxgYBy86pYU4sfHE/jSSbxYBumPUJLjnitnyx36
 gGpemrlwsYWgWJDlFT3G3QA0sEA0P5Fel3z57UXwRHJhmJCk1+gAcEKa65RfFp8mVtaX/nmjXJk
 3zXOgNsBi8RqI3LKuxAZ9VguEetgk1+glwHPoiz0OftYEtASn8Q==
X-Received: by 2002:a17:90b:2507:b0:359:8230:abcc with SMTP id
 98e67ed59e1d1-3598230ace5mr3362778a91.8.1772442431308; 
 Mon, 02 Mar 2026 01:07:11 -0800 (PST)
X-Received: by 2002:a17:90b:2507:b0:359:8230:abcc with SMTP id
 98e67ed59e1d1-3598230ace5mr3362753a91.8.1772442430727; 
 Mon, 02 Mar 2026 01:07:10 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3593ddd737fsm17419480a91.13.2026.03.02.01.07.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 01:07:10 -0800 (PST)
Message-ID: <741c681d-b496-4dff-be2b-06dbe13acb21@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 14:37:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 11/18] accel/qda: Add GEM_CREATE and GEM_MMAP_OFFSET
 IOCTLs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Bharath Kumar <quic_bkumar@quicinc.com>,
 Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-11-fe46a9c1a046@oss.qualcomm.com>
 <mkrwav44qxt66ojxvs2mh5jsjqirrm4sk653uglha3cjefevk6@fobon6vj7fhr>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <mkrwav44qxt66ojxvs2mh5jsjqirrm4sk653uglha3cjefevk6@fobon6vj7fhr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BI++bVQG c=1 sm=1 tr=0 ts=69a55340 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=AnjHHbesreVsCw1LpdIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: B0jFPDx5UMFft-7BSAPjllSZH3hlb_BN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3OCBTYWx0ZWRfX2lYBtQERFcYd
 /cNpsfkH3MjgxbFGzIEpHEm2wWdVW7QJcnPvIxjEe50E8H1YMHYvd/R4oimONFmMaIKR3i/x3J0
 5NcRk8pc9RzPTx8VEM4PRGcxOk+ensPkKWKVdbsB53doBx/3xsn9M0nGA6VqJh8Y0OmouDFxtKy
 96D2/fp8AOgd6YgXNdoMVjoytUOZ8fQPedeXWScnkyscwMMROhxqZmykeJ5d2vyr27xrEtxG1tL
 PXsfBOugrnahmsIwvIMUCTzk8ZzNRmqHerF7iWkIVckpXPz4+Nuvd2SlJrW3l6n+4NvkozG/QpY
 x6lG5Y/aYlcQeYEGzVLFTJBQ2flkMeykmcrbPnFgLsSIIABFOfP4gdzM/qlOy+Z8pAJKNq6NWiU
 v3Gq6dqb6ir++DdsCj5649y3DMpoYQdYwVEmEjFdVHVKVRlsymuc/N76TUufvPyKKOqZ3yIfYg/
 h4/ZTcDafeS3NNXuc4A==
X-Proofpoint-ORIG-GUID: B0jFPDx5UMFft-7BSAPjllSZH3hlb_BN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020078
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
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
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
X-Rspamd-Queue-Id: 0F67A1D53E5
X-Rspamd-Action: no action



On 2/24/2026 4:09 AM, Dmitry Baryshkov wrote:
> On Tue, Feb 24, 2026 at 12:39:05AM +0530, Ekansh Gupta wrote:
>> Add two GEM-related IOCTLs for the QDA accelerator driver and hook
>> them into the DRM accel driver. DRM_IOCTL_QDA_GEM_CREATE allocates
>> a DMA-backed GEM buffer object via qda_gem_create_object() and
>> returns a GEM handle to userspace, while
>> DRM_IOCTL_QDA_GEM_MMAP_OFFSET returns a valid mmap offset for a
>> given GEM handle using drm_gem_create_mmap_offset() and the
>> vma_node in the GEM object.
>>
>> The QDA driver is updated to advertise DRIVER_GEM in its
>> driver_features, and the new IOCTLs are wired through the QDA
>> GEM and memory-manager backend. These IOCTLs allow userspace to
>> allocate buffers and map them into its address space as a first
>> step toward full compute buffer management and integration with
>> DSP workloads.
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/accel/qda/qda_drv.c   |  5 ++++-
>>  drivers/accel/qda/qda_gem.h   | 30 ++++++++++++++++++++++++++++++
>>  drivers/accel/qda/qda_ioctl.c | 35 +++++++++++++++++++++++++++++++++++
>>  include/uapi/drm/qda_accel.h  | 36 ++++++++++++++++++++++++++++++++++++
>>  4 files changed, 105 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
>> index 19798359b14e..0dd0e2bb2c0f 100644
>> --- a/drivers/accel/qda/qda_drv.c
>> +++ b/drivers/accel/qda/qda_drv.c
>> @@ -12,6 +12,7 @@
>>  #include <drm/qda_accel.h>
>>  
>>  #include "qda_drv.h"
>> +#include "qda_gem.h"
>>  #include "qda_ioctl.h"
>>  #include "qda_rpmsg.h"
>>  
>> @@ -154,10 +155,12 @@ DEFINE_DRM_ACCEL_FOPS(qda_accel_fops);
>>  
>>  static const struct drm_ioctl_desc qda_ioctls[] = {
>>  	DRM_IOCTL_DEF_DRV(QDA_QUERY, qda_ioctl_query, 0),
>> +	DRM_IOCTL_DEF_DRV(QDA_GEM_CREATE, qda_ioctl_gem_create, 0),
>> +	DRM_IOCTL_DEF_DRV(QDA_GEM_MMAP_OFFSET, qda_ioctl_gem_mmap_offset, 0),
>>  };
>>  
>>  static struct drm_driver qda_drm_driver = {
>> -	.driver_features = DRIVER_COMPUTE_ACCEL,
>> +	.driver_features = DRIVER_GEM | DRIVER_COMPUTE_ACCEL,
>>  	.fops			= &qda_accel_fops,
>>  	.open			= qda_open,
>>  	.postclose		= qda_postclose,
>> diff --git a/drivers/accel/qda/qda_gem.h b/drivers/accel/qda/qda_gem.h
>> index caae9cda5363..cbd5d0a58fa4 100644
>> --- a/drivers/accel/qda/qda_gem.h
>> +++ b/drivers/accel/qda/qda_gem.h
>> @@ -47,6 +47,36 @@ struct drm_gem_object *qda_gem_create_object(struct drm_device *drm_dev,
>>  void qda_gem_free_object(struct drm_gem_object *gem_obj);
>>  int qda_gem_mmap_obj(struct drm_gem_object *gem_obj, struct vm_area_struct *vma);
>>  
>> +/*
>> + * GEM IOCTL handlers
>> + */
>> +
>> +/**
>> + * qda_ioctl_gem_create - Create a GEM buffer object
>> + * @dev: DRM device structure
>> + * @data: User-space data containing buffer creation parameters
>> + * @file_priv: DRM file private data
>> + *
>> + * This IOCTL handler creates a new GEM buffer object with the specified
>> + * size and returns a handle to the created buffer.
>> + *
>> + * Return: 0 on success, negative error code on failure
>> + */
>> +int qda_ioctl_gem_create(struct drm_device *dev, void *data, struct drm_file *file_priv);
>> +
>> +/**
>> + * qda_ioctl_gem_mmap_offset - Get mmap offset for a GEM buffer object
>> + * @dev: DRM device structure
>> + * @data: User-space data containing buffer handle and offset result
>> + * @file_priv: DRM file private data
>> + *
>> + * This IOCTL handler retrieves the mmap offset for a GEM buffer object,
>> + * which can be used to map the buffer into user-space memory.
>> + *
>> + * Return: 0 on success, negative error code on failure
>> + */
>> +int qda_ioctl_gem_mmap_offset(struct drm_device *dev, void *data, struct drm_file *file_priv);
>> +
>>  /*
>>   * Helper functions for GEM object allocation and cleanup
>>   * These are used internally and by the PRIME import code
>> diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
>> index 9fa73ec2dfce..ef3c9c691cb7 100644
>> --- a/drivers/accel/qda/qda_ioctl.c
>> +++ b/drivers/accel/qda/qda_ioctl.c
>> @@ -43,3 +43,38 @@ int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_pr
>>  
>>  	return 0;
>>  }
>> +
>> +int qda_ioctl_gem_create(struct drm_device *dev, void *data, struct drm_file *file_priv)
>> +{
>> +	struct drm_qda_gem_create *args = data;
>> +	struct drm_gem_object *gem_obj;
>> +	struct qda_drm_priv *drm_priv;
>> +
>> +	drm_priv = get_drm_priv_from_device(dev);
>> +	if (!drm_priv || !drm_priv->iommu_mgr)
>> +		return -EINVAL;
>> +
>> +	gem_obj = qda_gem_create_object(dev, drm_priv->iommu_mgr, args->size, file_priv);
>> +	if (IS_ERR(gem_obj))
>> +		return PTR_ERR(gem_obj);
>> +
>> +	return qda_gem_create_handle(file_priv, gem_obj, &args->handle);
>> +}
>> +
>> +int qda_ioctl_gem_mmap_offset(struct drm_device *dev, void *data, struct drm_file *file_priv)
>> +{
>> +	struct drm_qda_gem_mmap_offset *args = data;
>> +	struct drm_gem_object *gem_obj;
>> +	int ret;
>> +
>> +	gem_obj = qda_gem_lookup_object(file_priv, args->handle);
>> +	if (IS_ERR(gem_obj))
>> +		return PTR_ERR(gem_obj);
>> +
>> +	ret = drm_gem_create_mmap_offset(gem_obj);
>> +	if (ret == 0)
>> +		args->offset = drm_vma_node_offset_addr(&gem_obj->vma_node);
>> +
>> +	drm_gem_object_put(gem_obj);
>> +	return ret;
>> +}
>> diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
>> index 0aad791c4832..ed24a7f5637e 100644
>> --- a/include/uapi/drm/qda_accel.h
>> +++ b/include/uapi/drm/qda_accel.h
>> @@ -19,6 +19,8 @@ extern "C" {
>>   * They are used with DRM_COMMAND_BASE to create the full IOCTL numbers.
>>   */
>>  #define DRM_QDA_QUERY	0x00
>> +#define DRM_QDA_GEM_CREATE		0x01
>> +#define DRM_QDA_GEM_MMAP_OFFSET	0x02
>>  /*
>>   * QDA IOCTL definitions
>>   *
>> @@ -27,6 +29,10 @@ extern "C" {
>>   * data structure and direction (read/write) for each IOCTL.
>>   */
>>  #define DRM_IOCTL_QDA_QUERY	DRM_IOR(DRM_COMMAND_BASE + DRM_QDA_QUERY, struct drm_qda_query)
>> +#define DRM_IOCTL_QDA_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_GEM_CREATE, \
>> +						 struct drm_qda_gem_create)
>> +#define DRM_IOCTL_QDA_GEM_MMAP_OFFSET	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_GEM_MMAP_OFFSET, \
>> +						 struct drm_qda_gem_mmap_offset)
>>  
>>  /**
>>   * struct drm_qda_query - Device information query structure
>> @@ -40,6 +46,36 @@ struct drm_qda_query {
>>  	__u8 dsp_name[16];
>>  };
>>  
>> +/**
>> + * struct drm_qda_gem_create - GEM buffer object creation parameters
>> + * @size: Size of the GEM object to create in bytes (input)
>> + * @handle: Allocated GEM handle (output)
>> + *
>> + * This structure is used with DRM_IOCTL_QDA_GEM_CREATE to allocate
>> + * a new GEM buffer object.
>> + */
>> +struct drm_qda_gem_create {
>> +	__u32 handle;
>> +	__u32 pad;
>> +	__u64 size;
> If you put size before handle, you would not need padding.
ack
>
>> +};
>> +
>> +/**
>> + * struct drm_qda_gem_mmap_offset - GEM object mmap offset query
>> + * @handle: GEM handle (input)
>> + * @pad: Padding for 64-bit alignment
>> + * @offset: mmap offset for the GEM object (output)
>> + *
>> + * This structure is used with DRM_IOCTL_QDA_GEM_MMAP_OFFSET to retrieve
>> + * the mmap offset that can be used with mmap() to map the GEM object into
>> + * user space.
>> + */
>> +struct drm_qda_gem_mmap_offset {
>> +	__u32 handle;
>> +	__u32 pad;
>> +	__u64 offset;
> I'm really not a fan of the pad field in the middle of the structure.
ack
>
>> +};
>> +
>>  #if defined(__cplusplus)
>>  }
>>  #endif
>>
>> -- 
>> 2.34.1
>>

