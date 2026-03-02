Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id h2drMXxLpWmt8AUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 09:34:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 255CB1D4AB9
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 09:34:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6CF910E1A6;
	Mon,  2 Mar 2026 08:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KHTvc93G";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NdSjfETH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1025E10E1A6
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 08:34:00 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6227JGwj2358125
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Mar 2026 08:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kiGzfhiYB9wtCN3D88VauW9OjmRKCIKm/2P5tjv1u1w=; b=KHTvc93GiHjJt2D4
 0m6pEeLM/1N0U/B3a242ftDXzyMebgu6s2qhbJiaacWOxnY7Dyep6gZMMgNZTOjv
 inVNFD5ZTP5oMDZw48i+qeuXlFGdxLDot1h1pO/oNKID6Tof+7JFV2RqsraAZ7VV
 R7G9ty+hum83Vtc3n1OvYw/6ICoDe7yxESCE6LR0KWOjhGg13msz2KQZc0NgDDdo
 ulZD8iFY1XZhkxOozsZapkwLXvqtIP1LK2syRk5hTIDsTDgWCebiDzvUM5f+xBZ1
 U1GH0eve0w+z3+Up+XAUcTpm7ewWi51k80dEcz1MR5JWaRl9hnIaNivUjlObRrDC
 TWrFaA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmgbatgx2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 08:33:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2ae4e20a414so40283955ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 00:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772440439; x=1773045239;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kiGzfhiYB9wtCN3D88VauW9OjmRKCIKm/2P5tjv1u1w=;
 b=NdSjfETH39HWRbGPIPSjuCTnlxUGyOkCZdOEIn1WpVOFNRHGm7oqdONp3CpU6GYJbo
 49NwCVXJZ5/iFZap1Bnl3JOISfTwEWh5ZdyK5Thw2uStxav/LIvnPB+bB3Bt3iHOfiGV
 dyWFuvlwE9ziKvslDVXRxoT8cRyn+nECu3EsKrJxV7FA5o0qETG9PsZ12kUA2idm2JkS
 EX6G4I5bfqDBADUFuWRiHlKBR0tBuMFKftixpqdt2e7g7ccxmAkYqnAbbg8EWCf/RSPO
 iMtBUrckmXcMEarKWGA/LkwKWpVQe+Azz/MDu0GNjiHQAPiGbKbhGgMP9leTO+5UoSA/
 29FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772440439; x=1773045239;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kiGzfhiYB9wtCN3D88VauW9OjmRKCIKm/2P5tjv1u1w=;
 b=iphii6Ro/wzK9uIBuc16/l+jNn945kVjhIXzhKboKOpZ/gG/u0L1GBqKSe/nub/leI
 O9zxuM1EbjxsEYajXmZXXLUfXBuy09nR+RO4xpmJPwxUdA/22gCvrNatR/sJwwNMYuAn
 pf2b+K8ly+kgGX2wQbuWkGg3/9zo/0dJyivnU4aLmepPiUbsbETBzdJ5wi+KJ4ou6PIm
 PWku5Dig6/hhHt5aUl+u7zhNUW6digsZ5Sy+LUQqoeAGXleJzgZuHfriptH986cEpWI7
 tuFOh7yb160SrkAYR9UND+xlUo3N8BXX8Z//sgRVRpkotmKle0ihXE6tZACX1PF+stDd
 1hmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoB2rN98OM1ChT8jDQRN/ZRyo5zfWqhYkzI1YDoVeD05nZXk4ButVadyPHUn5aHYk0WXXcSKRtdjQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4g4CzSQmep8xGZ3uYLgpfGT842uSW/MKwBHc1Pz9IrXXA/JTU
 NUJOBO6Ek5ygXaGeB/fVSra4chUBVzuFVD20JsAIyCJejT3wJjCy9gTzeoNKkuBNGNda6237HFg
 U9GDl9EDo5HuEH4DYdby/DrMMA5/JSwaJciwpXc8qP/Z5MgbphCLtU8owH21ZaNASGwYgTZc=
X-Gm-Gg: ATEYQzyPyJIYyAIHD9OZ+qCOELaVxXIMxbM+9Ywxlas58CbEXMbGEhz7buG8FIIn/kr
 6n80vAJYKD1R6N7ZBxcHOq3GwHub6MGOb8eKA2aw93VN9lRiSvxx/LeBQsF3SZqN7ufhbxw5Pf8
 k7Rnq8hG6rl+C3Nf1guk76Z2LmfwsHvCnabO6eBlJK6NaBu+ZVJpxBKrW/FYxtPbn3Jm3G4gA0u
 s7rQu4kM7PGmosfbdRAGTjxfSZhEXMLTvFO8LqyKpvN99gvp00gvEpEg6tE3Ojrvb+//pIU0Nc9
 j9WNEj2+3LWZS0wB7I+ag13Viqk59HUR5sF1w5eP1yOGAy2Gr6gwiZGSf5e+CVbRVX4EXS8UmoF
 8SlIGIBhkJnM8MXkxmjxs4VBkUzAM4Q3SRyoFIqa3L3FqTtQhxQ==
X-Received: by 2002:a17:902:eb8b:b0:2ae:593c:48fc with SMTP id
 d9443c01a7336-2ae593c50a1mr6195965ad.53.1772440438897; 
 Mon, 02 Mar 2026 00:33:58 -0800 (PST)
X-Received: by 2002:a17:902:eb8b:b0:2ae:593c:48fc with SMTP id
 d9443c01a7336-2ae593c50a1mr6195665ad.53.1772440438404; 
 Mon, 02 Mar 2026 00:33:58 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb6a041asm136014925ad.57.2026.03.02.00.33.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 00:33:57 -0800 (PST)
Message-ID: <f5a1d71a-0a32-4e18-aaa0-bd6dcc9c133b@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 14:03:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 07/18] accel/qda: Add DRM accel device registration
 for QDA driver
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
 <20260224-qda-firstpost-v1-7-fe46a9c1a046@oss.qualcomm.com>
 <jjj5b2says6y2sk4lokcxslzcwlsg3gj7rme34lqmhufqc7eam@x256mqlsuvet>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <jjj5b2says6y2sk4lokcxslzcwlsg3gj7rme34lqmhufqc7eam@x256mqlsuvet>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3NCBTYWx0ZWRfX5WoCrfV0dbnu
 CKtQmATq5nKb3YzmIMvc2LdLqf02Zm8o5PbQk3zqQ2bVg513OQD/Y+xpK2HaWyS8ZYptMFcXszB
 ryt/kdXpn5jBTtIvd/pIYY4yOtd5Heco9xPNybt6XvoZ+kHjzmKsgqELmPJcoZGDcvLs6IVr6cF
 H0ULEhkAiMMBuWP7X5jmOD5TCGgiNdDqYWPBsLA+cG48fVKCea5jIqgvBgeQcOQExrnjfLg1Fdk
 XpwtZX8AElwFqG5l2SPHlSaE/jTtrmieubWkyr+oQAOegQNHAbf5T4rHFTvuCVabnHRi1p1Rc9C
 o03leUQaaBO6j67D1zp2u4q9TLSVXHuqN3slvRPN8HN64QzDOx3C6ll/QC4DGy2AdSy+yNB0Qky
 OjjLkrMKas5ThF0qjozMZAG7rFfdvIcL3qyFKuZx8gIBqya+Z0FI0G1alzW48mXMs0pKuJmMOim
 j20HN7ZVU8IKhZS3CPQ==
X-Authority-Analysis: v=2.4 cv=QfVrf8bv c=1 sm=1 tr=0 ts=69a54b77 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=TmiqH_r-WPNNxDXjmLoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: AGBlGRovLqqkKBokMq98A6yE6FRa3mu-
X-Proofpoint-GUID: AGBlGRovLqqkKBokMq98A6yE6FRa3mu-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020074
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
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 255CB1D4AB9
X-Rspamd-Action: no action



On 2/24/2026 3:46 AM, Dmitry Baryshkov wrote:
> On Tue, Feb 24, 2026 at 12:39:01AM +0530, Ekansh Gupta wrote:
>> Add DRM accel integration for the QDA DSP accelerator driver. A new
>> qda_drm_priv structure is introduced to hold per-device DRM state,
>> including a pointer to the memory manager and the parent qda_dev
>> instance. The driver now allocates a drm_device, initializes
>> driver-private state, and registers the device via the DRM accel
>> infrastructure.
>>
>> qda_register_device() performs allocation and registration of the DRM
>> device, while qda_unregister_device() handles device teardown and
>> releases references using drm_dev_unregister() and drm_dev_put().
>> Initialization and teardown paths are updated so DRM resources are
>> allocated after IOMMU/memory-manager setup and cleaned during RPMsg
>> remove.
>>
>> This patch lays the foundation for adding GEM buffer support and IOCTL
>> handling in later patches as part of the compute accelerator interface.
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/accel/qda/qda_drv.c   | 103 ++++++++++++++++++++++++++++++++++++++++++
>>  drivers/accel/qda/qda_drv.h   |  33 +++++++++++++-
>>  drivers/accel/qda/qda_rpmsg.c |   8 ++++
>>  3 files changed, 142 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
>> index 69132737f964..a9113ec78fa2 100644
>> --- a/drivers/accel/qda/qda_drv.c
>> +++ b/drivers/accel/qda/qda_drv.c
>> @@ -4,9 +4,31 @@
>>  #include <linux/kernel.h>
>>  #include <linux/atomic.h>
>>  #include <linux/slab.h>
>> +#include <drm/drm_accel.h>
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_file.h>
>> +#include <drm/drm_gem.h>
>> +#include <drm/drm_ioctl.h>
>>  #include "qda_drv.h"
>>  #include "qda_rpmsg.h"
>>  
>> +DEFINE_DRM_ACCEL_FOPS(qda_accel_fops);
>> +
>> +static struct drm_driver qda_drm_driver = {
>> +	.driver_features = DRIVER_COMPUTE_ACCEL,
>> +	.fops			= &qda_accel_fops,
> Strange indentation in the middle. Please drop it.
ack.
>
>> +	.name = DRIVER_NAME,
>> +	.desc = "Qualcomm DSP Accelerator Driver",
>> +};
>> +
>> +static void cleanup_drm_private(struct qda_dev *qdev)
>> +{
>> +	if (qdev->drm_priv) {
>> +		qda_dbg(qdev, "Cleaning up DRM private data\n");
>> +		kfree(qdev->drm_priv);
>> +	}
>> +}
>> +
>>  static void cleanup_iommu_manager(struct qda_dev *qdev)
>>  {
>>  	if (qdev->iommu_mgr) {
>> @@ -24,6 +46,7 @@ static void cleanup_device_resources(struct qda_dev *qdev)
>>  
>>  void qda_deinit_device(struct qda_dev *qdev)
>>  {
>> +	cleanup_drm_private(qdev);
>>  	cleanup_iommu_manager(qdev);
>>  	cleanup_device_resources(qdev);
>>  }
>> @@ -59,6 +82,18 @@ static int init_memory_manager(struct qda_dev *qdev)
>>  	return 0;
>>  }
>>  
>> +static int init_drm_private(struct qda_dev *qdev)
>> +{
>> +	qda_dbg(qdev, "Initializing DRM private data\n");
>> +
>> +	qdev->drm_priv = kzalloc_obj(*qdev->drm_priv, GFP_KERNEL);
>> +	if (!qdev->drm_priv)
>> +		return -ENOMEM;
>> +
>> +	qda_dbg(qdev, "DRM private data initialized successfully\n");
>> +	return 0;
>> +}
>> +
>>  int qda_init_device(struct qda_dev *qdev)
>>  {
>>  	int ret;
>> @@ -71,14 +106,82 @@ int qda_init_device(struct qda_dev *qdev)
>>  		goto err_cleanup_resources;
>>  	}
>>  
>> +	ret = init_drm_private(qdev);
>> +	if (ret) {
>> +		qda_err(qdev, "DRM private data initialization failed: %d\n", ret);
>> +		goto err_cleanup_iommu;
>> +	}
>> +
>>  	qda_dbg(qdev, "QDA device initialized successfully\n");
>>  	return 0;
>>  
>> +err_cleanup_iommu:
>> +	cleanup_iommu_manager(qdev);
>>  err_cleanup_resources:
>>  	cleanup_device_resources(qdev);
>>  	return ret;
>>  }
>>  
>> +static int setup_and_register_drm_device(struct qda_dev *qdev)
>> +{
>> +	struct drm_device *ddev;
>> +	int ret;
>> +
>> +	qda_dbg(qdev, "Setting up and registering DRM device\n");
>> +
>> +	ddev = drm_dev_alloc(&qda_drm_driver, qdev->dev);
> devm_drm_dev_alloc() please. Move this patch to the front of the series,
> making everything else depend on the allocated data structure.
ack.
>
>> +	if (IS_ERR(ddev)) {
>> +		ret = PTR_ERR(ddev);
>> +		qda_err(qdev, "Failed to allocate DRM device: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	qdev->drm_priv->drm_dev = ddev;
>> +	qdev->drm_priv->iommu_mgr = qdev->iommu_mgr;
>> +	qdev->drm_priv->qdev = qdev;
>> +
>> +	ddev->dev_private = qdev->drm_priv;
>> +	qdev->drm_dev = ddev;
>> +
>> +	ret = drm_dev_register(ddev, 0);
>> +	if (ret) {
>> +		qda_err(qdev, "Failed to register DRM device: %d\n", ret);
>> +		drm_dev_put(ddev);
>> +		return ret;
>> +	}
>> +
>> +	qda_dbg(qdev, "DRM device registered successfully\n");
>> +	return 0;
>> +}
>> +
>> +int qda_register_device(struct qda_dev *qdev)
>> +{
>> +	int ret;
>> +
>> +	ret = setup_and_register_drm_device(qdev);
>> +	if (ret) {
>> +		qda_err(qdev, "DRM device setup failed: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	qda_dbg(qdev, "QDA device registered successfully\n");
>> +	return 0;
>> +}
>> +
>> +void qda_unregister_device(struct qda_dev *qdev)
>> +{
>> +	qda_info(qdev, "Unregistering QDA device\n");
>> +
>> +	if (qdev->drm_dev) {
>> +		qda_dbg(qdev, "Unregistering DRM device\n");
>> +		drm_dev_unregister(qdev->drm_dev);
>> +		drm_dev_put(qdev->drm_dev);
>> +		qdev->drm_dev = NULL;
>> +	}
>> +
>> +	qda_dbg(qdev, "QDA device unregistered successfully\n");
>> +}
>> +
>>  static int __init qda_core_init(void)
>>  {
>>  	int ret;
>> diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
>> index 2cb97e4eafbf..2b80401a3741 100644
>> --- a/drivers/accel/qda/qda_drv.h
>> +++ b/drivers/accel/qda/qda_drv.h
>> @@ -11,13 +11,35 @@
>>  #include <linux/mutex.h>
>>  #include <linux/rpmsg.h>
>>  #include <linux/xarray.h>
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_file.h>
>> +#include <drm/drm_device.h>
>> +#include <drm/drm_accel.h>
>>  #include "qda_memory_manager.h"
>>  
>>  /* Driver identification */
>>  #define DRIVER_NAME "qda"
>>  
>> +/**
>> + * struct qda_drm_priv - DRM device private data for QDA device
>> + *
>> + * This structure serves as the DRM device private data (stored in dev_private),
>> + * bridging the DRM device context with the QDA device and providing access to
>> + * shared resources like the memory manager during buffer operations.
>> + */
>> +struct qda_drm_priv {
> Shared between what and what? Why do you need a separate structure
> instead of using qda_dev?
This is for channel specific resources which will be used by all processes using the channel. It
should be possible to use qda_dev, I'll try it out and fix this in next version.
>
>> +	/* DRM device structure */
>> +	struct drm_device *drm_dev;
>> +	/* Global memory/IOMMU manager */
>> +	struct qda_memory_manager *iommu_mgr;
>> +	/* Back-pointer to qda_dev */
>> +	struct qda_dev *qdev;
>> +};
>> +
>>  /* struct qda_dev - Main device structure for QDA driver */
>>  struct qda_dev {
>> +	/* DRM device for accelerator interface */
>> +	struct drm_device *drm_dev;
> Drop the pointer here.
I'll modify this based on qda_drm_priv replacement.
>
>>  	/* RPMsg device for communication with remote processor */
>>  	struct rpmsg_device *rpdev;
>>  	/* Underlying device structure */
>> @@ -26,6 +48,8 @@ struct qda_dev {
>>  	struct mutex lock;
>>  	/* IOMMU/memory manager */
>>  	struct qda_memory_manager *iommu_mgr;
>> +	/* DRM device private data */
>> +	struct qda_drm_priv *drm_priv;
>>  	/* Flag indicating device removal in progress */
>>  	atomic_t removing;
>>  	/* Name of the DSP (e.g., "cdsp", "adsp") */
>> @@ -39,8 +63,8 @@ struct qda_dev {
>>   * @qdev: QDA device structure
>>   *
>>   * Returns the most appropriate device structure for logging messages.
>> - * Prefers qdev->dev, or returns NULL if the device is being removed
>> - * or invalid.
>> + * Prefers qdev->dev, falls back to qdev->drm_dev->dev, or returns NULL
>> + * if the device is being removed or invalid.
>>   */
>>  static inline struct device *qda_get_log_device(struct qda_dev *qdev)
>>  {
>> @@ -50,6 +74,9 @@ static inline struct device *qda_get_log_device(struct qda_dev *qdev)
>>  	if (qdev->dev)
>>  		return qdev->dev;
>>  
>> +	if (qdev->drm_dev)
>> +		return qdev->drm_dev->dev;
>> +
>>  	return NULL;
>>  }
>>  
>> @@ -93,5 +120,7 @@ static inline struct device *qda_get_log_device(struct qda_dev *qdev)
>>   */
>>  int qda_init_device(struct qda_dev *qdev);
>>  void qda_deinit_device(struct qda_dev *qdev);
>> +int qda_register_device(struct qda_dev *qdev);
>> +void qda_unregister_device(struct qda_dev *qdev);
>>  
>>  #endif /* __QDA_DRV_H__ */
>> diff --git a/drivers/accel/qda/qda_rpmsg.c b/drivers/accel/qda/qda_rpmsg.c
>> index 5a57384de6a2..b2b44b4d3ca8 100644
>> --- a/drivers/accel/qda/qda_rpmsg.c
>> +++ b/drivers/accel/qda/qda_rpmsg.c
>> @@ -80,6 +80,7 @@ static void qda_rpmsg_remove(struct rpmsg_device *rpdev)
>>  	qdev->rpdev = NULL;
>>  	mutex_unlock(&qdev->lock);
>>  
>> +	qda_unregister_device(qdev);
>>  	qda_unpopulate_child_devices(qdev);
>>  	qda_deinit_device(qdev);
>>  
>> @@ -123,6 +124,13 @@ static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
>>  		return ret;
>>  	}
>>  
>> +	ret = qda_register_device(qdev);
>> +	if (ret) {
>> +		qda_deinit_device(qdev);
>> +		qda_unpopulate_child_devices(qdev);
>> +		return ret;
>> +	}
>> +
>>  	qda_info(qdev, "QDA RPMsg probe completed successfully for %s\n", qdev->dsp_name);
>>  	return 0;
>>  }
>>
>> -- 
>> 2.34.1
>>

