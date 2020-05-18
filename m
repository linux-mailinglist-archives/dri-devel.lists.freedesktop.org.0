Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D31601D84A8
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 20:14:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA11A6E0B7;
	Mon, 18 May 2020 18:14:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC39B6E0B7
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 18:14:15 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id z18so8927556qto.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 11:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c3UXUPcrt3P6Bgw39Gw3bWHJNGcf+91G7bjcoOjFILM=;
 b=li91YZRk4xYKI9MXE0tWUzbZMwcWG60O5oELkyNKU4sTYVNPY20T5Tu/2C4PXO0pSb
 metKaUg3abydKAsYDkjq5QAPkQqK7PqGeCwzCrjMqbAJG1JvjKQ0vB5xZdrqIZcj7Gph
 UoleVSIHc/fp4FoD48l5IFZcAOxm20aQrn4GE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c3UXUPcrt3P6Bgw39Gw3bWHJNGcf+91G7bjcoOjFILM=;
 b=Z2zPTwQPBmR2QSg5q0lSg/EgyEpOlqz0Cs84XSTdNplLpvANUrbCu1DeYWKXI4GtSd
 RDIkm7k+oqUDRJLXcLKOWl0pkSEyGodd9aBFuUc+cv2EhOONeumq7JYWEEjEHmlLIk4M
 QiDdb72Xao9/hM76ngF48krhsspiDKokQgyFr9xD2x0RFfBZKQR42V2wRWEhPXE7+Boy
 Os+bWeWT9QmPe9Kg3xNblhtxpMO7TvujnegSs9vp0fJ2pRm9mmgymxX3+QWTa1Xjv8TW
 Eac0Ccjxn3S1FE0L4C7s/InkjTdtFNXPnZedUDGN3/5fjCCxH6zx9Pt4KBwBQ/zvePVV
 L+lQ==
X-Gm-Message-State: AOAM530rgkf13+r1wiRxqSisxkqV6hDxttFQxE2reN4uezDnug+2q9aD
 NVwIq1jroytf/lsPXL+TkoqbXcUC39k=
X-Google-Smtp-Source: ABdhPJwgc+Xw+Uuab0HfL5F2zICdxf35ac1J6o89JblrcSDdB89PLy8XcDJgRouEixR6r6M6OMc1ww==
X-Received: by 2002:aed:3788:: with SMTP id j8mr17379123qtb.113.1589825654877; 
 Mon, 18 May 2020 11:14:14 -0700 (PDT)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com.
 [209.85.219.53])
 by smtp.gmail.com with ESMTPSA id p42sm8466449qtk.94.2020.05.18.11.14.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2020 11:14:14 -0700 (PDT)
Received: by mail-qv1-f53.google.com with SMTP id l3so5184057qvo.7
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 11:14:14 -0700 (PDT)
X-Received: by 2002:a1f:4e46:: with SMTP id c67mr11262026vkb.92.1589825169814; 
 Mon, 18 May 2020 11:06:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200507213500.241695-1-dianders@chromium.org>
 <20200509201511.GD30802@ravnborg.org>
 <CAD=FV=VBU7JmTdvgWjyj_ytrFmz6Gkx2OjVr1FxLh9DBG_jN6w@mail.gmail.com>
 <CAD=FV=UNuwb+YYJKw9+HNMKUNfuNFxj+Gr+yB9tXANbXAvDgCg@mail.gmail.com>
 <20200518175939.GA770425@ravnborg.org>
In-Reply-To: <20200518175939.GA770425@ravnborg.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 18 May 2020 11:05:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XmUrF3nCZF4dDom5RrWrdVe-iJocenU3cJEDx-gGkDRA@mail.gmail.com>
Message-ID: <CAD=FV=XmUrF3nCZF4dDom5RrWrdVe-iJocenU3cJEDx-gGkDRA@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] drm: Prepare to use a GPIO on ti-sn65dsi86 for Hot
 Plug Detect
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Sandeep Panda <spanda@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Rob Clark <robdclark@chromium.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andy Gross <agross@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Stephen Boyd <sboyd@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sam,

On Mon, May 18, 2020 at 10:59 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Douglas.
>
> > > Given the previous feedback from Linus W, Stephen, and Laurent I
> > > expect things are good enough to land now, but it'd be good to get
> > > confirmation (I removed some of the previous tags just to get
> > > confirmation).  If we can get review tags early next week maybe it'll
> > > still be in time to land for 5.8?
> >
> > I think all the others have reviews now.  Is there anything blocking
> > them from getting applied?
> Applied, including the small fix pointed out by Linus.

Thanks!  Ugh, I just realized what the problem was.  I posted a v6
with this fix but insanely somehow didn't CC you (!!!).  It was here:

https://lore.kernel.org/r/20200513215902.261547-1-dianders@chromium.org

I'm super sorry about that and thanks for fixing the nit.  That was
the only difference between v5 and v6.  I just checked what you pushed
and it looks great, thank you.

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
