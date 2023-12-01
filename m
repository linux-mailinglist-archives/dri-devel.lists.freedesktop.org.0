Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6848011DC
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 18:38:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB6C10E130;
	Fri,  1 Dec 2023 17:38:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7FDE10E130
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 17:38:33 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B1ExJFu025621; Fri, 1 Dec 2023 17:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=4MZ6zNwMiDRpH0TFLHGJdAebm7H9xbJoxs5Mo5cjlJY=;
 b=NZAZvB2kTd8Rs1gRBAqwJbIRajTHWQ7FNf9l52tPsTWjq+PFKuTJ61buK7VPaoHgC0AM
 nmPj2dBsjoJk785kabrohC6vWnBKezadkGp7vSKKLhxTFXX15mBTngFS+KPaLz3iPDd2
 xyOksefVxaufJCT9sqveF/3wIwYh1GFO/LnGUeoYO1aFqEi7/mcxk9UZYoVEAnMXHcFq
 95En3Fapz6S8lI8YR9LHXdvzdIouy+loyLUzHNqWOU1JDvQnxu0OW6lrLJ9EZQZiOay3
 rS4k/AJKRbh1rPMkOhXnbnV6m+O/jWMdo2rKhFKyGbc4FmRJtU1mOKe5tvIzNOjIYsi4 bg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uq79ha18u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Dec 2023 17:38:29 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B1HcT9d008896
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 1 Dec 2023 17:38:29 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 1 Dec
 2023 09:38:28 -0800
Message-ID: <6967228b-95ef-b577-b5e2-34ac00ffc07f@quicinc.com>
Date: Fri, 1 Dec 2023 10:38:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 0/2] Convert to persistent DRM devices
Content-Language: en-US
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
 <stanislaw.gruszka@linux.intel.com>, <ogabbay@kernel.org>
References: <20231117174337.20174-1-quic_jhugo@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20231117174337.20174-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: tgZO8BqJwDDJAGgA6UeGCS8qYSBySlaf
X-Proofpoint-GUID: tgZO8BqJwDDJAGgA6UeGCS8qYSBySlaf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_15,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 phishscore=0 suspectscore=0 spamscore=0
 mlxlogscore=967 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312010117
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/17/2023 10:43 AM, Jeffrey Hugo wrote:
> The qaic driver currently creates and destroys the DRM devices when the
> qaic device is in an operational state for userspace. This does not match
> what other DRM drivers do, and leads to a few race conditions that need
> to be handled.
> 
> Instead, create the DRM device when the underlying PCIe device is detected
> and destroy the DRM device when the underlying device disappears.
> 
> Use KOBJ_ONLINE/OFFLINE udev events to signal to userspace when the
> underlying device is ready to accept requests, or has entered a reset
> state.
> 
> Carl Vanderlip (2):
>    accel/qaic: Increase number of in_reset states
>    accel/qaic: Expand DRM device lifecycle
> 
>   Documentation/accel/qaic/qaic.rst   |  9 +++++-
>   drivers/accel/qaic/mhi_controller.c |  2 +-
>   drivers/accel/qaic/qaic.h           | 15 +++++++--
>   drivers/accel/qaic/qaic_control.c   |  5 +--
>   drivers/accel/qaic/qaic_data.c      | 16 ++++-----
>   drivers/accel/qaic/qaic_drv.c       | 50 ++++++++++++-----------------
>   6 files changed, 52 insertions(+), 45 deletions(-)
> 

Pushed to drm-misc-next

-Jeff
