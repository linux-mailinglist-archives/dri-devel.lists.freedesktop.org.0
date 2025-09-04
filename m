Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FC3B449DA
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 00:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC4CD10E283;
	Thu,  4 Sep 2025 22:41:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="koMLMNkf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E227610E283
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 22:40:59 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584INSas007609
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Sep 2025 22:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=q0/2X6fSQzSEu1azufYXnQrj
 q/1XlWAIU3a8iRB/9ls=; b=koMLMNkfOziyamTxK0o+H/EhND0hf2NsWBbSPi8E
 0x/H7UHcx8ajpGl/UjBLanN8J0QK2PvVcuGvYv/JdG2qhZo3yhSduKVSGgJGLPV5
 v9n78CVrQibOQK9K5alkLDKMyUhCeDQk0SYF4TMzS9UH3dvkuB8I8UtclP2/bOe2
 syT1v2h102y/R9ot69gSVxH0PCS6oZHmIPoit3P/orESka8BJ8paAtTDRQxbKTfU
 YZGhCSAlPqVFI8Wlxm6LENHQWa3qt761pTzqFXGmRwZZzybRjYu/HPZGharYXcSR
 sVvA3Z6m+xnVJ/JbzlCXpNGPZWo0HUwiqReao/KJZTyLUg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura910ar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 22:40:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b5e5f80723so12426351cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 15:40:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757025658; x=1757630458;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q0/2X6fSQzSEu1azufYXnQrjq/1XlWAIU3a8iRB/9ls=;
 b=CDcr373zVcz8flHbBC2DoWXrjqjDEC3x1O1bONWCIcbjgZTNzxPZ0m0jkLcA30nkDq
 N4CWP9k6TFCbhyZGabSShAmnMVEJxXUgpSZAhlHoS1Y4gnT0RI4YPCJTiv6QSmHtHjWG
 T5gkjyyzcOIJo/n3lS9P1m4kSYNt/alABUYYDyte4jWftyBa9X7NVFtDCOUL+k3vUdbz
 MALAf0+ITgf+PBav0xZN/tUR1xfNgj3N7FAD7EeZuLR98u7luy3pHXXLhuTIQGNj/1A2
 PirUXhcXPKwCvaXEYKiCx+6ZsxXomlR24WkAN0V3OWlW89TMHLKUuixyDu2nq/32z6gH
 iSgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCO22MhVFMaxQ4a+G7lruuZl3ZGgfOaTm8hAyYxOHtKS8Ya88FA8XXf0XAsmbmhLG9lac8yjFKQXw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMg3a2A2dDhJIFY71Mv37rztzsz77dYwBV2prI2DoJ4evgyYMI
 MVjQmzEle+2iTgWNpFdd7aQHO6rdsdcjRmId8zREc9Fs09RwOdzd4C/NBkH8hRj/pnPc7NgTRfU
 BNlSp4adWu0jH4L8R4K8dcsgyOviKxWTpyAXnTqdAZEXZvTekdzcZ0uvlGxDEh33F4mKsUUw=
X-Gm-Gg: ASbGnctK5JKJXPMadV9lS/QsPOt4gYe54w0M6GD19jsnCprm60745Ep0iCd+nfgfF7O
 SOzv20MrH3IprLMu1wQCPoOWrt122/SB3xZ29SVIGB21VR34dcQGQIseLZjia37oZR4TGAmOlAK
 abHhtR/BSAVrtWj+DwOwzMgA+STVbSQfMfBDEL0+VSlct3JUeUBpk4sXLgr/2NnoavbZaoJwE7A
 WNZmmg8lImI+Szv7nWLG+o8jP32EdPCWMNpyjOwLG9OIV4J59PLxF3OtrhdLhH7sO4SYO/wDVZI
 kEqdyHhfKjJOPBB9b+V5JtrTMpU2NT/IDnkB6sjqx7DvpONR9svbvUr+/RyySiBYunl3LW+1yhM
 R0ymi8A3rT1kY1KHRhacX5tVXBJRO2C9h7Yp2lJ+JxB6PjToXwMFO
X-Received: by 2002:a05:622a:906:b0:4b1:22da:e4b2 with SMTP id
 d75a77b69052e-4b31d8a35f0mr262578531cf.32.1757025657969; 
 Thu, 04 Sep 2025 15:40:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9T5slv0159C4I+XtP+od5jkW+4lW4ZBPraMTm+7/Ds81Z7ystyCqgzxYFmEk0u9e8h7INyQ==
X-Received: by 2002:a05:622a:906:b0:4b1:22da:e4b2 with SMTP id
 d75a77b69052e-4b31d8a35f0mr262578271cf.32.1757025657345; 
 Thu, 04 Sep 2025 15:40:57 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ad5027esm1452301e87.149.2025.09.04.15.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 15:40:56 -0700 (PDT)
Date: Fri, 5 Sep 2025 01:40:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: ite-it6263: Support HDMI vendor specific
 infoframe
Message-ID: <6i7eyxajmelu3x4ckvwifmizln6jzybt6ykpwlefna3k3noop4@e5zdvzor24fn>
References: <20250904-it6263-vendor-specific-infoframe-v1-1-6efe6545b634@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904-it6263-vendor-specific-infoframe-v1-1-6efe6545b634@nxp.com>
X-Proofpoint-ORIG-GUID: iY6eCCCJDUmEFK37qU5qR9shirg4MEKx
X-Proofpoint-GUID: iY6eCCCJDUmEFK37qU5qR9shirg4MEKx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX/7gR62f5lZW+
 hVC4eg7ahZuCoEWOrErGrwnSknFC1czmywIcuuZNbyshhgUodt2ylgKtTSESOlvc37TaPGamWnv
 qZVRDuFKBT/qOH7aa0R7AtqPhEkLTjr8XBwWySkHS/zO2dkSklgOY2v4ihmQBrwj/jEipoaqtVt
 OEJs6B2duchF3SaH3YrIKlxEV9PUgr/CsA+Xje75qxgkeqone1JQCn6gjXYkdAUl9qhU6dRx5mx
 MguImuQusCmmBz/rE4fUsgRhBCJoinigQFOwbmB38OyOVWIvzJsUJYPvZuFFzzxecn154DiXYkR
 2AREBDUGXxvHguTdZYHtoVyZq0PVUHq2vNnrEb2dxfRyZ9wFwn15V1FW7RgdOm/6xS2iILucdNk
 NQ8cOuLk
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68ba157a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=8AirrxEcAAAA:8 a=ogkFPinuHE6vtdJhAukA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020
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

On Thu, Sep 04, 2025 at 05:10:02PM +0800, Liu Ying wrote:
> IT6263 supports HDMI vendor specific infoframe.  The infoframe header
> and payload are configurable via NULL packet registers.  The infoframe
> is enabled and disabled via PKT_NULL_CTRL register.  Add the HDMI vendor
> specific infoframe support.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  drivers/gpu/drm/bridge/ite-it6263.c | 72 ++++++++++++++++++++++++++-----------
>  1 file changed, 52 insertions(+), 20 deletions(-)
> 
> +	case HDMI_INFOFRAME_TYPE_VENDOR:
> +		const char zero_bulk[HDMI_PKT_HB_PB_CHUNK_SIZE] = { };
> +
> +		/* clear NULL packet registers due to undefined default value */
> +		regmap_bulk_write(regmap, HDMI_REG_PKT_HB(0),
> +				  zero_bulk, sizeof(zero_bulk));

What if you move this to the probe function? Then there will be no need
to write those registers each time the infoframe is being written.

LGTM otherwise.

> +
> +		/* write header and payload */
> +		regmap_bulk_write(regmap, HDMI_REG_PKT_HB(0), buffer, len);
> +
> +		regmap_write(regmap, HDMI_REG_PKT_NULL_CTRL,
> +			     ENABLE_PKT | REPEAT_PKT);
> +		break;

-- 
With best wishes
Dmitry
