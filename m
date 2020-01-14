Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DF613B536
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2020 23:22:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 707B66E5A2;
	Tue, 14 Jan 2020 22:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE8276E5A3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2020 22:22:28 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id p17so15615196wma.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2020 14:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=31Aasf3w2y6kL2lKVEWRJEojIbPPLAiYUoEehNYnyus=;
 b=C8cTgB0ggp5TnVKIXc+6M2ue/hiUYhg9hRlcDOTLF+v6OSfG51mbvL8rDTNTK6e0Vb
 yTiS+EdxAnTf4wQO7ZbEQSQaoKlen+xjvBVnl8Ac6zIPdlyEI4el/f1EsXto4w+zf8pW
 FnmqP7uaUN6ss4zFVdCS4AgVqPTnbAm6WhvoBUM09nkqDLd4PADGVdzZg9xLsbnspeQj
 cagsK9EjIaQHknR3aTJ7Q72bNI0m5IL4DfhWnkWDhQguH2BvtWeTMeRqEnvPQH4BsimQ
 75eLPap5YL+UAyr3qQ2TPcmElPNRt3Pk/QiqDGrRHtTCzBpIJRlveLZL8xdfg2/VeBhr
 j9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=31Aasf3w2y6kL2lKVEWRJEojIbPPLAiYUoEehNYnyus=;
 b=krrCYl5q0v+L+yLa5wKTYDocUjXNtSq19ma715AwbrDEkAVVHJ+rzyAkd6KRNH9efk
 VE0TxpOvcdARzs92c9iUXm67TDf/f6YsmTvJKwihJwtb6hrhBIoNAY88BDZATSXzAh0a
 B5RLqCjzUcO4sz1UNTL+a6xq89Z6y9kBaz55z2TSz89MCx3NOfLyrwY+mhxSmwD+FyLI
 GIq9RKrC/VFB/hkUGT2ntyNWdovOJyyScu/ze8GeFrT+VXlbCtVKiBtDY7z3+2p0TUkG
 VUv6TZAFJS3IZwI2D8rna8rpHKTuwG0CVlxzsPAArXhlxTvIFajPx4WyYOBTHcUBWH52
 inXw==
X-Gm-Message-State: APjAAAUqMiFHcAY+mHhV+B6NRnl4MyDLESsErFUubTYp5AwYqocd5aFx
 6bDuGp+4Jd02D4XNi8owpumGAHYyb9cl7JGhooI=
X-Google-Smtp-Source: APXvYqzwMZx3/jRqSE6darBkCm3w3pJB3RgSwf9kl7cA9vXCDhW28rHjVP29IlDpMgRp+MdDxU5Ghat5sGoNs/+ZES4=
X-Received: by 2002:a05:600c:2406:: with SMTP id
 6mr30647716wmp.30.1579040547471; 
 Tue, 14 Jan 2020 14:22:27 -0800 (PST)
MIME-Version: 1.0
References: <bug-206175-5873@https.bugzilla.kernel.org/>
 <bug-206175-5873-dSmrOaqbiZ@https.bugzilla.kernel.org/>
 <CAHk-=wjDzHKweQfnMSyGdXo1ber-Hm-fYDC9TiE8xZZaEzZ8sw@mail.gmail.com>
In-Reply-To: <CAHk-=wjDzHKweQfnMSyGdXo1ber-Hm-fYDC9TiE8xZZaEzZ8sw@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 14 Jan 2020 17:22:15 -0500
Message-ID: <CADnq5_Np0iXOCX9_Vq8qs7aDLLcNL8xp9Zpc-DtLNb3oJvcgBw@mail.gmail.com>
Subject: Re: [Bug 206175] Fedora >= 5.4 kernels instantly freeze on boot
 without producing any display output
To: Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 14, 2020 at 4:41 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Dave, Alex,
>  there's an odd bugreport on bugzilla, where Artem is seeing an odd
> early-boot failure.
>
> That one almost certainly has nothing to do with you guys, but see the
> later odd (and apparently unrelated) report about some AMD graphics
> firmware issue and a black screen.

Odd.  I have a similar picasso based raven laptop and it is working
fine with F31 and the latest 5.4.8 kernel.  I think the firmware is a
red herring as the driver won't load without it so if you don't have
it installed, the driver won't be running in the first place.  I'll
follow up in the bug report and ask him to file a new bug about the
amdgpu issue to avoid cluttering up the current report.

Alex

>
>                      Linus
>
> On Tue, Jan 14, 2020 at 1:17 PM <bugzilla-daemon@bugzilla.kernel.org> wrote:
> >
> > https://bugzilla.kernel.org/show_bug.cgi?id=206175
> >
> > --- Comment #9 from Matt Yates (matt@fast-mail.org) ---
> > My BIOS vendor is "Insyde Corp.".  There is a TPM module.  When I disabled it,
> > it caused my EFI boot entry to disappear, so I couldn't test it.
> >
> > However, I think we may have two separate problems.  I switched back from
> > Fedora to Debian Testing, and the Debian installer upgraded the kernel from 5.3
> > to 5.4 series prior to the first boot.  The 5.4 kernel booted up on first boot.
> >  I could see boot messages scrolling, but the screen went to a black while
> > trying to load lightdm because I did not have the "firmware-amd-graphics"
> > package installed required for graphics.  After installing the amd graphics
> > package, the 5.4 kernel freezes as before (right at the start of the boot
> > process).  The 5.3 kernel boots as normal, and graphics work.
> >
> > The "firmware-amd-graphics" package (version 20190717-2) was the only thing I
> > changed, so I guess the problem must be some sort of conflict with the amd
> > graphics firmware and the 5.4 kernel.
> >
> > --
> > You are receiving this mail because:
> > You are on the CC list for the bug.
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
