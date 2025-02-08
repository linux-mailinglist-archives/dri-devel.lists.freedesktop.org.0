Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B74A2D94F
	for <lists+dri-devel@lfdr.de>; Sat,  8 Feb 2025 23:32:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0499210E07D;
	Sat,  8 Feb 2025 22:32:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RBNKmQLr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737A110E12F
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Feb 2025 22:32:21 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-30227c56b11so34006331fa.3
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 14:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739053940; x=1739658740; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OoAfmsggo7EidUtnQBiDbjVxpXFthZ69JupoUyDZEP8=;
 b=RBNKmQLrnc+lKIt7ve6vM7w1cs7/vOgA3vUbP7AABGonFQQsx8YF9J9xnBHpMnuVhY
 OYpv0SDnGg+KAShn1SKouY8pyKp5Q6CCZwFuTMUoimSSa/3lUBnaZUH86RJviX2Asm4Y
 eoha77eWjmh6O0Cv31tVaOhgAD5ENk/44yw/ygprzFgUm6FagCb1XgGSVQLoRV739xO8
 tP488OoPY2l5uLpMcVeiSVYg+AjMuiaaIRqAyq8zEnOcxkzmzwt97jDu2UcAA7jO5LMl
 uyZssBxuqj+MERuDoXoH7/fOazncDgtpiSh9wxqqqvmyLBk4f7DJhpM7Hjs+962CiJOW
 WePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739053940; x=1739658740;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OoAfmsggo7EidUtnQBiDbjVxpXFthZ69JupoUyDZEP8=;
 b=M3620Enu8ipziD2I1kFctHiJ54pdQBBFCRUMC5b7qaaMypzCLJvs10nYkPE4jetgL2
 K9EtdcobgS4+yvRiFogP0XxBe1fN/1pBQAvP87vnNdo6nn9nbF0i+rYW7YPY5UstHvvp
 NND7NvB+ys8XDw40WYi+8FiGFUfb0rUB6DyEcpVJMm2+bwlWNjLx4uxqxUkjWD0gC3fl
 EjhqhNHrL8emlOkYthyRSlCGRKnFVG/3JCZSC4bdRI9Sc+xBKgf/D5bc444LcNri3ts+
 UHBv/hOhRtQnnx1Fswwvutx7AhUW/IzJ8PXs1/mTxucC3yRMXjMWVJ4QzjOrYtIDxYAK
 40Zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX94WaljTULYriu6YX4Dlm/TpHTmP+t4q4Ki3Bs3DTC/XaXQiz1ip/nv/ThyCIJHhviEAdJwui84Bk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzI3E2NejeaFJbsh3RjS1OpS3mjj/viP02E5EZAEi+eZ2issvsg
 ZOwR8IAsGRN6hmf1oSMhgBkLRVWiWEjIiSVIUJflHDc6kyLADFYD6BpAG8JSzH0=
X-Gm-Gg: ASbGnct1f33KdGuT7qhIg3VzYlkPxljFMdxjI4tEub0TW2xenECjluqVDqXIw3jC9E2
 1KQQNhgoNVQqBoB9UJvm4kvqP6P7ZJo49FVb3GGMu5aK0KQXU46dVUQ2TQCkDhe+Kcr0jXTc5LW
 O8obcDKg8zLIKV9273rYF/OjKlgoJzdWvPJLuz5Tjw8HopulmJiqbYnIzE3OFhDZO1xZijWRxwg
 rB3ma0NUL5QuykAEn8xF8YV2c41RRXiA7rvgm1gY4j4JybXi5HR9dVQOe2MriyPT9K+4cQsEQzZ
 erGfxROWdv7uzpXZvyXgdITfwC/MQVgPar/aBF/xjxZS1l2+bFDwVn8+y9IU18F1qbwawaU=
X-Google-Smtp-Source: AGHT+IHnMxSLCdxMnbDBy9u58ckrqNO9Jg2ChETCK+eCWlzlOT9M+YisygDlkTGNrNn8aaJ+5piFmg==
X-Received: by 2002:a2e:a805:0:b0:307:2bc6:5eb4 with SMTP id
 38308e7fff4ca-307e57ce743mr25834061fa.3.1739053939534; 
 Sat, 08 Feb 2025 14:32:19 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307de18f728sm8231001fa.36.2025.02.08.14.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 14:32:18 -0800 (PST)
Date: Sun, 9 Feb 2025 00:32:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Danila Tikhonov <danila@jiaxyga.com>, neil.armstrong@linaro.org, 
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
 konradybcio@kernel.org, robdclark@gmail.com, quic_abhinavk@quicinc.com,
 sean@poorly.run, 
 jonathan@marek.ca, jun.nie@linaro.org, fekz115@gmail.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux@mainlining.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 3/4] drm/msm/dsi: Allow all bpc values
Message-ID: <nx5zeueyifytvxpr5mm3njztt2npfbp7oczdc7zk2i7vulnoon@u2c5dfim5xci>
References: <20250203181436.87785-1-danila@jiaxyga.com>
 <20250203181436.87785-4-danila@jiaxyga.com>
 <rnuv4dieiy6s6c5s33hff7ntr6hkneemsq5qzk3u4ug2abwisd@6ahmijlayhhr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <rnuv4dieiy6s6c5s33hff7ntr6hkneemsq5qzk3u4ug2abwisd@6ahmijlayhhr>
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

On Sat, Feb 08, 2025 at 11:09:56PM +0100, Marijn Suijten wrote:
> On 2025-02-03 21:14:26, Danila Tikhonov wrote:
> > From: Eugene Lepshy <fekz115@gmail.com>
> > 
> > DRM DSC helper has parameters for various bpc values ​​other than 8:
> 
> Weird zero-width \u200b spaces here between "values" and "other", please delete
> those.
> 
> > (8/10/12/14/16).
> > 
> > Remove this guard.
> > 
> > Signed-off-by: Eugene Lepshy <fekz115@gmail.com>
> > Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> 
> Should this patch elaborate that those "DRM DSC helper" don't have any
> additional guarding for the values you mention either, i.e. passing 9 or 11 or
> >16 don't seem to be checked anywhere else either?
> 
> And your title might have space to spell out "Bits Per Component" entirely.
> 
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi_host.c | 7 +------
> >  1 file changed, 1 insertion(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > index 007311c21fda..d182af7bbb81 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > @@ -1767,11 +1767,6 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
> >  		return -EINVAL;
> >  	}
> >  
> > -	if (dsc->bits_per_component != 8) {
> > -		DRM_DEV_ERROR(&msm_host->pdev->dev, "DSI does not support bits_per_component != 8 yet\n");
> > -		return -EOPNOTSUPP;
> > -	}
> > -
> >  	dsc->simple_422 = 0;
> >  	dsc->convert_rgb = 1;
> >  	dsc->vbr_enable = 0;
> 
> This seems supicous on the dpu1 side, in the original DSC 1.1 (not 1.2) block in
> dpu_hw_dsc_config(), which has:
> 
> 	data |= (dsc->line_buf_depth << 3);
> 	data |= (dsc->simple_422 << 2);
> 	data |= (dsc->convert_rgb << 1);
> 	data |= dsc->bits_per_component;
> 
> The original value of `8` would overlap with the lowest bit of line_buf_depth
> (4th bit in `data`).  Now, the 2nd bit which will take the value from
> convert_rgb, which is already set to 1 above, will overlap with the 2nd bit in
> your new bpc value of 10.
> 
> Can you double-check that this code in DPU1 is actually valid?  I assume you
> have tested this panel at least and it is working (worthy mention in the cover
> letter?), this just seems like yet another mistake in the original bindings
> (though the register always had a matching value with downstream on 8 BPC panels
> for me).

Indeed. msm-4.14 explicitly names that single-bit field as
'input_10_bits'. The block is supposed to support bpc of 8, 10 and 12.
This bit should only be set for bpc=10.

Marijn, thanks for catching it!

We should start rewriting DPU register accessors to use generated
accessors. At least it will clearly show if the field is a flag or a
field which has some values. With the current code it is impossible to
notice the difference.

> 
> > @@ -1779,7 +1774,7 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
> >  	drm_dsc_set_const_params(dsc);
> >  	drm_dsc_set_rc_buf_thresh(dsc);
> >  
> > -	/* handle only bpp = bpc = 8, pre-SCR panels */
> > +	/* handle only pre-SCR panels */
> >  	ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_1_PRE_SCR);
> 
> Good catch - this comment sounds like it's documenting a limitation of
> this helper function, but the function does not have such limitations...
> rc_parameters_pre_scr has values for all these combinations.

I think the =8 part is a leftover of the old, pre-helper code.

> 
> - Marijn
> 
> >  	if (ret) {
> >  		DRM_DEV_ERROR(&msm_host->pdev->dev, "could not find DSC RC parameters\n");
> > -- 
> > 2.48.1
> > 

-- 
With best wishes
Dmitry
