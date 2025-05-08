Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB48AAF856
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 12:47:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B86F10E36B;
	Thu,  8 May 2025 10:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gv/Kb+64";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A53010E37A
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 10:47:38 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5484X16C023383
 for <dri-devel@lists.freedesktop.org>; Thu, 8 May 2025 10:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=DJLcczpvmaxUKxKji1M3aDjS
 LMp22wqvdaaWQcNcABU=; b=Gv/Kb+648EnqCkbT8oiSS/nnHx4/i6ee1pUgaNmQ
 FnUjCk/UAGVjGYH+VGq/D25g+DQq0qKGlcFyPwANejgQf8y2UpnO8/UgdIKBKLS1
 aNytjGviDAntLa98J128KzbAgX0nDDcuJKdVacTi4UbTMa+c9gYx8ac6c43JnapP
 KozT/27PhRry8eHLRrBG2B90VDf1lG0SvYLz2qY+R8mAQBuFFBu/Uhoxlh20tF3s
 dWlzP2EdfoLOwoF7dLiuIQM/wLZ51WSrniBRSogGH/tKt3XWmyTbJOAaocLoJYIt
 NwWM4ZCfcXW1BbLRm//hlmW5SyCgvTk2Pu2lMwPzxU+VdQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp811xp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 08 May 2025 10:47:32 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f4b72d4ba0so17232266d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 May 2025 03:47:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746701251; x=1747306051;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DJLcczpvmaxUKxKji1M3aDjSLMp22wqvdaaWQcNcABU=;
 b=QlvkM8ufjZgoFEHOXkr0dHKwLsJI2zywQmzCaH4DoNgWo1g5MwgIDjbXT3D8EkdmeO
 crEwKCxG3gNfhL3kQyTsWqKWCt5K3NYjOuFQhrNSygHdqkg0MSHnKqLxG5m9UZZexOCV
 u4DLKPf+4oPU7kdYvKopruNTjft5aA99qkM8BaQYCLriOLYN6vO22w8QwKX0v0H5kI1k
 g3w9hghHZC0Q613ChL+lNDfeq44fKBXmIJgBZzhKL5FsARuBV33Fj9f5uo+BZ//GpabF
 47zc+3X8GWuVOuaeCgC8abJRCcHwnagaMq2hnuu7PRafIrOj6hzfBtX9cBH/7LJAPQPH
 Wq3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXev1qfjZDBiaCoXhcXFL1UFoBUBgFegD7FS972Wmu6oYm7P8mmq4Rai6wExmxWISOd7Ycfc9X09+Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzF59LYZ3nUHyeV7mJNeRDgj2LOLfZQ+zpxi1Gemr3u2+RVMv/u
 syW7bVoDiubRa+A7yqvgeH17DC0LgSwwaSikxIe956m/spqbRVrxQOx3wXgQgIalmxqtGsRclXp
 tv9Pvsr2dVG3A5DoyoUa0pxfY2Ol3gZ8nXmd/JFUYHPKaUwCf2G4kqceukHEYtpTuts8=
X-Gm-Gg: ASbGnctVOWb8CWxCJR5pdhyfo6yuekM5Sdmhv0SNVTx1B0xigSKexEPBcwMOugRFaii
 LkuAhBji7wF0MYh+47flxyQ9Uqg4bV8iWtqH/3jIHgRdIhCQMJLf2P26EfsUdrwusK/za53EPpG
 YaKiAc9M03RwC8VDJO9uAtht4Lsw/YGEsXpMz1sn3ZHcjC7Aq58yVU/5J/5IecQvCbmbzWOByAs
 a5BHXiIc+sgT9SFVby+Tleub4OtADcqZ65glyyh2K1g0aB8gwX4kMNZ+jgYz3c3LdEwo5PPomLk
 FNe0Q1I271Tfxadv9HRXU9wLK5LdGwWokzS6s4DYBU5vNrX1JDoCmWLEjpyEprWbla/LecRuW5Y
 =
X-Received: by 2002:a05:6214:2405:b0:6e8:9bcd:bba6 with SMTP id
 6a1803df08f44-6f5429e1f20mr112740536d6.7.1746701251165; 
 Thu, 08 May 2025 03:47:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHl4JUcuFrO/9rVeQzXi9JZCdORJB3CJB1i85DoLPVXTX/Y5q6n8b+WwBx6so7vshDBnZtiA==
X-Received: by 2002:a05:6214:2405:b0:6e8:9bcd:bba6 with SMTP id
 6a1803df08f44-6f5429e1f20mr112740036d6.7.1746701250806; 
 Thu, 08 May 2025 03:47:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94f21a8sm2573813e87.197.2025.05.08.03.47.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 03:47:29 -0700 (PDT)
Date: Thu, 8 May 2025 13:47:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 01/14] drm/atomic-helper: Add crtc check before
 checking plane
Message-ID: <b5kl5whmagpxn4saimkj4qloowh73xggehdh5rnl6lmjvqf65j@esycoi7w2nmp>
References: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
 <20250506-quad-pipe-upstream-v9-1-f7b273a8cc80@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506-quad-pipe-upstream-v9-1-f7b273a8cc80@linaro.org>
X-Authority-Analysis: v=2.4 cv=M7xNKzws c=1 sm=1 tr=0 ts=681c8bc4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EgBjQOAtpNY6-goZWe0A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 6wYFPX74vBkOBljQWxzTQ5szfDgzMO8W
X-Proofpoint-GUID: 6wYFPX74vBkOBljQWxzTQ5szfDgzMO8W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDA5MyBTYWx0ZWRfX+LKNB/szzOpG
 FmNx1W7vTqg74Bn5Un3l0k0oBzkkV5P8QT2Wed/14ngwSk4/xaTeJNHSkz56Ucu3CPLleL927ce
 nBZDL5vCpriTTOrs2U0Oo1rmlStkVRmZIdjhRZcoDgZWrZDaVS6fUcPf83GSkb+EycO0xKoABDy
 Yq1LoAcoy76Fo6JuEtJjx3d8X9Mj+n4JhUfJhmoAY5+xxZd6TkntvzhzZkrzwAsr8CX+40fqTQt
 JfDjGXZUbkn3I1FOHqKtcASbuzV3RYlyotkFvmGb9OTkfMAPnVUjPOh/D0gxT/5Xx5jyaxRQ/oI
 e+Y5JPWQKcnnzCFtbpR1T5livc6+njoFswkAKTOcbVSxQh/Bc79qU07cVUccr2pG9e9R6UyXIEk
 2Xra2ZVEU7qVbP9V1zOr4awbyaTm7QJIL1SSAoDdnrjyaa/r7+lHXZAvb/rWi+rTYN5RHpty
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_03,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 spamscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080093
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

On Tue, May 06, 2025 at 11:47:31PM +0800, Jun Nie wrote:
> Some display controller support flexible CRTC and DMA, such as the display
> controllers in snapdragon SoCs. CRTC can be implemented with several mixers
> in parallel, and plane fetching can be implemented with several DMA under
> umberala of a virtual drm plane.
> 
> The mixer number is decided per panel resolution and clock rate constrain
> first, which happens in CRTC side. Then plane is split per mixer number
> and configure DMA accordingly.

Here you are describing a behaviour of one particular driver as a reason
to change the framework.

> 
> To support such forthcoming usage case, CRTC checking shall happen before
> checking plane. Add the checking in the drm_atomic_helper_check_modeset().

So, now drivers will get two calls to atomic_check(), one coming in
circumstances which were not expected by the drivers before. Are you
sure that this won't break anything?

> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 5302ab3248985d3e0a47e40fd3deb7ad0d9f775b..5bca4c9683838c38574c8cb7c0bc9d57960314fe 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -816,6 +816,25 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
>  			return ret;
>  	}
>  
> +	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
> +		const struct drm_crtc_helper_funcs *funcs;
> +
> +		funcs = crtc->helper_private;
> +
> +		if (!funcs || !funcs->atomic_check)
> +			continue;
> +
> +		ret = funcs->atomic_check(crtc, state);
> +		if (ret) {
> +			drm_dbg_atomic(crtc->dev,
> +				       "[CRTC:%d:%s] atomic driver check failed\n",
> +				       crtc->base.id, crtc->name);
> +			return ret;
> +		}
> +	}
> +
> +
> +

Too many empty lines. But the main quesiton is: why are you calling it
before mode_valid()? According to your description a better place would
be in drm_atomic_helper_check_planes().

>  	ret = mode_valid(state);
>  	if (ret)
>  		return ret;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
