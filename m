Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF822ABBBA3
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 12:59:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE8810E3C7;
	Mon, 19 May 2025 10:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LOnMGi7A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1431610E3C1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:58:54 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J989FE020941
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:58:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oCrre7kyL+DtRhPaevA50uxzh9J+o0WUmDy9isEPb9c=; b=LOnMGi7AgMhX36cD
 0gSRiO2PXSIcgAPfk7iWbavD7juGF26n5lAygIki2uGCpAuLp/2LM+b4GXjvQuan
 f07iPfqbhI6AC4yPL2qPlw+ttfXFrhDL6lHsdEVBeRRyVmPF/8bAad4RP+2anlJl
 aSwCfw5MTZNyImYcLxRYJ3YSuAOd6Vb/smc7A8leVjMASOFtycegWclgVOIE1xlp
 bgQBCAbq2EWgQ9WfYIHiHwTub1zUaf/VdyQagJkEO9QDs5JOi2yY6ItiAq5chsGT
 SY1V7VsRn/ANaVC2zdZjyD2vsN6gjSUk726J0it9hhn3Pq4KFAF1CEE/HmOcC2r8
 vqfwcQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnym4fs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:58:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6f8b2d2fef5so52131516d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 03:58:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747652332; x=1748257132;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oCrre7kyL+DtRhPaevA50uxzh9J+o0WUmDy9isEPb9c=;
 b=gIvKzqR1hE4N+SNQUsDQI5XmFAoDaGkppWB1Nlszt37F8FMWWhZlV25QeKfT1Zf3Y0
 LVerc8z+HJXlPvsVjpZQw/6Nx7TsEOIS4UIOrTcz3PXRQHgc50tKZXsK1+nyoCyfgIBr
 1lZ1YPKP15cpp+smx3h+4pDLqm9ro6TNxnlW4jpXaFzKPNHS9QjJQkAwfqobtrNhYXLG
 pYcoBJEdCC/7ncplz4gVTBbYtuufmh2fxmMAsVEdFQVrcMNEFZM5bEwrQe6qIuj2Hv/n
 KWX66KAKuSjjgvwas3FPM5OYIaYvv9cnzv/TG/rRcvhzgsh1qWvA1a/N3vAY9Hz0GeKj
 6PZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUL/eRTAaIpUdepu2tJNTxOSPWPJZjIhSMroMMxqotGg2QndqtUDSTdj1Q+PVAajtMdv6sw6YRFqwc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpNhZRWGOVjEPgAKcHtqvC98vebkRDnP7II+l0B7TRLqZwiuq6
 a8+sWB22pAhZzz/2/rPrfJf2kaC5MFQpKo7yghbu8dw5MpLOUqSX2f7/xJQEzGG0Nr5juVO9hpU
 9e8u3p3ib97CiEyIEAd09b7EDr0zJw/2MWcyJxvvoOMtGdy1f+FNc32PIR/3lvO7Xt/qTsAk=
X-Gm-Gg: ASbGncv+rjiI3B+GM8AEuCvISwI0zYic/eTs8KST+qVQ+OsT52rrDwD7JwOApxez2Zp
 RLbNG3/BcRkMkdft/tvGrx29DAef2kDXssIP0veCJgVHVr+hrfm5483dvSmVa+UN5XVWqggmdgn
 xksaOzj3gN3OryFFvbn0Q2Q1MhSp9xVMlQ04ADwzpMaVzE0b2UIVXGDpzMn4A8IVxOlUIK36zT1
 eTFAy55+P5VmoMNi7OFByGiaqJo9v35jf5EEYka7ek8eIblUVTo+ZDhBehXzlPIyOviECR62sM7
 QMYiGP1JunAALni8RwTCYLsLSczTayVqi2ZUQjKiFIj/VySr2yLmZ3g6cmf38rLYhtE4eifazXp
 FG8ZUlXRrIz6dZCJKuxBgScFR
X-Received: by 2002:ad4:5e8f:0:b0:6f4:c15a:62d2 with SMTP id
 6a1803df08f44-6f8b0877c06mr210711506d6.20.1747652332491; 
 Mon, 19 May 2025 03:58:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrSoFENNThQFwHFQnIjtZ3G2QfxB92xA08zp06I/ajWbkOSz2fGe+TRkoQyETd6W9zuDBS9g==
X-Received: by 2002:ad4:5e8f:0:b0:6f4:c15a:62d2 with SMTP id
 6a1803df08f44-6f8b0877c06mr210711186d6.20.1747652332123; 
 Mon, 19 May 2025 03:58:52 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 03:58:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v7] drm/msm/dpu: allow sharing SSPP between planes
Date: Mon, 19 May 2025 13:58:36 +0300
Message-Id: <174637445761.1385605.4846218535199859363.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250426-dpu-share-sspp-v7-1-6f4c719e373c@oss.qualcomm.com>
References: <20250426-dpu-share-sspp-v7-1-6f4c719e373c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfX/w/7pcaHnWbf
 euZKAk0s1DBYprFPJK0m4ggY2Sg6Z/Nqg/jr+6YvFlcCRnSxG1qOIxVBswsBDzalcoM96mao0XH
 sh6AQAcHZzT0LGwZKuVw3douj7NW8Vi6Yu8J4yh2EL5RxMA3nQys+4qMqwmoYtkuh7AdA40wgRr
 L4jxLDBfYQ5T8nDfmlsDh0IunV70Iu1ftThbTeNPjrroKbPlhRqpMIw5zYp6CWn4TMg4amrcdbY
 VjBRqm2uP4FbPWhQAW8UO6+i0l267o5lYddOuS0k3vyISNAzs0alKo4DiFTIt8B1DQq0NNx2g6F
 0UpwST8YRQ8U9EbCFN2rF6OBP/NSwUel1ny+m6qFE/Tfsl7XT3ThyzqGuFFg4DjtMTXIAgj33bK
 kFK2Zoln+NQo2ITQ8FsQ4Y4AMAKPJ2nmOvwAKewNVbqyxOhXOMIteXA/EnJCRWeLePocNI60
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=682b0eed cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=-ylb_1dp-gWGt-a8D6MA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: oJ2FmahHphWFKy3lywV7fVpuuKtPGA0n
X-Proofpoint-ORIG-GUID: oJ2FmahHphWFKy3lywV7fVpuuKtPGA0n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=671 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190104
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


On Sat, 26 Apr 2025 07:51:17 +0300, Dmitry Baryshkov wrote:
> Since SmartDMA planes provide two rectangles, it is possible to use them
> to drive two different DRM planes, first plane getting the rect_0,
> another one using rect_1 of the same SSPP. The sharing algorithm is
> pretty simple, it requires that each of the planes can be driven by the
> single rectangle and only consecutive planes are considered.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: allow sharing SSPP between planes
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3ed12a3664b3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
