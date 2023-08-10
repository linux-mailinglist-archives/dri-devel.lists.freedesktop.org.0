Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43024777B43
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 16:50:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C606B10E556;
	Thu, 10 Aug 2023 14:49:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E4610E55E
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 14:49:56 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37AERwWi018666; Thu, 10 Aug 2023 14:49:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=O99nV7mRckyUqlfU2+1ZF3DC6m0GgiY6s5WZQWfGDZI=;
 b=jJ1FCQnSkPVjmdEyloz9zDigp9FwFCe2B2u7tZIe7FRrKDZC9LcokhpgK6Y/zybKC3fP
 xCQOe0uzNrmSKqFQkO/0Rbsxrc4uNgdc0i94HglLqjorHf/lSVr34uvaDDY36WVlCX9D
 dfZeMsN8MtkGcBWCV3cX6iUEHLnCDzUBtT6+DW88xcpPhfe1opNeq4wkpzoM08u6DMWK
 S19znTzqz/ywPCT++QB3mpKhyj9hObxZkBf5LSE79UmClQlwGHflRvPVTRwRldDrxFWu
 BgCOxgGS5x9J7zeqzB1NS6NDTRd4hmovi//5TdktqQhruxgp1LWXO7w7dlmzQl5ss9Kp XA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3scw2urrx9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Aug 2023 14:49:03 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37AEn2JS011995
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Aug 2023 14:49:02 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 10 Aug
 2023 07:49:01 -0700
Message-ID: <aa7495a6-50b6-908a-ee1f-e9fccb916b3f@quicinc.com>
Date: Thu, 10 Aug 2023 08:49:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] accel/ivpu: Document DRM_IVPU_PARAM_CAPABILITIES
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
References: <20230810080707.3545883-1-stanislaw.gruszka@linux.intel.com>
 <6bbd1cc5-f85b-2b42-22f9-4fd313a6ebfc@quicinc.com>
 <20230810143244.GB3329046@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230810143244.GB3329046@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: qWzIDiir0V1WxBavxKlp27s1pxNGC3xa
X-Proofpoint-ORIG-GUID: qWzIDiir0V1WxBavxKlp27s1pxNGC3xa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-10_10,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308100126
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
Cc: Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/10/2023 8:32 AM, Stanislaw Gruszka wrote:
> On Thu, Aug 10, 2023 at 08:27:08AM -0600, Jeffrey Hugo wrote:
>> On 8/10/2023 2:07 AM, Stanislaw Gruszka wrote:
>>> Add comments regarding new DRM_IVPU_PARAM_CAPABILITIES param.
>>>
>>> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
>>> ---
>>>    include/uapi/drm/ivpu_accel.h | 19 +++++++++++++++++--
>>>    1 file changed, 17 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/include/uapi/drm/ivpu_accel.h b/include/uapi/drm/ivpu_accel.h
>>> index a58a14c9f222..7d1ecc5bbac3 100644
>>> --- a/include/uapi/drm/ivpu_accel.h
>>> +++ b/include/uapi/drm/ivpu_accel.h
>>> @@ -69,8 +69,21 @@ extern "C" {
>>>    #define DRM_IVPU_CONTEXT_PRIORITY_FOCUS	    2
>>>    #define DRM_IVPU_CONTEXT_PRIORITY_REALTIME  3
>>> -#define DRM_IVPU_CAP_METRIC_STREAMER	    1
>>> -#define DRM_IVPU_CAP_DMA_MEMORY_RANGE       2
>>> +/**
>>> + * DRM_IVPU_CAP_METRIC_STREAMER
>>> + *
>>> + * Metric streamer support, provides sampling of various hardware
>>> + * performance metrics (like DMA bandwidth, cache miss/hits),
>>> + * can be used for profiling.
>>
>> Feels like this is a run-on sentence.  I think this reads better -
>>
>> Metric streamer support.  Provides sampling of various hardware performance
>> metrics like DMA bandwidth and cache miss/hits.  Can be used for profiling.
>>
>> What do you think?
> 
> Looks better :-)

Ok.  I guess with that
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
