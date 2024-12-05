Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7FF9E5EEB
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 20:37:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2700510EF8C;
	Thu,  5 Dec 2024 19:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="p1NBmegg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EBB210EF8C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 19:37:18 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-53e274f149fso1301834e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 11:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733427437; x=1734032237; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FU/EUHsit16rikYcJKnQECWispe+WbkZdRTRsFjxo4M=;
 b=p1NBmeggPsai6Us7kesvCfozIsSokQN6/StCNVfiK2uUKu1d3qgqhS2KQZIXxPsGrg
 wY6ee278eaOveFvvnj5thwplLc6l06k1m4YtKX1f0n6V9w6tMmN361AZwou6H82OsEdM
 zB47A2+u40ujz4O+qFjtpkbWLO7ZGVqGJGTKxiiafnN8qekDAu9QNsJoac1ImN5CrOm4
 gwcOzW3uj8ojwV7AwegL23ffjHgMBGjrlbV30UbY0K4SicHY4UxNkni/LPXFWNNSyqAm
 2II9zIf9p9iZfn0WfEF4JPaXRcZUwq3JFDBNCgQtqyulr+pJFXaynEDCRI4cGbubO46K
 smjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733427437; x=1734032237;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FU/EUHsit16rikYcJKnQECWispe+WbkZdRTRsFjxo4M=;
 b=ayIPIC2Z3lRwK59Rwg/C/cy3QMazFA7wIkrZzi3cVcpQw5LBRk4QbtIbCdbCVQE5o4
 MbKOp1MH/KkTEuzSNA7FNTHxRHmC8c8a96lxe5F6nlllxBwK1zqepXmPbZvucP59qRe+
 vW+UWOVzO4i95Rva5ghuBfqvsYa/GWpmlQxclt4PYcorEAiGXswDSsgfCDLHzVGl8M6Z
 FxEL8W8CFW69fwW8H1bynzKYfjIRQSK5pz18qSpu38TY4lj1grp9THEEXUzfv8LEWlh2
 vyfmxGxWtOxCPTPk5diQlOt4Z29JWgwCJdtvFnosyxL5PbEvAtDtsgwzOtFZSpPcFqGx
 nX/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJU25CU522NJmyCLrl0+Un2GHOIUlDXcXrCHT1Ji4C2qMueCux/TXQ+9GT6WELQBGSphQLg5t9G4A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxyfVCIHGbw0UCf2P7s+sfaVKD9owH02OlVWVTUfcCo2UvkrYLG
 jY0JjYk/WKrEO3PVVu3YwT6CakwWISFhnAlEtQojI3Sp2aKMzK3an+/V1lF3PWU=
X-Gm-Gg: ASbGncvMFCtV5u/gbgDDyl5A5KHAjzostlW+vxCxMi0oOpuNU7HK4rx+V5uDkEFVIdJ
 7yo44g8IZdBiuQLZBGTE/pUuxfmQbTNDSCCVIRUbBd5jvL2r1gLeu14Lo0P/GmQKgH38izUzLm8
 OzyXpXvkdJyXIa4mL8z7n7Hx1lygaKTN/8kSqVsqs6GhUiljB1oiP4pvk3jAmNGGOWFm37btM4N
 GctNTutp3XDV4xbiovDlI8rwIqA+Fj+Q4fprFvzEAgRdkWi87r1smYDFcv+fz9mfNo4NxAabEZD
 4iB54vJAH4t29SnTx56JH6VVI0f4ZQ==
X-Google-Smtp-Source: AGHT+IERXOKhrQS1SGs1D5VgGlJZNknfg8nNxxBg0Nz/3rd8qLiDCnCB7kUCHN8FpkTx1vIxjtpeoA==
X-Received: by 2002:a05:6512:3083:b0:53d:e324:11c9 with SMTP id
 2adb3069b0e04-53e2c504b81mr84578e87.54.1733427436612; 
 Thu, 05 Dec 2024 11:37:16 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e229ba760sm320223e87.155.2024.12.05.11.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 11:37:15 -0800 (PST)
Date: Thu, 5 Dec 2024 21:37:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, biju.das.jz@bp.renesas.com, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/bridge: ite-it6263: Support VESA-24 input format
Message-ID: <lpkbkayu5hlwhbzxhez47gob5zed27z7ced7vkadqfmxneh54w@6zwd3xvskooc>
References: <20241205080210.1285385-1-tommaso.merciai.xr@bp.renesas.com>
 <3bab95ae-ba66-4aed-9cce-13498f2f50e6@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bab95ae-ba66-4aed-9cce-13498f2f50e6@nxp.com>
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

On Thu, Dec 05, 2024 at 04:54:09PM +0800, Liu Ying wrote:
> On 12/05/2024, tomm.merciai@gmail.com wrote:
> > From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > 
> > Introduce it6263_is_input_bus_fmt_valid() and refactor the
> > it6263_bridge_atomic_get_input_bus_fmts() function to support VESA-24
> > format by selecting the LVDS input format based on the LVDS data mapping
> > and thereby support both JEIDA-24 and VESA-24 input formats.
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> > Changes since v1:
> >  - Inline it6263_is_input_bus_fmt_valid() as suggested by LYing
> >  - Fixed it6263_is_input_bus_fmt_valid() param from u32 to int as suggested by LYing
> >  - Fixed commit msg as suggested by LYing
> >  - Fixed commit body as suggested by LYing
> >  - Collected DBaryshkov tag
> > 
> >  drivers/gpu/drm/bridge/ite-it6263.c | 25 ++++++++++++++++++++++---
> >  1 file changed, 22 insertions(+), 3 deletions(-)
> 
> Reviewed-by: Liu Ying <victor.liu@nxp.com>
> 
> Since I have no drm-misc push right, Neil, Robert, Laurent or
> Dmitry, can you help push this?  Ofc, no rush. It's fine to wait
> for a period of time for potential comments.

I'll wait for a few days and apply the patch if nobody else beats me on
it.

-- 
With best wishes
Dmitry
