Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D906057FBD5
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 10:55:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C322710FA7A;
	Mon, 25 Jul 2022 08:55:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E352711A3A9
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 08:55:37 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id c12so5619072ede.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 01:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3INTKFVzGpgdLiO6cm/tt/F3n1FdE/J8Gtrvuuomg/U=;
 b=KGUkTvmsrFj/i/g2Txcus2neVCIeH7fS7RYDzgarpCQjAlV25rYmvRqFk4rEW2Xu6H
 dVkCJgHWlrXopXOfsXa7jLI7QUV58LjpMPEGgOlQAaOnihMKMqUORjOGJ0SyGVX6oPmr
 AMrcGRzTVPctXdbs6Q2EfqiY6PKD5GpzJSWGECpaDGigxvdYX+uHjA92klNsnuWiXkR8
 KK3MgVH2qSoijeYpB69tibPEs3jLzlYrbqnbLehlkcag6TPz7QYuNOe0ls9ksOj0BiPk
 SOG0zIupDCmFrghFibZg1nOn4XrHoUYCdTW2Pwb7i2+PJ+hXVio5/EJxBh6mFV3wBtpH
 A4FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3INTKFVzGpgdLiO6cm/tt/F3n1FdE/J8Gtrvuuomg/U=;
 b=pDgrCtHNka9JMGjLdBPOk0adkIQw/gEN813xLCDXsajx07ZwdFEMEdY7FKoKocMaZa
 ILdShHLf57b64z5bhg3tI33y9yB9z/EAh4KhkTiaucBDaZ+gHuJSDUI/7JL60s8YnYL8
 We7tUrMlKSNWsuddxQBsjFTcWF05UiQx1yZ4KZ++mzCp6uw+0V6ZVO/kefjo6prsuyyW
 GqSK7SWbzCpo5DDns+hfaghUWNru6/IPXZkhjzGiwghYDziBYtFfDHlVCWl9xpVxAKNA
 1yOv+T74KCIDPXpeLl/1tZifxIhzTyjgrQfbZlWnby4WhakkleltYM+TlRS7tqaGljgm
 qaZg==
X-Gm-Message-State: AJIora+5ELOynFkSrdUp7vz/mDkakPJmdBlKwrgMYY3gXGgStdzeLHZ0
 /uPqQST4d9iugwD91looxujywprDZs38ALbgcl0=
X-Google-Smtp-Source: AGRyM1v8y+nmZhsplbXoHzO4Ve+2H3JYkbB6esC4VwvluxmYvgNwKHcXWiOtO8fBnhCqb3I9/pY7SCo8PriYmFxn6lE=
X-Received: by 2002:a05:6402:34c5:b0:43a:8f90:e643 with SMTP id
 w5-20020a05640234c500b0043a8f90e643mr11947835edc.88.1658739336148; Mon, 25
 Jul 2022 01:55:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
 <20220722102407.2205-13-peterwu.pub@gmail.com>
In-Reply-To: <20220722102407.2205-13-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 25 Jul 2022 10:55:00 +0200
Message-ID: <CAHp75VfgiK87VwWu2bTJ_mR0=g0sa0LPJ+H16OGcUdARmzFRSA@mail.gmail.com>
Subject: Re: [PATCH v6 12/13] leds: flash: mt6370: Add MediaTek MT6370
 flashlight support
To: ChiaEn Wu <peterwu.pub@gmail.com>
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
Cc: "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, "Krogerus,
 Heikki" <heikki.krogerus@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alice Chen <alice_chen@richtek.com>, linux-iio <linux-iio@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, cy_huang <cy_huang@richtek.com>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Helge Deller <deller@gmx.de>,
 Rob Herring <robh+dt@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree <devicetree@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, szuni chen <szunichen@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Jingoo Han <jingoohan1@gmail.com>, USB <linux-usb@vger.kernel.org>,
 Sebastian Reichel <sre@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ChiaEn Wu <chiaen_wu@richtek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 22, 2022 at 12:25 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:

Forgot to add a couple of things...

...

> +#define MT6370_ITORCH_MIN_UA           25000
> +#define MT6370_ITORCH_STEP_UA          12500
> +#define MT6370_ITORCH_MAX_UA           400000
> +#define MT6370_ITORCH_DOUBLE_MAX_UA    800000
> +#define MT6370_ISTRB_MIN_UA            50000
> +#define MT6370_ISTRB_STEP_UA           12500
> +#define MT6370_ISTRB_MAX_UA            1500000
> +#define MT6370_ISTRB_DOUBLE_MAX_UA     3000000

Perhaps _uA would be better and consistent across your series
regarding current units.

...

> +       /*
> +        * For the flash to turn on/off, need to wait HW ramping up/down time

we need

> +        * 5ms/500us to prevent the unexpected problem.
> +        */
> +       if (!prev && curr)
> +               usleep_range(5000, 6000);
> +       else if (prev && !curr)
> +               udelay(500);

This still remains unanswered, why in the first place we allow
switching, and a busy loop in the other place?

-- 
With Best Regards,
Andy Shevchenko
