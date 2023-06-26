Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B57D773E634
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 19:16:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5918410E0CD;
	Mon, 26 Jun 2023 17:16:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE60E10E0CD
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 17:16:02 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35QAbfRq019286; Mon, 26 Jun 2023 17:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=NkiFzCe25ddo2CI1iUwfIKdPfKGFMT4upqMXkk7C3OQ=;
 b=WvfTG+Ce7OiqRZEwOJypw6r1nMQ/R0jtiAAIIAgz0VJLJIrAAVa3C/9xr69fqlvxi48l
 iE4agheJleyfEyZQUJPvjyEvLZ+iQxKaQoTp+/OIJsoSWxE8Ro9N+D8HRvFqzW73J420
 bx+WePGvCngnh5uFXOLEoZdHddUwqECKX6qxIxRd9iFe/49u4Rlrr907HKXT/OtGd3Tj
 jQ7CFQzLJIl6kkiXeCG10o2AtyvFCmDA+66INFAdvhgotncKWtEq9V1Jt+Y7g+BCpAkJ
 hFi02Ka4KdLlzbq15kQAZ/5FB0s6lheuWqXpBWyQhr6m7Sx14jd9wAy+7UzzWi0DUe9E sw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rdssdmmaa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Jun 2023 17:15:58 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35QHFvhs001058
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Jun 2023 17:15:57 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 26 Jun
 2023 10:15:57 -0700
Message-ID: <507f4cc2-15c2-8323-878e-4da00505bc45@quicinc.com>
Date: Mon, 26 Jun 2023 11:15:56 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 0/2] Add MHI quirk for QAIC
Content-Language: en-US
To: Manivannan Sadhasivam <mani@kernel.org>
References: <20230519163902.4170-1-quic_jhugo@quicinc.com>
 <20230608115928.GA5672@thinkpad>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230608115928.GA5672@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: tc5UBN98mjMhOlVn5IJFVr011CeDJDEI
X-Proofpoint-ORIG-GUID: tc5UBN98mjMhOlVn5IJFVr011CeDJDEI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-26_14,2023-06-26_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306260158
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mhi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/8/2023 5:59 AM, Manivannan Sadhasivam wrote:
> On Fri, May 19, 2023 at 10:39:00AM -0600, Jeffrey Hugo wrote:
>> With the QAIC driver in -next, I'd like to suggest some MHI changes that
>> specific to AIC100 devices, but perhaps provide a framework for other
>> device oddities.
>>
>> AIC100 devices technically violate the MHI spec in two ways. Sadly, these
>> issues comes from the device hardware, so host SW needs to work around
>> them.
>>
>> Thie first issue, presented in this series, has to do with the
>> SOC_HW_VERSION register. This register is suposed to be initialized by the
>> hardware prior to the MHI being accessable by the host to contain a
>> version string for the SoC of the device. This could be used by the host
>> MHI controller software to identify and handle version to version changes.
>> The AIC100 hardware does not initialize this register, and thus it
>> contains garbage.
>>
>> This would not be much of a problem normally - the QAIC driver would just
>> never use it. However the MHI stack uses this register as part of the init
>> sequence and if the controller reports that the register is inaccessable
>> then the init sequence fails.  On some AIC100 cards, the garbage value
>> ends up being 0xFFFFFFFF which is PCIe spec defined to be a special value
>> indicating the access failed.  The MHI controller cannot tell if that
>> value is a PCIe link issue, or just garbage.
>>
>> QAIC needs a way to tell MHI not to use this register. Other buses have a
>> quirk mechanism - a way to describe oddities in a particular
>> implementation that have some kind of workaround. Since this seems to be
>> the first need for such a thing in MHI, introduce a quirk framework.
>>
>> The second issue AIC100 has involves the PK Hash registers. A solution for
>> this is expected to be proposed in the near future and is anticipated to
>> make use of the quirk framework proposed here. With PK Hash, there are two
>> oddities to handle. AIC100 does not initialize these registers until the
>> SBL is running, which is later than the spec indicates, and in practice
>> is after MHI reads/caches them. Also, AIC100 does not have enough
>> registers defined to fully report the 5 PK Hash slots, so a custom
>> reporting format is defined by the device.
>>
> 
> Looking at the two issues you reported above, it looks to me that they can be
> handled inside the aic100 mhi_controller driver itself. Since the MHI stack
> exports the read_reg callback to controller drivers, if some registers are not
> supported by the device, then the callback can provide some fixed dummy data
> emulating the register until the issue is fixed in the device (if at all).
> 
> Quirk framework could be useful if the device misbehaves against the protocol
> itself but for the register issues like this, I think the controller driver can
> handle itself.
> 
> What do you think?

I think for the HW_VERSION register, your suggestion is very good, and 
something I plan to adopt.

For the PK Hash registers, I don't think it quite works.

HW_VERSION I can hard code to a valid value, or just stub out to 0 since 
that appears to be only consumed by the MHI Controller, and we don't use it.

The PK Hash registers are programmed into the SoC, and can be unique 
from SoC to SoC.  I don't see how the driver can provide valid, but 
faked information for them.  Also, the user consumes this data via 
sysfs.  We'd like to give the data to the user, and we can't fake it. 
Also the data is dynamic.

Lets start with the dynamic data issue.  Right now MHI reads these 
registers once, and caches the values.  I would propose a quirk to 
change that behavior for AIC100, but does MHI really need to operate in 
a "read once" mode?  Would something actually break if MHI read the 
registers every time the sysfs node is accessed?  Then sysfs would 
display the latest data, which would be beneficial to AIC100 and should 
not be a behavior change for other devices which have static data (MHI 
just displays the same data because it hasn't changed).

Do you recall the reason behind making the PK Hash registers read once 
and cached?

> 
> - Mani
> 
>> v2:
>> -Fix build error
>> -Fix typo in commit text
>>
>> Jeffrey Hugo (2):
>>    bus: mhi: host: Add quirk framework and initial quirk
>>    accel/qaic: Add MHI_QUIRK_SOC_HW_VERSION_UNRELIABLE
>>
>>   drivers/accel/qaic/mhi_controller.c |  1 +
>>   drivers/bus/mhi/host/init.c         | 13 +++++++++----
>>   include/linux/mhi.h                 | 18 ++++++++++++++++++
>>   3 files changed, 28 insertions(+), 4 deletions(-)
>>
>> -- 
>> 2.40.1
>>
>>
> 

