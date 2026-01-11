Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DDFD0E0A6
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jan 2026 03:19:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F8A610E209;
	Sun, 11 Jan 2026 02:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cdvhRfSN";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UHEKil8n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1A110E02C
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 02:19:53 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60B0U9j21448730
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 02:19:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=FIEneGTc12V5ccfuNdx8sn0J
 rZwEPXBUi8elZpJBgEk=; b=cdvhRfSNrZ6CPGPonsLi5NxVUKMYalgseN/x8n3J
 jGsoCglU8/jI1VFlxQf9Zm2/CablXixFz74T8iydUUKeKowa9t3MXcedpEcf8cAg
 CSiCrSqLOULPRahW52omyczIP9tbGqHDl49dDW4lc79ReN1qfPo9Q5SJZA80KMkL
 7LEYQeHhSE+AzOGPvk85GTS0FMl6adMsvQMslECIL9haKlEGo+06kliY6VEhmBK9
 OCJdXEnPymgbV+T1cZXVb5mp3bGxZ6PAQdrp01aMbC2uFDhHFxgh5pbUnD8pjk7D
 2HFYh89WwjvQNPkVWxn0wLQXBEi6BxvCcSCsZyAICbFLyw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkfhahg39-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 02:19:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c2bcf21a58so1472346985a.3
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 18:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768097992; x=1768702792;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FIEneGTc12V5ccfuNdx8sn0JrZwEPXBUi8elZpJBgEk=;
 b=UHEKil8n65K24mqVEjlhy1+Ahp6OvQJadTJdEDL6CS68TaSs3gmkYsFeTdoFTDUorY
 J35worrvvnDUm7aGLKWFBMiEFJz+lrvHFAPPwdKVEPLyn8q0KSlha5wD2GPMcumG97Bk
 6+2uyHUJHhoyjBTXPze8rk6mGKdLBygNcdCqSlEoKYvm2mAMtXdqgiD5SD5xiaOnQ4XY
 t6rETdoUsjTIlwTJ+L7XoVsJNijvreiaX+8d79QtL5sGC+Eefk2GrKrqSEfGve8wm9aJ
 Rer4E3eUQRgdQ9+A5UcfbQ/vwyrS4HKPe7SNJuSgIk5EPHVAPdtmu5RZi+H+1ISvWuJY
 4jhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768097992; x=1768702792;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FIEneGTc12V5ccfuNdx8sn0JrZwEPXBUi8elZpJBgEk=;
 b=tQAOq9qLgV3cWhpYiVxwmbdh3tqUCPF7hwbn0J5Gn5AhjNDCIXxGkS0pIVGZaj/Oho
 U+riV+pWUJyIb37avWJB7xjPq+/XMg1vLyi19cVZa0a36pV10aW54UnM1ijEyPp4ZKdb
 EsgECYHmyAPLdML2LTWeTxAFVtodVCsqNvaU8Xtf4T9GAb2/zVm8b5MhERXUAlzy4tXW
 2Uku5EF499X+vL+AukeRukojRHoxm8zxCeofEZ0dsZUybFzXZK6PE5eZbbfO/hgdJ+fD
 7iec8Ame3pRC+DEa/c/nBenwxaPQEAG4KWE+0oUV9o064V6DvN59bnP+eaDK95LYHhON
 H3TQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1kgV2zQHwCxzyYhKHClZaNMORCrA8W96av/Veg3alKyIO7dfIYq0p7hPVDwnCYHeA5xfw9+JdStY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKYFFhSsOhkNte4Tl//ctonxvDQ+OsRsX+43T6Lb7cTMz1u30J
 kpvfaLIkONO8z3vQt3CTDV+6ZmH3Km+afWXJpl75xWvlZSvfhaR4p+HXKntg0norCxm5oshI0iq
 x3EnsdKi5RkEWplZ6Fejh26bXJix7XW3jid+m5aw4AiFSC55QrjBMQz+EyZUtOaT3pHgmyZs=
X-Gm-Gg: AY/fxX4R9/e4/HFfh/PiFrIHvFvnlwL0sMBhS8J+ppCWMt1yh1eDcrmWN8pUFOwZ/nZ
 PKUqfq73O5zp/QBXROqqr7EYCkDHh0HAktTs7vsUYZlyob8OI1lNxsm+Vajkap88Q1f8mnFkPTs
 RVGGgcPUKd0PA4/HdkxjlZLrq6aV5QzmaQRAdZ3nBD5jVutcXDn7DVwPfOzDtLAKRRIM31Yv6RH
 yfc7m/cSgMdFu5q+sgRgZoiCvYbuEDl7dANk4a7c1+dKsKcChPT8mJ5ikj4J/9FUyGRDyasdnC1
 5M0PI2ZavL7ygvjIhKbLF86MGAiX+eybUiZQj+WQTVhO3IZ3VbRBDVMAL5d7+scvUWVT6U0oUFj
 rqJOTup3TN5P8tlEpnZndovpSSOCAwp/L6Hkv8bHsLStwaSPI8l1tXzv3dgAC8PiNdb8i4IsoBL
 YHGPqThCs9VLv4Ba78lazkp9k=
X-Received: by 2002:a05:620a:29d3:b0:8b1:2fab:30a8 with SMTP id
 af79cd13be357-8c389431a6amr1979930985a.74.1768097992246; 
 Sat, 10 Jan 2026 18:19:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHy7eVNr6zSzi0msAWA9F3Q1DRJEXtVz9kZnYvsEZVE86G+Qt0WTx1dTh8p07SiVfnFOk5Q4g==
X-Received: by 2002:a05:620a:29d3:b0:8b1:2fab:30a8 with SMTP id
 af79cd13be357-8c389431a6amr1979927585a.74.1768097991780; 
 Sat, 10 Jan 2026 18:19:51 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b6b60645asm3331421e87.9.2026.01.10.18.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jan 2026 18:19:51 -0800 (PST)
Date: Sun, 11 Jan 2026 04:19:49 +0200
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
Message-ID: <bqwfbvjq7lmuz6ggrtcsq3hvxrvtfznxrt3l4cjr7lwlzvmtfy@6wtnkgefkpck>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
 <20260108085659.790-11-yuanjie.yang@oss.qualcomm.com>
 <k2orlbxktyqhuuoievurde5vglpbx2qqhkbmnasfnefax6p4tv@7hhmnyomtxyy>
 <aWBpEIHLtmCyZ5C8@yuanjiey.ap.qualcomm.com>
 <wgx4q3f4ktpoyq4u7rrquy7rs66hwidpr7dfxvw74w2xf53toe@kh3qy674des2>
 <aWCXOX+OKvWsqzNM@yuanjiey.ap.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWCXOX+OKvWsqzNM@yuanjiey.ap.qualcomm.com>
X-Proofpoint-ORIG-GUID: YKPA_yA3N6nQ4msatuETx1cRY96a9Hu4
X-Authority-Analysis: v=2.4 cv=bOEb4f+Z c=1 sm=1 tr=0 ts=696308c9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=WoYqaP5JkDdGEjE3MmsA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: YKPA_yA3N6nQ4msatuETx1cRY96a9Hu4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDAxOCBTYWx0ZWRfX4GZQ/rbBnrt0
 1ga7++uIStxz3v3b6s+jl1o9pFdw7I3nm9KcxsoP804ENPDT01Sdk8th1butBZE5Y7zfcP/3glx
 ykuf/uLitc0v7v1rs6NowIjD53Ap0081okeVhCLXIN7BKbT642F8tRi902m4SA5/R4LWTLUVz/I
 CJUiCFYD3b4Bw6x5m6sdV9f/EhN3DQM088WAzA9r301PD0UjdXGVs1fbNKoAHumlpESh+zy3diL
 cf355rRMGMHAHZNYNhybh5dMJWnHcJjxE4C5rNjVYKH82ontf+hUTkRbynus3sNbcv56UPtk+6/
 YJ9yHMERKEUbwX/CDn9ir/JFxtN0SWrt79HiAN6u4QwN4Psr0ZOGBAk+WMMznEmmBPyw7nx+ocC
 WTdL2TOHN8CYAYgt8uYJPfuVTUTwV7EYt/bchXZr709Kc/sz1yuExmWThWPhs1Xa2rHsMBnOoqq
 0bM1pM7rD7vhpgSJ5xw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601110018
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

On Fri, Jan 09, 2026 at 01:50:49PM +0800, yuanjiey wrote:
> On Fri, Jan 09, 2026 at 05:25:26AM +0200, Dmitry Baryshkov wrote:
> > On Fri, Jan 09, 2026 at 10:33:52AM +0800, yuanjiey wrote:
> > > On Thu, Jan 08, 2026 at 03:46:18PM +0200, Dmitry Baryshkov wrote:
> > > > On Thu, Jan 08, 2026 at 04:56:57PM +0800, yuanjie yang wrote:
> > > > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > > 
> > > > > Add support for Kaanapali platform SSPP sub-blocks, which
> > > > > introduce structural changes including register additions,
> > > > > removals, and relocations. Add the new common and rectangle
> > > > > blocks, and update register definitions and handling to
> > > > > ensure compatibility with DPU v13.0.
> > > > > 
> > > > > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > > ---
> > > > >  drivers/gpu/drm/msm/Makefile                  |   1 +
> > > > >  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  14 +
> > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  14 +-
> > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   4 +
> > > > >  .../gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c   | 321 ++++++++++++++++++
> > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  18 +
> > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 +
> > > > >  7 files changed, 371 insertions(+), 4 deletions(-)
> > > > >  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
> > 
> > >  
> > > > > +		c->ops.setup_sourceaddress = dpu_hw_sspp_setup_sourceaddress_v13;
> > > > > +		c->ops.setup_solidfill = dpu_hw_sspp_setup_solidfill_v13;
> > > > > +		c->ops.setup_pe = dpu_hw_sspp_setup_pe_config_v13;
> > > > > +
> > > > 
> > > > >  /* QOS_QOS_CTRL */
> > > > >  #define QOS_QOS_CTRL_DANGER_SAFE_EN       BIT(0)
> > > > >  #define QOS_QOS_CTRL_DANGER_VBLANK_MASK   GENMASK(5, 4)
> > > > > @@ -475,6 +482,17 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
> > > > >  		      cfg->danger_safe_en ? QOS_QOS_CTRL_DANGER_SAFE_EN : 0);
> > > > >  }
> > > > >  
> > > > > +void _dpu_hw_setup_qos_lut_v13(struct dpu_hw_blk_reg_map *c,
> > > > > +			       const struct dpu_hw_qos_cfg *cfg)
> > > > 
> > > > Will it be shared with other blocks (DS, WB)?
> > > 
> > > yes, _dpu_hw_setup_qos_lut_v13 will be used in WB, in function dpu_hw_wb_setup_qos_lut_v13.
> > > 
> > > So maybe I should drop '_' rename _dpu_hw_setup_qos_lut_v13 --> dpu_hw_setup_qos_lut_v13 ?
> > 
> > Yes, please. As you are going to resend the series, could you please
> > also remove the function from the header?
> 
> Sure. But here a little confused.
> 
> Do you mean I should delete _dpu_hw_setup_qos_lut_v13 in header,
> Or I should rename _dpu_hw_setup_qos_lut_v13 in header to dpu_hw_setup_qos_lut_v13.
> 
> _dpu_hw_setup_qos_lut_v13 is used in dpu_hw_sspp_v13.c and dpu_hw_wb.c, so I don't think
> it can be removed from header.
> 
> Could you please help me clarify this comment?

Move it to dpu_hw_util.c

> 
> Thanks,
> Yuanjie
>  
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
