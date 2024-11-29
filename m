Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 117019DC1FC
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 11:10:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7879810E0A7;
	Fri, 29 Nov 2024 10:10:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="os25FuT/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9418310E0A7
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 10:10:16 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AT83sXI004431
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 10:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 z61u33009lkO4iA10YATowP+/WsVsnWmQc10+mW5rzk=; b=os25FuT/SHpmuM5d
 WWJFpWx+UhwZVRgqaJTvCjeowiGbSCpWhfLDxa0hG5vyL9XUDlrDwLDdodJlJvku
 7bCCvr8HYXcNWiAaH9kRnlzSRXnvTR6g3YJf//FwsHrwOGPnNWHUVdAIQHVexyp1
 Q9Bb/R3qWOIvyhdMwTavC0JKqsbgr498a5bdJGIqDhnRdXkkEQ7OqDlJDrRpJQ+j
 ucEslGCw3IgkYoldTpZdROf112fz5NjmikbIQFm5scqIvTrKdcuTgrhv28NGiknF
 WhKw6LUkn5A8eYVu+3wf97Zs3SyiNTEctSHpyjmtCiMqNj7zW1gc9p4FjRUAIWQU
 orCe7A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4379s6rarw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 10:10:15 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ATAAFlj021187
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 10:10:15 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 29 Nov
 2024 02:10:14 -0800
Message-ID: <45bbb966-85db-4231-87e1-61e50c2977f1@quicinc.com>
Date: Fri, 29 Nov 2024 18:10:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] phy: qcom: edp: Add support for eDP PHY on QCS8300
To: <dri-devel@lists.freedesktop.org>
References: <20241127-qcs8300_dp-v1-0-0d30065c8c58@quicinc.com>
 <20241127-qcs8300_dp-v1-2-0d30065c8c58@quicinc.com>
 <new6hjxnwyuohetdprxwee3epf23uemwft2p7faym5f5zqv3og@fksrew4blk7p>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <new6hjxnwyuohetdprxwee3epf23uemwft2p7faym5f5zqv3og@fksrew4blk7p>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: zYsXAlkQiGCxI6YmcJ5z-LVVThKcztjG
X-Proofpoint-GUID: zYsXAlkQiGCxI6YmcJ5z-LVVThKcztjG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411290083
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



On 2024/11/27 21:41, Dmitry Baryshkov wrote:
> On Wed, Nov 27, 2024 at 04:15:49PM +0800, Yongxing Mou wrote:
>> Add support for eDP PHY v5 found on the Qualcomm QCS8300 platform.
>>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-edp.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
>> index f1b51018683d51df064f60440864c6031638670c..90e0a399c25299ad1b2fb5df8512ba3888661046 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
>> @@ -532,6 +532,13 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v4 = {
>>   	.com_configure_ssc	= qcom_edp_com_configure_ssc_v4,
>>   };
>>   
>> +static const struct qcom_edp_phy_cfg qcs8300_dp_phy_cfg = {
>> +	.is_edp = false,
>> +	.aux_cfg = edp_phy_aux_cfg_v5,
>> +	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v5,
>> +	.ver_ops = &qcom_edp_phy_ops_v4,
>> +};
>> +
>>   static const struct qcom_edp_phy_cfg sa8775p_dp_phy_cfg = {
>>   	.is_edp = false,
>>   	.aux_cfg = edp_phy_aux_cfg_v5,
>> @@ -1133,6 +1140,7 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
>>   }
>>   
>>   static const struct of_device_id qcom_edp_phy_match_table[] = {
>> +	{ .compatible = "qcom,qcs8300-edp-phy", .data = &qcs8300_dp_phy_cfg, },
> 
> If the setup is the same as SA8775p and you don't expect any
> QCS8300-specific tunings, please reuse sa8775p as a fallback compat.
> 
Got it. it can reuse sa8775p, will update it in next patchset.
>>   	{ .compatible = "qcom,sa8775p-edp-phy", .data = &sa8775p_dp_phy_cfg, },
>>   	{ .compatible = "qcom,sc7280-edp-phy", .data = &sc7280_dp_phy_cfg, },
>>   	{ .compatible = "qcom,sc8180x-edp-phy", .data = &sc7280_dp_phy_cfg, },
>>
>> -- 
>> 2.34.1
>>
> 

