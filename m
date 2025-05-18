Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85306ABAF24
	for <lists+dri-devel@lfdr.de>; Sun, 18 May 2025 11:57:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07EB210E1FE;
	Sun, 18 May 2025 09:57:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="n7Nev6nw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB6110E273
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:57:33 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I8ljSr014013
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=xtlsK26IRXZ/58NCN1CWrrVG
 lERGjp9AXyiJ/lMq4CI=; b=n7Nev6nwXxcRCXVjKKHTZtKH9pIzHQP5lZTR/d8+
 xt88ESg/dqQq14Sx0fgGt1fjz3nZUbII1KYtAsG9NIjPXK8xZDnfB1YQndTsf+rG
 OV3kJHVtMBhQnNs5363lk3F89YkbndWyfgWb8ummFF7L/FrR3O1vKrXuOD8NZyFD
 5mZuLi4cZe1Kei17TlD0JDSR2w0nfqUx83FC1RQLHc/l8+xYat6Drw/1o+Is1Y6Q
 6Fm4o8uzuiR8TVpi9Hj28HHuvDk6aQQGduyKqB2uiig0X+/s11P9zL6raZUdj4PX
 dm4c+rxmxKlvs8JMww3lhO6Wq4q5iS4iAsbYudh1Carq/Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4ht65-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:57:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c760637fe5so660750985a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 02:57:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747562247; x=1748167047;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xtlsK26IRXZ/58NCN1CWrrVGlERGjp9AXyiJ/lMq4CI=;
 b=jjQgsRC2Ox4I93b9JGVvz8KlrvjOwSJmh0NF/vKxluXU02Q3NFNZtmVZOoN90OwunC
 x0N7HozU/mUYn0JU1IlL7apOTcHocsfm1fFm/5eAvnzLkQdixe+A9EUhsQaBNGt9GOrj
 4D8mmSk00sn8twLLnviZo+wRhX0umZ7fggL3YDy7Ki0v71WRLhf8KLaihQE9n1LLL7id
 +iESpUhtCY/43zy87S63EKOTvqWW+Ta/YHkFolpctm+ma33pdOpYV1dHAunusXGtt09v
 sIUKIa9Y2FrLatPtkw8PNR4eLuYElnbgbFDfymPj1UUxj7yQFUPhc9GJzgTCaY2UgIqx
 0X5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVydKnZf9J6mmPO+6mEe14kFLGiabqjEfrx4dxD0ebAPr/cXd3r1CYs5ovWd1xM2tQPXG14ONLsia8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCDW9dRv12tO6oK6OTi/rPRY88AA6sa/PQoTlxr6OQ7+K9ffpm
 8UeyiFPNUzaUbJtwOn0raODrnxGpOHmKwU+5jXPWzUFR6DVPdgqm08tAgrUlgfaHbcXOjt1nQo1
 ljjRyQJ98nf+5cLQMKv0/yAEvizBPhpPvAYcXV8E8xfd2TAz3NPLFcUCtKVPyXqTl/2DhXqM=
X-Gm-Gg: ASbGncteR7+73bl9DtckMjpyyLQu8dxlZdN4uw9qjY39HHTVNvD4RxSBJB03iSr1WFt
 UW7Nm+gUBq90Tw+yPIU+7eOpakrKHoNACyZfOjrNZEou5vUHikTctE96UENBnloRwrMW5AFzzS6
 TCJBB0/a8DtSQqEapTdgNulBkQinXpQStnC2JIHFe6LmX403pOyFSk101hKvd/kncgLYeeq4xbz
 uHlkE9a/ghvOUlhGS4J+FxJ/JEqrKuio3EN+9qcU22bhRYatWWnLleFUr2r5mTvYfg3BZL+Ix4p
 KdD3/MivkbSJ8NBi3lCPbNBdgzILYH3IyqE8BtKQ52izXOrXx2BRD/XgQtiaQhBzvgrPmoNzwSI
 =
X-Received: by 2002:a05:620a:430d:b0:7c5:5d4b:e62f with SMTP id
 af79cd13be357-7cd46779caamr1359734785a.43.1747562247343; 
 Sun, 18 May 2025 02:57:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQ5pBjRydjX6p8CyddzYdMdBy0D9FOBBlqON0ng7sKi7sHV/ur38csJo7tBnlIEVgInmOAjg==
X-Received: by 2002:a05:620a:430d:b0:7c5:5d4b:e62f with SMTP id
 af79cd13be357-7cd46779caamr1359732185a.43.1747562247003; 
 Sun, 18 May 2025 02:57:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e9cb4d69sm1260695e87.21.2025.05.18.02.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 02:57:26 -0700 (PDT)
Date: Sun, 18 May 2025 12:57:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v3 10/14] drm/msm/a6xx: Simplify min_acc_len
 calculation
Message-ID: <cet4mrockbsa2lwrjmpvqfffhlk4r4xzbfoiffuohz37oaklsj@6spwjrcyxf7r>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-10-3c8465565f86@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-10-3c8465565f86@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: IZxYZN2__9pFoHmIzkc8o_aBk2sxHRTs
X-Authority-Analysis: v=2.4 cv=C4bpyRP+ c=1 sm=1 tr=0 ts=6829af08 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=WrN7u6T5calBdp3Od3AA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: IZxYZN2__9pFoHmIzkc8o_aBk2sxHRTs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA5MyBTYWx0ZWRfX23UWXC/nxEGH
 tozw5Q4t65PMCA62nZBtsSkgYKI7EdNxCJToo3/5GaHy+fXa72Cxwx8BmCDpW4w5ty2y6qWw8wC
 u9mqJMC0WQvSzEYWjoxDxJHZAJDWsBc+0+tZQrgT6xWmvsrPCBFmsbx7t2JUk6HzitHnBbHskuq
 dBSDvLZcWvd707GEtDOEaDnJWZS+osC/eEt0tFmde/ZfK2dcBmF3MzhsuAK23gj8kF//sx4VgH/
 Ma7aCvyg0vp6tCUF/sUO3ufx+qBxi+YL4/D/lrp++Z+ps5znPUfEe3gUTzDW3X97qPW2zCdxHon
 bnQgvlbzKs/DKgCJ1tKtAMUR7GwfaSvRDOJXJ1+2qDRlcz0s0lXuihObxqZvgCBdXjrI7mY1f24
 i12MS0tHwdX89yzYy7kN5w5m5iEfWXujV6InytL6O/7GG8VhZl49EVvYd7+8PJd1sJ3FYUku
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180093
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

On Sat, May 17, 2025 at 07:32:44PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> It's only necessary for some lower end parts.
> Also rename it to min_acc_len_64b to denote that if set, the minimum
> access length is 64 bits, 32b otherwise.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)

MDSS sets it only for a610 as there seems to be no UBWC support on the
display side of QCM2290.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
