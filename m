Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0276B509E4C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 13:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0507F10E7A6;
	Thu, 21 Apr 2022 11:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B36410E7D1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 11:10:57 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id h12so850872plf.12
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 04:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5mDQNWE6CHbxD5RppFkYKwLi4HSMIbAeHaJuTv1BRD0=;
 b=joxbRWZL34N6wRmRFL2QNDESl9kKHHoFkc1TBgwu+vOWLqbwgebGY0J7IWsC8OOslo
 63Zae0O30/OtzO36UDhvAdh8gyewNzrbrj2obOs5mJwZTZZsbAHk2npZU7hsVtoaO3x2
 osrwOz0/jFx4rLKbiqrQ1wEq2YachOZLh966JhbWuH8gjTffQrekJ3eBKgJCUmE64rJX
 s+2+D906rSGh3+yZhvBMg8eHbyKPjRqzEPLUNKw3Ad2C+rvo5u32rrihqSq1I32gBSAj
 sqNWvJkqyMVWRCAZFcrcP8AhKgjGrFGuwbVweJEva+dzwMuDJFrWQiNW65CtqbBgjZ/o
 bKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5mDQNWE6CHbxD5RppFkYKwLi4HSMIbAeHaJuTv1BRD0=;
 b=COge8GAxd5Y+vkHEXaFllsoWPj6O4EDJ7lCZihG0Uz+5izPdsStA4v0/73VQyJisKP
 Wcps1qD7IATT21ZmHDzKLjmn2TkgbbRC1gSChlNBHRusqUvLpBSNYqVzuNxwBE2sKqUU
 JRjyNwBfGvTnua5KiLSvQdTtBVuut4T4g++Wl5f8BDdlJTVA+4VHbvI5lJZNxYXJJsAY
 F4Udiol6QnLtonm64shOz4V1grJVqGRUxDowL1AxZKScJp/qIHF88a2PDyjlGj81u6we
 a51w/DmVo/rGVMNw3GzJRwebekT8M6Gc+FfO+7XsggMkd60PPNsulw5EVqURFaAVNJpN
 tkkQ==
X-Gm-Message-State: AOAM533ge3QxWgG8nD1MyKeERotsBYtgBPH7eZYpEZ6CeTXoWaWzNr6t
 aOLxLq2GxXjJQQXfz25HfhjL9sF7G1aGapYybso=
X-Google-Smtp-Source: ABdhPJzBAjIJ/bWhTBjQlovjTGFiTqWvWgSvsp2xnthBIu2Xzx4vXVzEqaIo6lVNO66mFWxCZ6tswhnESYJYESjQ83Q=
X-Received: by 2002:a17:90a:3e48:b0:1cd:34ec:c72f with SMTP id
 t8-20020a17090a3e4800b001cd34ecc72fmr9897582pjm.65.1650539456849; Thu, 21 Apr
 2022 04:10:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220409042321.3184493-1-james.hilliard1@gmail.com>
 <CAMeQTsanEow=zq=MuZLjMqpzybdS=5S0=JrkxuCdT7d5MxpEWQ@mail.gmail.com>
 <CADvTj4rBKzGFch8iVzHu1s+6=P0PcLEwoFi74xd_ormEX+2rMA@mail.gmail.com>
 <CAMeQTsaM363n5F=--xhSTayFqOMNvjTQjqz_aEhby6i-KRVBKQ@mail.gmail.com>
 <CADvTj4o_zyVZxaBz0+kRUF30OW3SKFMuo87r6FE9Qkfn1dVsBw@mail.gmail.com>
 <CAMeQTsbKMxQcDsDRqHsMwqU1BnrcOLwtU7uOrB-1E0z65P79-w@mail.gmail.com>
 <CADvTj4rR5zt5iFTDrrYfNQ267KV896dHnjJHx6yq=e10+V_Okg@mail.gmail.com>
 <CAMeQTsZyp40ybkNxnYDCR=pvXRzWvtBLkT+i4VPyjNiwwWg0-A@mail.gmail.com>
 <CADvTj4rtFzOSCG0nPCTxqhNfVcDLX3JuY4QGTS24m79VGWfWVQ@mail.gmail.com>
In-Reply-To: <CADvTj4rtFzOSCG0nPCTxqhNfVcDLX3JuY4QGTS24m79VGWfWVQ@mail.gmail.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Thu, 21 Apr 2022 13:10:44 +0200
Message-ID: <CAMeQTsYA_9MFDLAFoPKnQYsq3sRgJjFOwYO0K_9zbwfkm9EW0g@mail.gmail.com>
Subject: Re: [PATCH v3] drm/gma500: depend on framebuffer
To: James Hilliard <james.hilliard1@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Randy Dunlap <rdunlap@infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 20, 2022 at 1:42 AM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> On Tue, Apr 12, 2022 at 3:30 AM Patrik Jakobsson
> <patrik.r.jakobsson@gmail.com> wrote:
> >
> > On Tue, Apr 12, 2022 at 3:48 AM James Hilliard
> > <james.hilliard1@gmail.com> wrote:
> > >
> > > On Mon, Apr 11, 2022 at 3:27 AM Patrik Jakobsson
> > > <patrik.r.jakobsson@gmail.com> wrote:
> > > >
> > > > On Sun, Apr 10, 2022 at 10:05 PM James Hilliard
> > > > <james.hilliard1@gmail.com> wrote:
> > > > >
> > > > > On Sun, Apr 10, 2022 at 1:52 PM Patrik Jakobsson
> > > > > <patrik.r.jakobsson@gmail.com> wrote:
> > > > > >
> > > > > > On Sun, Apr 10, 2022 at 9:40 PM James Hilliard
> > > > > > <james.hilliard1@gmail.com> wrote:
> > > > > > >
> > > > > > > On Sun, Apr 10, 2022 at 1:36 PM Patrik Jakobsson
> > > > > > > <patrik.r.jakobsson@gmail.com> wrote:
> > > > > > > >
> > > > > > > > On Sat, Apr 9, 2022 at 6:23 AM James Hilliard <james.hilliard1@gmail.com> wrote:
> > > > > > > > >
> > > > > > > > > Select the efi framebuffer if efi is enabled.
> > > > > > > > >
> > > > > > > > > This appears to be needed for video output to function correctly.
> > > > > > > > >
> > > > > > > > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > > > > > > >
> > > > > > > > Hi James,
> > > > > > > > EFI_FB is its own driver and not needed by gma500 to drive its
> > > > > > > > hardware. What makes you think it's required?
> > > > > > >
> > > > > > > I wasn't getting any HDMI video output without it enabled for some reason,
> > > > > > > I assume it is doing some sort of initialization needed by gma500
> > > > > > > during startup.
> > > > > >
> > > > > > Then it sounds like you might just be using EFI_FB and not gma500. Can
> > > > > > you provide the kernel log with drm.debug=0x1f set on kernel
> > > > > > command-line.
> > > > >
> > > > > Seems efifb loads first and then hands off to gma500
> > > >
> > > > That is how it normally works but efifb shouldn't change the state of
> > > > the currently set mode so shouldn't affect gma500.
> > > > From the logs I can see that you have LVDS (internal panel), HDMI and
> > > > DP (3 displays in total) connected. This sounds wrong. Your version of
> > > > gma500 (Cedarview) doesn't support more than 2 crtcs/pipes. This might
> > > > be a problem.
> > >
> > > Yeah, there's a bug there with the connector status, only DVI-D-1 is actually
> > > connected, I have DP-2 and LVDS-1 turned off in weston.
> >
> > Ok, but are the connectors physically connected to anything?
>
> There is one HDMI cable physically connected to the board
>
> > Regardless of what you do in Weston, the connectors shouldn't be
> > getting modes if they aren't used.
>
> Yeah, it seems there's a bug there, not sure if that's related to the
> output failure when efifb isn't available.
>
> > LVDS might be from VBIOS but I'm
> > not sure where the DP modes come from. It would help if you also
> > provide kernel logs with drm.debug=0x1f when the outputs doesn't work
> > so I have something to compare with.
>
> Log with efifb/fb not enabled in kernel build which causes no
> HDMI output:

After examining the logs I cannot see anything that stands out except
for fbdev emulation not being enabled. Are you sure you just don't
need to compile your kernel with FB support (CONFIG_FB)? If you are
running weston on the fbdev backend then you would obviously not get
any output if FB is not compiled into the kernel.
