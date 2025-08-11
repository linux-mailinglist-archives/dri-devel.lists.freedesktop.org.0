Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 376F6B2059F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 12:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9419A10E2AB;
	Mon, 11 Aug 2025 10:35:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dTqmBZqL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94CCA10E41A
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:35:56 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dt4f025283
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=8L9FpvsfDpsj4VZq/OufIKbL
 +DTyr83VxTwATCE/HEA=; b=dTqmBZqLmGIfBWZJKBveSUIWlAT5tG+uvmHYJqQe
 Bkvc8Br581Q9qZNHpVI6L9Xzl5tKPGW0vNlBiiK1/Q8MejUyXmoHXTD7BcAhG91W
 wjajFi+2gqeiC4JdNr6MA2gJWE7xpdkBQ1C42Rz3N3dh6OC1EyfT8KgLK14R71g7
 Gz0DpAHLmm+g50WogaaU5SXhSJmAnwTT/dQQhOpNt62ykFxRwzGG7x+/M021sWpx
 3Re7dqn9dtv5cgz/kazTxkJ6l+TJtnGaaM0dbAOtKr3Iy9vNw1n+wfeA1F5AUKwl
 oHyAatjE3pzm5TfKHwNbKtuz5KoLhxatdIEoYu1Bb8RQsg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxj441na-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:35:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b08b271095so116996991cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 03:35:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754908555; x=1755513355;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8L9FpvsfDpsj4VZq/OufIKbL+DTyr83VxTwATCE/HEA=;
 b=O7bdab47TJ+pw0CBgHL3jhv9SeOSgHEJPUdGicUBY1hp6F6CbNx1MCuIAn7rdSX+48
 qDh86o0/fsig1eGYhOImmrm0Gv9Mn0u2Evt27xOmUTKcVB7y7DX5x0aPu3eusyPdWXjr
 TvkxSRGR3jszTTGu3EMxn3OnZCJGPjcjzVEcN4UHlcs2Kx5Owv3aWBGCM4BWOZTSxs9H
 OQdnjn45leVitWyT9MlQmNwMm8qp/Ezlu7L7wU2XSqR216F/+Ae4Jb4moJABwzIt9YCp
 /MOZlSi+aK7X/NGQokllKcsH0XuQFcVP3qXz7y/qxX6ZLGCWreFSYOuRo34TiMds4xkZ
 9QPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMuErfCxsNLTxTXtOshUJpezUfCksqLzbY6Vi087WmdRxZEhAJ+pHwQ5QCdszMLKbf3QsFt2xTrvA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeMR0uBLBcXkbZrNeTjvpB5F51KRed38PNre8WLSTHAXVTOZHp
 +ysa2CEoqgST+PS1sNxdXpKy2SQOQ/ADf1D1t0OfinUCWtkub4PBwfDMZIXnUSmGYe30BFtZk57
 GUgf7cF1QXHqbzeCV1GiqNl7y+T+GAOF+wEMWfctU4kX+Va63B+jRDd8QM8bjjuowYEFOxDA=
X-Gm-Gg: ASbGncsCB2nHk0+WZ7kHtSra+RDJyijRxvDyp1VytfsP7Pu+VGhVtNv38pmZWfO5HVq
 Gf4jz8W3kfogxAmWZU8Jv7bnP68WuCjPg9vRYpoggEuBmH5wU3hyAYuo2Qwsjf7D/IKeRdtB9PM
 uNQmdgcFD+EQvhhzUzmbuc7JP9KQ6LsuG7iMkTlTdvQogrxqGPP0egMHoFo2xq5fjWq3djv3dgP
 i+9x1kqkh3YjqnjOK6ydOWidFNj6k9vtf3GP1tSxSxz9T8dKgfT8/M1q/v/xVDxmQdog51Id/5c
 2vbJ61xW4QDqis3Z/EZQsxQF59WwKTEtMKLiox0KMkvdTvwhGf1UR3BZ4bjC7/RBED1qSG2Q0gb
 MMfJtHiAbj5rdFnDcdgLnhg0cEk36JcujKG6d4uNhu1GMTRZhgvTU
X-Received: by 2002:a05:622a:4083:b0:4b0:bf67:3517 with SMTP id
 d75a77b69052e-4b0bf673f18mr121726901cf.50.1754908554687; 
 Mon, 11 Aug 2025 03:35:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGSGkWKky4fViZdB9BU2n85HeQbATJIlEfA7+ozin7bCsrRVF6S+s11E+zYmbw4+o2YtN05g==
X-Received: by 2002:a05:622a:4083:b0:4b0:bf67:3517 with SMTP id
 d75a77b69052e-4b0bf673f18mr121726581cf.50.1754908554193; 
 Mon, 11 Aug 2025 03:35:54 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c99083sm4268055e87.94.2025.08.11.03.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 03:35:53 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:35:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] drm/msm/hdmi_phy_8996: convert from round_rate()
 to determine_rate()
Message-ID: <snpidtke4k7cekzsbhs7vytr7gaoc2zmxadixgmedo5gtne7tn@laybummcgllc>
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-6-0fd1f7979c83@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-6-0fd1f7979c83@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNyBTYWx0ZWRfXyqnTMnftJjma
 I/1dNtLhzGfCDFib2TIJ+6W2Lxez73JqEfow6AE2fdEFDVW7ki6Mt1TUh5vqBIbaNDG4Tl/chZQ
 e3o1hCxltq5g6wRgID9BvbJsusF9IYfTKGG3s76oIPVe2su0kdSes/Qmhm29eSGAK8KmeJ7Sr4q
 zC1FSrB1HTnZ0b1TM1DZHLyx1eEWgtKoCOej3JXGV04TP8NLbIunRwIr2pnhuO7HGp2c0L7KIjz
 nsgIOedXzxkgEnTjk76sy12ZNulnSPI87XhaxDJuSJisU9nMgjVflnpB5a5kdQB52O1uZVmT+W2
 Edx/dISel/gn+bK7l3IBsYvHasIYLyyr7JVCIRBSc64ywZulc3HZ/hy63t8K7cj4ulI9Lz1YByZ
 pMKb40yH
X-Authority-Analysis: v=2.4 cv=fvDcZE4f c=1 sm=1 tr=0 ts=6899c78c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=oBXrOfH6mq4iYN50PBoA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: KnMhGOITNKRFzsHZIJYUVcKO3EcupJwY
X-Proofpoint-GUID: KnMhGOITNKRFzsHZIJYUVcKO3EcupJwY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090027
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

On Sun, Aug 10, 2025 at 06:57:30PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
