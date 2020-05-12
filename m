Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C03491CF3F7
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 14:05:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B1AC6E0EA;
	Tue, 12 May 2020 12:04:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF496E0EA
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 12:04:58 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id l19so13343278lje.10
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 05:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5btP7gtbpjtG0BhO1UsxQRV4a7bUgE/wIxxtvB4r82k=;
 b=zc2w2MLiS0a8rnKvBR7UNWYE0BbONekozXpNgUqpFZ5kVRg6+oI64tWi9lfGivgNeb
 0xSZwWlbpp/ikbEom6DC9FZDRsko9yRHoXbMTuo/u1I+b77ubHC6tJbNZNCr4PyKXwUi
 gmbc+fu5UbWh1Bta2gBmK2Uit91iJEnEjIP+z41JS8IHO1tSoWXbs9pJm5we8/OsUBSk
 wJG/1Y+j7+2mqdSALCXTh6BPXPi2GTgvWnvDHTRALQ1NkXHztiY+UaKX5G+XGnAkVxzm
 DPKV2Wi8rW9BIu759OOt4uInwbttKSx65J3XY5GsVfHXBlSahmJuIO2atCuXwtGbg85G
 EaUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5btP7gtbpjtG0BhO1UsxQRV4a7bUgE/wIxxtvB4r82k=;
 b=PErszAZIWlkpZzQ1+bS9VLewYnBCikiFNBes+eoyA75kY8gW2ltpZpZ3swZU2s/Fuq
 fUhNau9A8MXHQkxp1kU4DJFLm/taSLEuxsfhxfCDMPmTupvCR5Oh5gRETBcPKCStVV9m
 5A05h7AsmWI7yVgeOg5Th0N4Bz5gE5MTx/XS0y/q+A6CrTKiuiDVTJe+Ljc9RW2i/4PJ
 w3U6adkl/SeiEtNndQkD0FVDF9+aXf7nGnkQA83x9gNpnWSrjnob67wD8F6Krvco5zcN
 A0Q4idCfuAgJtNDIpbWBQkwbk9L1m5jPv0fxmE4OIF8pD8TMTqyj+uXPDn/dQ3mery98
 4Y9Q==
X-Gm-Message-State: AOAM5312a3hGXagTeXg+4A5I/17YFb3Dow6NeOzAB0qbrVqJ5FasYjHI
 zhaJ10IoI47H7lOfFxDKGYykfMYnuppxElm868S7Vg==
X-Google-Smtp-Source: ABdhPJwQSmzg18wDAiNLVctzzlRZrCjXxz1QtookN6JLhJ4bNY7gw2amRj0dviJQShJhEFaL/quWNpl+3GN1FMqhN7s=
X-Received: by 2002:a05:651c:32e:: with SMTP id
 b14mr13584425ljp.277.1589285096459; 
 Tue, 12 May 2020 05:04:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200428141459.87624-1-weiyongjun1@huawei.com>
 <20200430073145.52321-1-weiyongjun1@huawei.com>
In-Reply-To: <20200430073145.52321-1-weiyongjun1@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 12 May 2020 14:04:45 +0200
Message-ID: <CACRpkda2-EHn3BrMtGoTV4uax6G0JJekEjnnLL1FT+2YQFawTQ@mail.gmail.com>
Subject: Re: [PATCH -next v2] drm/mcde: dsi: Fix return value check in
 mcde_dsi_bind()
To: Wei Yongjun <weiyongjun1@huawei.com>
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 30, 2020 at 9:30 AM Wei Yongjun <weiyongjun1@huawei.com> wrote:

> The of_drm_find_bridge() function returns NULL on error, it doesn't return
> error pointers so this check doesn't work.
>
> Fixes: 5fc537bfd000 ("drm/mcde: Add new driver for ST-Ericsson MCDE")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
> v1 - > v2: add fixes and fix the subject

Already applied v1, no big deal anyways, its a nonurgent fix.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
