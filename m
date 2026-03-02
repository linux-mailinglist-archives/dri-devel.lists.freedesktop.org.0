Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJUtAwFMpWmt8AUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 09:36:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 670AA1D4B09
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 09:36:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D68810E457;
	Mon,  2 Mar 2026 08:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BlTOmEth";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MWqUWWad";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B84210E44E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 08:36:11 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6228HE4a3223927
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Mar 2026 08:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8dFOeVIxat+blul/Mwn+SDuNqbfDaRRvU9J92gKowqk=; b=BlTOmEthli+6TXZE
 mIqhDjGdubk5skAx6/Ve28p2NaQQY0XNkCr+DaPphL7+sMmUKUK6YwDOxO52wu28
 PioLN9DzwAQTTKRDVggo2eFxbdYxMHdM9ugn7kbggM12U1I0K24A9/gL0fk4ZuWj
 Hd0uR+h+tmM2ct35NVXXFBk/d6KDH7GfWRmGR4lmN4t46BDeAn3pU84BphuyE3Of
 Ghk2qeLNO6xtoca3j/JLVhOnwKAX17Syt+DxrrmkWJwlFuSUwIoRBeKHvxdw1NUS
 WrL2t72atGHSga7+NTvXD+SQyFrGUeGhgw/5T6Sl8wIWn1yHluC2nEi95x2J7xPj
 BMYC1w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn0b1haga-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 08:36:10 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-35984b91ffeso1074580a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 00:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772440570; x=1773045370;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8dFOeVIxat+blul/Mwn+SDuNqbfDaRRvU9J92gKowqk=;
 b=MWqUWWadEB3QcQGhoQxoYJ2+9DRb8h7kCCFj91w4PJX7wjB8ahhuhA8GNVwknFL2Nd
 OdeYB6ENmTBsguVD0nMekH4qLXFc2B78yoFLRN/WV5BTnP5XO3rXQing0GdDC6KZp40Z
 HLCjyLv1J2eUL9NxXh5LnOcivh2h3blIdbytBV2LgJsD02b8BU5pCJn0OOUiaJ3dyOwi
 PA1Ry19vsxB5EiEqdofnKRXh063/hjB9YiuVnKLNYJaN4Gc8O69KZCuHk/JiqHiF9CSQ
 iH5X4fHNysq9XWkO9VwVGjf3xWqPNX3bF6baqxryG6OY0PP3HI64sUtvbTBTaOtmJ9Md
 HN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772440570; x=1773045370;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8dFOeVIxat+blul/Mwn+SDuNqbfDaRRvU9J92gKowqk=;
 b=YHRnOoWTw7whL3tDMpWbvKSGZi+xHRkDQRU86PI+w/2WlPQObkT0yLOlvyTco91dws
 8AL7C7qrAimLrsIebAmJIKU9n49edfDal+Bxtr3XMfLutHmgkordfJ2mynzDuCrb7euK
 IB7RX+7JN/D4aOFg+YOW7ZOVUjkUPOTEbEvmZT4ic1FvT9LJB0WgH7z5GVSPjd9lLcZ7
 nM5ZQvK4EunsFSFjjWzRtgmo8KFfVVxXlerBtlrvzscaoBgklDDO4M1yZQI9HHhDvgMJ
 +DMhp/R4sOjECwf03gy6kxpc1No1V3aie98zo3gMtb2Gc5B6t5wEqGn5Lfp62LFpN4v2
 HDhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFOMhWAefX8mkExXNitrTApZJD4wkJoLBZ30aTmXUA6AsGo7UqevrLaLukiz5mjRPGETXujfZAQeI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2rqViec1HnkgaZdpolOkVyfr5Dqst8hcv5hclclPYW0WePnGu
 d2kSz3u+I1LHQkQMFsvNgOh44MxvcBATsFqsJ9n/MrxylPT2tM6C9iMrWDPw3X2GIRKOG44ZzZU
 IAW8wZ7fRhPvEVwKEuyXxoGSIus0rMmdRNxooj3UBxyISQp63vB/+lPSRMukPUaLAv9HKEQk=
X-Gm-Gg: ATEYQzyfpF0Rkl35OjFL0MkyrLdt6gt5RBNywINYvX7R2cPM4zZPF0Kx4hPUpcf9H53
 4mCX2s11mCgEYQ/zsKkqoSCif+wzUA9ztXgCQ2iMs0LgYnwNuyPJytXpVbyvVagflyXBuSHvGxt
 akR9Nlv11Sl2gi7eW3BItzfXGhkGy+A5/tRyJdcXKbgayORtjMkPqWGQ3ymIqS+XDb8OAF098RB
 bXc7Rpt8rytFVBb5E5JOtnZ8cStzFDLnif9YOWXadj1TKYIYu7zBh91Hot9dweKKU8lGmeEnI0C
 UpNMJq1JAXPK+WSELOxSESgdqSNGAnzKHK/yPfd+SmlarrS3UIdozY5H84yP5XTdJYkVIJ+0K6m
 csgHlgjbqXcUnRv76kus+i7RL+yY2F8DiCGGkKmzTssuqlEVozg==
X-Received: by 2002:a17:90a:da85:b0:358:ed1d:2834 with SMTP id
 98e67ed59e1d1-35968faa663mr9193284a91.6.1772440570041; 
 Mon, 02 Mar 2026 00:36:10 -0800 (PST)
X-Received: by 2002:a17:90a:da85:b0:358:ed1d:2834 with SMTP id
 98e67ed59e1d1-35968faa663mr9193247a91.6.1772440569507; 
 Mon, 02 Mar 2026 00:36:09 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-359034bd11fsm16177216a91.9.2026.03.02.00.36.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 00:36:08 -0800 (PST)
Message-ID: <3540a60d-f9a1-463f-aca2-54ccd484b5c6@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 14:06:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 08/18] accel/qda: Add per-file DRM context and
 open/close handling
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
 <20260224-qda-firstpost-v1-8-fe46a9c1a046@oss.qualcomm.com>
 <rnhqwqtd66fmvmyobhrodzoa7x2etzjjh7xhqrn5hkmibms5cd@ucggzznrx7j6>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <rnhqwqtd66fmvmyobhrodzoa7x2etzjjh7xhqrn5hkmibms5cd@ucggzznrx7j6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fls2BoaggwImAeL-qo6lISyeJGFp6cq6
X-Authority-Analysis: v=2.4 cv=Hol72kTS c=1 sm=1 tr=0 ts=69a54bfa cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=e0RItjUwLU8XcxGzZmsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: fls2BoaggwImAeL-qo6lISyeJGFp6cq6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3NSBTYWx0ZWRfXzXrzryykVSe9
 ZQvl2MFLWalj7aWVJR5JC+fLfzUB5yLocz5CG3ylhmNRr/5OebxXRy6FTAC1c8E/COjGKGrZ7/9
 o6EEC6ymfcRfKwsQkJY9Edpy7irZz9dd4b5AW1oeM8qxbpPK9Alj7JJqdqNqxGGRK2Cjw01uJui
 Nk+TObFuN+Qkx6YvdzL/cdG1HTbY6rfIu0h+2EmFKafb//vgGY4SYtpDP4wCp8IzIc69ZaY59qb
 LtIop3e5EpooDWnc21Zg++Yfz0RajZVz0SwWqMKmGTouLQlcwWLeIXw/GbAEcdO/zN0mhhtfRJx
 6xokgVb2Au0Yqld9begNDNVD7lAyoqcDWvFxbQpofolFNrTCDIZkbw0p2TolEJgEd9jMLN9yjoi
 PfyzPXlpt779WY7Eu0mBdvPe7Ldy2G2EctnCsqFIQd8d5TMNs7J8sw5FsgjzeQoisD68vU1L3R6
 2XSixqCoqsNUQ+Z9D8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020075
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 670AA1D4B09
X-Rspamd-Action: no action



On 2/24/2026 3:50 AM, Dmitry Baryshkov wrote:
> On Tue, Feb 24, 2026 at 12:39:02AM +0530, Ekansh Gupta wrote:
>> Introduce per-file and per-user context for the QDA DRM accelerator
>> driver. A new qda_file_priv structure is stored in file->driver_priv
>> for each open file descriptor, and a qda_user object is allocated per
>> client with a unique client_id generated from an atomic counter in
>> qda_dev.
>>
>> The DRM driver now provides qda_open() and qda_postclose() callbacks.
>> qda_open() resolves the qda_dev from the drm_device, allocates the
>> qda_file_priv and qda_user structures, and attaches them to the DRM
>> file. qda_postclose() tears down the per-file context and frees the
>> qda_user object when the file is closed.
>>
>> This prepares the QDA driver to track per-process state for future
>> features such as per-client memory mappings, job submission contexts,
>> and access control over DSP compute resources.
> Start by describing the problem instead of stuffing it to the end. Can
> we use something better suited for this task, like IDR?
ack, same comment for IDR here also, sticking with xarray everywhere for QDA for
uniformity and to avoid checkpatch warnings.
>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/accel/qda/qda_drv.c | 117 ++++++++++++++++++++++++++++++++++++++++++++
>>  drivers/accel/qda/qda_drv.h |  30 ++++++++++++
>>  2 files changed, 147 insertions(+)
>>
>> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
>> index a9113ec78fa2..bf95fc782cf8 100644
>> --- a/drivers/accel/qda/qda_drv.c
>> +++ b/drivers/accel/qda/qda_drv.c
>> @@ -12,11 +12,127 @@
>>  #include "qda_drv.h"
>>  #include "qda_rpmsg.h"
>>  
>> +static struct qda_drm_priv *get_drm_priv_from_device(struct drm_device *dev)
>> +{
>> +	if (!dev)
>> +		return NULL;
>> +
>> +	return (struct qda_drm_priv *)dev->dev_private;
>> +}
>> +
>> +static struct qda_dev *get_qdev_from_drm_device(struct drm_device *dev)
>> +{
>> +	struct qda_drm_priv *drm_priv;
>> +
>> +	if (!dev) {
>> +		qda_dbg(NULL, "Invalid drm_device\n");
>> +		return NULL;
>> +	}
>> +
>> +	drm_priv = get_drm_priv_from_device(dev);
>> +	if (!drm_priv) {
>> +		qda_dbg(NULL, "No drm_priv in dev_private\n");
>> +		return NULL;
>> +	}
>> +
>> +	return drm_priv->qdev;
>> +}
>> +
>> +static struct qda_user *alloc_qda_user(struct qda_dev *qdev)
>> +{
>> +	struct qda_user *qda_user;
>> +
>> +	qda_user = kzalloc_obj(*qda_user, GFP_KERNEL);
>> +	if (!qda_user)
>> +		return NULL;
>> +
>> +	qda_user->client_id = atomic_inc_return(&qdev->client_id_counter);
>> +	qda_user->qda_dev = qdev;
>> +
>> +	qda_dbg(qdev, "Allocated qda_user with client_id=%u\n", qda_user->client_id);
>> +	return qda_user;
>> +}
>> +
>> +static void free_qda_user(struct qda_user *qda_user)
>> +{
>> +	if (!qda_user)
>> +		return;
>> +
>> +	qda_dbg(qda_user->qda_dev, "Freeing qda_user client_id=%u\n", qda_user->client_id);
>> +
>> +	kfree(qda_user);
>> +}
>> +
>> +static int qda_open(struct drm_device *dev, struct drm_file *file)
>> +{
>> +	struct qda_user *qda_user;
>> +	struct qda_file_priv *qda_file_priv;
>> +	struct qda_dev *qdev;
>> +
>> +	if (!file) {
>> +		qda_dbg(NULL, "Invalid file pointer\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	qdev = get_qdev_from_drm_device(dev);
>> +	if (!qdev) {
>> +		qda_dbg(NULL, "Failed to get qdev from drm_device\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	qda_file_priv = kzalloc(sizeof(*qda_file_priv), GFP_KERNEL);
>> +	if (!qda_file_priv)
>> +		return -ENOMEM;
>> +
>> +	qda_file_priv->pid = current->pid;
>> +
>> +	qda_user = alloc_qda_user(qdev);
>> +	if (!qda_user) {
>> +		qda_dbg(qdev, "Failed to allocate qda_user\n");
>> +		kfree(qda_file_priv);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	file->driver_priv = qda_file_priv;
>> +	qda_file_priv->qda_user = qda_user;
>> +
>> +	qda_dbg(qdev, "Device opened successfully for PID %d\n", current->pid);
>> +
>> +	return 0;
>> +}
>> +
>> +static void qda_postclose(struct drm_device *dev, struct drm_file *file)
>> +{
>> +	struct qda_dev *qdev;
>> +	struct qda_file_priv *qda_file_priv;
>> +	struct qda_user *qda_user;
>> +
>> +	qdev = get_qdev_from_drm_device(dev);
>> +	if (!qdev || atomic_read(&qdev->removing)) {
>> +		qda_dbg(NULL, "Device unavailable or removing\n");
>> +		return;
> Even if it is being removed, no need to free the memory?
Right, It should still be freed.
>
>> +	}
>> +
>> +	qda_file_priv = (struct qda_file_priv *)file->driver_priv;
>> +	if (qda_file_priv) {
>> +		qda_user = qda_file_priv->qda_user;
>> +		if (qda_user)
>> +			free_qda_user(qda_user);
>> +
>> +		kfree(qda_file_priv);
>> +		file->driver_priv = NULL;
>> +	}
>> +
>> +	qda_dbg(qdev, "Device closed for PID %d\n", current->pid);
>> +}
>> +
>>  DEFINE_DRM_ACCEL_FOPS(qda_accel_fops);
>>  
>>  static struct drm_driver qda_drm_driver = {
>>  	.driver_features = DRIVER_COMPUTE_ACCEL,
>>  	.fops			= &qda_accel_fops,
>> +	.open			= qda_open,
>> +	.postclose		= qda_postclose,
>>  	.name = DRIVER_NAME,
>>  	.desc = "Qualcomm DSP Accelerator Driver",
>>  };
>> @@ -58,6 +174,7 @@ static void init_device_resources(struct qda_dev *qdev)
>>  
>>  	mutex_init(&qdev->lock);
>>  	atomic_set(&qdev->removing, 0);
>> +	atomic_set(&qdev->client_id_counter, 0);
>>  }
>>  
>>  static int init_memory_manager(struct qda_dev *qdev)
>> diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
>> index 2b80401a3741..e0ba37702a86 100644
>> --- a/drivers/accel/qda/qda_drv.h
>> +++ b/drivers/accel/qda/qda_drv.h
>> @@ -10,6 +10,7 @@
>>  #include <linux/list.h>
>>  #include <linux/mutex.h>
>>  #include <linux/rpmsg.h>
>> +#include <linux/types.h>
>>  #include <linux/xarray.h>
>>  #include <drm/drm_drv.h>
>>  #include <drm/drm_file.h>
>> @@ -20,6 +21,33 @@
>>  /* Driver identification */
>>  #define DRIVER_NAME "qda"
>>  
>> +/**
>> + * struct qda_file_priv - Per-process private data for DRM file
>> + *
>> + * This structure tracks per-process state for each open file descriptor.
>> + * It maintains the IOMMU device assignment and links to the legacy qda_user
>> + * structure for compatibility with existing code.
>> + */
>> +struct qda_file_priv {
>> +	/* Process ID for tracking */
>> +	pid_t pid;
>> +	/* Pointer to qda_user structure for backward compatibility */
>> +	struct qda_user *qda_user;
>> +};
>> +
>> +/**
>> + * struct qda_user - Per-user context for remote processor interaction
>> + *
>> + * This structure maintains per-user state for interactions with the
>> + * remote processor, including memory mappings and pending operations.
>> + */
>> +struct qda_user {
>> +	/* Unique client identifier */
>> +	u32 client_id;
>> +	/* Back-pointer to device structure */
>> +	struct qda_dev *qda_dev;
>> +};
>> +
>>  /**
>>   * struct qda_drm_priv - DRM device private data for QDA device
>>   *
>> @@ -52,6 +80,8 @@ struct qda_dev {
>>  	struct qda_drm_priv *drm_priv;
>>  	/* Flag indicating device removal in progress */
>>  	atomic_t removing;
>> +	/* Atomic counter for generating unique client IDs */
>> +	atomic_t client_id_counter;
>>  	/* Name of the DSP (e.g., "cdsp", "adsp") */
>>  	char dsp_name[16];
>>  	/* Compute context-bank (CB) child devices */
>>
>> -- 
>> 2.34.1
>>

