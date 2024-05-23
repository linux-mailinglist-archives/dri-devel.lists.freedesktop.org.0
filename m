Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4837B8CD054
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 12:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF91B10E8FB;
	Thu, 23 May 2024 10:25:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uF9nvrRu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 891F810E596
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 10:25:35 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5210684cee6so8059627e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 03:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716459934; x=1717064734; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=h0Y/Ql63/IxwaJL+O/h+E6/ion+Rk9v6vnf8eimobm8=;
 b=uF9nvrRumh2IzGdh7AxeWtJLFFm/uIHR43sHbC53bjNYFrrg2A3/zxzTaUbBAiiIO9
 b4vtPjWI7aVy8/us6LNnXmk879pzHMayfGpl67n8x14Er9ez+p0FXkjytht8s9pt9FxP
 WiWwY/caTUZycObIU2qKr6eTX7F38+min3UlOLh1uXtyQVbmd9M1K7RHmuUWWv0gQdnt
 XW1HYUZrO3XojIOPAk/exxU5hk3Pb7+bQvTMzQXQJTkAYBvzqAJuWjFJ6DL+hyYbRX8W
 rpSD3ldFdf+XdYc5cFGSWbu29jFN+NTW7orE5P+SnnlfgOVlSrYkhePfL4K8x6hbkM7w
 y8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716459934; x=1717064734;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h0Y/Ql63/IxwaJL+O/h+E6/ion+Rk9v6vnf8eimobm8=;
 b=g55uIcL46gNpFERsRkx63FOnlcIop/ZDu/rPzdzv/ivbcHxllOXqhdsvo0O7XlfUrr
 ui2DDm2QCWmvz/S2T29W5m5KSZiA2PVzyI934Y2tZ35/wEgyaMSXBlzJ30zJ0ed9RR/u
 5i81cYtPj1cB8nYfFWK8wd92UuoEFXMs2BC63XNn5N+XEz7Zs1ZU2y7glpSF4umCpzC5
 OMINIFXuj7o4VF5NmCLlwN+KCq0JmX1ohUVDwZTcFh17m7qAJsqwotfJWd6qTWENxsXR
 tolyoEk1hfU5LKXQI6AG9vrCmPhF2xLlU1UDP9KlCPkj6HKm4sPZm14THbyI2y/GIbZ4
 8jlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/D8LYdjcqGSNCw8az98yMlrmjqQPC+AVAOCRqOQavqRIOiD1Jl3CFIUJuVck+WqGqI1QBJ6LX9oeLCeBcMc8Sq73+8PknTTg22wfqI+7+
X-Gm-Message-State: AOJu0Yzg+YPkEeAdqFruBLkbKWYkte45FTPAPKyqb+SHVxe+nS29k5tl
 yjLfgjEyxw+D7cBSA3Nme0Xmt/c9/ESDO5vPB41H1h5Ryxv/KRk7oCKomPm1ms0=
X-Google-Smtp-Source: AGHT+IG3S9HxgA+BRyKc+tEiIJocVHkYeAAUZVOvMSsA2E8b2S+QZ7Z9TP78uV3Je9C7031yrjAtlg==
X-Received: by 2002:a19:5208:0:b0:519:2a88:add6 with SMTP id
 2adb3069b0e04-526c0782f50mr2886400e87.55.1716459933553; 
 Thu, 23 May 2024 03:25:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f35ba739sm5323969e87.101.2024.05.23.03.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 03:25:32 -0700 (PDT)
Date: Thu, 23 May 2024 13:25:31 +0300
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
Subject: Re: [PATCH v14 20/28] drm/tests: Add RGB Quantization tests
Message-ID: <pruqf2ou26m7i7ez2p6rgjdfbzkngqyuwfv3bnx5d3jzxce3af@sa3d467uka3d>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-20-51950db4fedb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-20-51950db4fedb@kernel.org>
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

On Tue, May 21, 2024 at 12:13:53PM +0200, Maxime Ripard wrote:
> The previous commit added the infrastructure to the connector state to
> track what RGB Quantization should be used in a given state for an HDMI
> connector.
> 
> Let's add some kunit tests to make sure it works as expected.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 355 +++++++++++++++++++++
>  1 file changed, 355 insertions(+)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
