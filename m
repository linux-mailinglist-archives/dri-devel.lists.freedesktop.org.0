Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF59577D88
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 10:30:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF3714B657;
	Mon, 18 Jul 2022 08:29:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D2911B9F8
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 08:29:54 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id a5so15906310wrx.12
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 01:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Pvrgndmmn8YktJ8T281XpjP9LliHnMlSYEnEf1KWrn8=;
 b=w/VI4XpE1c0gfAglNbNRXAhqPaRGANN0H3VlIihlDxCg0AFssRZyH9JH2CMhjh+m16
 r9kx4cxZCwdPZHxM0QdTBdRa5GCRRy41dnLXaFC6kIw9J1f5Ud1bVQRDVEUOu+LjUtdS
 0y0tP5IbD4pC0v7bW4NL3pvVOPG6p3ApdqDU1kFlB76VT7bI00QQ0lrVHyUiX7XOGp7o
 j1sVgLaVztKSzwMJSZyw6MYGaI14FICoLPBg+neREy/8xVc3QW7pyhn80waPTWnR9x2t
 9XNnDuiZm3q7jQ/GPmcSMQk6KrtZeHHA+RqZ7x6QBYgKE/kYnQPnRe2srklOqQJOWrb7
 icHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Pvrgndmmn8YktJ8T281XpjP9LliHnMlSYEnEf1KWrn8=;
 b=wIbelbzL0LQS3sP4LvazoAeDgSrletE1F72776R1YLVYIapIXUSSW7wdQtM+wAA+4P
 OcAKW1un6ADc2lYpEancHOqxSonbI+yTyQ2QVVRZzctevjHL1Kos0laCl/tm3GSQEH4R
 6Pd33zd8QvQOljr+Lssb1kc5X6FWV/rDPmuDLn/SzSFr82kMViOmSZrn+wkIt9mgwM6L
 OxEKsWGU1cYzjGrLNxhVzb+ty3UYTtGdsS4iOwhUdLc0+3bB1Fw3v7BRXcg4Xj1hvKzi
 tQC+oCt+meT8TIdMFxg5iwYTstENjIkSt+ex4943pVjJp+t/ilczCypQfEnArag819XU
 APtg==
X-Gm-Message-State: AJIora9dmZ5UJk3XXyZCokLdxX0jfIqBtwFx6MCl2voEs3nKpfF5WCxQ
 cgG5RFBFi7jQEJr2BbWz2sPdJA==
X-Google-Smtp-Source: AGRyM1veFFWv0Q5z9BYX2jyf571R7JB8ReLTZNwWeeEEwHqF1qW4UQ6d0Kq8k4zFKqezBHF1hXY/XQ==
X-Received: by 2002:a5d:64a3:0:b0:21d:adaa:ce4c with SMTP id
 m3-20020a5d64a3000000b0021dadaace4cmr21808418wrp.161.1658132992989; 
 Mon, 18 Jul 2022 01:29:52 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88]) by smtp.gmail.com with ESMTPSA id
 n30-20020a05600c3b9e00b003a2ed2a40e4sm17076668wms.17.2022.07.18.01.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 01:29:52 -0700 (PDT)
Date: Mon, 18 Jul 2022 09:29:50 +0100
From: Lee Jones <lee.jones@linaro.org>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>
Subject: Re: [PATCH RESEND v6] backlight: lp855x: Switch to atomic PWM API
Message-ID: <YtUZ/ojZjcPlzTHi@google.com>
References: <20220714215334.78226-1-mairacanal@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220714215334.78226-1-mairacanal@riseup.net>
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
Cc: linux-pwm@vger.kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 14 Jul 2022, Maíra Canal wrote:

> Remove legacy PWM interface (pwm_config, pwm_enable, pwm_disable) and
> replace it for the atomic PWM API.
> 
> Reviewed-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Maíra Canal <mairacanal@riseup.net>

Nit: This should be chronological.

> ---
> V1 -> V2: Initialize variable and simplify conditional loop
> V2 -> V3: Fix assignment of NULL variable
> V3 -> V4: Replace division for pwm_set_relative_duty_cycle
> V4 -> V5: Fix overwrite of state.period
> V5 -> V6: Fix duty cycle rounding and set period outside conditional loop
> ---
>  drivers/video/backlight/lp855x_bl.c | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
