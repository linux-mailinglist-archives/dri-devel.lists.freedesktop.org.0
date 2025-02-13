Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41345A349AD
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:25:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED2F10EB1C;
	Thu, 13 Feb 2025 16:25:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ownb3c1/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D43210EB1C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:25:22 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-54504f29000so1065503e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 08:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739463921; x=1740068721; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cSOs50TsU4X4YYQxYbnAMJ4ehCd3Gz/LqOB9FsJlXcU=;
 b=Ownb3c1/sSpgs1zmpZL3TPLICYgEaKDIoRVaKynJKO42AKeWDoO25XCwNIurXUV3p8
 ZYHpR7Q+zCKOrbOLB2jXLiJpCtdgpTH4UTH6mdAUulpWjZ/DJyf1ao3JRCVv+ECqBv+z
 hwChqmdgkmTYcrvtxobv8Ms+upjV6kWqBxiwPWugGksJUpofq6egSuYG5Od6sGi73ooG
 ly/Z13QrFLP20hQAoZC5m9Q50RYc/F2m2tnjfitdzPmUJOK1cF91nAVk50w4DKMKv0bS
 xVUzVAMNCBf6/IvqLLGFfK7ju2SwVdxFgD3dh6LwYL0JU38xGctzhY2aPsBNJJpVFBQV
 ieDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739463921; x=1740068721;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cSOs50TsU4X4YYQxYbnAMJ4ehCd3Gz/LqOB9FsJlXcU=;
 b=Nrsr5c3sSV6oiGEATWEhcGN4yPaM8JnOMkFRWAaaRLpYbhWoNkSbEIuD2rnUDL98oH
 xCr0u/DtmM6Fv91yWKKw3HGgviJzJcOr87aoLGBYc4oY+m3Y9NufRWjVjD2C/P1Rhp3b
 Vb6Q0GDYzaRcdzz5a1OoiohFPohtt6EulheJd9ZdncJzYI4MjbZ6zSIFXTxDzt9iLKST
 Mx9yOGynk+7+3+bFrdj8X03RkVq3Ws0N8CzNb9csRKk+v2Bml/dP2SMQfPjh++7E7Beb
 GJA5c79aACOSLwtn+CD0xFqEscdQF50lbRnmN/9lrgvthjkNgk6TnbDj7N6ODyP0tj1k
 H1Lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5sVxaPDaEIFd8YExZ9lrgjgxy5wtzyz8JHuR2jY9hlFxNGQ0SzsmyYpeTdRoDXKy9El+GWD1V97c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznNqIyySTsKOXoUYwT3CdvC5N//UYnuY7D+6gwQMl3z1Nho7Xl
 LXKeKS+HPUjFLTImrNIgurlVzqX3YsT96QeMCu8dJRr0P3KQZOan5igu2PGHfhQ=
X-Gm-Gg: ASbGncu5cdochayKJAUU2w9M1V1WUOfYU1rOJbnDDTtuIZQMZ+clf+Fa8N6Os2GK6ti
 d+n7jq1X6Q6qVquQ3rYso3fK0pV0wY2BpZo1SydFqkXbXux8ZpZSJaQJWzkqzKIbFbjvRHT6K9H
 m9ocpQ2bWFF8JG0OVP2GDzQ7MZr7s2vr63YdoGUd2kBaS0uftP/VyrF+ow7wiAWRLwEQsSByMqD
 /sJaSInG5RDxMcR7qcVoybWfW7ta9Dgn6TfTEeuoGo63CGY0VWHmoi5Yhgewsxf1VBkTRoFNQ2t
 4geXgQivsBZF/zodgS5W30jjFP5f/lqH4k5TlpBkKjyEuZr3tCEmmsg+90/HvlotW8qNUb8=
X-Google-Smtp-Source: AGHT+IFChiazqWx/+2a2ZIZUghuFgsnsSdaCX/3eX3urzt33SaYJfC4xuJX7c2QAEv7EGv4JsO+x3A==
X-Received: by 2002:a05:6512:3f25:b0:545:6ee:8396 with SMTP id
 2adb3069b0e04-54518282967mr2782235e87.13.1739463920795; 
 Thu, 13 Feb 2025 08:25:20 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f11ea5asm211876e87.215.2025.02.13.08.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 08:25:19 -0800 (PST)
Date: Thu, 13 Feb 2025 18:25:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 29/37] drm/bridge: Introduce drm_bridge_is_atomic()
 helper
Message-ID: <5afaezaqggshwmcclrsfgnkd3kgxfhrspimqt2hvan35lsoz74@w4ytuxjgtqrc>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-29-e71598f49c8f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-bridge-connector-v3-29-e71598f49c8f@kernel.org>
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

On Thu, Feb 13, 2025 at 03:43:48PM +0100, Maxime Ripard wrote:
> We test for whether the bridge is atomic in several places in the source
> code, so let's consolidate them.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_bridge.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
