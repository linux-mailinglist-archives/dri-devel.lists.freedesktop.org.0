Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17199D073E6
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 06:51:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D3CF10E31A;
	Fri,  9 Jan 2026 05:51:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MNno0Ii+";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kv4E/SPO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E84B510E31A
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 05:51:02 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6095cm5n2765533
 for <dri-devel@lists.freedesktop.org>; Fri, 9 Jan 2026 05:51:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=SZ+vI17AryCUc2LXtMN69ba7
 Hushzr3nEAs4KJ9v5tM=; b=MNno0Ii+xcFwzwgsp8WGG9nbwjtcdcUH76J+/08h
 uutwn97UCMCUBT17Bd+jCeXel4ioVCmvgysCsAKJUTo4a6CCwDGzhFzk3wFmML8b
 +n20P+FqUdhBkoYUvItzI8JCJwc2r6v6v8TMbBZ+sWtCkygiLDyyGcJ028d0TEpM
 1SZlIpI7g1SqOKk/2x59MmMGulB7jLTBzehaY8kfUXqf8bRja1z4Y0BfEg43c7zX
 BNwERg4VkfZ8fz/L259lYxbxcr5OLdUE2YBQRxzhdPaznWs/17qHv/K65//VeYPa
 N4v7ZhmQRuxJrtvub05RMl+dRKZ7lgBold/K5bEZaKonZg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjfejt5jd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 05:51:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b6a9c80038so431019685a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 21:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767937861; x=1768542661;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SZ+vI17AryCUc2LXtMN69ba7Hushzr3nEAs4KJ9v5tM=;
 b=kv4E/SPOWXMYsWxaP0s6ixT5WlCe+69fwlsdggewriTgY1s9sCdBf/OhlGu6+ozsUx
 6blxp9Nt1uLh8O9rkCieJBeCa7s0OsCDbh2LA6oneljhzJ3vyuTtGRLT+1LJ+hcoKC4o
 JdYtO9FQlMp4Iqfwyv2cSXTcJiKoKrv+C/l08JPxdsGdEVbm7czNvl1w8Ho32Narcl41
 ElPHPi7ImLw6yk6QRjbYKADgpFVQ8F/LqQ26WdSW1tlzPAY8ymeA0PLkwT+v/7K8aIZO
 SDvY7iRGcZoKXiOMg8OMwq58ttZfae2gtng5Hd/dfd784sWpice1QokAjp8z4I9QvXpD
 1zlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767937861; x=1768542661;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SZ+vI17AryCUc2LXtMN69ba7Hushzr3nEAs4KJ9v5tM=;
 b=ES3/bqiaqbCtukCoq5ijVdt8bfNvdDc0QMRvSYfcnZG19k2bbR0ZJWGRU0n+c5d+Zy
 4nw0coEHY9zcrAfhAETQHyrpKICuZF2GGUi8MEXAIwMbQe6K9n29RlUwV2/UW6knMTYD
 0+StKUi+YWhjx+FPDyfL8bwG9NaKaCD5q+EmfQ4SVb6zPxfp2k6dA7yEuO0aywadfZgZ
 TCCgzHJNi27qcaJs4AB4Oi5n5fV3as5oXatObDnuVD2rCIfG57PPhrz25SKP/65//Z8W
 B8tz9HJ2/MbGC4J7tlHUbfanOlDuopneurblLITvsu9S0UYh4HoHP3yHJ0/DxWoPRNtP
 vDBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXboSgx3qKpBOK34tYDbByIY1GIS30DaPCwXLKaH3gFlt7x/Yu71xeadRkMVs+ko/ZAa0mOgI1sXnA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9JWI4rKckhN+KPXOD/XLs0uVdtzD2Fb2SlxmS2zkt1nqadtRu
 o4GXxLDeACNiWfM0iwRpeHqCGWpSlFnLC6nITLbhQlg4eKXNxUYaNXDf4OPWFSFZgL1Bihef/Qo
 LiuG1adTBQtxNwrq0vJP6JoxgNnFBbKIUxn69TMzcQUEvm2xYbMKG6DwhbkPBnZImkWferNE=
X-Gm-Gg: AY/fxX43vWSjjk5/9HYYvkrs8Q8uBC/oyu/o+mT8AUOKaiMYzga1VC92nwyOfpRbgIh
 b2VGkGs+DwZ3OhVBMx4JtdeyTL3hZmCvBts4Zsxp4hNbDNtkR9Swhg6ei/3abrmE4uouLct1wl4
 XL/wNjBiSt0vbd4KJ4/u+vU4KHMtwGLDE/TaVFMyUF3UOtQrnNHHNEU3dseIqr+liP6Twy9sdTU
 lBj/zSJRvWBdocndCZB8zNVXcpfmda2xH1qfI74Eshly/9ZcjC4p+sIAgvQZDy41DkFxb/bjjmg
 rU3g/RNspQPwBlTqR8OmGxTcBcwtKINKUvXH0TFPiHnZMer98Gcx8R8s0nH3/zWlq1q+48kOjbD
 JqB59SS11uCAnGnZRhxmyGmDwRg+d4Y1hdU/3pkkwHh0PJzLiUBu9qXK+tNIb3PB554s0+yk=
X-Received: by 2002:a05:620a:7001:b0:8b2:2607:83d5 with SMTP id
 af79cd13be357-8c3893fa385mr1179354785a.75.1767937861132; 
 Thu, 08 Jan 2026 21:51:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNQP+z38zKgjcFwkfa/1G+ZNK+xmbjvdmPnRkKFboJurHGR+NtsX6o0sZ8QmOor5L8ELP7SA==
X-Received: by 2002:a05:620a:7001:b0:8b2:2607:83d5 with SMTP id
 af79cd13be357-8c3893fa385mr1179352285a.75.1767937860609; 
 Thu, 08 Jan 2026 21:51:00 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c37f4b8573sm729474385a.12.2026.01.08.21.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 21:51:00 -0800 (PST)
Date: Fri, 9 Jan 2026 13:50:49 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH v5 10/12] drm/msm/dpu: Add Kaanapali SSPP sub-block support
Message-ID: <aWCXOX+OKvWsqzNM@yuanjiey.ap.qualcomm.com>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
 <20260108085659.790-11-yuanjie.yang@oss.qualcomm.com>
 <k2orlbxktyqhuuoievurde5vglpbx2qqhkbmnasfnefax6p4tv@7hhmnyomtxyy>
 <aWBpEIHLtmCyZ5C8@yuanjiey.ap.qualcomm.com>
 <wgx4q3f4ktpoyq4u7rrquy7rs66hwidpr7dfxvw74w2xf53toe@kh3qy674des2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wgx4q3f4ktpoyq4u7rrquy7rs66hwidpr7dfxvw74w2xf53toe@kh3qy674des2>
X-Proofpoint-ORIG-GUID: lwAVvUj20m8pKhMBJYwWxE0mIPjW0Nq7
X-Proofpoint-GUID: lwAVvUj20m8pKhMBJYwWxE0mIPjW0Nq7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDAzOCBTYWx0ZWRfXyz4EFQDJUUL1
 CCYpiA0k5CobGnNHg/PXLMBczgb/s1brzdrOLvcc7ryvTnUfF47m33QN4p442RIBPls9IsBmyy2
 zaXfdSGXOr8DTaftBPH1UsOPjPibZy1ChoQsUKGfTy+HzCFzuXldsbp7rUnyg6Bf7aM/Nbg5fUv
 zuFG+WrQGuw54WajNR7a3ixb+RqgJsMa+ZH42YO3r9/R51f97ppg9dzY3KKLXUIyiaAQ1NXyRhU
 DdysoXx4TE36HLq+Rgrt04JrwJZoL5iMvULAScmYG1RAwglCx81wfTJcOakXYTCjJMybhwj/iDB
 JRViV61NXTjJG/LgX/bRI66c2O8tfLnzm7CjiSe71o2OBaNxPqAI88sgUZKtlMaf3otEm5/ZRFP
 6GPuNRUNBZ4TEms9/BBrYFSr5iFdeW2zTK190Ww3Gd7yrRaQI7SnYRl4Qn+PNTnReunRMRuKvBd
 ocLQPC4IaUnom8qSxKw==
X-Authority-Analysis: v=2.4 cv=ZfAQ98VA c=1 sm=1 tr=0 ts=69609745 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=5yRySJssvr81LtH4ww8A:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_01,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090038
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

On Fri, Jan 09, 2026 at 05:25:26AM +0200, Dmitry Baryshkov wrote:
> On Fri, Jan 09, 2026 at 10:33:52AM +0800, yuanjiey wrote:
> > On Thu, Jan 08, 2026 at 03:46:18PM +0200, Dmitry Baryshkov wrote:
> > > On Thu, Jan 08, 2026 at 04:56:57PM +0800, yuanjie yang wrote:
> > > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > 
> > > > Add support for Kaanapali platform SSPP sub-blocks, which
> > > > introduce structural changes including register additions,
> > > > removals, and relocations. Add the new common and rectangle
> > > > blocks, and update register definitions and handling to
> > > > ensure compatibility with DPU v13.0.
> > > > 
> > > > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > ---
> > > >  drivers/gpu/drm/msm/Makefile                  |   1 +
> > > >  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  14 +
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  14 +-
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   4 +
> > > >  .../gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c   | 321 ++++++++++++++++++
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  18 +
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 +
> > > >  7 files changed, 371 insertions(+), 4 deletions(-)
> > > >  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
> 
> >  
> > > > +		c->ops.setup_sourceaddress = dpu_hw_sspp_setup_sourceaddress_v13;
> > > > +		c->ops.setup_solidfill = dpu_hw_sspp_setup_solidfill_v13;
> > > > +		c->ops.setup_pe = dpu_hw_sspp_setup_pe_config_v13;
> > > > +
> > > 
> > > >  /* QOS_QOS_CTRL */
> > > >  #define QOS_QOS_CTRL_DANGER_SAFE_EN       BIT(0)
> > > >  #define QOS_QOS_CTRL_DANGER_VBLANK_MASK   GENMASK(5, 4)
> > > > @@ -475,6 +482,17 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
> > > >  		      cfg->danger_safe_en ? QOS_QOS_CTRL_DANGER_SAFE_EN : 0);
> > > >  }
> > > >  
> > > > +void _dpu_hw_setup_qos_lut_v13(struct dpu_hw_blk_reg_map *c,
> > > > +			       const struct dpu_hw_qos_cfg *cfg)
> > > 
> > > Will it be shared with other blocks (DS, WB)?
> > 
> > yes, _dpu_hw_setup_qos_lut_v13 will be used in WB, in function dpu_hw_wb_setup_qos_lut_v13.
> > 
> > So maybe I should drop '_' rename _dpu_hw_setup_qos_lut_v13 --> dpu_hw_setup_qos_lut_v13 ?
> 
> Yes, please. As you are going to resend the series, could you please
> also remove the function from the header?

Sure. But here a little confused.

Do you mean I should delete _dpu_hw_setup_qos_lut_v13 in header,
Or I should rename _dpu_hw_setup_qos_lut_v13 in header to dpu_hw_setup_qos_lut_v13.

_dpu_hw_setup_qos_lut_v13 is used in dpu_hw_sspp_v13.c and dpu_hw_wb.c, so I don't think
it can be removed from header.

Could you please help me clarify this comment?

Thanks,
Yuanjie
 
> -- 
> With best wishes
> Dmitry
