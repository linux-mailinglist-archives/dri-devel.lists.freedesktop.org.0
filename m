Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A2A1CF449
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 14:22:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D68C6E8C5;
	Tue, 12 May 2020 12:22:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78FE6E8C5
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 12:22:12 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id u6so13361632ljl.6
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 05:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6rE0fPu5jCjuTK0cRn6PVF83ctsvQUR9eqdpVEWEcp8=;
 b=fRMfmTqU/svnwd/DeHQpZqANKDRENpPQrFnFCdA6XrC7CAjuUBlWO5WlHhJX1VdFZx
 GMq8lToALBRe4c2J8T+QxKo9JnROag//KysTHoivaIxpklZerMhBClnLLRGkf6GTvxAZ
 HkmO3moxLpKmk6A6rO8oP7BDRG8DnImZgtRVlxbihuFkbxwz1Ua1Vkr2ST+iiVDtsiMz
 +M1+jQ3zq3lb0Xi3P6DDhvioJsSDIiVLJW6i37AU92QD1VUuBYzTzk/eg8zmrLXxDlHD
 ODaToJfeFvwuXa2LV7sZKRly/f9mFOUS9o9v8dILxoPCrjdsYLDHOnR6njLXYMKzYGwc
 5uhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6rE0fPu5jCjuTK0cRn6PVF83ctsvQUR9eqdpVEWEcp8=;
 b=I/T6O8oOejb3VVp/LKUHwWE9SRm+kq6iXmgMlP6OISZJSuFul8ep+D1kjEfvm3ZtRT
 +/irHl2oPbsyvrXfinsxM7GuwDxoikdeNpT/zLAnm3D05n4SRjC0Z1Hgk4SnZz5U46ir
 SLLcWe7+KDcs8jihNxYg6xf5XOv+S8sP7+jpDhudMTQXS+izKgulg7vcq6o/VIhU/gec
 tDSr0HIWLRgXxRa7pELg9dqhQxVC/45dsTv32gAYwWqvyRPRxB0ovHuKTkrR41q0jnnW
 FBG2flEGlzbBJFGnIsrziFAwh4YWFLE7vVhobneUaExF8qK7bHvQbi0IjKkPpl65Gygk
 biDQ==
X-Gm-Message-State: AOAM533Q9CULyJgQn5gI5fud+CncbAkvPKHuuFRZg7FN7DHVwCi++BvJ
 zhbvkljpKhV+fdsaAxM2dr4CsuINc5Ge8UdNHRae6A==
X-Google-Smtp-Source: ABdhPJwIPX2HNFOXh8yU8/OwdxhhRENdd70ug7z8dIHFgzX2fvXuP4+XvRAkuMUcWF3Sb2fH8n4awGxwbFbw77QNBx8=
X-Received: by 2002:a2e:9c97:: with SMTP id x23mr1647314lji.39.1589286131013; 
 Tue, 12 May 2020 05:22:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200430194617.197510-1-dianders@chromium.org>
 <20200430124442.v4.1.Ia50267a5549392af8b37e67092ca653a59c95886@changeid>
 <CAD=FV=WHoxdr++f7Y_NO=VnrnEPkP=+WS5u3j_5ifEjekhBWcA@mail.gmail.com>
In-Reply-To: <CAD=FV=WHoxdr++f7Y_NO=VnrnEPkP=+WS5u3j_5ifEjekhBWcA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 12 May 2020 14:22:00 +0200
Message-ID: <CACRpkdb22QrOcJXrR1je9Cf8S9LnKCcnQ92ML2xQhncraKC1Pw@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] drm/bridge: ti-sn65dsi86: Export bridge GPIOs to
 Linux
To: Doug Anderson <dianders@chromium.org>
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
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Andrzej Hajda <a.hajda@samsung.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Sandeep Panda <spanda@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Jonas Karlman <jonas@kwiboo.se>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Stephen Boyd <swboyd@chromium.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 7, 2020 at 4:39 PM Doug Anderson <dianders@chromium.org> wrote:

> One suggestion that came off-list is to change the code to make the
> numbering match up better with the datasheet.  Right now if you want
> GPIO 2 you have to refer to it like:
>
> hpd-gpios = <&sn65dsi86_bridge 1 GPIO_ACTIVE_HIGH>;
>
> That's because the code right now numbers things starting at 0 even if
> the datasheet numbers things starting at 1.

This is the hallmark of mixed-mode IC engineers at work.
They are at heart analog IC designers so of course they
enumerate everything starting at 1.

Digital IC designers are like programmers and start on 0.

Never the twain shall meet...

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
