Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C08F3B293C8
	for <lists+dri-devel@lfdr.de>; Sun, 17 Aug 2025 17:18:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9388410E0C4;
	Sun, 17 Aug 2025 15:18:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NtXSiUtH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11EE710E0C4
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Aug 2025 15:18:06 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HBZGiI031797
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Aug 2025 15:18:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=DVtq03N2eWvCYxoFDoVCfdAv
 7zK0fqf0gHFxZ4lyj/E=; b=NtXSiUtHlgu86gRWOaeG2MIGJW1umoVM3jpGMIRe
 gm9UqHxvnfg3l0Zp4Wx5/ixylGwi3gPsl17vO7iVQCg9126+qoTkWdxklxIA1Mth
 vUgZ31FsqytD7DjwGMxoenBxaovRcJZcMJQ3Ou/APMyL42rsvq4xGAwIsar/72TP
 au6UP5rRZC0jl3SZMHWv1DQv5kwoeLdrI/FCdYFn/DFZSJReB5n8FmdGMgVaSXVf
 0V9XtNngQtjS4gL3bdzFZu/WwLiuwlOkGgnDAK/FDBTPHc2Wurj11Z+24ZbMqNEE
 foWvwxl0HTMLmlulYcQSNdGA16kjitW6hQuQTIQyx4A/jA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jjc7t76d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Aug 2025 15:18:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b109c4d944so88786381cf.3
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Aug 2025 08:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755443884; x=1756048684;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DVtq03N2eWvCYxoFDoVCfdAv7zK0fqf0gHFxZ4lyj/E=;
 b=wLMKrdyk1a8HLeVt+1Cc34TIbwVCLBAt7deGQizeTsoNI6Rl8nHYjlIxK26EgFuy/A
 BcbBZNrgyMJWvAVrye5r3+7ZuSm2RImzMasrp/bgD1rHnPf0tx4EEeam0srVNRwo1suO
 iDbDBc7P5Cb+v4KJcNdrySUq8FsERWulhSaYTjfb+ixDMu+eA3m8ZbbFKADaeKbHqh3Y
 JhfEl7SBjRgy9nvq+X7mEa2gXlh+sLtefenKXIdF8oVWFgPlwuvpuxzBdiOFjQaRMuZy
 H4WzgeNJeFHAszhJviL2RsnzPzAUTiBuCb1FhgeMRpKdqc9AEF8nHqtmwo9RNtCL/aM0
 S8lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNSYou4Clx2fGPK5ORtbhCxsp1OzcFUsV6Zb3aBsgIxZhxIvSEdYmHZxI5Akv/uJKHMhCqmrEnUVM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+7vIJxsZnRrvuLJCjnbsHyYisKWIFOs1SxLdpEAn8N5EbDU05
 bzL9JneLiJUCAwkmgh7s4awlcGu1DH5G5djKa1KI6P4MJPgwPJqDlUGIuWCVUwJFyIM9D328lJK
 mZU9UenB+1v2kJtN4QlGLTQaJEs6UVf4HWuO8SIWH6+G0Hk/gw3vaSlxubKvQxdzkDr8w87o=
X-Gm-Gg: ASbGnctG49/mSWFcKDLkNOK9u37ebjmdswVad6XLhiiaGiBF0cO62wQ7NkF6PT8Gw7v
 xbQiImuUeEgVIT0EVk56TRA1r0yRSeKpDte2k9ofTtpVZpXyOhRCmrRTQZr4Bbm+8z6PIdjXUMe
 /KxSgv2Irs2rPuPU9az74arFnTuXNKwKroBcsVdH+3ydKs2C+pJQaV3jFLifVBB28Lf/WNpQ+W4
 rGpxURwdHc7ebB3FRSuqybZjN6Kme3cZZdAkikQxm+R+3K6W9SR+NvXrIzv965YWQXxTcpnox29
 F5HU9FUSZBenT0b4OXcYxHmOsu4QS+3xdfHY95Ki/Cyq2mIPh2gqqI+t3XVtGYyObxheFA8t2qZ
 2k528hbS7614KnJcyLe2lXisAOe9RrmmJUHQXZ67SE9l4aZbdeR2c
X-Received: by 2002:a05:622a:903:b0:4b0:83b4:5965 with SMTP id
 d75a77b69052e-4b134078a61mr46289841cf.14.1755443884042; 
 Sun, 17 Aug 2025 08:18:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHltDHiuCeZCVwTwOe74kK1SRRwV/gj6QEhYgm9ibUJb+8rvx/XnMr2jEUmNikR+oL3wjFGZg==
X-Received: by 2002:a05:622a:903:b0:4b0:83b4:5965 with SMTP id
 d75a77b69052e-4b134078a61mr46289391cf.14.1755443883561; 
 Sun, 17 Aug 2025 08:18:03 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef351a15sm1267137e87.2.2025.08.17.08.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Aug 2025 08:18:02 -0700 (PDT)
Date: Sun, 17 Aug 2025 18:18:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
 chenjianmin@huawei.com, fengsheng5@huawei.com, libaihan@huawei.com,
 shenjian15@huawei.com, shaojijie@huawei.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 drm-dp 06/11] drm/hisilicon/hibmc: add dp mode valid
 check
Message-ID: <uvujumkyv7kkynuepwfmth4oveeiuwb7x4dbcouebkgigbxkyr@woz7syyedvwk>
References: <20250813094238.3722345-1-shiyongbang@huawei.com>
 <20250813094238.3722345-7-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813094238.3722345-7-shiyongbang@huawei.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMyBTYWx0ZWRfX5ATPo+KULl3F
 iAQPkY4+Bl9eYvR+V+qlFY4QgMTZrmfhZ4LRKTKrfG6hwGRwdbyTOyeUQDi+XwOcuA1qeP/iX4Y
 m6Hy9DTAgmyO/m+HTSiZHq9pYntfBOt9rRAwxKuS3PwtIJm3/yhzJw4GOkd69WeGlrYtRa1mvpC
 cni/rESurg+Dt5pPvZfsMkhorEO26Yb/6W21vOdB2qjXUpiX7Dq0Fprjtc28SDeOdFdIMl5wOqn
 /uEIqHg1aP4iPCHy+PC/ic/BuRyoWB0YOEaB0qVHggv/MP/25IQL/kQnB/ATcKEbY/lh8+IQUuF
 yGZqsl6EAGJ+9Ry5ZoEgqrwyQenv2DmGwFHBpY18W9KFkMVlDu1/F+M7zjiJDjw5qUFmBF0sFwr
 iHg15+Hd
X-Authority-Analysis: v=2.4 cv=c4mrQQ9l c=1 sm=1 tr=0 ts=68a1f2ac cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8 a=xc3yqRnLLWJKpjLMMokA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: XXHoSLTXFYfHtZZ3ggkY6snVQxgY0BkL
X-Proofpoint-ORIG-GUID: XXHoSLTXFYfHtZZ3ggkY6snVQxgY0BkL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-17_06,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160033
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

On Wed, Aug 13, 2025 at 05:42:33PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> If DP is connected, check the DP BW in mode_valid_ctx() to ensure
> that DP's link rate supports high-resolution data transmission.
> 
> Fixes: f9698f802e50 ("drm/hisilicon/hibmc: Restructuring the header dp_reg.h")
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v3 -> v4:
>   - Remove the clock check, suggested by Dmitry Baryshkov.
>   - ( I'll add them in next series after redesigning this part)
> ---
>  .../gpu/drm/hisilicon/hibmc/dp/dp_config.h    |  2 ++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    | 10 ++++++++++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  2 ++
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 19 +++++++++++++++++++
>  4 files changed, 33 insertions(+)
> 

This more or less matches what (some of) the other drivers do.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
