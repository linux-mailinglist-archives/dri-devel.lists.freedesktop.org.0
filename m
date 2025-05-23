Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C07AC1EAB
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 10:30:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7050310E7A7;
	Fri, 23 May 2025 08:30:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KpHJpQN0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D8F410E7A9
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 08:30:09 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N5SxKf029164
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 08:30:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=VfiheIwlbsPSX3tKRqcUN7oc
 TCW0r9qBhyKUU/kzcNM=; b=KpHJpQN0dwtJLO+HTWzFKrFnk7bx+iSwn8bK+dSQ
 OcDSzPCmLUMrm/kv9g/5xyF0sMhlh7fYHwVBpNLpRtNlXPqjfnzO2V7n7/shn76n
 H+1+qDbvv7oTE12vRufyynS784yTKkqgKG3HYryJHeGvRlw6VpH29+fp5d6v2mh+
 O0EljvCWr36c4t6relmE6w4GeExam1CEKbOEzDi2Vv2gXldPFq+aLeAFJRke+mBQ
 wi4GT93K8pVkXpt80tvRVnaalOgvdiYPtKD4WUzq3WLp8LDuhgYoZIqJPy7cXJB0
 SOeAYJIab+0mlin0k1dpH1a8nO9fBiWQkDml+gGCajTHSw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf49db7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 08:30:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5c82c6d72so1566968885a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 01:30:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747989002; x=1748593802;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VfiheIwlbsPSX3tKRqcUN7ocTCW0r9qBhyKUU/kzcNM=;
 b=Lr/6Boiik/+8+qq8NGyXXS/LfpgrHLpNobZKsi9m8P9PK4KqNHjtlU3fDv15IRvBZZ
 +hp4dtvkJjvTwgfh1fhJ1aQXrPOxgJBT2XyHp9ny1ZWHHgT0mgxwjyFJdHusWv9vTWIm
 P/6z1WSVq0n9UL2knYAu4Grd6eJmzamphyCqUBHt489SPpwx0frzA8Og2zXrc8BZ2dxb
 eUhLBmrFHHkT86pO7sH7lcbOEOACvFkqRqxJy1Ror4alSnd5PbsbOQuu4FlGqQuOXV2+
 lgJT9/LM1QK0dMAA1hsiRdmFuZgk0AwbXWuDNIJnp+w2xWLn93cZ9vUpcELRQA101faX
 90NA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvFphc3onrpf5WQZL3BgC180ZQzlC/8hu989NOZnSjJwkAk7eqBRWhdjk9SenKGtZYFbq33zv/D0s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLipuY0Jiel9pm1gLu2PlG/pqezufzvpY/2dChac6Ii+sNZSNK
 V1TwlNQcyFNpxFFw3fmE3JwrXK0gUn4x71UFVxbny47EcJNqajhoReIIH3anzpGaVE0zmFqUe39
 nxSTripzbAIgmM/H/ozq3gv0QzIVI30p4i/nEUoPiPys6ZQS23jDKtxjmWg+Ksg6SF+cPwPM=
X-Gm-Gg: ASbGncuexO9VJ5fcdXxlkgwAUkXh/1/gtK6W/qGG4hoNxiI7htl/xaftCNWPkrXwoY6
 VQYYVUZqADlBHmgdikAN8BuaqDX5nZMBnVK6jf3Gievh7yib45jiXTHpJvWPbGdfo34En9O6f7N
 iGKGdDuxNc0oGnGzg/kZt/z5EGYyfCPagARE274o38B70+t9TrR/EHq4ndNncodL9Jhvmvc9obQ
 hJxAkNXracG5jmVnkIf0bLBSFjpMnwJVpIRorWk7+M/BBtUbf0UhcQE3q6HCd9UGXxdSa4nUGJ4
 /XfV68mA5i9txcXh15cp3m1cj7zVJ7u2FBcFzB2nDbssh+OQvrHBRYJW8MUNJChfBHlml0zeJos
 =
X-Received: by 2002:a05:6214:2aa1:b0:6e8:fbb7:675b with SMTP id
 6a1803df08f44-6fa93aa463fmr35204516d6.32.1747989002045; 
 Fri, 23 May 2025 01:30:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQTPt4MTIbkICZvOrh1skICymAaWmqgOHvMqVvofwa6vGpCOsSPPMr6URNTP7Fxd27LeFefg==
X-Received: by 2002:a05:6214:2aa1:b0:6e8:fbb7:675b with SMTP id
 6a1803df08f44-6fa93aa463fmr35204156d6.32.1747989001635; 
 Fri, 23 May 2025 01:30:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-551faf6be77sm1933997e87.84.2025.05.23.01.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 01:30:00 -0700 (PDT)
Date: Fri, 23 May 2025 11:29:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v5 21/24] drm/msm/dpu: Implement 10-bit color alpha for
 v12.0 DPU
Message-ID: <dlkrweid62i6jz3iexahbludm32hppzen2odjx27sxfe6opt5c@zqnryzjpzqoe>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-21-8cab30c3e4df@linaro.org>
 <aDAbxAnCN1lGGcGH@linaro.org> <aDAdax7xdeDsvQHB@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDAdax7xdeDsvQHB@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA3NyBTYWx0ZWRfX+PKtlLDBJwn9
 qY95QvXactUB6wPBrO4z9K6Ft84/t63Hl/OyfSlsGTcJeEmgaElCC6YYegNpM/1eNfN594mtD6C
 BxEne8tEqPHEWXsYSUi/A96nEcxiisRQLruOhZaVqHTTup9YYqlnaKkNHvqr1SUfdFiSI4m06cA
 HSoHJtXEEgdqI1HTsTvALB0u4Pu/obu/t4C3Saaz7lSu7e5czMP9ga3idICdLi3SI/LyhG0wPD6
 A/Ffk0Dc/Vbe+inUGBLixcdx97CadauGvefU/wEQoFSAFcmB59/w/+W2cTLqaS1BV7AuqLpl4DF
 iwXGDvKAa/EXL+WrCD+OU0a+yRN4T1NO09dzN/2IzGzYtQcobdI6I3o6sc5G8geXyRGFv0wd5eO
 IyM0LKAz6pZxMmmawAMZFqKAiwMUIzHV7nHmRfReaP6ZkbfsQwUCUTNdfcYd8r3TAUBqigpC
X-Proofpoint-GUID: yBUSozfzgtCKCMdmVXSZO2KL5yCeLfnW
X-Authority-Analysis: v=2.4 cv=Ws8rMcfv c=1 sm=1 tr=0 ts=68303210 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=pcGS-iR_AO2RkNitFtoA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: yBUSozfzgtCKCMdmVXSZO2KL5yCeLfnW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_02,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230077
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

On Fri, May 23, 2025 at 10:02:03AM +0300, Abel Vesa wrote:
> On 25-05-23 09:55:00, Abel Vesa wrote:
> > On 25-04-30 15:00:51, Krzysztof Kozlowski wrote:
> > > v12.0 DPU on SM8750 comes with 10-bit color alpha.  Add register
> > > differences and new implementations of setup_alpha_out(),
> > > setup_border_color() and setup_blend_config().
> > > 
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > 
> > > ---
> > > 
> > > Changes in v4:
> > > 1. Lowercase hex, use spaces for define indentation
> > > 2. _dpu_crtc_setup_blend_cfg(): pass mdss_ver instead of ctl
> > > 
> > > Changes in v3:
> > > 1. New patch, split from previous big DPU v12.0.
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 19 ++++---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 84 +++++++++++++++++++++++++++++--
> > >  2 files changed, 94 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > index a4b0fe0d9899b32141928f0b6a16503a49b3c27a..90f47fc15ee5708795701d78a1380f4ab01c1427 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > @@ -320,14 +320,20 @@ static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
> > >  }
> > >  
> > >  static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
> > > -		struct dpu_plane_state *pstate, const struct msm_format *format)
> > > +				      struct dpu_plane_state *pstate,
> > > +				      const struct msm_format *format,
> > > +				      const struct dpu_mdss_version *mdss_ver)
> > >  {
> > >  	struct dpu_hw_mixer *lm = mixer->hw_lm;
> > >  	uint32_t blend_op;
> > > -	uint32_t fg_alpha, bg_alpha;
> > > +	uint32_t fg_alpha, bg_alpha, max_alpha;
> > >  
> > >  	fg_alpha = pstate->base.alpha >> 8;
> > 
> > For the 10-bit alpha, you need to shift here by 5 instead of 8.
> 
> Typo. "6 instead of 8".

Granted there would be a next iteration of this patch, I'd suggest to
modify _dpu_crtc_setup_blend_cfg() to always use 16-bit values and pass
them down to LM's setup_blend_config() callback. Then LM can perform
version-specific shifts, utilizing either 8 bits or 10 bits of alpha
channel values.

-- 
With best wishes
Dmitry
