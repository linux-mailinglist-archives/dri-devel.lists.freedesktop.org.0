Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01110A455F0
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 07:46:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77ED010E85B;
	Wed, 26 Feb 2025 06:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gU0siIxm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D2210E85B
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 06:46:40 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-545316f80beso5755748e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 22:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740552399; x=1741157199; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/vfdaNHAgLU4X4v38fyX8xInLCuGf2K2NlB/6RcTL/Y=;
 b=gU0siIxmMHJNnE0gpxliHs4vT/vZ9Y7YCHLCpyQM0NtPR9ELo9d/mCOfa53P2MnCuS
 tNA622UvURPoFmCiQ1Fv/MkYOzrv6smYv7aC41jNQFPwRF29t99S1K0KmX2AK4/nzR1W
 eH6fA/oRRTgvRtsWyKHgbNhV2Yex6zRLbdmPJGrC97Far2J+KO6rAChvOkCiVJbvDAA0
 haKQk7Qv9hvDsPfnxFPnxcGgt2JhjDQucVEgzBKcV8ekXi+tNC0VN2KW3arvdup+en+9
 pSmrA+4CWeADTz048mkJRIKum3gmeT2X6zoIE7m78V0M5lmeKlqYmhQ5KDl8nzdVoRdm
 wj5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740552399; x=1741157199;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/vfdaNHAgLU4X4v38fyX8xInLCuGf2K2NlB/6RcTL/Y=;
 b=VOwZyraMIlvrbjjjl/mJpCYpnySPArEoMbqNgvdIYXhR4lbztzK8jHrq8FRF8+OLx3
 VhQjvQ0/HjYF5/4CHDqS7/aOxFn0eIeNmVPp/k5A6ieFhppt3XTLNUgPcibs8d9+9qaU
 klSTTdMtheP9QxCM/6jf5FDQlH1nR1iYUmslL53PE3kizH2XsFwFr6Pyu2hGjrt90mAT
 FGXZIerVKPfK1WDhhtCYYO+vVRREi4rKUaGXTOSzFXsjmpppTANrVNRD3wwvSa4GGkC3
 hwa3LG2II51nIUS73Og5vOUtDNGYb1Th4xieghL1SfhQKde19oeDSATt8iNmxtMXJoJV
 bx+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUS21SZ90dLKPLUAR4yBA0LJjdad9JOVxnvzloSnXLYdWixZ9s/r9dkU9LLOM8rtkRGNmqDmjchncw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzQM7W1HPJKJcMBHI8eH8bAyfYRsEVQlG1EZlojn8Zhqsz2ns7
 9BChHoAFeda3DwgrYua87BeTHImILaIa1sAQkxIljUp2j/FfzDbcBPA85nbywTQ=
X-Gm-Gg: ASbGncviB4gxDy66AIrTiWfd74wJDejofWcuTrMYHRHRjdeFq2xkZOVLiNe2Yx2d9D1
 iwAq+/abhVF5GvnuZvm0RuU0MfkLsCNVTmegzaF8adTnjWMbsYIScRy3QGxhPR7Do+MQD0lhQP2
 5++bdX/eVbrSiwL+XIz+5Ad2Xg5qpF8XJgtXcG1x/OTgMC/QebS/+K2E8FAZzwfkuBhyq7Z+5/5
 CWWC5RvvxsRMba0kwq4F9Pz6hlr72lUDskIxwboOyC5cNlUPUMKhwab6G8vF5keBfi6KJaN9u7y
 4/mZDW072t09N9Kn9JgeWvSQhQ6rcN9kaBMN6L/EPh/f94AziypjrpyO8H0hvQH6GBVNjThw9D2
 M4QtO2Q==
X-Google-Smtp-Source: AGHT+IFlGFPHSuOs6aKtjduRbIhUyJeMLrZ5qkVf65OGMr4mgS4XwrgCjHMmEUZahLCcnZP5OZSzgg==
X-Received: by 2002:a05:6512:158c:b0:545:b9a:b4b8 with SMTP id
 2adb3069b0e04-548510ed8cfmr4069970e87.51.1740552399254; 
 Tue, 25 Feb 2025 22:46:39 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a819f5da7sm4244041fa.62.2025.02.25.22.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 22:46:37 -0800 (PST)
Date: Wed, 26 Feb 2025 08:46:35 +0200
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
 Herve Codina <herve.codina@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 09/15] drm/bridge: ti-sn65dsi83: Switch to
 drm_bridge_reset_crtc
Message-ID: <rgybsoofzkhhkfpl4ivdibv5z7eutq3wegzmliebmctklqzqif@f345drzfbhr5>
References: <20250225-bridge-connector-v4-0-7ecb07b09cad@kernel.org>
 <20250225-bridge-connector-v4-9-7ecb07b09cad@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225-bridge-connector-v4-9-7ecb07b09cad@kernel.org>
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

On Tue, Feb 25, 2025 at 05:43:57PM +0100, Maxime Ripard wrote:
> Now that we have a helper for bridge drivers to call to reset the output
> pipeline, let's use it.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 26 ++++++++++----------------
>  1 file changed, 10 insertions(+), 16 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
