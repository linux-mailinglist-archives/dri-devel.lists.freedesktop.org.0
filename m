Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0BE82588E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 17:46:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D05A10E62F;
	Fri,  5 Jan 2024 16:46:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A6710E62F
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 16:46:09 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4059CJ0b016025; Fri, 5 Jan 2024 16:46:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=WShRe5jYOBJboxDSDbGwkrZl7jTy3KS7EXarED47Uf8=; b=c9
 pI+TDFm5/gJq9Td1Wp2p5b/qq6iitkcF6KcTXaXoJDF7dZxHQPvR0Wpb+e3kDl//
 koQ+ar7ani9F3sR94CwweJGzODOsbCslmr3v8yyL55CNpvy9moPBRny0Gb/QZ6N2
 +MugY9zBU/cPmY5uWAHtvFpjN5cvHrgTf8x39/ZDzl7liI14lj+SKiHIQRhaLNbN
 TzrjrVI/DU/5ehpg3ihClS0zMWBwntrurCeHdMqgaNzwPIbWcMIE47Ty+Lu1+ZKa
 uOFsqN4Wq2L3Q6mrvxf7gO3DvcOQRjarhdv4DtxRwYlOrSNrn3oyQXmtP5eWoGS1
 TnArH+7gGekO8Lg0UKeg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ve99asjbe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Jan 2024 16:46:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 405Gk7oR004948
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 5 Jan 2024 16:46:07 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 5 Jan
 2024 08:46:06 -0800
Message-ID: <89018441-7994-9c78-e2a9-1fd9bc257375@quicinc.com>
Date: Fri, 5 Jan 2024 09:46:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 08/10] accel/ivpu: Disable buffer sharing among VPU
 contexts
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20240105112218.351265-1-jacek.lawrynowicz@linux.intel.com>
 <20240105112218.351265-9-jacek.lawrynowicz@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240105112218.351265-9-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: jyQHNVLDEMt3U7bJaQ6v-oinz4lvXk6z
X-Proofpoint-GUID: jyQHNVLDEMt3U7bJaQ6v-oinz4lvXk6z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401050138
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

On 1/5/2024 4:22 AM, Jacek Lawrynowicz wrote:
> This was not supported properly. A buffer was imported to another VPU
> context as a separate buffer object with duplicated sgt.
> Both exported and imported buffers could be DMA mapped causing a double
> mapping on the same device.
> 
> Imported buffer from another VPU context will now have just reference
> increased and there will be a single sgt fixing above problem but
> buffers still can't be shared among VPU contexts because each context
> have its own MMU mapping and ivpu_bo supports only single MMU mapping.
> 
> The solution would be to use a mapping list as in panfrost or etnaviv
> drivers and it will be implemented in future if required.
> 
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_gem.c | 44 +++++------------------------------
>   1 file changed, 6 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
> index 4de454bfbf91..8cb4d337552e 100644
> --- a/drivers/accel/ivpu/ivpu_gem.c
> +++ b/drivers/accel/ivpu/ivpu_gem.c
> @@ -222,6 +222,12 @@ static int ivpu_bo_open(struct drm_gem_object *obj, struct drm_file *file)
>   	struct ivpu_bo *bo = to_ivpu_bo(obj);
>   	struct ivpu_addr_range *range;
>   
> +	if (bo->ctx) {
> +		ivpu_warn(vdev, "Can't add BO (vpu_addr 0x%llx) to ctx %u: already in ctx %u\n",
> +			  bo->vpu_addr, file_priv->ctx.id, bo->ctx->id);

Looks like the vpu_addr is being used as a unique identifier for the BO. 
  Is that really the best value to use?  Seems like if I want to attack 
another context, knowing the device address of something that context 
owns would be useful information.
