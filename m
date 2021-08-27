Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5013F9B03
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 16:42:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA1D86E984;
	Fri, 27 Aug 2021 14:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 661C46E984
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 14:42:14 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id e186so8745246iof.12
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 07:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CFay9r08enlHVx+9WttkR29jMfZFJp3kMsw5xeMb8SU=;
 b=g77ve3sH11s90MOAtL5Fe/Ks6XKzCGmBKkQbxda83Z/dPuLxcu/JrGYVIEGC7qKr1W
 cwUNxwZ3lvZGxv6M9XyvThGVZBMpm49kDpI1FWv42i5aJSI++acThcZA58jzLl2xoBn6
 htbkWP3zcoIC4Rdxf70AifYYqeV6tvd3SvGfMUaLTiK7NdMujJla52Beta0VmMIt+IZK
 6uEzgTIUj4beudDHevA+hsIClHPCcpwi2azaImx9pQXGXKRTqzqCrNY2aSQgR898++Ve
 DuFQJ8yQALsvMU/mHh0iZQ9TBWR/Ee3yKTsIQYDQh8zo9cgdS4XnFHBObrDqV+iHO4Tw
 WZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CFay9r08enlHVx+9WttkR29jMfZFJp3kMsw5xeMb8SU=;
 b=jQRuRLMpYX56lZVwipwhtbV7RK5AcVF3BvdmWtOUlWzRm6ZyUVv1y4321LB5sLmqtr
 5HK7lMGODe5dMGw7t7xJCj1Ya7JiKzBeKvRBfKmHS/tFWiyjiKZSWiTT87Umq3O7lBv+
 fj5ZpVAW7NhPI/dPJiOyDUJ/nAHwubH9V3HOpuniRNvqQ4eCDRwQe1G6ONNC1HOl6Z12
 QbD0iwzDMniYZX5dP1foDCQiPpKx5PjtNjVwK7RdpmFq3iFxAS7NIBCkoCTecSfE91Uw
 IOkTODfit5OZkfZtwiTMstLeSUVTrKoslzmvKSE8yfFRYaUXCHWXEuqSXBApqIviW3no
 G7kQ==
X-Gm-Message-State: AOAM5309Po3EFLOO4kDO6LRZGb/IggaLiShVBDgLuKpSmaMfqhUXrrJ8
 Ymc6P5bh62vyqQrMFCYHhGDqJ7Y9sgFjtYbLCisT3A==
X-Google-Smtp-Source: ABdhPJxKll3v2Sx54NeJRFiI49YcwJQQt0GNvwwK4RRpGNl7i3KMNBhhoIflYvBf/kikTGsbGuJ+Gunmf3z4LT4xVjU=
X-Received: by 2002:a5e:a813:: with SMTP id c19mr7774552ioa.199.1630075333436; 
 Fri, 27 Aug 2021 07:42:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210827082407.101053-1-yangcong5@huaqin.corp-partner.google.com>
 <20210827082407.101053-4-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20210827082407.101053-4-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Fri, 27 Aug 2021 07:42:01 -0700
Message-ID: <CAD=FV=Uo-7rFWGiJG0oJ0ydosA4DxhFqiWGrab1zoZyxyPsOBg@mail.gmail.com>
Subject: Re: [v3 3/4] drm/panel: support for BOE and INX video mode panel
To: yangcong <yangcong5@huaqin.corp-partner.google.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Aug 27, 2021 at 1:24 AM yangcong
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> Add driver for BOE tv110c9m-ll3 and Inx hj110iz-01a panel
> both of those are 10.95" 1200x2000 panel.

Your commit message would be a good place to note design choices you
made in your patch. Maybe you might say:

Support for these two panels fits in nicely with the existing
panel-boe-tv101wum-nl6 driver as suggested by Sam [1]. The main things
we needed to handle were:
a) These panels need slightly longer delays in two places. Since these
new delays aren't much longer, let's just unconditionally increase
them for the driver.
b) One of these two panels doesn't support DSI HS mode so this patch
adds a flag for a panel to disable that.

[1] https://lore.kernel.org/r/YSPAseE6WD8dDRuz@ravnborg.org/

If you send a new version, maybe you could include prose similar to that?

> +       _INIT_DCS_CMD(0x4D, 0x21),
> +       _INIT_DCS_CMD(0x4E, 0x43),
> +       _INIT_DCS_CMD(0x51, 0x12),
> +       _INIT_DCS_CMD(0x52, 0x34),
> +       _INIT_DCS_CMD(0x55, 0x82, 0x02),
> +       _INIT_DCS_CMD(0x56, 0x04),
> +       _INIT_DCS_CMD(0x58, 0x21),
> +       _INIT_DCS_CMD(0x59, 0x30),
> +       _INIT_DCS_CMD(0x5A, 0xBA),      //9A

nit: the "//9A" above seems like it's leftover from something. Remove?

> +       _INIT_DCS_CMD(0x1F, 0xBA),//9A
> +       _INIT_DCS_CMD(0x20, 0xA0),
> +
> +       _INIT_DCS_CMD(0x26, 0xBA),//9A
> +       _INIT_DCS_CMD(0x27, 0xA0),
> +
> +       _INIT_DCS_CMD(0x33, 0xBA),//9A
> +       _INIT_DCS_CMD(0x34, 0xA0),
> +
> +       _INIT_DCS_CMD(0x3F, 0xE0),
> +
> +       _INIT_DCS_CMD(0x40, 0x00),
> +
> +       _INIT_DCS_CMD(0x44, 0x00),
> +       _INIT_DCS_CMD(0x45, 0x40),
> +
> +       _INIT_DCS_CMD(0x48, 0xBA),//9A
> +       _INIT_DCS_CMD(0x49, 0xA0),
> +
> +       _INIT_DCS_CMD(0x5B, 0x00),
> +       _INIT_DCS_CMD(0x5C, 0x00),
> +       _INIT_DCS_CMD(0x5D, 0x00),
> +       _INIT_DCS_CMD(0x5E, 0xD0),
> +
> +       _INIT_DCS_CMD(0x61, 0xBA),//9A
> +       _INIT_DCS_CMD(0x62, 0xA0),

More random //9A to remove above?


> @@ -515,7 +1363,7 @@ static int boe_panel_unprepare(struct drm_panel *panel)
>                 regulator_disable(boe->pp3300);
>         } else {
>                 gpiod_set_value(boe->enable_gpio, 0);
> -               usleep_range(500, 1000);
> +               usleep_range(1000, 2000);
>                 regulator_disable(boe->avee);
>                 regulator_disable(boe->avdd);
>                 usleep_range(5000, 7000);
> @@ -556,7 +1404,7 @@ static int boe_panel_prepare(struct drm_panel *panel)
>         if (ret < 0)
>                 goto poweroffavdd;
>
> -       usleep_range(5000, 10000);
> +       usleep_range(10000, 15000);

nit: how about using the range 10000, 11000? Last I looked at
usleep_range() it almost always ended up at the longer of the two
times, so that will shave 4 ms off and get us nearly to where we were
without your change. The whole point of the range is to make the
system more power efficient for frequent operations (wakeup
combining), but that really doesn't matter for something as infrequent
as turning on a LCD.

Other than nits this looks fine to me and I'd be happy to add my
Reviewed-by to a version with nits fixed. I'm not really an expert on
MIPI panels but the convention of a big stream of binary commands
seems to match what other panels in this driver do, even if their
table of binary data isn't quite as long as yours (are all of yours
actually needed?). I'm happy to land this in drm-misc-next with Sam or
Thierry's Ack, too.


-Doug
