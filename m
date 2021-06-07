Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C558839E7C1
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 21:52:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 405026E52F;
	Mon,  7 Jun 2021 19:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41AE86E52F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 19:52:06 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id s12so13543663qta.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 12:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xk91dC/O3WfbMVJ0MR60noj+ac+ZfTNOCBFRr8BAYnY=;
 b=e4XMERE2pHwkqOX6A7gnFQ7A82TuXJWuSb8nkeeIgpy9kZbMuwmrGAjioIvn3dzFih
 mbXXqMNyCj+Eiz5bg5+GG3FlBd6/jTCG6j5r1oVnnJmAB76mRNV/EX9LhgmP/KlkJYuT
 oaub2FWgoYwv5cd2io6grgVdi8W+pw+CJUnIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xk91dC/O3WfbMVJ0MR60noj+ac+ZfTNOCBFRr8BAYnY=;
 b=Oog4gWQzBWyB3YpaIV8XWmF2zRVuZVefzpI0EjkwPGui0Ot/wM9TAGVVG23/iiVpeY
 GlDDG+NY14bxvrTQVcw8Pdso7jtyUq3PFGi9rhMdYKu0OOiCcwkM+ssRX/DpC2Hsg4Iq
 cbyPss/hVVx4W7LQtSBqJhaULgAMTjujPzDbiP1BmLlBAjx4zE/2qR1RV09gF2FgDfSl
 HWkyo4JI+IID4KFsZjAOwDfagGAkRU4yJx4dDdEVhph1fZ+DQlvUq/p1oYmt4/jsCKVW
 DYKBmRS5COKoRX4Py8m/PKRcGOhS0h57uuRCEnZ1RFglf1fsnWQw9PgSUdui779m8cho
 tH2w==
X-Gm-Message-State: AOAM5312nvDa9fVzkWYkHEJYo1zthrduDFP5gDSXZd8kH6uWMh9LSTNL
 8Kbrc4ZQFoG8Kwdk+kyLnnD0f5KtAhc1YQ==
X-Google-Smtp-Source: ABdhPJzW3TVNHmMlLysRJqhDAULTcffz5vf2BBgiFODzBsRoNDuYHLBId6GQRlzghnOx2/AjlK0qZg==
X-Received: by 2002:ac8:6b92:: with SMTP id z18mr17855457qts.26.1623095524847; 
 Mon, 07 Jun 2021 12:52:04 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com.
 [209.85.219.176])
 by smtp.gmail.com with ESMTPSA id v5sm10376359qkh.39.2021.06.07.12.52.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 12:52:04 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id i6so12101926ybm.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 12:52:04 -0700 (PDT)
X-Received: by 2002:a5b:54a:: with SMTP id r10mr26221474ybp.476.1623095523684; 
 Mon, 07 Jun 2021 12:52:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210531102838.2423918-1-linus.walleij@linaro.org>
 <CAD=FV=XHzqi67_bf0EUCF=cgzGt-uX=+-ehkOfjm32Wg8YBt5Q@mail.gmail.com>
 <CACRpkdYvdPBWm8zc5EB9iEXoCXFv=0VwPXvLTxNXAoV3RbsYZw@mail.gmail.com>
In-Reply-To: <CACRpkdYvdPBWm8zc5EB9iEXoCXFv=0VwPXvLTxNXAoV3RbsYZw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 7 Jun 2021 12:51:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VbLTf4kiTSG_Ffv+nS0-L27M_iGeTJv8bE9q1iisHHvA@mail.gmail.com>
Message-ID: <CAD=FV=VbLTf4kiTSG_Ffv+nS0-L27M_iGeTJv8bE9q1iisHHvA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: db7430: Add driver for Samsung DB7430
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Jun 4, 2021 at 4:19 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Jun 1, 2021 at 11:31 PM Doug Anderson <dianders@chromium.org> wrote:
>
> > Still hoping that this can work atop DBI so we can avoid the raw SPI
> > writes. You said you're trying for it for v3 so I'm looking forward to
> > checking it out there.
>
> Struggling with this. The DBI bus is only used by tiny DRM
> for the panel drivers that are jitted with that display controller
> ATM. No normal panel driver is using it.

:( So how about this, then?

* If someone more senior than me in DRM says it's fine to just do this
directly for now then I have no objections. It'd be nice to mention
that this is actually DBI "type c1" somewhere in the comments, but
other than that the direct SPI stuff is OK.

* If there are 3+ other panels drivers that you can point to that
directly use SPI functions for DBI like you are doing then I'm OK w/
it too even if nobody more senior signs on w/ it. Presumably if there
are at least 3 already then someone else has already signed on to the
fact that this is fine to do. It'd still be nice to do a cleanup but
presumably that could all be done at the same time.

* If you're the first or second or third panel driver that's doing
this directly with SPI commands then it probably makes sense to pause
and figure out how to use DBI right now before more drivers come
around and copy the code.

Hopefully that sounds OK.

-Doug
