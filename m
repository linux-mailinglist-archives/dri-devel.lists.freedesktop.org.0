Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4EABB5BA4
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 03:17:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C151E10E86B;
	Fri,  3 Oct 2025 01:17:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="adZtzzby";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F033D10E869
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 01:17:09 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5930RoIY028774
 for <dri-devel@lists.freedesktop.org>; Fri, 3 Oct 2025 01:17:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=NszYJNXUum61Ftvgh9BoHIbg
 Xs/NhaLC23ASv+k9yTY=; b=adZtzzbyNJG4Qibg2lpRct8Xd0WYI9m+fpgiIP8j
 RUWhvSXufHfFkNhTt/Qd4g6Y8vxXkw43zAYs/r0yTk0bpYNl7JdldY73vSVYXhRa
 EnaS+KHtE5qBhBiMhyp0Bk/sto0n/QH/NS3Wk9wXxMzB9YugqdwOAXgkkO3K9qyV
 NeJEycjjHKmqwWbxKdLJcYd3Y/WvhzxU7UK7Yci9U6f/MHThFUhY9d0TPaQTumCt
 GCLTj7XkejVhZjM0N78nBT91y4S7v3S5RTSEjGvKzxckNfErhPQMmzSC8H6xwU3Z
 eYIHRp/S6Z8B6iHyLgdkY09AQrNaM/d5OqeRbg2etQ5xew==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59n9tu0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Oct 2025 01:17:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4e5739a388bso23257321cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 18:17:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759454228; x=1760059028;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NszYJNXUum61Ftvgh9BoHIbgXs/NhaLC23ASv+k9yTY=;
 b=CDph8+vdoF63e/SXtOscC3Lc5zt0RP7nPw2M151c3Y6gwt/VCC3G08M50NPfu28L11
 NcNfok/Ptd5sV8T7CxFYoJKBEnmi+0ECkQ1JaUkQi9jY+tL0WsJnThLJ/eQ9EfOb4q0k
 25qwlTvIc7lYhGqTatXt9ZJrrx7qOCDGegewpm91h5R/98ofGgymCns9KeSPwPRAqzGt
 kWWcqEALGNxQlIZR7rDVa3tEoi3L3NuBHlAtuVBjmDgTdiXOJph9pXqVBt80FKwMYJ0Z
 56mLhxcNQeVPxUvYkZEBH6jpOGbY736OXzWEt0QsHwJ3vhDFZQWIhjYvz/oQ8Av8abXd
 hnYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWooPBNgvF/t5RO4Q4YU/UC6VbE995A3hbeQTKjkZ7EMdl15UdHV75zHwf9xXzNTutFensxT7JUDJA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YweGrM8/vrYA1q6256NUaUXsH2oQxiEcTIzQCsC6KkGXW7IiaNg
 RtRae3i2+fMtf8x1tJqWyTNu1oO/70iNJdfKGd7tLZGbL8UD5PuxSBfZMZlugWlubHNtwS6TU7w
 54HnHci8s7gDabU5W91EzJ3x0j+7rP3EHxY5gGMGd93zPQmxl+ixUdQqjZ7JgMPgq27Y8zgs=
X-Gm-Gg: ASbGncuwzYdq1a8wlh/+dko5u2IHC8t9w3SWVW2z+Dr2Ofu2RJbPmb7P23Qc/pRccy2
 bpWhcJ+EvNvRnaf9E5P0c/psPk+DIij3xMeNJvzRqE3IlK3nIXEWDhK2DfQ7C1xH/ntTFMVhv32
 xICFJmZkhRWXFuJZWMSq0jwbB+AaZiRV/qVwe5u1g9jTbHbckebVISpbIUGBjdd6nG/BWQqXD27
 BniuOKx+Gu6ZU2MrsQgDA74hOrCco3TOeG5j3t0b8qG2kScTlrLhUicAFeAdqsIsH37W0A6a/kH
 tjVql2RiU0YNZtgWBMU1zZeqKw5VjPTyvninJgMQJro/A7aCUpCHzZDSqDU/F0ulrtmGc1yXBwG
 vJWLR83MyrMiOs0JklO5CH9nkiFVlQ5cgClpK2rmDfuqJ7bWpjSzxkoE2LA==
X-Received: by 2002:a05:622a:394:b0:4ce:dcd9:20ea with SMTP id
 d75a77b69052e-4e576b13f4fmr21738161cf.57.1759454228042; 
 Thu, 02 Oct 2025 18:17:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7wGlhN9Q1fx9OZHmwE/WJqZbiUdV2GSH/vjmHZyoClwDnnRtTJTDDldA0C+AO+Zy05bZYKw==
X-Received: by 2002:a05:622a:394:b0:4ce:dcd9:20ea with SMTP id
 d75a77b69052e-4e576b13f4fmr21737781cf.57.1759454227579; 
 Thu, 02 Oct 2025 18:17:07 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b0113f3ddsm1316191e87.52.2025.10.02.18.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Oct 2025 18:17:05 -0700 (PDT)
Date: Fri, 3 Oct 2025 04:17:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH] MAINTAINERS: Update Jessica Zhang's email address
Message-ID: <35jqgias5o4ruhkc72oacepcq4skfzpe4gyivg2pz7bnpy5luj@d5saa7y7rcus>
References: <20251002-quit-qcom-v1-1-0898a63ffddd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251002-quit-qcom-v1-1-0898a63ffddd@oss.qualcomm.com>
X-Proofpoint-GUID: OVTm_RWieb8V9llMyNQGm6TXImfb3-Sx
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68df2415 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=snQqrI5GwQTDGbkEZYgA:9
 a=CjuIK1q_8ugA:10 a=2MHBSq50hwYA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: OVTm_RWieb8V9llMyNQGm6TXImfb3-Sx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX2gNSlPvat1ms
 sKO5VM3raBQtXpbxyU1HCXJjvwR91P2x+6S8lP9bm/GMbN1EqXYyowFBPvCNpGur/6+RvUSMPvC
 Jwthg3c7PJ8feXmnGtNTuti0hlQqYY/4XvZPBdAbSO6ltEGU4LSDEwMfqb8lwmkzCggoSH3/u+e
 QWP0GyMW8mr35FzzslRN2dktcCGmTuavZ4uK4NnZZI1ZGawN21RZ9REVQBwfl8t8zpW3/rycXSe
 f4qSW8O2BSoW8okJ82ZaLaN4oaF8GzTAPjuoOmV/RyyESmjd3ut7QtdRx5kjeMOPEDlI/TSUZnf
 im41Z4Kk9ausad7x7FXM765XD5ogDQKZ0G2fRXm2icsPkDlnWjvN5/aXCkr813t3Ps6POjt5jLO
 fm1Bz8rv5MedXFJiOeP264/A5SpjzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_09,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001
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

On Thu, Oct 02, 2025 at 04:57:35PM -0700, Jessica Zhang wrote:
> My current email will stop working soon. Update my email address to
> jesszhan0024@gmail.com
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
