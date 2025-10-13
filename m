Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40867BD38AF
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 16:34:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6477D10E462;
	Mon, 13 Oct 2025 14:34:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TJzZQnq7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E0D10E46F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 14:34:11 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DAtp3j031249
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 14:34:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UnjM2iW4CXaWPsxTyAY4aMVtXNn2X/TlNCmubEZb6tU=; b=TJzZQnq7cyFpLFad
 HZOosQoW1dz6Gfz7pgkTYO6/uzN7eA7tUD4BUGRV4+AWHmAA/tHXM8GrUC3NbKIb
 spyp11FdPh+Lttl+aBnDkjosNPlRa0dT6MSOOI7L83mef3gcJ6xS/OJoHDAcMUbt
 MQdhf4//d5kUoEL/5YtSpFs9bcaWgcZMgFdmAn05VKwzlO30IXfcgunWtq3CnePV
 CX+ZGYrC047nrkEpsRo0ehfuH1o/bqdw8yR6rNzfLLjZDqxgcfGolP0uc/+6HZvU
 Cw+TA6bIXvvLQibRhg/AAAJWuJePvpEBhsD1lSMpAFK8Hn+JFhBToUchZoubKL7R
 2kNB8A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0mwe0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 14:34:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-859df490f9dso1040104785a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 07:34:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760366050; x=1760970850;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UnjM2iW4CXaWPsxTyAY4aMVtXNn2X/TlNCmubEZb6tU=;
 b=qA/3bNPe97V7EYwIqHWFkW1oMnmX8we/43PhALeCCE+w3rLmyc3p0kDK3xv18C1qH8
 N5qquIKI64DT18PF2iuwfJjy2V7AqwgH9cI5b7hJzWdi5M31ASqWd/AgOqcX7ahNEeHW
 eDmInvOj7DduZtHrBv/IwJwSe/+I8hc13lU6XKCIvB/ZQOkvoFj0dWMLTq/vdEFELWEB
 BytaHQTaGVnD0P2FaySa3/K3kpztwwjVdRZN2nywMi0LDUuloCWMoLPOqU7kYq6CYs0J
 wd7/E8vY/xioRGeO/C3xSwUDsJaVv3ZfHVOtI7aOFaa0F4h2da88dKHwOQjNYDwFBIMh
 venw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXx38CPCA36wfViH9sGTc4ZhWBmPQ1CUDo7+H4FWyqz5Y0rl4uAV51LlD02jt1T6nQEiYjQdRytsWM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmRExCrJLNl2P1Ue0UwFoPMBeIulfZUyUQjbPLTOcRwxPEGOKJ
 +m7EzIM8MGNfNDcsq7XqmqqhksnovPPsX5q2tGG4TwdSPdWDEsOELj18oSeq3k45rF0+OEuCQMf
 CY4AqGY+EfJw99HwJzrkK8ztbEzrmzA05CYsFbJOZOgHGvPQcmrh7Hyt5WrEuJXNgF8WC95Y=
X-Gm-Gg: ASbGnctDsPV0SpWMuQr/rgH4ED+eawNeJ+pTV5m7QkPpLdq4g7Vl/mBpYvvNgNMrxWN
 fCcLe6WZW6afiQdAvIpnArEmOOzU7utI5HJHM2JL3OgGVVekKSYDF5tA1SUCXfOkZJ5WBb2eCU1
 Qd9LwePdmn1+B1OZWCuKVG5EQxINMJWniuM4Fap8B5yTB8BRkSlo+a39RGx6HPAN90Ng38d9UwC
 K9BoN2Oiv4DeoeRIXpXToZNP1F+BulCMASVkRwEy2wGLZQCSh4TiH/yNJWo5Q3R3O2roXHFJgpc
 2oHPdTRgcODVvCzkyeplh0pPAZ2ozaJ1jPoKVhvjcmfLdUZDFfLDF400w8NAt9T2CpQHQ5Rr/PN
 yjOMNYlSrz6ohWD9oVjfOe14c3TDj2HbWE32YnstnG96Ck6eo6bFK
X-Received: by 2002:a05:622a:1190:b0:4da:256c:3d42 with SMTP id
 d75a77b69052e-4e6ead66d3bmr306582981cf.59.1760366049458; 
 Mon, 13 Oct 2025 07:34:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsAa9RE0jQv7/KQ4V1BacvQuNOMhawZJVvcdaOp6lQ4V+xaBIvIkvcwLEkbpiulXd2rlgZyQ==
X-Received: by 2002:a05:622a:1190:b0:4da:256c:3d42 with SMTP id
 d75a77b69052e-4e6ead66d3bmr306582221cf.59.1760366048780; 
 Mon, 13 Oct 2025 07:34:08 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5908856394bsm4179132e87.66.2025.10.13.07.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 07:34:08 -0700 (PDT)
Date: Mon, 13 Oct 2025 17:34:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Junjie Cao <caojunjie650@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Jonathan Marek <jonathan@marek.ca>, Eugene Lepshy <fekz115@gmail.com>,
 Jun Nie <jun.nie@linaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 2/3] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
Message-ID: <3a2v2i5lximl6q7eidd5zhjoyckz2fvgv52rhjruiuyuc6v3a3@5kdqa2eypidt>
References: <20251001135914.13754-1-caojunjie650@gmail.com>
 <20251001135914.13754-3-caojunjie650@gmail.com>
 <cwgn24f6tnmytd4omr2tul4e5jjin3ijji3ff3qkumqm2xe3t3@ntayu3m5kai3>
 <CAK6c68jBwykcWZm3ckm3nwab-X9Are4rD-eauE4rXA2+XvuX1w@mail.gmail.com>
 <9cafccd5-35d4-46c5-aa57-1b0b8ec116e8@oss.qualcomm.com>
 <CAK6c68iV=n3BvMMa30FuehbMs7-U01s0saZnsYwPVoiyw0VTrg@mail.gmail.com>
 <icj24ghckurcunjormsfhhscng4wfcxiyadl2z5xduitxxqqmp@iws3pssew5dx>
 <CAK6c68hZq2o9YXxzd2dv5AXw5-UfKv_58MoUrQfGyfPiONArEg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK6c68hZq2o9YXxzd2dv5AXw5-UfKv_58MoUrQfGyfPiONArEg@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXyaooGqVq6JAZ
 r5a03P1NZoFw1GZoNH7w5Y+K+HBckLVJF7w/KLiZLdiJZy56qt6x4/S4Y4Ali8fQXULiRLvn8Px
 WfAk6fmlVaogBj+/lCWsm3L+jzts5d5uiztcSxTxDwth/Jl1tt/d5kbDZhFP/f9e0TECMWcG4qW
 0bYkdyvyYrayXrjLtKBmFnMF6qeyj7Gu1ek0IA56CmIL88VVOtkgbVuX3ig7LKPMt/FrZyl+XR4
 tF54rnR/ycT6AE+JuOKB6NexEe+BTCR5XZgnjtsCy+JQ/jtSHD/+7x8QX/w2nVspGuoMS0qz6TJ
 +sz0iPSSYS4QfVbqD7Urjm+C/ix8koF85unuMNyGjAnhdOaT0hONsL1ymZdAvB6VeTHidNSLgQj
 Qbfn4QnPOxdyrl+gVLdQXiyCehHRjA==
X-Proofpoint-GUID: UlmnxplNVXjPu5odHOiDHJh9_7L0Nr7Y
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68ed0de3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=RAbU-raeAAAA:8
 a=pGLkceISAAAA:8 a=MZ1LVty5hXXzp8AwOaAA:9 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
 a=JiizpSU_mAIq9zsZDqn2:22
X-Proofpoint-ORIG-GUID: UlmnxplNVXjPu5odHOiDHJh9_7L0Nr7Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
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

On Mon, Oct 13, 2025 at 09:17:04PM +0800, Junjie Cao wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年10月13日周一 20:31写道：
> > On Mon, Oct 13, 2025 at 07:04:43PM +0800, Junjie Cao wrote:
> > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年10月13日周一 17:39写道：
> > > > On 13/10/2025 04:52, 曹俊杰 wrote:
> > > > >  >Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com
> > > > > <mailto:dmitry.baryshkov@oss.qualcomm.com>> 于2025年10月2日周四 10:04写道：
> > > > >  >On Wed, Oct 01, 2025 at 09:59:13PM +0800, Junjie Cao wrote:
> > > > >  >> From: Jun Nie <jun.nie@linaro.org <mailto:jun.nie@linaro.org>>
> > > > >  >>
> > > > >  >> Some panels support multiple slice to be sent in a single DSC
> > > > > packet. And
> > > > >  >> this feature is a must for specific panels, such as JDI LPM026M648C.
> > > > > Add a
> > > > >  >> dsc_slice_per_pkt member into struct mipi_dsi_device and support the
> > > > >  >> feature in msm mdss driver.
> > > > >  >>
> > > > >  >> Co-developed-by: Jonathan Marek <jonathan@marek.ca
> > > > > <mailto:jonathan@marek.ca>>
> > > > >  >> Signed-off-by: Jonathan Marek <jonathan@marek.ca
> > > > > <mailto:jonathan@marek.ca>>
> > > > >  >> Signed-off-by: Jun Nie <jun.nie@linaro.org <mailto:jun.nie@linaro.org>>
> > > > >  >> Signed-off-by: Junjie Cao <caojunjie650@gmail.com
> > > > > <mailto:caojunjie650@gmail.com>>
> > > > >  >> ---
> > > > >  >>  drivers/gpu/drm/msm/dsi/dsi_host.c | 25 ++++++++++---------------
> > > > >  >>  include/drm/drm_mipi_dsi.h         |  2 ++
> > > > >  >>  2 files changed, 12 insertions(+), 15 deletions(-)
> > > > >  >
> > > > >  >Please extract the generic part, so that it can be merged through a
> > > > >  >generic tree.
> > > > >  >
> > > > >
> > > > > Sorry, I don't get it.  The generic part, generic tree? Do you mean
> > > > > the drm tree? `slice_per_pkt >= 2` is seen on the panels of these
> > > > > tablets that are equipped with qcom chips. I don't know if these
> > > > > panels are used on other platforms, and if it is necessary to do it
> > > > > in drm.
> > > >
> > > > There are two changes here:
> > > > - MIPI DSI header change
> > > > - msm DSI driver
> > > >
> > > > I've asked to split it to those two commits so that he change for
> > > > drm_mipi_dsi.h is more obvious for reviewers and so that it can be
> > > > merged through a drm-misc tree (or through drm-msm tree provided it gets
> > > > a necessary ack).
> > > >
> > >
> > > Thanks for your clear explanation.
> > >
> > > I don't mind to add the field separately. But should I submit it
> > > with the panel driver together? Otherwise, this field is unused
> > > for a while.
> > >
> > > However, as you mentioned, this is not a part of standard, neither
> > > mipi dsi nor VESA DSC. Recently, only Qualcomm devices require it
> > > to calculate parameters, then we use them to program registers. Why
> > > don't we parse the field from devicetree?
> >
> > Because the value is uniquelly identified by the panel's compat string.
> >
> 
> Yes, it is panel specified.
> But can we set it for every panel like
> 
> &mdss_dsi0 {
>     qcom,mdss-dsc-slice-per-pkt = <2>;
> 
>     status = "okay";
> 
>     panel: panel@0 {
>         compatible = "foo,bar";
>         reg = <0>;
>     };
> };
> 
> or moving the property to panel node? We access it from child node.

Why do you need it in DT if the panel driver can provide this
information.

-- 
With best wishes
Dmitry
