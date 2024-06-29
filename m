Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E8591CAD5
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jun 2024 05:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6504210E139;
	Sat, 29 Jun 2024 03:14:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="gfgtht3d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E0110E139
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jun 2024 03:14:05 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45SHf4RN000541;
 Sat, 29 Jun 2024 03:14:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3TTAuqVpMMnZvxn8OOIz++YrjBQymUbjeSmXdFh4+nk=; b=gfgtht3dS3a+rWyr
 bOgPmWbjaf7BRAzZev2lCQG4RC3lTrlkaC/km4NxzHcXg6GRpvoRRoJalCkTktzr
 4eZX1UljV8hECWDh+KMszMlvE7JUzGMEJJTisIfh1IYfjzKU+WUFbtHRDwttSaxJ
 ihi/aO7NqsuC0PwwfoEtK9WUoXpWbH4Gy+Wxw1O3tSklu7e+NnEwybNsELSqbWTO
 t/B7bODCCEZbpnAPJ4pg30S6xvsCtXeQHSQ5USConkUSK/4nvh4Lm1CQVjOMmdcv
 uxX/m1LTnK2/zJxrywJvv7XC4K0duR9dO63L5GsEwDDa2DncUjMoiUrkGGLlEVhP
 y5JrkQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 401ubvtcur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 Jun 2024 03:14:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45T3E3wJ026150
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 Jun 2024 03:14:03 GMT
Received: from [10.48.245.152] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 28 Jun
 2024 20:14:03 -0700
Message-ID: <99d6c483-9291-4bd0-8e62-76022abb762c@quicinc.com>
Date: Fri, 28 Jun 2024 20:14:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] agp: uninorth: add missing MODULE_DESCRIPTION() macro
Content-Language: en-US
To: David Airlie <airlied@redhat.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kernel-janitors@vger.kernel.org>
References: <20240615-md-powerpc-drivers-char-agp-v1-1-b79bfd07da42@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240615-md-powerpc-drivers-char-agp-v1-1-b79bfd07da42@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: SDSpk_0xBQ20c5Tk67v9VLJogVZc5vdm
X-Proofpoint-GUID: SDSpk_0xBQ20c5Tk67v9VLJogVZc5vdm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_18,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 bulkscore=0 clxscore=1011 suspectscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406290023
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

On 6/15/2024 2:01 PM, Jeff Johnson wrote:
> With ARCH=powerpc, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/agp/uninorth-agp.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>  drivers/char/agp/uninorth-agp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/char/agp/uninorth-agp.c b/drivers/char/agp/uninorth-agp.c
> index 84411b13c49f..b8d7115b8c9e 100644
> --- a/drivers/char/agp/uninorth-agp.c
> +++ b/drivers/char/agp/uninorth-agp.c
> @@ -726,4 +726,5 @@ MODULE_PARM_DESC(aperture,
>  		 "\t\tDefault: " DEFAULT_APERTURE_STRING "M");
>  
>  MODULE_AUTHOR("Ben Herrenschmidt & Paul Mackerras");
> +MODULE_DESCRIPTION("Apple UniNorth & U3 AGP support");
>  MODULE_LICENSE("GPL");
> 
> ---
> base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
> change-id: 20240615-md-powerpc-drivers-char-agp-db644db58c24

Following up to see if anything else is needed from me. Hoping to see this in
linux-next so I can remove it from my tracking spreadsheet :)

/jeff
