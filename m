Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B94AEC3FF
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 03:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E168510E110;
	Sat, 28 Jun 2025 01:58:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GScHrxCq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B12CD10E110
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 01:58:50 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S0DDXV012134
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 01:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=eILDFaNaizkjDCv06c5JedL2
 Rc8EWoy8Yse02GiZCR4=; b=GScHrxCqgi9tyxBX6Eo06duCyR9cRm9KEoKX4rqs
 ATXdTfow8eA/ycegO2ld6PxL1Pqw33JVI2dAq/OI8GKRIWIUHrEeIghZmHKSn5qN
 qn/fgLcSw4EIux1UsJ7nw+cGz3X42wN8tOkMunrfDl7iXTmNgXRdb1uhKfJxVtkQ
 u9TutO5Qj+mMYJKrZqzrcli/wecZETmhounHe10uNZhPKT8DJ8G2d5szjm7miMVZ
 QXH01B2l1YL2WECZ3rrmgmY5r465MH8k6c75xcDO0AKiws15Dc53Hnl2nbYsriac
 Eb8AmGwlQSp+23XM4PYk+q3lw/Q9AUDk27BiOrqPhDqzWw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc61jt7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 01:58:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7d4133a2081so389989285a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 18:58:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751075926; x=1751680726;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eILDFaNaizkjDCv06c5JedL2Rc8EWoy8Yse02GiZCR4=;
 b=QxKV5StIhKYhWo6idi8453ez/imP9j9B67Mapknlb1+fr7PTlBvYXnICmJ7i294P4x
 UnW0WYRRYzrA71nDtxFCW0qsIc6bu5YAwJ57lF7aNr7n0Y55VtkOHkl4Y7aQQp4XwuPW
 1BjoUfY5AEhK7kIGQ6bGTI91xb2HnCTimvyVwZrzBAr9orlcVr8/cMUUhbCBNLeN8PcJ
 g/qX55ijqfQKvhRBKdNJmdp0aF5tpEF3RJCUOSweFeNI16ncbIoizZa6DoLl497Qxj6B
 GB8X5XIiWVL2+krB/Dxp0WoygMvAkHdD1eruia8n5HRICb0APlqaTHIDpyZgooBQUvoE
 jHyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV31Kw3tkeI4ffWjtJlu70GprJzcHhTPmvIgT86WF6Qc2+w2EQW+uncJGacgGNBtXkmswYihV8+Bag=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx01UMY2GBsPR8ONvew6Dor8JUoJImXCmfxhNgApBOvZPLOUHhE
 uiLC5Iw7i80Vgj6MwH4YuoLSjjdXa2PVr9nLIj68DAWi7c4FfIAZ/7SL2ZUR3cC1LtqJzmwTCVX
 WbPrl8fphFTWYUPhjrL5TuUJjdQDu8bbIkjvgiJtWf7TzuiokG8L9I3G4Ay0dThlE/XR2Nic=
X-Gm-Gg: ASbGncscYLTsmSFXwJs1Pehuw6I+UdbcdlvY138RIzeS63G3sHNaBEh6fVBua/VRDaB
 bR/e1W+etb1FxWiTttAFjMMJU1PoDg1y0Uq22bSqP7DDC8/rXqBTF7NH2AAopOJOfeudG7AvsQO
 GTBzZQXxmB8lB/PUB7k7+jB/W+WVHO0v96f2im5WfP2owhd13MS3qaxYtGykTFAEFFjaqVSlaPL
 FNJq9LDTBb6EZaKic3vJKiSQX+Ohy2C5muMWKuYTOZ3vojFCZ1c6XahdJciyplqMCu88O7fRKPf
 PmB47O2LhL+WpsAPWBhJvYy2IHM8XiGQxry3EDs/OgD5/XEaJDSTUinzQIJdzcVevDWINCLiUhb
 cs5ZH/+huW8gJHqEgETxG5eLHZBXwmhJ3X8A=
X-Received: by 2002:a05:620a:2588:b0:7d3:c5f1:7807 with SMTP id
 af79cd13be357-7d443909ecemr804971085a.1.1751075926151; 
 Fri, 27 Jun 2025 18:58:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGe6lwj3S9nIkZY7XE5bY0HRz69nnX1UC0J0DFAUuThqtRm1AXCajgP7n99Gm5BwELT8jCm7Q==
X-Received: by 2002:a05:620a:2588:b0:7d3:c5f1:7807 with SMTP id
 af79cd13be357-7d443909ecemr804968785a.1.1751075925765; 
 Fri, 27 Jun 2025 18:58:45 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5550b2f2532sm630248e87.252.2025.06.27.18.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 18:58:43 -0700 (PDT)
Date: Sat, 28 Jun 2025 04:58:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/mdp4: Consistently use the "mdp4_" namespace
Message-ID: <tszvojm35xaq3fqx4kbpqh2wa5l5mk33yldsis3wkw2b4f3jc5@gok3fhryt52v>
References: <6b9076268548c52ec371e9ed35fee0dd8fcb46ef.1751044672.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b9076268548c52ec371e9ed35fee0dd8fcb46ef.1751044672.git.christophe.jaillet@wanadoo.fr>
X-Proofpoint-GUID: T67AVVxTi3JGPeIuJD04N8ZEIwZUc24S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDAxMyBTYWx0ZWRfX3QOiADWwTK9o
 EJqqeFLJt0RocYE0Pke0tzKJHUv4SfspvtLlV8QLtcHeD+2h6xQM58n1A8T9S5TP06Wg/NI7Rq0
 OQyvBlhIy5icRFCrk6RHerdJQc+4ev3vjZH7kKgnd83yDeBg0AQsEz4a9S8tA+J7dzXNaa/lhsN
 gSkGd6Ys5tPWPTqaciiWbc1fH7zp6ElDVsZNomlW71JvBnOfdmK2lsya4RcNqX60+Y0F/4zyL2h
 h90k56Q4a/cA5+X49WUESLU+U0yHrvBogxuabKmwnddjd/x3Se/1Lu8QWDKXNJlfvRecdYPETiH
 zkDklaH5Vw8FnejJpstBjVb4TIYNQbKul6DyDJp+R+2LJL5ZsnPlKSHa+tjnN25TViX+EdkcGe5
 JPjoxrLn+Q4E9X8edKzzjeoD48UcYwZbPMB6/T7LhHZ560n/zdT91wwYFAvz4+joVKXjLF52
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685f4c57 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=z0jYOjsfy6L0UbeeUVAA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: T67AVVxTi3JGPeIuJD04N8ZEIwZUc24S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280013
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

On Fri, Jun 27, 2025 at 07:18:03PM +0200, Christophe JAILLET wrote:
> Functions and other stuff all start with "mdp4_", except a few ones that
> start with "mpd4_" (d and p switched)
> 
> Make things consistent and use "mdp4_" everywhere.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> The change has been done with:
>    sed -i s/mpd4/mdp4/g *
> and the modified files have been compile tested.
> 
> Maybe the comment "/* TODO: do we need different pll in other cases? */" in
> mpd4_lvds_pll_init() can be removed as well.
> A similar comment was removed in mdp4_lcdc_encoder_init() in commit
> 9c2f63da6a70 ("drm/msm/mdp4: register the LVDS PLL as a clock provider")
> 
> This has been waiting in my own tree for years, and popped-up recently
> because of other changes in the same area.
> ---
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h      |  2 +-
>  .../gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c |  2 +-
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c | 38 +++++++++----------
>  3 files changed, 21 insertions(+), 21 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
