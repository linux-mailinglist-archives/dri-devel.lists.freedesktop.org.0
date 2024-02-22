Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7990860443
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 22:00:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A2F10EA81;
	Thu, 22 Feb 2024 21:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BSUieNJe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B043810EA8D
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 21:00:20 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-dcc80d6006aso166891276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 13:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708635619; x=1709240419; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dmvjj7fhOobzTivUlelD//oyOg39L8TaqEJkHM6CbjU=;
 b=BSUieNJe/E/HmksNIik+eHjOUeUpIv/u3uPUjULvq2UP+P/st+m99o+KlkWO4O5x9q
 AdxkPcgEZqfkdEi4YvfT+1eRSqmioZMvqkiMCOscxWfwQV5n2zCbN8nIrDnhIgJRJrFT
 5XJWFs1dVVLN5cAhqW0VTKU7ViRVWlU4bXbJm4SpWqJunipm1dCuYxmTIal+tcQbgKzC
 zwqfexXk1kOk3+hr8bjGK/avV8LXEnsrJTOr8QobzEblIWmGQv3xLaS5rTM9cHfnt5Nm
 HWp+7qNTGo3JRkEZEoy95dmxnM8GOmzxy9wAJIOB1SwoOnilFnYhMjz7P4VTU/P8LQjt
 Vung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708635619; x=1709240419;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dmvjj7fhOobzTivUlelD//oyOg39L8TaqEJkHM6CbjU=;
 b=gOlroicO0NdtJgUX73xzCXOBVCj5CmAzvwUJJsce3Wmw1aPE923UIuy1dOPZRh5Dwl
 yq+uRtEOLF494m5XrytTSSm49mTgOHwWhJRa5m37dmQXs7YW5vUd68+kaVisfNOxCWzc
 jl//iJq2oyct13TzfD44nyryJ+lUGeNdSvDD3XmNMX/PWo3Ug5+iVeVAAIhHfZsSenea
 zcjtD3Sj+0Un9MBLkqIa7SslunN6OhCg6gTskn3LKOEHnV68eiaS9yN6tg8pIAmGmKQr
 j6G0HRKCnmd4v+BeQKOwdTRfVetd+Mx3Yu3jlWcRLJEuPay6qIsVy11VjiQT1GFl8F2i
 vDGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnH+GMxsIFes/1VSjOVjka/ASM3I0ssEtUKs0I8o2QwC3KZhyvy2hXI/GPJfcfTk/zjMddEE04+Fy4KcbuzpsZmp2ZX1W1c4yGDKSEZCMu
X-Gm-Message-State: AOJu0Ywr/0HrpDZmz1VFaiE8RrFr95v1GCGbI0xKxXmEzk+79+FCpoYN
 HNPdHupLb+pOEEc6oa5+ofMSKcXv/PQpUG26/zcaiAGMsLU1lVF4eyWPovA8F+0fn2+84+fN5N5
 Qo9ZXzCk/OLAZYu+6ViZyMBtQkV5ndLt/luRrLw==
X-Google-Smtp-Source: AGHT+IFdnFEXZ/1Ob2Rd+e7Qs1/dnY3m9z+vfb8chmIF2GjOTnC5mGKNn2WgjovOSKHSnuhiBw7HcB/7y1Jd6eekJXs=
X-Received: by 2002:a5b:d05:0:b0:dcc:8aaa:3ed3 with SMTP id
 y5-20020a5b0d05000000b00dcc8aaa3ed3mr303376ybp.16.1708635619664; Thu, 22 Feb
 2024 13:00:19 -0800 (PST)
MIME-Version: 1.0
References: <20240217150228.5788-1-johan+linaro@kernel.org>
 <20240217150228.5788-2-johan+linaro@kernel.org>
In-Reply-To: <20240217150228.5788-2-johan+linaro@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 23:00:08 +0200
Message-ID: <CAA8EJprBs8ASwZMAHFMQUEg7NN67rzRtUX--8h72-7F9R_=o6Q@mail.gmail.com>
Subject: Re: [PATCH 1/6] drm/bridge: aux-hpd: fix OF node leaks
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
 linux-phy@lists.infradead.org
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
> The two device node references taken during allocation need to be
> dropped when the auxiliary device is freed.
>
> Fixes: 6914968a0b52 ("drm/bridge: properly refcount DT nodes in aux bridge drivers")
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/bridge/aux-hpd-bridge.c | 3 +++
>  1 file changed, 3 insertions(+)


-- 
With best wishes
Dmitry
