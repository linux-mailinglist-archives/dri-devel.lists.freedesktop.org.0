Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE47413D74
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 00:20:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C34536E85A;
	Tue, 21 Sep 2021 22:20:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B69306E85A
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 22:20:02 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id a15so773410iot.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 15:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HWLoAInOLCehVyUDdEFgyA0aq8c1810nqg999R8oxfU=;
 b=aj3QxekWfRi3uAdc5lpdDn6FoYAedJ8FsTjBDvBCDWRjEzt/JQ6p7imxAG/DApK+mF
 2gagVt3X8luIoitRLXSKRYVwLgSznNVpaZyG8m/4FCGZweCBBZsIAUvT7PdIPZbU8wN1
 mfAQEwrxhepXNPQuDT3ppCtjQk9jPR2TpYAss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HWLoAInOLCehVyUDdEFgyA0aq8c1810nqg999R8oxfU=;
 b=U5pt+lglWQS4dDi1XwoZ0Sb+RBZDgs8gGcL5hNoxds/rzgWqC7gLoSMbvfqtFnosvD
 x5/VFNoOn11iZxFLKRKmTSDn3P21idq1hoS4vfL/GNwM3YsowGL5RgRt3z0qviLX8vCY
 6EraZxe/CanS1faBj1kxS9wLQWcrFZu1+bX1Il5w5HXyJxQoQXxUHhnwre0DfMVbcfrd
 Oj+C09rkNcAGlN8rBuM69Kysy+CZk0jiywkgVinbOqW8rpMBERuIrIfipBOhXmxNQnBH
 fV4NIF6OidxfHHOlsIOh6GTwGxFvqRoveDqOMtYWCANerRPVlGzSNhxG0qcYTPqJnceU
 1Xpg==
X-Gm-Message-State: AOAM530cDcpVya1w2yZxMW86FKzVgKoHj4Z46c8N95mQqAXLxrxnqmT1
 Z5hUyyC9QWwXq5pJa84wExXiqmklMj9Anw==
X-Google-Smtp-Source: ABdhPJyWMl30CpodcybLR8STdXZLcmcQ+3IPwmfIcuf1tWn7JIN/IBI02sxAfH19aGjqx1N0DhLpuw==
X-Received: by 2002:a02:22cf:: with SMTP id o198mr2043371jao.37.1632262801872; 
 Tue, 21 Sep 2021 15:20:01 -0700 (PDT)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com.
 [209.85.166.180])
 by smtp.gmail.com with ESMTPSA id i14sm138440iog.47.2021.09.21.15.20.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 15:20:00 -0700 (PDT)
Received: by mail-il1-f180.google.com with SMTP id x2so457595ila.11
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 15:20:00 -0700 (PDT)
X-Received: by 2002:a05:6e02:1b0c:: with SMTP id
 i12mr20195314ilv.27.1632262799686; 
 Tue, 21 Sep 2021 15:19:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210920225801.227211-1-robdclark@gmail.com>
 <20210920225801.227211-4-robdclark@gmail.com>
In-Reply-To: <20210920225801.227211-4-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 21 Sep 2021 15:19:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WGmk6UY2MA4=y4gaM4G66t-qxuLtAZvUahzwg8YsLv=g@mail.gmail.com>
Message-ID: <CAD=FV=WGmk6UY2MA4=y4gaM4G66t-qxuLtAZvUahzwg8YsLv=g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/bridge: ti-sn65dsi86: Add NO_CONNECTOR support
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Clark <robdclark@chromium.org>, 
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

Hi,

On Mon, Sep 20, 2021 at 3:53 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Slightly awkward to fish out the display_info when we aren't creating
> own connector.  But I don't see an obvious better way.
>
> v2: Remove error return with NO_CONNECTOR flag
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 39 ++++++++++++++++++++-------
>  1 file changed, 29 insertions(+), 10 deletions(-)

This seems fine to me:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

...if you would like me to apply patch #2 / #3 to drm-misc-next then
please yell.

-Doug
