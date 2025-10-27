Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE7BC0D9EA
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 13:41:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA6C10E0D4;
	Mon, 27 Oct 2025 12:41:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kvhJ+CqQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBDDE10E0D4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 12:41:37 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59R8MYf6783388
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 12:41:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/rsr7uUBm8i8kH7yFAmBlcni
 G9FofbwGslfcQG/PTJ4=; b=kvhJ+CqQOQkjPo2cVAGfDsuL4HWLYOBffmy/ZTgH
 Popr2gHEwj4bIx+0dYTh3nhDAn17krh++oEtWs8VQsk9oYQ2HNgJtgRdwd5j1Sgx
 6qJmwJynIz4z4Xj9dkazjaJmK1pEwMKfD3d2KxAippn78mA18EW+ZNyB+koL0Tg6
 WwHLnn0zwUpBaltFe5uENtOWBoYPVsBZp/Laf/+v1N+DunkUPbsJpgY3YJWb3zlE
 TFL0d/zeKdgvuNcruDqa8BbVIQmVFx7NP/Orb9h51nfAf1jj3GUFuSSpLoxD9Jo9
 8SDcaCpND7fmYiOH4kaL01O2KLjz6qGqkJhvWXVkRWxf4g==
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0p4g4hr0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 12:41:36 +0000 (GMT)
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-430d082fc3dso153579965ab.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 05:41:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761568896; x=1762173696;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/rsr7uUBm8i8kH7yFAmBlcniG9FofbwGslfcQG/PTJ4=;
 b=WJYO5yZvKl9Y/bs+H6+yYeoNFdtsJiPkA89u47ZfrdiJ05iKxHKiuC1KydxOeVFGmN
 DK5Z9RfCKqpseDxld58xDASbMnYIaEt1NY4GTikOp7skPvmsmU3K7kKAEA+PBi+HC7W8
 tI5tYJqikwgGBR9H11HqWIyba4jBzE0cjT1YqQnIOMpPb7rG5z5M1idldfJVoSBv48EJ
 Fjl1yeikRAtXFZglP2HJ1JYReK3XmWhhq7YOf81IIKc+KYXZJUBZUIV05MzQUiINM6qu
 wOCSJR29hR2w0izB4RZfkY38iWj6ZlB7CT7dHiuOqfTws+N6OK8vtDk9obvdWhQQ2SRf
 zvxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXvsLtsLs2ZEWJguzd06lHZ7eudOKb6ZdC3swWZWjBrhVT0TgOgYWISgh9/qtPn1YtKx1/WjStzps=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzroOw9qNk/CyEiyBviWQz2mFdJ74SQ5+VozEmxLRG5GO8Ao92J
 wd5se3xQ9No3KEaUj6nvDnTl1htvNS1lMvMxmrEvs8HxLyiSCMFjzx+VJsD8tKglFBwXYc3jiKu
 4Az/7A4J1opUmSiYxT9C0+bG5EARZTrjES9T9JYr8ZjJjuGUT1rYEGhDv/TXre1IAhQk71E0=
X-Gm-Gg: ASbGnctBcBdL5m1LuZgMW0mHhBvH4IRvzfl9K4s70bC3a5ZgvP31e9FNUFXhJGZyvWA
 lxMjMUiUc7ia1hAXixCQyb5IhgSQUgoHt97FLGy3MhUJFmLbAv/hWIvMhWR96PEqAAQZeeV5oC7
 KQ7VKqz82GAoea1eNLmT7uoOJ6V+X1infcCGRaA5UkSTiEgamD153Vef2eV8/S86nfaiz+M8bky
 bTLqO8aXop75zXYTUMNaepE3TtCRPM14A5Q095RlNkKZWCKgxLDxMl8dryVCko8jiwbho+Nowo6
 0mQOc12xlAKp6+LXtDlErgKfth9W6lNhKs7cdwWdHNqzUbQy0dzj67TUSGeGcSih8BZ7N/ldDyl
 jeGgbwdjvehsEWURoZ9ZdGSdCRJILPxwLAJfqNWVWbnLN1E2eXoTTx+u9kwFY01Sfpj6/kBF4TS
 vocqsAiZ04YXnQ
X-Received: by 2002:a05:622a:5a98:b0:4ec:f3ba:ceda with SMTP id
 d75a77b69052e-4ecf3bb1e3fmr44759801cf.65.1761568146675; 
 Mon, 27 Oct 2025 05:29:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbAPmmSvzR7IiPpq3HlUcctfPxA/tqwPBS9g1DPUfBmIKxr6HJf+bYxHzHjkN1JS0U1LBubg==
X-Received: by 2002:a05:622a:5a98:b0:4ec:f3ba:ceda with SMTP id
 d75a77b69052e-4ecf3bb1e3fmr44758051cf.65.1761568144757; 
 Mon, 27 Oct 2025 05:29:04 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-378ee0a56ccsm19486411fa.22.2025.10.27.05.29.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 05:29:02 -0700 (PDT)
Date: Mon, 27 Oct 2025 14:29:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
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
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/7] soc: qcom: ubwc: Add configuration Glymur platform
Message-ID: <7dxq62ltoeerb4g2fgchb2hd7eomvlexfgyvamxsuuirblavtn@4bg3dy2bukdq>
References: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
 <20251014-glymur-display-v2-7-ff935e2f88c5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014-glymur-display-v2-7-ff935e2f88c5@linaro.org>
X-Proofpoint-GUID: Wr7PkqcYz94--A-EsMvIlw5f9UWop_ko
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDExNyBTYWx0ZWRfXyYqlAvI3NBTx
 yyJ2hlB/asebJHZkPrPyZrZ7xFFhfWvIIDQkaymkFe/hvM1+ipxT2dlSZCHYL0IOB0QQumq0c0J
 vgWzEQk+/7lhb/+SzYBGQQ86vf15okvRAwJzSz05kaaudGs3aiME68eNabZbO9tEjk/hzSz8LFH
 O3uilXuIS3IFzkOdBtlgOGBDsNfXWVIU5Vh+SI92BAenRacFbp6el0lEhV4mj7KEmwbyD2LJpEh
 7ZMlnlT6k2g70nwQIlBube+tOJosPu1aED9lLBNcECu6X5IjsJrvkMIcBMH917NSi9vA6q4H/4k
 edttJcDfXVunJvcb87STTZJvH3JmJqtcmn56XhjepymCY+n8fo3CBbme+EMm3B3yuQsWPdIFr9X
 fAQqgrwgOyvt0ks/XQ0t/2fzLDw8aw==
X-Authority-Analysis: v=2.4 cv=L9YQguT8 c=1 sm=1 tr=0 ts=68ff6880 cx=c_pps
 a=knIvlqb+BQeIC/0qDTJ88A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8
 a=rYq5acLp8HI6pBODZ1gA:9 a=CjuIK1q_8ugA:10 a=8vIIu0IPYQVSORyX1RVL:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Wr7PkqcYz94--A-EsMvIlw5f9UWop_ko
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270117
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

On Tue, Oct 14, 2025 at 03:38:32PM +0300, Abel Vesa wrote:
> Describe the Universal Bandwidth Compression (UBWC) configuration
> for the new Glymur platform.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/soc/qcom/ubwc_config.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Bjorn, do you indent to pick up this patch on your own or would you ack
merging it through the drm/msm tree?

-- 
With best wishes
Dmitry
