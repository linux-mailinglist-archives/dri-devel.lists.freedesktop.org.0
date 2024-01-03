Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B236823371
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 18:37:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A5E10E132;
	Wed,  3 Jan 2024 17:37:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 360FF10E132
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 17:37:29 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 403C64W3004725; Wed, 3 Jan 2024 17:37:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=tV5nWE9aGzQC716rDi1vI5QF6EUxio6crnQ8dPB1FpQ=; b=Qo
 hP9BY+uPb7d2eU4hVIRfM2ozKiFT6j5bWIGVbCuJkx0BL5baYaC49NJGyQI9BmaP
 rwjTJ+GAEkUuob79QU6I+gi2ARDKDBz5nJywK6Gd4J+rsT5loJ6Fl2xsgHh60EZl
 +u/9x2Zylnle7uFln4N8zAM45eW0GTuq5zSb6t3aQQ8Np0aaRoajbRnI926G9Vb/
 6QZc66jI1D4CP6IpruaxMoRcYuahC55Xt+InIHCMxXdVCXkXVumR5FebXa7HVdiD
 Ih2ySDNAM8vrLTCN0o539FBj6H7lxjK8gIWB9Q1wT4IsS51o8ehDRTs0VsUWDCtL
 TZIePtU/hNf+bdrV5e1g==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vd37y9equ-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jan 2024 17:37:21 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 403HbKeu011254
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 3 Jan 2024 17:37:20 GMT
Received: from [10.110.68.103] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 3 Jan
 2024 09:37:19 -0800
Message-ID: <f7354b0a-9199-425a-8146-9de97cbeffea@quicinc.com>
Date: Wed, 3 Jan 2024 09:37:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH linux-next] drm/panel: samsung: Simplify with
 dev_err_probe()
Content-Language: en-US
To: <chenguanxi11234@163.com>, <neil.armstrong@linaro.org>
References: <061ed94a003362bb7d7e9d3e4d38358c5b91c8a3.1704186827.git.chen.haonan2@zte.com.cn>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <061ed94a003362bb7d7e9d3e4d38358c5b91c8a3.1704186827.git.chen.haonan2@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: LXeUonfwL3tnYDd-1FgnfB-oA1mMO_Cy
X-Proofpoint-ORIG-GUID: LXeUonfwL3tnYDd-1FgnfB-oA1mMO_Cy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 clxscore=1015 mlxlogscore=999 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401030143
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
Cc: cgel.zte@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen Haonan <chen.haonan2@zte.com.cn>,
 yang.guang5@zte.com.cn, mripard@kernel.org, tzimmermann@suse.de,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/3/2024 6:17 AM, chenguanxi11234@163.com wrote:
> From: Chen Haonan <chen.haonan2@zte.com.cn>
> 
> dev_err_probe() can check if the error code is -EPROBE_DEFER
> and can return the error code, replacing dev_err() with it
> simplifies the code.
> 
> Signed-off-by: Chen Haonan <chen.haonan2@zte.com.cn>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/panel/panel-samsung-s6d16d0.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
> index 79f611963c61..f4103e762b53 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
> @@ -194,10 +194,8 @@ static int s6d16d0_probe(struct mipi_dsi_device *dsi)
>   	s6->reset_gpio = devm_gpiod_get_optional(dev, "reset",
>   						GPIOD_OUT_HIGH);
>   	if (IS_ERR(s6->reset_gpio)) {
> -		ret = PTR_ERR(s6->reset_gpio);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(dev, "failed to request GPIO (%d)\n", ret);
> -		return ret;
> +		return dev_err_probe(dev, PTR_ERR(s6->reset_gpio),
> +							 "failed to request GPIO\n");
>   	}
>   
>   	drm_panel_init(&s6->panel, dev, &s6d16d0_drm_funcs,
> -- 
> 2.25.1
> 
