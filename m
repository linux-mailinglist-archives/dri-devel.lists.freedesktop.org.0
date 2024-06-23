Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C654913D51
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 19:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3CF510E0A0;
	Sun, 23 Jun 2024 17:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="hMLcIRhk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB5F10E0A0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 17:37:31 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45NHaOt7020225;
 Sun, 23 Jun 2024 17:37:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lptZYnLIBcaVZNNSk19VTKLhsmYiOW77XYcabzVIT0g=; b=hMLcIRhk76Dc75ZB
 arkqop7k7Oz40f0AuWg4R8CGq6TYdIw1lYAGBQDDqe5NfwgaIyP6hVawXehymo/k
 o4RJfeUxdeAws3XDmAxZkB8jesuVgOXOLcD+2w4i21Ljo8LZW0vkNfSriMAE1Q+W
 nLi4yobxoosQ5LOvvmJTcWLAftSBFaWoIWhfL7ybAfgo9EM3Mfiskzo3C6st9NMN
 qP7F4KXvcNCtr/AOGgLMEweDb4RMbghcUqGfXrZKSVKXyWctdS8GPACwyj2mLT8K
 Unci0ahIlNdHWAanWRHHKS5IVjOnhcUfjSYX31Ug9FsFxlAtiT83QIcqZV9lnhrM
 zGJtsg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywkyn24qt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 23 Jun 2024 17:37:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45NHbT3l018201
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 23 Jun 2024 17:37:29 GMT
Received: from [10.48.244.142] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 23 Jun
 2024 10:37:28 -0700
Message-ID: <650386f8-16c4-4988-b05c-1e4fc1c9167a@quicinc.com>
Date: Sun, 23 Jun 2024 10:37:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] agp: add missing MODULE_DESCRIPTION() macros
Content-Language: en-US
To: David Airlie <airlied@redhat.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kernel-janitors@vger.kernel.org>
References: <20240603-md-agp-v1-1-9a1582114ced@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240603-md-agp-v1-1-9a1582114ced@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: UT4MwkskjHyCR2Qwl9yJzbFfUnyIf2hz
X-Proofpoint-GUID: UT4MwkskjHyCR2Qwl9yJzbFfUnyIf2hz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-23_09,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406230142
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

On 6/3/2024 9:55 AM, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/agp/amd64-agp.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/agp/intel-agp.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/agp/intel-gtt.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/agp/sis-agp.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/agp/via-agp.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>  drivers/char/agp/amd64-agp.c | 1 +
>  drivers/char/agp/intel-agp.c | 1 +
>  drivers/char/agp/intel-gtt.c | 1 +
>  drivers/char/agp/sis-agp.c   | 1 +
>  drivers/char/agp/via-agp.c   | 1 +
>  5 files changed, 5 insertions(+)
> 
> diff --git a/drivers/char/agp/amd64-agp.c b/drivers/char/agp/amd64-agp.c
> index ce8651436609..8e41731d3642 100644
> --- a/drivers/char/agp/amd64-agp.c
> +++ b/drivers/char/agp/amd64-agp.c
> @@ -802,4 +802,5 @@ module_exit(agp_amd64_cleanup);
>  
>  MODULE_AUTHOR("Dave Jones, Andi Kleen");
>  module_param(agp_try_unsupported, bool, 0);
> +MODULE_DESCRIPTION("GART driver for the AMD Opteron/Athlon64 on-CPU northbridge");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/char/agp/intel-agp.c b/drivers/char/agp/intel-agp.c
> index c518b3a9db04..2c55264a031e 100644
> --- a/drivers/char/agp/intel-agp.c
> +++ b/drivers/char/agp/intel-agp.c
> @@ -920,4 +920,5 @@ module_init(agp_intel_init);
>  module_exit(agp_intel_cleanup);
>  
>  MODULE_AUTHOR("Dave Jones, Various @Intel");
> +MODULE_DESCRIPTION("Intel AGPGART routines");
>  MODULE_LICENSE("GPL and additional rights");
> diff --git a/drivers/char/agp/intel-gtt.c b/drivers/char/agp/intel-gtt.c
> index bf6716ff863b..e54649027407 100644
> --- a/drivers/char/agp/intel-gtt.c
> +++ b/drivers/char/agp/intel-gtt.c
> @@ -1461,4 +1461,5 @@ void intel_gmch_remove(void)
>  EXPORT_SYMBOL(intel_gmch_remove);
>  
>  MODULE_AUTHOR("Dave Jones, Various @Intel");
> +MODULE_DESCRIPTION("Intel GTT (Graphics Translation Table) routines");
>  MODULE_LICENSE("GPL and additional rights");
> diff --git a/drivers/char/agp/sis-agp.c b/drivers/char/agp/sis-agp.c
> index 484bb101c53b..a0deb97cedb0 100644
> --- a/drivers/char/agp/sis-agp.c
> +++ b/drivers/char/agp/sis-agp.c
> @@ -433,4 +433,5 @@ module_param(agp_sis_force_delay, bool, 0);
>  MODULE_PARM_DESC(agp_sis_force_delay,"forces sis delay hack");
>  module_param(agp_sis_agp_spec, int, 0);
>  MODULE_PARM_DESC(agp_sis_agp_spec,"0=force sis init, 1=force generic agp3 init, default: autodetect");
> +MODULE_DESCRIPTION("SiS AGPGART routines");
>  MODULE_LICENSE("GPL and additional rights");
> diff --git a/drivers/char/agp/via-agp.c b/drivers/char/agp/via-agp.c
> index bc5140af2dcb..8b19a5d1a09b 100644
> --- a/drivers/char/agp/via-agp.c
> +++ b/drivers/char/agp/via-agp.c
> @@ -575,5 +575,6 @@ static void __exit agp_via_cleanup(void)
>  module_init(agp_via_init);
>  module_exit(agp_via_cleanup);
>  
> +MODULE_DESCRIPTION("VIA AGPGART routines");
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("Dave Jones");
> 
> ---
> base-commit: a693b9c95abd4947c2d06e05733de5d470ab6586
> change-id: 20240603-md-agp-68a9e38017af
> 

Following up to see if anything else is needed from me.
Hoping to see this in linux-next :)

/jeff
