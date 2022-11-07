Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5D061F941
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 17:21:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C4EC10E493;
	Mon,  7 Nov 2022 16:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B020010E491
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 16:21:01 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A7FbdUC018072; Mon, 7 Nov 2022 16:20:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=PwyzBbiNauQajDFMxNbdVRKyQZV5qg0JV6t5f6Gs0e8=;
 b=ePc2N1LZ1yXeEogzJddAi+FdyFsBFxujfLjtywMHEyBsY+PmoCcJqbc2ODOf9uDuH+Zp
 1d3JgQAgS2Z542FgGtx0t5xT0erMIQmMk4m/G0Qhpw22qigQ9jNLBJ7ZrXkX/f04/rvZ
 WkrEpN47hWmVIsAnL/3dfMcCGZIK1xAuzXEuqLIg1+MXc5P6HGwov/CYHPr/+oq0VCGw
 LxtF9undnS1rtkped8wSGQKOUjmcv7UHocqq5SoUrDMGdnFsELTPxFkQrhr4YMRjJ04V
 PIIGR/bIB484P2aKOR0ZmYMzJN5bXt9lGrlWR/iclxTt+nIn24Nqbdd3n+UCKtvms6Px Gg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kpu9ch6th-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Nov 2022 16:20:42 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2A7GKfC1016486
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 7 Nov 2022 16:20:41 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 7 Nov 2022
 08:20:39 -0800
Message-ID: <2f415e77-9332-2d66-cd59-05db8d5790ea@quicinc.com>
Date: Mon, 7 Nov 2022 09:20:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [RFC PATCH v3 2/3] accel: add dedicated minor for accelerator
 devices
Content-Language: en-US
To: Oded Gabbay <ogabbay@kernel.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20221106210225.2065371-1-ogabbay@kernel.org>
 <20221106210225.2065371-3-ogabbay@kernel.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20221106210225.2065371-3-ogabbay@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: M6hr2hrplincyuJoha-UwR6GNOBhAMwV
X-Proofpoint-ORIG-GUID: M6hr2hrplincyuJoha-UwR6GNOBhAMwV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_08,2022-11-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211070131
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jiho Chu <jiho.chu@samsung.com>, Randy Dunlap <rdunlap@infradead.org>,
 Christoph Hellwig <hch@infradead.org>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Kevin Hilman <khilman@baylibre.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/6/2022 2:02 PM, Oded Gabbay wrote:
> --- a/drivers/accel/drm_accel.c
> +++ b/drivers/accel/drm_accel.c
> @@ -8,14 +8,25 @@
> 
>   #include <linux/debugfs.h>
>   #include <linux/device.h>
> +#include <linux/xarray.h>

If we are not using xarray at this time, do we still need this include?

> 
>   #include <drm/drm_accel.h>
> +#include <drm/drm_debugfs.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_file.h>
>   #include <drm/drm_ioctl.h>
>   #include <drm/drm_print.h>
> 
> +static DEFINE_SPINLOCK(accel_minor_lock);
> +static struct idr accel_minors_idr;

I beleive we should have an explicit include for the IDR header.

> --- a/include/drm/drm_accel.h
> +++ b/include/drm/drm_accel.h
> @@ -8,12 +8,56 @@
>   #ifndef DRM_ACCEL_H_
>   #define DRM_ACCEL_H_
> 
> -#define ACCEL_MAJOR     261
> +#include <drm/drm_file.h>
> +
> +#define ACCEL_MAJOR		261
> +#define ACCEL_MAX_MINORS	256

This diff seems really weird.  The changes to the ACCEL_MAJOR define 
could get pushed to the previous patch, no?

> @@ -23,9 +67,31 @@ static inline void accel_core_exit(void)
> 
>   static inline int __init accel_core_init(void)
>   {
> +	/* Return 0 to allow drm_core_init to complete successfully */

Move to previous patch?

> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -94,6 +94,14 @@ enum drm_driver_feature {
>   	 * synchronization of command submission.
>   	 */
>   	DRIVER_SYNCOBJ_TIMELINE         = BIT(6),
> +	/**
> +	 * @DRIVER_COMPUTE_ACCEL:
> +	 *
> +	 * Driver supports compute acceleration devices. This flag is mutually exclusive with
> +	 * @DRIVER_RENDER and @DRIVER_MODESET. Devices that support both graphics and compute
> +	 * acceleration should be handled by two drivers that are connected using auxiliry bus.

auxiliry -> auxiliary

