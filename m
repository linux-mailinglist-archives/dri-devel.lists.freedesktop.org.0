Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8868886FC0
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 16:24:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C216C10EE7B;
	Fri, 22 Mar 2024 15:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="VHtHZe3v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0AD710EE7B
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 15:24:10 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42M5LkfR029091; Fri, 22 Mar 2024 15:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=FA8hi/Zc+lKUHJ7A6Oe96KQqnSTVFOXnuVWH4grGDc4=; b=VH
 tHZe3vnMyZk/gjwSrXAGnw3fSt5hJ7rPoDZCCcNBA33lcSZ1lyRHILwvcpwWzrSf
 cnSeuP5vpzxnhVO+3/sGiuTwo9Bc3nt4Zhw/hwNnBTxxMYT+lvPKUBE0f4xs1z2M
 7VTWr3HWK3C3nA2sDeZp8lA7cxBwyXep1/J4nHaIko38Y03cIKuCvdCwxLDaKyXK
 hAW7jcvfym/45kqTVxsDGxzm2o3Rkwhcr2ft5q5f4SrXniC7sc3yiY6J3ZUmeCYR
 IEXPPLgW26eI6DjCmijp5iyAWeYZGMrBDNM3GmG+gxHy346hCR68+TCBvbEct82E
 8rMosbKNIFXsiD6qdRRQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x0wy9tfev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Mar 2024 15:24:06 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42MFO3ql031704
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Mar 2024 15:24:03 GMT
Received: from [10.110.101.79] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 22 Mar
 2024 08:24:02 -0700
Message-ID: <1e546c01-1126-45c8-9104-14e769dedb8b@quicinc.com>
Date: Fri, 22 Mar 2024 08:24:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel: replace utf multiply with an ascii x
Content-Language: en-US
To: Prasad Pandit <ppandit@redhat.com>, Diogo Ivo
 <diogo.ivo@tecnico.ulisboa.pt>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg
 <sam@ravnborg.org>, <dri-devel@lists.freedesktop.org>, Prasad Pandit
 <pjp@fedoraproject.org>
References: <20240322120339.1802922-1-ppandit@redhat.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240322120339.1802922-1-ppandit@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: znPbqv69Hp0mr4oQUezxviudsuzMJ8gq
X-Proofpoint-GUID: znPbqv69Hp0mr4oQUezxviudsuzMJ8gq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-22_08,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=898
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1011
 phishscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403220109
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



On 3/22/2024 5:03 AM, Prasad Pandit wrote:
> From: Prasad Pandit <pjp@fedoraproject.org>
> 
> Replace unicode multiplication character with an ascii x.
> It helps Kconfig parsers to read file without error.

Hi Prasad,

Seems that this also happens in 2 other Kconfig entries. Can you replace 
those as well?

Thanks,

Jessica Zhang

> 
> Fixes: 25205087df1f ("drm/panel: Add driver for JDI LPM102A188A")
> Signed-off-by: Prasad Pandit <pjp@fedoraproject.org>
> ---
>   drivers/gpu/drm/panel/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 8f3783742208..e3970dee089f 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -270,7 +270,7 @@ config DRM_PANEL_JDI_LPM102A188A
>   	help
>   	  Say Y here if you want to enable support for JDI LPM102A188A DSI
>   	  command mode panel as found in Google Pixel C devices.
> -	  The panel has a 2560×1800 resolution. It provides a MIPI DSI interface
> +	  The panel has a 2560x1800 resolution. It provides a MIPI DSI interface
>   	  to the host.
>   
>   config DRM_PANEL_JDI_R63452
> -- 
> 2.44.0
> 
