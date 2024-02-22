Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA05286046F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 22:11:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE6D10E9BC;
	Thu, 22 Feb 2024 21:11:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="z6C+J1Aj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90BC510E97B
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 21:11:00 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-dcc73148611so157185276.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 13:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708636259; x=1709241059; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pkCYglSSRXX0GiB1gOdgF7fLOHHbF1/C5DnjQjUjWpM=;
 b=z6C+J1AjVxZWZoTVwacbJdndI+0AjyA1kLY22wfzlEjG5/6KqoapMK9g09/+yxoM4+
 +zTOzWl2S1BKKbzaU0QOJ7S2V+LmblVitOcXhYZyxbrrKWpCqk1Y9pbSrqClwhGN2vOI
 XNoifmCjnHYBwWHw6VJvJfmtun8nT6SOgWArLnlDexfowXiF6f/HdSsefMC4evfZzjai
 5NEss0/y0YRgTZayWffzQWcnABqUB0vGpzVXljJlsj6CwRVI87F8IGXw2vEitL0Ofeae
 TrGQrtRDCGWhqgcvCPSl4UNwQbzs9bSTA/fb289C82kPGHzceqjvrW6HE9CIPV0qbJLw
 y2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708636259; x=1709241059;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pkCYglSSRXX0GiB1gOdgF7fLOHHbF1/C5DnjQjUjWpM=;
 b=JQqBPNP/5yQmyzxxKERR1f/xZxQxrtWZVIHa6AN9fKuCd7a3WxjZdI3UczmjZmJMUM
 BxXgXUmb3E1Jw+TsFaB6sAadkV0M/dgucG00uQHZufvmpS4cjadw3/LfeHudFhuNFwAd
 Elbv6pq9HPhio+nZ02/AYe9wrB1U1+Eq6qqzcSztSCOodGAHxD59zzhLi6i7WcOte8J3
 ydYxd4loExI8QKSfJcjX2+8/+PsxRHYTggcxwtIzYKIFx0ELB5hA0FR3kBx9JVoAQSBN
 Dh8HzatKjXCo8qIrUShBDog8boSPV6Speu5TPJAto45KVCmcl3VHyMeZylG8htK3J4/k
 J63A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUq66Q77Rwji0s36BgmCmZDKVGkPr2HQ1JxM04IwItdna8XWvc06qgMuTOABxR0NgYOCwOoP7SVuaDXzZsQjWAmF0qUet0InSHcICZnmMst
X-Gm-Message-State: AOJu0Yw28u6CFq/GtvH6VxwX9RdyfEJA+7OfgoyPWa/gGJ43440+3MBg
 VONaMXyWettdbXecdzDjVem9/TOTZj5exfcNtte37hcPlVFAIlh/8fFw3MyWgtaUaWliIFhvK9o
 CHJ453iGejhpAByre4TjRNGUzQMKa0qxhmBoKAQ==
X-Google-Smtp-Source: AGHT+IHwJkpERffkN3VWKbN/6atXOQ33nEsq/sgXRDlWA2N8ix01nl3hWBFMaZvbIXKA9vuRKkf9w2wT34E6I2Z7bFE=
X-Received: by 2002:a5b:2ce:0:b0:dc6:c367:f0e4 with SMTP id
 h14-20020a5b02ce000000b00dc6c367f0e4mr343701ybp.52.1708636259455; Thu, 22 Feb
 2024 13:10:59 -0800 (PST)
MIME-Version: 1.0
References: <20240217150228.5788-1-johan+linaro@kernel.org>
 <20240217150228.5788-5-johan+linaro@kernel.org>
In-Reply-To: <20240217150228.5788-5-johan+linaro@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 23:10:48 +0200
Message-ID: <CAA8EJppsaMD91AOnFx8J8fHzZj_dCrOeM-HQfNukwCsrw7UYXA@mail.gmail.com>
Subject: Re: [PATCH 4/6] soc: qcom: pmic_glink: Fix boot when QRTR=m
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, Rob Clark <robdclark@chromium.org>, 
 stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Sat, 17 Feb 2024 at 17:03, Johan Hovold <johan+linaro@kernel.org> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> We need to bail out before adding/removing devices if we are going to
> -EPROBE_DEFER. Otherwise boot can get stuck in a probe deferral loop due
> to a long-standing issue in driver core (see fbc35b45f9f6 ("Add
> documentation on meaning of -EPROBE_DEFER")).
>
> Deregistering the altmode child device can potentially also trigger bugs
> in the DRM bridge implementation, which does not expect bridges to go
> away.
>
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Link: https://lore.kernel.org/r/20231213210644.8702-1-robdclark@gmail.com
> [ johan: rebase on 6.8-rc4, amend commit message and mention DRM ]
> Fixes: 58ef4ece1e41 ("soc: qcom: pmic_glink: Introduce base PMIC GLINK driver")
> Cc: stable@vger.kernel.org      # 6.3
> Cc: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/soc/qcom/pmic_glink.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
