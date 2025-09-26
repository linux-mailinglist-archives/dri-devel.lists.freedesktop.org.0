Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CAABA3759
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 13:18:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D1B10EA3B;
	Fri, 26 Sep 2025 11:18:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BSUQ5OO1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F05F010EA28
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 11:18:13 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8vYec020684
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 11:18:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Eq9Zwf2rKiWBOFDTkcfFofQ9fiSbCfKkCk6e8JzUd+4=; b=BSUQ5OO1IXahVIuV
 Vn8Ku/wW88M79HlafbRzhLbeqlgfbsYTcgba0hO3JM4RJGdeUy59wHOEI50o1ePw
 9bWfmr1qmXKbOyzPbh7Nhf1oybSp49g36xYPjfD1H1bQqUs4D31V1sqdumkbJREa
 7xDKdPmo5XjjMS+ctOvkrYZqJ9SbwqEXiIY5ILTqiKZxxBPD4dAg5fkRhV8ZFhWK
 iGEZnV8piOhPbPhu5gsQj8W/Kk7HhuJAnLWKzXAHEQk9YWtRtpNGIGAEc0Ok/G7y
 vSjaSUoeWIV8kARA2y/DZ1FoO/wDPRK9sDHrywxChABlyRLNAsXA1jkNFW9Km1gu
 S5kp5Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0qtn65-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 11:18:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-85696c12803so82927385a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 04:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758885492; x=1759490292;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Eq9Zwf2rKiWBOFDTkcfFofQ9fiSbCfKkCk6e8JzUd+4=;
 b=Z6fXnCxBUV60xPwa+/rEfzNySdHNtS4Ey7AXa6+2ydiJDn5cxSH+9pBRt/Sa/paEOY
 YGV+l/Ey+NBnPOsZdt1ngjNhpXAhXXeHtM23PEnLSiCbTDJTGuVbRgzyMc3WO0ZgMRA/
 jRZBC6R6M7S/l3XdELJ2mYo641CPhKa4Ji6YuK2vR9rSishDnmv6BSwiC18tDKkb6GQt
 2JmCnvYwzxDMM9h+v7mioJtqaFJ2R5NAu4abfKfiTy6FnHfkbvuC8qpSSWAVI+YXWyKT
 8WwmTUvA+qadk4/hG3kEU1DLB1wsw6YSzLxPrArovwmAFpUCoXGRqEkEke08v/FTOzK9
 XUGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpKIjQ3jhGHcuUlyKNZpNEuibv5Zdpdn5ZFI68SaLJKGooAXa14InjMVWySPpBXlWa4Mnc5VYhGXY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyp2rXUfwKpf69qyAkRLhOUupKCblZ1oL39YKsRvcWS+Z2Z3dZp
 mCMd4LvANQ2/yLn5VP5XTrKMfgpLx8yiTCvwWbDGrdhzT4mHm539/e8gXfeq47X3rsKcWxXhjGH
 LhQstcyFuK3/PjnpcktoajhCumhrNEQ5qMiv2mgL30Hhzf2S6Az6hZ2JjYJqxorX8ZUMFAU8=
X-Gm-Gg: ASbGncsbAD8Fw3czhpqJEz0fvaphPzmEw8P/pAxVE9SNGGFV7UiuJunJWM02DgjGEvc
 1KQ4JOZCCK9sorC+6lwAqAJ5b/W2Moc1MT+4tvfSEnGfla9tljO83+a96Ry/q+INP1aV+/5ALBg
 QULPT/92dRh2zWOXdZ5pnq3/ZVofzSbD7Kak3APT+P8tcXlhubNm56jUx0Tgf+y1ZYKwWgcehd0
 FSSRt9gGgnv5Z1AlIWRCEbtTRzX3QdOBqNNQfkXysYHjFNyHelxLI6s1TESmtpmauHohbIfLsxu
 bIsUurUESOQ0HWUFPrUNqRLeOf+y4bGF5na8m6ph8JYDmj9MOmSyDiNmJCVDuXasgLscReNAVCU
 HklOMOO7DzCnPVyHzIlEwQQ==
X-Received: by 2002:a05:620a:3182:b0:812:81c6:266c with SMTP id
 af79cd13be357-85ae6d81db3mr601253785a.9.1758885491766; 
 Fri, 26 Sep 2025 04:18:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTjabHhK02b9oVhzoCCGFrlmQKMMkgWl8q77/ykLbuE2cCJPi3DSQKHtmGntFz7aUmVpFMZA==
X-Received: by 2002:a05:620a:3182:b0:812:81c6:266c with SMTP id
 af79cd13be357-85ae6d81db3mr601248385a.9.1758885491079; 
 Fri, 26 Sep 2025 04:18:11 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b3545a983ffsm349631066b.94.2025.09.26.04.18.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Sep 2025 04:18:10 -0700 (PDT)
Message-ID: <652595ef-ef79-4c36-9979-b536ca65e1de@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 13:18:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/msm/dp: Update msm_dp_controller IDs for sa8775p
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
 dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
 swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
 andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
 jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
 sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
 alex.vinarskis@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_riteshk@quicnic.com, quic_amitsi@quicnic.com
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-2-quic_mkuntuma@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250926085956.2346179-2-quic_mkuntuma@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pvG-YZH3BDARUzDZF-24ujc6vh2oUgoO
X-Proofpoint-ORIG-GUID: pvG-YZH3BDARUzDZF-24ujc6vh2oUgoO
X-Authority-Analysis: v=2.4 cv=api/yCZV c=1 sm=1 tr=0 ts=68d67675 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=tFSzMcqD3SoeBU5fSnoA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX4Ij7pzUj98UT
 j72cF1X6vDHi1JDyX7IU6FFaKX3ofDDnjqUgh/C7UHCSxCzoNO8ai8oBAysiwrGXRbkVAEFDxGX
 cmADzk8lbwAE/2gGRTRD+3W98FfPOyYzBau2leS0SaEN6tuptqY9/5Buix839XjZL+0AlYH77cq
 psqnvwlwx4swEpeevkJzEm+olzOyQVEdwlB9u8Elu1nMuCrQl8T4QRqKonnIE70KfiaUH0nAsGn
 kbQxWWtVScApQCr9mBZj29R/b8PuMewZBJb3QPC7jOF3kQQFPwJlB/Bl5DbIy90JE9B7x2kj7wt
 uW4VegXXguF+ZvM9QgL6EsJDuJh27FagOe65q8K8ZFLszISA1Z9rauRmzlkrlseFMuG3I98qm6t
 Gjt5jGhzYxE7JAc+8qwju/BOWxlGQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_03,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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

On 9/26/25 10:59 AM, Mani Chandana Ballary Kuntumalla wrote:
> The Qualcomm SA8775P platform comes with 2 DisplayPort controllers
> for each mdss. Update controller id for DPTX0 and DPTX1 of mdss1.
> 
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index d87d47cc7ec3..f247aad55397 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -133,8 +133,8 @@ struct msm_dp_desc {
>  static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
>  	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
>  	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
> -	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
> -	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
> +	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> +	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },

Well, did you see what happens when you try to plug in a display
to a controller on MDSS0 and MDSS1 at once now?

(memory corruption)

Konrad
