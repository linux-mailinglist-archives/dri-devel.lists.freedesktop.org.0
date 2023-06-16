Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AC7733536
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 17:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 190C010E64B;
	Fri, 16 Jun 2023 15:55:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C4A910E0E3;
 Fri, 16 Jun 2023 15:55:23 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35GDc1Li028801; Fri, 16 Jun 2023 15:55:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=5XJf5W0wyk5XaqWmM1JbV1XojqSBiRTdlkYDZYp5WJk=;
 b=Y7ka0x4xrs6Uu53IFxcWSEwu3BvaAOSyQxkH6Y22gUJAEpdjMENWE8UQbIcdW10xgFXi
 bdGKrkDNYPFKpWqWP5CLllk62zuXJCpas07ZJDQJLsU73Fiy9YBjfxpwRS4b59WFBOVA
 VwVGvaiiTH1hFLWT4uxu/pN4IRGuJuy5UEeNLdos4kwocZn9h2xcmXcbtH1pBAQniAlV
 thih1frz+LGT2nYtFzyf//qDRnpRXfL2D/N5pLR94g8a086b3OEOkI2XTXhSS+SDi34Z
 nXjoSPaYx98D+TRfGxHmjRqEcYq5klXQg8TmsU3PS/AhUf6JeD3/a3MFsXK6SO/HhuWp LA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r8fdh1drh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jun 2023 15:55:10 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35GFt87n027791
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jun 2023 15:55:08 GMT
Received: from akhilpo-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 16 Jun 2023 08:55:04 -0700
Date: Fri, 16 Jun 2023 21:25:01 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Juerg Haefliger <juerg.haefliger@canonical.com>
Subject: Re: [PATCH] drm/msm/adreno: Update MODULE_FIRMWARE macros
Message-ID: <yl7qxypdzlzwmmp3b43vz5xo6jxey4zcpdxurcvfzujxrawz36@lneajulwoy4k>
References: <20230616122815.1037425-1-juerg.haefliger@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230616122815.1037425-1-juerg.haefliger@canonical.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: NcgE4SsizypJ0NQpYADfCBCaXp4l3QYh
X-Proofpoint-GUID: NcgE4SsizypJ0NQpYADfCBCaXp4l3QYh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-16_10,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=795 spamscore=0
 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306160142
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
Cc: freedreno@lists.freedesktop.org, sean@poorly.run, ribalda@chromium.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org, joel@joelfernandes.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 johan+linaro@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 16, 2023 at 02:28:15PM +0200, Juerg Haefliger wrote:
> 
> Add missing MODULE_FIRMWARE macros and remove some for firmwares that
> the driver no longer references.
> 
> Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 23 ++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 8cff86e9d35c..9f70d7c1a72a 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -364,17 +364,32 @@ MODULE_FIRMWARE("qcom/a330_pm4.fw");
>  MODULE_FIRMWARE("qcom/a330_pfp.fw");
>  MODULE_FIRMWARE("qcom/a420_pm4.fw");
>  MODULE_FIRMWARE("qcom/a420_pfp.fw");
> +MODULE_FIRMWARE("qcom/a506_zap.mdt");
> +MODULE_FIRMWARE("qcom/a508_zap.mdt");
> +MODULE_FIRMWARE("qcom/a512_zap.mdt");
>  MODULE_FIRMWARE("qcom/a530_pm4.fw");
>  MODULE_FIRMWARE("qcom/a530_pfp.fw");
>  MODULE_FIRMWARE("qcom/a530v3_gpmu.fw2");
>  MODULE_FIRMWARE("qcom/a530_zap.mdt");
> -MODULE_FIRMWARE("qcom/a530_zap.b00");
> -MODULE_FIRMWARE("qcom/a530_zap.b01");
> -MODULE_FIRMWARE("qcom/a530_zap.b02");
Why are these not required when "qcom/a530_zap.mdt" is present?

mdt & b0* binaries are different partitions of the same secure
firmware. Even though we specify only the .mdt file here, the PIL driver
will load the *.b0* file automatically. OTOH, "*.mbn" is a standalone
unified binary format.

If the requirement is to ensure that all necessary firmwares are part of
your distribution, you should include the *.b0* files too here.

-Akhil

> +MODULE_FIRMWARE("qcom/a540_gpmu.fw2");
> +MODULE_FIRMWARE("qcom/a540_zap.mdt");
> +MODULE_FIRMWARE("qcom/a615_zap.mdt");
>  MODULE_FIRMWARE("qcom/a619_gmu.bin");
>  MODULE_FIRMWARE("qcom/a630_sqe.fw");
>  MODULE_FIRMWARE("qcom/a630_gmu.bin");
> -MODULE_FIRMWARE("qcom/a630_zap.mbn");
> +MODULE_FIRMWARE("qcom/a630_zap.mdt");
> +MODULE_FIRMWARE("qcom/a640_gmu.bin");
> +MODULE_FIRMWARE("qcom/a640_zap.mdt");
> +MODULE_FIRMWARE("qcom/a650_gmu.bin");
> +MODULE_FIRMWARE("qcom/a650_sqe.fw");
> +MODULE_FIRMWARE("qcom/a650_zap.mdt");
> +MODULE_FIRMWARE("qcom/a660_gmu.bin");
> +MODULE_FIRMWARE("qcom/a660_sqe.fw");
> +MODULE_FIRMWARE("qcom/a660_zap.mdt");
> +MODULE_FIRMWARE("qcom/leia_pfp_470.fw");
> +MODULE_FIRMWARE("qcom/leia_pm4_470.fw");
> +MODULE_FIRMWARE("qcom/yamato_pfp.fw");
> +MODULE_FIRMWARE("qcom/yamato_pm4.fw");
>  
>  static inline bool _rev_match(uint8_t entry, uint8_t id)
>  {
> -- 
> 2.37.2
> 
