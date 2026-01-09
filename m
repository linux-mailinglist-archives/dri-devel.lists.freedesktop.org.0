Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A55D06DBF
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 03:34:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98DC10E213;
	Fri,  9 Jan 2026 02:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PSX89Ts+";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ewy4h76/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D2910E31E
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 02:34:05 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 608JFZ3l3019338
 for <dri-devel@lists.freedesktop.org>; Fri, 9 Jan 2026 02:34:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=pjAzBejL8JL4/IEU54yimhls
 JPnHrnNM1tihLzjWhOg=; b=PSX89Ts+xSMLquA4sVNQHb8D4md0+wCHyXv2hmxZ
 2nspvD1wkB846keLafxbhfJY6PfiqpmYW0n870KkOfUcHTLb4PzFlewXZoAqzRu5
 qdypCCcB69i830lVCMDpj++9waQGL0Hhl6tEfFxfIyszEah9VR/S0a6uYaSweDVx
 23sv/pT+xSMktGiZ5ZGHT3iyS7hz1b0XhTzFcLvHY/7I+6YJRJvKfhRAOvbS4ce+
 C1FOlTjN3OqqehOVpyverbwTzYSVbCXCcleCZsQyFtIFN4MFzn2+kjDsgW0RAVAp
 O36rIICbXTgp/4uZLcMq49YFdC/oJVfZYxcgVhrYaWq86A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjjk3h0hc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 02:34:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b2e235d4d2so1385669985a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 18:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767926044; x=1768530844;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pjAzBejL8JL4/IEU54yimhlsJPnHrnNM1tihLzjWhOg=;
 b=Ewy4h76/dZUSV0i2mIJMJlCozRrdb3p39Bjcv39nPsXzR2twGI48C7srHHRE/bpl/h
 Glsu3p+hV8S/6zRSkCEJPnFfqaUAPwmGThBlh+1B0axoBrm1sJrrja5Vjhjufz9d2yAv
 sDR+jar2XLhYlIsX0XkBhz2F2tE8Y/iHdwr4udDm/CX3ZTrnqukuRQxgyV4sE3nCKCtb
 1vqQPBXl4S2TW25dgvoUQquoJ1sn5TUMguEBNNTRw/BTGgRzsxfSfuXHR6fQppubn6lc
 Rd2d0VJ+qwzOT8R47QlYLHxIThoKZcPyeWvdrFf8q5JWe7se5nL34K4GZjeCnLfwwH8i
 WnIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767926044; x=1768530844;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pjAzBejL8JL4/IEU54yimhlsJPnHrnNM1tihLzjWhOg=;
 b=EZxHJmi4jb7rm1dE+49O99KZUfd/uett52kBljDOxpi3Ah/jqt+y758kM1Do0rt0Ap
 ZtWA2fhM/E+wHCF7/jSxN2KH0D9KS8e5TgStOQs3MbgjEdTRs2Qpf/XkVC2F2Rm5+b0J
 WezrApNVqGt1zjFAZsQYk/7zl333Y8o3MLl+tcRVPgzYVXOUw6EAbBK64IdVcihyNL2y
 Q5fXv7Ki2S/kEYV9Kj9mvhWZtBy5R90OjqoBPWxRNFqQ2B12G2fmIANiGE2Pd/RWN04r
 ulMYr0ItwykowMKGQu1qEjlcjpe5Kh9f5RWt/fsBpeAd2t7SrZorDj/Zw8XxnZJf1Xwa
 WfzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXG2CKFw/fepS95imDHtJ7PBl129Cj4m6lXAycIp54+0Y69YHu6UJH3p4wImUYson8agjreFhlUedE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPsHNDro61WS02sX8LVx6UGNROyfkVi8whY1jMPRAKnPkPQ/It
 Y+Awp19E09PNQS9uY5zHH1DuclTir8VNdteyAz1H3juFIFpls5iBQfjF5W0OnOPZPxlHYenD1Tv
 UKNh2b0yneJJtgT0szVcs+NmJnG6KFzE4TqPcXWxddPNxIh170XhBIf84AQ+MS/pLTs14eDM=
X-Gm-Gg: AY/fxX7tBzot8XicgBHzvaL3vXFjV9COQtQuQFwoY3WtUqmfVnAoQBFro3QSgFDdx07
 3WtN1gzIdO/WU8PkyMZvdOOWHAA1nJkfDkLPpXOhvp97MQhM/v4jWiDZ4Uuv504HlZjUTaJvI3p
 70kb4MHiPvemMtN3XBl177SIHA8rP7+O9Fsr4aeAQf/822lMq2I0aA9JLBVgK6Zk84wdtOPsK+Q
 1XA5JWI9q7u4cgkibfOvGpYZLAAdEHtHROAtTmM+dwfC7vKvT/rvoesizNUyyJ0kgkYweJ9YiNX
 v59f3jm4OyiwP/g93dbaTfmd9DnOZS83BY8raLNrTRiD/eej5/n3TwF36HHn4ul7wFZpXCVKLhy
 S9iS46LXhK2yaavf5OXfw9XiZYzFMDV7MP9osQyN5NKfowkjxlZj8/PE7LRipPd+L8jjZVNg=
X-Received: by 2002:a05:620a:690d:b0:861:119b:3052 with SMTP id
 af79cd13be357-8c3893f5aeamr1222803785a.51.1767926043862; 
 Thu, 08 Jan 2026 18:34:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENTUJZuyzQYyKEXuwN8Frzm1IG/sJYpeF6AXGlDy2+lmsKBcuMwUivs/WYg5LuI8xNKsyVkg==
X-Received: by 2002:a05:620a:690d:b0:861:119b:3052 with SMTP id
 af79cd13be357-8c3893f5aeamr1222800785a.51.1767926043408; 
 Thu, 08 Jan 2026 18:34:03 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c37f54427esm753223785a.48.2026.01.08.18.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 18:34:02 -0800 (PST)
Date: Fri, 9 Jan 2026 10:33:52 +0800
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
Message-ID: <aWBpEIHLtmCyZ5C8@yuanjiey.ap.qualcomm.com>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
 <20260108085659.790-11-yuanjie.yang@oss.qualcomm.com>
 <k2orlbxktyqhuuoievurde5vglpbx2qqhkbmnasfnefax6p4tv@7hhmnyomtxyy>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <k2orlbxktyqhuuoievurde5vglpbx2qqhkbmnasfnefax6p4tv@7hhmnyomtxyy>
X-Proofpoint-ORIG-GUID: mOeqTV5N9ULAutl7UHm0BQI51UiqDZeq
X-Authority-Analysis: v=2.4 cv=EazFgfmC c=1 sm=1 tr=0 ts=6960691c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Ry2Wfz2E4BY8SyJT9oIA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: mOeqTV5N9ULAutl7UHm0BQI51UiqDZeq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDAxNSBTYWx0ZWRfX810ao1dmauSd
 LdYSrj6VrQVHJrrF07sX5UZr2o596oavLa1uMhUMcqq0SqxPblmf6oyYzfz5iNT2gIngsZnw3qE
 7DXPO6Wjbi41X2UW35uyTDu0yZ0OxZWKBEcJkI3icNs6wITJSWE3HVZkQ1A4APxeuWCbr5vMSLD
 0tMyHdXUnQ9rpGLtA7ExZO7VY91xhnEanBWXzlfHDzrONs0nVzYJD3q5zxcWjjs1t0HvzEIqJYW
 tcxdxQTvDtqe/TJ5gDefFtmMdraPCe3P+Z38aqTElfc7RENrfsyS18EfCCGpAHbB1ZFpra3KKhF
 ZqodPj6T3HAd+s7wWsxGxF84wFZS0YJB19XzLm9WLUoO+ZZua89nXXsjZRyqyQtzUb9sPC53cl+
 XmW3+I7m34VoY5zfDwSfaILGdkoD29P601pPJ8dXb1NUXVoBEMriObD3yyqbSb0RwhF579iPQ+z
 AG2lCRG5HAGFa2LT9mQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_01,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090015
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

On Thu, Jan 08, 2026 at 03:46:18PM +0200, Dmitry Baryshkov wrote:
> On Thu, Jan 08, 2026 at 04:56:57PM +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > Add support for Kaanapali platform SSPP sub-blocks, which
> > introduce structural changes including register additions,
> > removals, and relocations. Add the new common and rectangle
> > blocks, and update register definitions and handling to
> > ensure compatibility with DPU v13.0.
> > 
> > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/Makefile                  |   1 +
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  14 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  14 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   4 +
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c   | 321 ++++++++++++++++++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  18 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 +
> >  7 files changed, 371 insertions(+), 4 deletions(-)
> >  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
> > 
> 
> > +
> > +void dpu_hw_sspp_init_v13(struct dpu_hw_sspp *c,
> > +			  unsigned long features, const struct dpu_mdss_version *mdss_rev)
> > +{
> > +		c->ops.setup_format = dpu_hw_sspp_setup_format_v13;
> > +		c->ops.setup_rects = dpu_hw_sspp_setup_rects_v13;
> 
> Wrong indentation.

will fix in next patch.

 
> > +		c->ops.setup_sourceaddress = dpu_hw_sspp_setup_sourceaddress_v13;
> > +		c->ops.setup_solidfill = dpu_hw_sspp_setup_solidfill_v13;
> > +		c->ops.setup_pe = dpu_hw_sspp_setup_pe_config_v13;
> > +
> 
> >  /* QOS_QOS_CTRL */
> >  #define QOS_QOS_CTRL_DANGER_SAFE_EN       BIT(0)
> >  #define QOS_QOS_CTRL_DANGER_VBLANK_MASK   GENMASK(5, 4)
> > @@ -475,6 +482,17 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
> >  		      cfg->danger_safe_en ? QOS_QOS_CTRL_DANGER_SAFE_EN : 0);
> >  }
> >  
> > +void _dpu_hw_setup_qos_lut_v13(struct dpu_hw_blk_reg_map *c,
> > +			       const struct dpu_hw_qos_cfg *cfg)
> 
> Will it be shared with other blocks (DS, WB)?

yes, _dpu_hw_setup_qos_lut_v13 will be used in WB, in function dpu_hw_wb_setup_qos_lut_v13.

So maybe I should drop '_' rename _dpu_hw_setup_qos_lut_v13 --> dpu_hw_setup_qos_lut_v13 ?

Thanks,
Yuanjie

> > +{
> > +	DPU_REG_WRITE(c, SSPP_CMN_DANGER_LUT, cfg->danger_lut);
> > +	DPU_REG_WRITE(c, SSPP_CMN_SAFE_LUT, cfg->safe_lut);
> > +	DPU_REG_WRITE(c, SSPP_CMN_CREQ_LUT_0, cfg->creq_lut);
> > +	DPU_REG_WRITE(c, SSPP_CMN_CREQ_LUT_1, cfg->creq_lut >> 32);
> > +	DPU_REG_WRITE(c, SSPP_CMN_QOS_CTRL,
> > +		      cfg->danger_safe_en ? QOS_QOS_CTRL_DANGER_SAFE_EN : 0);
> > +}
> > +
> >  /*
> >   * note: Aside from encoders, input_sel should be set to 0x0 by default
> >   */
> 
> -- 
> With best wishes
> Dmitry
