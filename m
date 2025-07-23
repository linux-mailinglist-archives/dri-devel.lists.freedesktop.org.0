Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C19C9B0FC51
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 23:53:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D839410E194;
	Wed, 23 Jul 2025 21:53:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nqs/YFDx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 739E610E077
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 21:53:06 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NHQmoR024408
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 21:53:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=v72jQE2tLfM4yFjj0GK92SGI
 mdakpqBvLjrNZl77Tu0=; b=nqs/YFDxNBje1ApXmMFgBluOnK0kQE83xMukvMLQ
 i5CRsGZKizemqdixV0lmFlKl5b3w3B5l1SrJYLFW/jVqCt9o1VU7M4mUiAeyfEC7
 K8QM5hZKN9kyddwv86Q6wbuCfxsseiACZ0Ile1h2Os9Y7Vd8OgJz0ygz7jD5iolA
 bx5IHN/LLYJDycrCSLY5nNgMuaBzPkSrfIqBsTWNUHl463L5KUrP9+IEhsYaDmem
 ZyZBBBrvk/ObQ0ad9UUVWNpimk/dEtrWEiUO8sB8nQH5FySp+VsV7JlM/yoGy37p
 ddLZtQn+iiwkhpvXXgi135LL4/gD4rqobc4psxEF8MQzDA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482b1ud710-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 21:53:05 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6fac45de153so4506756d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 14:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753307584; x=1753912384;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v72jQE2tLfM4yFjj0GK92SGImdakpqBvLjrNZl77Tu0=;
 b=RKv+DJp4JDDTBJx69ldU4/j8IR4xxFhv3NYMJVM8SJ7e3O9MIFCHtpIIihBqW0CDIW
 zsAVNBF5cDRdOrCuxLFLNgMFuUgWCBHPSp86csTouWu9MfTIkxnxZ/n41ud7s2xDhKRR
 x1f49GcQVQji38N0B/eLwisgwY6TLZmvj9qFIOGEaxa9Pv+GXRb6fc9MJaDKfx7k/qij
 URRNAxVTcFJOkGm3qNsbQRMPmwgDsnj5aHitN1AtvlU9/ktui0lghd51xBZ9Ch7tm2HH
 hJE2j1gQ1jz7Lkn9S36rP4vUBHRaCsfKYkOMC/T3hk1SVXTMdH1o568x7k/FqVXDLo0+
 LXKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU43kYsHDBAZxsSQZPlkz3+BZoC3U1esunQJ6oIzRmRmpOlL2hsobHtb2NMbdQU18bWYNNCr/7gQVY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw91lhbln25iMMonhgDcbBULkTnlOT9ZngaC8HClev8A1+j3+oW
 YRpzMQnh0LzrtECMYRoqIH5ogK59dUg8Specke81bIdsngpuaSx/P9vVIkoSMVb0CJknzTwinuZ
 cLoDLYhSg03E6QcTIKwdSGGR/pmYzFY4xTVuBhpIhQP4jupuXhEy7cnNHeiYMg5v4uX8AJqI=
X-Gm-Gg: ASbGncvFN1axMG/PITt4j8yqVr+TbHiexgIcWu5VuDjztVqHBxs0J+KLBuZh5FtF8E8
 iKUHqECfpIzvVO5ByL8fbgKmzH5s2itWtt1DyAjNaSiOMkayb0iDRt/AltGic6XqD+E27f5cKe/
 XnSMw2nZHAdQ1YnJj18Xw7MeyaJ+JtKpjkqa/m4Amc7rPNyP/ZumNIMpx7z5BEiTFxbFhAWVhAZ
 XBgHL56y51IYLjL/TAuoH9jYy6NG21gO5+QCpKXLq5YEehgjhc0dYekJCUPN7LnKmkK/D90szi1
 uPW4CgQ0ob6ohbU0+VnybcJqusjxIKgBNG5ViFqxnZCHPztc88OsjvMXftuiShr797UgVTiMQOf
 G1U507km2+p/c5av4ReWoAFBZ5sh6GYbqg4LEtFdxBCIRUN0RGvWn
X-Received: by 2002:a05:6214:c65:b0:704:f953:eb60 with SMTP id
 6a1803df08f44-707007987c9mr54947916d6.47.1753307584353; 
 Wed, 23 Jul 2025 14:53:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLtHVDKzBN5wiY19PRElCtVoKBtRxEOU+M0J8TZMQP/DquUGxds3clV1zM02s/3MTy6pOoIQ==
X-Received: by 2002:a05:6214:c65:b0:704:f953:eb60 with SMTP id
 6a1803df08f44-707007987c9mr54947606d6.47.1753307583818; 
 Wed, 23 Jul 2025 14:53:03 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b53c84badsm33283e87.145.2025.07.23.14.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 14:53:01 -0700 (PDT)
Date: Thu, 24 Jul 2025 00:53:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/17] drm/msm/a6xx: Set Keep-alive votes to block IFPC
Message-ID: <s7ck5taxbozy3dxtav2huxh5d4ietfmqsv4mliajelu2gy4eqo@6xmp73eamqm7>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-8-9347aa5bcbd6@oss.qualcomm.com>
 <jvn44gmttkidyy4emnz6mytqqjbwltlxibywfr6bfbqjfbq35e@fuvvefesqbzw>
 <0427769f-62a1-4a20-af94-b340413296ab@oss.qualcomm.com>
 <644a81ff-bbce-4cc7-a364-8e0c591898b3@oss.qualcomm.com>
 <9322badb-9f94-4bd1-9e3f-447a9134cd7d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9322badb-9f94-4bd1-9e3f-447a9134cd7d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=LdY86ifi c=1 sm=1 tr=0 ts=688159c1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=4BsFJF9TogBGrZafdScA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE4NyBTYWx0ZWRfXyXdZwQe/psj4
 APSI/vsP6qzLnQGRmGrKZoMEyxS3tiIPqQJQJlG0girEHWeg+/B3rMCA2p51IOsv3Y0lZQPeLok
 0GYtRR0EVez7xdK3u8mKE4wBygF1YS4tyGoMswFh4iFjFvnyNZMv7TvVIktYmid4cIBhyihzOBq
 srf4YHddTupwuI2qixF8jvUPAjq/4ejPbClU1FdoyLH3UlGV1A0c+byaC7CXrQDAfFLEZiyrbJS
 9w3Mi5mH7f4M7HxygW4ZPeOGIrSOaKhWzLW2h3mzJZnLGpIEwiyTOi4dEYwpU4HEUxFs73inboX
 5bvxTHWhqNwTJJjIr4iF+HaI2uBBYyK1UjXtxaMaIHRWL0jyiNphmCBzMbZMa4uR8O30G6cVyGn
 WQ4q7Tbuh3APATxPIBdI9/eltE+vOMjWs5TGkO49Dc2OiCTdgPEut+zovTmoeCM40PlVAs+M
X-Proofpoint-ORIG-GUID: yN82IiqbdkfCZlFPG6e6hfF7o6UYJ8qi
X-Proofpoint-GUID: yN82IiqbdkfCZlFPG6e6hfF7o6UYJ8qi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=924 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230187
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

On Thu, Jul 24, 2025 at 02:52:52AM +0530, Akhil P Oommen wrote:
> On 7/23/2025 3:35 PM, Konrad Dybcio wrote:
> > On 7/22/25 11:24 PM, Akhil P Oommen wrote:
> >> On 7/22/2025 7:14 PM, Dmitry Baryshkov wrote:
> >>> On Sun, Jul 20, 2025 at 05:46:09PM +0530, Akhil P Oommen wrote:
> >>>> Set Keepalive votes at appropriate places to block IFPC power collapse
> >>>> until we access all the required registers. This is required during gpu
> >>>> IRQ handling and also during preemption.
> >>>>
> >>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>>> ---
> > 
> > [...]
> > 
> >>>> +static void set_keepalive_vote(struct msm_gpu *gpu, bool on)
> >>>
> >>> a6xx_set_keepalive_vote()
> >>
> >> static fn! Why do we need prefix here?
> > 
> > It's good practice to namespace-prefix your functions, so that you
> > can more easily find them, e.g. in a backtrace.
> 
> It would be obvious from the parent functions in the backtrace, right?

Think about jumping to a tag, etc.

> 
> A bit subjective! I feel that the prefixes are unnecessary for small
> local helper fns. Prefix for *every* single routine in a source file
> makes the code look a little bit bloated.
> 
> -Akhil.
> 
> > 
> > For a prefix, adreno_gmu_ would be even better, as the register doesn't
> > seem to have changed across generations
> > 
> > Konrad
> 

-- 
With best wishes
Dmitry
