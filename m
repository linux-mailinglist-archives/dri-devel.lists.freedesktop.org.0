Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DA7AFA0B7
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 17:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E23010E240;
	Sat,  5 Jul 2025 15:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oVwHtiv+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2269210E240
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jul 2025 15:45:54 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565E0qP9008800
 for <dri-devel@lists.freedesktop.org>; Sat, 5 Jul 2025 15:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/5hl31AIup9VcraO0H5GHnK0
 /OM1c1STFA2QallXhVg=; b=oVwHtiv+ZtmLyH5r/aP03VJeVWYz+DFWjDG1czY/
 9KBg9HLOiGtVpCvd/dK705+COHYSSVEOkRDuhNk/pFwVWNuJR3Y+9sYEiBdcKDKc
 iDBbWKTFABQGp0XBTsyxL+yUFz5TydLBujRf/h4njil6v//vtoNm9cL+4Uytxm10
 vzr+GC73C7v4J3W0AcCwfEQOfGRcuRYkuRpNDw0CUMT5IYOtezbed90gXXIv103A
 wwi5prH0ZocjumEokBJSmqadyn70E+0tPN3xzLeAYFsXZKpGo59pqRs/1sHjjeW0
 NUF/kcrQiUEhz9dkKQ1yZ9Biz6PDaRbrLmty50DfQKJupA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pveesc0c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 15:45:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c7c30d8986so522743185a.2
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 08:45:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751730352; x=1752335152;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/5hl31AIup9VcraO0H5GHnK0/OM1c1STFA2QallXhVg=;
 b=tcnSGTxEkiH/rrQtMF+piyjFiREpZM6AMX6BGwYTJfNd77yU1Qc6V8rsqf3j0gw4m+
 jQXW68w9kGphgI6d12pFi6UeyxMirapEuSfyG944hckTO4KDwzV8L4TrWGrxosAVCcUb
 NgPrYknUrB/HBsvFSTV+4mL+6yD6lOz5fyBQYnVzsHRm1ydbD1vksLoMQ8vhZkEY6XO9
 LJ+a2gIUEZru9gZ4E4HJVhK3U5Ib53M6sUoxeuDk5Pzj247/NRTZXcW/WDm1qd8UnsN9
 oobbK0auFfOpIIrelXEoFCelduofQqAlQedZsEp50QfT6nWApwzlDICZppzeAw2V3Ybb
 QHjQ==
X-Gm-Message-State: AOJu0YzR8NloMzhDMHqEnAtuOSEKFEpxwX66g6tT1LtoAGKcqLUmRLOL
 GtBj6mP3j2SG+WbUCIkqWL5urksDkDo78OHNcngBHPh60xI837A4pibvWyq5R2LMB1XtM5J3wOq
 74S6yy7YU9NofY/RTxboApD70ZytuOFN3Vj526FP418GbMnkqNsI7Jg7DD/lH1H5Nj8ie73w=
X-Gm-Gg: ASbGncvzHQQibaRgs3N0SFdOWaxmZWhKBEaxHSFAxVONSSb1VOvHcPSE8g9zDMTfuwd
 dQjodCQMogQfemEIgTL9GMVMOlasoJYfisUFAT/dDQLkJljVodUJP9DTPdYjC3pyIaSAksRPp5J
 Qs72saifJbuZ/LCrx5DoC4vRrUS97S+aXUFD17BUvhz+P8simCHvz+LwmFa0APtfSDcULcAiIHD
 nqdEmqEWpowmP1yduBOJfbtMRgZnimso4CSq+S4vuY+rr7TW6HIRXr15MqjaOut6pC6KjjQODJX
 y0t17qaUtdzGg6oFDdqmqPqOb8StSk0rsCjonJeB5eI1DyryT7hupYcfwbxsOPSc4DyAPUx2ZZt
 vhmNgQjSp6s/CF4TiOP5qFn0MEmujbrtVfjc=
X-Received: by 2002:a05:620a:31a9:b0:7d5:dce5:86f4 with SMTP id
 af79cd13be357-7d5ef3ea581mr460740885a.9.1751730352392; 
 Sat, 05 Jul 2025 08:45:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhdyY0C1qvB2PcFY3D1k6Eue1Nah+mBAYGZ3JSrRq66wBkfF8pUORakrJC05vzG4Q4M4ELeA==
X-Received: by 2002:a05:620a:31a9:b0:7d5:dce5:86f4 with SMTP id
 af79cd13be357-7d5ef3ea581mr460736985a.9.1751730351976; 
 Sat, 05 Jul 2025 08:45:51 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-556383d906asm621676e87.81.2025.07.05.08.45.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jul 2025 08:45:51 -0700 (PDT)
Date: Sat, 5 Jul 2025 18:45:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] drm/msm: Clean up split driver features
Message-ID: <kr7rjmo76av2mbobsgixhgdskak7nllsxghu2slmt6au3icm7x@japd67zoef77>
References: <20250705145242.781821-1-robin.clark@oss.qualcomm.com>
 <20250705145242.781821-2-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250705145242.781821-2-robin.clark@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDEwNCBTYWx0ZWRfX3jN+Mmg0dT5J
 4I7mdRdUquLDQLhd6u01uK56Mh+RJr6TVDykUf687BT2EOXR2pEb/btdhZR8LWGCw3K4dh+/XEq
 aEsEQmpcoVDkSLG4tfRGrz0+MNhLD87Xm/n7LSvXqflVdvq8BYPpWHYqmhwWWTvSzH/OA6sqlRk
 SisPf4Dat9SV7ZBu7ejs9St8ZpQF93NrvSu/c1LRlpAvPTLxn15mbk1LMicM12PzsCf7kBk4470
 xBDGolDgR7bUBR+AZEklg5SypVm7s9pi7wjazPS36AQjc4bsuFhDNmPS6s8UoJVBbw/YWtR6TQw
 GTCpKjF6IP6efG3DPXxgKW67st7/LpgiAW1QXEltdn39i8RhHn05kAhXD3oLMCmbDXyvYvWluiA
 2BHTZdrVfwjhQGLhUxtboCJEkV0GZw5G1sueuuVx/8xGC3WvDmPPNFErITltc3RbxtbPH+En
X-Authority-Analysis: v=2.4 cv=dciA3WXe c=1 sm=1 tr=0 ts=686948b1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=YF7ZKVCZQUMDimIUfr8A:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Hg9IKlHb0MXgoW8Js1rbHET1kozD3iET
X-Proofpoint-ORIG-GUID: Hg9IKlHb0MXgoW8Js1rbHET1kozD3iET
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxscore=0 mlxlogscore=957 bulkscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050104
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

On Sat, Jul 05, 2025 at 07:52:40AM -0700, Rob Clark wrote:
> Avoid the possibility of missing features between the split and unified
> drm driver cases by defining DRIVER_FEATURES_GPU / KMS and using those
> in the drm_driver initializations.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 31 ++++++++++++++++---------------
>  1 file changed, 16 insertions(+), 15 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
