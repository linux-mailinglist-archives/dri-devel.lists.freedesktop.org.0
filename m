Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B92C8CCFDD
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 12:04:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3821F10E21B;
	Thu, 23 May 2024 10:04:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="G8FoBTk2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB2F10E21B
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 10:04:02 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-51f60817e34so8513340e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 03:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716458641; x=1717063441; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TH/BUWVtxkmUJ13gtzS4sCxD7fWyObo8iOIYwJa0PIw=;
 b=G8FoBTk2da2EDW0PXrnqCB3+DsvmkpuZfkow2Ahsewn0WYgS0M5ovRZR9ALAUV+h6u
 4NDhY/HLdTZPDn3dqN9Zo9Al0V9Go9Zj5ViXOaEOAM561Ar+63OD2ojDOKrDt7WTHM/S
 xBc9GwS4N97QD8iCJn/yNOZB/NHBESbWYa+rSKIwWuqbJjWE2ox+DCcz4UKCK5TcKWJ4
 Z+bn9t0j8ixdyz1owoSF7n633fJ1dRsQ8rB+1/k0darQTHqfZjjw8t84zKdhGorCjgrS
 bO09/I/+t70XNbUWXZMumGWw8NcI6bNLidMtZfxeQgH2ru6Heaz3nVC75O0GEpZY7ucl
 S4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716458641; x=1717063441;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TH/BUWVtxkmUJ13gtzS4sCxD7fWyObo8iOIYwJa0PIw=;
 b=U610sr6vHZkKOLLE3YMSg/UuFGqJCRXaYEEqTCdVXALYHqVKVtY+w9PEPqcB3Ny2f1
 cmro3yWXT9Px6XB3VMJJBv5RQss5eT95FP7I2aMuu1nJFRnyqyTO520F3yWB2BLJ3X8L
 rqBWxQJvgz1dzBpDaQ8srjT1PoNmfJhJiPMejnUiZUJc86OVbBpXXHkXsupBREKAsfGB
 Zar5cjvdFxl1ny/suKhXeyXoAJIb+Sk2rK8NZFYLCF8fQRmZZ6M5BLAEGa6PQG+dFULX
 bgHOWNGAoDR7PRQlmkWzMdKmlCksczKxoh46aJKzQs6yhzXNyiwY91v/s+OmRCb3193V
 nxpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUMRrghERv0NJlKngAEb4v1nmKFOF0MnMAU7YshsEsqxrGhfZg7tYyCj9uLVX63DBZLWx38ItRCfj8bnZpMhxiBotoAVSza3nEM2VK5Q5L
X-Gm-Message-State: AOJu0Yzrr8cbo53IwE08bxWoloCHSco3uW6LIrzuNnuyCDsdbLUdCYLF
 O2UjWkcJRtlWOEi1GG/0Js8IOo2Erri/fz4wvYshvXP5+s5/LyTS7FekKSblFfk=
X-Google-Smtp-Source: AGHT+IGlpqecDFsJDGKpUD/L/07fSwQIVn93IEsQGl4tYZ0BdBGomkd7vGGiht1/7leKlSP/ZRYLZg==
X-Received: by 2002:ac2:5930:0:b0:523:89b0:9b64 with SMTP id
 2adb3069b0e04-526bebb45afmr2452653e87.7.1716458640738; 
 Thu, 23 May 2024 03:04:00 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d8ae2sm5423836e87.204.2024.05.23.03.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 03:04:00 -0700 (PDT)
Date: Thu, 23 May 2024 13:03:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Wick <sebastian.wick@redhat.com>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v14 13/28] drm/connector: hdmi: Add custom hook to filter
 TMDS character rate
Message-ID: <hjz32n3wokppjxdpzu2lsoypno2dy6thi3tfrkhy76g7v2a5aq@5hjjd52fsqup>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-13-51950db4fedb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-13-51950db4fedb@kernel.org>
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

On Tue, May 21, 2024 at 12:13:46PM +0200, Maxime Ripard wrote:
> Most of the HDMI controllers have an upper TMDS character rate limit
> they can't exceed. On "embedded"-grade display controllers, it will
> typically be lower than what high-grade monitors can provide these days,
> so drivers will filter the TMDS character rate based on the controller
> capabilities.
> 
> To make that easier to handle for drivers, let's provide an optional
> hook to be implemented by drivers so they can tell the HDMI controller
> helpers if a given TMDS character rate is reachable for them or not.
> 
> This will then be useful to figure out the best format and bpc count for
> a given mode.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  9 +++++++
>  drivers/gpu/drm/drm_connector.c                    |  4 +++
>  drivers/gpu/drm/tests/drm_connector_test.c         | 14 ++++++++++
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  4 +++
>  include/drm/drm_connector.h                        | 31 ++++++++++++++++++++++
>  5 files changed, 62 insertions(+)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
