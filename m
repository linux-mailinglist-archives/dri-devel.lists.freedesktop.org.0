Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 740E1647A00
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 00:33:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 331BE10E1F4;
	Thu,  8 Dec 2022 23:32:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 504C789221;
 Thu,  8 Dec 2022 23:32:52 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B8N7ZO7002134; Thu, 8 Dec 2022 23:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=48PlYMwALAX1T+syQSfl6Mu6s6y6b6nANo1hDlIYUh0=;
 b=UxBqN8tdrkKhUctueynxiHIMEjJ3Gf8b9ScEaVOcC52Hg+CW4NAupNAw+1zlx665CWLi
 Urv0I+PD4OCN2qBM/o3SDFzdh2liwNxn6SS5LB4HWXGnBMMW6oIWG6IgnY6/ZRkA8emi
 4XHlst5tj1Hi3uBQp3p0fQ0XgvtpLC1ZscTN/QsfudcMXBg9X8kL6fczTsmVuVUm4DQS
 ugimVNmd6RDuAnGobuUBC08LoIJ3dnC/8HHKdADey9yU2smAh/b9wxnz2j9ofhs2FXe9
 EIEa6L6f2ISMp0Ybb0mxS6sEYCcHbO+T5Vhor/IRfNDZd7AATEfGHx1+Sh+0zR4ejSLL Pw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mbr2ag5gj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Dec 2022 23:32:47 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B8NWk1T014209
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 8 Dec 2022 23:32:46 GMT
Received: from [10.110.56.119] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 8 Dec 2022
 15:32:45 -0800
Message-ID: <444ed3ed-a7e1-5e83-add8-b383fb2b7e23@quicinc.com>
Date: Thu, 8 Dec 2022 15:32:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v5 03/12] drm/msm: Introduce SC8280XP MDSS
Content-Language: en-US
To: Bjorn Andersson <quic_bjorande@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
References: <20221207220012.16529-1-quic_bjorande@quicinc.com>
 <20221207220012.16529-4-quic_bjorande@quicinc.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20221207220012.16529-4-quic_bjorande@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: a8hRYGQlXiMHThfMOQOXYQPCYS1JbzP9
X-Proofpoint-GUID: a8hRYGQlXiMHThfMOQOXYQPCYS1JbzP9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-08_12,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 mlxlogscore=999 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212080193
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Johan
 Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/7/2022 2:00 PM, Bjorn Andersson wrote:
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
>
> Add compatible for the SC8280XP Mobile Display Subsystem and
> initialization for version 8.0.0.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>
> Changes since v4:
> - None
>
>   drivers/gpu/drm/msm/msm_mdss.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 86b28add1fff..8677e74868cf 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -287,6 +287,9 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
>   	case DPU_HW_VER_720:
>   		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_3_0, 6, 1, 1, 1);
>   		break;
> +	case DPU_HW_VER_800:
> +		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 2, 1);
> +		break;
>   	}
>   
>   	return ret;
> @@ -513,6 +516,7 @@ static const struct of_device_id mdss_dt_match[] = {
>   	{ .compatible = "qcom,sc7180-mdss" },
>   	{ .compatible = "qcom,sc7280-mdss" },
>   	{ .compatible = "qcom,sc8180x-mdss" },
> +	{ .compatible = "qcom,sc8280xp-mdss" },
>   	{ .compatible = "qcom,sm6115-mdss" },
>   	{ .compatible = "qcom,sm8150-mdss" },
>   	{ .compatible = "qcom,sm8250-mdss" },
