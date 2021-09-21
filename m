Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A5E413DA9
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 00:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4CD96E8A8;
	Tue, 21 Sep 2021 22:37:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5160B6E8A8;
 Tue, 21 Sep 2021 22:37:34 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id t18so1317800wrb.0;
 Tue, 21 Sep 2021 15:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NF/erRb1xvPiKeuz4vBloWnkjZnF25C64FmvspbwiEo=;
 b=JYjh8ATXm2rsrUDRYndqccmq6DGYrm5G5oFK0PZXiGJoNKohaS1/MHXzIgY7DdAXpw
 bL4LKJHOwlXzBZjI4gZmIAtxO4OxYq2Su5L8Di4QO7DjVkyyBL9ArU39slEuMQnHItjY
 d9fqTTl6hRWixuueYxiVGwJm4aZg7d79t694owtoAdVY8UdbwDTw3HKt2+GerXIv9Vfc
 IM9z1BHJHHud/yTUA/IZBbib8s7DIEM7z8e74ulK65VduDRs3HHTlbat7RGYmBIkfJXc
 gvf4Bk+dyL2yC3udwwiFlF899jZ3k7UFinfilIFMRsx9yzoq0QFvbKqgeFjjteG+uAmv
 FLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NF/erRb1xvPiKeuz4vBloWnkjZnF25C64FmvspbwiEo=;
 b=10vAU25ehkwkSHEJ5r/TfIyx8I4hjgR+dN898aEUpAmpkh8uzG8VV9AHtWQ9+zKow9
 xBSjvIKnCepRcY7iTg+SUOAa67oA9iCGdiXMEKMaY9D+uyqCSCprJ6cU+WG6fYPVovpl
 A3GhgkHfa6rRVHAv6tgyU+TtE6imdqjrrOwaq0RXu6DaU9TrY7/jnwI56Mez4nh4vLrs
 jHB9e21ghK6mzE9uEqPJ4iaFsUrFYKkcsDe/WZfPmDDDTvrdfHofUiRsy8iMIfqtylL4
 NjRAx6kMN+rBAMUPB0gRlLi2Qdmdu9IzLZMkZXkqwv8gbGIIMA7Dws9GtC3amA0Aazka
 EeuA==
X-Gm-Message-State: AOAM530kAfZQiTa7+pmGZ33u75cnnu6YSFPDcHKzGuom6N5cdIOXgSUQ
 jPpaBIvbx4qOgLzyYhn9VZp0iykzBiTTO1t/BsE=
X-Google-Smtp-Source: ABdhPJwQrPe5g07Tgw6bfhoM7DZmOuM0RlxSlbPtGLd/rX3SR68UPXcB1WP9tH3HG9lf3JQ2MI9QK4YJvhJ6cChuQtI=
X-Received: by 2002:a05:600c:1d16:: with SMTP id
 l22mr5431621wms.101.1632263852964; 
 Tue, 21 Sep 2021 15:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210920225801.227211-1-robdclark@gmail.com>
 <20210920225801.227211-4-robdclark@gmail.com>
 <CAD=FV=WGmk6UY2MA4=y4gaM4G66t-qxuLtAZvUahzwg8YsLv=g@mail.gmail.com>
In-Reply-To: <CAD=FV=WGmk6UY2MA4=y4gaM4G66t-qxuLtAZvUahzwg8YsLv=g@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 21 Sep 2021 15:42:05 -0700
Message-ID: <CAF6AEGuE1y7ZdOE+=N1v7Zc=gigopS50BaADHpUOoM2TrshSCw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/bridge: ti-sn65dsi86: Add NO_CONNECTOR support
To: Doug Anderson <dianders@chromium.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@chromium.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, 
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
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

On Tue, Sep 21, 2021 at 3:20 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Mon, Sep 20, 2021 at 3:53 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Slightly awkward to fish out the display_info when we aren't creating
> > own connector.  But I don't see an obvious better way.
> >
> > v2: Remove error return with NO_CONNECTOR flag
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 39 ++++++++++++++++++++-------
> >  1 file changed, 29 insertions(+), 10 deletions(-)
>
> This seems fine to me:
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> ...if you would like me to apply patch #2 / #3 to drm-misc-next then
> please yell.

Thanks.. I think we can give it a few days for Laurent to have a look.

This will conflict some with Maxime's bridge vs dsi-host ordering
series.. not sure how close that one is to the finish line, but I can
rebase either patch on top of the other depending on which order they
are applied

BR,
-R
