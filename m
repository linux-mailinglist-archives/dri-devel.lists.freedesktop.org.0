Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 630506D7F6E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 16:28:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4CE510E0F2;
	Wed,  5 Apr 2023 14:28:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30D8910E0F2
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 14:28:43 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 335AribA010049; Wed, 5 Apr 2023 14:28:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=3+J+WKwJGaERCF/cnsSlj71w8+3ldjXzGdTHoHIh6AI=;
 b=A3BFHsRxaOrmF8TsuFi0dBSkIawJB7IFuN1mAt/qmpNC+g6Vjze1WMaWRP7vX2phSPSq
 SHAZaQIYdAeStitUu2h+fEkvJ31m5T+SJQUIXGXe7HZvkwkGbG0pR0SnQvz8ZQ/ufUTN
 KjuShWcMxitGG6NPBv5pVQf0UV9ArmQU2LCqus1Zo+6LiH/PZ5rLXYpFduP3WcFAO/aO
 gi+Kl2ET362ABoBbqUzY/ILTIp3JUN+lAtYR8b9FVfA1ugyBspI/U9V0KNdS/q3QMVy3
 qK3BUzYBVoVt1cJaIHEZfCSIPb90PZltLwdAp8NQcAdQqVBTBT/4FJmolxXeNrQ3YVWX Pg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ps6vf8hsk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Apr 2023 14:28:36 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 335ESZaq015621
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 5 Apr 2023 14:28:35 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 5 Apr 2023
 07:28:34 -0700
Message-ID: <32ee0be5-99cf-7b0b-e195-73c6ef3294af@quicinc.com>
Date: Wed, 5 Apr 2023 08:28:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v5 0/8] QAIC accel driver
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>, Oded Gabbay <ogabbay@kernel.org>
References: <1679932497-30277-1-git-send-email-quic_jhugo@quicinc.com>
 <857db3fb-b006-4aa8-a7f8-2ae0b8a160c9@quicinc.com>
 <c5d11a88-351a-8eaf-f1d2-d7cf37cdf81c@linux.intel.com>
 <CAFCwf12iVZkcPKOEc911-fCd4-YzHYJzs_p36jfBiT=VkcO9uQ@mail.gmail.com>
 <ZC13QdSRybIe3nvk@phenom.ffwll.local>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <ZC13QdSRybIe3nvk@phenom.ffwll.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: oCZyWxozG6cGObvtRA7frcoRXqAvts0d
X-Proofpoint-ORIG-GUID: oCZyWxozG6cGObvtRA7frcoRXqAvts0d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-05_09,2023-04-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 mlxscore=0 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304050131
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
Cc: linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, mani@kernel.org,
 dri-devel@lists.freedesktop.org, quic_ajitpals@quicinc.com,
 quic_pkanojiy@quicinc.com, stanislaw.gruszka@linux.intel.com,
 quic_carlv@quicinc.com, Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 bagasdotme@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/5/2023 7:27 AM, Daniel Vetter wrote:
> On Wed, Apr 05, 2023 at 03:35:19PM +0300, Oded Gabbay wrote:
>> On Wed, Apr 5, 2023 at 2:26 PM Jacek Lawrynowicz
>> <jacek.lawrynowicz@linux.intel.com> wrote:
>>>
>>> Hi,
>>>
>>> On 03.04.2023 19:22, Jeffrey Hugo wrote:
>>>> On 3/27/2023 9:54 AM, Jeffrey Hugo wrote:
>>>>> This series introduces a driver under the accel subsystem (QAIC -
>>>>> Qualcomm AIC) for the Qualcomm Cloud AI 100 product (AIC100).  AIC100 is
>>>>> a PCIe adapter card that hosts a dedicated machine learning inference
>>>>> accelerator.
>>>>>
>>>>> The previous version (v4) can be found at:
>>>>> https://lore.kernel.org/all/1679325074-5494-1-git-send-email-quic_jhugo@quicinc.com/
>>>>
>>>> Looks like things have been silent on this revision and we have a number of review tags already.  Seems like this series is ready for merge.
>>>>
>>>> I'd like to see this queued for 6.4 if possible.  Given that we are at 6.3-rc5, it seems like this would need to be merged now(ish) to make 6.4.
>>>>
>>>> Jacek, since you have commit permissions in drm-misc and are an active Accel maintainer, I wonder if it would be appropriate for you to merge this series to drm-misc.  Thoughts?
>>>
>>> I'm would be happy to merge it but I think it needs to be acked by Oded first.
>>>
>>> Regards,
>>> Jacek
>>
>> Hi,
>> Entire patch-set is:
>> Acked-by: Oded Gabbay <ogabbay@kernel.org>
> 
> Once Jacke has pushed this I htink it would also be good to get Jeffrey
> commit rights for drm-misc, so that in the future bugfixes for the qaic
> driver can be pushed directly by the qaic team. Still with acks/r-b
> requirements as per usual, and I guess for anything bigger/new uapi an ack
> from oded is needed.
> 
> https://drm.pages.freedesktop.org/maintainer-tools/commit-access.html#drm-misc
> 
> Cheers, Daniel

Yep.  This is the plan per my understanding.

-Jeff
