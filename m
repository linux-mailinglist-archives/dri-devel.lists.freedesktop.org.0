Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 905A02A973A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 14:45:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E38BA6E0D6;
	Fri,  6 Nov 2020 13:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567C26E0D6
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 13:45:12 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id 184so1998750lfd.6
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 05:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tFaaHkEZDXkZw7mcXitvww1WQi+lH9aVg20pXq1ppCQ=;
 b=AzSON4OcTiZTErjvNJ8J0hIanSqC5Az0EoeoKVGuINfoHdHZg5BwdConxyJCa1pKty
 Evwtr2Dh4f6H288yjXruzhm+9dyKcIB2Qi7aPJNC9/wMc3Wg/BniZf75gDvCEgyV83nb
 s2w9/p500HUWRzYnVVFFA2RYyMR0Wb8uk1hKI9aStZSmndNHP/VupUVWpKuWD4r1QYQl
 /wgx+TrVclBVqEvJybXvSYe9Kt/x6uK9Uxh0q+/C/fVByy0jz/ez372HpUOxAQ7HsaHh
 59k5mCm/T8HxQZYyXNmIiLY5fDYHob0qCWWxuC1/kWzvreJSd+TCWhky9TIhri0Ztdjw
 9oyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tFaaHkEZDXkZw7mcXitvww1WQi+lH9aVg20pXq1ppCQ=;
 b=VVg7WjFV8bgFDWKieKE7fRp5KjPXipZ/i5Is2HE9q8gDldNXMXDpOoVpO0/MU2JLLh
 nwmWxOwzZ8g4wL+Pn2AOGlrgD0wImV3NSfriweh0rAy7eq0wmUMrSGpzvcdx708jT8uO
 IZMAyvNEUCSaNJsxC7gl7aY/BLE8cs/in9u0cudnFQmSBJg+ehMilEsegHD7X8TICWLH
 Fjx+xzkbBvxuWrAOAH6g57XsoEoLcOmgVXHXkkXrjXCydvTkuU3lbRIcqWiFbs1cB309
 XAkSgZVZ0OQH0egRpoUIxjGbgXvB9L/HDlqWGcbkVzo8NRgoGhPlpEgXa0G4l6WT3AQG
 Nk6Q==
X-Gm-Message-State: AOAM533NMnWmWt8FNwt5imx+1VV/pN6/SCuuJjm/OKkL/fOUUBiD2NRu
 ZhQ4q0P/z7znaV4p1WeIJEYxB703fJRg4z4Usq0Jsg==
X-Google-Smtp-Source: ABdhPJyWSHxi1tQV8EQby75x5Z0Et6RvcJdIJRQogh9Gp81MCwEMVm+LRT9B9Zs5gzv1i+Uu1O1U6Y8Bz3sWlTsv7Uk=
X-Received: by 2002:a19:f00b:: with SMTP id p11mr885482lfc.585.1604670310747; 
 Fri, 06 Nov 2020 05:45:10 -0800 (PST)
MIME-Version: 1.0
References: <20201030002850.6495-1-linus.walleij@linaro.org>
 <20201101093654.GC1166694@ravnborg.org>
In-Reply-To: <20201101093654.GC1166694@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 6 Nov 2020 14:45:00 +0100
Message-ID: <CACRpkdbdEVj0stJRbUDb3AVdZ0kVJP=z1-=DzB2J3aY+DgfPMg@mail.gmail.com>
Subject: Re: [PATCH] fbdev/sh_mobile: Drop unused include
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 1, 2020 at 10:36 AM Sam Ravnborg <sam@ravnborg.org> wrote:
> On Fri, Oct 30, 2020 at 01:28:50AM +0100, Linus Walleij wrote:
> > The driver includes <linux/gpio.h> but doesn't use any symbols
> > from this file.
> >
> > Cc: Magnus Damm <magnus.damm@gmail.com>
> > Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > Cc: linux-renesas-soc@vger.kernel.org
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
> Thanks, I went ahead and applied this to drm-misc-next.
> And then I remembered you have commit right too :-(

Thanks! It is always better if someone else does it anyways!

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
