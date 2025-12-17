Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF4CCC5CF7
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 03:46:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B1A810EA22;
	Wed, 17 Dec 2025 02:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kkP9Y3yC";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y/Ybu7K0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD8510EA10
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 02:46:06 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BGMQgak021696
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 02:46:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=JCJBPzyRlhs0ukky8nnWNxDG
 T3jIQ2bJUvRtWHrXAZA=; b=kkP9Y3yCoFi7+UDQPn6FBzxoy7INU9c/w6Tsuzjf
 OAcaisEwIdxxWr+wUSL07+/BCTYYlYNb3uAiFZ2TCjZlNVNPOEDJ5UOs/Y24ulKN
 Jj1LxAPNDoF82HY4H8VcQTl1Uz6r5pGeFModVu7iYYEBd50xbLBWhd7u25A/asN4
 5EHKl/5ZDqH9LFjo1diyEn/awSDui1/VDScTcgma+oTs1T9Jq+fvs+1jOlLbTUtz
 QahlZurh9Tj0K3s/GyxrSZuK8ezTd3qYtonCUyNQqx0YPbrSUckft+Oc5VGZ+vtl
 K3bJw/k3vz1FXHIZP16CAK4soXqLSLVUopwUlSGvgPTLww==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3ffprp5w-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 02:46:05 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-88a360b8086so73548096d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 18:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765939563; x=1766544363;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JCJBPzyRlhs0ukky8nnWNxDGT3jIQ2bJUvRtWHrXAZA=;
 b=Y/Ybu7K010Jg7oCcstaIAHtBKD6L7Qp1u8VxpKZK9rEgijkmFYnjExKc20c9EQLIyP
 6fzrTTT+hzhtAfPyfIVA4r/s5EPQdzn3j9BZJIqIiLHc/PThU98JUao81YvVKfbgsecD
 hjg4/Hh8gWL7pCoUiQp66F5/7OfniEHfmxDDe6elAPBe9iTx6aDH+UgNderwoBuwsLUm
 dbYs7BMxnbJ1MKi0z3dsQuMqRLhR/iTHQ+eW6koK1V/Li+dal+g6WH1riMwTNpCQyg93
 YJRrdUb52aHHFQL0x7wxCJ+KZRfW6hp2ABBa4UlsCd9iJPKyx2bj/xs2DaAMHIwFtQpm
 ZIrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765939563; x=1766544363;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JCJBPzyRlhs0ukky8nnWNxDGT3jIQ2bJUvRtWHrXAZA=;
 b=thNCaIq5drUXou1tDU9FqgoDjgJ7bdsuug+v9RThCj0XnK4rT0Xc4vnOTzjkCJ4ADL
 eEJLXUw3tKWElLY4Ab+LfG8/ruFOV4X86YcSjCFZVPvYkNvLs2oK2FCDyDO+iZoIvdnF
 I/FEuk27QYiIcwQdoSJ1xX0VOaw2P1ot7A+LFpETmt6axMOjJtqVO9LZyL4cDC9Xwmad
 H8zeONgqOBgJcVtq/U+f/i5z9aUaxdI0wOKTGxhQ8fwRxEYaWQH/n1ZkLMUY3uNEwCH4
 7Kn1Z8hACa7ba4oY9F4sITt8S2ci2S3yitxudEURs5WWeKT48njr44iQ6Qs9DJ2KnsEH
 VP5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXF4tTHTUa1DkQM8ax0k9BMhpj82lmGPEX4u/fa0/2ob+kF1melubk4lKixx7nEwr94Jm47rkfF/Qg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzI2wDUe13EWQ5G1Vpsrpyj3IxWYmn+ormic/3raMXbCKedTbKy
 F0eh7ZyCO7B3jfQg64R6/apFnlwnPWmvATKkzp4RI7mAY62IutHanUmv/DgpGK6cWAeEiNRwD1W
 ttKpVBlaJ9oZTh1PJcI1gQprkvAfsM9xCpEhHtwr/UkBZha6LwCIMot/e/p3Rd/WRnMut95o=
X-Gm-Gg: AY/fxX65qlWbkXvO3rYe+M35sZmHViBXuN2cy+W3E7JB9c/jEgJE0LSL8hoTT7wUnw0
 jCB98PclnJDaDhBjF4BFq3axVTsm2z3t4itEphVQZhYftO3WbuTBCR2dvp2KhKgmQhRFDu0BCAC
 6qFzPoPJbQ2oKIu2jZIKo/OHXhTWNlLo1Zspvc7egL/7WSgJMWjf+0KESdeH04m1l6CksaOV/rM
 a1DY/ebnLsPIbVB5elgKRFhA4RVRoCWZ7OQePWylDKU7HoZG76ZNI0XTFY0XheJ1hbFOY+sFMrr
 N5Qd95GZc/SpMStuc7vhvAl64RKbZj9HtQDOFzXYgoHrOr6EK5eE/16fHcxBsQ4b/TDzLFLilxD
 4448GKmzLLYjprNI2Fqz+YQnEhVMjsMfVymO2D69+qcRSE3ZAfTZAEx47nL3bBZVamyiZy2o=
X-Received: by 2002:a05:6214:5b87:b0:888:82c3:dfc0 with SMTP id
 6a1803df08f44-88882c3e67cmr227694846d6.55.1765939563383; 
 Tue, 16 Dec 2025 18:46:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGx1RaDoBtJw9fMmc0Xmr4th/lJOfvqaul2PsNrWDcut+ChvzvkgYHcb05lGbK5/M73moqytA==
X-Received: by 2002:a05:6214:5b87:b0:888:82c3:dfc0 with SMTP id
 6a1803df08f44-88882c3e67cmr227694546d6.55.1765939562816; 
 Tue, 16 Dec 2025 18:46:02 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8899ea36210sm85899146d6.27.2025.12.16.18.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 18:46:01 -0800 (PST)
Date: Wed, 17 Dec 2025 10:45:50 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Message-ID: <aUIZXiL+JY27phny@yuanjiey.ap.qualcomm.com>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
 <20251215083854.577-11-yuanjie.yang@oss.qualcomm.com>
 <pzwgxqdlpmrbylguvzwypry3fix6wi7kxu3jlv3yzdtb3unnrf@wfzvuhvhmue5>
 <aUECnz+INNuLjHR6@yuanjiey.ap.qualcomm.com>
 <gljkq6jijsprelq7qmgai4g7mqlshezdx755n3ivbxjdf6uw73@dz3mkct7g3ry>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gljkq6jijsprelq7qmgai4g7mqlshezdx755n3ivbxjdf6uw73@dz3mkct7g3ry>
X-Authority-Analysis: v=2.4 cv=FZ46BZ+6 c=1 sm=1 tr=0 ts=6942196d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=tNEIORBzTMdH9SYpPiUA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: aBPUe6HjDtq2UpJzpri4_7vRoH_wFzKF
X-Proofpoint-GUID: aBPUe6HjDtq2UpJzpri4_7vRoH_wFzKF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDAyMSBTYWx0ZWRfX+cnZeMInNpBQ
 DtkQ6K9mf1TKqUMySpqwz2b7EfEl0tEhviglj8A1sh1BzK9cGJaHocCmJX1EjFC8UsgDN9hZJmJ
 MuKBE7p3dYwX9Q25krdXDKxaRuDanNr3YiwgB494y1YuGnohesHSlRHwopG57+eBPFlgEOvSxEL
 5Mhpun1eoqXqV8FxbzYu1VB8KMyeSAyip5LzZ7ZHql5cYgIYjbQZEnlc020sO1U2+DNi5Fx7n3d
 f35yM8Be+v22TIIGqL+FRoswALUZHeliVOy71SxXJ3wh9jnLGamuUNhySp+OxIYCLB54PpciJMf
 8jls4T7C7uP0nX78vjmK+eRJ3jN/UErHo334/f2gsaEM6dS0P6y9StI/0gundIDNs+3GzeVJm/o
 lVF3x5Lz+IR7i6xF9mrX8HffKbFagg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170021
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

On Tue, Dec 16, 2025 at 04:22:32PM +0200, Dmitry Baryshkov wrote:
> On Tue, Dec 16, 2025 at 02:56:31PM +0800, yuanjiey wrote:
> > On Mon, Dec 15, 2025 at 10:08:22PM +0200, Dmitry Baryshkov wrote:
> > > On Mon, Dec 15, 2025 at 04:38:53PM +0800, yuanjie yang wrote:
> > > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > 
> > > > DPU version 13.0.0 introduces structural changes including
> > > > register additions, removals, and relocations.
> > > > 
> > > > Refactor SSPP-related code to be compatible with DPU 13.0.0
> > > > modifications.
> > > > 
> > > > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > ---
> > > 
> > > We've fixed the order of the interrupts patch. Now you are adding SSPP
> > > customization for 13.x _after_ adding the first 13.x support. Is that
> > > supposed to work?
> > 
> > Yes, will reorganize order.
> 
> And after comparing with v2, I'm really surprised. It was better before
> and then you changed the order of the patches. Why? You were asked to
> split it, but not to move it to the end.

I make the mistake.
Sure, I will keep the v2 patch order in next patch.
 
> > 
> >  
> > > >  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  15 +-
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 155 ++++++++++--------
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  52 ++++++
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  18 ++
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 +
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |  17 +-
> > > >  6 files changed, 191 insertions(+), 69 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > > >  		switch (ctx->ubwc->ubwc_enc_version) {
> > > >  		case UBWC_1_0:
> > > >  			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> > > > -			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
> > > > -					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
> > > > -					BIT(8) |
> > > > -					(ctx->ubwc->highest_bank_bit << 4));
> > > > +			DPU_REG_WRITE(c, ubwc_ctrl_off,
> > > > +				      fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
> > > > +				      BIT(8) |
> > > > +				     (ctx->ubwc->highest_bank_bit << 4));
> > > 
> > > I have asked to drop unrelated changes. You didn't. Why? You are
> > > changing whitespaces for no reason. It's just a noise which hides the
> > > actual change here.
> > 
> > here ubwc reg layout change in DPU 13.
> > 
> > ubwc_ctrl_off
> > veriosn < 13 
> > reg: SSPP_UBWC_STATIC_CTRL
> > verison >= 13 
> > reg: SSPP_REC_UBWC_STATIC_CTRL
> > 
> > So I do some fix.
> 
> What does it have to do with the whitespaces? Fix _one_ line.
get it, will drop unrelated whitespaces.

> > 
> > > >  			break;
> > > >  		case UBWC_2_0:
> > > >  			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> > > > -			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
> > > > -					fast_clear | (ctx->ubwc->ubwc_swizzle) |
> > > > -					(ctx->ubwc->highest_bank_bit << 4));
> > > > +			DPU_REG_WRITE(c, ubwc_ctrl_off,
> > > > +				      fast_clear | (ctx->ubwc->ubwc_swizzle) |
> > > > +				     (ctx->ubwc->highest_bank_bit << 4));
> > > >  			break;
> > > >  		case UBWC_3_0:
> > > > -			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
> > > > -					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
> > > > -					(ctx->ubwc->highest_bank_bit << 4));
> > > > +			DPU_REG_WRITE(c, ubwc_ctrl_off,
> > > > +				      BIT(30) | (ctx->ubwc->ubwc_swizzle) |
> > > > +				     (ctx->ubwc->highest_bank_bit << 4));
> > > >  			break;
> > > >  		case UBWC_4_0:
> > > > -			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
> > > > -					MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
> > > > +			DPU_REG_WRITE(c, ubwc_ctrl_off,
> > > > +				      MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
> > > >  			break;
> > > >  		}
> > > >  	}
> > > > @@ -313,19 +337,18 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
> > > >  
> > > >  	/* update scaler opmode, if appropriate */
> > > >  	if (test_bit(DPU_SSPP_CSC, &ctx->cap->features))
> > > > -		_sspp_setup_opmode(ctx, VIG_OP_CSC_EN | VIG_OP_CSC_SRC_DATAFMT,
> > > > -			MSM_FORMAT_IS_YUV(fmt));
> > > > +		dpu_hw_sspp_setup_opmode(ctx, VIG_OP_CSC_EN | VIG_OP_CSC_SRC_DATAFMT,
> > > > +					 MSM_FORMAT_IS_YUV(fmt));
> > > >  	else if (test_bit(DPU_SSPP_CSC_10BIT, &ctx->cap->features))
> > > > -		_sspp_setup_csc10_opmode(ctx,
> > > > -			VIG_CSC_10_EN | VIG_CSC_10_SRC_DATAFMT,
> > > > -			MSM_FORMAT_IS_YUV(fmt));
> > > > +		dpu_hw_sspp_setup_csc10_opmode(ctx,
> > > > +					       VIG_CSC_10_EN | VIG_CSC_10_SRC_DATAFMT,
> > > > +					       MSM_FORMAT_IS_YUV(fmt));
> > > 
> > > Again, useless whitespace changes.
> > checkpatch.pl says here is alignment issuse, so I do this fix.
> 
> The issue was present before your patch. If you want to fix it, fix it
> in the separate patch or ignore it.
get it, will drop unrelated whitespaces.

> > 
> > > >  
> > > >  	DPU_REG_WRITE(c, format_off, src_format);
> > > >  	DPU_REG_WRITE(c, unpack_pat_off, unpack);
> > > >  	DPU_REG_WRITE(c, op_mode_off, opmode);
> > > > -
> > > 
> > > Why?
> > 
> > yes, will drop "-" diff.
> > 
> > > >  	/* clear previous UBWC error */
> > > > -	DPU_REG_WRITE(c, SSPP_UBWC_ERROR_STATUS, BIT(31));
> > > > +	DPU_REG_WRITE(c, ubwc_err_off, BIT(31));
> > > >  }
> > > >  
> > > >  static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
> > > > @@ -385,9 +408,9 @@ static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
> > > >  			tot_req_pixels[3]);
> > > >  }
> > > >  
> > > > -static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
> > > > -		struct dpu_hw_scaler3_cfg *scaler3_cfg,
> > > > -		const struct msm_format *format)
> > > > +void dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
> > > > +			       struct dpu_hw_scaler3_cfg *scaler3_cfg,
> > > > +			       const struct msm_format *format)
> > > 
> > > And here...
> > checkpatch.pl says here is alignment issuse, so I do this fix.
> 
> And I'm asking you to don't do it. Don't clutter the patch with
> unrelated changes (and whitespace / alignment changes are generally
> unrelated).
>
> -- 
> With best wishes
> Dmitry

Thanks,
Yuanjie

