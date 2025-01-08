Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7673A064D1
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 19:44:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0623310E919;
	Wed,  8 Jan 2025 18:44:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fot1bMUt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F74B10E919
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 18:44:48 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-aaee2c5ee6eso23523266b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 10:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736361827; x=1736966627; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hQ9RCYkZQoHUKlOMTNvAZNaSglx5AypfSqWMMxjXJJo=;
 b=fot1bMUtuLMMfjIs2vLB+eezHSyGqkXUlbZk08zieXInI9tQMnAgo1HT8uDKcHanRb
 6UghbwDsN1qukRY+yjKHLbkr3iqLEmp3z/q5QGC8tmQC1pd84X4iON7mDdkppqZ14tuU
 4tIkHv9sGW+36A89KjZXuLXKkQADOaPSVSj6NlmTVgeyfLiWDQQKUzAkoF7gPlljTVkY
 5ChBZFZUSOyKKhl5/uAZOXkSfQnhGU+JOBZoke2ojHrhJ8LaUrXL4dOdtP6DX0WtylXh
 dmtVFjFmcUwZzCprobSg5Cr/1Ow4AnVieSwHShFH4S0q2qwzHUQoaq2ZSXRMr/2LIMww
 yvTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736361827; x=1736966627;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hQ9RCYkZQoHUKlOMTNvAZNaSglx5AypfSqWMMxjXJJo=;
 b=TaViA9ccy0O/eMDhZfoEalB6RZr2PNpkHK8co4eZr50uJFPGg32Tf5S2qTwc4ejLe2
 hXYCXIPKvBpZ2pbBrg3zLQj5RnSqrKvWyVq+HJYsdRAaYECS5U6z3D+z8Ekg3G+Y3liO
 CCrYjBZj9zOxwsg52EYw34v/IwyfVHbGZbGqtjmyv31MQsYVWJeOeWOBp8mch+LPzmt7
 DwJqpqHU+G+9B0Zq9J26cGhEv4V3oZuc+7Xv9S8Y0KmXgGhQXO7ceQQHNN0xqVg9/Q0l
 PfwiAE/1CP/KQOUA6LmPufimooh8GP7J5z2D+7OsVS8ZEvhGenr9HibpqiFFI7eqbpY5
 /CLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9M9+Rt1P6F1vgHi39tMC+ihXAu/PR2yoN6WAOXa4rbJNLeU8rSoiSNBH7lyjwFF6OK3rVSjfuaxk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXjTfFZPqs3jhPncWbcKVugXVvAlTVrI5Fg3UdfrLpw3S17rRf
 5ISW7J0DWu51MIRInajkFFD90msj0DF3oaXt3qqMpMP4ZY+syPGrEC6x4S4f+gEH1hROymbWsFp
 I
X-Gm-Gg: ASbGncuJjheaWuKgcN/Ph8QiBeHwNmgHNC8vvkesXrxTeRJ6CTvr39xRRSn5WdStCwN
 1qOiOs3qVKoOw0Y/8sf/aOkwydSzpuFp1/3fuvelrrCx8mUvXRft3+MEmvqgIS3XJyJunisgznF
 CcQve47oeEUTdNJ17lc6ROcZNAAyuECkkeAv15GFe0yWRij+3PQX3o/Fsf9N7N0mcUy5CILYGfU
 zoOn9qXjY4ozDW4xQg6ECOBX+gKH+qjJZcDox1rT0LbBdUeTsGHHTaUiYLPPNM16uHA75EO2ML3
 PeaDS/JjPLAB30u47uT+gae8rfAZ2Mpf1Rza
X-Google-Smtp-Source: AGHT+IGbhWiLOJk+cFyTZ6c+4BVxG7aHRsSzNCXwY8B061yEfeAENAwi7hSnaqACoqNc966WNh3rxw==
X-Received: by 2002:a05:6512:68e:b0:53f:232e:31ea with SMTP id
 2adb3069b0e04-5428481c6a3mr1056967e87.54.1736361391953; 
 Wed, 08 Jan 2025 10:36:31 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f6295sm5533988e87.22.2025.01.08.10.36.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 10:36:30 -0800 (PST)
Date: Wed, 8 Jan 2025 20:36:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] drm: bridge: adv7511: remove s32 format from i2s
 capabilities
Message-ID: <jpikm57sdiwaevbsdxvlg4hsfl3e5un2c2lqtqselkncqgjrow@awuimcytdw6l>
References: <20250108170356.413063-1-olivier.moysan@foss.st.com>
 <20250108170356.413063-4-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108170356.413063-4-olivier.moysan@foss.st.com>
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

On Wed, Jan 08, 2025 at 06:03:56PM +0100, Olivier Moysan wrote:
> The ADV7511 chip allows 24 bits samples max in I2S mode, excepted for
> direct AES3 mode (SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE format).
> However the HDMI codec exposes S32_LE format as supported.
> Adapt ADV7511 HDMI I2S format list to expose formats actually supported.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_audio.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
