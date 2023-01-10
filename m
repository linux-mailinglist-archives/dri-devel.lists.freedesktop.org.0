Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE586645C9
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 17:17:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F1E410E126;
	Tue, 10 Jan 2023 16:17:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB86F10E126
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 16:17:20 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 m26-20020a05600c3b1a00b003d9811fcaafso10470537wms.5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 08:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9aNO7QvYwDQS+jP6UmKWe479dR/ZyNUMn3qprKjVB9I=;
 b=wIFmlQ/NS1cd3Ft15IPF5Qt6fSCo5kzlfVvC6NwxMqnEPLSx7IXbm6E5MlcxsTvI/I
 Q3DoELKpnsXbU4QL74nZ9Ynj8at68VE0sCNfWdGPBA8x+SdIK69ws7qT4RUbGm3Hq6nO
 ClaxsemmRkEjTAeBk8iha6ZGxiRQaNUxknlWjtDxzXrQRHbgppNP8MbHtgvtT/2LuFjB
 X0EOfWRmvFL8tW1L4YnYLcRqPoFrNBn3rNIoCKyqhmP/S+hPSzm2uue7ZlXYUmUi6CVm
 8cbu7Pb00PfpS7NPmVxM4VZA6GtZrVUQLcIiEYcb+a34ixYrcngaFnQXcSfUwEbfsTFI
 6rsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9aNO7QvYwDQS+jP6UmKWe479dR/ZyNUMn3qprKjVB9I=;
 b=NeKQfsqDKkT/6yS/VQJVtk2aBe+QT8GgfF1oWuv23nKxyvAAuGkaApX60VrTwbF3qU
 A1Ie5Bi5sZA8P5hN2CstU4x4P0olvQAFibRkQhSzYaiYQ3PC/1emIw7WhQuL5aWxW8ij
 bDfDOMt3neiHFUDoz0a1DqIyThFpFj10uFRZF+35gNtlFzoelduq1AbaZHDUkIFmgbJ7
 +2k/khbmBPcNNRfWgcClfAAuVMHNbH8j830wINfNah++qhUCv5FuSdGD2Ug391JQEXsn
 4qZfXI2pmiLGynnivZHgD2lkKGTfZ29VPKBIA2EkqJ/KLlFbDHZuKEGYUVCnpyVdLGjI
 YPKQ==
X-Gm-Message-State: AFqh2ko1UYbfZJdy15oUlIL4505BHsdfa5bB6oCFFn5oYACr1rbdLF+t
 fLX66nPkrPD04UmkJAqAmEz7Tw==
X-Google-Smtp-Source: AMrXdXtdHYGAOOA7IWrfaGhGuGxVKglU2btUiZ2nxiwOMk16l4FnFGqCikuGoCHjUCJQ1uEszp15Qg==
X-Received: by 2002:a05:600c:1d03:b0:3d3:4aa6:4fe6 with SMTP id
 l3-20020a05600c1d0300b003d34aa64fe6mr48900851wms.3.1673367439208; 
 Tue, 10 Jan 2023 08:17:19 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 x14-20020a1c7c0e000000b003d9f15efcd5sm6597893wmc.6.2023.01.10.08.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 08:17:18 -0800 (PST)
Date: Tue, 10 Jan 2023 16:17:16 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 1/2] backlight: pwm_bl: configure pwm only once per
 backlight toggle
Message-ID: <Y72PjEh8QuLdw1hw@aspen.lan>
References: <20230109204758.610400-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230109204758.610400-1-u.kleine-koenig@pengutronix.de>
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee@kernel.org>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 09, 2023 at 09:47:57PM +0100, Uwe Kleine-König wrote:
> When the function pwm_backlight_update_status() was called with
> brightness > 0, pwm_get_state() was called twice (once directly and once
> in compute_duty_cycle). Also pwm_apply_state() was called twice (once in
> pwm_backlight_power_on() and once directly).
>
> Optimize this to do both calls only once.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

This will reverse the order in which the regulator is toggled versus the
PWM starting/stopping. It would be nice to that in the description.

However I can't see why it would be a problem (since both remain in the
same place relative to the sleeps) so:
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
