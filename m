Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3D159EEEE
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 00:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 729F210E51F;
	Tue, 23 Aug 2022 22:20:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A1110E4C3;
 Tue, 23 Aug 2022 22:20:25 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27NL0HBs002184;
 Tue, 23 Aug 2022 22:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=YHUGoGDlvK9B+Xc8Fwt5QqQDKw/OWvDH6PE+ykBypJ4=;
 b=MRFa2rpISZ1ZRwheKGERhVEnn3/rOQSBBYIrBtdfH2BKwa+4o28iA7atGVduCDS4bZp9
 IsfhgWlDgvEscR+x//grIG4hfqtYkgy8j8OBHWDG4PDPF8yGaC19ZNWmfcZwIz3cLRl+
 4h6HAlHixLdCGmg83CpruPboWHfCNwYijbrIBB1Nq+zW5kRpi2HEJDV32jRiS27SyCyG
 iq8BAUMMgdGlBPhQM6U+6BbFv6UO0oW8PovOjshiY9SgWLV30J5wKjQoy1b+VfAskj/G
 tJNuxx7PwElVeGCyJa4xyxCJVofMjgzgYnbdmfnhInQ9wvibWF2elX9uzieKtraLxqgU mg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j52pqgwfj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Aug 2022 22:20:22 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27NMKKx4002204
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Aug 2022 22:20:21 GMT
Received: from [10.111.161.24] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 23 Aug
 2022 15:20:19 -0700
Message-ID: <f49bf801-49d6-8866-925e-daf117134c07@quicinc.com>
Date: Tue, 23 Aug 2022 15:20:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/dpu: drop unused variable from
 dpu_kms_mdp_snapshot()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220822172204.281045-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220822172204.281045-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: qHAnPtZH9Fah4wv5PQzzKtcsm7XFcEGm
X-Proofpoint-GUID: qHAnPtZH9Fah4wv5PQzzKtcsm7XFcEGm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-23_09,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208230083
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/22/2022 10:22 AM, Dmitry Baryshkov wrote:
> Follow up the merge of address fields and drop the variable that became
> unused after the commit 9403f9a42c88 ("drm/msm/dpu: merge base_off with
> blk_off in struct dpu_hw_blk_reg_map").
> 
> Fixes: 9403f9a42c88 ("drm/msm/dpu: merge base_off with blk_off in struct dpu_hw_blk_reg_map")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 008e1420e6e5..1e1f45409aba 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -902,12 +902,10 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
>   	int i;
>   	struct dpu_kms *dpu_kms;
>   	const struct dpu_mdss_cfg *cat;
> -	struct dpu_hw_mdp *top;
>   
>   	dpu_kms = to_dpu_kms(kms);
>   
>   	cat = dpu_kms->catalog;
> -	top = dpu_kms->hw_mdp;
>   
>   	pm_runtime_get_sync(&dpu_kms->pdev->dev);
>   
