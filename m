Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1B421C4B6
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jul 2020 16:49:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA8C6E2DF;
	Sat, 11 Jul 2020 14:49:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED4C56E2DE;
 Sat, 11 Jul 2020 14:49:21 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id g20so6956986edm.4;
 Sat, 11 Jul 2020 07:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4yR4ElxSmQKAvvG7liwNFfm8FLmxQ3u6hyl81BR6FRs=;
 b=mhfhaSL3VH3YP+HH2mKvyYUSrtIDiSMSbkJEOyyqXAslTAjfGZeerQMmzEafymvtux
 fBStxw9Qg808qFtgqSmdAqFPrenNhjg+/TgSpXMGX0wxCY+idvGpmXJqlnKBE+EYNvhC
 4oDt9xbpxGTL5jJIFqD/o1LYupXdWREzGUqBiR5j9MMc1WKs5UwGzP5NUYMygpVbDJqU
 NANb0Fv58gCoFICIEg740wlv3ITcSynGXaxuW/ZJ7SS98QGaPPWN4hwW3QwbLHDvmJQo
 CZ9iMvwKk83kgYOXVnuXiiQwgRVLDSYz7t+Xm92LFTO5gd0OWD1EDbwa2sSlAG7+0M3K
 /Svw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4yR4ElxSmQKAvvG7liwNFfm8FLmxQ3u6hyl81BR6FRs=;
 b=P377whYcS2NTARRlsbxC8RLZwWGVHtKrXMP/f6MWqX6xtk3QX3ABtN9kx6JpD0N04W
 h3DFmTsyXsPiakhOfbO+Wy6hs0gb2ENTFIEixg9DY6LuCcd9+889lWFjtEXEz6aIjRec
 CsO8zy5hV1bHeQ5WdwuUiYXgUNzWl1cxwouR8oMPJuE4FP3OkoVJaEzSW+J6Vh4epXFs
 C3hcpaS/czf1lP2wVvPN/3u57ryPJ9VyeQjbQ5CLQYFjq2idrgnEW4MsZm6bhSGHuuyT
 2scDP+ITtSyxjuZjI5IC/gNLWuuTQj64i1km+FwzZX0ztsQeLhtxMMGYiURuRCrt8E9q
 Q8Lw==
X-Gm-Message-State: AOAM530nLs/Kyt47ouZNeux4J0kXHGCbTmd7R5IeS12K5b8SHmlSFGjz
 I8AifOKNjHSdVVT9ItFqsEGpCruU+hvY9KOxG3CAsTE4YRE=
X-Google-Smtp-Source: ABdhPJzAiuATMrQ3L3Wzx0z/E2edOMusL72tAS8Keix8xaYUMrn+jsnM9WeuOWdX2QI3hVGXp4039REikR5s1dmbWBE=
X-Received: by 2002:a05:6402:1250:: with SMTP id
 l16mr84267646edw.362.1594478960548; 
 Sat, 11 Jul 2020 07:49:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200707203529.2098979-1-robdclark@gmail.com>
 <20200707203529.2098979-2-robdclark@gmail.com>
 <CACRpkdb0+V7AmvG0JXXETzayr4Q785OLhBWjU414tUJo1toJOQ@mail.gmail.com>
In-Reply-To: <CACRpkdb0+V7AmvG0JXXETzayr4Q785OLhBWjU414tUJo1toJOQ@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 11 Jul 2020 07:49:52 -0700
Message-ID: <CAF6AEGu3_qYWGKVmc2VrMVzU35svgxTEVKAMpNUZfy_jZg3euQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm: sync generated headers
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Jonathan Marek <jonathan@marek.ca>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, Sharat Masetty <smasetty@codeaurora.org>,
 Harigovindan P <harigovi@codeaurora.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, zhengbin <zhengbin13@huawei.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 11, 2020 at 4:49 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Jul 7, 2020 at 10:36 PM Rob Clark <robdclark@gmail.com> wrote:
>
> > From: Rob Clark <robdclark@chromium.org>
> >
> > We haven't sync'd for a while.. pull in updates to get definitions for
> > some fields in pkt7 payloads.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
>
> Out of curiosity : where are the syncs coming from? Mesa?

sometimes indirectly.. but they are generated from:

  https://github.com/freedreno/envytools/tree/master/rnndb

The cmdstream and devcoredump decoding tools (which also use the xml)
are in the envytools tree as well.

We have a copy of the gpu side xml in mesa, where we generate the
headers at build time, but I guess doing that on the kernel side would
introduce some build time dependencies that others wouldn't
appreciate:

  https://gitlab.freedesktop.org/mesa/mesa/-/tree/master/src/freedreno/registers

Mesa already depends a lot on py generated headers, tables, etc.

BR,
-R

> Yours,
> Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
