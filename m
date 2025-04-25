Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD81A9D120
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 21:07:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 181A210E994;
	Fri, 25 Apr 2025 19:07:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="S6TV0Lox";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E77C10E994
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 19:07:18 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJtCZ001322
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 19:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=YJbYuN2gJ/vLBVO+7ggEakIk
 yWo8fYN/fU1HKulgY6I=; b=S6TV0LoxN9Hg9UrUvaO+4Ci803NRAtkxU5Vfo6rY
 80rUfOdGhN1a9MfOxX87Am9700jbKmaBiTQTkA1uXadpqDCPb5QEgrdrERyRE9NB
 SMy3ULr6tezjisWlIiL+16hKKbxqPD2abNFbLi2n0s0qarzJsOVtpMgVB+TsjBmP
 4Lqc0a3p1Dv3ErRpy7pLTi/qBB/3XEOo8nL08zhNKHi1+sYkCMvjvrsQrmCbjH+5
 Uv5t3NKkQuino53SK5SE95mkEhprXs2L6YY+bsOxQu4TmkFNHeXYezhbVFYIfcxe
 lW7ZjJZR1vPgn0+QNr1XW8EFcyOOOYZiLYqXy3nUMGBABw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3j36s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 19:07:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c7c30d8986so724845285a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 12:07:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745608037; x=1746212837;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YJbYuN2gJ/vLBVO+7ggEakIkyWo8fYN/fU1HKulgY6I=;
 b=HAVkOALdsv0SN6j1JBV4gnAo+j6ssc9a/Gb/AUVGKXt84rft9XYFIILsFd+BYjZ6aI
 k2v9LNPAnz2aUsgp23omqGROJkNTZqlzgUYpQ3vJFq/RQxJUhfmMDtX+U8RIEfMxLOPx
 MW8dkBOyetVIUc4JvQ7ywzpyvPhA/oAS9IQBHYc11FORl6oxsNQcWtTa0ZmEkQGLel60
 D+SBWzV5tY0xqFTyGSSJYMOJVKn6pDTT+g2gSukN7EiCtBzPW2K8AV+ngIbvtmniCb30
 tgCJ9QfJBRdOcNq1r06+Hsq2LYOuyeyMp0tC8PmPlTALbXNQAxwx+klOzz4SzdaULHfG
 UEDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7oZpZ2RwOEZ7gcrD2qy/ZrH5HRJPN4lc+DYfStc8LBZlNkUhvdjVo9fdt2bfdO7BwEfk/NKCLkHA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxP0bIa4WxaJR79x8oJ3ZUS2ZcW5uY6AXHwRhnDUpQQlL0Xbs3s
 /ziUGVKyUkPBc9Kb6UGfT1alEgo4b8eQ5//GH09RfofGcppwVtWsew0Puf3aV4V5As2o3uqhIY7
 Oyevhe3XBJpfu/9Echsr+xbUCDSQUbVn3IClF6CesgwJSZNHCbveYG+pfoq+BXShljOI=
X-Gm-Gg: ASbGnctHHcrVv/AetElprb+vbRZ+Xletz2KEH02NSc/SWIenZWLSGbC0LGiPb8y4uEY
 UZ6/+RWRk+Lpri3VP/yHMi/oRMCFi80wYT/TanTuAYY3ZrLWZMZWtU43h4wGe/K2zfo3ygxpobd
 hRY4uBZGhbs/ZZuKpkdKYc8KyoJlVikIooMh9xwo6GHny8cff7rM6jGEnPtyRjKygXpWewwI3D5
 VnGofaW8lpr9evwrHg2Pe+hAKrxfb/HFmNcr8k4FjC3AR91H6vIcRttGFqYLpgNQTBVPYJDmgXb
 FctqX6Z/4cgYLYmS3NXQy/9gU+8KRNtAoyP34z2FPM82bzrIEUf8xiEzOukv/plhTik1yYMXB7s
 =
X-Received: by 2002:a05:620a:4609:b0:7c5:6a66:5c1e with SMTP id
 af79cd13be357-7c9668cdc37mr115703085a.58.1745608036766; 
 Fri, 25 Apr 2025 12:07:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfsamSTL36MZXKs1A+xdmyxqbS+5Cgy4qJPLYj7dmxRhp/lz8rumoOXUYE90g5yOpO1ztFkQ==
X-Received: by 2002:a05:620a:4609:b0:7c5:6a66:5c1e with SMTP id
 af79cd13be357-7c9668cdc37mr115698685a.58.1745608036439; 
 Fri, 25 Apr 2025 12:07:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7ccb83b5sm712379e87.245.2025.04.25.12.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 12:07:15 -0700 (PDT)
Date: Fri, 25 Apr 2025 22:07:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com, abel.vesa@linaro.org, johan@kernel.org,
 Stefan Schmidt <stefan.schmidt@linaro.org>
Subject: Re: [PATCH v3 4/4] drm/msm/dp: Introduce link training per-segment
 for LTTPRs
Message-ID: <zb5fqcnersry6blohozlzc3f2it2q6ypi4xei3z2fvzp5ogszj@mj23wsa64nqi>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <20250417021349.148911-5-alex.vinarskis@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417021349.148911-5-alex.vinarskis@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzNSBTYWx0ZWRfX+te288zdvKVZ
 yjJzWE/w51z09+b9DC7obEC+EQuTUmX8CQtpDZXfQo4yTjI4jMgCe2pkL2v30u4WWmcv8SpcLMf
 yW+e9Sh6MovQ4uzzurZTMPm2fc6VNKlB9pim5QhAavAVLju7sYveOX9soP/qi7tElTtK1twFdRb
 J271KYsAp60EcYVyppU0wHEnYM46+PpXqRLqR/pa7AEF8Jg8YdSkIBKs2b19fobwmKE52Qrn3dd
 uDUPA8Vunr2Xar0MiA1+vVfKroF76Fq5EbpqbOrUWHjkPT4NU0ViuNE0ryrndT9FbMH+CJ7SAC/
 FmmQUdlnCxRSaJxk76q/9mQvOCfBDAXp6C6kKGsdM24llRjsy3GKcnMs6M4hGXbP2qJulSFNmgX
 5zxWR63tNyktcYqK9cVg9AT72hVBGvztUwYGBiRL8dxTMXVCrl1um05w162Jtywy1STS8s7i
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=680bdd66 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=GOLd5LZXdg2kOnOye_0A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: nELZbpprLUbxw09_Ll2crPQmIEZqaDaW
X-Proofpoint-GUID: nELZbpprLUbxw09_Ll2crPQmIEZqaDaW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250135
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

On Thu, Apr 17, 2025 at 04:10:35AM +0200, Aleksandrs Vinarskis wrote:
> DisplayPort requires per-segment link training when LTTPR are switched
> to non-transparent mode, starting with LTTPR closest to the source.
> Only when each segment is trained individually, source can link train
> to sink.
> 
> Implement per-segment link traning when LTTPR(s) are detected, to
> support external docking stations. On higher level, changes are:
> 
> * Pass phy being trained down to all required helpers
> * Run CR, EQ link training per phy
> * Set voltage swing, pre-emphasis levels per phy
> 
> This ensures successful link training both when connected directly to
> the monitor (single LTTPR onboard most X1E laptops) and via the docking
> station (at least two LTTPRs).
> 
> Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org>
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 126 ++++++++++++++++++++++---------
>  1 file changed, 89 insertions(+), 37 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
