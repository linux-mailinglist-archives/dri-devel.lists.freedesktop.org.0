Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C55474C183F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 17:11:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CBB810ED71;
	Wed, 23 Feb 2022 16:11:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C41610ED6F
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 16:11:23 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id hw13so53199905ejc.9
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 08:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C5qKegv6oI4JVSPI+80dtUnPmB566v0hDmN9wDy+qXo=;
 b=EC69yM62vfAYpURzcMUxXa9SJ1iNma+rnpEiEhk72v8bKiT7ZaCFOrNcA03N7P3oBj
 +6dc+2+xM7b+6Chp9hLL5RxKTgH1qd5Pn2JxdsdYKlxQowGwLeFjw6VQ2ONzFOa42Muy
 k+IhVJZUlX4VYSTdzGTYXdl3L1BBEmefJP8k0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C5qKegv6oI4JVSPI+80dtUnPmB566v0hDmN9wDy+qXo=;
 b=cWh0bnLG3IKy9E/Zwp2DaQHYmueZHg9W6JyqdHjiuO+GAuiUi0m+qXQs/fuq2pctFC
 Lnvd1YeIwQ0fNdUC9F2el0ZNUIda9J+c0E/ygmtR2BM+pBq2B7lCfDZn03ukJY/0kZH4
 pjdDoM1fewbRC5s4LGD1CMPVDsLQyXI60AJj0R6gMXS4+g5SnwGkMNm5bxDdC+p/Ds3G
 fq6BN9BLoRPDaxFrKP6EciHw42331hH/FovZpYRPd3YGgHRGVPAwzYeQj0w+NPAnnS2T
 Cj4okEMiyXNohQhCrFQKvCn/FA5yhzhIQU4iWDDbk/g/GIhraEFWqSnobgS+71QAnJBe
 vh7Q==
X-Gm-Message-State: AOAM532rqw3LI0tzfjivL0RRbrJFNeLA7RMWE3MT0pLxAXSWL0UcPOkq
 Pbmitlq4Br1sHfyuuD6nfGru4KvKrd8g0mFoPIg=
X-Google-Smtp-Source: ABdhPJx5u3EqF+UMXojTUSiQO4bSV5KUoEZzRsQFQjezujXAPKQuw+rkH4VuJUbBN24K5vcncy10SA==
X-Received: by 2002:a17:906:1e13:b0:6d1:5042:e8c1 with SMTP id
 g19-20020a1709061e1300b006d15042e8c1mr363200ejj.354.1645632681276; 
 Wed, 23 Feb 2022 08:11:21 -0800 (PST)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com.
 [209.85.221.53])
 by smtp.gmail.com with ESMTPSA id s1sm34264edd.100.2022.02.23.08.11.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 08:11:19 -0800 (PST)
Received: by mail-wr1-f53.google.com with SMTP id d17so5593706wrc.9
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 08:11:19 -0800 (PST)
X-Received: by 2002:a5d:64a6:0:b0:1ea:80f8:a14e with SMTP id
 m6-20020a5d64a6000000b001ea80f8a14emr241220wrp.513.1645632678590; Wed, 23 Feb
 2022 08:11:18 -0800 (PST)
MIME-Version: 1.0
References: <20220203093922.20754-1-tzimmermann@suse.de>
 <CAMuHMdWykWR4oKahC2GYF5jG4przRQ+MxNNm1BK7o62OhhGYwA@mail.gmail.com>
 <CAMuHMdXcRRgn4EMXn9qonnjTTp7EEfwP4F8FeVpLkQMNvB-6mg@mail.gmail.com>
In-Reply-To: <CAMuHMdXcRRgn4EMXn9qonnjTTp7EEfwP4F8FeVpLkQMNvB-6mg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 23 Feb 2022 08:11:04 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UbiXx4RBQNFp1htCYsM1YzAgES+mcA6KOJ7ZmydkHnBg@mail.gmail.com>
Message-ID: <CAD=FV=UbiXx4RBQNFp1htCYsM1YzAgES+mcA6KOJ7ZmydkHnBg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: Select DRM_DP_HELPER for DRM_PANEL_EDP
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>, Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Feb 22, 2022 at 1:31 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> On Tue, Feb 8, 2022 at 10:39 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Mon, Feb 7, 2022 at 12:31 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > > As reported in [1], DRM_PANEL_EDP depends on DRM_DP_HELPER. Select
> > > the option to fix the build failure. The error message is shown
> > > below.
> > >
> > >   arm-linux-gnueabihf-ld: drivers/gpu/drm/panel/panel-edp.o: in function
> > >     `panel_edp_probe': panel-edp.c:(.text+0xb74): undefined reference to
> > >     `drm_panel_dp_aux_backlight'
> > >   make[1]: *** [/builds/linux/Makefile:1222: vmlinux] Error 1
> > >
> > > The issue has been reported before, when DisplayPort helpers were
> > > hidden behind the option CONFIG_DRM_KMS_HELPER. [2]
> > >
> > > v2:
> > >         * fix and expand commit description (Arnd)
> > >
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >
> > Thanks for your patch!
> >
> > This fixes the build errors I'm seeing, so
> > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Is this planned to be queued? This is still failing in drm-next.
> Thanks!

Looks like this has been in drm-misc-next since Feb 4:

---

commit eea89dff4c39a106f98d1cb5e4d626f8c63908b9
Author:     Thomas Zimmermann <tzimmermann@suse.de>
AuthorDate: Thu Feb 3 10:39:22 2022 +0100
Commit:     Thomas Zimmermann <tzimmermann@suse.de>
CommitDate: Fri Feb 4 09:38:47 2022 +0100

    drm/panel: Select DRM_DP_HELPER for DRM_PANEL_EDP

---

Maybe it needed to land elsewhere, though?

-Doug
