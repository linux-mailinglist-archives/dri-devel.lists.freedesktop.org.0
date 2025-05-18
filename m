Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BADABAEF7
	for <lists+dri-devel@lfdr.de>; Sun, 18 May 2025 11:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C62710E1BC;
	Sun, 18 May 2025 09:24:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aWys5Eu5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C5C10E1BC
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:24:56 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I8rvcr007415
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=hNr/pl/r9ZOYN8rShfMawc0k
 SnbkC2SMTXuLQZV6004=; b=aWys5Eu5LT+nYM7eRo+y2omkFE0d3tlWSCZ29Qbm
 Nijh+w7OKH158G7LqzSkKiOYszi1vj9q2L2sWnqwbtvSrOYW/tgxesky4aYSSSOj
 PxV4tjtWY+HXZhXq9CmnTAdPfbLd28henkQoeAV9O2Q8bxmuezID0n6ZKzy9orMs
 cQ5TIIitDYHB/qMjpD06fdKMis69NbPShjjMbELInU5NfRXO46B0Y6FHclU8ynGl
 iY9AZJ/bG4F+kYSvZ3UqZZb6Gas1/iZ3GxEux/GA9p1b8VnsGLyhrQzZSU2uv6gz
 W00AltwOwD+VI9snqFRk1DTqGybC6tY3d6+sTs/LOPuucQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjp31sba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:24:55 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f50edda19eso53529136d6.1
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 02:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747560294; x=1748165094;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hNr/pl/r9ZOYN8rShfMawc0kSnbkC2SMTXuLQZV6004=;
 b=bpAUNK7ehs+6vtTIexHMI2HvvS8dgy1UTvm0Ex95083Jfcl+ZDpM8p5aHaDwDHX9Om
 r/MKpuUq7cMzrIawAwzEGi4VV9Ke+/t+pA671QxS8gdWgywhaxYK67pOX6RisAnAOHZ6
 dLN6dSX0OhVSSdt6fxTz/KaiQ3REfuoLamC/y7zGyIYDAVyiMDVKZbV3fYQHcwR0UZ/q
 4GFq9dvCnKEBVLXvkxMZOxD49xx6ste4Alol8+dZFFoRttjc3aMKkV/BYKVKZWtJrdbB
 Iw4RFTDN3HSBMK4Av8Kz05ogVuBf4PXdZCTEu8lOJNStiCb0GB9CMe/VlUYweYGMNqIF
 GzLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWocUOzUeCRa//HOJ+C65U+/rwLLvItQX0M1upfccpp1rATWV0gA2mjYkRD1yc3F4vdxewDhnjsm58=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBv1K0gVR8QJf7G/dlnAXp/zFRDsVJ9AapaNkuqLD2dlT/ZPyA
 AlwDnuZ6Vr71/T6zBYoGMoe8Oa70d2+Ou2K4bN2KAvqSKW/isIXM66YZvWq7cDEIXpLqNzbL2L6
 G7zPTI16ilDVJGl1eJ01YxcvZ+/ZuTW2J/PdhyQwOw0efqXQDrg3VKj1e6kGvWCVd0T1vQ34=
X-Gm-Gg: ASbGncsG6HZElk+bqP9/ykv1lhcXu95SWJgVc0OXW4K5Z51qeuQ7U4SgC7JkUBjgAsq
 bF0F0ArXszlwVnEzx1oBiqAgKI+acbQdFEFCptGbDN1vo1GcrEF2l+3RWhFP+ljtBeCEQv96CdK
 aOApqAJThN7Sd05DakMQX9U9gwrGJZ8z57ShYJpnvy7faLQWqcTvQAYyVYDuFcsk3RKElv11w7/
 evB2VyzYkCw4F+3P+RzWZ2xIhbnBZcFS62tOmG1guZTgQrrMpTQBe2PG+ADBdnnXU3Nrnts3jq0
 W/UllS0NIugZDVm31xQOoasBRpEhpEgSmtOH+S8zYAKR73kGRbT+CYMmN2J5dJNuPxE192Ewlfc
 =
X-Received: by 2002:ad4:5cca:0:b0:6eb:28e4:8518 with SMTP id
 6a1803df08f44-6f8b08fcfc3mr175740226d6.34.1747560294203; 
 Sun, 18 May 2025 02:24:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBE8AEDRXC7fGaZuy3S3AMRf4t761oNWgvl9lJpRdtkIjuyHJ4BLR1QQmRYmnMD9O4Vus+kw==
X-Received: by 2002:ad4:5cca:0:b0:6eb:28e4:8518 with SMTP id
 6a1803df08f44-6f8b08fcfc3mr175740056d6.34.1747560293854; 
 Sun, 18 May 2025 02:24:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085f097bsm13953151fa.110.2025.05.18.02.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 02:24:53 -0700 (PDT)
Date: Sun, 18 May 2025 12:24:51 +0300
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
Subject: Re: [PATCH RFT v3 06/14] drm/msm/a6xx: Simplify uavflagprd_inv
 detection
Message-ID: <gtmbpj26nsidusqg23a6zghahotwws47ghsq2vneikpvd4b2qh@uihmkxl7nfkg>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-6-3c8465565f86@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-6-3c8465565f86@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=B8u50PtM c=1 sm=1 tr=0 ts=6829a767 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=nx35QXo8bFDwqsARtNcA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: WF9_EImp9d1iECN62zhcAQLnuLivsnp2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA4NyBTYWx0ZWRfX6aNm7yV2L3Xd
 jLk3A3aqE4X9DIfSIYZ6xQM4NWQ8474mPIdEvYscJiThrI+/7d8oCRsz2yoe10gzGVTKonQB4Et
 ADeircf+2OLLvpU0vrJrxEuTlTtL64f/INqOD7iv5lIMbGfZj7WDr+1y0f/gO0HGEf4rdZTHvSp
 B7o8dPRN/ai8pEVwB1UXxFZsB8gh9DBvBFBUJl6UtLGfZbbH5MVNjffPHwBn3v4/Up7+iheOan5
 pffVtVVmTpRWaKGvnSkwdgTHs8jKeA2M+n3E999ODjSw9DeAE3FVU6iNoX41zNt2uXTK4Y+ZXgt
 dA1K7e5lHqgHcRzxOmIsj32NWAegc9q2obDagCJJj8VyZHIptiH7eIcSK/2uttT8IscGeNDrWnx
 NQVqphRGoKUrDEXmfB81ycBAxYILiSgrc+QjOpcV0Kxxie0byquz5g5A9CyU4rjl5uxH3EPv
X-Proofpoint-GUID: WF9_EImp9d1iECN62zhcAQLnuLivsnp2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 mlxlogscore=944 lowpriorityscore=0
 mlxscore=0 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180087
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

On Sat, May 17, 2025 at 07:32:40PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Instead of setting it on a gpu-per-gpu basis, converge it to the
> intended "is A650 family or A7xx".
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
