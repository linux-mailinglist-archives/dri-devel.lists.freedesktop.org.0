Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6F28CB104
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 17:10:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5BBF10ED00;
	Tue, 21 May 2024 15:10:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="lVYAWRBU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8997910ECCC
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 15:10:17 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44LEj8J7031089;
 Tue, 21 May 2024 15:10:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=Qn4a7U5EFTYvJ9ioNxoOdApph5VlgHcMCKWRJlk0lbM=; b=lV
 YAWRBUHegBVCIyACSukvVvyzc4g/+rEsUV5bRKZ9BHq2cHF4U1uYYeE07zpwWgmu
 m6R9wklhbdfLuBRaHHAfiu3TOIzA2JloTsWb6gigDSP+yXqS8ZZ9Yvsxx1wbdO7C
 TWsm789ece426nC07MPRB8rzzoSsjTyLvw9hLmiSPzMqWSZdCTMQZ9hqCJlqkyrU
 P9xYxax4ZKWYfUxFMQNzsxso26WuLOFOC0NJsAaDYNGJbQSRBIciIWmIHW84oKvI
 eYk/Y1gdipHRfCZaurfUe+/AnPBs/CdnLmwzfdzWjZ/+F+HLIVsZahJfn0JJuLhc
 6zkp28t5EtMVwgLBUozQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6psax92a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 May 2024 15:10:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44LFAA1O031574
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 May 2024 15:10:10 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 21 May
 2024 08:10:09 -0700
Message-ID: <e22ffdea-3c18-3a23-e526-25809e98fcd9@quicinc.com>
Date: Tue, 21 May 2024 09:10:08 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: DRM Accel BoF at Linux Plumbers
Content-Language: en-US
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, open list
 <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, Oded Gabbay
 <ogabbay@kernel.org>, Olof Johansson <olof@lixom.net>, Lucas Stach
 <l.stach@pengutronix.de>
References: <CAAObsKAw174AhGaA13Hyw0ANW=TxJHpK10+OwQGNMVca85Urdg@mail.gmail.com>
 <ZkyPoIXBeBUqFJ48@phenom.ffwll.local>
 <CAAObsKAJvgg54zBEP-e3PKPLVeX+akZFJudjutjzVVZOJa-41g@mail.gmail.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <CAAObsKAJvgg54zBEP-e3PKPLVeX+akZFJudjutjzVVZOJa-41g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: hxakFKEuUBJeIGJ_WXH_kjQc2IOtJ4v1
X-Proofpoint-ORIG-GUID: hxakFKEuUBJeIGJ_WXH_kjQc2IOtJ4v1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_09,2024-05-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 clxscore=1011
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405210113
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

On 5/21/2024 8:41 AM, Tomeu Vizoso wrote:
> On Tue, May 21, 2024 at 2:12 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>>
>> On Sat, May 18, 2024 at 10:46:01AM +0200, Tomeu Vizoso wrote:
>>> Hi,
>>>
>>> I would like to use the chance at the next Plumbers to discuss the
>>> present challenges related to ML accelerators in mainline.
>>>
>>> I'm myself more oriented towards edge-oriented deployments, and don't
>>> know enough about how these accelerators are being used in the cloud
>>> (and maybe desktop?) to tell if there is enough overlap to warrant a
>>> common BoF.
>>>
>>> In any case, these are the topics I would like to discuss, some
>>> probably more relevant to the edge than to the cloud or desktop:
>>>
>>> * What is stopping vendors from mainlining their drivers?
>>>
>>> * How could we make it easier for them?
>>>
>>> * Userspace API: how close are we from a common API that we can ask
>>> userspace drivers to implement? What can be done to further this goal?
>>>
>>> * Automated testing: DRM CI can be used, but would be good to have a
>>> common test suite to run there. This is probably dependent on a common
>>> userspace API.
>>>
>>> * Other shared userspace infrastructure (compiler, execution,
>>> synchronization, virtualization, ...)
>>>
>>> * Firmware-mediated IP: what should we do about it, if anything?
>>>
>>> * Any standing issues in DRM infra (GEM, gpu scheduler, DMABuf, etc)
>>> that are hurting accel drivers?
>>>
>>> What do people think, should we have a drivers/accel-wide BoF at
>>> Plumbers? If so, what other topics should we have in the agenda?
>>
>> Yeah sounds good, and I'll try to at least attend lpc this year since it's
>> rather close ... Might be good to explicitly ping teams of merged and
>> in-flight drivers we have in accel already.
> 
> Sounds like a good idea to me. Will check if the people that sent the
> previous aborted attempts are still interested in this

Looks like the Intel VPU folks are missing from this thread.

I like the idea of a BoF.  I suspect I will be remote but this list of 
topics looks good to me.  Nothing obvious missing from what I can tell.

-Jeff
