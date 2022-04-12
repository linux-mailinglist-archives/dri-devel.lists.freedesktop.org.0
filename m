Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD144FD2FF
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 10:30:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E6A10FDD3;
	Tue, 12 Apr 2022 08:30:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 702F310FC23
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 08:30:07 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id s2so16870473pfh.6
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 01:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XWETclwf6JoUIZg5dlEwqaDblFeTlFItFp0Uo6O8hgA=;
 b=DbmUl8o/ELO24qYZcr1EjyCqfOmLogZnBKgh6+F+dnfnI6Ehteres7i2KeD2aNPpyy
 qXoJeE+weKzNTV+nfi/axUfIpPQnEIf5Vv6nCu6gnFA+9xKKN2mYrE2Vu90DkFRiwYNn
 t2xrQhuzZVrOssviGmVZ6OBXy4+qi/r2s1PF39cb+zJZuW/Zi70RyXox6I1CCm9k6wbY
 AHX2/yFxwVGdlv6csXfQJFb4vbtNzk9DdFVTqOrvEPvi9lIhlwqP7Da4TcBbK6sXTIri
 iNsZLka25gxyDS/LYMebCsARRfosbo1cXn9QNP3GSi7ptCz6P/Wf4C9Z4zsOB3ZUiqXJ
 bVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XWETclwf6JoUIZg5dlEwqaDblFeTlFItFp0Uo6O8hgA=;
 b=mHBltM+/sVMurg9IfNoo190278DERJqjQcT0SJhFApD0mGqauboV4lHAIDCMXQ5BQx
 rNeVzVAbdQVniLdXtdKQDUvPBvVN7kJVLTmiFMiE6EdG8qAb2ni2VxGdPJkFv0haPhwC
 DBfdv3mankyGiud3ZjgubhRt8tpETvFTBHLj7S3wBzjSb9FzWMgks6HfXFeZGisLc3CU
 uPL6p6atbd1LAGy6PWFUIEJ0wnYbahhboiNPw12X7+A2CgGYdWxR0QFOiXym6l/xhopg
 Px9UY7KhBPzWl/OZe/JWxNWFMJ4oXXnOUGhKLm/3r8fnaX/aymZQUQYev/F46NcKoT/b
 XptA==
X-Gm-Message-State: AOAM5331TD//0S3TftwVHVBbRdul2F3cUpvLFPLTSeorJqYoolkPz/i1
 zrkPcZkgo3n4b9RHegXWEgMikaLyri1qUim6aQwG1Lmk
X-Google-Smtp-Source: ABdhPJzlX7vyFTNnPifHlAXzBIE9Hdhxk5KyGpsJjbvDXHYtJW17Ksieg2HCtZnhyQCGQjh74BBTgBur/+0ydWZO02I=
X-Received: by 2002:a63:e20:0:b0:385:fe08:52f9 with SMTP id
 d32-20020a630e20000000b00385fe0852f9mr29891822pgl.99.1649752206929; Tue, 12
 Apr 2022 01:30:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220409042321.3184493-1-james.hilliard1@gmail.com>
 <CAMeQTsanEow=zq=MuZLjMqpzybdS=5S0=JrkxuCdT7d5MxpEWQ@mail.gmail.com>
 <CADvTj4rBKzGFch8iVzHu1s+6=P0PcLEwoFi74xd_ormEX+2rMA@mail.gmail.com>
 <CAMeQTsaM363n5F=--xhSTayFqOMNvjTQjqz_aEhby6i-KRVBKQ@mail.gmail.com>
 <CADvTj4o_zyVZxaBz0+kRUF30OW3SKFMuo87r6FE9Qkfn1dVsBw@mail.gmail.com>
 <CAMeQTsbKMxQcDsDRqHsMwqU1BnrcOLwtU7uOrB-1E0z65P79-w@mail.gmail.com>
 <CADvTj4rR5zt5iFTDrrYfNQ267KV896dHnjJHx6yq=e10+V_Okg@mail.gmail.com>
In-Reply-To: <CADvTj4rR5zt5iFTDrrYfNQ267KV896dHnjJHx6yq=e10+V_Okg@mail.gmail.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Tue, 12 Apr 2022 10:29:55 +0200
Message-ID: <CAMeQTsZyp40ybkNxnYDCR=pvXRzWvtBLkT+i4VPyjNiwwWg0-A@mail.gmail.com>
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

On Tue, Apr 12, 2022 at 3:48 AM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> On Mon, Apr 11, 2022 at 3:27 AM Patrik Jakobsson
> <patrik.r.jakobsson@gmail.com> wrote:
> >
> > On Sun, Apr 10, 2022 at 10:05 PM James Hilliard
> > <james.hilliard1@gmail.com> wrote:
> > >
> > > On Sun, Apr 10, 2022 at 1:52 PM Patrik Jakobsson
> > > <patrik.r.jakobsson@gmail.com> wrote:
> > > >
> > > > On Sun, Apr 10, 2022 at 9:40 PM James Hilliard
> > > > <james.hilliard1@gmail.com> wrote:
> > > > >
> > > > > On Sun, Apr 10, 2022 at 1:36 PM Patrik Jakobsson
> > > > > <patrik.r.jakobsson@gmail.com> wrote:
> > > > > >
> > > > > > On Sat, Apr 9, 2022 at 6:23 AM James Hilliard <james.hilliard1@gmail.com> wrote:
> > > > > > >
> > > > > > > Select the efi framebuffer if efi is enabled.
> > > > > > >
> > > > > > > This appears to be needed for video output to function correctly.
> > > > > > >
> > > > > > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > > > > >
> > > > > > Hi James,
> > > > > > EFI_FB is its own driver and not needed by gma500 to drive its
> > > > > > hardware. What makes you think it's required?
> > > > >
> > > > > I wasn't getting any HDMI video output without it enabled for some reason,
> > > > > I assume it is doing some sort of initialization needed by gma500
> > > > > during startup.
> > > >
> > > > Then it sounds like you might just be using EFI_FB and not gma500. Can
> > > > you provide the kernel log with drm.debug=0x1f set on kernel
> > > > command-line.
> > >
> > > Seems efifb loads first and then hands off to gma500
> >
> > That is how it normally works but efifb shouldn't change the state of
> > the currently set mode so shouldn't affect gma500.
> > From the logs I can see that you have LVDS (internal panel), HDMI and
> > DP (3 displays in total) connected. This sounds wrong. Your version of
> > gma500 (Cedarview) doesn't support more than 2 crtcs/pipes. This might
> > be a problem.
>
> Yeah, there's a bug there with the connector status, only DVI-D-1 is actually
> connected, I have DP-2 and LVDS-1 turned off in weston.

Ok, but are the connectors physically connected to anything?
Regardless of what you do in Weston, the connectors shouldn't be
getting modes if they aren't used. LVDS might be from VBIOS but I'm
not sure where the DP modes come from. It would help if you also
provide kernel logs with drm.debug=0x1f when the outputs doesn't work
so I have something to compare with.
