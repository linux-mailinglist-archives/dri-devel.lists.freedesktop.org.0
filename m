Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3498CC8EF
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 00:17:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A90110EE38;
	Wed, 22 May 2024 22:17:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XBzpAsZy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C3910EE38
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 22:17:25 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2e564cad1f1so77658281fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 15:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716416243; x=1717021043; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MKjPVo1pobuPoRvHj1uEO1HEyVXXDgMeLw2a17VZbrU=;
 b=XBzpAsZyKu6LFEDRaaHuKt8/bQwO/bfh4Ro45ggKGSPxyJs7PUuUSbVko+BU/FzY8u
 I6GWuaexV0Rc9j0ZUfmlR3iAZMOAVUwAgfBmOIXSoD3yKwGiGgpGUOk1zfRZCnoGEaG8
 lLfXMNQ+K79Tb02MD+WpPTKtdUUQVER3seeLPIhH02Wa1kz4aZ8ELXyo0b0XPHpzURI1
 EqQY4TBpOJqZYQ55GKTs013qF7G39eBjyX8uifQF2Mr1/a/vbc1DqcmU0W80bkldpPDp
 4tJNVIld+s1wTqcUPA8hqghVpT0QimHDnOAHhU4ZBrCAdjfWmrj5vOZbW6KEIc0w3Q1w
 mPxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716416243; x=1717021043;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MKjPVo1pobuPoRvHj1uEO1HEyVXXDgMeLw2a17VZbrU=;
 b=b/tmgvdLlWahZyDFd3+QnbPOM3TG6bnN+aejTHo1M1ec6Xf+Ls1YCiuQ3ur6imSyvX
 XHEzQrkgyH4HjdKmg+zQSyW9opQBv9aae5qwuSBM36NnmHP/OIA1sNaNTqyhlNvC4rKY
 Abn6oYIag0PSu0V2IAF3PBywhLM/OsWzO2PQTJonNSm3cfPJ1JCBl8eKKgaUw0L9ZqGj
 1rG586mqyp0tPd2kBxQBDjDD8GyVBCVu5Do+QHoajDep35L32X+aIGO48mAb/g04JFyb
 +dBLZinOG5+UckP1Znnid+N+8D/AqXUoryZcxqhWG+r6726zbE4XHHdKZ+Tq3uyTuTcM
 HayQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5FAgS0Lyf7vJq6Tz0k+KfZYpoD6fbfG+cIY3/9hijd2uc0PYx6uMbK+2YGiPGuwmTESwzLPGPzN17r8LAOzcZHTyAxIKt7hUnQlMRAvVO
X-Gm-Message-State: AOJu0Yz96bVYhUjDoFFmJz45kQObLEFi5f/9bSsqliU31tFYVyDAM1EJ
 E6Bb5GEnyaXkrMN60wdmC/WmJ9ubw7aWMBuuMHe4qoAC2dp5JFeSVku+C6TNDM8=
X-Google-Smtp-Source: AGHT+IHfhjtR8bEAU54UWtngodjp97JPGUmwO1OM74aRntp9IkGMZ3Yej1SUNJLq9vHd0wtc+li0YA==
X-Received: by 2002:ac2:4c95:0:b0:523:72b8:8002 with SMTP id
 2adb3069b0e04-526be315f14mr1967940e87.30.1716416243518; 
 Wed, 22 May 2024 15:17:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d8b66sm5075515e87.195.2024.05.22.15.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 15:17:23 -0700 (PDT)
Date: Thu, 23 May 2024 01:17:21 +0300
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: Re: [PATCH v14 04/28] drm/connector: hdmi: Create an HDMI sub-state
Message-ID: <zeg3lwkgc36lheoh3wdieexta2roqhhx74crxtw7dygdffkgzn@fwkfx2ixhu4q>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-4-51950db4fedb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-4-51950db4fedb@kernel.org>
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

On Tue, May 21, 2024 at 12:13:37PM +0200, Maxime Ripard wrote:
> The next features we will need to share across drivers will need to
> store some parameters for drivers to use, such as the selected output
> format.
> 
> Let's create a new connector sub-state dedicated to HDMI controllers,
> that will eventually store everything we need.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/Kconfig                 |  7 +++++
>  drivers/gpu/drm/display/Makefile                |  2 ++
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 41 +++++++++++++++++++++++++
>  include/drm/display/drm_hdmi_state_helper.h     | 16 ++++++++++
>  include/drm/drm_connector.h                     |  7 +++++
>  5 files changed, 73 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
