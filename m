Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2678EA9C32D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 11:20:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1193010E04E;
	Fri, 25 Apr 2025 09:20:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aF6ClIpQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE95210E04E
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 09:20:20 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T755008601
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 09:20:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=rMDIsHdsOYkyViUAsU0t/ePU
 SWOO0YxJOUX3cKyNhU4=; b=aF6ClIpQAYUrCzDnHYfaXzQmwyNulXHEBtEuHA7R
 oLdXml4MEUGZlFN1bhGbAzin8xp9PNjxOPvY8fm55P73h6zozQXKjFnu4d1bWK87
 p78nCwPMoecpSxRcDOvQ3qhzklOP6kTXISooEg9LjB3ABMJPHIAOiS7FOdKWqB4h
 4/wbqslrMQzCgnNDdUOgHQvIwZJBbPdBM4nBFkfSFILproO7iO6dVzLE230AKuqv
 NrmDDfIYzWprXypPDQwo/rVqsxldkAUsGMnoJWX5mx5m2qu2kY8nGW3PER0ss5d3
 Wo53ym5H/ep/vbCkOevCqO8F/JK+l+J4GZcF/4S1QK7WTg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy8e18-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 09:20:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c793d573b2so403271285a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 02:20:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745572819; x=1746177619;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rMDIsHdsOYkyViUAsU0t/ePUSWOO0YxJOUX3cKyNhU4=;
 b=NhQdUVcA0YhfIcbbFLHUdPubkMacswY5n5WQlylo7pBu11NjT2hMYR16NAT0j4SaXZ
 8hgyZeJ/P6NV9fMBqRsrZcfhlbmsUb2M9XYs2soNkWz5uotvm8AzmXVr1r2O8he0reB4
 ITdZRz2MXvr3CHenY5FERmrg/rey92D8ptmbYv7QJAzeLTmPC29mO7FKzLBj7oqitcGe
 LZaApYvn0z/FXddPN8QGn01vRxIfX7/McWIdkZMx3cUPNtqXrCL6KbnqUZ7PtbgUIB2W
 hVfWI+pldUDEz+cbqp+NuOyMTFTqLAUZ5wVCNWL+zVuMLO7EJPxAdcKWjMsNXArGq+Yy
 1wfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxdBO65ZnzlGp4E7lTGZXeAMcO1ZEExkGyhBjIC4gYKiurxbDe//zDQfIl0ARWgpoE5HKuK/v4V/g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxszE3TD7an1KCkq9x2ehSkEb/W1lm04TwWKLR3Xitv4TRUUT9H
 itU0dRrY+clsb4i8X5STOTTERPXjV5R2jJWrW+1zVLI4ONLZHd0AVbXi/W5uTeeENXOhJaAes/L
 hTJGU/WbvoSHLvPn7vxZP22UqROC87p1nkyv6YiZq3HAM4MApHYG+k1j0+G/790v7M88=
X-Gm-Gg: ASbGncvJWIKWzh4NtZra5sCN9Sdk621gP9R1uiQqqbbb0m6raqpT+5VQz+2DJdTygtQ
 J/uXV37yQbkRGXHTHQJWKgp+7CK8msdB9hbYu+tQ+CPYXBe2Y+JopD0zogpPzbgNPRLzIth5TpU
 TFX+IoZbmJjNyvu0zDIXrG3UIOpOEVv0stKRVEt6cSDcQGOHqe7w487qVm9M2OuBtg7+MwstHpk
 LfFCAnfR5CGdx92S2L0WG6PQyYngGzcgS1IipKlFxfji9xVKTbc1fiEfFK8GPyuQhycKDE2l6lB
 ejdQ8hOumyvcwEHImMLW7uY9qcXvEJuj1oBbBABoETLCiPYYDZzXfAp9GPFlxHAMuVNPWvhYnaE
 =
X-Received: by 2002:a05:620a:2801:b0:7c5:3b52:517d with SMTP id
 af79cd13be357-7c9607aa0d9mr312340585a.54.1745572818820; 
 Fri, 25 Apr 2025 02:20:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfBCKqtUoVTfxHiMTz/laWIXb+vyHohQFKZ/KaREmisUEpTMfrdz3hYOCR3l6/Jaa+ylyp/A==
X-Received: by 2002:a05:620a:2801:b0:7c5:3b52:517d with SMTP id
 af79cd13be357-7c9607aa0d9mr312336985a.54.1745572818522; 
 Fri, 25 Apr 2025 02:20:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-317d1b96d45sm6445631fa.94.2025.04.25.02.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 02:20:17 -0700 (PDT)
Date: Fri, 25 Apr 2025 12:20:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com, abel.vesa@linaro.org, johan@kernel.org
Subject: Re: [PATCH v3 2/4] drm/msm/dp: Account for LTTPRs capabilities
Message-ID: <jdeuodvsnlezbnxoucihd75rwlrigskvessdt3n3ufuppw7qov@ujjgimndcdkp>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <20250417021349.148911-3-alex.vinarskis@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417021349.148911-3-alex.vinarskis@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2NyBTYWx0ZWRfX+U6pzSejIC5b
 +oM94XsBLjYGNWuP3Co+XWy6ePWjsoaPRCHVm4wim31Ocd186NqfUPG3Yo/CAcXw15j+TjmP6Ar
 pfjcNh3zJR+z2SoiIeEej4lhGMPnmmkObg5gVGbs+fVg8Kj2fi4n/HCUuTZ4qG9lNZ8aUV1oAAh
 3zpI5suOtOSx7s5+cWQBX356gPJdIN1WDQ0aWvjL2os7V6bIhNf/Kf/xCTDz4NDxgbBFHq3YkSu
 7uQmnjE3ZnEZ9NiB+CWlawGnYA7b7PR8H1hRQcrR2HqHdo80anw1za+ZmkqYRNUyHC9uzamCn/A
 eut+DHnI01T0STyo5KObk0KDLTGaAeLxrF+CVtm54b6Yd/Ii6KesQLIl+ua+tDqlWSE8OsOj54D
 tLH559lhgf1BBhLZcBe8I/KoGzDa7e5oRlbbSz6Djh5+ZlqhENzLjQAffSc9CiafbeVfgDm+
X-Proofpoint-GUID: liFTEDRD3UaxmdOST7x0c-fl30V5c_zP
X-Proofpoint-ORIG-GUID: liFTEDRD3UaxmdOST7x0c-fl30V5c_zP
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680b53d3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=QaToclHOt1NPS2V0eqsA:9
 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=844 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250067
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

On Thu, Apr 17, 2025 at 04:10:33AM +0200, Aleksandrs Vinarskis wrote:
> Take into account LTTPR capabilities when selecting maximum allowed
> link rate, number of data lines.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c |  5 ++---
>  drivers/gpu/drm/msm/dp/dp_link.h    |  3 +++
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 12 +++++++++++-
>  3 files changed, 16 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
