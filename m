Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 608ED41284A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 23:42:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F5866E87C;
	Mon, 20 Sep 2021 21:42:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 731BA6E87C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 21:42:24 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id d18so11807847iof.13
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 14:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S4wFITo/SSU6l99h8D31QzjvTinZuABM6hsuvIBIt0E=;
 b=TnVdqX4dU4BNSs1W4ynCtvk+BVtm8j0Qx2FtJwNVrJwQ9fXP1ogw7QUphAS5Z6+ADC
 BAS2RcjjVEGZo6FvXnCDkpMUTCKyG8XApGssOtkJGkvZ5kyNgq4+0kpQNtn3fU8Op0X+
 MqGdtdBo6zHFW9g90F7fIeDr0TO1SgZZ0nHoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S4wFITo/SSU6l99h8D31QzjvTinZuABM6hsuvIBIt0E=;
 b=Fr/qN4kVR6nAzmQC6hZUOyKfjK/O7EU7ZLgC5bIr1Rp4b8rKzLsFjr5ssAq679Bbqv
 L99W0wkXUnNhPR5m4JhejwStb69QwBec/quULDEpzWL5FUzmahkwgHs2ZhMxjvWSoLAk
 sUUcUIPoJgkaxxsZYMHmmmqq7iT0GXu2IFEGYEXJzgGlIlhQ/a6XpKUXk3swgAR92MI8
 cFf9+413hesUXUkqLE0hay6UyfRVMCM4CXEnYU7vR8joBg+IHZxWaeVMAHfgcXeoTDP+
 5akiO//7kYEGWzUVA31cRQTnILfSC7sHcI6WwxwlT4h5dA/sXdf5zu6zdfIRXV0ujVWU
 p+zw==
X-Gm-Message-State: AOAM531XRDapG9sfrxv3A2JQdtKTPT+l6J988jBuMIt6jzfB4GCeFhgk
 qC9HkQkZttYeAtdFPHTZlAZulSKTbUiYDw==
X-Google-Smtp-Source: ABdhPJwMIIXhmJqCDcst9eZXjJua0pEIiW6ZwdmkVYjqgn9KDu4YvTNKA+VmXxYpqAjK0XaVYGmMEg==
X-Received: by 2002:a5e:c701:: with SMTP id f1mr9031093iop.185.1632174143342; 
 Mon, 20 Sep 2021 14:42:23 -0700 (PDT)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com.
 [209.85.166.47])
 by smtp.gmail.com with ESMTPSA id f12sm3052217ilu.24.2021.09.20.14.42.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 14:42:22 -0700 (PDT)
Received: by mail-io1-f47.google.com with SMTP id y18so24212120ioc.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 14:42:22 -0700 (PDT)
X-Received: by 2002:a6b:3f02:: with SMTP id m2mr19822413ioa.136.1632174141824; 
 Mon, 20 Sep 2021 14:42:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210918102058.v5.1.I2351df94f18d5d8debc22d4d100f36fac560409a@changeid>
 <20210918102058.v5.2.Ifcb5df5de5b1cead7c99e0f37b044ef5cfc69eda@changeid>
 <YUZMNIYbT7KL3qJR@ravnborg.org>
In-Reply-To: <YUZMNIYbT7KL3qJR@ravnborg.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 20 Sep 2021 14:42:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WXSdaTn1K+qCYPpyo-fP8FHQOjrKn17yd8hrZzf65zHg@mail.gmail.com>
Message-ID: <CAD=FV=WXSdaTn1K+qCYPpyo-fP8FHQOjrKn17yd8hrZzf65zHg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] drm/bridge: parade-ps8640: Add support for AUX
 channel
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Philip Chen <philipchen@chromium.org>, LKML <linux-kernel@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
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

On Sat, Sep 18, 2021 at 1:29 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Philip,
> On Sat, Sep 18, 2021 at 10:21:17AM -0700, Philip Chen wrote:
> > Implement the first version of AUX support, which will be useful as
> > we expand the driver to support varied use cases.
> >
> > Signed-off-by: Philip Chen <philipchen@chromium.org>
>
> Patch is:
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

I'm curious: did you mean "Signed-off-by" or "Acked-by" here?

-Doug
