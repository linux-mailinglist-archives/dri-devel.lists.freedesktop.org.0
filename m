Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 365E82307D1
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 12:40:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A3B96E25A;
	Tue, 28 Jul 2020 10:39:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A4C6E25A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 10:39:58 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id a14so17805653wra.5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 03:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+fu6+ncNlNVIIhV52Pfsl1d0V+5R59UwNZjOPfJC9HM=;
 b=XQQ7EDR7HuZMZJD3WjJJq7nWRd8Z2P7j9S9A0T2jqccFCWRLfpLO9Jz8Hy5yWwQaG8
 tjE9TaD2veaP8JDdULyGLtJa65N/TH5JH+v2UHtNzpk6ZvuzWfi85HwCnoFbr8LTTWdp
 tf2cwFRT/pNC2r0cw85SJAeOEhgir+QswQ9ZJO7dWOiwlzzY9IHOwSe1ANodg8laYiGM
 hCoF8UY+ZieRs6JRtRLKoHMgbYfQTXgpub+Yf2tjFMD7fV9CLAI9qdRfJLCa8b6ELNxK
 PgqJRuCC2svrJQ6VNuCS9o7I73NPLNOVV66k5Zmc4KkESD8Q0VT/AkuwJTXqr6GlMxm2
 5UZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+fu6+ncNlNVIIhV52Pfsl1d0V+5R59UwNZjOPfJC9HM=;
 b=tR/rkMRgHyYdeNoRkQEUuxnULNwWXemMGPk5Isk0EVtV9F3ZZjqEucW4rQLmKMSIRn
 6YVp1p4zR0149QxtuF3EIneGwXH+Wd7rAuX4eLPq67VmHaNV72befecAlWb+Lgj+pzU4
 gyuyRMHXWUrbxHprek0JpdZ6tDClxj/oERR9yKBWBW/UjQ7Tx9O0cTxobgmakDVlL6n8
 sXHKSweB/cpFG9ETJ1hRR7PAU43ikWIxllGq8EqhhI5zLeQNaUDuCpLJoTCQoMTEAijN
 SbFSDM8kYM6YBFcgfI9Zs70PHr6mnQEtbXo6Z5lKOXD9fzkoPldo+AB8Whe2ljNUKUWt
 i7BQ==
X-Gm-Message-State: AOAM530LN4+wX4CK/W0m8fAATO55bBac/YRpK9UjOsqnBbCradPFGEAq
 mbAIf6sV9zfYwIPeILteTt2B+Y14Yz/e8PLtQCpbEw==
X-Google-Smtp-Source: ABdhPJxqveEDF4fD91lIqGjwCXyF+JMIVkyBTc5jthXBrwneUZa2nBo6cUOArXkF5aA9PkKZHsCP0GVYEkw63kCXusk=
X-Received: by 2002:adf:fe50:: with SMTP id m16mr6982944wrs.27.1595932797360; 
 Tue, 28 Jul 2020 03:39:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <35c955e88914f4d22f5bfba5b060489850b764ba.1594230107.git-series.maxime@cerno.tech>
In-Reply-To: <35c955e88914f4d22f5bfba5b060489850b764ba.1594230107.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Jul 2020 11:39:39 +0100
Message-ID: <CAPY8ntCgtnSbiaDuY=k+-VXgYb2-A2DeHVN1j=BUw_349MYWbQ@mail.gmail.com>
Subject: Re: [PATCH v4 26/78] drm/vc4: crtc: Remove redundant pixelvalve reset
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Wed, 8 Jul 2020 at 18:43, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Since we moved the pixelvalve configuration to atomic_enable, we're now
> first calling the function that resets the pixelvalve and then the one that
> configures it.
>
> However, the first thing the latter is doing is calling the reset function,
> meaning that we reset twice our pixelvalve. Let's remove the first call.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_crtc.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> index 2eda2e6429ec..2c5ff45dc315 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -427,7 +427,6 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
>
>         require_hvs_enabled(dev);
>
> -       vc4_crtc_pixelvalve_reset(crtc);
>         vc4_crtc_config_pv(crtc);
>
>         CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) | PV_CONTROL_EN);
> --
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
