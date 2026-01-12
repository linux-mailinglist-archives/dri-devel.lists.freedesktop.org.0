Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8D9D11325
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 09:25:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D198810E302;
	Mon, 12 Jan 2026 08:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lnqoxx1S";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c/IC+y8u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9D3210E305
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 08:25:42 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60C84HtD3014049
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 08:25:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7eUOrm48pVIkwjT7mhYkGDB3wIt6XmnD5l2NmrqDlFQ=; b=Lnqoxx1S/lwnqyKi
 m82SCGrXOVPKKD2qaEKwbbW5WY00DKcikxm0YPmyGCYFfHvSScI+vb8O1unbwVo+
 HUC14QfGbwTaVlc3K+Pi9TyM7yAhgNLsfDdN3S8O244EBjkZ/n3cYmuxskNhE6xO
 xTMuNBQbyuOg87c5Do9u6i1jII9WquIf7KSdakM57JhJxNwabWDbM1dJo82ec5RK
 b/Uyj2pV6xbPVQINVocDMkwic0xBpK6JJEyl0ori0VYqXK3nAEDBNLGHgtl9WQyJ
 7ZoI5NJT/VidImJKLup0M50pFttvW/ODd+jIxtS481K30Qfde9dhWIBMqNGAdxVp
 d62SsQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkntukkqm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 08:25:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b17194d321so906742185a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 00:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768206341; x=1768811141;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7eUOrm48pVIkwjT7mhYkGDB3wIt6XmnD5l2NmrqDlFQ=;
 b=c/IC+y8ugtvyvfx9oVzhvMENb2paK7Gf6+zcSGO+WGV0uOkA7T1mivmgp284GSUQ/X
 eSkBeIY5zzJhgJ1kOhQuUc3nGdNmNVPTRn8paT3hSZpDEOfwQxZlUvdFto2abVmtoaUx
 clSjLVjxRwVo+6T08o2amrIYSN/pCIksUViGChhhI0eUeSEb8/sLIoo0xFOmcia1BIco
 J8nSo2JT9vhWIHLpW7bHhxkCPm3UKTiOflHhawC7zjl5b5E4RMl8d8d/KZbalBoEjWfs
 Xe5UH16L5yHCAVJTArUDvbb8/bEeNK0lJgOHIYRfaBCX69usSC5/uQyw+p3hkCf7O8HI
 WRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768206341; x=1768811141;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7eUOrm48pVIkwjT7mhYkGDB3wIt6XmnD5l2NmrqDlFQ=;
 b=jcY8iFqlY5X0QDDJtMXxDnvRbMxOUn/eBCB3VZoqSBWJhgNjqG1WIpJIzxjvsR+YQc
 Efkb+tNSWp+IMjOAXGRNXyV6vuY4aQ/uUCCjrhD1M0yqirF7GbHWGPhNQZEYfyzWMkiz
 prsBNJDZ8fXb9/T9IH80VXkzQ+ZCxlqULs1dVTXvoExkbJ0CI3DdFEptCJv1u6BPMRj5
 jgck25rZfQj4FB3+EK2CR9zLqhgHUGPm2hlOCPbg6WR9R1ANrhHCZiyfL89bub3GKhPN
 IB8uF9VC903+VJ3GxYoIJ1lmzom0iG9XLGKkFD20vMaRA63+FsvBvZkZkS1MC9tIukDT
 ieOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhocZj9H4ol5QLvMSrh+hEfHDcohyjm4TQwNFYLSDNDn6puYZMDOnsW6x5jbKjIvJAXADrA2X1ULg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3Q2qszmkHulwtH05oNcn0v5ZiPOW8v2xHfjrpJ43MDlKzZSFu
 9b+dPcldrrcM3O/J0123+hyrq6zWQrtI/CYiMIyDBV9NGIT/8QdkzX1+RRu+ebIqQZTC2NmWJe3
 8wdQhIiPq4PNg2AJfc6hfd8ATgTCgyCdrp0/uFutfmVMbFIIckmWUYqCiWquZELBHzKkfA/Y=
X-Gm-Gg: AY/fxX49WmSd17ydf1elMvK6yUsG+Vk+QgF2h8RqSnrGfO+ftarCHYknh86l8+bifbA
 Lqnh+4ZTgHAHWbr3go5QdKEVdfkl04Wo+YY2Ay13s1q0gbVX0xzvZus0MnYV1eCEp/kqftg/r2e
 VUoxT/QWxfonze0zHDPrEXdZyeqJRUaXBOYMhGQRJ+NMrNbn70CRRaJf6UcrCCfY0wwwc5BhLdj
 XiKGXKGj8zD7tYj/1oZftNh4dTSJgOU5zsQtiEerxUyB+8g1pArHblj9n7lCbNh0FjYDDmOqy/+
 l1alDL8bbfSISzAV5bkwpdLT08/Nu1dWwCvcuNbW7kgvwmZNWjLCywS05tkcqNlqQndezSbVjMt
 IbkKhfpex11oWa53m7nXDmGedU252iO/f8KEDe6HTPH8IANaTIjaWL0M3ucML6nSYcaN7Bx0=
X-Received: by 2002:a05:620a:4143:b0:89e:a9ea:a374 with SMTP id
 af79cd13be357-8c3893e042dmr2325403285a.67.1768206341078; 
 Mon, 12 Jan 2026 00:25:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqUgoQ0GCP62X1wdfQgILxQr4zc6ioMmvxHh5zsjlzgNHwrmBI204t3AI/afaZeiXkQyR08A==
X-Received: by 2002:a05:620a:4143:b0:89e:a9ea:a374 with SMTP id
 af79cd13be357-8c3893e042dmr2325400685a.67.1768206340519; 
 Mon, 12 Jan 2026 00:25:40 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c37f544674sm1430752785a.54.2026.01.12.00.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 00:25:40 -0800 (PST)
Date: Mon, 12 Jan 2026 16:25:30 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, simona@ffwll.ch, krzysztof.kozlowski@linaro.org,
 konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix mismatch between power and frequency
Message-ID: <aWSv+kVV3G18I/NJ@yuanjiey.ap.qualcomm.com>
References: <20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com>
 <20260109083808.1047-2-yuanjie.yang@oss.qualcomm.com>
 <kusxzlezvsuwcwwdtm7yqwnqea6gdeolkepxpx3estabaiqymo@edj7pgccli3y>
 <aWSTcI6H6+7AXkEN@yuanjiey.ap.qualcomm.com>
 <CAO9ioeVrQ_TfU5-auxNHG=dL8VmeWtBaC_NE09UECodkYrFv-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO9ioeVrQ_TfU5-auxNHG=dL8VmeWtBaC_NE09UECodkYrFv-w@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA2NSBTYWx0ZWRfX/zt3jTByH0mK
 t5lz0BM0lQvCJ2K51tQFZaR3Txu5nT9W6rugcqrRaL7/8fufapiGpPQ9j3ROajI4hKU+21uQEhp
 NcC43jdacKIVC2OlCETxFfBVaJagiIjyf25DD0/DIvibd1fL1Nu9X3322Ik9tN54P5Bq2bzgnK+
 Fr6p60OV+dakhbFM2dBouHii/G86VYWXEGpPdHOC1OEDWOQA2z8rGsRzE144KmPgPY8jD0eROz4
 pe1z8DT2jJaAaOzGJTN11MZmdxELyNs1giHDA1pZKVyVrs5czqPThY+dqJFFlFwEI02q0PT8/YP
 fQAxFPiDFGV2uXx/uVQdu9Y/8MvJ0OsrDZbXVbLBxx2a/JaGqyz03USXCQBQCWeqf2QAKhr1gIj
 vhQExM2D+J/unQk4qip/lT9Gux9yz4o2uqPGCVH2WvzQBice5+O/ElOGuPcRYe+xDXhpOOymx81
 PT7ojYz+dCQGNr5RfSg==
X-Authority-Analysis: v=2.4 cv=R6AO2NRX c=1 sm=1 tr=0 ts=6964b006 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=b9kIr6_pAvzuZN9lwc0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: wuFLF3WtUf0b1Acg-XkkssZALLXrzpzc
X-Proofpoint-GUID: wuFLF3WtUf0b1Acg-XkkssZALLXrzpzc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120065
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

On Mon, Jan 12, 2026 at 09:38:41AM +0200, Dmitry Baryshkov wrote:
> On Mon, 12 Jan 2026 at 08:23, yuanjiey <yuanjie.yang@oss.qualcomm.com> wrote:
> >
> > On Fri, Jan 09, 2026 at 05:22:37PM +0200, Dmitry Baryshkov wrote:
> > > On Fri, Jan 09, 2026 at 04:38:07PM +0800, yuanjie yang wrote:
> > > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > >
> > > > During DPU runtime suspend, calling dev_pm_opp_set_rate(dev, 0) drops
> > > > the MMCX rail to MIN_SVS while the core clock frequency remains at its
> > > > original (highest) rate. When runtime resume re-enables the clock, this
> > > > may result in a mismatch between the rail voltage and the clock rate.
> > > >
> > > > For example, in the DPU bind path, the sequence could be:
> > > >   cpu0: dev_sync_state -> rpmhpd_sync_state
> > > >   cpu1:                                     dpu_kms_hw_init
> > > > timeline 0 ------------------------------------------------> t
> > > >
> > > > After rpmhpd_sync_state, the voltage performance is no longer guaranteed
> > > > to stay at the highest level. During dpu_kms_hw_init, calling
> > > > dev_pm_opp_set_rate(dev, 0) drops the voltage, causing the MMCX rail to
> > > > fall to MIN_SVS while the core clock is still at its maximum frequency.
> > >
> > > Ah, I see. dev_pm_set_rate(0) transforms to  _disable_opp_table(), which
> > > doesn't do anything with clocks. I think we should have a call to
> > > clk_disable_unprepare() before that and clk_prepare_enable() in the
> > > resume path.
> >
> > I do check the backtrace on kaanapali:
> >
> > active_corner = 3 (MIN_SVS)
> > rpmhpd_aggregate_corner+0x168/0x1d0
> > rpmhpd_set_performance_state+0x84/0xd0
> > _genpd_set_performance_state+0x50/0x198
> > genpd_set_performance_state.isra.0+0xbc/0xdc
> > genpd_dev_pm_set_performance_state+0x60/0xc4
> > dev_pm_domain_set_performance_state+0x24/0x3c
> > _set_opp+0x370/0x584
> > dev_pm_opp_set_rate+0x258/0x2b4
> > dpu_runtime_suspend+0x50/0x11c [msm]
> > pm_generic_runtime_suspend+0x2c/0x44
> > genpd_runtime_suspend+0xac/0x2d0
> > __rpm_callback+0x48/0x19c
> > rpm_callback+0x74/0x80
> > rpm_suspend+0x108/0x588
> > rpm_idle+0xe8/0x190
> > __pm_runtime_idle+0x50/0x94
> > dpu_kms_hw_init+0x3a0/0x4a8
> >
> > dev_pm_opp_set_rate(dev, 0); just low power to MIN_SVS.
> > And freq MDP: 650MHz
> >
> >
> > And I try change the order:
> > from:
> >         dev_pm_opp_set_rate(dev, 0);
> >         clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
> > to:
> >         clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
> >         dev_pm_opp_set_rate(dev, 0);
> >
> > But the issue is still here.
> 
> But which clock is still demanding higher MMCX voltage? All DPU clocks
> should be turned off at this point.
Yes, no DPU clock demand higher MMCX voltage here. But next time pm_runtime_get_sync
need higher MMCX voltagei due to high freq.
 
> >
> >
> > > > When the power is re-enabled, only the clock is enabled, leading to a
> > > > situation where the MMCX rail is at MIN_SVS but the core clock is at its
> > > > highest rate. In this state, the rail cannot sustain the clock rate,
> > > > which may cause instability or system crash.
> > > >
> > > > Fix this by setting the corresponding OPP corner during both power-on
> > > > and power-off sequences to ensure proper alignment of rail voltage and
> > > > clock frequency.
> > > >
> > > > Fixes: b0530eb11913 ("drm/msm/dpu: Use OPP API to set clk/perf state")
> > > >
> > > > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > >
> > > No empty lines between the tags. Also please cc stable.
> >
> > Sure, will fix.
> >
> > > > ---
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 16 ++++++++++++----
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  3 +++
> > > >  2 files changed, 15 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > > > index 0623f1dbed97..c31488335f2b 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > > > @@ -1306,9 +1306,14 @@ static int dpu_kms_init(struct drm_device *ddev)
> > > >     struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
> > > >     struct dev_pm_opp *opp;
> > > >     int ret = 0;
> > > > -   unsigned long max_freq = ULONG_MAX;
> > > > +   dpu_kms->max_freq = ULONG_MAX;
> > > > +   dpu_kms->min_freq = 0;
> > > >
> > > > -   opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
> > > > +   opp = dev_pm_opp_find_freq_floor(dev, &dpu_kms->max_freq);
> > > > +   if (!IS_ERR(opp))
> > > > +           dev_pm_opp_put(opp);
> > > > +
> > > > +   opp = dev_pm_opp_find_freq_ceil(dev, &dpu_kms->min_freq);
> > > >     if (!IS_ERR(opp))
> > > >             dev_pm_opp_put(opp);
> > > >
> > > > @@ -1461,8 +1466,8 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
> > > >     struct msm_drm_private *priv = platform_get_drvdata(pdev);
> > > >     struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
> > > >
> > > > -   /* Drop the performance state vote */
> > > > -   dev_pm_opp_set_rate(dev, 0);
> > > > +   /* adjust the performance state vote to low performance state */
> > > > +   dev_pm_opp_set_rate(dev, dpu_kms->min_freq);
> > >
> > > Here min_freq is the minumum working frequency, which will keep it
> > > ticking at a high frequency.  I think we are supposed to turn it off
> > > (well, switch to XO). Would it be enough to swap these two lines
> > > instead?
> >
> > Yes, just clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks) to
> > disable clk is OK.
> > we can drop change here.
> >
> > > >     clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
> > > >
> > > >     for (i = 0; i < dpu_kms->num_paths; i++)
> > > > @@ -1481,6 +1486,9 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
> > > >     struct drm_device *ddev;
> > > >
> > > >     ddev = dpu_kms->dev;
> > > > +   /* adjust the performance state vote to high performance state */
> > > > +   if (dpu_kms->max_freq != ULONG_MAX)
> > > > +           dev_pm_opp_set_rate(dev, dpu_kms->max_freq);
> > >
> > > This one should not be necessary, we should be setting the performance
> > > point while comitting the DRM state.
> >
> > No, issue is during dpu binding path. And in msm_drm_kms_init driver just
> > pm_runtime_resume_and_get enable power and pm_runtime_put_sync disable power.
> > But We do not set the appropriate OPP each time the power is enabled.
> > As a result, a situation may occur where the rail stays at MIN_SVS while the
> > MDP is running at a high frequency.
> 
> Please move dev_pm_opp_set_rate() from dpu_kms_init() to dpu_kms_hw_init().

During dpu_kms_hw_init and msm_drm_kms_init and msm_drm_kms_post_init.

There are multiple places where pm_runtime_get_sync(pm_runtime_resume_and_get)and pm_runtime_put_sync are called.
And each time after pm_runtime_get_sync(pm_runtime_resume_and_get) will access register depond on MDP clk.

Do I need to add dev_pm_opp_set_rate after every pm_runtime_get_sync and pm_runtime_resume_and_get?

pm_runtime_get_sync
dev_pm_opp_set_rate
"access register"
pm_runtime_put_sync

pm_runtime_resume_and_get
dev_pm_opp_set_rate
"access register"
pm_runtime_put_sync

Thanks,
Yuanjie

> >
> > rpm_idle+0xe8/0x190
> > __pm_runtime_idle+0x50/0x94
> > dpu_kms_hw_init+0x3a0/0x4a8 [msm]
> > msm_drm_kms_init+0xb8/0x340 [msm]
> > msm_drm_init+0x16c/0x22c [msm]
> > msm_drm_bind+0x30/0x3c [msm]
> > try_to_bring_up_aggregate_device+0x168/0x1d4
> > __component_add+0xa4/0x170
> > component_add+0x14/0x20
> > dsi_dev_attach+0x20/0x2c [msm]
> > dsi_host_attach+0x58/0x98 [msm]
> > mipi_dsi_attach+0x30/0x54
> > novatek_nt37801_probe+0x13c/0x1c8 [panel_novatek_nt37801]
> >
> > And I found a a similar bug.
> > https://lore.kernel.org/all/20220915205559.14574-1-quic_bjorande@quicinc.com/
> >
> > Since the panel driver does not hold the property power-domains = <&rpmhpd RPMHPD_MMCX>
> > once all drivers that do own the RPMHPD_MMCX power domain finish probing,
> > the interconnect’s dev_sync_state is triggered, which eventually runs rpmhpd_sync_state
> > and starts dynamic voltage adjustment. This is when the issue occurs.
> >
> >
> > if do change below, this issue can also be fixed.
> > &mdss_dsi0 {
> >     ...
> >         panel@0 {
> >                 compatible = "novatek,nt37801";
> >                 ...
> >         ++      power-domains = <&rpmhpd RPMHPD_MMCX>;
> >     }
> > }
> > But I don't think panel driver should own a power-domains = <&rpmhpd RPMHPD_MMCX>;
> 
> That's not related.
> 
> >
> >
> >
> > Thanks,
> > Yuanjie
> >
> > > >
> > > >     rc = clk_bulk_prepare_enable(dpu_kms->num_clocks, dpu_kms->clocks);
> > > >     if (rc) {
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > > > index 993cf512f8c5..8d2595d8a5f6 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > > > @@ -92,6 +92,9 @@ struct dpu_kms {
> > > >     struct clk_bulk_data *clocks;
> > > >     size_t num_clocks;
> > > >
> > > > +   unsigned long max_freq;
> > > > +   unsigned long min_freq;
> > > > +
> > > >     /* reference count bandwidth requests, so we know when we can
> > > >      * release bandwidth.  Each atomic update increments, and frame-
> > > >      * done event decrements.  Additionally, for video mode, the
> > > > --
> > > > 2.34.1
> > > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
> 
> 
> 
> -- 
> With best wishes
> Dmitry
