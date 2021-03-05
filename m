Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A670732EF31
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 16:42:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046DA6EBA0;
	Fri,  5 Mar 2021 15:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 463E06EBA0
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 15:42:50 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id x10so2341008qkm.8
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Mar 2021 07:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0yV7w8lFfqbTYmvCeqaDZrkMh+QKf4ua1fYumR1UcKc=;
 b=F6SAI2tnULetz3th26nEFSei84A+5/Gay++NqJcsy0GFDLlWIIsqXy2OuBCr6X8SVj
 h02R5IOAhuvDQDalhmwrws3iQJJy8gPPXxshlmBbcXT2B/ebFBdjA9NbXyyWfw7w0SMA
 ZWTCuEb+r5LYLR8gJj/5R8u3QTTfBfmFq33iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0yV7w8lFfqbTYmvCeqaDZrkMh+QKf4ua1fYumR1UcKc=;
 b=cyV3sfgsMQvuudkwg9I116gErPU1EF+u9I7HGM/YxPfVEgetyBtvU8WM4RWhv7ndRY
 8fygpdVPJLpbuLykZDW3aE8ZuHHDKBL7SUV/pJLDzd0+/otk5w2eEw0Sp8uEiCfikhuC
 AyRsEcYLZ1BIMxVtP1oqsWdyI2kEwvGakz3Vr0aunXtL/UGYeAv0ZZIoRqYPQHHyXPSW
 aAwgJIpIvgif8yc/qT4lbXIMt+QB1NhFOebgsNjaLK+IPe0R7AawVogR6mTczNAM1/iS
 1KHOgkpy4LBOXgW6BT+EHicRk/qDd+3QYCr8NmaRWWORvfgTcLQXzQxVsHDCm7RlrmZj
 +DTg==
X-Gm-Message-State: AOAM532xuHZ55csX5iH+c6da630N0oSll/Q51WD0O/1L091TK3YkkqXn
 iPPKLlVDwtSne2/q28+6UhtLavF4lXB+RA==
X-Google-Smtp-Source: ABdhPJzUKQ8KXdJ4rTIBm39hmJfqg/NW9gKsphsYMgkfGOmkgB88DR5/rpYq0alDh7mNoPsPKXpuJQ==
X-Received: by 2002:a37:9b82:: with SMTP id d124mr9430839qke.489.1614958968928; 
 Fri, 05 Mar 2021 07:42:48 -0800 (PST)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com.
 [209.85.219.182])
 by smtp.gmail.com with ESMTPSA id n5sm1891443qkp.133.2021.03.05.07.42.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 07:42:47 -0800 (PST)
Received: by mail-yb1-f182.google.com with SMTP id u75so2366393ybi.10
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Mar 2021 07:42:47 -0800 (PST)
X-Received: by 2002:a25:ab54:: with SMTP id u78mr15215866ybi.276.1614958967269; 
 Fri, 05 Mar 2021 07:42:47 -0800 (PST)
MIME-Version: 1.0
References: <20210115224420.1635017-1-dianders@chromium.org>
In-Reply-To: <20210115224420.1635017-1-dianders@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 5 Mar 2021 07:42:35 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vwgd0FeKThVRHQjne9npRjojAWpkY4O4nXr=_vDcEK9g@mail.gmail.com>
Message-ID: <CAD=FV=Vwgd0FeKThVRHQjne9npRjojAWpkY4O4nXr=_vDcEK9g@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] drm/panel-simple: Patches for N116BCA-EA1
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
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
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi folks,

On Fri, Jan 15, 2021 at 2:44 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> This series is to get the N116BCA-EA1 panel working. Most of the
> patches are simple, but on hardware I have in front of me the panel
> sometimes doesn't come up. I'm still working with the hardware
> manufacturer to get to the bottom of it, but I've got it working with
> retries. Adding the retries doesn't seem like an insane thing to do
> and makes some of the error handling more robust, so I've gone ahead
> and included those patches here. Hopefully they look OK.
>
> Changes in v2:
> - Set the "unprepared_time" so if we retry we give the proper delay.
> - ("drm/panel-simple: Don't wait longer for HPD...") new for v2.
> - ("drm/panel-simple: Retry if we timeout waiting for HPD") new for v2.
> - ("dt-bindings: dt-bindings: display: simple: Add N116BCA-EA1") new for v2.
> - ("drm/panel-simple: Add N116BCA-EA1") new for v2.
>
> Douglas Anderson (5):
>   drm/panel-simple: Undo enable if HPD never asserts
>   drm/panel-simple: Don't wait longer for HPD than hpd_absent_delay
>   drm/panel-simple: Retry if we timeout waiting for HPD
>   dt-bindings: dt-bindings: display: simple: Add N116BCA-EA1
>   drm/panel-simple: Add N116BCA-EA1
>
>  .../bindings/display/panel/panel-simple.yaml  |  2 +
>  drivers/gpu/drm/panel/panel-simple.c          | 84 +++++++++++++++++--
>  2 files changed, 80 insertions(+), 6 deletions(-)

While this isn't massively urgent, I'm hoping to get some confirmation
that it's still in someone's queue to look at.  A quick "it's still in
my queue" would be much appreciated!  :-)  If I don't hear anything
then I guess next week I'll see if I can find other ways to poke folks
or find a different route to land this series.  Thanks!

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
