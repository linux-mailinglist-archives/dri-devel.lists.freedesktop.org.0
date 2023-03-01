Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F236A71D6
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 18:08:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21F3D10E132;
	Wed,  1 Mar 2023 17:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5CDA10E132
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 17:08:37 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 321DR0rm026055; Wed, 1 Mar 2023 17:08:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=vUQqzGtwZwgiFvQoYfmjQtoy17AXjw/fHK5c43yvX6g=;
 b=eNWefvR+dxjhgxA3OCHBQywqS5xJBwgZ12iaVZUqfEg9URtQzGuRs+CA+pbpq/jK4WL8
 b2RsLee6pt0x+pbCJ9j4qXZVHYI7J1ZV8jKnrmpmf+m/GLqIlOM6+xJB7btwTvwWQYti
 3/u/BPUzLnlclNhG0z1FYFeNajnZjUiKGI/5/grLFYRaok82gsWB2NGRqMSdfJcQ7zKg
 foXlQUrtMuFflJGviKEtxqzv17rnFNNtAVT1plS33BPGAHFT5u43WCoIOcViGVJZaXmi
 fGw7WGAbSJ7wBgijquN1qF1po0kY2gA8WGCsSsQZo+4//gI6mUcB2+FedXWV0zbs7Kdj Dg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p1f7n4ub1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Mar 2023 17:08:33 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 321H8WHG011760
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 1 Mar 2023 17:08:32 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 1 Mar 2023
 09:08:32 -0800
Message-ID: <dd6fe82b-49dc-37c9-c9b5-5ba4c7f32e45@quicinc.com>
Date: Wed, 1 Mar 2023 10:08:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] accel: Build sub-directories based on config options
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
References: <20230301162508.3963484-1-stanislaw.gruszka@linux.intel.com>
 <3d6df357-ed90-5a0e-e9a8-bb39e147798e@quicinc.com>
 <20230301165304.GA3963532@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230301165304.GA3963532@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: tKDpsa0I0lBnd9sZG45iqrgeHCbU8kDt
X-Proofpoint-ORIG-GUID: tKDpsa0I0lBnd9sZG45iqrgeHCbU8kDt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-01_13,2023-03-01_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=985 clxscore=1015 mlxscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303010141
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

On 3/1/2023 9:53 AM, Stanislaw Gruszka wrote:
> On Wed, Mar 01, 2023 at 09:31:10AM -0700, Jeffrey Hugo wrote:
>> On 3/1/2023 9:25 AM, Stanislaw Gruszka wrote:
>>> When accel drivers are disabled do not process into
>>> sub-directories and create built-in archives:
>>>
>>>     AR      drivers/accel/habanalabs/built-in.a
>>>     AR      drivers/accel/ivpu/built-in.a
>>>
>>> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
>>
>> Should there be a fixes tag?  Feels like something that should be
>> back-ported.
> 
> This tag could be added:
> 
> Fixes: 35b137630f08 ("accel/ivpu: Introduce a new DRM driver for Intel VPU")
> 
> but since then Makefile changed with habanalabs addition.
> 
> I expect this will go to drm-misc-fixes and then to linux 6.3-rcX
> from there, so (stable) back-port will not be needed.

Makes sense.  I thought this would apply to 6.2 as well, but it looks 
like no.

-Jeff
