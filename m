Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CD621858A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 13:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D1B06E226;
	Wed,  8 Jul 2020 11:07:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19186E226
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 11:07:20 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 22so2481211wmg.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jul 2020 04:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=D3AIqKAC7WmKPj2+3TyOKcuKXPxkDzQZQxQTNoRIip4=;
 b=Zsmq3p2O8CDTh2JBxYietiIf1X/JeoMYQfrO8bH/zhTk2c6c0q87B7jTQ9BJQ1SNMa
 z4QbljZQhml4oeQzeuCYz7DDkaBgRHTYXOZOQcnUGFUzi+c9I+tz3DMV3/UAzF7uJs32
 oI9Z4p8B0OX0UNk57Q0KPuXBcV49Ric7fC7RsA7rre4Huj7nMxAruJLkHmKPLaPADxFn
 pT26/T2ODexcvcgUhBmfQCqlPuewJtjJzsGhkrwfUFitEL9qVoh5ZnkkzL/u8VoOs2gu
 VlB/+zk/v0XCrbtzHBYOkBMtRTITtKml9qbjyF92TO0TGXdjvEe6ati1M8uda8lm+YkP
 iq2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=D3AIqKAC7WmKPj2+3TyOKcuKXPxkDzQZQxQTNoRIip4=;
 b=rskzwZoxF/UWIu1FtvQppPDKUXfb1JiJdub28N89xkFT6MqghQMpTFLjOUzEYUgwz8
 engPz8Mc8RyFqs7xRaQAfMfFIAoB8axpXwgRN4JPjo9Hym3SiNuKMrfUczYpBFZHr3TF
 i+6lmXrsKRR7f7w4yx/5dWWT3tTwkmayQ1WiQaOenUnQp5Sh/vLCkwfuJkFDT5AD0bLH
 hLXLRelUZzAwPpgwE4eeuNMrWdm02R79pnB2N9O9MXrorrSa0e0ePASbylN7dpqGdzau
 gvPz0kttpKQQRASI64o9w5hElScRp+JlmRDqtS5FHC2zufIs/7kpxX/ql89wRRg5dmu4
 R1Dg==
X-Gm-Message-State: AOAM533/A3fyUlD0Y26Gda5OO2r54JWkATKlOzqxtTu/9CxxdoDriEOv
 u4qKhd1jnQmjlLbNpyDuqyAowg==
X-Google-Smtp-Source: ABdhPJyzUcSnzwndQ5uj4ZqTICfcftsD4XVNdp7Zn+6g19c8oHbGDWXjBfPfdP19gVRbBXXRQl119A==
X-Received: by 2002:a7b:cf18:: with SMTP id l24mr8670972wmg.116.1594206439431; 
 Wed, 08 Jul 2020 04:07:19 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id 22sm6045568wmb.11.2020.07.08.04.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2020 04:07:18 -0700 (PDT)
Date: Wed, 8 Jul 2020 12:07:16 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v4 15/20] backlight: gpio_backlight: simplify
 update_status()
Message-ID: <20200708110716.2ujel24lqjcudu5f@holly.lan>
References: <20200703184546.144664-1-sam@ravnborg.org>
 <20200703184546.144664-16-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703184546.144664-16-sam@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-arm-msm@vger.kernel.org,
 Support Opensource <support.opensource@diasemi.com>,
 Jingoo Han <jingoohan1@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Andy Gross <agross@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 patches@opensource.cirrus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 03, 2020 at 08:45:41PM +0200, Sam Ravnborg wrote:
> Introduce the use of backlight_get_brightness() to simplify
> the update_status() operation.
> With the simpler implementation drop the gpio_backlight_get_next_brightness()
> helper as it was now a one-liner.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
