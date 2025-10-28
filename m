Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3A1C16072
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 18:02:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 446BB10E613;
	Tue, 28 Oct 2025 17:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="O5WeeqEg";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WQZm+hEB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A98310E619
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 17:02:45 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SEnoWd1886811
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 17:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=cxkp5uN1hgEm1U7CQUVNW25h
 7bex2SPSJGWvI/3+x5g=; b=O5WeeqEgym/Ed2fgGBQMV6HSxphMhBfeNluJHd1n
 YEfHstEthnB/DoPpsTjyRIiu7yldRCJRYfWemRT/RMH9gtf0tVNsP/tAXpt+5iQh
 hwktCzhnbuYqw+zjjS5OGwp9l8GhWImoC7Du3RAPAvCgGMh++TzymCbLvQ9P/JQ5
 aSFvcfJlBFQM2gEDnxsW6ff/lNqaNaJNhv3CiDTQ47cbi+VZslZ/r7obTzZpN9iU
 qk3P9N7WZUBUkNUPZU+3+xuGdxx3+yTZzgVwfGICkeaz2KfO+gWwMRqbB0C6KRWJ
 AMhsWaVNvtEggSym9aXFtPjW9op3o80FLZ+yK5tdocunEw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2njrtf0x-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 17:02:44 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id
 71dfb90a1353d-54a7d8436a4so4048431e0c.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 10:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761670964; x=1762275764;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cxkp5uN1hgEm1U7CQUVNW25h7bex2SPSJGWvI/3+x5g=;
 b=WQZm+hEBhXPs1B9qDaaI3uj93nWq+EfQH/6kJAOjRHmMDLUTKnn4EodL7KP3YOX1C/
 emmnRgp08bxfd/JlNMVX9M3fPi1sb0F6Izk/tQa+wi75u+ftkG5ZI6nExHcb86CWbaKW
 I6oY4raEmHsi07h6J42qr8i+7S1mE87HvJVJzZ5waMkUU7o9yC9OJJMS/JG1o+QlPPDP
 4qSDjA5/c4Tsb346kzLX1PyZqOoc5ONPN7qIoF8c0i1Jkwo1Xlh20Z0Gw/GTNpuwjVjN
 cyGLuCwfksxZWbfYXzVzrX3k/GZ+47DfLhNlQ/XKOp4pa5Q+T4EUKttk1i4a1jCfF0jJ
 xfuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761670964; x=1762275764;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cxkp5uN1hgEm1U7CQUVNW25h7bex2SPSJGWvI/3+x5g=;
 b=kDFJL0TH7eaeTBQd+nG2f4id96n1zoVB2qc4bTZFn33bH97M/KPGPVovuywDqsQR6L
 XHMcZVxwK6is+S8bLZ5EYKvqjCgkU+yAgJ9wgR3fDFNjcvKQSHv6BV/1mnWGef6hxWB1
 4CKEf/g8cfUeo3csTRMQY03cQLQiJpjoi+K4+vVTbwhFySagOTd5ZukHAvntb+NM7tC7
 KFI7EehORmjwH6qG4YKzu729EafrHpaMK9Blmgx0Dt+nU4MdVsQ1UD8o00yK43jDlYRh
 Iy2TWwGw2u4pXbUtIHS00mQ8uCrJZB/apNp5kirAv+CF4jfPvL6g56FXayeoGfy+wr6B
 UHMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNj2Rn19Mexrb9MaeywSrubVD7b3T3BkZJQJ3ppqRltMoBQT0DwGvPzRK92PZjGK3StzdDbnhG5k0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzweHtzM4VWxLyqB30SXqgw+c/qVONt2BmUZKE86pSIqlMttax5
 6xWLmrqOc8YJbbmYT0PUBSNXvRQKY63bek06ExTQKL+vqkJWZRakGpmndEq77/B44+Kq39I3Luz
 LsQEvzXahRK9TAch7g3LeDsDkJEeuaoDPvOWSTOVAIqGaFknp7TsH/AbDviFSwMU1WnVZ6qE=
X-Gm-Gg: ASbGncsG/9iqbuZ+UOe1Oov0p72kvMX6RHP1vf2zdMcez/vaGmGcV7GDUbzjITDoUaY
 RhYlVBERIpwS19iMjpydBu3SwWfnBe2JtSj1VaP9Lz3NkAXVkTH++NccI+uNUHYITHgx3BTXaAw
 /KnnaGfM4qooYs08q42lOFOwk7xYZWYBpu7gVbT964hhGG8KnwkjY5ZpPkp6KxS2rPQ26a73Otd
 hJjM+zDZERJPsSvoVANAlFsfVbTBcApPvJ9F0a8qIgr2CiWvh4ShgzVtgYpN2ukyfGPLHdXDj4+
 mgRcJgq3lLf+EFAM873OWS4Zxxfg/3SYXgfyKN9AnNyQHrn7yuQtDYeKCXkqtP11p4HGyhzYgys
 vag76MFQNUSYmT/f4m9Lg28PrQGAcOkV8cCcufLn4YErRdzWIODEMLsOSxl2ZpSee7M49iwYLzq
 vJu/V4yaWgRB1J
X-Received: by 2002:a05:6123:2eb:b0:544:c8bf:6504 with SMTP id
 71dfb90a1353d-55812a5716dmr211451e0c.12.1761670959941; 
 Tue, 28 Oct 2025 10:02:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFylu7+GWulmg8QmGwQJyndA+hF5O5s0KQz/TRjUhN57ySnCjdNwxNX2a1vWTcx0/uWdHcc3A==
X-Received: by 2002:a05:6123:2eb:b0:544:c8bf:6504 with SMTP id
 71dfb90a1353d-55812a5716dmr210602e0c.12.1761670952807; 
 Tue, 28 Oct 2025 10:02:32 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-378ee0c61a7sm26970681fa.28.2025.10.28.10.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 10:02:31 -0700 (PDT)
Date: Tue, 28 Oct 2025 19:02:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Teguh Sobirin <teguh@sobir.in>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Set vsync source irrespective of mdp top
 support
Message-ID: <ukz4djjytsne3y2w3epkdc7gzegmeeijpcqblvftcx73ccs43p@es6b4ew4nrzx>
References: <TYUPR06MB6099CBBE5090DB12A2C187E3DDFDA@TYUPR06MB6099.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYUPR06MB6099CBBE5090DB12A2C187E3DDFDA@TYUPR06MB6099.apcprd06.prod.outlook.com>
X-Authority-Analysis: v=2.4 cv=dqvWylg4 c=1 sm=1 tr=0 ts=6900f734 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=DMwz6m7ubag84I2EhSAA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: cnsZGCUJbpJ3KMJhROBgGmYcsLRs--x6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE0NSBTYWx0ZWRfX2yitYES6HJRK
 NlEYtKWpWZsi8xLKIv4BANwuqaSJIrjFBiDDN5gyI/iyYuY7AnvcLDKeQNNavtA1Rso/r+cuhiZ
 s0UoCWXJIBf1Ru3iKJnlbFu9NJlONdlPUESKIHRMRX7RLvgABFLzhnMDqJAuLtPn/2lBqB2Wy3c
 +IQAuFDl7Ur9z0zYW04ffLVWKtf1tLnQjDHrNrIQ6twkIfdpYaSLlY/h8uPzSlIHcSf4r3ARMo1
 iQNLp4FXtHzXFWq89cma0lZQoh6KjHstyk2qiItULA5OXJelvNl+MzJEhdX3iChKBun4Ix6PgQF
 j9pQm1w84DYWdL4Z58J/zC9K2eX86oVAhqCraZb29kmgPolO2XWLbdOam4h59CvRMxIW9pvuKBf
 9D+UZgTFuenyce/bUd39Fm/fokJC9A==
X-Proofpoint-ORIG-GUID: cnsZGCUJbpJ3KMJhROBgGmYcsLRs--x6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_06,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510280145
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

On Tue, Oct 28, 2025 at 08:36:35PM +0800, Teguh Sobirin wrote:
> Move the loop over phys_encs outside the
> hw_mdptop->ops.setup_vsync_source block.
> This way, vsync_sel() is called for each interface.
> 
> This change ensures TE vsync selection works
> even if setup_vsync_source is not implemented.

Please see Documentation/processs/submitting-patches.rst. Don't describe
the change and pleasw wrap the commit message on 72-75 chars boundary.

I can suggest something like this:

Since DPU 5.x the vsync source TE setup is split between MDP TOP and
INTF blocks.  Currently all code to setup vsync_source is only exectued
if MDP TOP implements the setup_vsync_source() callback. However on
DPU >= 8.x this callback is not implemented, making DPU driver skip all
vsync setup. Move the INTF part out of this condition, letting DPU
driver to setup TE vsync selection on all new DPU devices.

The patch itself looks good to me.

> 
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 22 +++++++++------------
>  1 file changed, 9 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 258edaa18fc0..f36c5c7924a3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -784,24 +784,20 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
>  		return;
>  	}
>  
> +	/* Set vsync source irrespective of mdp top support */
> +	vsync_cfg.vsync_source = disp_info->vsync_source;
> +
>  	if (hw_mdptop->ops.setup_vsync_source) {
>  		for (i = 0; i < dpu_enc->num_phys_encs; i++)
>  			vsync_cfg.ppnumber[i] = dpu_enc->hw_pp[i]->idx;
> +	}
>  
> -		vsync_cfg.pp_count = dpu_enc->num_phys_encs;
> -		vsync_cfg.frame_rate = drm_mode_vrefresh(&dpu_enc->base.crtc->state->adjusted_mode);
> -
> -		vsync_cfg.vsync_source = disp_info->vsync_source;
> -
> -		hw_mdptop->ops.setup_vsync_source(hw_mdptop, &vsync_cfg);
> -
> -		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> -			phys_enc = dpu_enc->phys_encs[i];
> +	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> +		phys_enc = dpu_enc->phys_encs[i];
>  
> -			if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
> -				phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
> -						vsync_cfg.vsync_source);
> -		}
> +		if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
> +			phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
> +					vsync_cfg.vsync_source);
>  	}
>  }
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
