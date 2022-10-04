Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DFB5F4790
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 18:28:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5992D10E0CD;
	Tue,  4 Oct 2022 16:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9030C10E0AE;
 Tue,  4 Oct 2022 16:28:12 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 294F89UI001775;
 Tue, 4 Oct 2022 16:28:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=er6WiFdir6EGtOJNKUaGEwi0MCH4cdt6wj/WNtIk28c=;
 b=gM63uEQl+NrPYdjvUp/K0JfGmBB8R9fV4mGkjS6iO+P8OXxTseH65+suTSsftmz4DbfV
 WIepsMJaW8FDJB6bIUmJJD/vL6tP22+T7hcRih5f7LRPLcviDXN5P2hC6w18IaY1VHrv
 room6h05PjpgeS4oodWOo8h4RdgC9ScG0p6fPKPPYJfGBrz+tddmp2nQ0LrcTCokPZ1S
 QDmrXMD0hVIT+WtHK9OYC/NdJ4TnZHOiRsZD1eUD0BSmdJS5OtEbc3SYgTOI6xJd7VO9
 o14mcYWBgCldXol9tqacWmkzBNw83UTveI8psPsaXARej0hulAPtTRwqjA8OEvJda806 Ww== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k0escs8r9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Oct 2022 16:28:01 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 294GS1qm032218
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 4 Oct 2022 16:28:01 GMT
Received: from [10.111.163.178] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 4 Oct 2022
 09:27:58 -0700
Message-ID: <fa74e1c0-53bb-4e73-4df5-c69cd455dd11@quicinc.com>
Date: Tue, 4 Oct 2022 09:27:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH -next] drm/msm: Remove unused variables 'top'
Content-Language: en-US
To: Chen Zhongjin <chenzhongjin@huawei.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20221010024010.2873633-1-chenzhongjin@huawei.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20221010024010.2873633-1-chenzhongjin@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: eTWAbwP9wnza17SGp2NVwyKAzZq0dcIZ
X-Proofpoint-GUID: eTWAbwP9wnza17SGp2NVwyKAzZq0dcIZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-04_07,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1011 suspectscore=0 mlxscore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210040106
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
Cc: dmitry.baryshkov@linaro.org, andersson@kernel.org, sean@poorly.run,
 dianders@chromium.org, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/9/2022 7:40 PM, Chen Zhongjin wrote:
> 'commit 1e5df24b996c ("drm/msm/dpu: drop length from struct dpu_hw_blk_reg_map")'
> 'commit 9403f9a42c88 ("drm/msm/dpu: merge base_off with blk_off in struct dpu_hw_blk_reg_map")'
> These commits had merged hw.blk_off and hw.blk_off to mdp.
> So we don't need to get dpu_hw_mdp in dpu_kms_mdp_snapshot() now.
> 
> Since there is no code using 'top' in this function. Remove it.
> 
> Signed-off-by: Chen Zhongjin <chenzhongjin@huawei.com>

This has already been fixed with:

https://gitlab.freedesktop.org/drm/msm/-/commit/4bca876458caf7c105ab2ae9d80ff2cc9c60388d


> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 008e1420e6e5..79e81f1443be 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -902,13 +902,9 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
>   	int i;
>   	struct dpu_kms *dpu_kms;
>   	const struct dpu_mdss_cfg *cat;
> -	struct dpu_hw_mdp *top;
>   
>   	dpu_kms = to_dpu_kms(kms);
> -
>   	cat = dpu_kms->catalog;
> -	top = dpu_kms->hw_mdp;
> -
>   	pm_runtime_get_sync(&dpu_kms->pdev->dev);
>   
>   	/* dump CTL sub-blocks HW regs info */
