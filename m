Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE13459041
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 15:32:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D0D89CDB;
	Mon, 22 Nov 2021 14:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7CA489CDB
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 14:32:02 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id e3so77786944edu.4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 06:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gajZMBY4OmmSIwG5nk0u4uIpy5I6ZsgU5YpQ3lkosZI=;
 b=B+6NwM2Bszy8j0ug17BUZrCJ5pnQC2GbZUdIWWy1MPa+aHZFwKk4JhMDQ4vybuBT7M
 dJc3rcf6XSTyT4w7fAGOzA+yCU1K+5Sf2vKDDW9/ljyulsN5CajIEC8/bsIdUxJNDPeF
 Xl2cPSri1p0rhez2d07TMd7MA0UK/abSi4kfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gajZMBY4OmmSIwG5nk0u4uIpy5I6ZsgU5YpQ3lkosZI=;
 b=CbnhYeCG1bP5rTgWLIDTLGLUpf6vilqA//d/TgVEjWwyAJ4O2PKW3PqnxpvC0XPRqJ
 aqYCgiteJbRBkA73dCXv2WomvCwvcJl2i7NtYvu71HA/EapDu21Qu5+co7IY2nevAkeL
 Eo3OAPeX081r061uXpzsL56aMqk2r7ATxmyqkGWNIsSuUP7UmTm0Y+UBzZ5AS6QI7BND
 n/dh2ax8pgjeSrn7HBDiFfzzCJSuPawMMpLga6ZYNfBoXTznXYK8g/kGZRo3vVRJepY0
 YPKhTEYqOXWh/AG8SS8Mm5aIFXK32EHZFsoGk5ajFb43Nf+lihLBzdISSqUSCdTmmKh5
 tl/w==
X-Gm-Message-State: AOAM5301fdiTy0F0LUWDiKfgBF74iW62webTITKycNfhrOgRiTTLi67n
 ebdZGKj3sa34KLWyzPua7nCefbl8q4GQI+akXCkA0g==
X-Google-Smtp-Source: ABdhPJxjVipWHM7v1FJkIEB3suhUlU/PuhSYS1Q+BzAUSUrMI7c+qim7xUaZfxA3QmRmZrKJgvy6fguh+p5u+AyflhE=
X-Received: by 2002:aa7:dd53:: with SMTP id o19mr65465715edw.369.1637591518741; 
 Mon, 22 Nov 2021 06:31:58 -0800 (PST)
MIME-Version: 1.0
References: <20211122065223.88059-1-jagan@amarulasolutions.com>
 <20211122065223.88059-5-jagan@amarulasolutions.com>
 <20211122100759.qw6lvwb33ciemg2y@gilmour>
 <CAMty3ZDDQR-OkjqEfb1ZYZG+oLN2ZOv-2GLxs3AdeDHqUD8fjQ@mail.gmail.com>
 <20211122132847.ds4gtk2unq3fkagy@gilmour>
 <CAMty3ZAzwKtABZqJhVDmgOVpnZFg66z6Bc_pn3Fm9=658RPG1g@mail.gmail.com>
 <20211122140929.22cmvnxxapp752ic@gilmour>
In-Reply-To: <20211122140929.22cmvnxxapp752ic@gilmour>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 22 Nov 2021 20:01:47 +0530
Message-ID: <CAMty3ZBOYRJ5ScrYEKoA9e1hP9=yuKuASvXyorB_kLsp26Fe3A@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] drm: sun4i: dsi: Add mode_set function
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, linux-sunxi@googlegroups.com,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 22, 2021 at 7:39 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Mon, Nov 22, 2021 at 07:21:57PM +0530, Jagan Teki wrote:
> > > It's perfectly valid to dereference the pointer in atomic_enable, and
> > > that patch would consume memory for no particular reason.
> >
> > Again, I'm not pointing any mistake in dereference and certainly not
> > understand about what memory consumption issue here.
>
> You add a struct drm_display_mode field to struct sun6i_dsi. It
> increases the size of struct sun6i_dsi of sizeof(struct
> drm_display_mode).
>
> > I'm doing it here since I'm doing it via mode_set in other drivers. No
> > problem for me either way.
>
> But *why* are you doing so?
>
> There might be a valid reason in other drivers, but there's none here
> (that you mentioned at least).

The reason is to use existing bridge function instead of dereference
ie what I've mentioned. I don't have any other reasons.

Jagan.
