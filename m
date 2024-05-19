Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E22E58C9429
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2024 11:09:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9FCD10E0A8;
	Sun, 19 May 2024 09:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OVtEFHO8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3507810E0A8
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 09:09:19 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-51f174e316eso2211959e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 02:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716109757; x=1716714557; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rui2ioBF/hbydLGK6+LX/Bpt5Bve2Qi/2ftvoYfb94E=;
 b=OVtEFHO8GvTcmxMbf1N0aqvSNwoRRpQA8NDlB+2ma1EUl6Ab/gHwQOTK9VS8Ik8vHU
 aEqafpz3amIZFxFoP9gOMoXj7qSHz8rzBxdDR5zm0wqTRR4RDnrbGS0N54LgZKslyGxD
 X94ZsPB2lYzuK+N5QLl+UiYwdMcdcFKC3/WK3APGUOSH09LWn4LgVqa9jiWAHUaeSbcY
 nv/T2UlvwpkyPzajwRQemgpjWyHV+qtTnwqJANY+gd68DUKlq7Z2w7T+IGtuWlsvpOG+
 2o5KDyBxuR29u+h0gU7HgvtRluE6gMeXDXGSsnl8D72v4QVFwUfLXKBPYQdM8eDJwuI+
 1eyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716109757; x=1716714557;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rui2ioBF/hbydLGK6+LX/Bpt5Bve2Qi/2ftvoYfb94E=;
 b=OUAKIDgAtSucZLrKJQfwyn0MljTkPjAeQuxq6ICWo8H8JAMGaVw0X8Tp0jGg35CPUf
 kszeblpzUbK0QN8hWGQ84MUowQN9sVwnKQo1HJ/5qJA7RAquT3MokXwm/X6wxb8doKQP
 a2K0CavfW6QlKo7chHtGsMfn7DcKzL4pVEgapm4cEz4OnDFs6PmV1d/JNVVIu+qBpibk
 WJAyMe2YdZLGra+OuhzWxdh86n6LLmFaBLh3tTtKpbzScD2E/g/pVMKVtEd+9eJe54Tz
 2qEbg+v/5BBYy0EPfdHi3hqm4dFQFbxY5LQURZZQZTDYicSk/c7GpDIDWNrMffUaO4qE
 ag3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkLKvFqBsEeqVY30gZN0NHZIkAolLrHkQmh91DRt0RHCuv42qp6FtAxeK49aJTdmWz8HXh//7wO5h7MLo2RS4oANHW8P4C0K+6Wqzd2j2h
X-Gm-Message-State: AOJu0YzbnnjolzBLYeybDYWBPUU36ua+hJGd+qryxg6ZnynknPvxY4Ne
 PWqrKCc8wWwCrhB8Ltv0g7xu/JeTwDrGnRsNxhKwuhbyJMeE4625UMG9zbe/A8I=
X-Google-Smtp-Source: AGHT+IEeCPkOu5RpLfTq3OVpZwEmUGbUNKvVTEJ35UIr65PMPCTz28rrIvpzhmNPUy97SW8iYbSM6A==
X-Received: by 2002:a19:8c4d:0:b0:51f:2709:3641 with SMTP id
 2adb3069b0e04-5220fb72e2fmr15611199e87.26.1716109757214; 
 Sun, 19 May 2024 02:09:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d8edbsm3836307e87.239.2024.05.19.02.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 May 2024 02:09:16 -0700 (PDT)
Date: Sun, 19 May 2024 12:09:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: MarileneGarcia <marilene.agarcia@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maxime Ripard <mripard@kernel.org>, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Imre Deak <imre.deak@intel.com>, Jani Nikula <jani.nikula@intel.com>, 
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 Douglas Anderson <dianders@chromium.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Shuah Khan <skhan@linuxfoundation.org>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, 
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/dp: Fix documentation warning
Message-ID: <5e4fs3wjlnqjmbxsu5y5rksqcjvhzwyofhrahvnypbdrgjaf4t@bzm7z4oqvtz4>
References: <20240519031027.433751-1-marilene.agarcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240519031027.433751-1-marilene.agarcia@gmail.com>
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

On Sun, May 19, 2024 at 12:10:27AM -0300, MarileneGarcia wrote:
> It fixes the following warnings when
> the kernel documentation is generated:
> 
> ./include/drm/display/drm_dp_helper.h:126:
> warning: Function parameter or struct member
> 'mode' not described in 'drm_dp_as_sdp'
> 
> ./include/drm/display/drm_dp_helper.h:126:
> warning: Excess struct member 'operation_mode'
> description in 'drm_dp_as_sdp'
> 
> Signed-off-by: MarileneGarcia <marilene.agarcia@gmail.com>
> ---
> Changes:
> This documentation comment should refer to the name of the 
> variable to solve the warnings. As operation_mode is the 
> name of the enum, and the declared variable name is mode.
> 
> Thank you.
> 
>  include/drm/display/drm_dp_helper.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 


Fixes: 0bbb8f594e33 ("drm/dp: Add Adaptive Sync SDP logging")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
