Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2682BAA0B56
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 14:16:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF5B10E42A;
	Tue, 29 Apr 2025 12:16:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TheRa7my";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (unknown [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F137B10E02E
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 12:16:16 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TAHBMw030391
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 12:16:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=n6neZETVNC342qH7kNDFJ+hG
 N9sCBDLkRi5kj+90Mz4=; b=TheRa7my7FVsQXnG9WTVOK/1/f0bFVEaQFpTgwHV
 MKqLclqCxVqMZIPk8S/NSG40+RwsFR6Sx1HdEkn8hhsWj6C7SwY8e4DzFgtffc8Z
 baYT++07plw7XLAhNNlVTpnN8EkzfNLYwNN0qIXhsd//JuPHI8UmulkyUshIppnn
 6WFKMpdPOyH+d3H7riRRUE/tWVrokhSOI3ZjGlw2LZA99ehqfftxO7o6HXyauP2B
 6rkNew9Vkk42c7rAav8CGx0wqvjbaY4lsQOfbiP8s6td7jkBVA0YuX76CLa2/ODC
 VOSi6ainnKow095XNv1QCSLkwIb85LuiwHZiilPYZ3ITkA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pevkk91-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 12:16:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5e28d0cc0so977944185a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 05:16:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745928965; x=1746533765;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n6neZETVNC342qH7kNDFJ+hGN9sCBDLkRi5kj+90Mz4=;
 b=JWc2Uh0YKwI91AR5prscRgz6Qi12wok4MgGc9kaobbqW5xlnoXLD9zansX6COzVPuI
 +be98gaOyWA97S/wiKXzds39dtNGB8FR9vZ8w+cRd7MnMrIRFrYv9IO5QXfpcy9NvRA1
 vLO5SID79D5nQHMJf+e8LDVMt2NDQIS0ZJMsjs07BX2nmrgRE6GKIsNBEscDRlqAEECx
 o0RMxHKU8vcab/WE9oT417CoYiai9fJZQMsyZFhMH42nAlEK10ADwhHyJe60Ks0hNdcI
 tdT+1sdqF9b9ZrfXglpbs7MaS4lf0ZrIViQvSV+vDLzXCM4I9gkhF0b7UmSR/X2Xq7Nr
 Q9Rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvVM1Er8HZgBKGIPS9bFhIPPDNDId9RTvTz50DcPAqqgjLHsQCYtgqb3ZN5gWXIPqr60fPZ/Mwpok=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMdunf2GjEZa2HbYGdxxxa5IeUFTCfW50H+l3SgeOYmeZYigHo
 kO1QikzF2mBE6f2wngZK7QZanWO+WbgS/5mzghAi5Fp3JcbEUYYk91ajsOq0I2DGk1l/PD19ME8
 QygEkaOJfX3bqL4ZO5IW8cm0Ckle6ixlxmx4UM4Y4YeklogJkT+ReR7hW62w+uapG3I4=
X-Gm-Gg: ASbGncvCqj3AIjQ1AgQ9tTtQCXsUa7+oouRetQpddPpKEwRjMjrkjzVL4TeEynWczRN
 stsIRhc0HH2mpvykg5kmEkpwvHzcBhgtSImIO9VOsHBygMzWx6qJ3Bk+4Wx45iw9bgHCi3WCJa/
 AzOoXghOq3OsfEwRa14zSELAziSNGWWo+SyD7xFnfL/B3X/D1JwmXcxtThxf8OBA1ty6/B0ORGk
 XDVQHmd9FpqzW19pkjQip/Hm9/l1SDzvW44jOXWeHM3ajqKm8pYtN4yL29HCDNRQznDzxDDYK1v
 2e69nR8bWUzamYPv4LHfXbgxb1XR0cVJK8vvOiXr/cqE+1z8iJSnCkUT8N5AS7C4lUleMmxZfjw
 =
X-Received: by 2002:a05:620a:4104:b0:7c9:5d8f:4d09 with SMTP id
 af79cd13be357-7cabe60418bmr361511885a.34.1745928964975; 
 Tue, 29 Apr 2025 05:16:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEs8uaXttLX5fbQqqhvFbfdQMse8HccybmzieyiB0uxgppwccpl8V+Gy0PEioLWVPPX8E7lww==
X-Received: by 2002:a05:620a:4104:b0:7c9:5d8f:4d09 with SMTP id
 af79cd13be357-7cabe60418bmr361508285a.34.1745928964607; 
 Tue, 29 Apr 2025 05:16:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7ccb8979sm1858087e87.257.2025.04.29.05.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 05:16:03 -0700 (PDT)
Date: Tue, 29 Apr 2025 15:16:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] drm/msm/dpu: drop TE2 definitions
Message-ID: <iabwfwus4ze3jwekayyfgwhu5bdoerebp3sehisc7rfeic63xh@552zbik6uvmm>
References: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
 <20250301-dpu-fix-catalog-v2-4-498271be8b50@linaro.org>
 <628f3361-6795-4e69-aac2-f9f3200eb6fe@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <628f3361-6795-4e69-aac2-f9f3200eb6fe@quicinc.com>
X-Proofpoint-ORIG-GUID: QB7o6n7CwyzZ4KPvbSNd3zJbKUD4wAnu
X-Authority-Analysis: v=2.4 cv=aeBhnQot c=1 sm=1 tr=0 ts=6810c306 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=0er1AAXFZ9cMRBjTt-wA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: QB7o6n7CwyzZ4KPvbSNd3zJbKUD4wAnu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA5MSBTYWx0ZWRfX+qtEmoSEd9+x
 Kk2zDnuP3SR6BoezGTgCBnA/gdnz2Oi4/ct/vc4rSPFdXAvIJBBzn7LeWazdSnwZGrk1r3qb/Rg
 unBV+ZtZURLfpG5Vm349E3htEHKCqfqLLpR7aIzhzVV5wFqVqFnhTOLvd9AXiPSsP/c3czeXrCR
 JyuYJsxpnwVrcQw4gB8tFQf5Ink3AN3alo6vW/FJeYGY/BCbKwCRvrGkhwgLzwCVNOSm9ZeokEr
 DjzLxloOkOXnjccduvcZSziI3a25/nViZ75NezQdis/Si1YGd7DuqKA/UfQRi5tEa9mYnMjDV/q
 dCYS2ZRBglxo8zrjixa8broh7fKyRwgbCjJjoErP6c1g9W2Wi4jvN9D9sJ/rzawOvtfRhRi8aQZ
 yAQUPvf/kllLpMYTGiSM4jz7KIHLmg7LqxWERNj+8k1xjawlZU+gqKvlLPFtixj40ODxSkEW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290091
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

On Mon, Apr 28, 2025 at 06:33:05PM -0700, Abhinav Kumar wrote:
> 
> 
> On 3/1/2025 1:24 AM, Dmitry Baryshkov wrote:
> > Neither DPU driver nor vendor SDE driver do not use TE2 definitions
> > (and, in case of SDE driver, never did). Semantics of the TE2 feature
> > bit and .te2 sblk are not completely clear. Drop these bits from the
> > catalog with the possibility of reintroducing them later if we need to
> > support ppsplit.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h |  8 ++++----
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h |  8 ++++----
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h  |  8 ++++----
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h  |  4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  |  8 ++++----
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 17 -----------------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          |  6 +-----
> >   7 files changed, 19 insertions(+), 40 deletions(-)
> > 
> 
> <snip>
> 
> > @@ -465,22 +459,11 @@ static const struct dpu_dspp_sub_blks sdm845_dspp_sblk = {
> >   /*************************************************************
> >    * PINGPONG sub blocks config
> >    *************************************************************/
> > -static const struct dpu_pingpong_sub_blks msm8996_pp_sblk_te = {
> > -	.te2 = {.name = "te2", .base = 0x2000, .len = 0x0,
> > -		.version = 0x1},
> > -};
> >   static const struct dpu_pingpong_sub_blks msm8996_pp_sblk = {
> >   	/* No dither block */
> >   };
> > -static const struct dpu_pingpong_sub_blks sdm845_pp_sblk_te = {
> > -	.te2 = {.name = "te2", .base = 0x2000, .len = 0x0,
> > -		.version = 0x1},
> > -	.dither = {.name = "dither", .base = 0x30e0,
> > -		.len = 0x20, .version = 0x10000},
> > -};
> > -
> 
> Agreed about TE2. I do not see even te2 sub-block programming in
> dpu_hw_pingpong but why do we also need to drop dither?

sdm845_pp_sblk has the dither block. If you scroll the original patch,
you'd see PPs being switched to that sblk definition.

> 
> That one is being used in dpu_hw_pp_setup_dither().
> 
> >   static const struct dpu_pingpong_sub_blks sdm845_pp_sblk = {
> >   	.dither = {.name = "dither", .base = 0x30e0,
> >   		.len = 0x20, .version = 0x10000},
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > index 4cea19e1a20380c56ae014f2d33a6884a72e0ca0..07b50e23ee954b96e7e6bd684dc12823f99d630b 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > @@ -115,7 +115,6 @@ enum {
> >   /**
> >    * PINGPONG sub-blocks
> > - * @DPU_PINGPONG_TE2        Additional tear check block for split pipes
> >    * @DPU_PINGPONG_SPLIT      PP block supports split fifo
> >    * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
> >    * @DPU_PINGPONG_DITHER     Dither blocks
> > @@ -123,8 +122,7 @@ enum {
> >    * @DPU_PINGPONG_MAX
> >    */
> >   enum {
> > -	DPU_PINGPONG_TE2 = 0x1,
> > -	DPU_PINGPONG_SPLIT,
> > +	DPU_PINGPONG_SPLIT = 0x1,
> >   	DPU_PINGPONG_SLAVE,
> >   	DPU_PINGPONG_DITHER,
> >   	DPU_PINGPONG_DSC,
> > @@ -404,8 +402,6 @@ struct dpu_dspp_sub_blks {
> >   };
> >   struct dpu_pingpong_sub_blks {
> > -	struct dpu_pp_blk te;
> > -	struct dpu_pp_blk te2;
> >   	struct dpu_pp_blk dither;
> >   };
> > 
> 

-- 
With best wishes
Dmitry
