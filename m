Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBBBA34A2B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:39:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8862410EB2C;
	Thu, 13 Feb 2025 16:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IamOZy3u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1D210EB2C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:39:11 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5450abbdce0so1076642e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 08:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739464749; x=1740069549; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ROkBhlLVVwSUfxVQE5hWrNfgh2+kXGToJyAm3nJurYQ=;
 b=IamOZy3u7Kl4qT/bBFTbaq+8RLQQ7mWmyXhPtyrxsvUCiGjmE90L/ct5iX7MrhtNgI
 hS38+OpBmQR29Eke/rPJ9X1AKi/7b01T/gh6P3Y9VMd7c7DLhZgel0ZD5JsVdjOanD2F
 z1P06thPyWeWVAIAAJgVxQ7kLSr2+IVsyytYjDV/1pcB3jvNQW2ngOahkVE1grfKLpEC
 KkLOqzjtVDW68RKIiqESpow9wv5vFXWYjczA/Lys8tTUJ+L2SLT51skSjqEcY5/m5Q8k
 crdqSZP+xahCrQtchf8LqCzSpe3sqlAsgZasngt3yxX5MDzwQNHW3m2A5yvuq03xOO7b
 4twQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739464749; x=1740069549;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ROkBhlLVVwSUfxVQE5hWrNfgh2+kXGToJyAm3nJurYQ=;
 b=c4l4scYVZM/kZERzkJtXCuVbAeX9WzfX9pdbTIuppkDgj4+De6bPnMSVe36q6U+qfl
 f5zGaM+UIyrMlMAHUIe5w6XB71S6ty6chABJQHDQmLqB26UukcziUhVCGk9vH+2cI+VI
 rVB9q29yvxna8yydxFYuS3k0bV6P1U6Q0kKxDiW1ODDlHzrPU1h7+bZBjuNhQ8RgXy0d
 erCL7hqOiYP0FCu4EWmgq8UDbMaxCXDn9nrDPomJ7D2ou5e1JAg7G531MGhjTwfNZ7D5
 4SV09G0Xbc4NfEKT6GGsdhomAMj80NJ8T6b9s1odfcbiqnKBAjX42N2e8haoXcEHSg9/
 ANDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWb6AJxPo1iyxiagpq5AdvUFrDuFsUUSIXnzWerC0hEQCYO3ATKlhjOxUIJ5tGwiIB2zPbTDbg3Hl0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAe4JpepaYWCx79hmasV01n/fVnyHkTsUMnXK0BAtAiHJq6Tse
 LM1wAP85RazHMD5GrJIqPFgXFmYD2aVKU/BbZkk79M2BzpvtO983MhcZm3CahUY=
X-Gm-Gg: ASbGncv+w1kz96+gkMXGxIvpyj38ZUW8O5c19rSCSuogRSsujjnwdVNwegj9bF9pfqj
 PAnpFp3c0FN73C02gQjl8Sbiv4vOVxyc6+EI6kfvCXuoRCIXGMVuBeQR5zAR9cEEQs6q7kgJqAz
 +VjrWA5SxiGg/zY4e0VgtT9MEl5aNZ9F4m4MY6zaGkygoKeyxxsd6EOL5k9PjWAyrCTpNQCt+1p
 Nvpi9WTLOTBpHnizC890dxb3ib45JuruEMSuHxxRfZmMITsOznwveZ4f/wik34QD/NhrEA7rBCo
 zRSParNHensrnstTCuzPFOC6p3Cus1HOdnT+YeVA68Sdmo+6t2V42HJGL4Y3mq0I+cs2xAw=
X-Google-Smtp-Source: AGHT+IGNm3a8hYI5z1IHDbLi22s0Uy12h1aBxG2214iD9koo++l//qklYRbDNgtDVT4jjatgBNZhFA==
X-Received: by 2002:a05:6512:2019:b0:545:c51:4a29 with SMTP id
 2adb3069b0e04-54518290086mr1844942e87.25.1739464749574; 
 Thu, 13 Feb 2025 08:39:09 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f105d08sm213806e87.134.2025.02.13.08.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 08:39:08 -0800 (PST)
Date: Thu, 13 Feb 2025 18:39:06 +0200
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
Subject: Re: [PATCH v3 19/37] drm/bridge: Change parameter name of
 drm_atomic_bridge_chain_enable()
Message-ID: <jykxa374atekniahxcjnlhx2pcqej23zckr3m5ykx56vm4tnpq@ubjjwy36jbhk>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-19-e71598f49c8f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-bridge-connector-v3-19-e71598f49c8f@kernel.org>
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

On Thu, Feb 13, 2025 at 03:43:38PM +0100, Maxime Ripard wrote:
> drm_atomic_bridge_chain_enable() enables all bridges affected by a new
> commit. It takes the drm_atomic_state being committed as a parameter.
> 
> However, that parameter name is called (and documented) as old_state,
> which is pretty confusing. Let's rename that variable as state.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_bridge.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
