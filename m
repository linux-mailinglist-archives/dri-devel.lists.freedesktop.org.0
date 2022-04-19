Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DE15060EB
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 02:26:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567B710E508;
	Tue, 19 Apr 2022 00:26:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 602E810E508
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 00:26:24 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id i14so12021688qvk.13
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 17:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r/8IhUYumPgGlWcaLrv8LYlYLLFMia8Jo1Q6MnYM6Pc=;
 b=oOe1aYS1bBzFC/F96YEOjVTh7L+YEnCIa+QNbLoE6bvFoub44qnRlFaXxscXqSK9EJ
 2rLbF0IeAWRUhSoGMh6gST1B3jNHNmxbVdIzszhVozRT/NL2l+1wU/iW60VjqyaYsEoO
 OoKewCg6FOgDKhAZBj2ZaBelbT9iDBVBCD1qdDfJnw5qIfEHq9eBQBT4pj8037EmPj6f
 mx82V2EaaHs9E4uDz1cAZsA6uljOv5C30vnOrOCeKM+RN6kBz7AreF1ae5oo0DvCZ+cW
 i/gXCOOZyjLCZmitGgNIXFAZF/iT9HpqShURI7lv3MwZ/DcjokaXlV41GGjR/+/ofwZX
 gIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r/8IhUYumPgGlWcaLrv8LYlYLLFMia8Jo1Q6MnYM6Pc=;
 b=7J9cuE2Gt1W/KSYE751RJ8F4SkeTkbhBP1YKdcy+R3su0tMSqK4WJxbUBOdLF5Hcak
 XJhsjcefc9dcEDA6RregA7weYTrHkOz+C7JDAmempcRuVivUT5D0WGm+V/Tpk5Ayck5d
 S5RlFEJ+Rl19JRPukh5lCZpjsqhPbQjHrVKAgUk+gEUw3xgx7jb17G3W7n2MENHdJYAH
 4hcE4fE7VcRINxhzX8S0pygYmbKZXTkEVW/Fm/aOP2ZAMWo7Celc8Z5KQMfFvI4aKtXy
 4P4N/B91IMV7964gu4srtGeZ+0DDKR8YDjtWFJgLt1Txkp5w193RYAJyjyvP1A8sEito
 7I3A==
X-Gm-Message-State: AOAM530ovF0WvQKzLhR+e1tjPAyp9Vzce5wiKNN1uUkF5kpoP4V2XjI/
 YmTV3eJG98mhLpsjtuMxan3my/18VHOk9xUnM3c=
X-Google-Smtp-Source: ABdhPJw255BQZzve7Trub/Gqg+xCd5BgjLuRRScROAjRoahM4+lRqR32/NLf//asvQe/oIUfmy1RSJm+LhjwKs399vU=
X-Received: by 2002:a05:6214:acf:b0:446:7570:bdd1 with SMTP id
 g15-20020a0562140acf00b004467570bdd1mr390259qvi.103.1650327983517; Mon, 18
 Apr 2022 17:26:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220417181538.57fa1303@blackhole>
 <CA+E=qVeX2aU0hiDMxLXzVk-YiMsqKKFKpm=cc=72joMhZmNV1g@mail.gmail.com>
In-Reply-To: <CA+E=qVeX2aU0hiDMxLXzVk-YiMsqKKFKpm=cc=72joMhZmNV1g@mail.gmail.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Mon, 18 Apr 2022 17:25:57 -0700
Message-ID: <CA+E=qVdEtx8wVbcrMQYGB1ur1ykvNRp1L174mVSMkB0zeOPYNQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: fix anx6345 power up sequence
To: Torsten Duwe <duwe@lst.de>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, stable@vger.kernel.org,
 Thierry Reding <treding@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Apr 17, 2022 at 11:52 AM Vasily Khoruzhick <anarsoul@gmail.com> wrote:
>
> On Sun, Apr 17, 2022 at 9:15 AM Torsten Duwe <duwe@lst.de> wrote:
> >
> > Align the power-up sequence with the known-good procedure documented in [1]:
> > un-swap dvdd12 and dvdd25, and allow a little extra time for them to settle
> > before de-asserting reset.
>
> Hi Torsten,
>
> Interesting find! I tried to fix the issue several times by playing
> with the delays to no avail.
>
> What's interesting, ANX6345 datasheet allows DVDD12 to come up either
> earlier or later than DVDD25 with the delay of T1 (2ms typical)
> between them, and actually bringing up DVDD12 first works fine in
> u-boot.
>
> The datasheet also requires reset to be deasserted no earlier than T2
> (2-5ms) after all the rails are stable.
>
> Another thing it mentions is that the system clock must be stable for
> T3 (1-3ms) before reset is deasserted, T3 is already a part of T2,
> however it cannot be gated on Pinebook, see [1], page 15
>
> The change looks good to me, but I'll need some time to actually test
> it. If you don't hear from me for longer than a week please ping me.

Your change doesn't fix the issue for me. Running "xrandr --output
eDP-1 --off; xrandr --output eDP-1 --auto" in a loop triggers the
issue pretty quickly even with the patch.
