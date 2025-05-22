Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6333AC0C1F
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 15:01:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7FA110EC2C;
	Thu, 22 May 2025 13:01:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pk53UXSb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC2A10EC2C
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 13:01:51 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7RbuM006603
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 13:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=1Va7H0zGw1n7ohA8VR61LEvC
 mrMBFOONi8NjfKB0iMM=; b=pk53UXSbEKVsByP6VaiTejrCCylvfjcm/S7v3MvD
 IjTxJu66CMyQgoZ9QATWgfsWiOx1G6FcI9GjQlw2vgLpKhZhvk8WLquB5bgEls9U
 lqsGKsLWxwx9SLOnDxVBPlXnJ4+kofQv0kLFHZfvwUFhLGBKqE6JdlCSlMtFG7pA
 oixcbMM+M8CIwaV9WPfS1unOSm7XXaJYnAV9Ir9E0AFlAka3l2H/c8VISYsDGiAe
 dJhtxqwL6uTSwEL/mc6sRfSbTNxYv7j+0Ulb7C/nARo7UQnZSvZEo7YDXkLOdTkb
 eyVW83/nuJU/cGu2tVCCGnnjC1O6m3VPVvL7Zi3WUeqwvA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0pg0s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 13:01:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-231d0c0fdedso48520155ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 06:01:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747918909; x=1748523709;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Va7H0zGw1n7ohA8VR61LEvCmrMBFOONi8NjfKB0iMM=;
 b=Po8As9txtOXC4nHZl46RDRbCivP9Pc39sxuCbYHWld0SQj0z09kJK2Yzcq5e4SBRxx
 grct7yk2Py8ujCDb9SnPuw5M/EZvSjfEwml/+JJPW4GKi8+L6edf2k2TaInykc2CbQL3
 58NI0Q6v4pOxDiJN1rJL6oF3jeoIR+2DGgEYRLBk93AvV3jqUfJB44AfcfPtMqFDHxdr
 eQn9LOjyaKm7NkzB6DXENP2Q4NjF427VVisIW1apCz6lhH0YJwgmWSaIdRsU56RF0jg4
 5tkxKZR3zPeQ2YuyUXfMXHwe3MS0aEaR6XBEhnK8X3JOcUoHaJfqElOEGRYs9tJxAoRR
 +zcA==
X-Gm-Message-State: AOJu0Yxa5blxOKd2mqor1yyZKUfk3lmOLL46Vwl8pTOEPEgHDfJtLU3L
 hQirVMObEq8pMq7+/A2HGaDLw0bEKE1ajvkUXQlJrzD35QSdo0ZS5XZ983nxpQWIP1TG+p5vghD
 DLGArAqnRhspBfZ/9URCt6pUjm16P0KByLhuZMSwyOhUSq3waOXw9KKeW8m+Q61XEur6rj38=
X-Gm-Gg: ASbGncsxHJI2E39AkPlE6Ci3PD/kKYRDuRCk7nhj/CDB/U76Lz6eEj9nibbxPF2NW5T
 DDyNs2loI8tKDknjwiAfeGpWH4TCrsg4daZMaKF5r/TI2gc99B2Vlprey9aNWZe407r2iSn5R8Q
 Arq1WUGWVdsla998WKPHnReJT3rdxhByi3PHPVxuQolPePSkyzWhsEPuOa9WIuRKRWjixkrEhjo
 0CCmOhM6aD9K3tQ38w8BSQwFvFt7vqoQKijYhe4grXZ1fpjPhU2uxttJc0ThlbawS62WqQ3QMEn
 4WXooouaVAk36puj/4Ru5utuh8/+wtVdfZQiEmmRo9bXjHY9jxhytasOkv2HwMV/wMbvyPyTRVY
 =
X-Received: by 2002:a17:902:f78c:b0:220:d909:1734 with SMTP id
 d9443c01a7336-231de35fd54mr352957505ad.14.1747918908948; 
 Thu, 22 May 2025 06:01:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWcapviWpy6Ic0ZsxpD9ogTQFH4oSPBeizbZffsn9KaKLGOkePsZXqw/dIZjtdtfudXhxsKQ==
X-Received: by 2002:a17:902:f78c:b0:220:d909:1734 with SMTP id
 d9443c01a7336-231de35fd54mr352957035ad.14.1747918908510; 
 Thu, 22 May 2025 06:01:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328084ca4fasm32575851fa.39.2025.05.22.06.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 06:01:47 -0700 (PDT)
Date: Thu, 22 May 2025 16:01:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH] drm/panel: abstract of_panel_find()
Message-ID: <bomzckpaxqthpwx4wqrxiywkz5qnoqoob4jfiguqag2gwwakfb@c3ek6rvkwkdm>
References: <20250522100036.2529624-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522100036.2529624-1-jani.nikula@intel.com>
X-Proofpoint-GUID: 524LESCI5-Jj7Wf5nXOiOaqkZGscHWU3
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=682f203d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=nbWh89gfPRKmCwx2w1AA:9
 a=CjuIK1q_8ugA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 524LESCI5-Jj7Wf5nXOiOaqkZGscHWU3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDEzMiBTYWx0ZWRfX0goF56Y3PFpW
 ilIgkgBXgcjXx2x+V3wFJuigt1b6XzzLhuly5d/ldKeB4Wlj7dReOrQ8beWy3sg44zSLcOdd6Xq
 WsNKHYVWTBsvcHSoRa4oKkIxahDSB0qaIueEJRdOCRDVq4witfDQX/A+SEeNS8QG8b0nmHpRKqk
 wfofiRWQ0OqmGXAc68OO9DiT7iN1Vju5MnELZTeV7cHKh829+7FW+vU68c2HgtnP38HYyXmTrYU
 w7DZkQ4e2sv9A4Ejh0rybJbvPbi1+lFjlJm6ap9qKAauxxrjlnF86WIWFVFrFyzX9BR7drI5C/a
 oXpOiF0XTi9sFta7kfRmYgo4+oOlML0Mc8guilNMj7RswhKW/FaiCGNiIJsMaSzwAxaVagyE3aB
 9RQsIbR+1C62LBXx29WRyU81yyYzLxmCvA2GtJAHgJ8Npbqu7kZG2y/JnDPspOYNTiEvAO0y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=928 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220132
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

On Thu, May 22, 2025 at 01:00:36PM +0300, Jani Nikula wrote:
> Add a helper to wrap OF-specific calls in drm_panel_add_follower() in
> preparation for adding an ACPI equivalent in the future. No functional
> changes.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_panel.c | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
