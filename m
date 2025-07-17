Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51979B082DB
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 04:24:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D7510E3DD;
	Thu, 17 Jul 2025 02:24:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="QT8pHaeZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B9910E3DD
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 02:24:03 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GGDRvM025369;
 Thu, 17 Jul 2025 02:23:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 i+DfdxtuIvR2BzrMlwN2CJJomdoX7I//dIsC1iLbNak=; b=QT8pHaeZ6LOdpknv
 MYT2QIHvyojdEra9Jk6wexI9SULbW5Kt7/y/1KHAVsyUxLS7RL6sClHtbKEje7x7
 y/URPm6fqo5t0tMpK8JJvQo2la3Ri8t7a4VewJPeDZLPFOgG3Qsh4uEUUfQN1AjO
 yQ0GzWX9hWgnPv+n1YoiplVBXip2xPpDB4YTcziTEtlQhuLIXyt7n/21eNwh9r+0
 yhj1/WcnFCoz/BwEpdnCrN/zVKQ4p0X4LB3KLCCZEn7FMNrx00OCC98fTXb4ejUv
 FoIxorqYBHm3Xos1KrXu+B06P8ZMW6bjo3nCCbzH5rv9v/afhDd6YrrfTYDOxEcJ
 +c/57Q==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47xbsqa6j1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jul 2025 02:23:56 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56H2Nt0E028532
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jul 2025 02:23:55 GMT
Received: from [10.239.29.49] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 16 Jul
 2025 19:23:51 -0700
Message-ID: <77620d80-0fd6-4878-ac74-0e81022544f7@quicinc.com>
Date: Thu, 17 Jul 2025 10:23:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/4] misc: fastrpc: Cleanup the domain names
To: Bjorn Andersson <andersson@kernel.org>
CC: <srini@kernel.org>, <amahesh@qti.qualcomm.com>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <konradybcio@kernel.org>,
 <arnd@arndb.de>, <gregkh@linuxfoundation.org>, <quic_kuiw@quicinc.com>,
 <ekansh.gupta@oss.qualcomm.com>, <devicetree@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>
References: <20250714054133.3769967-1-quic_lxu5@quicinc.com>
 <20250714054133.3769967-4-quic_lxu5@quicinc.com>
 <p7la5xeudperckksogd2qsxjmvj2q33gud36aylrt3dlfusqnc@243j5siplhoy>
Content-Language: en-US
From: Ling Xu <quic_lxu5@quicinc.com>
In-Reply-To: <p7la5xeudperckksogd2qsxjmvj2q33gud36aylrt3dlfusqnc@243j5siplhoy>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=ad1hnQot c=1 sm=1 tr=0 ts=68785ebd cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=ANeK8bI-BXgzLtl00b4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=-_B0kFfA75AA:10 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 1B2xP9KJXgl836DFVB0K2CuJg23qEWtn
X-Proofpoint-GUID: 1B2xP9KJXgl836DFVB0K2CuJg23qEWtn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDAyMCBTYWx0ZWRfX2ojxT0xbwaP1
 692L1L21KJaCvypPoOvN7WeFGGVxbQ9dlZ8HRFbQZJV6jDez7sH4+0cAe9CgrDWR6Jls65xZWO0
 S1CufJIjLmOlzCxveUNfJackVjevaxA2vtUtsN4LCCEgxZDMWf9JoouQSCx20lDSSwxQX79a7tv
 dqsOUseX8wkAFe89uMgAE/fHEu+8WHwsLRvPrNu9dIZ9v3o6oc6p6t8RxhOKsVJ71KGwMNPLpRO
 A29ix7qw8J0rGEQHYsnxauZZGvlPbFmWGIcIRPA37L7t0zQO/ypvDFhY6VceIayRjiDF7HjYvZi
 7g856zoOd9e+zPMyoxTLWscgI3s0ndV5E5mNN7Pge0lTpDGkGOehmSwWhnH3B7qJKhVOJRaBApD
 NjPpr/xHBb6xzdNpDCzzW04kIZnOzYjlboMUlFht3361v61KurRb7B9cZRi6lMxfBUfMM3vi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170020
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

在 7/17/2025 3:28 AM, Bjorn Andersson 写道:
> On Mon, Jul 14, 2025 at 11:11:32AM +0530, Ling Xu wrote:
>> Currently the domain ids are added for each instance of domains, this is
>> totally not scalable approach.
> 
> This sentence only makes sense for people in your team or participants
> of some recent meeting or (private) mail thread of yours. When providing
> you problem description [1], do so in a way that it makes sense to
> people outside that bubble - and yourself next month.
> 
> [1] https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> 
>> Clean this mess and create domain ids for
>> only domains not its instances.
>>
> 
> Is the "mess" that the domain is part of the ioctl, or is the mess that
> the names of the domains are defined in an array and you prefer them to
> be listed out in code (fastrpc_get_domain_id())?
I already split this to 2 changes in latest patch, mess means we created domain ids
for its instances.
> 
>> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
>> ---
>>  drivers/misc/fastrpc.c      | 50 ++++++++++++++++---------------------
>>  include/uapi/misc/fastrpc.h |  2 +-
>>  2 files changed, 22 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 378923594f02..85b6eb16b616 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -27,8 +27,6 @@
>>  #define MDSP_DOMAIN_ID (1)
>>  #define SDSP_DOMAIN_ID (2)
>>  #define CDSP_DOMAIN_ID (3)
>> -#define CDSP1_DOMAIN_ID (4)
>> -#define FASTRPC_DEV_MAX		5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
>>  #define FASTRPC_MAX_SESSIONS	14
>>  #define FASTRPC_MAX_VMIDS	16
>>  #define FASTRPC_ALIGN		128
>> @@ -106,8 +104,6 @@
>>  
>>  #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>>  
>> -static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
>> -						"sdsp", "cdsp", "cdsp1" };
>>  struct fastrpc_phy_page {
>>  	u64 addr;		/* physical address */
>>  	u64 size;		/* size of contiguous region */
>> @@ -1723,7 +1719,6 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
>>  	uint32_t attribute_id = cap->attribute_id;
>>  	uint32_t *dsp_attributes;
>>  	unsigned long flags;
>> -	uint32_t domain = cap->domain;
>>  	int err;
>>  
>>  	spin_lock_irqsave(&cctx->lock, flags);
>> @@ -1741,7 +1736,7 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
>>  	err = fastrpc_get_info_from_dsp(fl, dsp_attributes, FASTRPC_MAX_DSP_ATTRIBUTES);
>>  	if (err == DSP_UNSUPPORTED_API) {
>>  		dev_info(&cctx->rpdev->dev,
>> -			 "Warning: DSP capabilities not supported on domain: %d\n", domain);
>> +			 "Warning: DSP capabilities not supported\n");
>>  		kfree(dsp_attributes);
>>  		return -EOPNOTSUPP;
>>  	} else if (err) {
>> @@ -1769,17 +1764,6 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
>>  		return  -EFAULT;
>>  
>>  	cap.capability = 0;
>> -	if (cap.domain >= FASTRPC_DEV_MAX) {
>> -		dev_err(&fl->cctx->rpdev->dev, "Error: Invalid domain id:%d, err:%d\n",
>> -			cap.domain, err);
>> -		return -ECHRNG;
>> -	}
>> -
>> -	/* Fastrpc Capablities does not support modem domain */
>> -	if (cap.domain == MDSP_DOMAIN_ID) {
>> -		dev_err(&fl->cctx->rpdev->dev, "Error: modem not supported %d\n", err);
>> -		return -ECHRNG;
>> -	}
>>  
>>  	if (cap.attribute_id >= FASTRPC_MAX_DSP_ATTRIBUTES) {
>>  		dev_err(&fl->cctx->rpdev->dev, "Error: invalid attribute: %d, err: %d\n",
>> @@ -2255,6 +2239,20 @@ static int fastrpc_device_register(struct device *dev, struct fastrpc_channel_ct
>>  	return err;
>>  }
>>  
>> +static int fastrpc_get_domain_id(const char *domain)
>> +{
>> +	if (!strncmp(domain, "adsp", 4))
>> +		return ADSP_DOMAIN_ID;
>> +	else if (!strncmp(domain, "cdsp", 4))
>> +		return CDSP_DOMAIN_ID;
>> +	else if (!strncmp(domain, "mdsp", 4))
>> +		return MDSP_DOMAIN_ID;
>> +	else if (!strncmp(domain, "sdsp", 4))
>> +		return SDSP_DOMAIN_ID;
>> +
> 
> The removed code performs a string compare and you replace this with a
> string prefix compare, but there's no motivation given to why this is
> done.
> 
> I'm also wondering why cdsp1 is now in CDSP_DOMAIN_ID, is that
> intentional? Was it wrong before? If so, that change should be done
> alone and with a Fixes: 
> 
cdsp1 use cdsp0 daemon, they are two instances but one domain.
In kernel, we just care about the domains. we just give a scalable 
approach without adding instances for any new dsp every time.
> Regards,
> Bjorn
> 
>> +	return -EINVAL;
>> +}
>> +
>>  static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>  {
>>  	struct device *rdev = &rpdev->dev;
>> @@ -2272,15 +2270,10 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>  		return err;
>>  	}
>>  
>> -	for (i = 0; i < FASTRPC_DEV_MAX; i++) {
>> -		if (!strcmp(domains[i], domain)) {
>> -			domain_id = i;
>> -			break;
>> -		}
>> -	}
>> +	domain_id = fastrpc_get_domain_id(domain);
>>  
>>  	if (domain_id < 0) {
>> -		dev_info(rdev, "FastRPC Invalid Domain ID %d\n", domain_id);
>> +		dev_info(rdev, "FastRPC Domain %s not supported\n", domain);
>>  		return -EINVAL;
>>  	}
>>  
>> @@ -2330,21 +2323,20 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>  	case ADSP_DOMAIN_ID:
>>  	case MDSP_DOMAIN_ID:
>>  	case SDSP_DOMAIN_ID:
>> -		/* Unsigned PD offloading is only supported on CDSP and CDSP1 */
>> +		/* Unsigned PD offloading is only supported on CDSP */
>>  		data->unsigned_support = false;
>> -		err = fastrpc_device_register(rdev, data, secure_dsp, domains[domain_id]);
>> +		err = fastrpc_device_register(rdev, data, secure_dsp, domain);
>>  		if (err)
>>  			goto err_free_data;
>>  		break;
>>  	case CDSP_DOMAIN_ID:
>> -	case CDSP1_DOMAIN_ID:
>>  		data->unsigned_support = true;
>>  		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
>> -		err = fastrpc_device_register(rdev, data, true, domains[domain_id]);
>> +		err = fastrpc_device_register(rdev, data, true, domain);
>>  		if (err)
>>  			goto err_free_data;
>>  
>> -		err = fastrpc_device_register(rdev, data, false, domains[domain_id]);
>> +		err = fastrpc_device_register(rdev, data, false, domain);
>>  		if (err)
>>  			goto err_deregister_fdev;
>>  		break;
>> diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
>> index f33d914d8f46..c6e2925f47e6 100644
>> --- a/include/uapi/misc/fastrpc.h
>> +++ b/include/uapi/misc/fastrpc.h
>> @@ -134,7 +134,7 @@ struct fastrpc_mem_unmap {
>>  };
>>  
>>  struct fastrpc_ioctl_capability {
>> -	__u32 domain;
>> +	__u32 unused; /* deprecated, ignored by the kernel */
>>  	__u32 attribute_id;
>>  	__u32 capability;   /* dsp capability */
>>  	__u32 reserved[4];
>> -- 
>> 2.34.1
>>

-- 
Thx and BRs,
Ling Xu

