Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A36A4B16089
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 14:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A14C010E206;
	Wed, 30 Jul 2025 12:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PGoJrr4z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97EE410E206
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 12:45:23 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UCbBfK012971
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 12:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tGD7An+ORZOjh//giVMxSzmnuZTa775G5JSoHE0guvU=; b=PGoJrr4zHtCSTMPk
 m4+MGP3v7i8nvYY6l/IeF+O/VzXc/JOJkvDKxkB/WnwfCUMbbY+mQ/vtfeylc9+q
 GvDQMiv4Sl2WCjxQZSuOvTQQGE5nVD5AwxOTPBhakMxacyKtC+rGtNIqsEV8bLD4
 /6NEs+qZEnPJ9NbcgY6C5HtPpq1RzWlGRp/jCRVxDez8RGDUWKvmqHtiB03I2kQq
 Ac9owKDs8M8roGeVDkoI4YndtHPlFrFkLLqb14inLTFeN9RjNueWdOukdmpLof6V
 rc13k8IJO+/z4KUVlA+HGHma5Sus/CxAA/QH4HKno8Xkpj6zA5LTHNg+ASv7VzkV
 moBH/g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm2kp5q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 12:45:22 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-707428e0cd2so3883956d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 05:45:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753879521; x=1754484321;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tGD7An+ORZOjh//giVMxSzmnuZTa775G5JSoHE0guvU=;
 b=JlfnsVUgugs4tVc10Nh/7rw4pCOPr1LxNn8kYuZFjJV1CmsLctr7A1GWMFYDp+/lmM
 LmWIMDKK/Rg8TW5fF/CDY4eEFUD2xNFKSAHGeHn3OnEwKqzeXYhkRRBbyZZ1J7DkF2k0
 A6wLHPXauF6KISB0jUFZutVHteqYeV+dfvrbxSV369f5GKjmMaMyB16VACfnOVvYPdRm
 ouJoEcCkcs6eN+xy80SUkx5MbDwx6gGLy14GF27Wm1ui8bRzLq+yHh0eAkaOkU29ovZO
 D0bi9HbrA7K/GlJjQ4Jbcgg6LhUPm9y1z4AWaI2C8EVR3O5DU3qvu0EpsmYZkuqZCuTi
 O05A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbirW2b/dS+mdmcy46uCBMHJN3nE+pjfg4OBwiuHQAfA901VPsIg4e1Ak7UrOxErjz7ddbg7YYDPU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8+FZaVn/XZgqxWJGFpwH7yn4WTlxPRtBHIJKfKlPsDVyEstIq
 jOMGekYULKqEuVqeiF7BV1wrMHKxxAWgk5/RaDHX74f6ET+Zx14avOylKOfmnKQLbAEezjsLwTB
 8SPAPV1dOANhByNZeOqzF5KelFNBIp0vOVUYxMVEkSoRnOrPXtHnxO9GfBuX1ZXqeVZn+dbo=
X-Gm-Gg: ASbGncuLHgde2x2GteLDp3gHYRWIQ9IqKvQ96FLkUIqmIUVnkz9ut0biUz231qm9qPd
 6tmVFQpAUHVCav/UjraZ5TGVxmDZoPjcAXst7ayptW3dql+PyI8Mi71IX0thpFJOwD+iHJsuHC1
 wDQbtZB3xUj8f7Vf8DZx65gvtbB+Lf5beMNERoUPp+ZpKYSmPeef1/lB981R++QCKLCicIH7k1Z
 UIw32NKp/YMMtQv/E5f9+YYn4JF+Q4X7zGRTVpGeNjXqtzssdjvNeP3ozPtrN0IrztZ2wrggIPQ
 qreEiE9g5AqpVs25ZYQF/1liwJuhTdsZ3pYon/R7lHw0iR7EOmy07N66rhCN3YWWNBY3giMSK9Z
 Xz6n96yiAjFnZsxY/Sw==
X-Received: by 2002:a05:620a:c55:b0:7e3:3c02:4c10 with SMTP id
 af79cd13be357-7e66f340dbemr204407185a.10.1753879521328; 
 Wed, 30 Jul 2025 05:45:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdISRDnj4LdKwJnA5RwUTBCM101PtZrNYA6In3rDGQz1QjGYTyHcrpf0LJ3CYc1iz1Xdis+g==
X-Received: by 2002:a05:620a:c55:b0:7e3:3c02:4c10 with SMTP id
 af79cd13be357-7e66f340dbemr204403685a.10.1753879520804; 
 Wed, 30 Jul 2025 05:45:20 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af635a669c8sm733134866b.72.2025.07.30.05.45.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 05:45:20 -0700 (PDT)
Message-ID: <74e3836e-af29-4b5f-b644-23bdff084c78@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 14:45:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: update the high bitfield of certain DSI registers
To: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, lumag@kernel.org, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
References: <20250730123938.1038640-1-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250730123938.1038640-1-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MKXEbweFHBbmg33Qp0C8Kphc-DJth7eA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA4OSBTYWx0ZWRfX1PV14QLZXcdo
 1asrw3o6tqGV4ASettTDTOi3RBcKkmisd+qdqFIFKLi5/5M+aTTv0+D6jMrQXqIGpQl7AzsXH3f
 Obla/pa2nuyZ0skGJpEl22AP6C0P1JILQKvC1snkETWGJoLHdr2Cxg1XGoq63fwcFNUStFE4yCw
 7H0P5qWd+QjabJRblSNf/CrQrmFYWIKctPX2ldROpRLfI294PiiAW3yxlvuWgJ3v5EEWUxuNLSm
 UTutDNwSk8u9SCGUy+i0ydvwrKaUJpbpTMz+tuiNw7n1Kh2yBr+DwmRzflylVWtoCiGVOXdBCCM
 OmcGwo0R1yneIDU+JQCHQKGNvo0eKZDdTn2ck0GatyXfQQBzob1Qw2emtHBGSduSocsL7ZKnNnq
 cwzHZn2Eq/WoKbwv5mvSNln5cbCGiOxMmtm5Quhf0g9pK6Rq/AJRnld25oREX3WQ93v/hoeZ
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=688a13e2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=COk6AnOGAAAA:8
 a=GqOxEGSAyoRmTf9NYtcA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: MKXEbweFHBbmg33Qp0C8Kphc-DJth7eA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=993 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507300089
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

On 7/30/25 2:39 PM, Ayushi Makhija wrote:
> Currently, the high bitfield of certain DSI registers
> do not align with the configuration of the SWI registers
> description. This can lead to wrong programming these DSI
> registers, for example for 4k resloution where H_TOTAL is
> taking 13 bits but software is programming only 12 bits
> because of the incorrect bitmask for H_TOTAL bitfeild,
> this is causing DSI FIFO errors. To resolve this issue,
> increase the high bitfield of the DSI registers from 12 bits
> to 16 bits in dsi.xml to match the SWI register configuration.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  drivers/gpu/drm/msm/registers/display/dsi.xml | 28 +++++++++----------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/registers/display/dsi.xml b/drivers/gpu/drm/msm/registers/display/dsi.xml
> index 501ffc585a9f..c7a7b633d747 100644
> --- a/drivers/gpu/drm/msm/registers/display/dsi.xml
> +++ b/drivers/gpu/drm/msm/registers/display/dsi.xml
> @@ -159,28 +159,28 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
>  		<bitfield name="RGB_SWAP" low="12" high="14" type="dsi_rgb_swap"/>
>  	</reg32>
>  	<reg32 offset="0x00020" name="ACTIVE_H">
> -		<bitfield name="START" low="0" high="11" type="uint"/>
> -		<bitfield name="END" low="16" high="27" type="uint"/>
> +		<bitfield name="START" low="0" high="15" type="uint"/>
> +		<bitfield name="END" low="16" high="31" type="uint"/>
>  	</reg32>
>  	<reg32 offset="0x00024" name="ACTIVE_V">
> -		<bitfield name="START" low="0" high="11" type="uint"/>
> -		<bitfield name="END" low="16" high="27" type="uint"/>
> +		<bitfield name="START" low="0" high="15" type="uint"/>
> +		<bitfield name="END" low="16" high="31" type="uint"/>
>  	</reg32>
>  	<reg32 offset="0x00028" name="TOTAL">
> -		<bitfield name="H_TOTAL" low="0" high="11" type="uint"/>
> -		<bitfield name="V_TOTAL" low="16" high="27" type="uint"/>
> +		<bitfield name="H_TOTAL" low="0" high="15" type="uint"/>
> +		<bitfield name="V_TOTAL" low="16" high="31" type="uint"/>
>  	</reg32>
>  	<reg32 offset="0x0002c" name="ACTIVE_HSYNC">
> -		<bitfield name="START" low="0" high="11" type="uint"/>
> -		<bitfield name="END" low="16" high="27" type="uint"/>
> +		<bitfield name="START" low="0" high="15" type="uint"/>
> +		<bitfield name="END" low="16" high="31" type="uint"/>
>  	</reg32>
>  	<reg32 offset="0x00030" name="ACTIVE_VSYNC_HPOS">
> -		<bitfield name="START" low="0" high="11" type="uint"/>
> -		<bitfield name="END" low="16" high="27" type="uint"/>
> +		<bitfield name="START" low="0" high="15" type="uint"/>
> +		<bitfield name="END" low="16" high="31" type="uint"/>
>  	</reg32>
>  	<reg32 offset="0x00034" name="ACTIVE_VSYNC_VPOS">

FWIW looks like at least on 8280, ACTIVE_VSYNC_HPOS offset = 0x38
and HPOS doesn't exist

Konrad
