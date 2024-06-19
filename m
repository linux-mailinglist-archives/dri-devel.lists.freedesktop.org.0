Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 900DD90F608
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 20:26:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C4210ED74;
	Wed, 19 Jun 2024 18:26:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="cFFqLOfv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 099E810ED74;
 Wed, 19 Jun 2024 18:26:54 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45JEw3Nm025061;
 Wed, 19 Jun 2024 18:26:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JATlb9CSfXVF9/tchTt64JGPel3o+cysxTNpcdLTY58=; b=cFFqLOfvlR5r+nbk
 Prc/+9JsNBGIT6hR2knBQGrxmnys9QcvSuNImliSfWEW8ZJGFAf2TAySmxo3bpqM
 qU4a1hLsbyfQDvIttp5ZljYGIXCccpJdfTNgSZw3fOthKQfyjfQ1j0kWb7u7rHxc
 /E2DdBY404xuTr9yeydt/Qs7RkBdBIYZLPVKL+Ft5tNg55SFWuiRt5vHn4oP4oO6
 Za+io6MB7+/9KFb3kuModlufTktK7IUjzHqb8K8fzxJqEeWF8tN6u65YJP8ZOCdb
 du1sMzwtnn/oZwTck5NNx/p8kg1luFT8+fWM/PQAbZnuOHKtGcvH2uNTXkEWEyu6
 iSDp/A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yv1j90ebc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jun 2024 18:26:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45JIQqN8032573
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jun 2024 18:26:52 GMT
Received: from [10.81.24.74] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Jun
 2024 11:26:52 -0700
Message-ID: <a8ab46d9-8845-4635-9742-11525dd843b0@quicinc.com>
Date: Wed, 19 Jun 2024 11:26:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/nouveau/nvkm: separate out into nvkm.ko
To: Ben Skeggs <bskeggs@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
References: <20240613170211.88779-1-bskeggs@nvidia.com>
 <20240613170211.88779-3-bskeggs@nvidia.com>
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240613170211.88779-3-bskeggs@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: QbsYZvfLszFS-bn6wpMjIjS45RjP20-4
X-Proofpoint-GUID: QbsYZvfLszFS-bn6wpMjIjS45RjP20-4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 mlxlogscore=836
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxscore=0 adultscore=0
 clxscore=1011 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406190139
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

On 6/13/24 10:02, Ben Skeggs wrote:
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
...
> +
> +MODULE_LICENSE("GPL and additional rights");
> +module_init(nvkm_init);
> +module_exit(nvkm_exit);

missing MODULE_DESCRIPTION() which will cause a warning with make W=1

