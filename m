Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F41BA34A34
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:40:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9EF810EB2F;
	Thu, 13 Feb 2025 16:40:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fsAqf1Si";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD44710EB2F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:40:30 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-308dc0878dfso11593821fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 08:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739464829; x=1740069629; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qraGv6mGKYKyl8rZKkkq9STxARUxqekP37EO+4rOhdU=;
 b=fsAqf1SiknnpPumRlIbOjbSm705aDwQz0N5x+oLkeu5J6tYJ3UrY+ul8fhULuffCcm
 4ckALdr5nZELv/eCh4yxHOg1YmRvE3xY1XnlHAdAbuaQEvrU1A2X5mnovKgvAdPRSpW5
 q8o+G2PhR3X89oQlhtTLNrsGqIuh/MrToEdHbg1Zd+nKn70zWUhyBA9v6VvPO8Lvvdfb
 UZYXJTFzuxWXdzH1bS55sD3QNEdV76hVL42XXGDc4MnvOkY9Xk0cuPX4+kV9PK9CN8ee
 JVPOPUuK7sG/TAJo5HsSRJuK1eS5o1dI4XIjx+TRMx+7nNe88hz4sJik4Uk1vtkbUYQI
 Pzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739464829; x=1740069629;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qraGv6mGKYKyl8rZKkkq9STxARUxqekP37EO+4rOhdU=;
 b=TX32E3giZksNUtRvVBK0xoX8J9x8t6xjd2wpm24IwZih8fN/x2AzCaQcb8OC5IPfIk
 /p4rIePR6bdOjODlfZ0bKtpxThV6gpHlCxfTK2QIw+nr/P3/f4hefgyeosLyl7aZdGUG
 5qxzLOH8nW6qm3FJXrPgsTBHRJUaqGgFLLClvtFRkjNKs2RHP3biIDzHBH5OcoXmsYZh
 MYY7/lQtKzlveSDpgaUfbFjWwnCiqRpARDhhr8EVqaQq82+B52T/Oc5qzI+teD8SCn/y
 GkNrEb+2nof2HKso2PMc4gRnPtWhM3yoqqgQZex4gKn8ngKyvaGPJhRa/B0VKDc5xtM1
 ogcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcBgWr4oslr1ywgcPjEHi0r+9aEYl8Ae46djdwFQ8U3QfIRWIXTk9SNHPUsTG4nT0NVZo+/Cvc6Xw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwyMcC1kPA8YP2zsttCfiQfdz39asMkd25udUT6Q4jyfEjksLCn
 48E6ZGy76FYjCUT/y17fXWzALNG69fJjZrbMFhLrsQyGCFpHU0U8neZEbko5IJg=
X-Gm-Gg: ASbGncsiTwS/1eTzbgH4kO4321LBXckk+8sz/7c9Ycs/4jvaXfMc72hZXH2V8FzlGMh
 cipqe5J+ncIwS+Wq1FTMWUgV9hXySpnJi/mY/ezqIklFXhfDNLImL/Z5EJNxnnojayp9MmeU+Kq
 f299VRTcXuxbKMMG1Xz/vveP0NwcPahvRYYdbWrphQT7zDown2rSZnfhYOP3ok4Y0kHHkD+3RIN
 nCEnrKTm/65gtH6RNitEyoTVpWwL2mTTXXq+C535LICZtH2gsLxVjA9DyspWCZOT5cg41XkZAz2
 xkL1iYZlDVUnV40Z3huwXsy4NZyZcZ8IZ+uUPFpL62h13MIK03cL3wCsnndVkDx3SD80df8=
X-Google-Smtp-Source: AGHT+IEBbVyTSUbD4VIdVMCULrKUp9Odd8WEDu7/wXj1JaLQYfEgmkmrL2fVeKfSHhXYce9o3e399Q==
X-Received: by 2002:a05:651c:1507:b0:307:5879:e7d8 with SMTP id
 38308e7fff4ca-309036d7adcmr31262491fa.30.1739464827902; 
 Thu, 13 Feb 2025 08:40:27 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-309100effc5sm2332031fa.30.2025.02.13.08.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 08:40:26 -0800 (PST)
Date: Thu, 13 Feb 2025 18:40:24 +0200
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
Subject: Re: [PATCH v3 17/37] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_commit_modeset_enables()
Message-ID: <vtmuxb6h6hsjc5xclr2kaxjdyxpzvu2xpouyvmddpye6xtipz2@y7ryrzcjrgrl>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-17-e71598f49c8f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-bridge-connector-v3-17-e71598f49c8f@kernel.org>
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

On Thu, Feb 13, 2025 at 03:43:36PM +0100, Maxime Ripard wrote:
> drm_atomic_helper_commit_modeset_enables() enables all outputs affected
> by a new commit. It takes the drm_atomic_state being committed as a
> parameter.
> 
> However, that parameter name is called (and documented) as old_state,
> which is pretty confusing. Let's rename that variable as state.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
