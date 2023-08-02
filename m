Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E86A376D4AF
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 19:07:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09CF610E56C;
	Wed,  2 Aug 2023 17:07:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A384E10E1BE
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 17:07:18 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 372DxevK015598; Wed, 2 Aug 2023 17:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=+RdU6bMkUdS3vdxdQp/w/NrOZZtSc85tzuyF5q4V09I=;
 b=CP4tPbVOeQ+UklaoBjr4vIkehNx5s8O/6qtcQ9We2D4fnHFIS+7KZM26e4IKdPz9NkaR
 Z16rRmSuxE8BBMwzJujN5olniqffwEGgvXjkDsXzrCtpcWNPR1+pC2v591EOcFQbaJFX
 qin46Is4vnKs+tt/YseIHgUok4iWK49tMWgeABqNCv8lxiQ5gNAIugEBqSPUGgM/7CLz
 YKewLBQFgFIzfVj/TgEKe/HkYQrfPFlSvAl+/cl5gfiNv9o4ZQqctQlkAqfbhL13ZxTM
 BW751Z0AHk091Kw9ZMaYvB12TZD8i1CNPklEmFPkIkC5BQxMZRya8VTJE2L9EJHCU0PF wQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s7bp6a8q2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Aug 2023 17:07:12 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 372H7BTt002136
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 2 Aug 2023 17:07:11 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 2 Aug
 2023 10:07:10 -0700
Message-ID: <4d8e7269-f6d4-4d1a-8af3-70718adc0647@quicinc.com>
Date: Wed, 2 Aug 2023 11:07:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 4/6] accel/ivpu: Add param ioctl to identify capabilities
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20230731161258.2987564-1-stanislaw.gruszka@linux.intel.com>
 <20230731161258.2987564-5-stanislaw.gruszka@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230731161258.2987564-5-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: dxRKUa2vlH-RRoUMVgykBBF1ZB-Nx2Uc
X-Proofpoint-ORIG-GUID: dxRKUa2vlH-RRoUMVgykBBF1ZB-Nx2Uc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-02_13,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308020151
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
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/31/2023 10:12 AM, Stanislaw Gruszka wrote:
> Add DRM_IVPU_PARAM_CAPABILITIES ioctl to query driver capabilities.
> For now use it for identify metric streamer and new dma memory range
> features. Currently upstream version of intel_vpu does not have those,
> they will be added it the future.

Hmm.  So I happened to remember this from Oded in the reviews for the 
first iVPU series -

"btw, I talked to Daniel about this and he told me this
major/minor/patchlevel is legacy in drm and should be deprecated, so
I'm going to send a patch to document that it is deprecated and how to
use getcap ioctl to find out the features the driver support."

So, I went to look at DRM_IOCTL_GET_CAP and it feels like something you 
should be using as it fits the purpose I see in this patch, but also I 
don't see how given that it doesn't hook to the driver.

I suspect at some point, QAIC would have its own need for a "getcap" 
API.  Feels like something we should have a common entry in uAPI for 
(ACCEL_IOCTL_GET_CAP ? ), but I don't yet see that we'll have a lot a 
commonality of the capabilities across Accel drivers.  I don't think the 
DRM method of globally defined caps is useful for Accel.

Does it make sense to have a framework level ioctl, but something that 
calls into the drivers and would allow the drivers to advertise custom 
capabilities?

Seems like we might want to decide this now, because if we define a iVPU 
specific ioctl as proposed here, but then switch to an Accel-wide 
mechanism later, iVPU is going to be stuck supporting both.

What do you think?

Oded, am I misunderstanding your earlier comment?

-Jeff
