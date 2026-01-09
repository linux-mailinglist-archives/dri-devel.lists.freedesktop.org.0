Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9DAD06FB5
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 04:25:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A814710E7E4;
	Fri,  9 Jan 2026 03:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zf1fM6oc";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XUdx6e3x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C49A610E7E4
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 03:25:30 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 608IrBIC3142583
 for <dri-devel@lists.freedesktop.org>; Fri, 9 Jan 2026 03:25:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=c1FKPH8l16cGJoXn2zSMGvS/
 GHDw+D/u2O8httFkqlA=; b=Zf1fM6ocfch8lu4T30ShlcGytnsHHSpEUg4WJbhU
 07XBEUxk/4JF52i9Y8aonMQNcRzEnfRRuw4WRxQpSXSaSnBTtkcyRIyAuyVIdtcr
 fy22KIqnasQ4zCYZt2v7bDtY+DmOzab4F5tZgumRh+jdl0Q4MeqA/DnYvmVSM5Zg
 WfP+LJrCj4a2r3BsmtfP2i0WTVW0gipVonge2Iac90+Ty/emLIGCAjQw+ZgHq2k/
 Oqb/HMsO2ZHGZ86O5kYhTvLkoPpUY/hJ9nTgF/D/cFAk5K5B3irlCmHNhfdwpdAw
 IEAlt9dzRc+hIA0LLunIy8bnCNTgEbP5Z1mPrM9g8KVGdQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjj8j1557-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 03:25:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8bb3388703dso1431888385a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 19:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767929129; x=1768533929;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=c1FKPH8l16cGJoXn2zSMGvS/GHDw+D/u2O8httFkqlA=;
 b=XUdx6e3xkYJngs4uwqxXcheGTSOTggSgIvR+HQdKwwNOJQOFxIXiiP8nt+AbEucUiE
 yLutAnbQNuM7rY2EZGdDemhb1eg5jAxOb2j/LSbtbVNj9Cl4fCfhx0iMufSLDk4P0ht/
 mzWULdz2McQP+QSuKJPhm2W27xT+WfP4L3HehQm/uP/oy8uR5q/6aCTShyIRr+5JmfsO
 chK9D3bVTDx/6nKPH9+7OLcCZ3OACkLWT/YFQu4lpmdFYNurRpj6EMsGML4ADfwCo0Pd
 cytSSmIKr6jInaMs0WuchqC4v0HRFvq9DscCNOfQsLvkSvHC0LLkstQhFpD/SgxDbO7f
 vzMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767929129; x=1768533929;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c1FKPH8l16cGJoXn2zSMGvS/GHDw+D/u2O8httFkqlA=;
 b=GRiFrodixZpOhKJ8gVNMYpV53yULyv9rfaF+Xzycvj7ivxo7uvwoq5C7v14gue5V1S
 wVaOS/GZabJcIqB5uHsBlRTUzFrMIElUyxzHh7T6qqaIDeiWKygygaMMsSkzqi7tnXmh
 cqsKoXCgl9CqNWJoWSidr6OeEhuNHWaAObe43nWZaH0flW/IYVeTSuhAUGt/4RMgGzl5
 mtQ8UAov17X8zxsilfzQ9rde83R6WqNiIzF6cyL7Gp65L9UsBvPirfdJpaNrhHM8pKNX
 MPSitlK4uOZCdUHiCjXbeitzZDrLrTIU0tBA2dtDag2PEhdtRUm7UJG/0zqD8OtcdraS
 Veww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHdff9TbisQeoam/X6uUTTPBnSgR5aij8vbJo2iOOcRFvlASl8ALqt87RKGrnUfQiniQ4ISZAR15c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyt0TGbr5qnsxoKFxxwh2IK/u6nr9wHQv1Eh3e+OrNg3XjaMcUS
 3CGkVbK150ePWWY/zviLSvmhCh6qgOl/yEJC3b+t6BSMFgKQlMWB6TOTW5gE8rg8BHTGl0dX1My
 zzUF/Siq9mske4aPsgjCQ2drtrwKLpEVbhCHKuRn1kvne582Ly4hP5rI9rWjLwXmhFt9z8VE=
X-Gm-Gg: AY/fxX6G8B987YCK3qepiUkfz3BEnFF+ZWcRAYvqCZ7MwIEMNFrZZ0fUp3/pcuWq1Se
 M+1iXB9sLqoVHPGJXejxNKI00PZZ28StntOu6ymxGVSbGndeKOcjCpsTEIvwqSz7NMKMI6EWCxy
 HZkFeC/NlRMmCRu5RhCHYe1T1wANNpnoXmNupVtaVd2r484J3u/RpEreELJ9L7BlmS4YtdFw0Yt
 LyiScRAFyju9OYJHHYbXX/LYyvVgXDv48XUBhATFQnrPChapgw+9yvJMd63ZnVZQtx9JxMwvOS2
 4qcjBT6OuJrWLx4tWhgUnZ8vyzNd2FSfFGtRvLirR2cbICF0RpQIF/WXTnFWoFq3xKPHZF0u5X9
 HT/54w1LapUb7nwzXKwC3X+ZvL7hsAZJnAxvygN1COYL1gXJWYkz5ZoglJINS7pzuG/6ZfGA4Hx
 pzO/p8e8bXozEL//6yysik7lc=
X-Received: by 2002:a05:620a:4802:b0:8ab:8037:509c with SMTP id
 af79cd13be357-8c389379d1cmr1039303085a.12.1767929129043; 
 Thu, 08 Jan 2026 19:25:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7POTAZbGqCpGluds596QJkhD/U1qqkBoYNpWwEpul7vXI/0CQ8FgavMG4km/E65OtbPFIdg==
X-Received: by 2002:a05:620a:4802:b0:8ab:8037:509c with SMTP id
 af79cd13be357-8c389379d1cmr1039301285a.12.1767929128612; 
 Thu, 08 Jan 2026 19:25:28 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b796a135esm783614e87.50.2026.01.08.19.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 19:25:27 -0800 (PST)
Date: Fri, 9 Jan 2026 05:25:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>
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
Message-ID: <wgx4q3f4ktpoyq4u7rrquy7rs66hwidpr7dfxvw74w2xf53toe@kh3qy674des2>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
 <20260108085659.790-11-yuanjie.yang@oss.qualcomm.com>
 <k2orlbxktyqhuuoievurde5vglpbx2qqhkbmnasfnefax6p4tv@7hhmnyomtxyy>
 <aWBpEIHLtmCyZ5C8@yuanjiey.ap.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWBpEIHLtmCyZ5C8@yuanjiey.ap.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDAyMSBTYWx0ZWRfX/XP5LtI+FWkN
 Q5NsjrN85QRav85dhuB19WgREGvLHtIjGhWrE0c9kRQ6Q+QNhSYzqCPQYoCc9cHK5GZEg5fKovS
 Vsh7NifxrSuswG7ZyJhBlHHQiOmyJXN1cSdES9CnGOZLdudr39IP3tndlYV3rYEdkqb6Cm5QFSD
 yELs6Sntu61CTgNmMsAZOgyy4+OyuVenjPAUvdZWAycvz/k+yiDk7W56RG6wdm6u9hY1FqHFbAY
 2VdXdkdMoaLO0fg1gMDJrlrqvKCE9+L6hdQBGGpAJxeyk3rxADMMAkcd9ukRG6jCtXTohKPS5mx
 5boFh/k9vWO9Xmt5V/exHQjHU8uYU0L0rz1Bw9J99WVxf22xvBZ8iRvs3eFx7R1/0H0n6Qcn3/n
 Ws9S11myfQ7GSDUwyDW/C9OQJxRekcmTYlFgQMeT45Ro6S3cfm9/7Vt4QS0idV26uPydJbYYvij
 p+H983igaxeHErBZtAw==
X-Authority-Analysis: v=2.4 cv=JIs2csKb c=1 sm=1 tr=0 ts=69607529 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ewj0gPjmfU4c8-7OqbcA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: h88aJs7XBK6EEpnKWKWnKkpvWHfvPWQZ
X-Proofpoint-ORIG-GUID: h88aJs7XBK6EEpnKWKWnKkpvWHfvPWQZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_01,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090021
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

On Fri, Jan 09, 2026 at 10:33:52AM +0800, yuanjiey wrote:
> On Thu, Jan 08, 2026 at 03:46:18PM +0200, Dmitry Baryshkov wrote:
> > On Thu, Jan 08, 2026 at 04:56:57PM +0800, yuanjie yang wrote:
> > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > 
> > > Add support for Kaanapali platform SSPP sub-blocks, which
> > > introduce structural changes including register additions,
> > > removals, and relocations. Add the new common and rectangle
> > > blocks, and update register definitions and handling to
> > > ensure compatibility with DPU v13.0.
> > > 
> > > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > ---
> > >  drivers/gpu/drm/msm/Makefile                  |   1 +
> > >  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  14 +
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  14 +-
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   4 +
> > >  .../gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c   | 321 ++++++++++++++++++
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  18 +
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 +
> > >  7 files changed, 371 insertions(+), 4 deletions(-)
> > >  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c

>  
> > > +		c->ops.setup_sourceaddress = dpu_hw_sspp_setup_sourceaddress_v13;
> > > +		c->ops.setup_solidfill = dpu_hw_sspp_setup_solidfill_v13;
> > > +		c->ops.setup_pe = dpu_hw_sspp_setup_pe_config_v13;
> > > +
> > 
> > >  /* QOS_QOS_CTRL */
> > >  #define QOS_QOS_CTRL_DANGER_SAFE_EN       BIT(0)
> > >  #define QOS_QOS_CTRL_DANGER_VBLANK_MASK   GENMASK(5, 4)
> > > @@ -475,6 +482,17 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
> > >  		      cfg->danger_safe_en ? QOS_QOS_CTRL_DANGER_SAFE_EN : 0);
> > >  }
> > >  
> > > +void _dpu_hw_setup_qos_lut_v13(struct dpu_hw_blk_reg_map *c,
> > > +			       const struct dpu_hw_qos_cfg *cfg)
> > 
> > Will it be shared with other blocks (DS, WB)?
> 
> yes, _dpu_hw_setup_qos_lut_v13 will be used in WB, in function dpu_hw_wb_setup_qos_lut_v13.
> 
> So maybe I should drop '_' rename _dpu_hw_setup_qos_lut_v13 --> dpu_hw_setup_qos_lut_v13 ?

Yes, please. As you are going to resend the series, could you please
also remove the function from the header?

-- 
With best wishes
Dmitry
