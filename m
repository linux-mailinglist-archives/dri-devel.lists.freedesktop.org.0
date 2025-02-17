Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C13A38CC4
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 20:52:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A56A410E5CD;
	Mon, 17 Feb 2025 19:51:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gj5u4HBR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B7610E5C4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 19:51:58 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-3091fecb637so30285031fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 11:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739821916; x=1740426716; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=du441ZCOQupNPXiNMHUbWNZp53UAbJ7rrRkJ3qKot/U=;
 b=gj5u4HBR0cP/3QlMFHKiN5QG0vE4yLOjDeNUYirptPmMWgIbk8g3qtMYlEM0Q9xO7S
 1OOLQfc+fHbDlpNY/1UNLxZI9zDdqRSZE3f+hwbgjtw7gk2fghbloqEAipQYQuP6O6Mj
 m49sLL4cMOQ1wmyt/9yeiy5U3kgxtAzp6ubaRQdk1b9V1oKbGQ4/rF/R5as7XJJxBMHs
 4+dBlzbogS+3C3cO+eqf+iaEJ4V6rRLci+yWtf2PechmHLPgvSx3EbFieY7+mQNRd5Vb
 zEFDGxV9rGMk6Vhe0/0AcbJv96YLNMvH7UAEC+A0GXPz285dFoHl96U+lP7Fj78HoqJ2
 K/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739821916; x=1740426716;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=du441ZCOQupNPXiNMHUbWNZp53UAbJ7rrRkJ3qKot/U=;
 b=Ern9U6QKsJqQ/6URUfCSwOo6lv5s5uVTUhbQyl3nxIaAjBANzydwLZrKoU7L/i3sAB
 HzqTMDAA1EfkFC9/hxxV2KvfirJRRJR2PbGWZ4UCDV+Sd2QGMBCRJsqMwCHHtNZGpJ9n
 ww1dRvNvXJec+kRylDF6hmRy77xBboWztKGg5MZ1Fh0JzxyjAfUv9xFQ0YWnOOMrjibb
 NBKGkLgKVNTMxarO1LL6YbasVGyKhIlsW9oAcvA7VdMfIlqzh0M98EeNaRL2mBOrb4/K
 /esmSAWkTmhjmmNrl8BzicIGENTWVICFc3B9p/14WimpVifLB7KT+San8kB5nKR37147
 VDtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBRpyeG8WJDJ8vqwJjkKaCv1PyppVeWJ0RR7DNvMIPJHfLhKOv4pF+ETYpUOtoI35MJdq+zHPfEJk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLWlJFFcqPgh9B50fshvItkQGdpv0/mMDshTJSISlgRedCoID0
 oDT4lUXNPMODKO2Nk7maOHqKBt4Cg/ii9Rc/R746OZp/R/adZ9R5SYA9EvH4q7w=
X-Gm-Gg: ASbGncs+8GjhTDV/bVEivrrGJqVgKfub1T7EzsVh3PFbWoBNoXsQCexscf1B6VOGIOm
 5d68OIzgoXPgQvOPc0HqTp1Rw8uHLcNCuvvmpbx1Sf9jYigR/0QoN54YYcNMDxkDj33C57AzdcL
 rCvX3zyoHmQukfx/ujnrLMmA4OQXx60uG5IuOdyh5UmNYJdlI0Kvi8Jz84QgrLu1PHMbK/cUN05
 2ZwyffC5FrgeFkM7B87RAkv1o/E4l5n3mLlezDgw93lWV91u8eivO5KU2icMHT/OhBd5/riJGn9
 ezx7xQrZ+CTIIhYcCKoqEKr3MHSFC/i31atn/kgYHaTsDCAARAHU5UszFch1cjAzGEz8egw=
X-Google-Smtp-Source: AGHT+IH1cgaF5tU76THnhAXO4GxVx1EqnJgKWJ8zkZhai7T85xKUgyK77lVetaexQtb3yZ7M3uAvow==
X-Received: by 2002:a2e:8657:0:b0:2ff:df01:2b43 with SMTP id
 38308e7fff4ca-30927a6f5bfmr35430101fa.18.1739821916381; 
 Mon, 17 Feb 2025 11:51:56 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a3a6d3dcesm1478471fa.67.2025.02.17.11.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 11:51:55 -0800 (PST)
Date: Mon, 17 Feb 2025 21:51:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 06/15] drm/msm/dpu: fix mixer number counter on
 allocation
Message-ID: <2gpvg22nvrmcm5ln3ft4oovt3xy5uedvw5oehb3odf74mvvhkn@hz7wwy7jf6cn>
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
 <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-6-c11402574367@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-6-c11402574367@linaro.org>
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

On Mon, Feb 17, 2025 at 10:15:55PM +0800, Jun Nie wrote:
> Current code only supports usage cases with one pair of mixers at
> most. To support quad-pipe usage case, two pairs of mixers need to
> be reserved. The lm_count for all pairs is cleared if a peer
> allocation fails in current implementation. Reset the current lm_count
> to an even number instead of completely clearing it. This prevents all
> pairs from being cleared in cases where multiple LM pairs are needed.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
