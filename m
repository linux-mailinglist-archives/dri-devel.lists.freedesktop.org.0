Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EBA1D728C
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 10:10:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E04C6E172;
	Mon, 18 May 2020 08:10:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 862566E172
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 08:10:25 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id z18so596833lji.12
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 01:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=em2U7B8TyUf30bEUcMzbKLuDgDBEeuKa70ZTt7cbEvc=;
 b=m1FCdPoToBswJghU2vv7XgNi/QYDpr6H1HoZ8l66YdZB6QB8h78vyCPO/e0/UGxjP6
 ZZ9EIgnMMJomAK4cszeOzFycO84gRnDipsqV03FiSgCmau5uUwee47aNVA7b3+VPi4ki
 Bgb2OQym51ongcbux98NBFutl7ayLusleUKtnyW0cJzZCeitLERQVbEOKXlyCpR3mIcf
 YhEPxn98P/gy/dhY47yCDz99uDc6z9IZswOJ99IUoNYcs33mWpgKi6C9dh932hxLWt22
 kO1po+jMFgfWYzMjO/iN1RAqobkw+LnxY7Q/1aaThEIvvI83HggVrqEHhquOQwfpTPH7
 GDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=em2U7B8TyUf30bEUcMzbKLuDgDBEeuKa70ZTt7cbEvc=;
 b=r3+1ghTH/LOJNgqvRz3LwkNU10ajWTpnXhyEd/JWefBPFfm4Hp4QHp1IO9f+m3sUCk
 b2EtQQOy4kGS9E6LqAO/6st01N9AkhkeexR2Rh/30jmSHDWSbyxnUaAoKe52iaKSLkFL
 OMXNWM+9Uh+nMJ1K1GGowFD8sPeAhAUmbYx60Ri0VGxuuiykZYyVoBLw40hN8RCwcgMi
 8aCLdgVuC8IrXdBFnR295svnXyiHJFwenudtTxjUYIXDH61S2gC745/Jw/mT9xcvlxmv
 kpjXxvjnAL6OVmIcXNejgxRuwFY8TmE6zrN6ee6K3kMgmrIlJ1ZtcCqLcL9phwraH/Vj
 VQCw==
X-Gm-Message-State: AOAM532yvTyZcUxCu2zdCbERKlZfx72JwCejeFyyLfELbs4p54VtGdPX
 KLYLy1GKVupdoivTpGLB1xgB6ZQ1IH8lyam931BoKw==
X-Google-Smtp-Source: ABdhPJzmyKywKnrt+mhTCQKuNKDH+mnRR3odpUAZzgZQXdX7WCuZf65U7KFkVSK7USoDQJabCtlLvrEg8KE48wcD13A=
X-Received: by 2002:a2e:980d:: with SMTP id a13mr9750278ljj.277.1589789423940; 
 Mon, 18 May 2020 01:10:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200517190139.740249-1-sam@ravnborg.org>
 <20200517190139.740249-2-sam@ravnborg.org>
In-Reply-To: <20200517190139.740249-2-sam@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 May 2020 10:10:12 +0200
Message-ID: <CACRpkdbogVA=12Xzh6jC0AaE7DrH8Z7iVuG3s_gS4MQBYF61Dw@mail.gmail.com>
Subject: Re: [PATCH v2 01/16] video: amba-clcd: use devm_of_find_backlight
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Russell King <linux@armlinux.org.uk>,
 Andy Gross <agross@kernel.org>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, MSM <linux-arm-msm@vger.kernel.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Jingoo Han <jingoohan1@gmail.com>, Douglas Anderson <dianders@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, patches@opensource.cirrus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 17, 2020 at 9:01 PM Sam Ravnborg <sam@ravnborg.org> wrote:

> Look up backlight device using devm_of_find_backlight().
> This simplifies the code and prevents us from hardcoding
> the node name in the driver.
>
> v2:
>   - Added Cc: Peter Ujfalusi
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Douglas Anderson <dianders@chromium.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
