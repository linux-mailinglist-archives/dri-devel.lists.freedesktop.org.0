Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B05FE71EF85
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 18:49:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A437B10E580;
	Thu,  1 Jun 2023 16:49:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADBDC10E57A;
 Thu,  1 Jun 2023 16:49:43 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 351CepqF019920; Thu, 1 Jun 2023 16:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=F3P7CnWt3JspS21qsK55wiKbb/5tikkox3+0vGUuWco=;
 b=VWd8mrvBDt61NJ8zmbZu5/gazoGrRUoY9y12I6pGfpPkpofQXsqfIPS7PllnQSBneC/Z
 NEjmRbKeIuR0YG7Mtw0uP47u9z8z92aG1caoDYrNpQ25npFUSlTVpPzKiOtp7rSfc+Ju
 vdUgKiXkcQzxjj/pd6Eh98pBgbDgFNDHaOUYPF0Re6nm1VmslroZmt6VCd2dEgAfraDj
 7IEM2q4jseAhbGHBqADe7xJQrg/sTN/pt77FZ6Gi1QakQkYcWIovxBH7+LEYNx7rXbV3
 DKO+tnLB17l5SBu5wESw55yoL92mwqI+Nt2ieKkqUj6KMxw0WuXXZ1bpQ8et0I9UvDhH HQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qxugr8pv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jun 2023 16:49:33 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 351GnWt9010176
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 1 Jun 2023 16:49:32 GMT
Received: from [10.110.26.45] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 1 Jun 2023
 09:49:26 -0700
Message-ID: <1e145484-2fe1-d5c6-6eb2-6be0b0fee27e@quicinc.com>
Date: Thu, 1 Jun 2023 09:49:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] drm/msm/dpu: clean up dpu_kms_get_clk_rate() returns
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>, Rob Clark <robdclark@gmail.com>
References: <28644c5e-950e-41cd-8389-67f37b067bdc@kili.mountain>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <28644c5e-950e-41cd-8389-67f37b067bdc@kili.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: g7kCdrVEBawogiPFf_5jC5lnfht0fYEV
X-Proofpoint-ORIG-GUID: g7kCdrVEBawogiPFf_5jC5lnfht0fYEV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-01_08,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 mlxscore=0 clxscore=1011 impostorscore=0 adultscore=0
 malwarescore=0 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306010146
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
Cc: Liu Shixin <liushixin2@huawei.com>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Konrad
 Dybcio <konrad.dybcio@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/26/2023 4:51 AM, Dan Carpenter wrote:
> Static analysis tools complain about the -EINVAL error code being
> stored in an unsigned variable.  Let's change this to match
> the clk_get_rate() function which is type unsigned long and returns
> zero on error.
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> v2: In v1 I change the type to int which was wrong.  This is a different
>      approach.  CC the freedreno list this time too.
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 ++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 0e7a68714e9e..25e6a15eaf9f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -979,13 +979,13 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
>   	return 0;
>   }
>   
> -u64 dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name)
> +unsigned long dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name)
>   {
>   	struct clk *clk;
>   
>   	clk = msm_clk_bulk_get_clock(dpu_kms->clocks, dpu_kms->num_clocks, clock_name);
>   	if (!clk)
> -		return -EINVAL;
> +		return 0;
>   

Currently, the only caller of this API is 
dpu_encoder_phys_cmd_tearcheck_config which seems to handle <=0 so this 
change should be fine. Hence


Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
