Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2CC38B4A9
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 18:54:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9722A6E416;
	Thu, 20 May 2021 16:54:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51B176E416
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 16:54:13 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id q5so18377713wrs.4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 09:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o7pBWJzNKsDVSAi0Kda9nVTcz1QRPwNqhV8cq3eyftA=;
 b=OJpCCVZ/L/pcOIRGd2BvgxdCB+r8SNq/NM0TjSTdRqq/BRuLbTialPysWVcRztaQzV
 o1zkqS/OZk0QRTfaMMcdUZr9qBWRpZvpa/GKZ882fkoQbV2J3w5sM/fC1Kg8SjijfaEM
 bOqLPXxBcRL724S4rgpz7Q2HbqHx/0FKvodUlVfMs3n8bWvGbs/pw9LxrhY7bifK1+8M
 9s2hzs3mXjVGtfD2JlUQfexustocAqoOJYAFLPLXQZvceJjeK2sLw/XxYFnGpAA3K4WI
 kdKJEfFZEx+do6zfnGJiiWvlB9Hy8q+UtDjKDM5whB9ooSiBFrFPq4ShLjTPhSpma6xv
 TtXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o7pBWJzNKsDVSAi0Kda9nVTcz1QRPwNqhV8cq3eyftA=;
 b=Ak8RLfMzTFoBEsRbIdY1xgVxY3MeZLmeT+oDRavKhV5R6qY9ffnZxOh3QgSS+XoyJm
 Z8/jVw537m7IUi8oZyUso8piGiQ2SJxVqu77cZAP/dvvAwmZZLum0HM/8bM8iRF+ztlw
 jg6VZ9cuej/raiLwCrG7d9F8BNBwOj7qhmHXZ7t3ib8SGBZmN6PnVCt8PJG+D9gR9jD/
 zaVNkdpd2NbixsAZRkdOSff2uUjWvgGn1eOKxrYjslHBWYDLMaY4JZfQI2k3/tjW8Efr
 5W9Ep8azFLthgSCu9w9yxcIwFbWA1d4Et7QFOs8CiCC9NXXU1ItCnqdxIHpFRZYDfxM7
 8MzA==
X-Gm-Message-State: AOAM532jdqqLw1PdgsI6e0ZHDVYCFyhZaKC1uB2gPJdrhldy7KzEn5jG
 rh1vYaW1NWW/6nwVeSp0D7WJOjwfggmaSeBDvvaqAg==
X-Google-Smtp-Source: ABdhPJyLmgaoTM51t95U44bzxtlVZkq59RCk4epIylEp1iw8ZiHJkO7dVBh7RRx7zg0Gfa8eC6I9NzZU0pfgj/GrTrs=
X-Received: by 2002:a5d:6248:: with SMTP id m8mr5314867wrv.42.1621529652057;
 Thu, 20 May 2021 09:54:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210520150344.273900-1-maxime@cerno.tech>
In-Reply-To: <20210520150344.273900-1-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 20 May 2021 17:53:56 +0100
Message-ID: <CAPY8ntD8NHLU6xX+hU9n5LgoJM8_N+pvabmCpOw6AQrH_peN5g@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm/vc4: Add support for the BCM2711 VEC
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>, David Airlie <airlied@linux.ie>,
 Ray Jui <rjui@broadcom.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Thu, 20 May 2021 at 16:03, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> The composite output in the BCM2711 is dealt using the VEC. While the earlier
> SoCs were properly supported, it wasn't functional on the BCM2711. Add the
> needed support from the RPi downstream kernel.

Thanks for upstreaming these.
As far as I'm concerned they're all good, but DT bindings aren't an
area of expertise for me.

Patches 1&3:
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Patches 2&4:
Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

This is going to need firmware from 23rd March 2021 or later in order
to ensure that the VEC can use an integer divider from the PLL. PLLC
was rejigged to run at 2592MHz so that /24 gives the VEC the 108MHz
clock it requires. (Before that it needed a special config.txt option
to set the PLLs appropriately).

 Dave

> Maxime
>
> Mateusz Kwiatkowski (4):
>   drm/vc4: Fix clock source for VEC PixelValve on BCM2711
>   dt-bindings: display: bcm2835-vec: Add BCM2711 compatible
>   drm/vc4: Separate VEC compatible variants
>   ARM: boot: dts: bcm2711: Add BCM2711 VEC compatible
>
>  .../bindings/display/brcm,bcm2835-vec.yaml    |  4 ++-
>  arch/arm/boot/dts/bcm2711.dtsi                |  1 +
>  drivers/gpu/drm/vc4/vc4_crtc.c                |  2 +-
>  drivers/gpu/drm/vc4/vc4_vec.c                 | 27 +++++++++++++++----
>  4 files changed, 27 insertions(+), 7 deletions(-)
>
> --
> 2.31.1
>
