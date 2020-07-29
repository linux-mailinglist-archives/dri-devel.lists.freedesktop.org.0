Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF821231FF2
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 16:09:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 144C06E52C;
	Wed, 29 Jul 2020 14:09:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666656E52C
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 14:09:38 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 184so3122744wmb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 07:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5t5DpkkM9FfZvKuPlhDVpBPxywRpdtxeaztDcBlDx4Y=;
 b=fEjcnq4vJQquAdBwoOz/l89X9cOzX01g1ijj/xRZfBFMpu62QB2kZxFalmndleCpMV
 sbUgwYVYL8w78hxFH2mGTCXNBkhrbUWNgHMtxWN2VddpZD+Osy4SrfSWqYWr8bkDhCt1
 uFRTD1I0aoky8JhSEK6Lf0jiISaaoWuInL7qKUdTvGCczzFjUujs6SEItOYKA0lTSrWe
 ZdYMX5KlQJ068pjIozZXX8FNlyNO1sM+OJ9YtYgp0b7LC01awjuwiXJG+kgZcV04J1uG
 XcYyF1BEqEoDtn8MuPs2bon7aRIT3c2vJqWBGTrxWm0Bu4tJcBxRYQQy6PwA7ACUJ2sd
 vTLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5t5DpkkM9FfZvKuPlhDVpBPxywRpdtxeaztDcBlDx4Y=;
 b=Nysn3g0DxjzGcVYLjgQHb0ODsIK8A2NPm8nQ7yYZy3fcILMAYl7tLFr3xBXTmR/kUx
 sBwbvx/xOrxZQByv6RFh8qG3sFjlWVPcvrqzFBAIoLAW8vUlrFmkWAEvZOKc6zB7+/rL
 5bDJo/0zqssA9jRBgaKpEhg1bs1SwmwiE8w1okb4xMVYMAqBNCZj03b4Qh5K+mN3qUVW
 h3/dtQC0KZFjeNT51xK7SKA0nQE/pFA7B7jWCrHZqiBxZmaOeWDk+oSlIJrdKY24udKn
 4+zt0w20TjWzEYOHDoZ/kAb4DM4efdBCobNQumpgyXKZgEXstRWRjyWYGaL6GWDI8eeu
 3OwQ==
X-Gm-Message-State: AOAM5326xderWbOdQXgt4EIpwrYeKFZPgmjN4hU5ssXhNCsXZ54XFsPk
 urxyPsZ+8W9zPPDB1AtPhy3cKTKQPzJ9SjNa1BHSxg==
X-Google-Smtp-Source: ABdhPJwML2HLeKzyxrFF+2eyXRCw+6uwISHpNJJ9ngzcYnDb3HpcH9lWvSA2mgwpe3fjqqayKr8IeuRxi7/Mg0IgVuI=
X-Received: by 2002:a7b:cf08:: with SMTP id l8mr1521918wmg.183.1596031776995; 
 Wed, 29 Jul 2020 07:09:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <a1f22aadc60a2f32022831a6348c8bbd6e1954c3.1594230107.git-series.maxime@cerno.tech>
In-Reply-To: <a1f22aadc60a2f32022831a6348c8bbd6e1954c3.1594230107.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 29 Jul 2020 15:09:21 +0100
Message-ID: <CAPY8ntBLWrfagZ5-kQz+5Mkw4_KaaTP63_L3D4owJAfA5kFpzw@mail.gmail.com>
Subject: Re: [PATCH v4 29/78] drm/vc4: crtc: Add a delay after disabling the
 PixelValve output
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
> In order to avoid pixels getting stuck in the (unflushable) FIFO between
> the HVS and the PV, we need to add some delay after disabling the PV output
> and before disabling the HDMI controller. 20ms seems to be good enough so
> let's use that.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_crtc.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> index d0b326e1df0a..7b178d67187f 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -403,6 +403,8 @@ static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
>         ret = wait_for(!(CRTC_READ(PV_V_CONTROL) & PV_VCONTROL_VIDEN), 1);
>         WARN_ONCE(ret, "Timeout waiting for !PV_VCONTROL_VIDEN\n");
>
> +       mdelay(20);

mdelay for 20ms seems a touch unfriendly as it's a busy wait. Can we
not msleep instead?

  Dave

> +
>         if (vc4_encoder->post_crtc_disable)
>                 vc4_encoder->post_crtc_disable(encoder);
>
> --
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
