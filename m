Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFD6CC3866
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 15:22:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 136F310E720;
	Tue, 16 Dec 2025 14:22:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lWukNm+J";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XgPIF4o1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D64B310E720
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 14:22:37 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BGD8bKd2573215
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 14:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=zsCbIy32Cwj+WoynZZ40HZ1L
 JqhDsSYp7ZCaTJx1JSs=; b=lWukNm+JCv/T1CqfsFoYJN8uBZ1CHKhUh3pMNqka
 99vpOQ+ADecAWfvpvAtfzhuQQYwviNO5wRMyGZoD3TW5WguwN9/GiDGsBf+Tqk04
 FkbBvOs6rPEYfqIai1blsR6YxbieqY5VaohlttAhBws6PlkayTyoUItxgSwr0MD4
 k/o6IGIhGfiR7Q2XnE8Fc93cNMigc27VBeYJqWHI2ptnfFMVp3WkPadtGnmk3Txn
 AXuoLk0WCvMYfE7xdH4DxY0CxI5ZEuSCjR2z388oC7ccrJYXOnXPrOzsZTqHaY3z
 0rUM2c7VibI49TIEorAVtoxtMDqhi4qHhc6bTT6rwYZd4w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b33thsfag-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 14:22:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ee41b07099so56112021cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 06:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765894956; x=1766499756;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zsCbIy32Cwj+WoynZZ40HZ1LJqhDsSYp7ZCaTJx1JSs=;
 b=XgPIF4o1581MPXqVKHESx/jJ6pa7324GLqtd5xToLegP8VOjFMkxSW+KpnejQaum3J
 V0FKyisuF4Ip3syHqAMa0hmLW8TGGpsnyrVUP37CzdeASNeWdjv0rfuyRwZOXbRFwqHB
 qzKBVzMbKHBEXrSosMjKsNGyT+E7hZgRRSJTTIE4HLmZqqq4lUcKGTLlsAhjXkeTmkHU
 sA7Q9pxS8KwKp/GjFQMM799LabLzXmMDG/8YdRQaklHdwtGyg9lEUjJ+uFgMwjG9SeVk
 93ifqITVyL1sxaNfsbsrvO/NX4P8mT+ym8ZHRv4GQkfTXonjr1rZxdguF/QU0i5BQddz
 5udQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765894956; x=1766499756;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zsCbIy32Cwj+WoynZZ40HZ1LJqhDsSYp7ZCaTJx1JSs=;
 b=ikem4vkS+RZlRBT0tWqJbgNfnfFLTICsgoC3P8qSkmaDp+aOLgy/gQ3fNgRjmC0k5g
 QjUvzClBoeKRjuZ/RnIWcap6tMAz3lNJ1U+8iTJhP8XvKwWWaCrSNaJJboYBcPRywlE2
 A6iZBFDOOR3jJdHs6494EpgY+R+Kaa7w2BH6knFWOatygxAFZg2n0sZTZbIkbDROsaL+
 bC7p/3D5R5wu0spllYUkgoBvdWci/ojb8NeK+u/Z/QT8ei9yKtTsTGKoRnMMNf4zGLNN
 Md7CPKQ1jX1jWPPPgxmF735aZQV3In6LyDvD2m63m3TYWxjr/Pqi1C45a42lBogHL1Cu
 7ffQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpdRsCXm95G9zdTctYHqCKzuSV4DC5RJRhPg4zXKG64ftQgQpd31LXWs+LFylmMGCt3OBStyk8F+w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2Lc7IGEDuBlNidJQT5LyVg9wLHukuEwv9ou6z8vfwffaDQ9Dk
 xAYbo+a6vYTE9k3/rNfJbPw6lQ4BTX9eRi+Ew3JQjZvrQVVOKF2dlYNJDKU8jXk6ndelpae7D1v
 LubJ+WHhzv5S7g0hZ8TeTwOOO1zezxHBBLldm3s1cFGyv2qy88QC+LWTEfrZRfDPH/YTSfUw=
X-Gm-Gg: AY/fxX6Q4o8Oi8+KApGgdhCGab4KykDlz+tciU1hfWLl91DkLlIad7IJ2o2mr4Pxk/u
 bgeXvoJF48Si92R923SFjAkuas89c59HYwInXkMCwuUd8sndDruyt5puL/jKyJSAeVfvPAMD3Cb
 XkiI9fA+saWp7APteFU5NVRFTu03GgWS5p215NCHDv7Dsnr47kJXIn6K4Kjik1mP3RIjRZl7smG
 EgTr5UWmWZnZ0hzLRxxzgPDg+7u1YWgL6dKiCyM3u1IcXOPuS+uuVuIJMp+jgyyXsXUjk/4FdLQ
 J3tkiAsackY68za3Zwj8mC0RRJCjyhQQBKYh3/eg1d8tXbeQUjqvUdw35TAxilnSVS6n3VkGY0o
 VXkoiLOiYP85hkR2FH50JvSNQCKx2XfBkAld/ZPdLcEumYZAE2krIlqw3Uk1xmyTGhcAuBkksuM
 mFOMKuqDJ67PXkGMyHNqOYnc0=
X-Received: by 2002:a05:622a:8d01:b0:4f1:e46b:9dcf with SMTP id
 d75a77b69052e-4f1e46ba93bmr118999601cf.26.1765894956155; 
 Tue, 16 Dec 2025 06:22:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEv9PxH1rNJmSfmr9K+GrJ3XvoNdbec/804VTT9AepOhF1+SUPJLGEuLKu0rVntfqmNSvMsA==
X-Received: by 2002:a05:622a:8d01:b0:4f1:e46b:9dcf with SMTP id
 d75a77b69052e-4f1e46ba93bmr118998001cf.26.1765894954709; 
 Tue, 16 Dec 2025 06:22:34 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37fded7629esm37232451fa.24.2025.12.16.06.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 06:22:33 -0800 (PST)
Date: Tue, 16 Dec 2025 16:22:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 yongxing.mou@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com
Subject: Re: [PATCH v3 10/11] drm/msm/dpu: Refactor SSPP to compatible DPU
 13.0.0
Message-ID: <gljkq6jijsprelq7qmgai4g7mqlshezdx755n3ivbxjdf6uw73@dz3mkct7g3ry>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
 <20251215083854.577-11-yuanjie.yang@oss.qualcomm.com>
 <pzwgxqdlpmrbylguvzwypry3fix6wi7kxu3jlv3yzdtb3unnrf@wfzvuhvhmue5>
 <aUECnz+INNuLjHR6@yuanjiey.ap.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUECnz+INNuLjHR6@yuanjiey.ap.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ZIPaWH7b c=1 sm=1 tr=0 ts=69416b2d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=59m7dkejid0BOjw-uj0A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: upFNE7GVk6z74Wx7_d8Mj5nzZzzop2FH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEyMyBTYWx0ZWRfX3h5sXa2pCtq6
 4mui+JaJa9lprfFFzb3hFK9GnDX2h13/IaCaDF/1VI8iweWSdcBNkKBAH3YcsS1Dk0+Gj/fYryy
 0p/MyrRrmYQRK5IXf1zJxqLUhE9939LKFBU/axEAzeMuoQcUsCHJdQXnRQC8mnhmLvts0IJQGB8
 W39NdEcreoGjDV/u+la59DougRtEAXlpvVIb/2gHBgtMYK70xZnPsOJA6pBQn9MMeyapxECjT4Q
 +yK3gjgStF2aml+XcAD34b5IFPIp8IrfpvHIcRT1Z7lOV8gUn6EdXNUHUAcSE7VMfbplVtI0iu7
 AkKI6AOqmB2xQCeylDg/zV4i6kr7d3wpRbll2xcAOH9nJAjuRt7bUdzDyuOheHXraL5wHvvZCa6
 ghq8etEeDdx9QlNy629B3Rdoj35AAw==
X-Proofpoint-ORIG-GUID: upFNE7GVk6z74Wx7_d8Mj5nzZzzop2FH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160123
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

On Tue, Dec 16, 2025 at 02:56:31PM +0800, yuanjiey wrote:
> On Mon, Dec 15, 2025 at 10:08:22PM +0200, Dmitry Baryshkov wrote:
> > On Mon, Dec 15, 2025 at 04:38:53PM +0800, yuanjie yang wrote:
> > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > 
> > > DPU version 13.0.0 introduces structural changes including
> > > register additions, removals, and relocations.
> > > 
> > > Refactor SSPP-related code to be compatible with DPU 13.0.0
> > > modifications.
> > > 
> > > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > ---
> > 
> > We've fixed the order of the interrupts patch. Now you are adding SSPP
> > customization for 13.x _after_ adding the first 13.x support. Is that
> > supposed to work?
> 
> Yes, will reorganize order.

And after comparing with v2, I'm really surprised. It was better before
and then you changed the order of the patches. Why? You were asked to
split it, but not to move it to the end.

> 
>  
> > >  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  15 +-
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 155 ++++++++++--------
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  52 ++++++
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  18 ++
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 +
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |  17 +-
> > >  6 files changed, 191 insertions(+), 69 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > >  		switch (ctx->ubwc->ubwc_enc_version) {
> > >  		case UBWC_1_0:
> > >  			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> > > -			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
> > > -					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
> > > -					BIT(8) |
> > > -					(ctx->ubwc->highest_bank_bit << 4));
> > > +			DPU_REG_WRITE(c, ubwc_ctrl_off,
> > > +				      fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
> > > +				      BIT(8) |
> > > +				     (ctx->ubwc->highest_bank_bit << 4));
> > 
> > I have asked to drop unrelated changes. You didn't. Why? You are
> > changing whitespaces for no reason. It's just a noise which hides the
> > actual change here.
> 
> here ubwc reg layout change in DPU 13.
> 
> ubwc_ctrl_off
> veriosn < 13 
> reg: SSPP_UBWC_STATIC_CTRL
> verison >= 13 
> reg: SSPP_REC_UBWC_STATIC_CTRL
> 
> So I do some fix.

What does it have to do with the whitespaces? Fix _one_ line.

> 
> > >  			break;
> > >  		case UBWC_2_0:
> > >  			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> > > -			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
> > > -					fast_clear | (ctx->ubwc->ubwc_swizzle) |
> > > -					(ctx->ubwc->highest_bank_bit << 4));
> > > +			DPU_REG_WRITE(c, ubwc_ctrl_off,
> > > +				      fast_clear | (ctx->ubwc->ubwc_swizzle) |
> > > +				     (ctx->ubwc->highest_bank_bit << 4));
> > >  			break;
> > >  		case UBWC_3_0:
> > > -			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
> > > -					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
> > > -					(ctx->ubwc->highest_bank_bit << 4));
> > > +			DPU_REG_WRITE(c, ubwc_ctrl_off,
> > > +				      BIT(30) | (ctx->ubwc->ubwc_swizzle) |
> > > +				     (ctx->ubwc->highest_bank_bit << 4));
> > >  			break;
> > >  		case UBWC_4_0:
> > > -			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
> > > -					MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
> > > +			DPU_REG_WRITE(c, ubwc_ctrl_off,
> > > +				      MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
> > >  			break;
> > >  		}
> > >  	}
> > > @@ -313,19 +337,18 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
> > >  
> > >  	/* update scaler opmode, if appropriate */
> > >  	if (test_bit(DPU_SSPP_CSC, &ctx->cap->features))
> > > -		_sspp_setup_opmode(ctx, VIG_OP_CSC_EN | VIG_OP_CSC_SRC_DATAFMT,
> > > -			MSM_FORMAT_IS_YUV(fmt));
> > > +		dpu_hw_sspp_setup_opmode(ctx, VIG_OP_CSC_EN | VIG_OP_CSC_SRC_DATAFMT,
> > > +					 MSM_FORMAT_IS_YUV(fmt));
> > >  	else if (test_bit(DPU_SSPP_CSC_10BIT, &ctx->cap->features))
> > > -		_sspp_setup_csc10_opmode(ctx,
> > > -			VIG_CSC_10_EN | VIG_CSC_10_SRC_DATAFMT,
> > > -			MSM_FORMAT_IS_YUV(fmt));
> > > +		dpu_hw_sspp_setup_csc10_opmode(ctx,
> > > +					       VIG_CSC_10_EN | VIG_CSC_10_SRC_DATAFMT,
> > > +					       MSM_FORMAT_IS_YUV(fmt));
> > 
> > Again, useless whitespace changes.
> checkpatch.pl says here is alignment issuse, so I do this fix.

The issue was present before your patch. If you want to fix it, fix it
in the separate patch or ignore it.

> 
> > >  
> > >  	DPU_REG_WRITE(c, format_off, src_format);
> > >  	DPU_REG_WRITE(c, unpack_pat_off, unpack);
> > >  	DPU_REG_WRITE(c, op_mode_off, opmode);
> > > -
> > 
> > Why?
> 
> yes, will drop "-" diff.
> 
> > >  	/* clear previous UBWC error */
> > > -	DPU_REG_WRITE(c, SSPP_UBWC_ERROR_STATUS, BIT(31));
> > > +	DPU_REG_WRITE(c, ubwc_err_off, BIT(31));
> > >  }
> > >  
> > >  static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
> > > @@ -385,9 +408,9 @@ static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
> > >  			tot_req_pixels[3]);
> > >  }
> > >  
> > > -static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
> > > -		struct dpu_hw_scaler3_cfg *scaler3_cfg,
> > > -		const struct msm_format *format)
> > > +void dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
> > > +			       struct dpu_hw_scaler3_cfg *scaler3_cfg,
> > > +			       const struct msm_format *format)
> > 
> > And here...
> checkpatch.pl says here is alignment issuse, so I do this fix.

And I'm asking you to don't do it. Don't clutter the patch with
unrelated changes (and whitespace / alignment changes are generally
unrelated).

-- 
With best wishes
Dmitry
