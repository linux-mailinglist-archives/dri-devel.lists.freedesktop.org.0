Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0126B348E9
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 19:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 635E710E518;
	Mon, 25 Aug 2025 17:35:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fPuI7xgC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE9AD10E518
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 17:35:52 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PFnmmT010555
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 17:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=kwa3vdgYtv702TKjlFEOUh4f
 oh4EffxBoohd+2TNwQ0=; b=fPuI7xgCZfYig0MelwbZl/WiuZxk9xEJf4+qVP/U
 euVwGsfDiQaNX9IVShE/1HWHt2YyS5lASSrMkJFCBxbMHQNrckcW3zDu4OCWONSG
 i8ySVPHaiVRitazJkR6LGBeTvKM0iy6sDqyPNBiUn9krj8qZ/IxWdoq3Uloxqr7P
 jH6VV0V1z8yAT0KuYWu3EY5jPsD3lQ8AcW1nDry4aXfRwRf+fy5VwuOe/OLPJ9xE
 quiI+uxUGZdivA1drOhdtZlcwR9FMBYBAUnemKfpr5JRzYFKoJug2rNjicCjs4qk
 VeXPBBsBe5yaqxoxAHrsZnnoHPSQ8QB3C5858cTbtnz0gA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xfdy37-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 17:35:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b109bd3fa0so46781431cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 10:35:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756143351; x=1756748151;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kwa3vdgYtv702TKjlFEOUh4foh4EffxBoohd+2TNwQ0=;
 b=MHFG016fXYh3heTFilb+UpHk5g5xxNh4KygaGYxiwiUGp+w3k/J0jNT+VoALf7Ak4o
 NiDCSC54m6Xz39+UOSluoSPKxbVwy9oVVN9tt7XOi+/qtZb3XT285Cx6xNDk+iOArL4k
 g5yFdcFO3NnPmflwRipgEP4BO4qjZYK/ASpiue+lVpJmbXP2mzA4ns5Fh/6Kfv4jeVMW
 P7jJ0RjythW+lzRvhhrUgiy6hg3ypt9tJNY4AIu2Yg+BDHYTeCJ4BfLXP2Qe7giFjWFV
 bNpT/6R0Z+i1sO6qKo1qYrFJx2le0wuv4I7FRHREGhW1ljzCBVtgTHw9JDGclrOCyUsg
 xMYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUw27QbFIt08ibykC1oUl0IYrjAjM7LGG9meF4yMGPrWZOmRWf3HtyBdCSNDRdZ+Qg12UztDfbPOVw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4dEmaFzmIz8RbuMce05wEGITQh8RDOVNSRQQhjKEQ46oXTj3d
 LJQ4juid0Zi13J3+VZq1r2XrW/big0QCmmrjv5uCvNMTvavGcDef1h3DuOY5G+KlFwcPQ+aCi6H
 nFkMG4ftSh0PbMEcim3veIBzyBrsgeZFk5EvSpUBPJG2MOUJhpiJRHlFyrkRPjOZGJtM6JKU=
X-Gm-Gg: ASbGncvbwcfolltYFiZ4PclrOtL7MzPkGXdGDoqbjQXRxNaa0WfhFM5N/NCdqGFTo3v
 GVoUy/LJBN7eI2e+oOJq60qo4kHueEzC7WpkkYFsXDT2e8cWmNhxT0ZidPhcwJt7dGMQYxQj+eT
 LOmTNhWoJykSXV/7VmWCdroMuZW94qksXntaMC4171rXFwfk9AJoiTg2Dq4MsvbUE/9kwgv6cAK
 +zD9ohzpQgxeyolgLw7A9vNpGxEznPkXN60I79iVsvNdszw4KB0Jc6diC1y6TYEuFdUAa0Jp3/9
 oyRHCqFC1BfFtCSsYcCGIWXIXRGwn7VZSZBnVxYkbcXqFmE4aEcqMR0Ts88mwPqdAPhZXKxfcj/
 cXP3WWusF2mC2iYktMia96mo8qbCrOy+eOBK7Aeo7VS4BO6uU9smV
X-Received: by 2002:ac8:5885:0:b0:4b2:8ac4:ef8a with SMTP id
 d75a77b69052e-4b2aab57b3bmr163573651cf.69.1756143351067; 
 Mon, 25 Aug 2025 10:35:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEnoMIrJ7Zrpfy4CLQqO45/pFwcr6T7pVHZ+N32uTDgh7RXtgJOi343oTo0GJcof/9i3w5fw==
X-Received: by 2002:ac8:5885:0:b0:4b2:8ac4:ef8a with SMTP id
 d75a77b69052e-4b2aab57b3bmr163573211cf.69.1756143350550; 
 Mon, 25 Aug 2025 10:35:50 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3365e609f72sm16550321fa.71.2025.08.25.10.35.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 10:35:49 -0700 (PDT)
Date: Mon, 25 Aug 2025 20:35:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 09/38] drm/msm/dp: split dp_ctrl_off() into stream and
 link parts
Message-ID: <5g73qgwgog2ch36faqiyluhsci7ungrxnovm4qgidk6n52qa3w@lpkgkzlofyvb>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-9-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-9-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX4mO/SUpwxd/+
 sbhQFS/o8KOCoo20KKDFoDBZXzTIhdJHnUleLqJpOKFZxs0BEX2eh0fIR0XlLHHB4myi37y5op+
 YgVKPDFZyMk5mT/P6fHPSKeh9eWe1PlHArL0PufaOosXL5w7YC9ncI5fpjlCBh3CkPw1ZHMtVAF
 2xBny83eJkHtxBwzn7MXZp9FQHYIqmISDOHTSGCaTR6m9zvwM35O76PICflQwEPMXx8zjjKS0Lk
 YRiYJYO6Pjij3lFOpiZiMJ7KzOXqDoHBTniOLVRYWVRpIAU2f3nY05q1+L371BpbKN7Igdueght
 kgsigt615auEYIO+aGHAPI8H5rrffgpgtXcnt9/0QVcuCbV/Dbou3QF2slHHOv52bHr8xL2/jvO
 RBPq8Rg1
X-Proofpoint-GUID: JLtggKp1TA_-1t01c-j69833YI6t1Z9C
X-Authority-Analysis: v=2.4 cv=MutS63ae c=1 sm=1 tr=0 ts=68ac9ef7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=z21d-uj4LOo1IgCTbOgA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: JLtggKp1TA_-1t01c-j69833YI6t1Z9C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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

On Mon, Aug 25, 2025 at 10:15:55PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Split dp_ctrl_off() into stream and link parts so that for MST
> cases we can control the link and pixel parts separately.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 8 ++++----
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    | 3 ++-
>  drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++--
>  3 files changed, 10 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
