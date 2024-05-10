Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8956E8C28C7
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 18:31:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC0810EE5E;
	Fri, 10 May 2024 16:31:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="JOTcj4SR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75FD910EE5E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 16:31:01 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44AE1hvE000727;
 Fri, 10 May 2024 16:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=jYGYexGEPnuo+AJVT+1m+BsQXIgroOCHD4nSKCAzsDs=; b=JO
 Tcj4SRy4yRqrmiEOdyAJFb8hyod8E7WrxPPq+5TMQ575YdOjWp0eKxCT2LFSi21S
 iq377IHoyn1tordbYIy8vHylJRS7UQk9wdEg4dgPWzpy5OW7FOhz7DWiaTuGhqdF
 HR6VXPLwP5ez1egV1+iODNwpkrAjuXyjp14PsT19+jLm30U3kPUJ6YCm4I7s45Dk
 m9FmHwoMcNS6STCtLYP+eFlT/Ozk42sh71H1rQKhPX4nLj9X4IA3t0pOanth4bD6
 +BDnPIYgKogP0ZKtIhTGri/tQr5KvON2TBHqC1bAdqhxl19WFloXKgRWzUSdqlac
 dkZG9+aGyf9uMeR+bMUw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y16w0t1k6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 May 2024 16:30:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44AGUuN7030388
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 May 2024 16:30:56 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 10 May
 2024 09:30:55 -0700
Message-ID: <9454cd02-52be-756c-6051-46b1d38a185d@quicinc.com>
Date: Fri, 10 May 2024 10:30:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 02/12] accel/ivpu: Add sched_mode module param
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, "Wachowski, Karol" <karol.wachowski@intel.com>
References: <20240508132106.2387464-1-jacek.lawrynowicz@linux.intel.com>
 <20240508132106.2387464-3-jacek.lawrynowicz@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240508132106.2387464-3-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: cuoZOoYXGbkKsDYt8R97SkF7UA7rtguj
X-Proofpoint-ORIG-GUID: cuoZOoYXGbkKsDYt8R97SkF7UA7rtguj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_12,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1011 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405100119
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

On 5/8/2024 7:20 AM, Jacek Lawrynowicz wrote:
> From: "Wachowski, Karol" <karol.wachowski@intel.com>
> 
> This param will be used to enable/disable HWS (hardware scheduler).
> The HWS is a FW side feature and may not be available on all
> HW generations and FW versions.
> 
> Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_drv.c     | 4 ++++
>   drivers/accel/ivpu/ivpu_drv.h     | 1 +
>   drivers/accel/ivpu/ivpu_hw.h      | 3 ++-
>   drivers/accel/ivpu/ivpu_hw_37xx.c | 1 +
>   drivers/accel/ivpu/ivpu_hw_40xx.c | 3 ++-
>   5 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
> index 51d3f1a55d02..db47e7ef6322 100644
> --- a/drivers/accel/ivpu/ivpu_drv.c
> +++ b/drivers/accel/ivpu/ivpu_drv.c
> @@ -51,6 +51,10 @@ u8 ivpu_pll_max_ratio = U8_MAX;
>   module_param_named(pll_max_ratio, ivpu_pll_max_ratio, byte, 0644);
>   MODULE_PARM_DESC(pll_max_ratio, "Maximum PLL ratio used to set NPU frequency");
>   
> +bool ivpu_sched_mode;
> +module_param_named(sched_mode, ivpu_sched_mode, bool, 0644);
> +MODULE_PARM_DESC(sched_mode, "Scheduler mode: 0 - OS scheduler, 1 - HW scheduler");

"OS scheduler"
Host OS (aka Linux) or device side OS?  Seems a bit ambiguous.
Also looks like this must be set before the device is initialized, yet 
it does not look like that is communicated.

-Jeff
