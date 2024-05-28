Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D89618D1A62
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 13:56:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D7110E5E8;
	Tue, 28 May 2024 11:56:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jS8CD8Mg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A0BC10F797
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 11:56:46 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2e95a1eff78so9084811fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 04:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716897404; x=1717502204; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=oCjaRC8Eu5PO/jMlynPBkhbwEoTzC3Pm/rk64eh59dQ=;
 b=jS8CD8Mgr/3d+tjjU/zfqrDGX1xWOkma/zRIrm7mAGqTrCQNu2HxbYYak4TLzmDCAI
 GdCqhF+K7ykhxzAIybAdPnth7e6RS5IP3PRiKa2oO/qSapjwnEQlg5vHEpH1Y8itpGl2
 cYUTU/hhnhik8UMmcpSh7G6WW4TAaWxd1KXf3V/obMWg7hp7z1V2WSte+AQ25GCF8uLz
 G5f6xHMUZwyEYE7d6PbtRwTnivsPgh7jQyp/PtBOwqsXz5702oU1awmUX/7uFqRVG9yO
 IKEyuN5yEQSjKZ8fRrUnK5+dHIS5nKogjDknNVVYVgk1JjRrktkKTgI24qpDw61RAd9/
 zf6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716897404; x=1717502204;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oCjaRC8Eu5PO/jMlynPBkhbwEoTzC3Pm/rk64eh59dQ=;
 b=d/JTfYknoeqU8x8hOWEuNSiTL5yL2Z+ov1qM1w3+9YogA0aTXyvEXcW8ZIEDrr5xmD
 rB5d5ZXktto2XRTxC3beTLnW3FERebZJlWp9cpwVPNOhs/rgOmui8KQhDLXYTKC7K/yr
 g8l2tXlHQmuvMQzOIZqWC0LNi/2Sx1yBSdAxrFUPAINHtoSiAXgs4uaCaEh+LDk9Z4sY
 xAxLzSbUPwpqK+Hx+CqJVdX/mPxEqBRPhrFRW3fZ2pNJBg+5vavGoo891HNEYGrN/gx3
 JGX0t0+JOa5eUzFT2If+IRjXC3q6xc/+huNI5B2L9+KithfOdYYucjnSwEfC39lse+JU
 o+AQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdyvumhQqTV9A7vZPUFZKKqGA2HFJ6l63eo9FwXyvVhYA2ftzi5kEZqd8p0R6BXWYs86IfXl49yrBJ68KA1ijdYYQBMtDTyv8PpSNyDShU
X-Gm-Message-State: AOJu0YxBK4WXFXHP7LepFESE5+il4+gFqkmpq9pjPF1Zpkylt4FcWSTp
 cw+xe7spRsks+8W3ctJD6dh2/a7Mnx5v00AXwELYcVsagyZ2rWcQUMtoELoTCfM=
X-Google-Smtp-Source: AGHT+IHsJsDnQl+EL8lCVJ54Xb104AElU7vavZkJuJ90hTUqa4aoOEIcclt6lXoq7iXLRtqyt4A4DQ==
X-Received: by 2002:a2e:b0ef:0:b0:2e9:834e:b9e8 with SMTP id
 38308e7fff4ca-2e9834ebb5amr28341211fa.1.1716897404252; 
 Tue, 28 May 2024 04:56:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e95bcc4962sm22516371fa.11.2024.05.28.04.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 04:56:43 -0700 (PDT)
Date: Tue, 28 May 2024 14:56:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/6] drm/msm/dpu: adjust data width for widen bus case
Message-ID: <sjz2el73774uaht7gfwbyuteprd3nv73gvj6g557putrxh7jut@g34dvy4s23ui>
References: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-0-f797ffba4682@linaro.org>
 <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-2-f797ffba4682@linaro.org>
 <57sr3ssi6nwermdqtnb2ackmu4tlxs4gcslvp4v6ndafnvbqhb@4npuqfpkzzan>
 <CABymUCOCcgfHsBaFBk63z+CLJu6Lee983nCM14PgPWZjkFFikQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCOCcgfHsBaFBk63z+CLJu6Lee983nCM14PgPWZjkFFikQ@mail.gmail.com>
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

On Tue, May 28, 2024 at 05:59:13PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 于2024年5月28日周二 08:48写道：
> >
> > On Mon, May 27, 2024 at 10:21:48PM +0800, Jun Nie wrote:
> > > data is valid for only half the active window if widebus
> > > is enabled
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > > index 225c1c7768ff..f97221423249 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > > @@ -168,6 +168,15 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
> > >
> > >       data_width = p->width;
> > >
> > > +     /*
> > > +      * If widebus is enabled, data is valid for only half the active window
> > > +      * since the data rate is doubled in this mode. But for the compression
> > > +      * mode in DP case, the p->width is already adjusted in
> > > +      * drm_mode_to_intf_timing_params()
> >
> > Is there any reason for divergence here?
> 
> Lots of parameters in dpu_hw_intf_setup_timing_engine() is calculated
> from timing->width,
> such as hsync_period and display_v_start. So the width cannot be
> adjusted beforehand in
> drm_mode_to_intf_timing_params(). Otherwise, we get below error.
> 
> I guess the interface timing configuration differ in silicon, thus the
> software shall handle the
> difference. If we adjust the width beforehand for DSI, we get below error.
> 
> [    6.625446] [drm:dpu_encoder_frame_done_timeout:2469] [dpu
> error]enc31 frame done timeout
> [    6.642369] [drm:dpu_encoder_phys_vid_wait_for_commit_done:525]
> [dpu error]vblank timeout: 4200c1
> [    6.642395] [drm:dpu_kms_wait_for_commit_done:493] [dpu error]wait
> for commit done returned -110
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
