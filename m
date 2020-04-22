Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC7B1B488B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 17:25:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B43066EA16;
	Wed, 22 Apr 2020 15:25:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EA416EA16
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 15:25:43 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id m8so2767994lji.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 08:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kcC+pbj4ZcfvbHCLZqUFTY0hzVPPKZG0teLtba1dQ4g=;
 b=E2AAI5RpkkNKxi6Kdo3QSl4i9u76CqtAS/il9w4uN0XNf3BZtYgkpj7Hr0PYHYchVA
 HaNeWUiG2uz6gUVpqUoUhRMnbtvxNXypxZ1F7yMYT3SXJbBwMvaxmMIf5cx9LCDHN/KO
 vVTaJthejojxugzarXvDN87O9Sya36OqRxYyUjiYVA49Fwt7+vwJbQO5Z6I8cqwG6MFc
 sKAlJGsRINwJAn3lB0icezjqH2Pz9JBU279E/7VUeXvcgfJsAHtrspsn/NRUKhFq05pR
 RPc+7LOQg2qmeZTCZaYV07gLixHJQslJX01xBFwf4oCLreHvIHg4f/zyxdi6qjSRInD3
 DKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kcC+pbj4ZcfvbHCLZqUFTY0hzVPPKZG0teLtba1dQ4g=;
 b=j0lgdzHDUpKhA8cGHrJN+mennrNsoYnezS5qo9OmPfakx1Sqszhg/wtKqI+eXLmVPA
 pNx3oK2WR/ct6jNm+arXmauJfDqK5YyqO3uI0qUEYBt9nSdU3xunvj2vAh/LgAfF3O7F
 PXwvg95COy8GzChUTNVMKqNGSXz94U+KItyRz17fssus+VxDcimVYS22gfx3y5We+3Gx
 ra1Yuxlpm1qTYiKZoYrjvaVw1MA5y69LrwWpcEVT5XYMNrThgpTw+xqBWcatG3YF1mfo
 MsGleGpNxbMc74AKOOhQkZONdzoHt2u/q9H8b21Ya5T0aGJzxzmWxB3qjEC/lqyY6Az1
 trDw==
X-Gm-Message-State: AGi0PuZSt22cIIhnOyLVx/BdaS/ln19lFbBhGAZ2uBocmZ2FaDBuvFb/
 R7xrykMDmEt6phn+bhS+k5ByOTODUySMx1N4tuVCRg==
X-Google-Smtp-Source: APiQypKP6nTQvKryk4pIL89bVUoyZiSqb5qF0boxlZav5xddJylw/En7b2au24RdQWtP46OYGuZ5g65rs3VOD5+WDWA=
X-Received: by 2002:a05:651c:32e:: with SMTP id
 b14mr16632111ljp.277.1587569141996; 
 Wed, 22 Apr 2020 08:25:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200415122427.111769-1-linus.walleij@linaro.org>
 <20200421221503.GA3445172@ulmo>
In-Reply-To: <20200421221503.GA3445172@ulmo>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 22 Apr 2020 17:25:29 +0200
Message-ID: <CACRpkdZ2OBmejaGwjdpmJpZ0=30W2aoUgXrrX8xkmwps=MX3kQ@mail.gmail.com>
Subject: Re: [PATCH] drm/tegra: Clean up GPIO includes
To: Thierry Reding <thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 22, 2020 at 12:15 AM Thierry Reding
<thierry.reding@gmail.com> wrote:
> On Wed, Apr 15, 2020 at 02:24:27PM +0200, Linus Walleij wrote:
> > The Tegra DRM drivers includes the legacy GPIO headers
> > <linux/gpio.h> and <linux/of_gpio.h> but what it really
> > uses is <linux/gpio/consumer.h> since only gpio_desc
> > structs are ever referenced.
> >
> > Include the right header on the top level tegra/drm.h
> > file and drop all the surplus includes.
> >
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> >  drivers/gpu/drm/tegra/dpaux.c | 2 --
> >  drivers/gpu/drm/tegra/drm.h   | 2 +-
> >  drivers/gpu/drm/tegra/hdmi.c  | 1 -
> >  drivers/gpu/drm/tegra/sor.c   | 1 -
> >  4 files changed, 1 insertion(+), 5 deletions(-)
>
> Applied, thanks.

I think I already applied it to the drm misc tree the other day,
sorry if that wasn't clear. If tegra has a separate tree I suppose
git will figure it all out in the end.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
