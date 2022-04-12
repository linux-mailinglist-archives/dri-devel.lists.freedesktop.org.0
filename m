Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CECA74FCBF7
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 03:48:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E4310FB3C;
	Tue, 12 Apr 2022 01:48:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91E510FB3C
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 01:48:07 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id e4so17651149oif.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 18:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oPrX2CAjOyKCqDAsQqHEkCRe94OKbEjEy8TsnU+5R8A=;
 b=Tz9lOvynvSS0T8uwXuQC5Hk3HnS83JDtCEYKcsHJWX9rrGEchtu9cFprNiOL+kg5wR
 G6exSArA3BnYhmr/XsjdqzJxLAtjVayYDh3+aXpCbHkLMZ1Qxb72RDO84hAiUPpXsp0J
 gTAozMh4+yxDkRiaZTj41HcrW3ggVl63h1IlNZA+t6eEy6SvjEGEA+oteDP2vC3tLZhD
 KuYzhJON2DDNVKXoY0gcl6KPOPgfVgwA9cXO2OZTff2mPACuGNCoOhj2uq4qY4tXxO3i
 p45oR3ongGVdw1rGzZ4EJpHnNwKnOlO8VemfS6VQHwuXge4a47+AFJMOqtbvBx2zywEp
 TbOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oPrX2CAjOyKCqDAsQqHEkCRe94OKbEjEy8TsnU+5R8A=;
 b=Cu+AWeGyE9mpL16ON9QGJ9XWvwhaFwpub5O9yVhRTAcymNyTzrG+LvrDJ/bdXKbW4H
 GlmvuKJpPXsLKxxmGdySvnzdtpj/4wBpUg87Cham1p2qk1eSJ/SEw/Y/D3oJMmyIdr42
 e5Fro1yrtsWGLnY5tPR0ev6fMW7oEMNZYnu3J6cm2zFjhMhALrWOrxuo23GwbwyS39qg
 6scBvHGp8H8IkQL1CeNkeJex3fSA2l6FWsPFgc1lpjGTeVRUnhIWGpBbVB/XAmrpoDv8
 bDxnufEK44pzIhc96W+fZyklY90BMFG/ltbV/PCQoDlgSxBhRN3AyRwFdM+dsv3GM11k
 yd0w==
X-Gm-Message-State: AOAM532TK74fyENyM4fNwj5W271u3dWBimUrFAY+4olAznGIt6NUk/tO
 9MZ/k7AdZ1HLA8J2bJ3uWm8d5cMkDZIuGE4Lsy8=
X-Google-Smtp-Source: ABdhPJxJFmZg+65Cg7zq3pn7r3IVdQ0+22MCSm52acOMCZR83hiXAgaakpLAHcY8OHrJc1a2OB39lhw48TMyUFV6ihE=
X-Received: by 2002:a05:6808:1528:b0:2f9:65fa:b878 with SMTP id
 u40-20020a056808152800b002f965fab878mr790075oiw.99.1649728086925; Mon, 11 Apr
 2022 18:48:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220409042321.3184493-1-james.hilliard1@gmail.com>
 <CAMeQTsanEow=zq=MuZLjMqpzybdS=5S0=JrkxuCdT7d5MxpEWQ@mail.gmail.com>
 <CADvTj4rBKzGFch8iVzHu1s+6=P0PcLEwoFi74xd_ormEX+2rMA@mail.gmail.com>
 <CAMeQTsaM363n5F=--xhSTayFqOMNvjTQjqz_aEhby6i-KRVBKQ@mail.gmail.com>
 <CADvTj4o_zyVZxaBz0+kRUF30OW3SKFMuo87r6FE9Qkfn1dVsBw@mail.gmail.com>
 <CAMeQTsbKMxQcDsDRqHsMwqU1BnrcOLwtU7uOrB-1E0z65P79-w@mail.gmail.com>
In-Reply-To: <CAMeQTsbKMxQcDsDRqHsMwqU1BnrcOLwtU7uOrB-1E0z65P79-w@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 11 Apr 2022 19:47:55 -0600
Message-ID: <CADvTj4rR5zt5iFTDrrYfNQ267KV896dHnjJHx6yq=e10+V_Okg@mail.gmail.com>
Subject: Re: [PATCH v3] drm/gma500: depend on framebuffer
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
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

On Mon, Apr 11, 2022 at 3:27 AM Patrik Jakobsson
<patrik.r.jakobsson@gmail.com> wrote:
>
> On Sun, Apr 10, 2022 at 10:05 PM James Hilliard
> <james.hilliard1@gmail.com> wrote:
> >
> > On Sun, Apr 10, 2022 at 1:52 PM Patrik Jakobsson
> > <patrik.r.jakobsson@gmail.com> wrote:
> > >
> > > On Sun, Apr 10, 2022 at 9:40 PM James Hilliard
> > > <james.hilliard1@gmail.com> wrote:
> > > >
> > > > On Sun, Apr 10, 2022 at 1:36 PM Patrik Jakobsson
> > > > <patrik.r.jakobsson@gmail.com> wrote:
> > > > >
> > > > > On Sat, Apr 9, 2022 at 6:23 AM James Hilliard <james.hilliard1@gmail.com> wrote:
> > > > > >
> > > > > > Select the efi framebuffer if efi is enabled.
> > > > > >
> > > > > > This appears to be needed for video output to function correctly.
> > > > > >
> > > > > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > > > >
> > > > > Hi James,
> > > > > EFI_FB is its own driver and not needed by gma500 to drive its
> > > > > hardware. What makes you think it's required?
> > > >
> > > > I wasn't getting any HDMI video output without it enabled for some reason,
> > > > I assume it is doing some sort of initialization needed by gma500
> > > > during startup.
> > >
> > > Then it sounds like you might just be using EFI_FB and not gma500. Can
> > > you provide the kernel log with drm.debug=0x1f set on kernel
> > > command-line.
> >
> > Seems efifb loads first and then hands off to gma500
>
> That is how it normally works but efifb shouldn't change the state of
> the currently set mode so shouldn't affect gma500.
> From the logs I can see that you have LVDS (internal panel), HDMI and
> DP (3 displays in total) connected. This sounds wrong. Your version of
> gma500 (Cedarview) doesn't support more than 2 crtcs/pipes. This might
> be a problem.

Yeah, there's a bug there with the connector status, only DVI-D-1 is actually
connected, I have DP-2 and LVDS-1 turned off in weston.
