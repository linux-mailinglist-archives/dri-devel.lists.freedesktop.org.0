Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A08AD3C144C
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 15:31:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 501996E233;
	Thu,  8 Jul 2021 13:31:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED2C6E233
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 13:31:15 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id m1so8519180edq.8
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 06:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zbBlMrdzCHr2lmFYFbQ5SL9VUQbtB6r7wdoFOJEg6lA=;
 b=l536WO3E6ytMOoRVLjIKSbUy2kj7dfkrlmAGKmLAXF22od2sLSKcIGRTxNO6g9aGv9
 OeLBoOAZYvGmZPdhUjJ3CkK6NBWDxwF2Nw4QpC1+P2/z/pP9oiiRr/iy2nM2tNoKd/k1
 hbOhwHCjylUcTWHxoFCY3K+K1TVEmbBpHFAJA85hCA/qRC1BE1HxUWRnopSzddh7akzo
 pDzNc3ntpC1gx88R/jKUZPr74y2qmey8MXRKv6Q4HFIWG3lBUNojDyGor2XRqYqgwY/B
 1C7AwfUDhKwMSdcRTFYUg5Q7nB8gjKESOWjBd8KPw3pUr3kM735ZB170BE31PMpk5RyB
 gJUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zbBlMrdzCHr2lmFYFbQ5SL9VUQbtB6r7wdoFOJEg6lA=;
 b=kihhVWJKYp+DI5at+EmqTEz6/SGNjgRFBPwvcVdvfnMaUkhhoNWDUX7dw+vgy5A5lH
 2ywXQ2Y8qn5v29gyBS4VLHaoKNWKfmwSzorYIR2M9tN4eToAFgoqLVuJ+voYOVbSvNaK
 hH6/v8sOyPyw3pnf+EHvCe9cx3MT5T8S93GU9bO1gkSQUiBkgNn1gjEYeHTcv1zyVrcN
 Mp8Ss5diFRhZJir8+qVvLQZHq1YLsdNXVCaeFm+F6RSfdk77E4F6inBFmuP4kseSKxEr
 0/UynFJd9dKoABQ34IFVOGfqaSR4o9HdeZ0jJaGf/e1/q2I1Dg8cEy0AO7jsB/Ep/Wni
 HNNA==
X-Gm-Message-State: AOAM533knuqcJoAzt13BNTwwyoY7K1mZv3RGpciJpC9uWsD7FM6nfxXw
 1RohDldqOtJABqQ9qWiMsF7cxnJ3F04Ns2SftUc=
X-Google-Smtp-Source: ABdhPJwefplt4Ey3YR2GmBxncjju00jiuUjHd6+wuxj6ezWvhyYVTI4u17n9Y3MKyz86FKbNwLEpepyX8ig+kHdUBYc=
X-Received: by 2002:a05:6402:1c06:: with SMTP id
 ck6mr38245289edb.287.1625751073938; 
 Thu, 08 Jul 2021 06:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210706074545.8763-1-tzimmermann@suse.de>
In-Reply-To: <20210706074545.8763-1-tzimmermann@suse.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 8 Jul 2021 15:31:03 +0200
Message-ID: <CAFBinCAio=-Lj=xQJ-EBXnhw1ygyyRv6M0cDZcod5NZO3YqcTQ@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: Convert to Linux IRQ interfaces
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, airlied@linux.ie,
 khilman@baylibre.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Tue, Jul 6, 2021 at 9:45 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
> IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
> don't benefit from using it.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
and also (although I am no drm subsystem expert):
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[...]
> -       ret = drm_irq_install(drm, priv->vsync_irq);
> +       ret = request_irq(priv->vsync_irq, meson_irq, 0, drm->driver->name, drm);
I'd like to use dev_name(dev) instead of drm->driver->name in the
future as that'll make it much easier to identify the corresponding
IRQ in /proc/interrupts for example
your patch makes this possible - thanks for this!


Best regards,
Martin
