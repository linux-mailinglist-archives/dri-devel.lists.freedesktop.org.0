Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF04B0DEBA
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 16:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5105A10E690;
	Tue, 22 Jul 2025 14:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="D6uh+MGG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 091DE10E099
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 14:33:53 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7VSn4004441
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 14:33:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xtT5su/VJ7JP1pHjFV7X/fYhQ9wlxMPwqcGXpQ4560g=; b=D6uh+MGGULIyksQh
 T1z98YOrVB8kJ3nH/vaFmvUc1IfBWpz8u0xhpyshYnb99/AfS5SqUhMAYDEMLYpP
 xNUvw3lHLhJTkEfTlivMfUj3jb7mXStVBncUdBjfuZyi3fYAGnt8edcWZHdf3bQX
 MDWPWdi0BqJ8AGbFosXVtz4O5ZCBNfAweH45AbC9XYUWpf0UXJA3B89ZU6ALzcut
 UQ60GCuT/nLISw0wGWVJEfCl1gaBUrAGXPYWzGUgVXYccslegUOQNYumJ0R6+opH
 J+1m1XDDRjBKOfheJt2+x2TzW7CB2+Y7J16+DzY+25uvuyabjNe7G0NZgq9wLAi3
 anrgTw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045w045e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 14:33:51 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6fabbaa1937so11130996d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753194830; x=1753799630;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xtT5su/VJ7JP1pHjFV7X/fYhQ9wlxMPwqcGXpQ4560g=;
 b=dZfsE1QspT9MdUX9lq2ytmsJctPBAKripXISsoDBKaYQVJ4Hr0HSK8aJnqwhuk44A5
 fojbXt8VUcONQ3nB3U67w3RIH6j49VIkXSoux1nNUCV2rlmNgwqcMM7Hh8jDNX2iXC7r
 ujyqCE0L288uZf2r8FhTsWOeBzvk7P2CooSLC84PAJ1qau7om6E+UF1RICHQ34SYpZ7W
 WTwSoExtIaDYGAPNBhB7NVznVR2DY7ryAahbK1yvg/MKZl153i4sk7Kyy9o+J96CRmp1
 44qCitEaS5BcfmGtwQ6c20KsMM1oRh5J/tbfxdAuV9rFJDNBw/6YUtxV4r5fMkWy6wvH
 hNiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX34ZEDJEW6EMl1vgVHZ49A36Cwj6EeDPKqCZ46PBWnIUmm+gE/CXVJMUlWupoUuTbBZHB97m2paBU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5aQvjufB9y8q/actD9/XYw7IBRY2Z2A83J7Hlx3AzSMzpD/CZ
 I8o6sxDZrmftbQm9dz+A/QJKElIKHJf0oYp6trAHKpDwgpRqeO+yasStjIpwksaNwrWOYysS5KJ
 +i/Pz4NalFPwmOZpUdixxXOSlM0ZR8HXweCRVHWx6wqU6P4EOH9Ouy5viiOaI9Om4ha9vFe8=
X-Gm-Gg: ASbGncvWROrr7S6tJCvX1eUTl8yfDt9UmrPydi+EAMUZJl77jJXXS0fTCp+2+ZnFkcl
 FPwmiBUnD2Div0nojb9F9Z3pbgIlzPq2jyIbD1hxHX0DSTVKdh5tW4n/TEdxlINHByyHsbTktEm
 TLFxaEJxOZ+qZvTxl5VXWUq0ZJL7pFzsLKQkOg4ZXuJ3ljSaTadIE/QbLC6PoDkw6aHyDxdD0Hr
 Bf1vYdcom5DExhycnotkzp8qz6YEq5cM4LnWW77xp1xm/gKlL0tcmXjIe9G225O5mtmNuzxuQe5
 ZjXzEA05zyrIOkTZTP0yy8w82pek9nP+Uo21mUYNr316q128u78Xh2n9c+sBWpDdihC7qrGhOCN
 UVpDL04ue2m2kAKyQITRU
X-Received: by 2002:a05:620a:2227:b0:7e3:2e02:4849 with SMTP id
 af79cd13be357-7e342b41754mr1177998585a.9.1753194829885; 
 Tue, 22 Jul 2025 07:33:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEU1lbhaP2WVsTXTqM7GGer/GTSGogiYRwUzlLubvQGVjS0cOplM2JT/IJ8lGgLcTomzSOXCQ==
X-Received: by 2002:a05:620a:2227:b0:7e3:2e02:4849 with SMTP id
 af79cd13be357-7e342b41754mr1177993285a.9.1753194828498; 
 Tue, 22 Jul 2025 07:33:48 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-612c9075d76sm6920459a12.52.2025.07.22.07.33.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 07:33:47 -0700 (PDT)
Message-ID: <84a33e15-edaf-4951-8411-24b17ee5f4f5@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 16:33:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/17] drm/msm: a6xx: Fix gx_is_on check for a7x family
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-3-9347aa5bcbd6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-3-9347aa5bcbd6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LL1mQIW9 c=1 sm=1 tr=0 ts=687fa14f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=rILJP4qTGdYfNujWrMwA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: mIq5Dho0SQtTe3Q_fsKBzFyleHRE5Bcj
X-Proofpoint-ORIG-GUID: mIq5Dho0SQtTe3Q_fsKBzFyleHRE5Bcj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDEyMSBTYWx0ZWRfX03dPaPNlBJcJ
 o82ZbUy5Xv2IiL8lDLhuLLWBZJPLtZg8Pp2ulVugxVK2kCryj85nIVAOPMS7P1KOsQAMANJYScT
 I2BD7OnBMu3oHuExzMxRzR/j33xEfqDI1eqfbhqEgc5II+/HmJxDse71xK7/UZfAyDZOIPQRPGR
 VQVS9WVRcKG2tpwYt0zE9ZOnKypl07RzJIAMTkA6NdT6lgSyJ8fyClN3yoVzGsk2pjpAahM3Xr7
 Bc+9mMpSELU5jGtDSB262yaIp+8BmYA+4LeX04XL2HPU+0rG/be/rPAGGDPU3eS3hHlgux14wAJ
 uufLXeLiTRBrGPMPvZZ74PTc6/IvE0kbJJPD6d+TEd8l6ThXOA3cbygBo/4vDM0Ry2Q8bjgjdrp
 BLlmv4xZGyVXrc8EdRKLc/y0qvKwiW+wfT5NegX0a/4gdN6+x5wGZOwaxooUoCtMO3UNb5jY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 mlxscore=0 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220121
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

On 7/20/25 2:16 PM, Akhil P Oommen wrote:
> Bitfield definition for REG_A6XX_GMU_SPTPRAC_PWR_CLK_STATUS register is
> different in A7XX family. Check the correct bits to see if GX is
> collapsed on A7XX series.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

This seems to have been introduced all the way back in the initial
a7xx submission downstream, so I'll assume this concerns all SKUs
and this is a relevant fixes tag:

Fixes: af66706accdf ("drm/msm/a6xx: Add skeleton A7xx support")

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
