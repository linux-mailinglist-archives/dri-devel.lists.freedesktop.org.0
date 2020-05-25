Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23ADF1E0924
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 10:42:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F9589C9B;
	Mon, 25 May 2020 08:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFACF89C9B
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 08:42:38 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id 82so10095576lfh.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 01:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fufxDxITtQnE6s70Vl4sAmvROZfNgK/lnJ+q52QoA08=;
 b=B4NCIL9eH5VkJg+3BOtXsB/4FvA300STIxScRIIPS4HVgfErSzfBb7j+bUOrdxj8bP
 8KvOprIyUKavWNZiHVVB7BNqECV1CUm2jxENHlrIS5rBTRoytQxzt6v6UGy4y7kEQ51a
 rymSWHXsqX5Ly7N0hxtUmPl0M2QH2KjVQH/2PTmnnnCKbCzBcQz9sqPlJJs70HxVa/UA
 YRqt6ZK/sluabIIsP2rLfJOWRpCetX89d3YyA1DaejdK78CciWO/NA0abs61968wwdst
 XzafG+S/tVSMcZWx37PpTjM+8XlWGHD54l58JaY91vRq0pjKTrMLgo+5TX828LU+6rnm
 sNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fufxDxITtQnE6s70Vl4sAmvROZfNgK/lnJ+q52QoA08=;
 b=JxWtQJHNhr9j403CROFlQsX0DwPZRmh8FaJmgYtk1YBf8EOu6n7opJ9f0fRd/fbEhD
 murk9+p+U/q1KChjjiR9nXNZ74Z3j5pyu/LjP723Sn4HENMApwP0TVa6U+Qrq5uqylNs
 aGemolX2tddeQvKdFlCYb3NnHZubkXgKl/qMq8HRDiehNsjudenjOpsGXfOWpWnc+Wr/
 GQw1JM0kEm6fyyE1HRR6qh5bnVNc58SeI/lnPY58mMmmvcFGASnX+lnXyfzq4CPvdx+r
 5IVY5BwqlWefwrPjrM5aKMA2jKkLkvhfl1teuCd1uos4OB3xm4C8CSYm8G5UKPm7zxGx
 VhHg==
X-Gm-Message-State: AOAM532toS4adhRSKkLhTbAiMuQAB7MEMt6oFDNusEWzN8FrxBHa2xBq
 fLcwW5PKUS4w3Tlgt3gTC+Jn/MUXhRu47/WfadTdoQ==
X-Google-Smtp-Source: ABdhPJzsphYazIbu7mz6UJN+2f7Cmj8mlM7rqS2oT8+3v5YRHwjakHAMdNfDoBlqNzR4RXRuZLynv8GOpP/54ZD+Bjw=
X-Received: by 2002:ac2:414c:: with SMTP id c12mr13977881lfi.47.1590396157054; 
 Mon, 25 May 2020 01:42:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200517190139.740249-1-sam@ravnborg.org>
 <20200517190139.740249-2-sam@ravnborg.org>
 <CACRpkdbogVA=12Xzh6jC0AaE7DrH8Z7iVuG3s_gS4MQBYF61Dw@mail.gmail.com>
 <20200518101609.GA759699@ravnborg.org>
In-Reply-To: <20200518101609.GA759699@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 25 May 2020 10:42:26 +0200
Message-ID: <CACRpkdY=ROLjHb70=tckOPUDBoinT4XtcUvZSaNxND7HZD5H+g@mail.gmail.com>
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

On Mon, May 18, 2020 at 12:16 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> Hi Linus.
>
> On Mon, May 18, 2020 at 10:10:12AM +0200, Linus Walleij wrote:
> > On Sun, May 17, 2020 at 9:01 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > > Look up backlight device using devm_of_find_backlight().
> > > This simplifies the code and prevents us from hardcoding
> > > the node name in the driver.
> > >
> > > v2:
> > >   - Added Cc: Peter Ujfalusi
> > >
> > > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Russell King <linux@armlinux.org.uk>
> > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > > Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > Cc: Jani Nikula <jani.nikula@intel.com>
> > > Cc: Douglas Anderson <dianders@chromium.org>
> >
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Thanks. I went ahead and applied this now, so we could kill
> the last user of of_find_backlight_by_node().
>
> I hope we can make of_find_backlight_by_node() static after the merge window
> so no new users appears.

For this driver (drivers/video/fbdev/amba-clcd.c) there are zero
users after the merge window (all users moved over to DRM) so
I plan to retire it completely.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
