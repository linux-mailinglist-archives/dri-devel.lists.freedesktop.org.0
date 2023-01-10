Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC346637D7
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 04:31:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82AC10E520;
	Tue, 10 Jan 2023 03:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A6410E520;
 Tue, 10 Jan 2023 03:31:09 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30A3MRMo000359; Tue, 10 Jan 2023 03:30:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=OkY7mu9pdN8NmbL3lvH8cVGDqojl/7SParZy8RkcbCs=;
 b=nN2FqaE+MTzvTOznotXZvRGyt5REh99OMh5InY+6d6semsH7X7J8s0lCpyxtXodFm77Y
 uCa3vdYXqq7dmNak/4MiLwR9nfP0QdyfT+NSdGiuEwGRPsz6ne6OP6Vb889F2T/jErhm
 6SHlaEyJ2L9ejPJtViwg6PDvYmF1dj1roc0Loplsm++15jGuDz373RssMzlDxq2ql1xQ
 sEjqu1SSdqPYZX0JgDeUm935lbPrQ2A5fyk1KtexvfXB23ZSjt1awF7bLoy3gky07HH4
 50+WVPQPUHOlubxhdzjQG1FxtzsdOFtPKCsm6AApE/x6EVTLfLSxttRonb+lu7WW++xZ ug== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n0q28h0am-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Jan 2023 03:30:36 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30A3UawS006759
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Jan 2023 03:30:36 GMT
Received: from [10.110.115.72] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 9 Jan 2023
 19:30:35 -0800
Message-ID: <b77b9426-a5cc-cdad-4cd5-a4fa97b32b04@quicinc.com>
Date: Mon, 9 Jan 2023 19:30:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH v3] drm/msm/dsi: Add missing check for
 alloc_ordered_workqueue
Content-Language: en-US
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, <dmitry.baryshkov@linaro.org>,
 <d-gole@ti.com>
References: <20230110021651.12770-1-jiasheng@iscas.ac.cn>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230110021651.12770-1-jiasheng@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: PSQcSj4cwEIykNNT9_AiPEwmDSZJnxtQ
X-Proofpoint-GUID: PSQcSj4cwEIykNNT9_AiPEwmDSZJnxtQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_16,2023-01-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 adultscore=0 spamscore=0 impostorscore=0 clxscore=1011 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301100020
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
Cc: marex@denx.de, linux-arm-msm@vger.kernel.org, vladimir.lypak@gmail.com,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/9/2023 6:16 PM, Jiasheng Jiang wrote:
> Add check for the return value of alloc_ordered_workqueue as it may return
> NULL pointer and cause NULL pointer dereference.
> 
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> Changelog:
> 
> v2 -> v3:
> 
> 1. Simply return -ENOMEM instead of using ret.
> 2. No change of the "goto fail".
> 
> v1 -> v2:
> 
> 1. Change the "goto fail" into "return ret" and drop the "fail" label.
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 89aadd3b3202..f167a45f1fbd 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1977,6 +1977,9 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
>   
>   	/* setup workqueue */
>   	msm_host->workqueue = alloc_ordered_workqueue("dsi_drm_work", 0);
> +	if (!msm_host->workqueue)
> +		return -ENOMEM;
> +
>   	INIT_WORK(&msm_host->err_work, dsi_err_worker);
>   
>   	msm_dsi->id = msm_host->id;
