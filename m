Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F20B1AB7A90
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 02:28:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD6D10E0A9;
	Thu, 15 May 2025 00:28:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dx+XTGRP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1774910E76F
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 00:28:10 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EJ05Bg002700
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 00:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=B2cvFYkDiNTcJpepfH9pXulh
 1NUdq2hXaOLZdeTdJc0=; b=dx+XTGRPNXPEIu5UdnahImaAP9VxwgudhGUBxdiq
 XlXFf2qiIiJkkTg9mC132unm/Yrk/n1R7BzQA7obddC3YkWEXuT+Zz2URarbI69X
 BwNr9msMUNqwhAYtCUjkg1GTyUStZURsIJ05M//4lyrsptkS1AbUGLoAKseF15Yz
 ZSf1wuuYa2jsQfxTSqvQytTwGdwm9YZaAJ+Q9aafVrs5UeEVDaaFT/+xDWPhPVRo
 Fz6YV2b2vVBYEfftW8Co5ZSI2ncZWEUJSVCo3yiUy7cqk/d4/6JFAuyoqGxIX3qq
 +yl5SCcK9LWwtP7vLWEwq3B0ArnMkHVb32GPvzJ7JgEvfA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpcfcb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 00:28:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c793d573b2so54000285a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 17:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747268888; x=1747873688;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B2cvFYkDiNTcJpepfH9pXulh1NUdq2hXaOLZdeTdJc0=;
 b=s7TyziytC4PtnzAUWXlgAGQKPjXqdjXrDxy1cxGgvITguiBprsZnI2MQ8taGr3nvqW
 9cofwAch76Jz+6y/MZT9uDZ7P/8+QjxWOyR1ZlYsogl0fSNOk2Qyuw4N9aCnNZKbXKFh
 CM4dmvzWrDMmf94hzY/v315Dyd9oM7Knp3opzWyo8f/JC5Rdvw5E7lcVdv0+EfRd364u
 wyi6vmEa6/n7z8uAt4APMZZpf0kjuJwWs6hzzbNV5emavvjkYf5NqhA+0BMr6n/mN9QQ
 Ka7UrRlQH9Ud8n6O4K2jS7dlTVevQZ572sGHJtSoiaPJhetvvjNfJaELbV+fjX7CztaI
 wcVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZUCFpEgw3OtYWcWRlN1y56moMXUXckbSH2IOLt8AccsC6rs4SsKSGP/HHEUuknOF50tNs2sl2ioY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrYYyz0zjdkvkpuA/CLm43Y8T5IWxPFAvxTyjuo71mw2BiFqjI
 ILJY4d5ZSnGq6DJtxSdzIHmS4hejuayXCHcTMCBH7jCn6hvePHqf1U1chVDcHHyK3ELlycobhiW
 Uuja30scsnEk4HaI6MItfWKbmNIv5DBVD7rfuntaD+0vnoyOKBX2cgkwohrWMD7O2mJ4=
X-Gm-Gg: ASbGnct57elxpO48FlyHg3xmjj/xi3ZhYqYRIXW1yZ0SpWw2AANc3PhJOgqi9JSeBbh
 OgF3ZXBu2g441el0VYEUiH5B9Nsi5lUUKkL0TVKb5UAUusSIg2+n+llI/+6jHqrAYo+tyeicw1L
 vcPD9C+hIlhfnIU0/84y8lSLOhFII+jzFdrxNlRGtb4brQICUoGr6SzduUfrMnhhF4TuV6GwmFz
 9o5AynzmU0/EZfBeZqhQ5sVdo5I8jzqAUbsim7/4RYTu7UtCusL6PC+xmMqiGnitxQqZD0EOmyc
 Pa8XVPtbQfBs9qokWB3zdBl1r0baAgb8TbFmIjGfibDMkvxvmUfFO0VqpZ8x3WjCU2c13CpxgdY
 =
X-Received: by 2002:a05:620a:294f:b0:7ca:f65c:2032 with SMTP id
 af79cd13be357-7cd287df0e3mr755662985a.5.1747268887952; 
 Wed, 14 May 2025 17:28:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFt2xaXNowfMYXBT44y4aANaDgJRpOyGL+qTVAMGUeuxqwInoNRP+sTL7AzLDhnS1ZiX9uKoA==
X-Received: by 2002:a05:620a:294f:b0:7ca:f65c:2032 with SMTP id
 af79cd13be357-7cd287df0e3mr755660485a.5.1747268887560; 
 Wed, 14 May 2025 17:28:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc64b6f96sm2433950e87.142.2025.05.14.17.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 17:28:06 -0700 (PDT)
Date: Thu, 15 May 2025 03:28:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] drm/msm/dpu: Check mode against PINGPONG or DSC max
 width
Message-ID: <f2brfgvsnwqu5rudr32fkjx6qiuut2im546mjqrk2ouego4npx@g6avls6o7kws>
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
 <20250514-max-mixer-width-v1-3-c8ba0d9bb858@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-max-mixer-width-v1-3-c8ba0d9bb858@oss.qualcomm.com>
X-Proofpoint-GUID: _hH55YP4lrLSGuRRonU4BBwHCES6GWSA
X-Proofpoint-ORIG-GUID: _hH55YP4lrLSGuRRonU4BBwHCES6GWSA
X-Authority-Analysis: v=2.4 cv=cO7gskeN c=1 sm=1 tr=0 ts=68253519 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=s1QDowjoCeJB2mqXB6oA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDAwMiBTYWx0ZWRfXyofhURUiR5vR
 H6LkBZvFjSJQe19xZeHj9QImfJHXxWtm7mAxmvBydl4Vx3VCun+mRvgiiDPfXcBNX4ns5ub/zkT
 Cxsy0pGDhlgmTs7yh/9oKWJ1ZqgKVzT1GdjcDv+sx0JkgL1qlpy1Rj/iq/MKvrkBvN8AO6rLMKc
 3sVk28HjlDcjz4VeoQ3SCnj3h/8H9wGjmDs7XNAOSwFhzj/AMbF4CaS6iWgRLhQfraXauzbR2dO
 0MM4X/8t4sGY/CqQI9/yp0ObzqJhAYKiPke+iTANp/SACSXqUykKDVfblXTHOlgppTwQY2HMJ/Y
 snCXGGCkHyHvr0OyPHsc+GSBx2XSskt90jou9nmd0GEg9menokeBwRuL6ru3Lk+C1dwVa49nx0m
 MyG+ZlhJW1Q9DgDZyNFeLxNewzjL3zzLvlcPb1SZuMZCZK4YXivOmv3jUxBN/6XU+8KatZL8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_05,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150002
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

On Wed, May 14, 2025 at 04:52:31PM -0700, Jessica Zhang wrote:
> Validate requested mode and topology based on the PINGPONG or DSC encoder
> max width. In addition, drop MAX_HDISPLAY_SPLIT and base LM reservation
> off of PINGPONG or DSC encoder max width

Separate commit for num_lm, please.

> 
> As noted in the patch, while DPU 8.x+ supports a max linewidth of 8960
> for PINGPONG_0, there is some additional logic that needs to be added to
> the resource manager to specifically try and reserve PINGPONG_0 for
> modes that are greater than 5k.
> 
> Since this is out of the scope of this series, add a helper that will
> get the overall minimum PINGPONG max linewidth for a given chipset.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 46 +++++++++++++++++++++++++++-----
>  1 file changed, 39 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 0714936d8835..6131d071b051 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -723,6 +723,31 @@ void dpu_crtc_complete_commit(struct drm_crtc *crtc)
>  	_dpu_crtc_complete_flip(crtc);
>  }
>  
> +static int msm_display_get_max_pingpong_width(struct dpu_kms *dpu_kms)
> +{
> +	const struct dpu_pingpong_cfg *pingpong;
> +	u32 max_pingpong_width = dpu_kms->catalog->pingpong[0].max_linewidth;
> +
> +	/*
> +	 * Find the smallest overall PINGPONG max_linewidth in the catalog since
> +	 * max_linewidth can differ between PINGPONGs even within the same
> +	 * chipset.
> +	 *
> +	 * Note: While, for DPU 8.x+, PINGPONG_0 can technically support up to
> +	 * 8k resolutions, this requires reworking the RM to try to reserve
> +	 * PINGPONG_0 for modes greater than 5k.
> +	 *
> +	 * Once this additional logic is implemented, we can drop this helper
> +	 * and use the reserved PINGPONG's max_linewidth
> +	 */
> +	for (int i = 1; i < dpu_kms->catalog->pingpong_count; i++) {
> +		pingpong = &dpu_kms->catalog->pingpong[i];
> +		max_pingpong_width = min(max_pingpong_width, pingpong->max_linewidth);
> +	}

Since we are skipping PINGPONG_0, wouldn't it be enough to return
max_linewidth of PP_1 ?

I think, it would be easier to follow .max_dsc_encoder_width and store
.max_pingpong_linewidth in dpu_caps (and later add special
.max_pp0_linewidth).

> +
> +	return max_pingpong_width;
> +}
> +
>  static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
>  		struct drm_crtc_state *state)
>  {

-- 
With best wishes
Dmitry
