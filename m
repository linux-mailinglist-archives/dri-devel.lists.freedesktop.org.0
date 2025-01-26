Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E067A1CEDB
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 22:48:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A8E10E21B;
	Sun, 26 Jan 2025 21:48:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SMXmukPP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF95610E21B
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 21:48:08 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-543cc81ddebso2372988e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 13:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737928087; x=1738532887; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9/S7PSfTdIyOWCqzxjO8cVsApM/4duiuiYRufIuKZQo=;
 b=SMXmukPPJvXc+5isU2fMyWb6Z1wBVIM9nxWPgWGtsqmRIFlHEHPHaHQkooiU8KqMek
 Hc9qQbYAnevpu9w0ZDuGlaw/ID1+BUQ9WA55LDXWfqvRd/lOZzLuwLSNkOpgZcl1rxsQ
 A7ipIa5DMZO0C7AWoAaKsT0xCe7pN1eCntIrF8FxjVlZgCJh/3glk4J9FzZ6oACzQq3+
 noght4eH4NEQVqSoI95q4nCyrfIFnXrKTN6Gc1jvazQsBSw2qgYs3yke3PO/oKhzXeyQ
 BCcppi2K+c4liMia83f06B7MHfaw2uHmPFuJX9RsNW83wCyG/t2HAh0kpB5mEiXQZ+Wh
 tqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737928087; x=1738532887;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9/S7PSfTdIyOWCqzxjO8cVsApM/4duiuiYRufIuKZQo=;
 b=DQR/ZJhKSQ9UZQIgv+zj6odnUjo0KtpYy70Tl72AgvnJZHqnYQFG3k3XZdhfLTqoXO
 VzlXJrGBa6SnHx15FyLQ1VT98ZsC3KTFRUnKUpeewWKcBgESakaU3Nk4FkoeL3gT/2SA
 S+2Ds2K4h0Jg0NMxS48AP5SP0qgyjQjvWk5PagT155Rhva7TdT+6N+dEaEGWaYdllcAK
 aO9B6bbLVyyk/JoOpV+hRHe66hEvmK8tD7IBEqnkz36WY9g8jCf39hDu4rWo27V0ehqA
 /Iy+degUTtSlRJeanNJ83QFDEBykVYowivmK9cfKS0k4jLaBMqXDyMA9RjRTyilT4/tv
 ShNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhm6N5Xn5duzD63GkbMGCIhawqG+gr9SlHucioaCYxdunepKvduN8jD8u7QsfXHgWlvMFC9MoHvy0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMJt9w1zyZirOkykI3ZJMKKNSHplS27vuFRK4bU5caAObh30Ye
 Feu1G4qmf6IvRZMVpUpDerjAih/OmyD/NqwNiVOtgijutyLh674/DDipv8nnyBI=
X-Gm-Gg: ASbGncsTNKAbk6JTaHUnXuVR84SHeHepMiTjWTuHL2y8gHT8Y/myrcGtQjLHqlnJtqC
 XGafiofPxETPQzGCs8dsneAu+RpmlidvBw5mHmWvLp7XJmUUnWlEakIy57GFMxQTtH2dD9KGgzJ
 90dwK6y6Cj5STENl5PybiKWjoqmpJxvo3ds8sOjlTgZDL4nheaGi6uhCPPnqPJuEQSD4zEOIYaE
 g/RCB1ifLtXeW4KiETpXb0nAwN1iQgR4i3ktTAo2N4Zazqv2Jo4B8wmLe3Djwm3kgguYJ1iS1i2
 3vhZJgks8LhtZWbeAqTJKuDMYfTQz5DwOLNXqxyPF/j0PgiEoquRgqv6zp/B
X-Google-Smtp-Source: AGHT+IEcjYpIgRwjVoLjppNzEES8a1xJOYuIEKUeDh9gpiG0iLZgQtNHK6tYiX6ef1gXdDms1RT4TQ==
X-Received: by 2002:a05:6512:3e03:b0:53d:e5c0:b9bc with SMTP id
 2adb3069b0e04-5439c28743bmr13744798e87.50.1737928086874; 
 Sun, 26 Jan 2025 13:48:06 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c8368521sm1027430e87.133.2025.01.26.13.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 13:48:05 -0800 (PST)
Date: Sun, 26 Jan 2025 23:48:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>, 
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Stable List <stable@vger.kernel.org>
Subject: Re: [PATCH v8 01/13] drm/bridge: cdns-dsi: Fix connecting to next
 bridge
Message-ID: <6ie36b5hcrgteo2gh2ievnyw2lsnfr3nhsbxu6ymthmc7lzfvs@3zbaf6flye2t>
References: <20250126191551.741957-1-aradhya.bhatia@linux.dev>
 <20250126191551.741957-2-aradhya.bhatia@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250126191551.741957-2-aradhya.bhatia@linux.dev>
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

On Mon, Jan 27, 2025 at 12:45:39AM +0530, Aradhya Bhatia wrote:
> From: Aradhya Bhatia <a-bhatia1@ti.com>
> 
> Fix the OF node pointer passed to the of_drm_find_bridge() call to find
> the next bridge in the display chain.
> 
> The code to find the next panel (and create its panel-bridge) works
> fine, but to find the next (non-panel) bridge does not.
> 
> To find the next bridge in the pipeline, we need to pass "np" - the OF
> node pointer of the next entity in the devicetree chain. Passing
> "of_node" to of_drm_find_bridge (which is what the code does currently)
> will fetch the bridge for the cdns-dsi which is not what's required.
> 
> Fix that.
> 
> Fixes: e19233955d9e ("drm/bridge: Add Cadence DSI driver")
> Cc: Stable List <stable@vger.kernel.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
