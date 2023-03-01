Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7B16A7333
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 19:14:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C953910E1D4;
	Wed,  1 Mar 2023 18:14:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26DC610E1D4
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 18:14:43 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 321ExNLG020298; Wed, 1 Mar 2023 18:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=PB2Ekv7aFzfTo7CbtBhL+VaSJ1YJrd4cy3aJB0E+kSk=;
 b=hP/M08gXGjVPvx9BbC+sFU1EmXQMQj/5sWicEdGnkYc1/zQPb2bSxBjX+oOwj/FWdhRo
 Vo/rg8jpAIRhB567G0cLiLmnDDAD71bpt1O+vkFZjSLyLjqkzicHgfKQJbxVkIIUhtYr
 dH0gLxTyO8QldWqzogU+Z4paINbZ8EyIqBjn29rWMfr6bjjoSi3rg4fy+63sseOFFj1C
 bqikxmi2xck/dbYc9Zt1WQw03iGMEytjIE5W44CJsVvhuRE9A6XvSYeUdSbsdlmwx4nP
 eBNDprhRQ32PMk/BIDgGx6LBUJIHex/AK9MyKpXXOa0iktgtH+KmOfW6TOpOkI5wlSTN Jw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p20j2j72f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Mar 2023 18:14:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 321IEa2h003894
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 1 Mar 2023 18:14:36 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 1 Mar 2023
 10:14:36 -0800
Message-ID: <5eed22fc-cd22-8186-de08-98827852a518@quicinc.com>
Date: Wed, 1 Mar 2023 11:14:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 5/8] accel/qaic: Add datapath
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
References: <1675698105-19025-1-git-send-email-quic_jhugo@quicinc.com>
 <1675698105-19025-6-git-send-email-quic_jhugo@quicinc.com>
 <20230224152546.GB3547587@linux.intel.com>
 <00914fa9-8618-a3ef-d3c5-2a3bba68fa1f@quicinc.com>
 <20230227171454.GF3547587@linux.intel.com>
 <83543d98-e624-fadc-7f92-490efa602805@quicinc.com>
 <20230301170514.GB3963532@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230301170514.GB3963532@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: _5y0AaYk-qGEDD-pDr4uTwia72FXwdie
X-Proofpoint-GUID: _5y0AaYk-qGEDD-pDr4uTwia72FXwdie
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-01_13,2023-03-01_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 spamscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0 mlxscore=0
 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303010147
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
Cc: linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 ogabbay@kernel.org, dri-devel@lists.freedesktop.org, quic_ajitpals@quicinc.com,
 quic_pkanojiy@quicinc.com, quic_carlv@quicinc.com,
 jacek.lawrynowicz@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/1/2023 10:05 AM, Stanislaw Gruszka wrote:
> On Wed, Mar 01, 2023 at 09:08:03AM -0700, Jeffrey Hugo wrote:
>>> This looks a bit suspicious. Are you sure you can modify
>>> sg->dma_address and still use it as valid value ?
>>
>> A single entry in the sg table is a contiguous mapping of memory.  If it
>> wasn't contiguous, it would have to be broken up into multiple entries.  In
>> the simple case, a driver is going to take the dma_address/len pair and hand
>> that directly to the device.  Then the device is going to access every
>> address in that range.
>>
>> If the device can access every address from dma_address to dma_address +
>> len, why can't it access a subset of that?
> 
> Required address alignment can be broken. Not sure if only that.

AIC100 doesn't have required alignment.  AIC100 can access any 64-bit 
address, at a byte level granularity.  The only restriction AIC100 has 
is that the size of a transfer is restricted to a 32-bit value, so max 
individual transfer size of 4GB.  Transferring more than 4GB requires 
multiple transactions.

>>>> Are you suggesting renaming
>>>> this function?  I guess I'm not quite understanding your comment here. Can
>>>> you elaborate?
>>>
>>> Renaming would be nice. I was thinking by simplifying it, not sure
>>> now if that's easy achievable, though.
>>
>> Ok.  I'll think on this.
> 
> Maybe this function could be removed ? And create sg lists
> that hardware can handle without any modification.
> Just idea to consider, not any requirement.

Ok, so this is part of our "slicing" operation, and thus required.

Maybe how slicing works is not clear.

Lets say that we have a workload on AIC100 that can identify a license 
plate in a picture (aka lprnet).  Lets assume this workload only needs 
the RGB values of a RGBA file (a "jpeg" we are processing).

Userspace allocates a BO to hold the entire file.  A quarter of the file 
is R values, a quarter is G values, etc.  For simplicity, lets assume 
the R values are all sequentially listed, then the G values, then the B 
values, finally the A values.  When we allocate the BO, we map it once. 
  If we have an IOMMU, this optimizes the IOMMU mappings.  BOs can be 
quite large.  We have some test workloads based on real world workloads 
where each BO is 16-32M in size, and there are multiple BOs.  I don't 
want to map a 32M BO N duplicate times in the IOMMU.

So, now userspace slices the BO.  It tells us we need to transfer the 
RGB values (the first 75% of the BO), but not the A values.  So, we 
create a copy of the mapped SG and edit it to represent this transfer, 
which is a subset of the entire BO.  Using the slice information and the 
mapping information, we construct the DMA engine commands that can be 
used to transfer the relevant portions of the BO to the device.

It sounds like you are suggesting, lets flip this around.  Don't map the 
entire BO once.  Instead, wait for the slice info from userspace, 
construct a sg list based on the parts of the BO for the slice, and map 
that.  Then the driver gets a mapped SG it can just use.  The issue I 
see with that is slices can overlap.  You can transfer the same part of 
a BO multiple times.  Maybe lprnet has multiple threads on AIC100 where 
thread A consumes R data, thread B consumes R and G data, and thread C 
consumes B data.  We need to transfer the R data twice to different 
device locations so that threads A and B can consume the R data 
independently.

If we map per slice, we are going to map the R part of the BO twice in 
the IOMMU.  Is that valid?  It feels possible that there exists some 
IOMMU implementation that won't allow multiple IOVAs to map to the same 
DDR PA because that is weird and the implementer thinks its a software 
bug.  I don't want to run into that.  Assuming it is valid, that is 
multiple mappings in the IOMMU TLB which could have been a single 
mapping.  We are wasting IOMMU resources.

There are some ARM systems we support with limited IOVA space in the 
IOMMU, and we've had some issues with exhausting that space.  The 
current implementation is influenced by those experiences.

I appreciate the outsider perspective (here and elsewhere). 
Re-evaluating some of these things is resulting in improvements.

-Jeff
