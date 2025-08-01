Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF658B186D3
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 19:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D7A910E308;
	Fri,  1 Aug 2025 17:41:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LfM0ZBEY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C84F010E308
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 17:41:23 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571HfNFh017459
 for <dri-devel@lists.freedesktop.org>; Fri, 1 Aug 2025 17:41:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=TAjqsWG+09WgcEob8VLyeHOX
 BEVCAsO//HB0wzN0Dsg=; b=LfM0ZBEY5sfySZKfIylbPz+OU21VVVPRZEKyqQlf
 c23LIfgNs2B3XFaRQybRDSFl3TDy9hceOqdA93nToXnbyL7gu1C+TIoXcnAZleLD
 iNJiQNnywFXMCuUOHGolIA/PYQPzHwp9hnWOJagCQtqCvoHXYf0Y7YGlMJsC200F
 bK7HB1bzVP8W1G6EcoS2S4vOuZirCLFT7pxbra2GauWaE8EScPhbUCV4wqWLGPpU
 kN0/EYcsp0KQT4cIcLwJtKFjKmgwpSMM0rBzw41pkPImjdhrXI2fyZVrCtwF+Ggq
 nMt8GWPs8/J6ZVGHI/LSO7krYgbJSLVVTF2bBnEkVDMYwA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbmch3b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 17:41:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4aedd0b5af9so28061651cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 10:41:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754070065; x=1754674865;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TAjqsWG+09WgcEob8VLyeHOXBEVCAsO//HB0wzN0Dsg=;
 b=A4t+5OHLmGbfvviNT8yAbR2/9Hxtm2sLznE4FWq2fum/wm3+L72fSXCbyamTYw+2yJ
 OTYvVQaa3Trr2NxUe+QbXQRM+wEusfTIfpaQiFIkuqtPHAIU0CY14grS44crwcEy4bwN
 wjCul76klZWDyAtpTNkE6Jkgp9IbSCIbTYDP1IW15lrB0rnWYPi8KjO6Ue21a27E1MfQ
 bDql+s74pK6RMklSwimPR3E6YZxU7aa5lDLnttMrfyQAnZYn8aHEXe4o6MbYb3g283Lc
 Gh3WdeTL5vi2NEb/2eiOq9UYDxOsDL4GopOjk0aHrSzgtwxjSPQ8w1IcHgvlqFNpxPDO
 oKXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVJdZsFC//1CRKqsfgIARcl8Mr/nUilBYP4QJYiDk02yBH/UBbXz9gQAhoIUfDhZPHrPgrpyvB/Xs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHi7r7BuKtnW7ENyYvNpixNvEmvnb3BJkvrl7OPK/OIulIjf2Z
 B0DReCOsKUU9FPL16eEY+69Vrc+joSy6z1V+sdtjYYNXogLql1ZQWyPpAYikWMmfGnog2EmmfeP
 1mJY4nu5SzjIYUR4zRyxJ3p8tJKGeLxAMY4BPd+KWMy9M/+EfWssZfBG9TS8DAjPG+gZbw6Y=
X-Gm-Gg: ASbGncuBt00lggzqAf9Qy/eSPGX1A09qncCxnJ0RSEc9nLzRYabpnhJkLXAYsyBpt7G
 ZvXW1MIv3pJKLUWZn2nM1tJS829ErJEImE7Z3u2sVgfLo9nMf3dyFajiBLMDS4Lkp7w70s5xRJJ
 N42qh2qpkcVjZC4K7qeSUJqMVAP+xL1x5LvDfghgY5S75vCyoFXf3TBTMSLcrTP41fp9K/wO2oO
 WxDXtFHhFKk+x0VdRvtKO6Fp+N6Z8tbfTzyXstMte8+SJ2Ho46O8wsaHz/pToi9eMsx/AZsTsd7
 z2danJXkCMyVr0i2vUxx0S+objMxHCAxXJ1y73lTGs8FMQLfFTPA2g2KJ1lN4yegMeT5cO79I4k
 xYN+FkUIPEhyR10YQEI0SuboPEeCSRk3RLj6GLPJtzOQ1eVBbFJMp
X-Received: by 2002:a05:622a:4cf:b0:4a9:c2e1:89c4 with SMTP id
 d75a77b69052e-4af10d11dbemr9816741cf.47.1754070064571; 
 Fri, 01 Aug 2025 10:41:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7Ab4B6jqYhlQ+NXunglR7CtdqDQ1rwdXyehj8v1lg2vJ1+icL9dUzr7rCyfChKa3r6LzegQ==
X-Received: by 2002:a05:622a:4cf:b0:4a9:c2e1:89c4 with SMTP id
 d75a77b69052e-4af10d11dbemr9816281cf.47.1754070063932; 
 Fri, 01 Aug 2025 10:41:03 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-332382a6f74sm6639461fa.20.2025.08.01.10.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 10:41:03 -0700 (PDT)
Date: Fri, 1 Aug 2025 20:41:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, lumag@kernel.org, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
Subject: Re: [PATCH] drm/msm: update the high bitfield of certain DSI registers
Message-ID: <e6bg2nin5zqoemjxevqhzhshgeit24t6wxb3pnfazrk6hkxajq@773bvnmqs5id>
References: <20250730123938.1038640-1-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730123938.1038640-1-quic_amakhija@quicinc.com>
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=688cfc42 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=CjfMZ6mt8HIBDwBlgy4A:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEzOCBTYWx0ZWRfX/nUYjXy94w03
 KEM1pSXqZeIXTGBMBvDD2us9fUwY5FSdQNdxM83QjA8gvZrUG7uV0g04VA8nVwKIctEoQlYo9UF
 2kC8OOtVNJEYtvjHpWPqmvK8s2oGvRZKgW7Rw/aMAQ8tYMdIuDoIRgvjUsc++9Zwr5tYegjSu/I
 xF0YiFJJ4XY5I12xyg5WvlSQ9Ea7UAtBY2akJrrPyhxbBeP6o8wN5ks/dVHf8dE7T06Lp+m7ePJ
 hqSdzuubbcxoV8dErwlsO04SKsmSW4UsevIku5XfNYl3byqCvcnTMclp9ZrfoFr8ZxLJvl442hG
 PVZkrXIqv2G425fcgUGH57TOOeFUgwbsPcnzNjx0SYt+L3+ZHsl44fdM2fveNoCTbFOWkx8HlBb
 +uUcM2vtfiexXMoxiDK+xKa68Cm1+Sj/Mh7YlCiyAoz1y0F9ZODGwaTWSt649uZ9AlZ+pq/a
X-Proofpoint-ORIG-GUID: KsJKRBh1jsNVnQw25eCVW0AKpQ3Nz0al
X-Proofpoint-GUID: KsJKRBh1jsNVnQw25eCVW0AKpQ3Nz0al
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_06,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=767 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010138
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

On Wed, Jul 30, 2025 at 06:09:38PM +0530, Ayushi Makhija wrote:
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

Fixes: 4f52f5e63b62 ("drm/msm: import XML display registers database")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  drivers/gpu/drm/msm/registers/display/dsi.xml | 28 +++++++++----------
>  1 file changed, 14 insertions(+), 14 deletions(-)

-- 
With best wishes
Dmitry
