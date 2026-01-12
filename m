Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF37D10A7B
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 06:52:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0DFB10E182;
	Mon, 12 Jan 2026 05:51:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="T58iTMoW";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VGQ7u/gE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF33F10E041
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 05:51:58 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60BGXW4l2959430
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 05:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Td6ocBeHnz0kcfIs1Fr0o+wo
 3hzHfbfDLUrMEyzcrBY=; b=T58iTMoWkjRpa2aSIJqwdm/7/9OP3vMOlwwNJIRS
 +iSPQ/HgJx/tfVEwkGowLd2eHckrTlrKx28cmsDcNcj11RV0nBs80Xw3+1A1mm/P
 GRdRXaGJnvh5hPamxEXtwmyPkxUsPIAZ+vIAgnJ/peaAiZJMMz8SPYt0vVt20Szn
 5Mg8lkcMSt/mm9Vw4RgfD049aRktnD9lberbvNku4bGLfyycuO81TN1XCZfmRJLn
 IXtT07Ip0zoIgdps8mr80VUIc6r+0cBpIyRIZvmtwPmy+lhCrGW/mjE82JMUFkkK
 mq/0gfJxIwytEMk/HDzCE2WFhXvYHVbFbhd7T99KEam6lg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bks25atua-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 05:51:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-888825e6423so119902216d6.3
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 21:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768197117; x=1768801917;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Td6ocBeHnz0kcfIs1Fr0o+wo3hzHfbfDLUrMEyzcrBY=;
 b=VGQ7u/gEc2ArJkww1f6TRuLr0n8xi//oQDP55FwugqZhotq0jlJt5KJ9zljGD7E0Vq
 xSfFJGU/ar2Hy9QfbvztiBMatqdw6bSVmuZDTA5CoG6XL4kmFFAXe3VzP/iY6zBOpxfs
 8dEYicqQGCsuvgImqxKYJUsad2wYwvSjBL8HiLFLlucZ02kGY2hhl0xBss6edPYwLikT
 BWZsrHKh4VQ7HfrO1Gs8bBpt4YjhstCtPOb7uUdhIalbnKCUve02lZFAMKZyBXDzzd3l
 geYmlqCBezjetp6HOoN7t9Ygp3YKBTWK8ZWiWsda3iXbWm6STQpyQcY8I3UL/N9I9K5C
 V97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768197117; x=1768801917;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Td6ocBeHnz0kcfIs1Fr0o+wo3hzHfbfDLUrMEyzcrBY=;
 b=QVcenrDs2FCU5O4vLryZfBu57OLB0FWBa521PKyKFFYbbL3EoxwTl8e76DPIZpWxm0
 6fqDFj3hdQB0bcTy7RG0TfFLIzRageIKqicAVIs+W7Ixt48dVPF2Y84Wqx9mJYxS8Rcf
 fagS2Sq453J1Ij/5ZqZO9cpMyUIK4pmEUf2Z/mat4Q7QVgp3wdhxWoS25TInJQvbH8cT
 L9pT48gwBAF05yk3/BqmWIY6irwPoSuh6IOBQN2Mn0zzIpRgZ6Lg1AFcLZSWwOES0dP8
 H7SdHtD7ST4y6e5HxDPr4HeWVa9wujQr4QjJZeP3j/h3+sqNPdbZ3mnByrUF952vqkl8
 e3Dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZaanFIlZVXYWSU45fy8xiRtUvb0ro8++7pPWE5nn9kW81Kj1Su/yUhJ67+GAFFGfOkPF02Sw2YjE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxyyU620gEj0K8BqmAnpvv5NFlqn363v3aIYFmBCSaN9MVWiEUc
 Jh2IKHG/n/x1zBL/eUsp7bRafyVMRdkGer4u0PXjlewmGm3lAE/Xg1TFoS2n7U5pH6096itEUpW
 XTRZ+fPnwYmx2td0k4e+Zq0adfbym+VCJRYlQZTUo7NpzQYBTEbtT0tglboSdRGHOa92/yQE=
X-Gm-Gg: AY/fxX4LfH0zX1FWI1GrotfpgIXFRBaL1O+62BiGcxAeFRadIQql3N6JmcGO17dxzmW
 vkD46dqQIuC0medVm8CPfgicj6J3FKZrUnigXqdFjjBQGUn8plOdvFbaArcmmb7aXhCu5oCB8K9
 ot5seQyHGeIYmxWoJfJFixxBPjYGzvqdXWBu4QlSya9m9AxjYHRo0RwbCkL4hd8ISd9R8LQORep
 iw6UBBqGxdVDtcR6VTueyzVEhYw2f5xbbRH4WgAdcldUL2n5YMSXs8CbjETx9Mesg1BgHfrfGoW
 ZMDl46t3GqWh89EDQCni8JkT3844CG1dj0aA57jl44fgua9Rqv2ZVmQf0t5CMoHqtbF4+pNBPB6
 hfLhw4W5/OtA9yDEEzn27C/EzWRo+mFQKwgqC/SL/oeabRPjS2ElrOECrjq/K3dPuI9nV6iE=
X-Received: by 2002:a05:6214:498f:b0:88a:4452:750b with SMTP id
 6a1803df08f44-890842d8089mr231498676d6.60.1768197117117; 
 Sun, 11 Jan 2026 21:51:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMwmKE+BswERgCS/LJ0lJR4KnAfJVfiurAyj/wNOuhWJpyqEv6OKbBkeQCT6o36SNFMxdxIw==
X-Received: by 2002:a05:6214:498f:b0:88a:4452:750b with SMTP id
 6a1803df08f44-890842d8089mr231498566d6.60.1768197116652; 
 Sun, 11 Jan 2026 21:51:56 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8907725ffc7sm129678696d6.44.2026.01.11.21.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jan 2026 21:51:56 -0800 (PST)
Date: Mon, 12 Jan 2026 13:51:46 +0800
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
Message-ID: <aWSL8gAJllBMnA5S@yuanjiey.ap.qualcomm.com>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
 <20260108085659.790-11-yuanjie.yang@oss.qualcomm.com>
 <k2orlbxktyqhuuoievurde5vglpbx2qqhkbmnasfnefax6p4tv@7hhmnyomtxyy>
 <aWBpEIHLtmCyZ5C8@yuanjiey.ap.qualcomm.com>
 <wgx4q3f4ktpoyq4u7rrquy7rs66hwidpr7dfxvw74w2xf53toe@kh3qy674des2>
 <aWCXOX+OKvWsqzNM@yuanjiey.ap.qualcomm.com>
 <bqwfbvjq7lmuz6ggrtcsq3hvxrvtfznxrt3l4cjr7lwlzvmtfy@6wtnkgefkpck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bqwfbvjq7lmuz6ggrtcsq3hvxrvtfznxrt3l4cjr7lwlzvmtfy@6wtnkgefkpck>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA0NCBTYWx0ZWRfX8GvS4tKDPanR
 +3FqxnuKvVFkxGCCssAXXw4j/qgmOE0U1xuguvnPsGCNhf5SK4bK96QN8RHrlMDiEWkEIsjg6OH
 A67wGgarEiCF4k7e9GYNQ1l95dLEssdPYqOHKDgJjlg5FQw66kosjMwr/BkhiIXwBqWGUIF1yna
 YgghGOIt1vAE/sNFFicvOmh5DL9DMD9lOKdsPhiFdCaPjAZ/FrOIs/uMg3GBDTqUMKeYBl0vmaF
 c6HIAUujRhnT/Ik0Pk0bn9BNfqdXaqTKx/UQKgqngv5Ey97lZjW+xfH/5PwuOgFEj8+EN4O+mAf
 pt/HGzgNtUKC91cPhsbGq6ZrCLF4/Mjt5yF1dFyFMsogLXT8i+5wsfgc2l/2ZwzJp9vLf8t/BQN
 g4gb1An0TVVndDw4VJF8MtTxEU1QtHGQtSwtyhRdsnPdq5SUo6CMSGMErgiKcBkVBg7VyV5RBDV
 2E/hmzknSXncJRZi/HA==
X-Proofpoint-GUID: 5n5BuiWYqg63K_VlTMnIcBL9Byk6Q5pL
X-Proofpoint-ORIG-GUID: 5n5BuiWYqg63K_VlTMnIcBL9Byk6Q5pL
X-Authority-Analysis: v=2.4 cv=EMELElZC c=1 sm=1 tr=0 ts=69648bfe cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XksDqd45YQGufXC9n9wA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120044
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

On Sun, Jan 11, 2026 at 04:19:49AM +0200, Dmitry Baryshkov wrote:
> On Fri, Jan 09, 2026 at 01:50:49PM +0800, yuanjiey wrote:
> > On Fri, Jan 09, 2026 at 05:25:26AM +0200, Dmitry Baryshkov wrote:
> > > On Fri, Jan 09, 2026 at 10:33:52AM +0800, yuanjiey wrote:
> > > > On Thu, Jan 08, 2026 at 03:46:18PM +0200, Dmitry Baryshkov wrote:
> > > > > On Thu, Jan 08, 2026 at 04:56:57PM +0800, yuanjie yang wrote:
> > > > > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > > > 
> > > > > > Add support for Kaanapali platform SSPP sub-blocks, which
> > > > > > introduce structural changes including register additions,
> > > > > > removals, and relocations. Add the new common and rectangle
> > > > > > blocks, and update register definitions and handling to
> > > > > > ensure compatibility with DPU v13.0.
> > > > > > 
> > > > > > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/msm/Makefile                  |   1 +
> > > > > >  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  14 +
> > > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  14 +-
> > > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   4 +
> > > > > >  .../gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c   | 321 ++++++++++++++++++
> > > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  18 +
> > > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 +
> > > > > >  7 files changed, 371 insertions(+), 4 deletions(-)
> > > > > >  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
> > > 
> > > >  
> > > > > > +		c->ops.setup_sourceaddress = dpu_hw_sspp_setup_sourceaddress_v13;
> > > > > > +		c->ops.setup_solidfill = dpu_hw_sspp_setup_solidfill_v13;
> > > > > > +		c->ops.setup_pe = dpu_hw_sspp_setup_pe_config_v13;
> > > > > > +
> > > > > 
> > > > > >  /* QOS_QOS_CTRL */
> > > > > >  #define QOS_QOS_CTRL_DANGER_SAFE_EN       BIT(0)
> > > > > >  #define QOS_QOS_CTRL_DANGER_VBLANK_MASK   GENMASK(5, 4)
> > > > > > @@ -475,6 +482,17 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
> > > > > >  		      cfg->danger_safe_en ? QOS_QOS_CTRL_DANGER_SAFE_EN : 0);
> > > > > >  }
> > > > > >  
> > > > > > +void _dpu_hw_setup_qos_lut_v13(struct dpu_hw_blk_reg_map *c,
> > > > > > +			       const struct dpu_hw_qos_cfg *cfg)
> > > > > 
> > > > > Will it be shared with other blocks (DS, WB)?
> > > > 
> > > > yes, _dpu_hw_setup_qos_lut_v13 will be used in WB, in function dpu_hw_wb_setup_qos_lut_v13.
> > > > 
> > > > So maybe I should drop '_' rename _dpu_hw_setup_qos_lut_v13 --> dpu_hw_setup_qos_lut_v13 ?
> > > 
> > > Yes, please. As you are going to resend the series, could you please
> > > also remove the function from the header?
> > 
> > Sure. But here a little confused.
> > 
> > Do you mean I should delete _dpu_hw_setup_qos_lut_v13 in header,
> > Or I should rename _dpu_hw_setup_qos_lut_v13 in header to dpu_hw_setup_qos_lut_v13.
> > 
> > _dpu_hw_setup_qos_lut_v13 is used in dpu_hw_sspp_v13.c and dpu_hw_wb.c, so I don't think
> > it can be removed from header.
> > 
> > Could you please help me clarify this comment?
> 
> Move it to dpu_hw_util.c

Yes, will do move _dpu_hw_setup_qos_lut_v13 definition to dpu_hw_util.c.
 

Thanks,
Yunajie

> > 
> > Thanks,
> > Yuanjie
> >  
> > > -- 
> > > With best wishes
> > > Dmitry
> 
> -- 
> With best wishes
> Dmitry
