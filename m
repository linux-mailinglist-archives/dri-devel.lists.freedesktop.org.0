Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAyCAZ1KpWk28AUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 09:30:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 605411D4A6C
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 09:30:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF39610E455;
	Mon,  2 Mar 2026 08:30:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PfQOMN0q";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g5LUVQbL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0515010E1A6
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 08:30:15 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62288QET3223966
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Mar 2026 08:30:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 71RzyWdtt/jelNOKAvhWdj2tQ76mqCEosuyjd3bbpTQ=; b=PfQOMN0qGwtPnLCu
 Ko8FZIg0jPFnRTEmHFsFlHJe1NQzldDEbz3hQ+P+aaEqD6QmxBW35+ppM3DMk2aV
 v6CfOljFLknIggmQl6xVwQxgRIgYcumBhigeovnMHWjbXntnzdJEVp+6MBGLFuHa
 GuCc0xvHH56IwLkrX5+iULTG/+a2wApBd/qnkA08kpWcqtcL3zXHGhZzymaZjPRG
 smV0oIAL+Jr8CijaAA2gF48vbRf3QgFw3/75S8tJ4RzdzVpXcLDusl4Q+BvcV5ia
 SzWS5tlJuICPSI9d+f01t/MEsn2ltUUwmZdl+buxdyaZRpJ/vmghAH91R2o9sjXA
 IMTSqw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn0b1h9qm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 08:30:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2ae47b3adacso10597945ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 00:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772440214; x=1773045014;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=71RzyWdtt/jelNOKAvhWdj2tQ76mqCEosuyjd3bbpTQ=;
 b=g5LUVQbLcCkCzZE0la0xLNpnA2D7hMbvilJSMlH2LxKQJeFmqROHETnBspUnEE1k1W
 cRzti6SRE7Fw6s6HLCTVrib1hYTfeYNNNkp3rueaUoTmX9CQKPLKxWr2SKPHhAZengdS
 FM09wpSQDnvh2VWOkIcrhlqZe8GnpRZ3Sgr8mRE3jYJOiP2nEqEnSD8YSwWP0GrY78gY
 E+UdiedWiHbdtSnQ1DJPw4WdmivIYmDCo6CI4CKtpLUJPuvkeq4BwlCKcrcE7ECGzANq
 COcpToTv13dx3Lqsxo1SH7hoeFBB2MYbg+GRJyirQgnWN+PmtSPSjIpisrbp9pLYMJmm
 tpFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772440214; x=1773045014;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=71RzyWdtt/jelNOKAvhWdj2tQ76mqCEosuyjd3bbpTQ=;
 b=lOF72ta8byxkpnVNp7weWhMo9jZfeqoE6eCmJk7+SK5EUYi9doIrU1zKWwD8QO60Kc
 5JIbbNjxt/nk+Dk/5TRMHzEpwFua25cdbPWCeSMsM/tBHPmfhIpH29TZCo7FM7Q2zatz
 b7OWlwgOt9WcTZM/xGshItegPe2bgUwP1tvyCZzlH1aacGFa9XbNJUgRYhbTwgQOzCnY
 /9VCrSL32/x7UWMhvp0qirrsUjtp7Jd8xo0W9EJCV755r/ccqmdMZJdxfaTDwICxOkE+
 GQto6+fxJz3LgN4jsprM2EiDz5xyf2FHPukxEB5nQJgOzJRP2IDKR+ffzCkdbH4VDCrO
 2Apw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqi1g5eru3U4Ixw3CjeduXPSoyDgyHfcT1mjdvdj29LkDsLpyMXMANld/GzEq3xbr0b6m1X0bfsTE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3qoOJJo3RFAbhC1D6Qx9m12iZ+zbeTtd6zqYpu6wE57v/cPza
 jp+4zk3OIZRBz6eW/hur6P212mKt0q7sMtDYagC/PQAeUAWFDV2DfnDJeg2Ks4rnKBggqdHe7Vm
 E225YikXzsf5ehO92387DqNyqieMvDyawEj4rMy/Wl+WGtIF0d/G7aT4uuQamGhu3LwwdIic=
X-Gm-Gg: ATEYQzwfQBdp9IrQH+10OaYAkpxeAYI+J7qSJW5IYf6WoEZgcntY2yo8Mc0idMreC8P
 u7VDkribGAb1jAnXf6rkweM9cMzHHkeyWgg/Yd+gL5TaMHL3mw6HPHN5Q95avk6BqkiVP8mBqAO
 lzlEXlmt7ZSR5G9pI6Upb6EWZAZdBxir60yrH7dzlysBoygHvBdRB1JAI66qYkCW5jxqPNw1Y5R
 eAngtgy3DJ7JPlKHgvsdLQnH4BjSqWFuHwdWKBAHash/h3gt+2fmBMLWA0ihfvtpem593gQwmrI
 tc5QgtLqtDWGXXgBzm3jJqpoYOUNmjZEIFC0YqdG3NlhsiKtQFVP+8vqxW71AKBlX5mTE2HHcd2
 Y0xIEUjWOEhCqviYiKgiUJgb8DtJFMIPOSAybjRJp25K9HSmkBw==
X-Received: by 2002:a17:903:1b03:b0:2aa:d60c:d48a with SMTP id
 d9443c01a7336-2ae2e251b3dmr111196415ad.7.1772440214166; 
 Mon, 02 Mar 2026 00:30:14 -0800 (PST)
X-Received: by 2002:a17:903:1b03:b0:2aa:d60c:d48a with SMTP id
 d9443c01a7336-2ae2e251b3dmr111195675ad.7.1772440213484; 
 Mon, 02 Mar 2026 00:30:13 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae4cd40e4dsm33020545ad.92.2026.03.02.00.30.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 00:30:12 -0800 (PST)
Message-ID: <22d81284-ff95-401d-b9ae-05f3b776036f@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 14:00:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 06/18] accel/qda: Add memory manager for CB devices
To: Bjorn Andersson <andersson@kernel.org>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bharath Kumar <quic_bkumar@quicinc.com>,
 Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-6-fe46a9c1a046@oss.qualcomm.com>
 <rvi6cqi343yoc3qyabtb72zsedtruktfba6dxstvgw4k7bzyt5@4ofj5pdmkhw6>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <rvi6cqi343yoc3qyabtb72zsedtruktfba6dxstvgw4k7bzyt5@4ofj5pdmkhw6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LphX_XtXFfs91GovOBoNsjtkx5L2dJok
X-Authority-Analysis: v=2.4 cv=Hol72kTS c=1 sm=1 tr=0 ts=69a54a97 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=57SDT3_LIDrlxEhfML8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: LphX_XtXFfs91GovOBoNsjtkx5L2dJok
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3NCBTYWx0ZWRfX1HWoEm4Rrvl5
 UjOy2DGH0nrKAoy6zxNKjPd2bIZzporolV2/Jh5NHPi+MME8oT5+RvnoZd3m3bnEtCsIu9Y3zLu
 MDOE1MXui/ojXT46flFRT3bYQEeAgkQd5Kvh8pTHsDJFPIBWGBHOfnu1x54Plh3+guuTZ9WO7n4
 RNp0K3KMxTDHlnr/hlLbidwegHvA9O+tTPWgT/IDWi7eLNeWS7EhLQwNTmT8pa36hgYXFxbzVN9
 2/W7kz1T/lX5alWPQd1pOmjjLYjP5Z180A+JbiqNBEtE5kGp/FIdKsoBNkQdvhukDiX5nc/53li
 IwxyOh0J01npTo4LyCBGHUn+Ht4Dl7UJ1sozjJae2HLxwBaJKbeV4DPIFtuiGNjtui9LoCBb6HE
 muZ9nLU1ZnPLzkYwlDHp+phHAueUPi/GdVLekdFrMvNe7IFoO3+x++YaJdxwAN2WUxjtjUollFH
 Y/6GHUT7GzBVknoxLNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
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
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
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
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 605411D4A6C
X-Rspamd-Action: no action



On 2/24/2026 4:41 AM, Bjorn Andersson wrote:
> On Tue, Feb 24, 2026 at 12:39:00AM +0530, Ekansh Gupta wrote:
>> Introduce a per-device memory manager for the QDA driver that tracks
>> IOMMU-capable compute context-bank (CB) devices. Each CB device is
>> represented by a qda_iommu_device and registered with a central
>> qda_memory_manager instance owned by qda_dev.
>>
> The name makes me expect that this manages memory, but it seems to
> manage devices and context banks...
>
>> The memory manager maintains an xarray of devices and assigns a
>> unique ID to each CB. It also provides basic lifetime management
>> and a workqueue for deferred device removal. qda_cb_setup_device()
>> now allocates a qda_iommu_device for each CB and registers it with
>> the memory manager after DMA configuration succeeds.
>>
>> qda_init_device() is extended to allocate and initialize the memory
>> manager, while qda_deinit_device() will tear it down in later
>> patches.
> "in later patches" makes this extremely hard to review. I had to apply
> the series to try to navigate the code...
Thanks for highlighting. I'll update this.
>
>> This prepares the QDA driver for fine-grained memory and
>> IOMMU domain management tied to individual CB devices.
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> [..]
>>  obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda_compute_bus.o
>> diff --git a/drivers/accel/qda/qda_cb.c b/drivers/accel/qda/qda_cb.c
> [..]
>> @@ -46,6 +52,18 @@ static int qda_cb_setup_device(struct qda_dev *qdev, struct device *cb_dev)
>>  	rc = dma_set_mask(cb_dev, DMA_BIT_MASK(pa_bits));
>>  	if (rc) {
>>  		qda_err(qdev, "%d bit DMA enable failed: %d\n", pa_bits, rc);
>> +		kfree(iommu_dev);
>> +		return rc;
>> +	}
>> +
>> +	iommu_dev->dev = cb_dev;
>> +	iommu_dev->sid = sid;
>> +	snprintf(iommu_dev->name, sizeof(iommu_dev->name), "qda_iommu_dev_%u", sid);
> It's not easy to follow, when you have scattered the code across so many
> patches and so many files. But I don't think iommu_dev->name is ever
> used.
I'll remove this.
>
>> +
>> +	rc = qda_memory_manager_register_device(qdev->iommu_mgr, iommu_dev);
>> +	if (rc) {
>> +		qda_err(qdev, "Failed to register IOMMU device: %d\n", rc);
>> +		kfree(iommu_dev);
>>  		return rc;
>>  	}
>>  
>> @@ -127,6 +145,8 @@ int qda_create_cb_device(struct qda_dev *qdev, struct device_node *cb_node)
>>  void qda_destroy_cb_device(struct device *cb_dev)
>>  {
>>  	struct iommu_group *group;
>> +	struct qda_iommu_device *iommu_dev;
>> +	struct qda_dev *qdev;
>>  
>>  	if (!cb_dev) {
>>  		qda_dbg(NULL, "NULL CB device passed to destroy\n");
>> @@ -135,6 +155,18 @@ void qda_destroy_cb_device(struct device *cb_dev)
>>  
>>  	qda_dbg(NULL, "Destroying CB device %s\n", dev_name(cb_dev));
>>  
>> +	iommu_dev = dev_get_drvdata(cb_dev);
> I'm not sure, but I think cb_dev is the struct device allocated in
> qda_create_cb_device(), but I can not find a place where you set drvdata
> for this device.
It should be updated with iommu_dev in qda_cb_setup_device. I believe I missed
adding this and it didn't give me any functional failure. Thanks for highlighting this,
I'll fix this in the next spin.
>
>> +	if (iommu_dev) {
>> +		if (cb_dev->parent) {
>> +			qdev = dev_get_drvdata(cb_dev->parent);
>> +			if (qdev && qdev->iommu_mgr) {
>> +				qda_dbg(NULL, "Unregistering IOMMU device for %s\n",
>> +					dev_name(cb_dev));
>> +				qda_memory_manager_unregister_device(qdev->iommu_mgr, iommu_dev);
>> +			}
>> +		}
>> +	}
>> +
>>  	group = iommu_group_get(cb_dev);
>>  	if (group) {
>>  		qda_dbg(NULL, "Removing %s from IOMMU group\n", dev_name(cb_dev));
>> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
> [..]
>> @@ -25,12 +37,46 @@ static void init_device_resources(struct qda_dev *qdev)
>>  	atomic_set(&qdev->removing, 0);
>>  }
>>  
>> +static int init_memory_manager(struct qda_dev *qdev)
>> +{
>> +	int ret;
>> +
>> +	qda_dbg(qdev, "Initializing IOMMU manager\n");
>> +
>> +	qdev->iommu_mgr = kzalloc_obj(*qdev->iommu_mgr, GFP_KERNEL);
>> +	if (!qdev->iommu_mgr)
>> +		return -ENOMEM;
>> +
>> +	ret = qda_memory_manager_init(qdev->iommu_mgr);
>> +	if (ret) {
>> +		qda_err(qdev, "Failed to initialize memory manager: %d\n", ret);
> qda_memory_manager_init() already logged 1 error and 1 debug prints if
> you get here.
ack.
>
>> +		kfree(qdev->iommu_mgr);
>> +		qdev->iommu_mgr = NULL;
> We're going to fail probe, you shouldn't have to clear this.
>
>> +		return ret;
>> +	}
>> +
>> +	qda_dbg(qdev, "IOMMU manager initialized successfully\n");
>> +	return 0;
>> +}
>> +
>>  int qda_init_device(struct qda_dev *qdev)
>>  {
>> +	int ret;
>> +
>>  	init_device_resources(qdev);
>>  
>> +	ret = init_memory_manager(qdev);
>> +	if (ret) {
>> +		qda_err(qdev, "IOMMU manager initialization failed: %d\n", ret);
> And now we have 2 debug prints and two error prints in the log.
I'll clean the duplicate/unnecessary logs at at places
>
>> +		goto err_cleanup_resources;
>> +	}
>> +
>>  	qda_dbg(qdev, "QDA device initialized successfully\n");
> Or, if we get here, you have 8 debug prints.
>
> Please learn how to use kprobe/kretprobe instead of reimplementing it
> using printk().
ack.
>
>>  	return 0;
>> +
>> +err_cleanup_resources:
>> +	cleanup_device_resources(qdev);
>> +	return ret;
>>  }
>>  
>>  static int __init qda_core_init(void)
>> diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
>> index eb732b7d8091..2cb97e4eafbf 100644
>> --- a/drivers/accel/qda/qda_drv.h
>> +++ b/drivers/accel/qda/qda_drv.h
>> @@ -11,6 +11,7 @@
>>  #include <linux/mutex.h>
>>  #include <linux/rpmsg.h>
>>  #include <linux/xarray.h>
>> +#include "qda_memory_manager.h"
>>  
>>  /* Driver identification */
>>  #define DRIVER_NAME "qda"
>> @@ -23,6 +24,8 @@ struct qda_dev {
>>  	struct device *dev;
>>  	/* Mutex protecting device state */
>>  	struct mutex lock;
>> +	/* IOMMU/memory manager */
>> +	struct qda_memory_manager *iommu_mgr;
>>  	/* Flag indicating device removal in progress */
>>  	atomic_t removing;
>>  	/* Name of the DSP (e.g., "cdsp", "adsp") */
>> diff --git a/drivers/accel/qda/qda_memory_manager.c b/drivers/accel/qda/qda_memory_manager.c
> [..]
>> +int qda_memory_manager_register_device(struct qda_memory_manager *mem_mgr,
>> +				       struct qda_iommu_device *iommu_dev)
>> +{
>> +	int ret;
>> +	u32 id;
>> +
>> +	if (!mem_mgr || !iommu_dev || !iommu_dev->dev) {
> How could this happen? You call this function from one place, that looks
> like this:
>
> iommu_dev->dev = cb_dev;
> iommu_dev->sid = sid;
> rc = qda_memory_manager_register_device(qdev->iommu_mgr, iommu_dev);
>
> You just allocated in filled out iommu_dev.
>
> Looking up the callstack, we're coming from qda_rpmsg_probe() which just
> did qda_init_device() which created the qsdev->iommu_mgr.
>
> In other words, these can't possibly be NULL.
I'll recheck this and remove redundant checks.
>
>> +		qda_err(NULL, "Invalid parameters for device registration\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	init_iommu_device_fields(iommu_dev, mem_mgr);
>> +
>> +	ret = allocate_device_id(mem_mgr, iommu_dev, &id);
>> +	if (ret) {
>> +		qda_err(NULL, "Failed to allocate device ID: %d (sid=%u)\n", ret, iommu_dev->sid);
>> +		return ret;
>> +	}
>> +
>> +	iommu_dev->id = id;
>> +
>> +	qda_dbg(NULL, "Registered device id=%u (sid=%u)\n", id, iommu_dev->sid);
>> +
>> +	return 0;
>> +}
>> +
>> +void qda_memory_manager_unregister_device(struct qda_memory_manager *mem_mgr,
>> +					  struct qda_iommu_device *iommu_dev)
>> +{
>> +	if (!mem_mgr || !iommu_dev) {
> The one call to this function is wrapped in:
>
> if (iommu_dev) {
> 	if (qdev->iommu_mgr) {
> 		qda_dbg(NULL, ...);
> 		qda_memory_manager_unregister_device(qdev->iommu_mgr, iommu_dev);
> 	}
> }
>
>> +		qda_err(NULL, "Attempted to unregister invalid device/manager\n");
>> +		return;
>> +	}
>> +
>> +	qda_dbg(NULL, "Unregistering device id=%u (refcount=%u)\n", iommu_dev->id,
>> +		refcount_read(&iommu_dev->refcount));
> And just before the call to qda_memory_manager_unregister_device() you
> print a debug log, saying you will call this function.
>
>> +
>> +	if (refcount_read(&iommu_dev->refcount) == 0) {
>> +		xa_erase(&mem_mgr->device_xa, iommu_dev->id);
>> +		kfree(iommu_dev);
>> +		return;
>> +	}
>> +
>> +	if (refcount_dec_and_test(&iommu_dev->refcount)) {
>> +		qda_info(NULL, "Device id=%u refcount reached zero, queuing removal\n",
>> +			 iommu_dev->id);
>> +		queue_work(mem_mgr->wq, &iommu_dev->remove_work);
>> +	}
>> +}
>> +
> [..]
>> diff --git a/drivers/accel/qda/qda_memory_manager.h b/drivers/accel/qda/qda_memory_manager.h
> [..]
>> +
>> +/**
> This says "kernel-doc"
>
>> + * struct qda_iommu_device - IOMMU device instance for memory management
>> + *
>> + * This structure represents a single IOMMU-enabled device managed by the
>> + * memory manager. Each device can be assigned to a specific process.
>> + */
>> +struct qda_iommu_device {
>> +	/* Unique identifier for this IOMMU device */
> But this doesn't follow kernel-doc style.
>
> At the end of the series, 
>
> ./scripts/kernel-doc -none -vv -Wall drivers/accel/qda/
>
> reports 270 warnings.
I'll resolve the warnings in next version.
>
>> +	u32 id;
>> +	/* Pointer to the underlying device */
>> +	struct device *dev;
>> +	/* Name for the device */
>> +	char name[32];
>> +	/* Spinlock protecting concurrent access to device */
>> +	spinlock_t lock;
>> +	/* Reference counter for device */
>> +	refcount_t refcount;
>> +	/* Work structure for deferred device removal */
>> +	struct work_struct remove_work;
>> +	/* Stream ID for IOMMU transactions */
>> +	u32 sid;
>> +	/* Pointer to parent memory manager */
>> +	struct qda_memory_manager *manager;
>> +};
> Regards,
> Bjorn

