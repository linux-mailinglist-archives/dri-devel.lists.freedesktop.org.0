Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 925E1596250
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 20:23:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B038C10E302;
	Tue, 16 Aug 2022 18:23:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E2C10E302
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 18:23:03 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27GGI109003238;
 Tue, 16 Aug 2022 18:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=9S/LZTffhDxdOfWJTMU6GPQavACA5Tpw4RnHCBoPrHk=;
 b=QytVJYlQ1hm1qjbuhi4oZjv9CxRMFjyzH9yibWuzzhlg6qFvICljFHcgNw6zQv17iqv2
 FWXmDuzEgz1KEci0rGg1GPuMUqXVQe/Gql8qNNa2zOwOAsDePTgO1ewQ5tsujDelSr+P
 LTqdBY0Ye9oSR+9tjPWVLKfM2jxdBS5pAhhp9F8rif91jFZd2T+ndHQeJ2o3ZqfGOwsy
 tAPzDVurQxiCAR2VlSfJhwxD5idBqog+5QFpcm1kpj+rbi1ntZNRLFLUL3yCJCbwl1Vu
 ow+hj5/oJhm+dc8GXEQngJ6voCqhaYCXBneNIyv4ayXxpy1cPWLsn18seepAVN/kVPg0 uw== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j08rs9t3b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Aug 2022 18:22:56 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.47.97.222])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27GIMuEe029053
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Aug 2022 18:22:56 GMT
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 16 Aug 2022 11:22:55 -0700
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 16 Aug
 2022 11:22:54 -0700
Message-ID: <9eba0937-b4cb-4c62-e339-8ff33aebdbde@quicinc.com>
Date: Tue, 16 Aug 2022 12:22:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [RFC PATCH 02/14] drm/qaic: Add uapi and core driver file
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, <airlied@linux.ie>, 
 <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>
References: <1660588956-24027-1-git-send-email-quic_jhugo@quicinc.com>
 <1660588956-24027-3-git-send-email-quic_jhugo@quicinc.com>
 <10ad6023-703d-65cf-6b00-2caa658c49e9@linaro.org>
 <e9786447-edd4-90e0-25a9-b35e96adbfc2@quicinc.com>
 <3f755d24-969b-1804-7979-880a9fe10cba@linaro.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <3f755d24-969b-1804-7979-880a9fe10cba@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: gJ4X4EjZUHW8cV9-y8VU18mtp_avKkJB
X-Proofpoint-GUID: gJ4X4EjZUHW8cV9-y8VU18mtp_avKkJB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-16_08,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208160068
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_ajitpals@quicinc.com,
 quic_pkanojiy@quicinc.com, quic_carlv@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/16/2022 12:00 PM, Krzysztof Kozlowski wrote:
> On 16/08/2022 20:47, Jeffrey Hugo wrote:
>>>> +static int qaic_pci_probe(struct pci_dev *pdev,
>>>> +			  const struct pci_device_id *id)
>>>> +{
>>>> +	int ret;
>>>> +	int i;
>>>> +	int mhi_irq;
>>>> +	struct qaic_device *qdev;
>>>> +
>>>> +	qdev = kzalloc(sizeof(*qdev), GFP_KERNEL);
>>>> +	if (!qdev) {
>>>
>>> return -ENOMEM;
>>
>> So, no centralized exit per the coding style?  Ok.
> 
> Centralized exit except for cases where it is simply return. >
>>
>>>
>>>> +		ret = -ENOMEM;
>>>> +		goto qdev_fail;
>>>> +	}
>>>> +
>>>> +	if (id->device == PCI_DEV_AIC100) {
>>>> +		qdev->num_dbc = 16;
>>>> +		qdev->dbc = kcalloc(qdev->num_dbc, sizeof(*qdev->dbc),
>>>> +				    GFP_KERNEL);
>>>
>>> Why not devm?
>>
>> We were having issues with devm and the PCI stuff.  Looking at this
>> again, I think we can apply that here.
>>
>>>
>>>> +		if (!qdev->dbc) {
>>>> +			ret = -ENOMEM;
>>>> +			goto device_id_fail;
>>>> +		}
>>>> +	} else {
>>>> +		pci_dbg(pdev, "%s: No matching device found for device id %d\n",
>>>> +			__func__, id->device);
>>>
>>> How this can happen?
>>
>> Badly functioning hardware.  That hardware has been removed from
>> circulation.  Given that this is an init path and not performance
>> critical, having this handle the scenario in a sane way instead of
>> having the driver blow up in a weird way much later on makes me feel better.
> 
> How badly functioning hardware can bind and then report some different
> ID? If it reports different ID, it cannot bind...

It was one of those issues that was painful enough that I still remember 
it occurring, but long ago enough that I don't remember the specifics.

I don't think I'll be able to recreate the issue to re-debug it, so I'll 
just remove this.

>>>> +static int __init qaic_init(void)
>>>> +{
>>>> +	int ret;
>>>> +
>>>> +	if (datapath_polling) {
>>>> +		poll_datapath = true;
>>>> +		pr_info("qaic: driver initializing in datapath polling mode\n");
>>>
>>> No pr() in normal path of init/exit.
>>
>> This is not the normal path.  datapath_polling is a module parameter.
>> This is something the user can enable, and so it would be good to have
>> the user informed that the option took effect.
> 
> No, not really. User always can check via sysfs and there is no point in
> polluting dmesg on module load. It might be printed (if someone has such
> modprobe setting) on every system, even without the actual device.

So, I guess this is limited to platform devices?
I see GIC, IOMMU, and PCI doing the same
I guess, will remove.

> 
>>
>>>
>>>> +	}
>>>> +
>>>> +	qaic_logging_register();
>>>> +
>>>> +	ret = mhi_driver_register(&qaic_mhi_driver);
>>>> +	if (ret) {
>>>> +		pr_debug("qaic: mhi_driver_register failed %d\n", ret);
>>>> +		goto free_class;
>>>> +	}
>>>> +
>>>> +	ret = pci_register_driver(&qaic_pci_driver);
>>>> +
>>>
>>> No need for such blank lines.
>>
>> Agreed.
>>
>>>
>>>> +	if (ret) {
>>>> +		pr_debug("qaic: pci_register_driver failed %d\n", ret);
>>>> +		goto free_mhi;
>>>> +	}
>>>> +
>>>> +	qaic_telemetry_register();
>>>> +	qaic_ras_register();
>>>> +	qaic_ssr_register();
>>>> +	goto out;
>>>
>>> return 0.
>>
>> Ok.
>>
>>>
>>>> +
>>>> +free_mhi:
>>>> +	mhi_driver_unregister(&qaic_mhi_driver);
>>>> +free_class:
>>>> +out:
>>>> +	if (ret)
>>>> +		qaic_logging_unregister();
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static void __exit qaic_exit(void)
>>>> +{
>>>> +	pr_debug("qaic: exit\n");
>>>
>>> No pr() in normal path of init/exit.
>>
>> Sure.
>>
>>>
>>>> +	link_up = true;
>>>
>>> This is confusing...
>>
>> Will add a comment.  This ties into MHI, and how it can tear down in two
>> different ways, usually based on the link state.
> 
> Shouldn't this be link_up=false?

No.  module_exit() will be triggered on rmmod.  exit() will unregister 
the driver, which will cause qaic_pci_remove() to be called.  remove() 
calls qaic_mhi_free_controller() which uses the link state.

However, a hotplug event will also trigger qaic_pci_remove().

rmmod - link is up
hotplug - link is down

>> In this case, we are doing a clean tear down where the link is still up,
>> and so we should have MHI do the extra tear down that leaves the device
>> in a good state, in the event the driver gets added again.
>>
>>>
> 
> 
> 
> Best regards,
> Krzysztof

