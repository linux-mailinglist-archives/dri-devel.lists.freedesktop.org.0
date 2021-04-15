Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C15935FF3A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 03:23:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFF796E98D;
	Thu, 15 Apr 2021 01:23:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7572B6E98C
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 01:23:16 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id o5so23703113qkb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 18:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=or2E+Xrz/yrj3CbSRghlqeF1cBqT6BkZhveQdh84YTM=;
 b=dr3mDQfITiSC1Xe8vhYBkB/3AZe6OSEASYIUILrz/7HZvYfnBmMT/gH8v92ltFTKIu
 AgdL3RA1GZEtAA8Hzgt98fThu/Qn1Q8wEKSPjgueKRNz+hJ/JHSgQ5LFlIvVEEAQEf/S
 aKevGJb+16n4efb/8Bk+p1IrucLytBbNXsIgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=or2E+Xrz/yrj3CbSRghlqeF1cBqT6BkZhveQdh84YTM=;
 b=txo2FhNExSX7Oz557EV3Lu5/zd66LQz9/VA0cOd1CTgP5gqTVgSORCkczVHRQd0cY6
 E1GGIZ8elh6Td0p0w6BXGm+rB+Gj7I72agmFzrl4FlOHZJvcJqdKTnY8v/5/gfKj6FZ8
 k5YF5QX8JllBNW50mjX1FvDr+rXZlI4T7lgUd+IOAySmBv7h8GkdhcSo9AWa79cVCAoj
 LIHVGX0tkeSisqGfpEojVTTb6YZMIMDxw7OOnK2zwqjen+tunBAu5jO26hJ/Hd6Z/AYn
 J9tidfCHFJnNwOJJ8xolDbzakCvh7ftuhn7CX1bZO7ZKwgZ+pukbc5Lo5mX/v2fh5jqv
 4sPw==
X-Gm-Message-State: AOAM531QeuE3XZkCJaxWkCLrj7v9rtgN7DDPKS3DlKStV6eYJDeuZDw8
 QNqHdSBAOY8xWP/yG7de3oHdhobsc4rygw==
X-Google-Smtp-Source: ABdhPJyjmbm8kiA3xcj+y6W+58gC0usZ5OtojCTXM/b35einStU6AT1T5gYlLIiJQNEi0Yz+cP4BTw==
X-Received: by 2002:a37:7d84:: with SMTP id y126mr1215425qkc.155.1618449791147; 
 Wed, 14 Apr 2021 18:23:11 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175])
 by smtp.gmail.com with ESMTPSA id f9sm825354qkk.115.2021.04.14.18.23.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 18:23:09 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id z1so24282595ybf.6
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 18:23:09 -0700 (PDT)
X-Received: by 2002:a25:d847:: with SMTP id p68mr1088600ybg.345.1618449788793; 
 Wed, 14 Apr 2021 18:23:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210402222846.2461042-1-dianders@chromium.org>
 <20210402152701.v3.12.I9e8bd33b49c496745bfac58ea9ab418bd3b6f5ce@changeid>
 <YHePsQgqOau1V5lD@pendragon.ideasonboard.com>
In-Reply-To: <YHePsQgqOau1V5lD@pendragon.ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 14 Apr 2021 18:22:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X=XixXONS9D4CRxku4VuKa2pYniSjzSoX_NXkDW-J15g@mail.gmail.com>
Message-ID: <CAD=FV=X=XixXONS9D4CRxku4VuKa2pYniSjzSoX_NXkDW-J15g@mail.gmail.com>
Subject: Re: [PATCH v3 12/12] drm/panel: panel-simple: Use runtime pm to avoid
 excessive unprepare / prepare
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Apr 14, 2021 at 5:58 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Doug,
>
> Thank you for the patch.
>
> On Fri, Apr 02, 2021 at 03:28:46PM -0700, Douglas Anderson wrote:
> > Unpreparing and re-preparing a panel can be a really heavy
> > operation. Panels datasheets often specify something on the order of
> > 500ms as the delay you should insert after turning off the panel
> > before turning it on again. In addition, turning on a panel can have
> > delays on the order of 100ms - 200ms before the panel will assert HPD
> > (AKA "panel ready"). The above means that we should avoid turning a
> > panel off if we're going to turn it on again shortly.
> >
> > The above becomes a problem when we want to read the EDID of a
> > panel. The way that ordering works is that userspace wants to read the
> > EDID of the panel _before_ fully enabling it so that it can set the
> > initial mode correctly. However, we can't read the EDID until we power
> > it up. This leads to code that does this dance (like
> > ps8640_bridge_get_edid()):
> >
> > 1. When userspace requests EDID / the panel modes (through an ioctl),
> >    we power on the panel just enough to read the EDID and then power
> >    it off.
> > 2. Userspace then turns the panel on.
> >
> > There's likely not much time between step #1 and #2 and so we want to
> > avoid powering the panel off and on again between those two steps.
> >
> > Let's use Runtime PM to help us. We'll move the existing prepare() and
> > unprepare() to be runtime resume() and runtime suspend(). Now when we
> > want to prepare() or unprepare() we just increment or decrement the
> > refcount. We'll default to a 1 second autosuspend delay which seems
> > sane given the typical delays we see for panels.
> >
> > A few notes:
> > - It seems the existing unprepare() and prepare() are defined to be
> >   no-ops if called extra times. We'll preserve that behavior.
>
> The prepare and unprepare calls are supposed to be balanced, which
> should allow us to drop this check. Do you have a reason to suspect that
> it may not be the case ?

No, it was just code inspection. The old code definitely made an
effort to make enable of an already enabled panel a no-op and disable
of an already disabled panel a no-op. This is even before my
(somewhat) recent patch to make things timing based, though I did
touch the code.

Can I maybe suggest that getting rid of the extra check should be a
separate patch after this one? Then if it breaks someone it's easy to
just revert that one and we can still keep the runtime pm?


> > - This is a slight change in the ABI of simple panel. If something was
> >   absolutely relying on the unprepare() to happen instantly that
> >   simply won't be the case anymore. I'm not aware of anyone relying on
> >   that behavior, but if there is someone then we'll need to figure out
> >   how to enable (or disable) this new delayed behavior selectively.
> > - In order for this to work we now have a hard dependency on
> >   "PM". From memory this is a legit thing to assume these days and we
> >   don't have to find some fallback to keep working if someone wants to
> >   build their system without "PM".
>
> Sounds fine to me.
>
> The code looks good to me. Possibly with the prepared check removed,
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
