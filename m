Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C514D405D5E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 21:33:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5357D6E900;
	Thu,  9 Sep 2021 19:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C4B56E900
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 19:33:21 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id y18so3834515ioc.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Sep 2021 12:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d2IYAT4zf02RWUNDruz7+0lDEcO/Nb9ZtTNr33lXbog=;
 b=PB5fXArkN11kuDGlOpAY2Uq87Zlrf8VbZJFzYvAFZT5RhsN545UOJp9+uNPzoeyM4e
 xib37Uo5ToG8XyCVLrJOQ4PDCnYiw5xizwwq+G6OOivyUUmST8sQwFsRyMOYc+l6DO7M
 8h86v98MDD+4tMscf29L5z/MJV5FVN/5OoQlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d2IYAT4zf02RWUNDruz7+0lDEcO/Nb9ZtTNr33lXbog=;
 b=bn8Tz/XWFwNkqJ0QIoDaA6Z+3HIyAdAaugB/Yqe9wMUTbrbV2R/AFLLRgtYrQZ/wO1
 jIgm6iBEZpugGKZzBcZsqJvcGqGiDDJ9GCHlM+5zs0XyaN7crfcLK+lmeZ5XN3HHGBan
 Jna40O5R6Kat/i8Yeb7Q5xgykKqYkao+1KJotH7jCMXM+LBVm0GCVKlwOPj7YhJjmrjx
 Yt2zXHeqPcTc6od/JMisDE5tIcML+1qhSWn3nJkm3fSEbOgrAf+6v7hWNyTPeFFXCNN9
 Ga+e5jENerIgVEZ0NABh3OyXU5yryV4hCOpscV5/WPAp4NoKeDHk0D5BKeU2eXXuGXvU
 V3Eg==
X-Gm-Message-State: AOAM532z17n/jBV3wKwfjSeyrtqVBXW5LUg9yXYMWnnzw8i0IEshAh9n
 dzJmqo6Jcq0LkueEW4i0OooTYXh7M0/4CA==
X-Google-Smtp-Source: ABdhPJx4EbiD6+zOMGWsZGeNG6/x6cbV0pLQz35dBnnYNphdfbJ/o8bRePw91NL9XwLIb9tFpdO21g==
X-Received: by 2002:a05:6638:a2d:: with SMTP id
 13mr1330576jao.12.1631216000677; 
 Thu, 09 Sep 2021 12:33:20 -0700 (PDT)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com.
 [209.85.166.173])
 by smtp.gmail.com with ESMTPSA id e13sm1373532iod.36.2021.09.09.12.33.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Sep 2021 12:33:20 -0700 (PDT)
Received: by mail-il1-f173.google.com with SMTP id u17so3085904ilm.13
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Sep 2021 12:33:20 -0700 (PDT)
X-Received: by 2002:a05:6e02:e02:: with SMTP id
 a2mr3620736ilk.180.1631215999852; 
 Thu, 09 Sep 2021 12:33:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210901201934.1084250-1-dianders@chromium.org>
 <20210901131531.v3.5.I0a2f75bb822d17ce06f5b147734764eeb0c3e3df@changeid>
 <YTUPiyOjsUJXN11h@ravnborg.org>
In-Reply-To: <YTUPiyOjsUJXN11h@ravnborg.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 9 Sep 2021 12:33:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VbYcdSqxLHdSaDPh=X0hbW6VWV0mM-iFy3k0J1q+6MWg@mail.gmail.com>
Message-ID: <CAD=FV=VbYcdSqxLHdSaDPh=X0hbW6VWV0mM-iFy3k0J1q+6MWg@mail.gmail.com>
Subject: Re: [PATCH v3 05/16] drm/panel-simple-edp: Split eDP panels out of
 panel-simple
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linus W <linus.walleij@linaro.org>, Daniel Vetter <daniel@ffwll.ch>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Steev Klimaszewski <steev@kali.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>
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

On Sun, Sep 5, 2021 at 11:42 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> > +++ b/drivers/gpu/drm/panel/panel-simple-edp.c
> > @@ -0,0 +1,1298 @@
> > +/*
> > + * Copyright (C) 2013, NVIDIA Corporation.  All rights reserved.
> > + *
> > + * Permission is hereby granted, free of charge, to any person obtaining a
> > + * copy of this software and associated documentation files (the "Software"),
> > + * to deal in the Software without restriction, including without limitation
> > + * the rights to use, copy, modify, merge, publish, distribute, sub license,
> > + * and/or sell copies of the Software, and to permit persons to whom the
> > + * Software is furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice (including the
> > + * next paragraph) shall be included in all copies or substantial portions
> > + * of the Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> > + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> > + * DEALINGS IN THE SOFTWARE.
> > + */
> Would be nice if you could use the SPDX thingy for the license.

I'm going to leave this alone. I definitely started this driver by
copy-pasting the panel-simple.c file and it still shares a lot of
lines of code with that driver. It feels like that qualifies for the
"substantial portions of the Software" portion which tells me to
retain the license. I also kept Thierry as the author since, again,
it's really a splitting of the existing driver and not the creation of
a new driver. In fact, if I were to assign a new author/license to
panel-edp, one could also make the argument that I should assign a new
author/license to panel-simple. panel-simple got ~50% of the old
panels and panel-edp got the other ~50% of the old panels plus a
search-and-replace of "simple" for "edp" and some code deletion. I
don't think search-and-replace name change nor code deletion is
justification for claiming authorship. ;-)

If Thierry wants to chime in and say that I should put down a
different license for either of the two files, though, I'd be glad to
change it.

-Doug
