Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC61695920C
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 03:08:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6B510E564;
	Wed, 21 Aug 2024 01:08:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="HuPj8tdi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D06910E564;
 Wed, 21 Aug 2024 01:08:03 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47KCpxEV012201;
 Wed, 21 Aug 2024 01:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xeWAl49TMadtFPar1/t3c6thDeWJreD5Fni6eWb7mtw=; b=HuPj8tdi8ilIuPTu
 be6SmedHi+HPKHfXLH7gHDVhOImneFJo7STKu8U999tnt3/fEZyd8itrBfX+lfY1
 hL8mTgph2WZObx489Gvm/Zv0ZiqxkO3r0gRVQpPRyrdg4wtkUHT8XEQB1By7kjRl
 ZMfrc1dttxSLy+dcZqWg69514COlCZImzfkjaocP3GpSTJe9FnMNldOW5YpJD6zF
 U1Q3E+phseQAE4Vj0H0JI86OEyp/sKcehnD7Om+955nZq+liuxGufIRX3JUk4BW7
 +fBAgk2z/IjyNgRkzZc9NVRu9DWSEO34ceywKadxxGAfBh+ofKCbs73HWrkoCnGk
 lR3ubA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 414uh8sgjj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Aug 2024 01:07:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47L17xdR026672
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Aug 2024 01:07:59 GMT
Received: from [10.81.24.74] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 20 Aug
 2024 18:07:58 -0700
Message-ID: <3151445e-cc4f-403a-b2c8-6a770df6674a@quicinc.com>
Date: Tue, 20 Aug 2024 18:07:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 20/44] drm/tests: Add a few tests around drm_fixed.h
To: Harry Wentland <harry.wentland@amd.com>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>
References: <20240819205714.316380-1-harry.wentland@amd.com>
 <20240819205714.316380-21-harry.wentland@amd.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240819205714.316380-21-harry.wentland@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: EN__cd_jcTA4OjRUCo2atZ1xl3Xal1Rq
X-Proofpoint-ORIG-GUID: EN__cd_jcTA4OjRUCo2atZ1xl3Xal1Rq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-20_19,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 spamscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408210006
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

On 8/19/24 13:56, Harry Wentland wrote:
> While working on the CTM implementation of VKMS I had to ascertain
> myself of a few assumptions. One of those is whether drm_fixed.h
> treats its numbers using signed-magnitude or twos-complement. It is
> twos-complement.
> 
> In order to make someone else's day easier I am adding the
> drm_test_int2fixp test that validates the above assumption.
> 
> I am also adding a test for the new sm2fixp function that converts
> from a signed-magnitude fixed point to the twos-complement fixed
> point.
> 
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  drivers/gpu/drm/tests/Makefile        |  3 +-
>  drivers/gpu/drm/tests/drm_fixp_test.c | 69 +++++++++++++++++++++++++++
>  2 files changed, 71 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/tests/drm_fixp_test.c
> 
> diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
> index 56dab563abd7..bd69df0eee33 100644
> --- a/drivers/gpu/drm/tests/Makefile
> +++ b/drivers/gpu/drm/tests/Makefile
> @@ -20,6 +20,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
>  	drm_modes_test.o \
>  	drm_plane_helper_test.o \
>  	drm_probe_helper_test.o \
> -	drm_rect_test.o
> +	drm_rect_test.o	\
> +	drm_fixp_test.o
>  
>  CFLAGS_drm_mm_test.o := $(DISABLE_STRUCTLEAK_PLUGIN)
> diff --git a/drivers/gpu/drm/tests/drm_fixp_test.c b/drivers/gpu/drm/tests/drm_fixp_test.c
> new file mode 100644
> index 000000000000..f420f173ff66
> --- /dev/null
> +++ b/drivers/gpu/drm/tests/drm_fixp_test.c
> @@ -0,0 +1,69 @@
...
> +MODULE_AUTHOR("AMD");
> +MODULE_LICENSE("GPL and additional rights");
> \ No newline at end of file

Please add the missing MODULE_DESCRIPTION()

