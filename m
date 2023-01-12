Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDC7667C97
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 18:35:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73AA610E30C;
	Thu, 12 Jan 2023 17:35:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D4710E30C
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 17:35:01 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30CEtFvg026423; Thu, 12 Jan 2023 17:34:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=KNDM25/h85CdgGHZC9Z7sfo0etb9MLO9mRmRzgRhgf4=;
 b=Wgfi7038KitnTRlKCleVTdcwGRDsBf8aUEdoDt3RHg3FkEC/v0y3i9hvmKzCCmV65OZD
 YFNFfUVCGqkCJyuo4L9JjrWiZxa6aILrjOaW6+ssgBRlfLnRV3Ben5NygeqLCqd0DCLd
 jQh7/Bd/jlArBPbnBEXyPwPyK7NfX2UU47iO8T7Z43V42ViU9dAsK63tqP9mkmJwNKCC
 AlI93eWnhWhm0pc/swDL7qw6Jj8MUaaU/JA0WfFaY3TiGExIwGbCwpwX9pd/Xa+NccSv
 FrscA+H77HbBwhU6LORee8P5UY0YrQy9KdYV8qNqFlfs7jWi1Q/5hipOEyF4DiSozJYY JA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n2evhsbbb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jan 2023 17:34:55 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30CHYsNP028081
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jan 2023 17:34:54 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 12 Jan
 2023 09:34:53 -0800
Message-ID: <2c8f58f3-1294-1c36-72c1-55349ff28309@quicinc.com>
Date: Thu, 12 Jan 2023 10:34:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v5 1/7] accel/ivpu: Introduce a new DRM driver for Intel
 VPU
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <oded.gabbay@gmail.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <tzimmermann@suse.de>
References: <20230109122344.253994-1-jacek.lawrynowicz@linux.intel.com>
 <20230109122344.253994-2-jacek.lawrynowicz@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230109122344.253994-2-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: kSlFTWGcizyMg6boFJUPmUp0-yAqgBed
X-Proofpoint-ORIG-GUID: kSlFTWGcizyMg6boFJUPmUp0-yAqgBed
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-12_08,2023-01-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301120127
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
Cc: andrzej.kacprowski@linux.intel.com,
 Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 stanislaw.gruszka@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/9/2023 5:23 AM, Jacek Lawrynowicz wrote:
> VPU stands for Versatile Processing Unit and it's a CPU-integrated
> inference accelerator for Computer Vision and Deep Learning
> applications.
> 
> The VPU device consist of following components:
>    - Buttress - provides CPU to VPU integration, interrupt, frequency and
>      power management.
>    - Memory Management Unit (based on ARM MMU-600) - translates VPU to
>      host DMA addresses, isolates user workloads.
>    - RISC based microcontroller - executes firmware that provides job
>      execution API for the kernel-mode driver
>    - Neural Compute Subsystem (NCS) - does the actual work, provides
>      Compute and Copy engines.
>    - Network on Chip (NoC) - network fabric connecting all the components
> 
> This driver supports VPU IP v2.7 integrated into Intel Meteor Lake
> client CPUs (14th generation).
> 
> Module sources are at drivers/accel/ivpu and module name is
> "intel_vpu.ko".
> 
> This patch includes only very besic functionality:
>    - module, PCI device and IRQ initialization
>    - register definitions and low level register manipulation functions
>    - SET/GET_PARAM ioctls
>    - power up without firmware
> 
> Co-developed-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
> Signed-off-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo2quicinc.com>

> +static const struct file_operations ivpu_fops = {
> +	.owner		= THIS_MODULE,
> +	.open		= accel_open,
> +	.release	= drm_release,
> +	.unlocked_ioctl	= drm_ioctl,
> +	.compat_ioctl	= drm_compat_ioctl,
> +	.poll		= drm_poll,
> +	.read		= drm_read,
> +	.llseek		= noop_llseek,
> +	.mmap           = drm_gem_mmap
> +};

Hmm DEFINE_DRM_ACCEL_FOPS is not usable here because it doesn't define .mmap
Feels like we should fix that and then simplify this.  Seems like a good 
todo item.

