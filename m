Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5F2B15DE9
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 12:16:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB7DC10E157;
	Wed, 30 Jul 2025 10:16:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kw5bmzUS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408E610E157
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 10:16:27 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U9RZua028260
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 10:16:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 e74WcFwkTr6qVr34ZJAvZTfeytAh6aWlboCX6N91C3A=; b=Kw5bmzUSHx4PROsj
 WFRjmhqaxrVUj/5aGffpMHtJaySYHJKSY7gbM1742maN0xiQAkLy+hHEDb16UgwV
 UcCLWhxRDLqFv0M9FGqOkSyQ1ZKRGtjf9oMWfzonCyS3lDfQiUB1BcDvfr+pFMxo
 VwxGQnokbaF/DeCxN77CsEGOxmsgDTf3R+ESA05MvX0gz8NP5ChOjHHPc2XvTY1H
 1q5nKz4sc9Pq15owH390aNtsUt49yr1gi8mlvVk0Sel9m47bjjzBF8WzRT46vXTL
 LGAAR+XsE3RKLJLEf+5/r1K2AaSbKsskxYf/KlJNRTp9AnDg2AmK7coCk1eh2a3n
 ngFqwA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbm37td-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 10:16:26 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-707428e0cd2so3610276d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 03:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753870585; x=1754475385;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e74WcFwkTr6qVr34ZJAvZTfeytAh6aWlboCX6N91C3A=;
 b=AwPZi1rp3r16KpyRMfsb1F0yS40z9RanoJNxj/RCIk4duB4VUJayxygAAH1C0Eg9JY
 MnIzJ2eJL5dUXCf6OJpzL0CjM+rKZW93qt5hOwlfvPLNl6QYdMPpQIGnsMMAqxVB82eH
 Xjeop9ik/l8CiJoRWcZGcaS4BJ7oHoAyHo41sH0bU75m/jSShuktGmvQrlHY73d18FiM
 cR6bB6CsaFp1GR6gqcYNpdRSibmSCv4rqkMMbGnz+M1GxK3HC2vCE675dBn7qWZHsbx/
 /PrJgv19NzDGbRnSmL2G/d5nlekRJNH+nGxLqBOTBm4HNzjoRrjfPlpB02oIjCdjafpF
 TmyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVj4QTgVoCpySnWN3VNHSvfeLMksxLU6R2mnOPh46OptSLgnwS3SG1r0hKz832ePI+FL0D+wW6nJd4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZGLGpZkEFgTzk3H+0HJZ/EzSBWxAIysidP7yc4ilMBrTgH5if
 lRVuXLr4z/vLgAsYgg121rVi56QYi8C6EaO5TQtc/gtvFkxds+ZSzk+PKbUjo4MHxpgg86FZPYD
 GuO3/JuazTs1Aofi3BM3q435z4PJA6Aoy3xQHW3UAyfwUyMs2X8OrGbHIn0sX6V06lqdJOZ8=
X-Gm-Gg: ASbGncv9i3uNc2HPpEIyUbvOgfXagboCQ1LHW//TAy5kIiMGRzNYzS6NPMiC/UPdJbl
 bG72wpk/vZOSrBKGW0QqyNLWq6PEMDFvvRhe5WwsNfq18WzJcM3u2rv2CXCMhF/cSFpwZD98xmy
 W/8cyo42YZKJm6H9wOQB0ybsFoUaVnOcbRfrum2/FgFyuC0gIzVSJOOT5GnBr/Dz5G6/AmUMXlJ
 hhihZ7SjqsC4DW4+7riceeeciurTeKbLyTbtyzLAQGFwXE5aqN5V3rVV9QKefhmeVvfsObv30wr
 hWJqSFii7cwb3W0KS2V5fxArzcCQW0AkVMt83djvbd1WSBYSl0EQsTVI+sA95O8aHk5U77WWtX0
 hnAos/m8I6XrnEAm1Zw==
X-Received: by 2002:a05:620a:a907:b0:7e6:6f9d:4b06 with SMTP id
 af79cd13be357-7e66f9d4b93mr156062885a.0.1753870585394; 
 Wed, 30 Jul 2025 03:16:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMVovcbr9AHNlT90gl+k15THWxhh7Sd7H8hPKD8T+t66JapkQsUuAU5RAVLiYqLUQ/JNBoxw==
X-Received: by 2002:a05:620a:a907:b0:7e6:6f9d:4b06 with SMTP id
 af79cd13be357-7e66f9d4b93mr156060585a.0.1753870584897; 
 Wed, 30 Jul 2025 03:16:24 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af635accc38sm715115266b.114.2025.07.30.03.16.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 03:16:24 -0700 (PDT)
Message-ID: <070915c8-4d7f-40d2-ba38-e20a801c9089@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 12:16:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] soc: qcom: ubwc: Add QCS8300 UBWC cfg
To: Yongxing Mou <quic_yongmou@quicinc.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250730-mdssdt_qcs8300-v5-0-bc8ea35bbed6@quicinc.com>
 <20250730-mdssdt_qcs8300-v5-5-bc8ea35bbed6@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250730-mdssdt_qcs8300-v5-5-bc8ea35bbed6@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=6889f0fa cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=TI01094hTbTrXjSAet8A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA3MSBTYWx0ZWRfX3PKLOu6X+zfF
 nib586vBWHnzlEJfICKhQLuN9oGlUK1W8a3JqNu26Yl6OiNZbUueFJeQlMcvGmwY0P/o64yEnAk
 /G+T5nSccQEXRvMj+8rHmfZNI9ZNpkNqdCJEuoyWGBGsFBd6H7UOqcq/F+z2rkHrpZKm0em2bo0
 IwxdMGY6TPFEQSMsmSynoGB3VdI1fkKnTs+t9CxnW99wVxvZJTphoGRA4GchRXFVnjJUy3v+/IB
 lrFDYgBMCd8xPGgdLf1mq28opqLE5vD6M195mMb9AzPp42rdekSja0FFtHMdYvsRb2Hclv2Cj6N
 4igF71xsnGYsfNs5+LIBajFTFMEgoSiMF0sUfVOvFKASlSol5bx9vgOr90SMYTxerk0AU55cWk+
 7r37XDMHQ8FWgoWt+dSyNdKwGmPUfPa5UGjTwxT7Hlv/+L1ZpoHdZSVarX4dVjeb+Tkc+0o3
X-Proofpoint-ORIG-GUID: O6GMvmstilww9jrtiyPk_Pu-xAlt3rq3
X-Proofpoint-GUID: O6GMvmstilww9jrtiyPk_Pu-xAlt3rq3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507300071
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

On 7/30/25 11:42 AM, Yongxing Mou wrote:
> The QCS8300 adopts UBWC 4.0, consistent with SA8775P, add 4 channels LP5
> configuration data according to the specification.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/soc/qcom/ubwc_config.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
> index bd0a98aad9f3b222abcf0a7af85a318caffa9841..389fb871018b65987295db60571c063b4d984d70 100644
> --- a/drivers/soc/qcom/ubwc_config.c
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -35,6 +35,16 @@ static const struct qcom_ubwc_cfg_data qcm2290_data = {
>  	.highest_bank_bit = 15,
>  };
>  
> +static const struct qcom_ubwc_cfg_data qcs8300_data = {
> +	.ubwc_enc_version = UBWC_4_0,
> +	.ubwc_dec_version = UBWC_4_0,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
> +			UBWC_SWIZZLE_ENABLE_LVL3,
> +	.ubwc_bank_spread = true,
> +	.highest_bank_bit = 16,
> +	.macrotile_mode = true,
> +};
> +
>  static const struct qcom_ubwc_cfg_data sa8775p_data = {
>  	.ubwc_enc_version = UBWC_4_0,
>  	.ubwc_dec_version = UBWC_4_0,
> @@ -225,6 +235,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
>  	{ .compatible = "qcom,msm8998", .data = &msm8998_data },
>  	{ .compatible = "qcom,qcm2290", .data = &qcm2290_data, },
>  	{ .compatible = "qcom,qcm6490", .data = &sc7280_data, },
> +	{ .compatible = "qcom,qcs8300", .data = &qcs8300_data, },

You can just pass &sc8280xp_data instead, they're equivalent

Konrad
