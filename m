Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBD03D422E
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 23:26:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 803F06FC44;
	Fri, 23 Jul 2021 21:25:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 069AE6FC44
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 21:25:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D2F5960EBC
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 21:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627075557;
 bh=Y2+4vWDQsufrxtPr5dxwMNbkWMxKsU9EX96nJ+a043I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=E3ffraGq+WB0mYUbWa/KYU56Sph76jOXKA6DXdo8+V4/V+zHT8v9bAO78r853ZOTe
 frTm+xmE3fPBKWYOe2706hl1CGL0CX/11AilB5wh9ejNuMg8iMCOwr9HHAGu9jfvSj
 iEjjcayPfIXP6fp2lCPPmGN/hftU/nU3lB4o2d6d2E8ScpknRYFr9Lm99wvMKVjyyq
 E+5XL6QAD0jkaI/4R+rOV7a8B1yGf+ul/EWBb9HWk+HBIAtgZolwtIitla0N7gQWtt
 DeQfw8jucg/nRkZdNHkUSiPpZv7oREmXgCi1eUH4aBadAh/D0g6nVKD1UO5Lp5hlBj
 grvg/xCQZt2ig==
Received: by mail-ed1-f52.google.com with SMTP id n2so3354194eda.10
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 14:25:57 -0700 (PDT)
X-Gm-Message-State: AOAM531DtMYudNH+JCOrVynBlCJbglQRb8JfsgLvjOpGGxBYL3zwr0Y8
 IjBI8RvLnRS4LYzc5vp6ca/m+kys/aM8lFcbRQ==
X-Google-Smtp-Source: ABdhPJy1c3eyy/FP6EjBD5reeZRC6kaYEX0oNwJSz6lKuHUlbPJr2EpqmbxNRfwJj6+f08LjSJayXEiOO+ZI5WMI+Fo=
X-Received: by 2002:aa7:df12:: with SMTP id c18mr7914633edy.62.1627075556418; 
 Fri, 23 Jul 2021 14:25:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210719195001.2412345-1-robh@kernel.org>
 <YPXZODWTE3qHQqEv@ravnborg.org>
In-Reply-To: <YPXZODWTE3qHQqEv@ravnborg.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 23 Jul 2021 15:25:45 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJt=ifqBuvpAXkd5hXb=1tg16a4Sjcq+WuvsinccPuvuQ@mail.gmail.com>
Message-ID: <CAL_JsqJt=ifqBuvpAXkd5hXb=1tg16a4Sjcq+WuvsinccPuvuQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: Fix graph 'unevaluatedProperties'
 related warnings
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Krishna Manikandan <mkrishn@codeaurora.org>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 19, 2021 at 1:57 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Rob,
> On Mon, Jul 19, 2021 at 01:50:01PM -0600, Rob Herring wrote:
> > The graph schema doesn't allow custom properties on endpoint nodes for
> > '#/properties/port' and '#/$defs/port-base' should be used instead. This
> > doesn't matter until 'unevaluatedProperties' support is implemented.
> >
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: Marek Vasut <marex@denx.de>
> > Cc: Krishna Manikandan <mkrishn@codeaurora.org>
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Thanks. FYI, your mail only went thru on dri-devel, but not DT or LKML lists.

Rob
