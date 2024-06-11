Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E34F903DDB
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 15:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 120CA10E661;
	Tue, 11 Jun 2024 13:46:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="XoIgw3PF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE38710E661
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 13:46:18 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45B6Il1W003639;
 Tue, 11 Jun 2024 13:46:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 H57Yly94lUujR4aEs3lPMh0cm7TnWcXLJp+i5ENoF98=; b=XoIgw3PFEf0rqGgJ
 c86bL7EkJgSqXUBuGommE0Ut1E89U/NVs2opVwtqnjd08klx/ylit7UHd+B3dkS4
 wK1WZ+4BScXezW1wUkCCy/bOwxEtLBGcAyu1eD7mjY2YdCgFwsN7ADi7GWYSoGaQ
 1/bzquUVcrjHq12Bi6svopY33CE2UvHvA86Izxl5YfZH11qw9C/UiTQFP0cqAtn2
 40AVGg7dtPmNhkLGpA8PYzfzmTUH0jp+pVNEHJSBV1GL0+oJqL6eeLHZPtrlxyFl
 hF4mWg39+OK+xo5glIDVATho7x9OXxjyRyVp7qCDfYv3A/zk2G3p5ktME/9dOmdZ
 FUSaig==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymg2epj90-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jun 2024 13:46:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45BDkDNJ025735
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jun 2024 13:46:13 GMT
Received: from [10.81.24.74] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Jun
 2024 06:46:13 -0700
Message-ID: <4e13caf0-c6f5-4df0-82b9-be72ffe06beb@quicinc.com>
Date: Tue, 11 Jun 2024 06:46:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] drm/mipi-dbi: Add missing MODULE_DESCRIPTION()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20240425125627.2275559-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240425125627.2275559-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: QgWs6Q-tnn3leFIMyyZbGw8rMFDpiPz4
X-Proofpoint-GUID: QgWs6Q-tnn3leFIMyyZbGw8rMFDpiPz4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_07,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110100
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

On 4/25/24 05:56, Andy Shevchenko wrote:
> The modpost script is not happy
> 
>    WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/drm_mipi_dbi.o
> 
> because there is a missing module description.
> 
> Add it to the module.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/gpu/drm/drm_mipi_dbi.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
> index daac649aabdb..ee6fa8185b13 100644
> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> @@ -1475,4 +1475,5 @@ EXPORT_SYMBOL(mipi_dbi_debugfs_init);
>   
>   #endif
>   
> +MODULE_DESCRIPTION("MIPI Display Bus Interface (DBI) LCD controller support");
>   MODULE_LICENSE("GPL");

I'll remove this from my series
Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>

