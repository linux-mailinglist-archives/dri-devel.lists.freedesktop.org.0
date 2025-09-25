Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAA5BA1AAA
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 23:48:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD1510E9B5;
	Thu, 25 Sep 2025 21:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="j7j9+LAO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A24810E9B5
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 21:48:06 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPYcr027513
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 21:48:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1J7NyDGcAjM0l0VsjLAzDq+jwGxhWn4dU8Lohd7guWU=; b=j7j9+LAOKoPHC691
 /fhNAoqOTVhvN+4wSF8mp6HhqTWjn5M32+QCEotoPCqWrBG2FsV2nPhAV+PZoab1
 B2BrV1H4r7KEAn5ESsbY6+Dj0v90Ks8v52mRCot5RQHnu61HLG3Zs72V47V61j4y
 EzqxyZxnwBFptDTwEE5PfmU5zBjoK42KgfzZ8b9gw7Hi72glQH3/49oVmHZWdHnM
 q2SvORYu/qaOyO1X9xazd0oO+rL3q/oPPzG6qDD5WkTRCvdOmk8XU9/5VMsXOyJ+
 nngVltcx1yeINnDS72loDOqQHkFNb2va9GwqSnGoqqkRjdbOSM71Hp1C7YL2VnR9
 YoFKhw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0q0fxq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 21:48:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4d6fc3d74a2so42041181cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 14:48:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758836884; x=1759441684;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1J7NyDGcAjM0l0VsjLAzDq+jwGxhWn4dU8Lohd7guWU=;
 b=gtzZkMuvVMUe2YydthdiJdBSucvWL1ohm1RzGt0FfL3vM2v/5UlEj/D3D3zbD8QiRc
 dFpVZxwH8WP1HUdBG+lcBA6VT4z5j1hKY7fQlilNxrIAm1Kb1pjwvpN4+SLT4WwgdQ6R
 XTNmrfm7aHuRIOfq9paMvOkcj0UwO3M/pzyhiHSMGW3AeWhwpKrbd9Iu3f4JuNZ++n0h
 m/3lzQ2DX/X/Ek2R58BdbXaO5jWtWZg+DzPQK8rKuik0Wfx92QIFAGxm2Ltl7eFYCp00
 8OAhe5HIl8nP3ovvZWhZRf6rBIDyDryxIvUzw1X/2UVFRLjK4LiQx1RMTWWUMi7Ryg+3
 Tp+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCm4aVgNJrV/OjXYQGAlHOhF8/Txfa0rY0B34cOXE5mjKvgCtUtSpnA9zqKKYfA2amYGDnAT1Lp7Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlcBHQm/ZZYElobsmbeGx+Uu9cgMjuuEvZ3zLinIU7PD9UtpNb
 fyTTCZm/th9J43ooWirCtzzUwhbPD1cj/cqDJw3ge1vDUOEwRjkWLoOPRQC+bW+q1SxoPHNd0kU
 zhzFW796meM5UHxxopKCUjWc3+oB9p2ERYCB59P+O38Yw91cQX7+UP834LwHOZgD3zh9LM2g=
X-Gm-Gg: ASbGnctXJvjm8zTsMgi9HISLz0IvmMec4qHOny8CTXLzo4ahEnxacpHf5LTL47qTGP1
 fT4jFyEq/8wqBDZ+7kHwywmQXxZp+AbfWdpTu961/Kk9dmKS+xBjzqj0cjRAEqUy586ZTvOrFc2
 PFGBeGTO45I3kHSIBZh7cRMtEdwxX/4zMGyytEcg5ULW4IURQ+LTDtRMktliuhByYNnOv4LXJaJ
 RNdDURocqS2lsvinzh4qmHSznTs5pHrgGPQw4bI+uYwpaeavfc92el7gvtxPpBsQv4IOuiK4vsZ
 +8Kn/pyyA7kDouAg89w53BLS6Y1LsimzwQimaLq5KSvqh/kMSZ3trcFqH5FYRmTbaqMPAtIQ7pe
 FbUPZMZltOUE0HtEHzgvK3A7f80JaTElW+jHlDLh8fXNTeY5FUXEH
X-Received: by 2002:ac8:7d8e:0:b0:4b5:e7e4:ba74 with SMTP id
 d75a77b69052e-4da4c39d3a7mr81769771cf.56.1758836884397; 
 Thu, 25 Sep 2025 14:48:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+Z40dedXoEWvgR9gkshTrihOWhuvgfiSSS+xVcgz3Ka7O0hjWhnzpsUYogC0k7NypbIYSSw==
X-Received: by 2002:ac8:7d8e:0:b0:4b5:e7e4:ba74 with SMTP id
 d75a77b69052e-4da4c39d3a7mr81769291cf.56.1758836883750; 
 Thu, 25 Sep 2025 14:48:03 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58313dd679csm1147631e87.56.2025.09.25.14.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 14:48:01 -0700 (PDT)
Date: Fri, 26 Sep 2025 00:47:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v3 1/3] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
Message-ID: <wttg6aizzolsm7qqntspmmwje7kqfaayoqvwp76tvudlkx5phl@7twddmdajfwp>
References: <20250924-dsi-dual-panel-upstream-v3-0-6927284f1098@linaro.org>
 <20250924-dsi-dual-panel-upstream-v3-1-6927284f1098@linaro.org>
 <5b75dckankcx55gbm734a23rvqxdbprlus3nkvqfry7lz5ksjf@jjmfsbiwqny6>
 <CABymUCNZmxzRaVVLU=U9QPupK0KpW_C1eqa8t_ijL6B5EdgnAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCNZmxzRaVVLU=U9QPupK0KpW_C1eqa8t_ijL6B5EdgnAw@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXyNuQ0UVI4YIW
 ruoxEboGuP5Gl4JWEffVHJ/+18D7G6SLwSMfQ0eGgu/zLN4BLz+nzXGN5vYzeSIfeLZC9pyEukR
 NNT4lqKq4pr5SlgYlLNaHEnz5z1/QymNVwbY/zv9TDboQe7Nzafxh3kgacjWGTOrvXFUTQEZy2K
 IasXwL1y3g0V9AMMvzD2aCQQJycRhAnOVRQbvoHXVOIaSmU8++pctLfC17LR+Lllb0XXZaLdbOc
 VqxJnmNyAMRJivUpSopL4YudCjOBW6RzgeHcUehrU68+C5NAh8q6laVhRphY1YjkhSEaEK0hXAU
 /lHYN4QAgqjOhAMzrpvjsy+jMNGCcLNSKP68ogN38lTN5PGFCvPo8F9WrqDUxkl9DQYHeEOadtW
 KNMGkqX7JB2VK+PQO51LD50XN0G47w==
X-Proofpoint-GUID: GNxZFR_sO8PrHrN68p5afVv8ho0Jd0zK
X-Proofpoint-ORIG-GUID: GNxZFR_sO8PrHrN68p5afVv8ho0Jd0zK
X-Authority-Analysis: v=2.4 cv=JsX8bc4C c=1 sm=1 tr=0 ts=68d5b895 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=RAbU-raeAAAA:8 a=KKAkSRfTAAAA:8
 a=F1wq8hpAVWgPklvmxcQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=JiizpSU_mAIq9zsZDqn2:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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

On Thu, Sep 25, 2025 at 03:07:28PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年9月25日周四 03:10写道：
> >
> > On Wed, Sep 24, 2025 at 11:08:10PM +0800, Jun Nie wrote:
> > > Some panels support multiple slice to be sent in a single DSC packet. And
> >
> > s/support/require/
> >
> > If the panel supports something, then we can omit that and send 1 slice
> > as we currently do. If the panel requires multiple slices, it's
> > mandatory.
> >
> > > this feature is a must for specific panels, such as JDI LPM026M648C. Add a
> >
> > A panel driver which executes this API is appreciated. Otherwise in a
> > few months / years somebody will submit a patch 'field foo is not used
> > by the kernel drivers, drop it'.
> 
> OK, will add a panel driver in next version.
> >
> > > dsc_slice_per_pkt member into struct mipi_dsi_device and support the
> > > feature in msm mdss driver.
> > >
> > > Co-developed-by: Jonathan Marek <jonathan@marek.ca>
> > > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/dsi/dsi_host.c | 25 ++++++++++---------------
> > >  include/drm/drm_mipi_dsi.h         |  2 ++
> > >  2 files changed, 12 insertions(+), 15 deletions(-)
> > >
> > > @@ -196,6 +197,7 @@ struct mipi_dsi_device {
> > >       unsigned long hs_rate;
> > >       unsigned long lp_rate;
> > >       struct drm_dsc_config *dsc;
> > > +     unsigned int dsc_slice_per_pkt;
> >
> > Why is it a part of the DSI device config? What if a device specifies
> > dsc_slice_per_pkt, but not DSC config? What are the legit boundaries for
> > this field?
> 
> You are right. drm_dsc_config is better place to add the info. Thus only
> panels that support DSC can convey the info to host.

You will have to explain that it is not a part of the standard and what
kind of effect should it cause for DP and HDMI.

> >
> > >  };
> > >
> > >  /**
> > >
> > > --
> > > 2.34.1
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
