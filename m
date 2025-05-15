Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C78AAB7A9E
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 02:32:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B17C10E754;
	Thu, 15 May 2025 00:32:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FyRGtW8F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5249110E754
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 00:32:48 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EJspEo009098
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 00:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=jMX8MEuNbqB8c/F1/VjebPfy
 Bmoob4q2DgIFRmEpoZY=; b=FyRGtW8FJBxPZRuJS3HpFlnhHAVvxQb6Cx0f+4Du
 KvVR/9+TUAAOJnv8aVF0fjOfElZ4ooF1XRaPdjZkjATsKe+GNPdpORQgr/WocG8m
 Lmo6jOa6DcSqNGWLdeDbC/11ukij0qsmCpBk5gKZTaCNtTOb1w4+DaLWoD7+oFDN
 ZLxnVcAA6fr7HtQunJ1uKjd2386a2oqaS2FHRGEkOlszFw4yWRHDF5ae6sV2Ur4r
 OcNGUEsOhkiCEvyPWYTK8yBFPNnmWfJYD+Btnq6dzXmHL8rH4NZEkq7c//+CrN7V
 cEs/slPKYsALcfbzXVHc8Vqm6fdNpVUvwGhR/gKiRI9+zA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpvf9j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 00:32:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5bb68b386so92909185a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 17:32:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747269167; x=1747873967;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jMX8MEuNbqB8c/F1/VjebPfyBmoob4q2DgIFRmEpoZY=;
 b=dGP2Wh2VjWawwuCS/ZMzrX6znDAYo+tvr0e1Xm5lMFYV5q5wBIVtXtSjVpj7y1n/hP
 0koAsGd5RTy68FyjZ4kBSCSrOT/1YdHYA3D6nPW3qTdRxvgpbSMbd7MZwN5GRx7S6mPE
 IeVW5plW699BpAWXG99gEkSDrTNuCS+Fk65eYXyGgtRaCRpPtSO84s+ix9zQvRXOJ3jn
 18Lck//G7pUfLrllKQTT9tgayrujrUPn2p6p3W1inaA0xDKbGwf8q7SAc8BlXiDgqaWD
 s7Njt3WWxbnR07meosO1I0cmhdie5K/uqwADq37/JV22fu5vNS4cFg/zFkIS06wvyV/i
 O8SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGb8i5Jx1DJdpC3Wk4I6R9feP+DhUDM9FdrUoQeOxRolckH625a2V/8bKrhnqX/ImaeAgWCdvN3r0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaT/hp4gJgeBdEZDtuZFZs8AhoojX4l3bWsAQClEaFP4JV2iLs
 5m5+0BuYm2LbnvYJDr+mXRp+ab8CFgyfHi2EQhTwoqPzNFvoyJAZWQyxUtqWrgEqZ2BKn13kob9
 QEhdidViGYzxqe+M/u6vE9QPIElP3y+NoSY053n83AzRZlHDADL2jaG000sp0fq6g8L25v4faNn
 o=
X-Gm-Gg: ASbGncv6zyRYJHtGPA+oQThRlDcJIjPn/Um2qvc0mubTGvl8og/QB8fv+GrVGlhI+4K
 767KyWMOgJS7U9HVZxG0Qo+c2Ly+JItolfp4UFmdWLuljCZCi/bxBISDIvcg5XJ34YhVxpyAAW0
 lP+oaxHvr+hcgCnR604LnaGFIn1gL/8WiUUeTKtOHXxT/Uk0WsCw9MWzy/X88MBN14yHdIMMksf
 AkPwphAJfD6RBg9S8fEECa5PtmAC6ywcKMD0pXMV/xQLF6uDeLWuES0ktWti+ZEgjIIL1nz62PG
 +1OhtS2194x8HLYZmKoM15kh+BGaFVUVaBlEEcblYTH0DzT0e+Zuixb+jDmCuf3t8qLmmNAXheo
 =
X-Received: by 2002:a05:620a:404d:b0:7c9:6d26:91b9 with SMTP id
 af79cd13be357-7cd3c80a6cbmr61022385a.36.1747269166826; 
 Wed, 14 May 2025 17:32:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1frL1HZd5yd5hFRUBJhSomzVm57HGiu4Y7gzv+uda4Y1bA5fiAlWFerS/koCTLMIP76ifNg==
X-Received: by 2002:a05:620a:404d:b0:7c9:6d26:91b9 with SMTP id
 af79cd13be357-7cd3c80a6cbmr61018085a.36.1747269166342; 
 Wed, 14 May 2025 17:32:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc645cf90sm2401020e87.71.2025.05.14.17.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 17:32:45 -0700 (PDT)
Date: Thu, 15 May 2025 03:32:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] drm/msm/dpu: Drop maxwidth from dpu_lm_sub_blks struct
Message-ID: <2x3wyi2pfyax236zuixmk6xi2agooy77cn4goaejirlms4f7l5@7bhybz5llqtt>
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
 <20250514-max-mixer-width-v1-1-c8ba0d9bb858@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-max-mixer-width-v1-1-c8ba0d9bb858@oss.qualcomm.com>
X-Proofpoint-GUID: NNpg38jTWw1qQjRKh_GjoFDgsYGY4_07
X-Proofpoint-ORIG-GUID: NNpg38jTWw1qQjRKh_GjoFDgsYGY4_07
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDAwMyBTYWx0ZWRfX3bcp+jkHmQkS
 XJqrXBOWVgrW66UZk+AGoYboWAbwANCXx1altwrZmXA0+UvQ/VUbIxTl7gGK5HIOjg9++zl5Nbt
 CIDsTBKV3K4+Zs+lnaksoTmtQdHKAydAX2zA7rAp6qW4ln67AJ5/SnAT3rYB1dXJ3LO119TwBOu
 QHuGQVss7kMkiUrI773eL9V5WrCSgsQJmMpriFhnOZPJapZDfqqrTZcqEbp3CJm1/VkueLgAcvC
 VIcS5jy8P4EL1Ms7joe+j4WpMfP8xGCBjxAgh/iznt/gx7rgAq6MZqITPn+Eo9KDhEP0Q6l4vEb
 HNt8IPTJ0cDDBXnbIb70BnpFsE1rNSpFAzZP8K3r0X16cFPdFaor+b/vNKIPLQiEeeWTjpjGBfy
 X6PPjYBQkFBARANfLW6vQdT5W3+avUfLUOxoa/xK3cBiG0JXjS52a+/5hMx8aLF64syQWfKk
X-Authority-Analysis: v=2.4 cv=KcvSsRYD c=1 sm=1 tr=0 ts=6825362f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=ABbDsRMl8xt5kB7kq2cA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_05,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=782 spamscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150003
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

On Wed, May 14, 2025 at 04:52:29PM -0700, Jessica Zhang wrote:
> Drop the unused maxwidth field from the dpu_lm_sub_blks struct
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 1 -
>  2 files changed, 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
