Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DB923090E
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 13:42:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D1DF6E287;
	Tue, 28 Jul 2020 11:42:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0226E287
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 11:42:16 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id k20so10201732wmi.5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 04:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TT24vZnC4xOCdUpOmIAerDESvJeTmO8+8fod85enhmw=;
 b=df7cZt6I8hQuIl1XU7ttHu4TN5PR1P69UXn6jcfq0mJeliTervs8ge8M8D2wbyi4+u
 f3u21AIP4rNKufXo9ROZqH8Lj8kVdEnlNLO8ve9kHB6JBq1uwujo0fUL4um3GqE/sYUQ
 8NvDtgJwDEbbFZcceKLKEQA2bGi3QvT2WZYzU0t+Tzj4hFnYG5NFCt+w4hi8zqMccP5D
 CQln4XVfU+gkL44eP7GRwnvZmGGhz/E2HJTucxx4+1Y7sE0U9C8HJ/9KJV7DeRNQz10m
 XBb0/rgDKA+nA7fNo4M7DnBaWbBEooj+JLGxEuLc6cEyTFwvp89apJctgBuPRR85vBdP
 VcZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TT24vZnC4xOCdUpOmIAerDESvJeTmO8+8fod85enhmw=;
 b=OHNJ3If6soF+nmPM60mS//AXIlgVBmuyjj6pwcKT5SjFC2KGatN7lZYm94dcprkh6E
 80bzAqDUgXr4dYnD+K8SNaFMm+gZl5WCdCBR3dp1DS0NVeweoxWxOL2ttmGmCfwuH5kt
 L33Ikcc+iJX8SnZ/1IjETp3Chh+SbdDDeJYh94i5Vhi3XJd25XdESiLHrX1lxxrfz1z4
 v8fG/jARqX+bIsYEphIRSrv+ig+jqDSfTmoXF+i2XhJL07uY3ihSa7SLs6duRw2fOZmd
 cq+0RjxFwmIG8or5JvpK1ytjRn42Q1rgPrI/r19pS6E4ZyzzmRBKcK3kal80BUt1Qr/U
 B2Zg==
X-Gm-Message-State: AOAM532bWDpspRJ5i6pszXSZeM9nLy7jPerBLD3e2MXthgvav51ez7f+
 O6bbU1zISYo1ADG48Ext+9d+QeihAx6oZbJqXT/PSQ==
X-Google-Smtp-Source: ABdhPJz8AUHazoZwcaZZ9jNUzaMz3ho5hqMfyeOSaPMimnzYiaStb9+h5tEC/aggQScQWwU+fwuhtNmhcjK0dfIEvn0=
X-Received: by 2002:a1c:1d52:: with SMTP id d79mr1167435wmd.82.1595936535673; 
 Tue, 28 Jul 2020 04:42:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <596dac201108233446694a1014726c51843172c5.1594230107.git-series.maxime@cerno.tech>
In-Reply-To: <596dac201108233446694a1014726c51843172c5.1594230107.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Jul 2020 12:41:56 +0100
Message-ID: <CAPY8ntDK76+3PR8kbi8gzb8n4zryDhZvhwKyGsdPb_J3Uf-ASQ@mail.gmail.com>
Subject: Re: [PATCH v4 31/78] drm/vc4: crtc: Clear the PixelValve FIFO during
 configuration
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
> Even though it's not really clear why we need to flush the PV FIFO during
> the configuration even though we started by flushing it, experience shows
> that without it we get a stale pixel stuck in the FIFO between the HVS and
> the PV.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> index 13fe0e370fb3..25a77cd46b28 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -358,7 +358,7 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc)
>         if (is_dsi)
>                 CRTC_WRITE(PV_HACT_ACT, mode->hdisplay * pixel_rep);
>
> -       CRTC_WRITE(PV_CONTROL,
> +       CRTC_WRITE(PV_CONTROL, PV_CONTROL_FIFO_CLR |
>                    vc4_crtc_get_fifo_full_level_bits(vc4_crtc, format) |
>                    VC4_SET_FIELD(format, PV_CONTROL_FORMAT) |
>                    VC4_SET_FIELD(pixel_rep - 1, PV_CONTROL_PIXEL_REP) |
> --
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
