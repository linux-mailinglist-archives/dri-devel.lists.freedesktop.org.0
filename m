Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB192A07577
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 13:15:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 475E410ED89;
	Thu,  9 Jan 2025 12:15:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NnIxdpZ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F30510ED94
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 12:15:56 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-53f22fd6887so785607e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 04:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736424895; x=1737029695; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7Y3HY3/3raPKrBdMfi/LEIgt0D1405I14g2HDD+nyIE=;
 b=NnIxdpZ+SUwegvc4Tl8L4QcP6qYkk31PRXgm8Wi0tTEHqWtDxWfWoxC/M39YY0c37o
 QTk5bDolr3Aayaql0s7ccLjVwhhHWHCCmpy4iz0Qi7YZWLXwqqGxcVuA7yQMy0Azfr+z
 lsPoTBSh1u3LaZkTco0uKUiR+jgrK3KF18zxSY99JgsWQi+C18h0SAhKCJQPZrBQFUCL
 GlUIVL6s+Hsigj3TvMeHkwBILOVULOrdUy40qoO1yk8NALLG54lwttL1Uglu3ZjwQtgI
 82iEMmaE67XYB87QzqQbIhgMOI5pjk3ofPmH/30e79hTcKrTtlQ+IwBle0b3OC1eqVGF
 wJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736424895; x=1737029695;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7Y3HY3/3raPKrBdMfi/LEIgt0D1405I14g2HDD+nyIE=;
 b=IJzaY1a8WS0BnaJX+rlA1vzALxGaT/P4GSsxG7mrBW/eATkGveGnDNPYSrX1amlari
 wMKlTdC924y+fApBjWDDCvmHp9p6BvR1cnzk0226k6b15Eut38EI6Z87y99vCwAyRY6z
 RpLpb7RxH9BjYp/ekX4qksbxhUWqz2D65I9xzZ4eHzKUI/F6W7pm9BO6iw88BKaDtc1f
 tF5JfG5g51H7of8HCxBZ3k8YkCbwzhB7eQUyETCulbUEre2VNB3zVFJIgyDHyvd5uf9f
 T6VQXZoSjdPhAmu7VaUOVAaGpsiRQcOX1Qv8qdGkgHQdG+p/0PI/Nwj9f9V0BkKnO7eK
 N2HA==
X-Forwarded-Encrypted: i=1;
 AJvYcCULq/ySasYR+rLzbxSNgNetT/lpFkAIov92K4lfSBiX2lpf4StbZjrv++W69GePQSt+zxoYVngzbkk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzJRCgaTw0LgNdotTtmTMWyBQsa+4gu3D31XVcu7shvb5RFxLT
 hSACThWONxJ9A2yuV0FfkD+kFEtQ4SHt5GUyDrioLXFAdg2azdEV8BJu6Z4aV3M=
X-Gm-Gg: ASbGncvyJes67yqaliLZMipPV67awNtrtJ3lTznUI5j0FxEeh4VmJiMMp0/HGtWVRFZ
 DjMeFZcTYDc39Pk6m5zyTIgUzd1BW0XoXVC/Mb5dYOJv6oxk+drouFtwGrlLM4bCu7AKMKqGAvq
 jEhE7Zww03xutV5adHrqjZ/nZYa+iSOkpnHJqexGyLrwuMD7sfJq0zcoxOTnh4GxkZjg6tabayS
 PXaquoZAV8oOFRjyl4p9usQj6R2V7+jshR3bH2BrKwpELXoMZyQVZmfucxZm/KIz3G3QNeZ7T7y
 1foAu7otrLPBUWL+pdstAn9+ElwSMi2c0f4b
X-Google-Smtp-Source: AGHT+IG5w+mHeSxL6HLuB+vsJtc5xv9b0UjlOGR0qPmcZlQhgaehIdffVretPgnpXUgovXqCroBRTw==
X-Received: by 2002:a05:6512:104c:b0:53e:383c:dfa9 with SMTP id
 2adb3069b0e04-542845d32f9mr2107453e87.30.1736424894890; 
 Thu, 09 Jan 2025 04:14:54 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428be49a12sm180006e87.17.2025.01.09.04.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 04:14:53 -0800 (PST)
Date: Thu, 9 Jan 2025 14:14:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/15] drm/msm/dpu: decide right side per last bit
Message-ID: <4uzsmtbeoilcodnlbnbst2t2gfbhaucpzne2bzwavdeawmqs4q@u33sixkksfls>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-4-92c7c0a228e3@linaro.org>
 <yqbze4h6obiwulmvh64r62slaiih75hzescf5tjwqgtmhqy3wi@y4uedbo5jrzu>
 <95b83e6f-e455-4df0-b121-a1d900de0a56@quicinc.com>
 <CABymUCOGzvR0utNUR3-6bFDi3c3yRTUu=CcTo2-eTKBvpoU-PA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCOGzvR0utNUR3-6bFDi3c3yRTUu=CcTo2-eTKBvpoU-PA@mail.gmail.com>
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

On Thu, Jan 09, 2025 at 12:35:48PM +0800, Jun Nie wrote:
> Jessica Zhang <quic_jesszhan@quicinc.com> 于2025年1月9日周四 07:41写道：
> >
> >
> >
> > On 12/19/2024 2:09 PM, Dmitry Baryshkov wrote:
> > > On Thu, Dec 19, 2024 at 03:49:22PM +0800, Jun Nie wrote:
> > >> decide right side of a pair per last bit, in case of multiple
> > >> mixer pairs.
> > >
> > > Proper English sentences, please. Also describe why, not what.
> >
> > Hi Jun,
> >
> > Can we also add a note in the commit message on why the last bit check
> > works?
> 
> Sure. How about this?
> 
>     Currently we only support one pair of mixer, so counter's
>     non-zero value is enough to mark the right one. There will
>     be case with multiple mixer pairs, so let's use the last bit to
>     mark the right mixer in a mixer pair. If the last bit is set, it
>     marks the right mixer in the pair, it's left mixer otherwise.

You are not marking the right mixer, so it is not suitable.

> 
> >
> > Thanks,
> >
> > Jessica Zhang
> >
> > >
> > >>
> > >> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >> ---
> > >>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 ++---
> > >>   1 file changed, 2 insertions(+), 3 deletions(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > >> index 7191b1a6d41b3..41c9d3e3e3c7c 100644
> > >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > >> @@ -369,11 +369,10 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
> > >>   static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
> > >>   {
> > >>      struct dpu_crtc_state *crtc_state;
> > >> -    int lm_idx, lm_horiz_position;
> > >> +    int lm_idx;
> > >>
> > >>      crtc_state = to_dpu_crtc_state(crtc->state);
> > >>
> > >> -    lm_horiz_position = 0;
> > >>      for (lm_idx = 0; lm_idx < crtc_state->num_mixers; lm_idx++) {
> > >>              const struct drm_rect *lm_roi = &crtc_state->lm_bounds[lm_idx];
> > >>              struct dpu_hw_mixer *hw_lm = crtc_state->mixers[lm_idx].hw_lm;
> > >> @@ -384,7 +383,7 @@ static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
> > >>
> > >>              cfg.out_width = drm_rect_width(lm_roi);
> > >>              cfg.out_height = drm_rect_height(lm_roi);
> > >> -            cfg.right_mixer = lm_horiz_position++;
> > >> +            cfg.right_mixer = lm_idx & 0x1;
> > >>              cfg.flags = 0;
> > >>              hw_lm->ops.setup_mixer_out(hw_lm, &cfg);
> > >>      }
> > >>
> > >> --
> > >> 2.34.1
> > >>
> > >
> > > --
> > > With best wishes
> > > Dmitry
> >

-- 
With best wishes
Dmitry
