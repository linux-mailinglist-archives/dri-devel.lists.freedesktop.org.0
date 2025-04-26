Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9494EA9D733
	for <lists+dri-devel@lfdr.de>; Sat, 26 Apr 2025 04:14:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A24710E18D;
	Sat, 26 Apr 2025 02:14:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DuZq90Qn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D45710E18D
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 02:14:26 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJuA9024719
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 02:14:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=sgng+bZEhvkzdq+Q9IsrPjDz
 pcDeuRKzrGsRNiJeN6A=; b=DuZq90QnvyeAXJrBQLeh4pnppAyjgmZvsHKFYDzc
 LB1EaTQ2tS9Q3oPhoNHbb/p7053FXK6yqaXwHtl0au9wZY43eZsBxu8mPI67hIYp
 xm6L7IApmaGrdl+7MNrFPxBmO+LGKwd527Zozas5I9c2ycVI8FrWPk/Sh1HAVZd9
 as/B0Ti+/cpux49GKXRDFik91n2+bhSkk6znNjxMkKno4eJQ+KAfHFwR7hf5ioRL
 cbOAhoKpMfXLu0m+NYEMB6L4twQPnGJwuDN1bgSz2Yup0HJZRMXyQWhNeKTZMo/Z
 aDM8E9YKw/P1N6FToQP7vut+8ODypQtHUWXPqpv31+cWjg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0tkf9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 02:14:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5f3b94827so437435285a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 19:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745633665; x=1746238465;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sgng+bZEhvkzdq+Q9IsrPjDzpcDeuRKzrGsRNiJeN6A=;
 b=pZaIpDGZRFA/pekyEIWrsOtfGnhRSPZ0gYuije30bpyvqoEKeiwD7HWxLVhDfIGGAP
 4hRa7+5+YC05h1R8ZZIDtUPkAEfENRRfNBEV8wfnmSvr/Rh+jwgAWQ17fgR6gXFVljOt
 Ni+T2vWMUZs1gMZIUZ7xAda4mOUPF366wQCdsLHL6hJG5pt+PBPbRELVTXd9YJFcNak0
 7HL6+B3i/JstDpFRTt8mRyMjwNV8cYL/66cuo17N7f0n1d7N+SLZiye1Ka26Ntb4KCVU
 ZMfxiQnEqX56G8SsNB4WJP5sSUcTSA3jTpFaAGZ/kFcvxArarfvbH5ze78x3gPdA/6/+
 Zd/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBT0M1lQ0CRjthB8bN0FcBPci62dT11osDrXJh4qLotV2uFYkUoLk/bqR+kx67ilJjOyZYLhnsojY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMhslQvwWcnkQwutP8ZLVrkw2RNP3QAxXlOpoiTeybE0gc0Hs/
 v5Yxey9UXOE53rw7PmACtTwXteFTUmB985wD3hmkqhQJUdBtp3iOgzE/6w4nLHtoyrAHnYtfwhd
 b5meJF6b9MWiO548UTTwxQqv75GnxdhDBV9fOGXcv4mHJxSW6zk9A/yK2nKgWuxOeDdY=
X-Gm-Gg: ASbGncvOWiK+QExamtaiMEZ22iH4mJ7uZeqMeeNYVWC6TrNOXsTav2RNHwsvnx4O7zh
 xW9EDmuQDG0xqwoZU44yCgk905erUhuLV69StPo8z24lWAu/cye8xn4p5zCmdAos1oFti2idyiI
 qClvQaFNPMNr0aAq47w8vNrptJB9pztKRyzdT0cvCz5nV45mZsnxk6cm4Apj3NLgvcmcFfT9Z8F
 V/GTYi2HJuacU15RwFeFGn/XlaoVmxT1XtlmZ5f7poTL87aHkPizty4/kwzTfMy9mLlxtKzPNhD
 leXqh766ebzq7QAQxQ8lGMIJ3ShpdWpLjMOMGn9LowXdf6+4JF2GmUgEafYt+R95XosNrgUAxpo
 =
X-Received: by 2002:a05:620a:2847:b0:7c5:4949:23f9 with SMTP id
 af79cd13be357-7c961991dc4mr708916785a.18.1745633664936; 
 Fri, 25 Apr 2025 19:14:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxJRrQvRJIjrfWkHem5vyugdvDgcLbJ6kIDx3TUrqL4s9VNbnAJXPTQD63gl7jCjJp60lHIg==
X-Received: by 2002:a05:620a:2847:b0:7c5:4949:23f9 with SMTP id
 af79cd13be357-7c961991dc4mr708914785a.18.1745633664644; 
 Fri, 25 Apr 2025 19:14:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-317cf659d3csm9778971fa.18.2025.04.25.19.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 19:14:23 -0700 (PDT)
Date: Sat, 26 Apr 2025 05:14:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Vishal Sagar <vishal.sagar@amd.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v5 05/11] drm/fourcc: Add DRM_FORMAT_X403
Message-ID: <3u4lkr75kbcgx3qngg5m66hxqyd52uz3uqxetizqy45bmcs7iv@rsgkph3oxea4>
References: <20250425-xilinx-formats-v5-0-c74263231630@ideasonboard.com>
 <20250425-xilinx-formats-v5-5-c74263231630@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-xilinx-formats-v5-5-c74263231630@ideasonboard.com>
X-Proofpoint-ORIG-GUID: BTfvpf2xZT7sP9q5ITWKhFSw3ar9ME7x
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680c4181 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=9PZjv1JVX9cdHcjgR4AA:9
 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: BTfvpf2xZT7sP9q5ITWKhFSw3ar9ME7x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDAxNCBTYWx0ZWRfX+/LcR20yL0tn
 EZYMM6/oV0L0i9OCbpOqrrELi40bRceCwGMA9coR4MYGvDus01HBn9QlWPO7kWVEm3pscqTv4o1
 SSWs04tUyxPNjwrlPeBIT7mv/FhPUptqzCV8v3N0/zhoXLWnKM6GCvW8GJD0mvim+fVdYwvoKuU
 03O0dvwk4a4N0m/eClt3+tDSMk4dEhKQX/8JzSdOrHTRSAS03F7fu+pJe6Fjbmmj7bM3adRENl9
 Sa/ic8seuONbCX2AbwP1S3zAaOa0IApZ//YrzPWOao/GbG5uSE3JSLiIkw+O5jTxd5x5zqOo2kZ
 Q6ynchKVmDdUzYlM5+geum1Qo0/i03VMgq0eocIcuASfcYRCfMQSStqaGklyiCUH0FTPaQhwyVS
 iVDiEP3CX81cfu1X/1OdX4Y8WX5NeYBA2XPA7+xT1iZ3pmq7PaNo6qEFuW86qPWZ8hRQ8WCW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=792 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260014
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

On Fri, Apr 25, 2025 at 02:01:25PM +0300, Tomi Valkeinen wrote:
> Add X403, a 3 plane 10 bits per component non-subsampled YCbCr format.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/drm_fourcc.c  | 3 +++
>  include/uapi/drm/drm_fourcc.h | 9 +++++++++
>  2 files changed, 12 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
