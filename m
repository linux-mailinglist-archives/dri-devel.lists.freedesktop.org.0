Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CF13E3768
	for <lists+dri-devel@lfdr.de>; Sun,  8 Aug 2021 00:38:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B0FA89D40;
	Sat,  7 Aug 2021 22:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C645389CF1
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Aug 2021 22:38:10 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id x8so25867677lfe.3
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Aug 2021 15:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lj89aSQV7OCOrepNKn8koFUUrCNiOnfBqunvMMwzNw8=;
 b=oh7DQA5GxYuqxO4BZrykAhKNgaCAYME7OWjMo/uOvn1pw1az/pLIOa4YTbr7jJ5i3+
 M0TrPWjgVIhRP6ayY8ABnAQaVoiNCM9EN7vSxgmlLZoFyGVjvy9JuatUzFmp8fd1I3lp
 j9YxntVjVbdq5tqJknAbwvBpm5zGCvgDQDV9BnMVDgUhHt9DQ3aCVZkKfcftoVhtC0W2
 sEHvusMNS5VrWqpFdPclhyfB8sZZVFNZyd0iaFsG2ceAoG62pOKMryAV6d6kMvOf67OG
 5agI0NJnowmzqbfOFOsm1a25FcwYvz1VDfMT2op3NBtkM6mgWhxuRMW+Gx1xTHu/ZSQl
 VzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lj89aSQV7OCOrepNKn8koFUUrCNiOnfBqunvMMwzNw8=;
 b=S338ZKhU5yZ1CCvdL3w3ITtSlq5XwlSkV8Lf61pGDmdmBjK92Xm/CxJ6U1EexljKrN
 pEqIUhD+SE1U+KHRRHIAe0QW8OnlVwMP5qv09rVi/UXr7BxoRu3kWWZmVsf3TMVcO9ws
 M+uHpgfHtSaoXBuQO4CxKRrLx4hNtv00gOth3DjkT9WaRPtTWQ/Sl/NyXYW4OIG9sWAx
 IMonlZhl0wYywNhEMBtHc9BOrnJaAGQvWzVxh9f00OPsWJxovpI8y4jHJ918Km0/JHwY
 Z9yeERaLgEBmh/gL/9s6+cwECSN5xDgd098eQEq2LS2dZyrPcNs3+3nwpNjmu7NrxPa2
 F2Fg==
X-Gm-Message-State: AOAM5311mjUYQalybR8phBf1HivTiesGgHoL/9PS5JYMCdqneFN19BwA
 LjAmich42C6x+Jc46RWUyQQ3i7LKgz4tMiPP0pUU7g==
X-Google-Smtp-Source: ABdhPJygNJetu7Q3WHCj4Rb3EJS60ayEOW6Cf3me7T+gPMKRUGV5KHs8bfbUiAmOv/uIL8pe6VU7fSK5IaW9mbhg+w8=
X-Received: by 2002:a05:6512:1084:: with SMTP id
 j4mr12499776lfg.586.1628375888754; 
 Sat, 07 Aug 2021 15:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <YQw7M7OF6OZLcLjk@ravnborg.org>
 <20210807133111.5935-1-markuss.broks@gmail.com>
 <20210807133111.5935-3-markuss.broks@gmail.com>
In-Reply-To: <20210807133111.5935-3-markuss.broks@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 8 Aug 2021 00:37:57 +0200
Message-ID: <CACRpkdYu5fdLvSYPV=fs0ry59abpTWoVVkKpd9cApSbmyssjmw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/panel: s6d27a1: Add driver for Samsung S6D27A1
 display panel
To: Markuss Broks <markuss.broks@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Dave Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, phone-devel@vger.kernel.org
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

Hi Markuss,

this is looking really good, the following is just nitty gritty details
I could fix while applying, we're mostly waiting for DT review now.

On Sat, Aug 7, 2021 at 3:31 PM Markuss Broks <markuss.broks@gmail.com> wrote:

> +       /*
> +        * Exit sleep mode and initialize display - some hammering is
> +        * necessary.
> +        */
> +       mipi_dbi_command(dbi, MIPI_DCS_EXIT_SLEEP_MODE);
> +       mipi_dbi_command(dbi, MIPI_DCS_EXIT_SLEEP_MODE);

Check if this hammering is really necessary on s6d27a1, on Widechips
this is just a bug, what happens if you put just one of them?

> +       msleep(50);

This should be msleep(120) on s6d27a1 (according to board-codina-mcde.c)

Yours,
Linus Walleij
