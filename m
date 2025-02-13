Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BA6A34A29
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:39:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06EB010EB2D;
	Thu, 13 Feb 2025 16:39:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="besQjZjc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24DE610EB2A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:38:59 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-309191eec90so2199821fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 08:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739464737; x=1740069537; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=25pk+Y/rMAdCCmKfH8WB0VaWkCY32GRlTZdE3DT84t4=;
 b=besQjZjcHaB/knTsn1LntggluhftSgfs7NFWzqFJq7mcmsJxS+8hL/aSf8EB4P9vm+
 /Lmn9uKHOxLdtGhtNADnpgL1hyRz0+NAGWiAq3/pMP0tZy5Cfg07t+dfH8DOXnPRwzV+
 ZEN3sQ9Mm8nwQ/TJETju3M04FDTtmA7b6IXse1vRAQm0IrVjGl+Q5sKGn0L4qUqkuPjf
 przuj/3uLc405XtdXBSraCgJmw7HKuFOG32HIfa+2YtcFfuhZsc2reKCBBFpjjai8Nid
 VqCMNc3RM6RngURFA5cZhuayjFEm60OtTsBDYYFHx93sj0OBI9bKu3Mnv1++0RYALgEd
 Bg4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739464737; x=1740069537;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=25pk+Y/rMAdCCmKfH8WB0VaWkCY32GRlTZdE3DT84t4=;
 b=GIsXyGYUWafdEJAv0wBA5yPtFCVspWJDs/lBcgBXhRnYPgbnkL/IGmG6GIsyermtDd
 GAJwbefn4rm0BvFCb+irb4w8/M0i/inN1kPihyBek1khpCJcZfHjYjRb6jDebVtq3pkG
 ccgY3hADqQVYeezv3MHABQ0Uqnt52gEJa16TrV2+YdyaUgJIPIF9SZzllaVymRVxMzUV
 9rLUEVUrskDDFrNxTUbGX78nRb8927b9RBIYBccLjoF9YHY01L/TmgJSAlL4ih9nqddb
 hbdqOBeXOzLsjz5Jk56lRyF4NiGY7tAiZbYGdq5wrDZx/x/RqOPIEjVdfMydmFrcmocO
 MVOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3/VOqTcZj/BzBzH9W/qS05j1r+glhPe1rM3AACDsE7716OD1ql50VsSovhQSj1+kfYtGnK9j3sc4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHPpLKBC/ct/ZmQRLA/RisbV9jVYI29T/4Cw7znIVBgggPYzeg
 czgCpqISmqU3UmlRX9DD+vlMYsFOjTOcVXyuhESlkgYkkRwiShrkg0B+vwLoWT8=
X-Gm-Gg: ASbGnct12lEHChCr+qJ17/IU9CgpXHx/Y+zz8Z3Q24rG9vdHGggNhyL/L0kG5ayC1tM
 6pc+pIUaEeoqyFqriYLzJguZe/aaeInV3Xbw+Y7bSOi25FqwvvqkNhLibOpMSgnwbZjGhH+DVbR
 KqwB0/e7S8WrXp2zP8+/c3R/7T19qbHAvRGD7mHzu6DT+7DYRVca/kLSw1ELt/tEd3xx/GE/znm
 Ym29bGDmlvV6lis7zJFO5U1xv7NaQggROJv7mqr595dTNRvUtFVbRmyfnSJ3szuCzBZNk9VmEuw
 7LKx41rRJNhpejXcacqNoJKOBm2PbMM6GhudesDUjeiCGBFQ2JTnvtcV6O33As7n+oic2kY=
X-Google-Smtp-Source: AGHT+IFG26aozbwqiIe5TJo5u6EvRNj6wZxhVBO1uzGcxcCjum2AaOurE7QQZrKisXuepJZwYUmXcg==
X-Received: by 2002:a05:651c:2205:b0:300:7f87:a65 with SMTP id
 38308e7fff4ca-3090ddce939mr16010121fa.35.1739464737383; 
 Thu, 13 Feb 2025 08:38:57 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3091011f453sm2405951fa.54.2025.02.13.08.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 08:38:56 -0800 (PST)
Date: Thu, 13 Feb 2025 18:38:54 +0200
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
Subject: Re: [PATCH v3 18/37] drm/bridge: Change parameter name of
 drm_atomic_bridge_chain_pre_enable()
Message-ID: <doyqz3odwcf6vxrmaitctcnwx723th667tfzpzmtialms4ymg6@og755erngglx>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-18-e71598f49c8f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-bridge-connector-v3-18-e71598f49c8f@kernel.org>
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

On Thu, Feb 13, 2025 at 03:43:37PM +0100, Maxime Ripard wrote:
> drm_atomic_bridge_chain_pre_enable() enables all bridges affected by
> a new commit. It takes the drm_atomic_state being committed as a
> parameter.
> 
> However, that parameter name is called (and documented) as old_state,
> which is pretty confusing. Let's rename that variable as state.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_bridge.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
