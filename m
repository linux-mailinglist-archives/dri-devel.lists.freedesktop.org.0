Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA2390DB93
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 20:30:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC53410E22C;
	Tue, 18 Jun 2024 18:30:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="b80T9N4Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A7410E22C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 18:30:49 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5295e488248so6302291e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 11:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718735448; x=1719340248; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=52ILC+iPkxf1W1rnzs2d7+a3LRv8ock0tdBb1YRlo3c=;
 b=b80T9N4QeKnUltaEDklPnzC1yUvAOkghrY8wCYniywY2ScHtBbaUokE4o1rbvmlwgm
 wVbeTSSptOxxmqG3a/Z14zjqOmGg8dKeZeqKR6N37cXY4oR4wqPXz6Gjqw7HcZiPRGbB
 BHksAoqCXSiP4/1wveMU4bsjEkJ4/SK11lqMGu50/h7BAvU3LWRUtAAzrPJ4UkshDsWA
 FgyaapLZCf+EWlLm39OUvf1egy+jwkT1hnzZM7uEyd4kTGsGDYsYlCUb8IRLZmem7LRF
 HZk4r4Hqsw/QbMZYkDxrP1pWObB3amB5GPDTbQGJQgtFycbrwS41mANFkcMtKxbWoPzV
 C6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718735448; x=1719340248;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=52ILC+iPkxf1W1rnzs2d7+a3LRv8ock0tdBb1YRlo3c=;
 b=pXBMEFZxupHxz2Gvlj+IUHAHexFCsDwgJF2X5aegT4FMnUOaQq4C1WDTUfyZEDLnZS
 29/2g53GQfuhUIVZF4a2paaP/mJzSvb5BVolu06OKalKjVMfOkOSRjIardNGsYmKK9MF
 35afrLsFOCWACl7Az860s1V0j9pT/DmeJ2pfX3zlcSkHnOonWkY6BHW5Phj5JbpRVLlm
 Er99dHrTyeDgM9DTTTd2obI6OQYlQJMymiOFPhbX21MWsAn+9WDN9T+6rMzc5Kb3akV3
 1Xyg8zDYW0tKYEFYQCfYiDDZooy3uY/tgVGdLwEEdJD71w9l8amiskhxEUiwNf0cAVw4
 RYcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUL24kyMpz1JBfjfshAyn1fkPzgB5X4xZ4N4Xm5j7s39vldP7eVwLGkKEZMfGCG4LUD6JQ6S2CPb6jcSeWBGEyK333SX5ZDBoHqYv46FHRc
X-Gm-Message-State: AOJu0YxyhUApjy1+UeA9CfD6MQS+SzjLt72xg/GQ8cv3M0Miemq6ULif
 jQLFJ9zxj7G8nIJFHHmaGnpNF8ZXE5oJOC3UoWB8SGjwrcjFfXIbdijnD/bdpPo=
X-Google-Smtp-Source: AGHT+IGB58Jps4FYhI46qB+wmqA1pZtOTuPECfwF421A0zG6YiJpgyWrshLU8vQQQhfAiaXnmxxXZQ==
X-Received: by 2002:ac2:5962:0:b0:52c:86de:cb61 with SMTP id
 2adb3069b0e04-52ccaa2a8e3mr248301e87.10.1718735447818; 
 Tue, 18 Jun 2024 11:30:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca2888a28sm1577548e87.290.2024.06.18.11.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 11:30:47 -0700 (PDT)
Date: Tue, 18 Jun 2024 21:30:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Re: [PATCH] drm: bridge: simple-bridge: use devm_drm_bridge_add in
 probe
Message-ID: <km6qh5ur2rsyts3gisqxup3blrpggpr5u6mtqddawzjzlh2tyk@moxo5x3yo76z>
References: <20240618-devm-simple-bridge-v1-1-c7ed8a09fcc5@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618-devm-simple-bridge-v1-1-c7ed8a09fcc5@freebox.fr>
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

On Tue, Jun 18, 2024 at 06:19:59PM GMT, Marc Gonzalez wrote:
> simple_bridge_probe() calls drm_bridge_add()
> Thus, drm_bridge_remove() must be called in the remove() callback.
> 
> If we call devm_drm_bridge_add() instead, then drm_bridge_remove()
> will be called automatically at device release, and the remove()
> callback is no longer required.
> 
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
> This patch was proposed in an abandoned patch series,
> but it makes sense by itself. Submit now.
> https://lore.kernel.org/r/20240617-tdp158-v1-0-df98ef7dec6d@freebox.fr
> ---
>  drivers/gpu/drm/bridge/simple-bridge.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
