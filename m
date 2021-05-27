Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C072C392DB2
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 14:11:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A4B56EEA4;
	Thu, 27 May 2021 12:11:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 320856EEA2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 12:11:00 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id j12so3535251pgh.7
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 05:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oRhOKDNCOPh50Z/aFWDPzmEZC3yRRNIu9ormTXELjPU=;
 b=FAtHvEHXffBJBOCgQsvJa5akS5Nglw9bWWCOVrq4tcCcg56lvMMxOowZje89pRhld5
 /c8grAu+6J5TfmjOPe7da67YYS7LaYbFWgkYRIPqX9O+tqYiFqfZbfMzcM6UxJUOt+zO
 FmIUWqnkMURbc5YamnxktnGwtz/QS0O07i8B3J7PyXQTbNMD9/t23e3UEt/wJ3m7RxWe
 IEoMJmbe/P+BxFd1Ce6vvW3vAQ6OqG2sb9YGAjKykheU6Q+0Q7jSuxQDLzOWCPj+QPeT
 EZpfZF/T5brTa2jKcbHX5vc96olSdqvgBBaHH6X97bStJ84eojoH9IPstHB9lxYkPjqU
 zP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oRhOKDNCOPh50Z/aFWDPzmEZC3yRRNIu9ormTXELjPU=;
 b=hdZTs1TSmijhEFS5SDg7r6I984fJGvPhM0D6ElfeeR37FdqCQgSpyom6HKPLhlYFOg
 nowmLMA9wJ60YiIaTMFqYunKW5/g4cG90ln+trbYt/7tAfHHOVLzBVE1Tm1eihjE9Srw
 4U1H+yOYE70hNbte+YznjGQ75bg0lxaTDBpThbqOU2gFXGKpSrvqXw+hHq4q2VuA15h9
 Yd/FHA0qjvKzE3XnBMEEPcwX0QI03herZLWFfJKzf13R/UvxWcvdm23Zmdel4dgl6IT2
 UUy+l5afigWeI3hdbfkzzhHq7hR1ocW9Uux0OFu3yU+tV+C9ULXCLsMSaYIWuKLroFlE
 Pfxg==
X-Gm-Message-State: AOAM5302qAXbw9q+BhmhEAaA2mdr5gAz/2qD4Vb7WB7UxiuiedUcFjOW
 YsvtsG6ZeiRV8Kp+O8ZdUp0hVUwADdVEMHGTf5W6zw==
X-Google-Smtp-Source: ABdhPJwyrVAU5VpztJZBZHZ+lAWPAAKCkinkA93Nd0vesd87KBbFlG9BIMaHP3lTMMMgQZJDGsQJmZeEH33Mvf9+32w=
X-Received: by 2002:a63:4e01:: with SMTP id c1mr3455280pgb.265.1622117459824; 
 Thu, 27 May 2021 05:10:59 -0700 (PDT)
MIME-Version: 1.0
References: <d107d1840b83607baee8571cc5d88973fc32b519.1622015323.git.geert+renesas@glider.be>
 <d728f168-8e36-44e4-0d9a-a52572ed1c1b@collabora.com>
In-Reply-To: <d728f168-8e36-44e4-0d9a-a52572ed1c1b@collabora.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 27 May 2021 14:10:48 +0200
Message-ID: <CAG3jFyttwK728aXzAVHai2aSWmP2iy6eVwXn8ojOJdPGQ=GSMA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: DRM_CROS_EC_ANX7688 should depend on
 I2C_CROS_EC_TUNNEL
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pushed to drm-misc-next.

On Thu, 27 May 2021 at 13:07, Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> Hi Geert,
>
> Thank you for your patch.
>
> On 26/5/21 9:50, Geert Uytterhoeven wrote:
> > The ChromeOS EC ANX7688 bridge is connected to a ChromeOS Embedded
> > Controller, and is accessed using I2C tunneling through the Embedded
> > Controller.  Hence add a dependency on I2C_CROS_EC_TUNNEL, to prevent
> > asking the user about this driver when configuring a kernel without
> > support for the ChromeOS EC tunnel I2C bus.
> >
> > Fixes: 44602b10d7f2a5f7 ("drm/bridge: Add ChromeOS EC ANX7688 bridge driver support")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>
> > ---
> >  drivers/gpu/drm/bridge/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> > index 7e7f28eb954661e2..c96e4b38d1d34ee6 100644
> > --- a/drivers/gpu/drm/bridge/Kconfig
> > +++ b/drivers/gpu/drm/bridge/Kconfig
> > @@ -53,6 +53,7 @@ config DRM_CHRONTEL_CH7033
> >  config DRM_CROS_EC_ANX7688
> >       tristate "ChromeOS EC ANX7688 bridge"
> >       depends on OF
> > +     depends on I2C_CROS_EC_TUNNEL || COMPILE_TEST
> >       select DRM_KMS_HELPER
> >       select REGMAP_I2C
> >       help
> >
