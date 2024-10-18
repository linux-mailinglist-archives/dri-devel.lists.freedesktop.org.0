Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CACEF9A433B
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 18:07:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A3810E37E;
	Fri, 18 Oct 2024 16:07:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="U8Xbicqs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A4710E37E
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 16:07:17 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-539e63c8678so3027803e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 09:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729267635; x=1729872435; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rjcBRZvnJO0Q/9XpD2JDbA/HXvXf/zaDJqw9x/2j+Bk=;
 b=U8XbicqsyGamSv36ZtXlgYkvNYbyL5tQ5ubAU62O0nRb3mVBGEb3f3MvOROAMvW4gl
 8Ba3Q0/ZPsqFvXG4msobE+QOjmM2ymu/nYzJcD9LLiVKpr3am4eWHv+4XO0i9UbXAGes
 vGRLalOCvXniVrCb0g43bbpQFqYm4+BN81Iew/ayiNGDuEELF/Syw11uFaTw3DAEUWTl
 bcl4NSibYSoyHlsq5VwqesUPXVC1f/clNJwZXBe/xmrNavgRXM45G2QaTk3Iut4as+ZT
 A6fZScP79UhBa8TRlxUtYHpz0sdywwvJDRmBsZGn7rWt6/1x/Stfzzjpj8nkmPHm0XQv
 YqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729267635; x=1729872435;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rjcBRZvnJO0Q/9XpD2JDbA/HXvXf/zaDJqw9x/2j+Bk=;
 b=Wv/aZ2Rg8kJNGg4141/HmW20THBOZuOxyNhA25Ks7524eR2PXHo58MNBkZalFmqVsp
 q4Ttu65508mNfQ3MUBodmorT0dRORcRt/PJwReoISWuxRXu/YzG5caUvjiIQ8JzQy2Ky
 9z3y3z49lzGGLJptwN3n6lOMlWKg63mSx4aqk2bxScITllzzvSXhyCHTchzakPkuR3Ab
 Xg41D2P2GhSZSN9TRktfs3osk44z6JEA8ZG+JgPZ9r+8JZyfrsFw8F1ur08WtfL1yI3e
 TcajJlvNu0SUhDkIoxZHEy3fejkIep+HvE1YYUGur186Zz3xvEaunSQU4x9aXnjRfDyp
 s1ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfXjlbFQV/nJb7Uarv1hLnLvDQFnUA0GPyGggz2H0Iin2y5tob+8/3k4ALfCtGL3FoV2QS+7c7n9A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDq1KscOw4W+17ftKo2ueqxUNTxjfX0PJcMlmmz3fWhvbRBPam
 7efHyceCeuR0HKt0Oe8EoBnErn2wCeih7+oBNokyssDp3BKJta50MBuLM/ESIn3eWrBBSdd/3Az
 uHU4=
X-Google-Smtp-Source: AGHT+IHwvQU8GblbN9I/D3jtz2hj1cj70UCdrbo0R6U79C6HYhqn13HNnFfZCrdaYv2b9j2Lm7EP+Q==
X-Received: by 2002:a05:6512:b14:b0:52e:9b2f:c313 with SMTP id
 2adb3069b0e04-53a15495a0cmr2076684e87.22.1729267635230; 
 Fri, 18 Oct 2024 09:07:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a1513dac2sm253377e87.0.2024.10.18.09.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 09:07:13 -0700 (PDT)
Date: Fri, 18 Oct 2024 19:07:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jani Nikula <jani.nikula@intel.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Imre Deak <imre.deak@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge-connector: select DRM_DISPLAY_HELPER from
 DRM_BRIDGE_CONNECTOR
Message-ID: <pzeye6mwl2bdzwfepoazfpn4qjhuiajomx2eygbwzkghmocgme@wnmyk2xvum4l>
References: <20241018150850.3418359-1-arnd@kernel.org>
 <3yqpyobkkvnan4fo5h3vx5jw5ke4zqoavo354rkw7h3frleurn@oag6vpmedaz6>
 <19944f9b-e7d7-45da-bf1c-0c3eeda27c12@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19944f9b-e7d7-45da-bf1c-0c3eeda27c12@app.fastmail.com>
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

On Fri, Oct 18, 2024 at 04:01:17PM +0000, Arnd Bergmann wrote:
> On Fri, Oct 18, 2024, at 15:42, Dmitry Baryshkov wrote:
> > On Fri, Oct 18, 2024 at 03:08:45PM +0000, Arnd Bergmann wrote:
> >> From: Arnd Bergmann <arnd@arndb.de>
> >> 
> >> The imx display drivers use the new bridge connector helpers but don't
> >> explicitly select CONFIG_DRM_DISPLAY_HELPER, leading to a link failure
> >> in rare configurations:
> >> 
> >> ld.lld-20: error: undefined symbol: drm_bridge_connector_init
> >> >>> referenced by imx-ldb.c
> >> >>>               drivers/gpu/drm/imx/ipuv3/imx-ldb.o:(imx_ldb_bind) in archive vmlinux.a
> >> >>> referenced by parallel-display.c
> >> >>>               drivers/gpu/drm/imx/ipuv3/parallel-display.o:(imx_pd_bind) in archive vmlinux.a
> >> 
> >> Move DRM_BRIDGE_CONNECTOR out of the DRM_DISPLAY_HELPER block and
> >> instead select that symbol indirectly.
> >> 
> >> Fixes: f94b9707a1c9 ("drm/imx: parallel-display: switch to imx_legacy_bridge / drm_bridge_connector")
> >> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >
> > I think a correct fix is to select DRM_DISPLAY_HELPER instead.
> 
> I think I just didn't express that clearly enough, selecting
> DRM_DISPLAY_HELPER is what I did and what I tried to explain:
> 
> >>  config DRM_BRIDGE_CONNECTOR
> >>  	bool
> >>  	select DRM_DISPLAY_HDMI_STATE_HELPER
> >> +	select DRM_DISPLAY_HELPER
> >>  	help
> >>  	  DRM connector implementation terminating DRM bridge chains.
> 
> I had to move the 'if' block just to avoid a circular
> dependency.
> 
> Or did you mean the imx driver is the one that should
> 'select DRM_DISPLAY_HELPER'? That would also work, but
> adds a bit more complexity.

Yes, I proposed this solution. I think this is what other drivers do.


-- 
With best wishes
Dmitry
