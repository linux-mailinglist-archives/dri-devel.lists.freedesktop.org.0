Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C808A4FAA
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 14:52:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8FCC10FFDD;
	Mon, 15 Apr 2024 12:52:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="guhuY0q3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA33B11253B
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 12:52:22 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2d9fe2b37acso38997171fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 05:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713185540; x=1713790340; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=01ardidNL+/BeEuWA/146qtH9HDtmPA03ttD6ybAIEs=;
 b=guhuY0q3popZ6MZhciqkHuybxDyzF4YQ9EQIGZm8U3oIoySu0NyXfhIzg5ZC1JchZy
 GYydAZKfjrMY1n1bgrC6JhauKRk/OvgR0pauIUVfPCVTDa50qrjhJBfjpWCz6kDa58UX
 88NfaZpDgtRaD87gTesurJlAGTgKoXzWwFMgp1H7qQpy15NLFYrxHCr8uiUUn7AhOLAV
 dFUqRWA0i+KzuPAqtvVK60TRUHYLtkl92AO8SOP2YBvQqjTtPPteMVIvIGmA99pJCeRm
 IlRle8AaCo6dPZ1dadMR7xLJK5sy1CsukL64ntagaCgCvtL9snpP5Y9V5HOJYvxj3+Ev
 M16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713185540; x=1713790340;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=01ardidNL+/BeEuWA/146qtH9HDtmPA03ttD6ybAIEs=;
 b=iC1+D+sf6M0jY26EPLE8PpfhMC6vnIhaWditINtp5FPW1SXCsPAKFTr57azRWhHWZu
 Q3/4maex/gl1T+QPQdnQYdRlZ+TpnZurXCdD9WlGyR0obNUQdlZ3LCIj33i0roVJXxKG
 FfWqcEaSXilw16K4xaUYDmd5/0Vidpf6src3QguKlc7n3TE9JvtW1CpoocwYqk1ZK6qA
 viAP3GELo/l6XFMsuvGJTOkpVT2rQ5geOvM0zdvSMfjb1C6VfDgq3Rxzfek148+dOeva
 wAjND9VorIVKEIb9KFyl4V/VNcc0fujt2Kw63wBVhvsE6k7CGNhx2V3WzqJPna4D74o0
 yxWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfSQXnaMf14cY9MEF8ff52nPDA5/UUg6pQyr1Surfpd08NFnJRshIhAytDKe+Igh0qXAlShPn045mXX+dfd1ioDUBaahOsA7wvchE4oVKn
X-Gm-Message-State: AOJu0YyL6iIJ1Znzt0A/UKWYYMjSTuhOYBuW8iBnxu3mXGNQCbD1sN2X
 xlBbhvO5aqd88wHyCdxJlMq3bqBwSeQJyACmmkYbkY7XbmImF5zKeXJkuzQKox4=
X-Google-Smtp-Source: AGHT+IHu5tfg7Nur6nUM4tRHPyjM2leUDl2jKt9o9nLqolr31cl2B0ZsT4h/TE6rznaVk74mXQEafQ==
X-Received: by 2002:a05:651c:1543:b0:2da:901f:6ebd with SMTP id
 y3-20020a05651c154300b002da901f6ebdmr1300658ljp.41.1713185540482; 
 Mon, 15 Apr 2024 05:52:20 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a05600c139100b0041496734318sm19430320wmf.24.2024.04.15.05.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 05:52:20 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:52:18 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>,
 Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Alexander Shiyan <shc_work@mail.ru>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org
Subject: Re: [PATCH 07/18] backlight: jornada720_lcd: Constify lcd_ops
Message-ID: <20240415125218.GG222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-7-9b37fcbf546a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-7-9b37fcbf546a@kernel.org>
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

On Sun, Apr 14, 2024 at 06:36:05PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
