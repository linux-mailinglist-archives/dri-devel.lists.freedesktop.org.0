Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C67DA64C6AA
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 11:07:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DE1F10E3B6;
	Wed, 14 Dec 2022 10:07:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C10C310E3B5
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 10:07:08 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id z12so2075471qtv.5
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 02:07:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cy7T+0HN5DZODEIoAWFeUiuTL4WubIGF0dA9H8JAJVU=;
 b=tblu7VocrpoSRyYU4tQbV+LW3rwvLi4aee5qgQc61wR0jYWtQJos3v3ZvGhW56yq3b
 B3qpMLGYvh2BaS3hNbwKc/G5sm5cvdIpkwR3aAsseTNdmyKXv61+zm8tSpbNQedCyKE5
 nX1LEMCP8bdeQjYpZqU1loDo4YcQh5+ue1yf91yBeIoAg9vLXlg/mhgcKv1j5hEknDcK
 ZmgsBcZ9hH3AYHy+EhVlOzMdl+BQkpx2AfBqVqH6CCFL/YNLF3LfQpBt4Rx2LHPuVUbN
 oSGisB4y0ShQxoeY9onxhpo2Hat+8HRwk8PJtj0K/Z6kCbtfTGfdmUHC9coYy9lUS540
 C22A==
X-Gm-Message-State: ANoB5pn06XNm5cllv8Dwe3ibqZHVtxDc5pku7J6bSywXF1stT8NT//WW
 f5a1bizERNU+xl7XRDFzk/s+VIVvr2XghQ==
X-Google-Smtp-Source: AA0mqf6wovzsEXkbu+t+yanFwO7u6+IMdE7T3iPrD/BjvAGJ+/slZaGHxG4Qvsn10fs2tfg32h7ECQ==
X-Received: by 2002:ac8:424e:0:b0:3a8:5d1:aabc with SMTP id
 r14-20020ac8424e000000b003a805d1aabcmr27998772qtm.15.1671012427326; 
 Wed, 14 Dec 2022 02:07:07 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com.
 [209.85.128.176]) by smtp.gmail.com with ESMTPSA id
 f19-20020ac84653000000b003a7e9db074asm1402191qto.67.2022.12.14.02.07.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 02:07:06 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-3b48b139b46so229003387b3.12
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 02:07:06 -0800 (PST)
X-Received: by 2002:a81:4e09:0:b0:370:202b:f085 with SMTP id
 c9-20020a814e09000000b00370202bf085mr26552174ywb.502.1671012425842; Wed, 14
 Dec 2022 02:07:05 -0800 (PST)
MIME-Version: 1.0
References: <6398848e.170a0220.f8e8e.d44f@mx.google.com>
 <Y5itf0+yNIQa6fU4@sirena.org.uk>
In-Reply-To: <Y5itf0+yNIQa6fU4@sirena.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Dec 2022 11:06:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW4RNFspMheq1JGUkCm+s1oM90Q_4vPH1XX9ZRAxrmPdA@mail.gmail.com>
Message-ID: <CAMuHMdW4RNFspMheq1JGUkCm+s1oM90Q_4vPH1XX9ZRAxrmPdA@mail.gmail.com>
Subject: Re: renesas/master bisection:
 igt-kms-rockchip.kms_vblank.pipe-A-wait-forked on rk3399-gru-kevin
To: Mark Brown <broonie@kernel.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, kernelci-results@groups.io,
 bot@kernelci.org, Jonas Karlman <jonas@kwiboo.se>,
 Brian Norris <briannorris@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, gtucker@collabora.com,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mark,

Thanks for your report!

On Tue, Dec 13, 2022 at 5:58 PM Mark Brown <broonie@kernel.org> wrote:
> On Tue, Dec 13, 2022 at 05:56:30AM -0800, KernelCI bot wrote:
> The KernelCI bisection bot found regressions in at least two KMS tests
> in the Renesas tree on rk3399-gru-kevin just after the Renesas tree
> merged up mainline:
>
>    igt-kms-rockchip.kms_vblank.pipe-A-wait-forked
>    igt-kms-rockchip.kms_vblank.pipe-A-query-busy
>
> which it bisected to ca871659ec16 ("drm/bridge: analogix_dp: Support
> PSR-exit to disable transition").  I'm not *100%* sure I trust the
> bisection but it sure is suspicous that two separate bisects for related
> issues landed on the same commit.

... which is an old commit, added in v5.19-rc2, and which did not
enter through the renesas tree at all?

> Below is the full report for the bisect for the first test, the bisect
> for the latter looks identical.  It's got links to full logs for the
> test run and a Reported-by for the bot - I do see some backtraces from
> userspace in the output, the first is:
>
> | IGT-Version: 1.26-gf8a4a0b (aarch64) (Linux: 6.1.0 aarch64)
> | <14>[   35.444448] [IGT] drm_read: starting subtest short-buffer-wakeup
> | Starting subtest: short-buffer-wakeup
> |
> | (| drm_read:350) CRITICAL: Test assertion failure function generate_event, file ../tests/drm_read.c:65:
> | (drm_read:350) CRITICAL: <14>[   36.155642] [IGT] drm_read: exiting, ret=98
> | Failed assertion: kmstest_get_vblank(fd, pipe, DRM_VBLANK_EVENT)
> |
> | (drm_read:350) CRITICAL: Last errno: 22, Invalid argument
> | Stack trace:
> |
> |   #0 ../lib/igt_core.c:1933 __igt_fail_assert()
> |   #1 [<unknown>+0xd5362770]
> |   #2 [<unknown>+0xd536193c]
> |   #3 [__libc_start_main+0xe8]
> |   #4 [<unknown>+0xd5361974]
> |   #5 [<unknown<6>[   36.162851] Console: switching to colour frame buffer device 300x100>+0xd5361974]
> | Subtest short-buffer-wakeup failed.
>
> Unfortunately we don't have current results from mainline or -next.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
