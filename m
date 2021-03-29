Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 063E434D47D
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 18:07:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF8F6E405;
	Mon, 29 Mar 2021 16:07:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69AF36E405
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 16:07:21 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id i19so9660082qtv.7
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 09:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h2tJ34SW4jrHJri6gw67H0wvGraWyIt4USuLVf0C2eM=;
 b=GC462xaBMRhJ2Eg7lkA6WeeOnHsYjJbAp7YGB3uHNWWsUKUWq0+/KNHc6unUex7fOZ
 OyjUJ86cSqxt7XZpVIceOdbPGydX1JHY2Wo3UptaJvygqAWzsXDJwjju3fXAElFrutDI
 HIyemZPRzo1F6TDoJ53UFlWlq4YWUTEmyu6hI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h2tJ34SW4jrHJri6gw67H0wvGraWyIt4USuLVf0C2eM=;
 b=S3g/JW/QeXkPYeY26RWFYPII+TwrmblePKcMUCLQ9sdwyf0U5el5EeKdaNAzG8HnWh
 VWSQ1jCSwTgZLes/H2PlU/noJojRjSCijp3JDCdPiQFNsI2IfEyowKQTJoAxiL6FbYib
 8p78SJxowPqWLbhMKXV4JYEbrddROiRdbq/qc2ACIyMRIVrokq8uDFNFTPy4SNVZuM06
 iB9xTG/Ihq0Tn3lGHjx809sCvbSXJvmFtEbQVsRFak9yzVNwe+bcLefOqwlqCSgm4g05
 OIddKYkwJwsxaTqUWS+bMmVz5C3vhAWsuhuKJuSqbNtTVlmLkc5aXJqLsEdmHaQY7iW9
 e27Q==
X-Gm-Message-State: AOAM533v6iJ9o7Dtf51WQhTkaRrXjkEw3YAf0Gsso7SBEzMMsc9EHkpg
 AAH1AMjiHNFrpRgJENlaPgbWqP4frByKKw==
X-Google-Smtp-Source: ABdhPJza2mPtaJJYeZtBUWW63E3DRus0KRq9tE8y0wEKcZVb4NQPx988gSIVC9abqhRoXB4QtaCoIw==
X-Received: by 2002:aed:306c:: with SMTP id 99mr22782039qte.352.1617034040124; 
 Mon, 29 Mar 2021 09:07:20 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com.
 [209.85.219.173])
 by smtp.gmail.com with ESMTPSA id e2sm11272737qto.50.2021.03.29.09.07.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 09:07:19 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id m132so14323022ybf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 09:07:18 -0700 (PDT)
X-Received: by 2002:a25:69c1:: with SMTP id
 e184mr39188232ybc.345.1617034038260; 
 Mon, 29 Mar 2021 09:07:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210316140707.RFC.1.I3a21995726282f1e9fcb70da5eb96f19ed96634f@changeid>
 <YFKQaXOmOwYyeqvM@google.com>
 <CAF6AEGtu+GBwYfkH3x=UuPs5Ouj0TxqbVjpjFEtMKKWvd1-Gbg@mail.gmail.com>
 <YF3V8d4wB6i81fLN@orome.fritz.box>
In-Reply-To: <YF3V8d4wB6i81fLN@orome.fritz.box>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 29 Mar 2021 09:07:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VDKQCMtxd2NMRefxQm5uzDS6_rUVP5YsTsDEYX+jSipw@mail.gmail.com>
Message-ID: <CAD=FV=VDKQCMtxd2NMRefxQm5uzDS6_rUVP5YsTsDEYX+jSipw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] dt-bindings: display: simple: Add the panel on
 sc7180-trogdor-pompom
To: Thierry Reding <thierry.reding@gmail.com>
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
 <devicetree@vger.kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Andy Gross <agross@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Kaehlcke <mka@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Stephen Boyd <swboyd@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Mar 26, 2021 at 5:38 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> The point remains that unless we describe exactly which panel we're
> dealing with, we ultimately have no way of properly quirking anything if
> we ever have to.

Just to clarify here: with my initial proposal we actually could still
quirk things if we had to. If the quirk needed to be applied before
power on we'd just have to apply the quirk to the whole board (which
we'd have to do anyway). After the panel was powered on then we could
read the EDID and apply a quirk based on what the EDID tells us,
right?


> Also, once we allow this kind of wildcard we can
> suddenly get into a situation where people might want to reuse this on
> something that's not at all a google-pompom board because the same
> particular power sequence happens to work on on some other board.

That's a legit concern. Of course, people could already do that with
existing panels right? One would also hope that if they reused this
they also used the "more specific to least specific" rule, so someone
could reuse (without any problems) with:

compatible = "some-other-company,some-other-board-panel", "google,pompom-panel"

That doesn't seem like it would be terrible.


> Similarly I can imagine a situation where we could now have the same
> panel supported by multiple different wildcard compatible strings. How
> is that supposed to be any cleaner than what we have now?

I'm tempted to call this (same panel supported by multiple different
compatible strings) a feature, actually. Specifically:

Even if the exact same hardware is shipped with more than one board,
it may have a different EDID programmed into it. From what I've seen
the timings used on a panel may need to be adjusted based on the SoC
used (and what clock rates it can provide / features of the underlying
display driver), EMI concerns, and power consumption concerns. Once a
different EDID is programmed in it then it sorta becomes a "different"
panel, right? I think sometimes (?) panel vendors assign a slightly
different model number per board, but I'm not sure.


-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
