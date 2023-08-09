Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DC9774FFF
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 02:46:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D8110E039;
	Wed,  9 Aug 2023 00:46:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B501710E039
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 00:46:14 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3790069r021618; Wed, 9 Aug 2023 00:46:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=tbCr5K+hN8AUnuZ/XLJ9/nC/g0+MKTlafCRZyf50s70=;
 b=mS9ABh386aw8tIOSHCJyDCqS19YWcCsHcVCsRAhxDH7X1FBmCqXoUTQBRW1zvbSZryhH
 LiOlF7GwwFwGB1a6J/NgqkpFp1JzBrqCyt3dgzqmn1e4PFXhT/EpMjvcLUuRUkF/G9ut
 rpX60qqafINUl24bA83o1+gH6q5QnO9jdT0atg9rBJonN+wM4DB+4bay7Sz+sHOolDAU
 mYTj8UU+2AH1LbgDB+GVRnA3fyKA3ulAgelqKfePjR669HUDHpk/uhPlEAcgZAV8/Wss
 SvWD7sNnr/Kam5rQYYSpo3cq0zSQRWdzZ8Stm6Wc91DY8IH9Zohxz++aDSAAONCrdXSm EQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sbe15t9r1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Aug 2023 00:46:05 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3790jqAA000657
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 9 Aug 2023 00:45:52 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 8 Aug
 2023 17:45:51 -0700
Message-ID: <5089f2d7-35fd-ca17-ea8d-77ebd8749927@quicinc.com>
Date: Tue, 8 Aug 2023 18:45:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 4/6] accel/ivpu: Add param ioctl to identify capabilities
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
References: <20230731161258.2987564-1-stanislaw.gruszka@linux.intel.com>
 <20230731161258.2987564-5-stanislaw.gruszka@linux.intel.com>
 <4d8e7269-f6d4-4d1a-8af3-70718adc0647@quicinc.com>
 <20230803083737.GA3023441@linux.intel.com>
 <20230808085219.GA3049188@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230808085219.GA3049188@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: -pvj9da9H0R7YeS_O9ubfHZT-IEx60uG
X-Proofpoint-ORIG-GUID: -pvj9da9H0R7YeS_O9ubfHZT-IEx60uG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-08_23,2023-08-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1011 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308090005
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/8/2023 2:52 AM, Stanislaw Gruszka wrote:
> On Thu, Aug 03, 2023 at 10:37:37AM +0200, Stanislaw Gruszka wrote:
>>> Seems like we might want to decide this now, because if we define a iVPU
>>> specific ioctl as proposed here, but then switch to an Accel-wide mechanism
>>> later, iVPU is going to be stuck supporting both.
>>
>> For the record, we do not add new ioctl in this patch, we just extend
>> existing DRM_IOCTL_IVPU_GET_PARAM one.
> 
> To avoid confusion, I'll change the topic and commit massage
> before applying:
> 
> accel/ivpu: Extend get_param ioctl to identify capabilities
> 
> Add DRM_IVPU_PARAM_CAPABILITIES parameters to get_param ioctl to query
> driver capabilities. For now use it for identify metric streamer and
> new dma memory range features. Currently upstream version of intel_vpu
> does not have those, they will be added it the future.

This is perhaps slightly better.  I didn't find the original one confusing.

Seems like no opinions on pushing this up to the framework.  You did 
point out DRM drivers have driver level ones, so carry-on I guess.

Seems ok to me.  I'd prefer to see some comments in the uapi header 
describing what the DRM_IVPU_CAP_* values mean.  A bit more than "device 
has metric streamer support" - what is metric streamer, and why might 
userspace care?

However, as a uAPI change, is Oded's Ack not required?  I thought that 
was the rule.

-Jeff
