Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9AE210568
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C9A6E7FE;
	Wed,  1 Jul 2020 07:51:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC126E7FE
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 07:51:22 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id y18so13016631lfh.11
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 00:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qA5bM+WCP+6+xrqHaHAfQZE4418oC7dBfKlNpFampf8=;
 b=ZZ7miNZVWKO46LJ8/TJl+yA0Ss4HFjwCQ1PS4s0VXxhfJW8E2Jda12hCRQW811RZAB
 rJ0G6F9L7j+s72JYwWteMsMWXhGguGPC6uKnDggH6FlBlnVMzjs4R+zzeBUCCH881MDm
 wSDDeUfbKti0XT7PZAM1hGGuTatJwiR+0N2CfoGeDTc/cWfiKbvR6xqwTihHm0PPBc1K
 32ca+MBKN3hCPSOozfWTmjbty1CRTMNtoGHNVGiiM55RomC+hUSpX2e1/qdf0809XS7b
 hcZLzAQpP7wZKj5F2vpZmvnbAlSdfyRrpeVLeC6RBZ00tG1Hviiw8oXq6WUv9vvARvzJ
 GMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qA5bM+WCP+6+xrqHaHAfQZE4418oC7dBfKlNpFampf8=;
 b=HZI43Q8dKC0CNCpNg/a3ChFw5iTUTIOiUP5i5hWLttTPNXt2PuiNXY/jjZpXFxeDxX
 Qv1nga6p4sfVW5EU+xBJmM6MpW+mYrgfQ+2ODpfrEvHbXzsmqvwYFM2p4T6ckPq6kZnn
 SSCzd/ivL2uaoScNhiBj7QstC/uthwhV3zSAGey42oh9aNfimhF+DetvtPqm4Pjn8bsB
 m5izR1VRLL12F/1rbUstZVLiVSbZPsEq/sLRuOJXlSBGRQg7MNhP3RPzG6gLa1mIKeGJ
 rRQ5F/2OGaCW8jaFHyHkKcH9EDcEqJzaV5I15r5NNSykuxePAgqXP+u95k4mq1x7exKV
 XX1w==
X-Gm-Message-State: AOAM5326pdwrQhv2FHy0I5rAU0TOPhPj/tE8xydabIdo/nEEQGSQw5B7
 kV0oj59GbhR5bP+RrEGu0oKHO3oZzW5b+63mZfXu5Q==
X-Google-Smtp-Source: ABdhPJyrJFAzSG4TfNUteKjvVvXNEtpwXJyb/bxaFmIvpSRTkSG+0rgLXE3upuXl29SouGIj3HRAshWvgCk19SJwY8Q=
X-Received: by 2002:a05:6512:3150:: with SMTP id
 s16mr3355246lfi.47.1593589880512; 
 Wed, 01 Jul 2020 00:51:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200626005601.241022-1-megous@megous.com>
 <20200626005601.241022-11-megous@megous.com>
In-Reply-To: <20200626005601.241022-11-megous@megous.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Jul 2020 09:51:09 +0200
Message-ID: <CACRpkdYHmZi+BCRs8xzCUqiCEK7RHynHWeptTtEzJ1WHToMRFg@mail.gmail.com>
Subject: Re: [PATCH v5 10/13] drm/panel: st7703: Enter sleep after display off
To: Ondrej Jirman <megous@megous.com>
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
Cc: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Purism Kernel Team <kernel@puri.sm>,
 Samuel Holland <samuel@sholland.org>, David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, Bhushan Shah <bshah@kde.org>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Martijn Braam <martijn@brixit.nl>, linux-sunxi <linux-sunxi@googlegroups.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Luca Weiss <luca@z3ntu.xyz>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 26, 2020 at 2:56 AM Ondrej Jirman <megous@megous.com> wrote:

> The datasheet suggests to issue sleep in after display off
> as a part of the panel's shutdown sequence.
>
> Signed-off-by: Ondrej Jirman <megous@megous.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
