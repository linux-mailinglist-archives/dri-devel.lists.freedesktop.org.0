Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 753EEA3617C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 16:22:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C0F10ECE9;
	Fri, 14 Feb 2025 15:22:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sM2Ozt1P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05FD310ECEC
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 15:22:29 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-543e4bbcd86so2232299e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 07:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739546548; x=1740151348; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fJot5B8/dqhQxIfQ8JsIVVHPjrU/SK2cqPunhk+EjbA=;
 b=sM2Ozt1PHxi3s0IDpvtLBwR23lMvQdFDYR9/e6gQ1+Z7XmHhtkXPkwj1OrHjRpc6fj
 pxgTmMllWuvB0hLOtsAGlLOlHCX0dqPwr7JHsnwuqDFZv91xdFNAH1A0Gef/VWi/c63A
 uEK7g+B6GHCK0h7qA3KDrb1Ol1bk6G/fhw02G4kx1eBjgVk9V50OhORiJnXacbu3eZ7i
 sWEAYVlKXC5XKMjJXt1xD08NS6RKi2Le0D3oru72DZOHxnwQ2Hd2p1to5lj+jgJOQ2M2
 SJj7LRTIJhG4/dnClvciJ5avFu7NEJAJl5noozw5eeCoqAGDd5eknAaWgfUThm3FE7Ci
 Oogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739546548; x=1740151348;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fJot5B8/dqhQxIfQ8JsIVVHPjrU/SK2cqPunhk+EjbA=;
 b=jYEjAXaWkwUKn0/rZdexE8QyP1afEb1NITfmLdtxDOEmw1kuliJXkuwsGzzY2XZ7U4
 Vm+1czqAL/HzGbGoLosLBrEkWfPFek7vQxNo/DFjj1BuXI1zTHWr/6qW9wkZZ9hN6RGQ
 h0/CAPl2AzHF7yqWSfQWtbvybJ73xLMe3GR3LJ/rLxIeGYq45SENTtTapYx4OGdbnMd6
 a5AT2t1L7yZsSuF2jiDmFg12iaF0JySq3EFCGu7RRaajt2TvawBwaeSRSrpeM7rVAz6d
 BhFUaw4HbWpP4CQeqp5Q25czjgKNA8NG5xTxsauRo+2CyyTw/at94hiDWCV6WsouKR+s
 z3Uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAt/n88LHP5Uh3LdMF900EBZcQi0p+G7JDxEWrVactrB72fie31iA8Bq23ic2CSalk1nbGQFxGwzk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznEcS6DIU06lvXLHv3EeY7gDaErN8ONuS4DbwDqnyEeG4HE9KR
 UUV6fnxJ6+Az7iJn0gaJRCwLHmS5Mw2mh7CvY5CHsOp5RFD5t17hxjQE+kG8AFE=
X-Gm-Gg: ASbGnctZJGCJ6zVF/OdM5Gosc0zf5Uiq1s7IEggUR5JkZv9ZhfuqHfpnKtYlPfx0l7G
 8kz6z43biQBlkc9Fh3b+M7yU6Zvh+xUwsgA7ImfVDnF/wWugN8hojrJQsZKCfrl6jPNzVb0Bu3z
 T7hCtG0i1SglOugc/ehHMnbz7n6+IS5rZziLl3/WF2p0Xuh/mj0X1wm6hGCAtgOQdJ3hOb9SqBQ
 yjRA0AYHIhvDgR0aajPUedJcZUM3klhE8hafHMVu9pGRB6di1dim2ZDePv6txSdSw2rLbCuEava
 k7Itp4rPwdzwQ2JHOax6aJfuow/FeZCSTqCibtVVYpNxaUq6eLFg7gBMwUl2UJqcHpQgCa0=
X-Google-Smtp-Source: AGHT+IHd6YyZaJ0gJzVV6IzMidNDXlHHAg8FDIw7tYf8COTL3g2DYgMEui7KrHFl59zy7pcT2QzHdg==
X-Received: by 2002:a05:6512:3c86:b0:545:2a7f:8f79 with SMTP id
 2adb3069b0e04-5452a7f908cmr1095665e87.16.1739546548279; 
 Fri, 14 Feb 2025 07:22:28 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f09aae0sm569393e87.64.2025.02.14.07.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 07:22:26 -0800 (PST)
Date: Fri, 14 Feb 2025 17:22:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] drm/msm/dsi: Drop redundant NULL-ifying of clocks
 on error paths
Message-ID: <aarbydttw4zexzkorcr4yb4swscw3crn65u6eactutpfgpnt4y@fg4zyd45xwln>
References: <20250214-drm-msm-cleanups-v2-0-1bec50f37dc1@linaro.org>
 <20250214-drm-msm-cleanups-v2-1-1bec50f37dc1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214-drm-msm-cleanups-v2-1-1bec50f37dc1@linaro.org>
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

On Fri, Feb 14, 2025 at 02:17:44PM +0100, Krzysztof Kozlowski wrote:
> dsi_clk_init(), which gets the clocks, is called only through platform
> driver probe and its failure is a failure of the probe.  Therefore
> NULL-ifying specific clocks is pointless and redundant - the PTR_ERR
> value stored there won't be used/dereferenced afterwards.  What's more,
> variant-specific clock init calls like dsi_clk_init_6g_v2() are not
> doing this cleanup.  Dropping redundant code allows later to make this a
> bit simpler.
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 3 ---
>  1 file changed, 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
