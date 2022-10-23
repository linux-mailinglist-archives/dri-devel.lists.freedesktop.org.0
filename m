Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF6E60923C
	for <lists+dri-devel@lfdr.de>; Sun, 23 Oct 2022 12:06:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C6610E056;
	Sun, 23 Oct 2022 10:05:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B009810E029;
 Sun, 23 Oct 2022 02:06:38 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id bs14so8612459ljb.9;
 Sat, 22 Oct 2022 19:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mVJxenU00nxcYEszNNgSvmlpH8bCaSqTF+LhHb5NT2U=;
 b=Q8yxpPl0m8T1ED2IZdzu2h5WGXP0kzNAdX1PwAt2aJnt2EerZ7p/u9klH3CbL+84CT
 bpMS27g5jMxEnz6j+RU1AqnOYnHrMFjdK/oW8IVJSsa+K6SlPJVS6SRg8rxhTTxx7h3P
 e1RcLFrxcQH/5kuLSThKiQ0/m/LDbddJC60ZTGtFHAfAGJxTIZPO2XRaqj6lZ7FpX7z7
 Di8FfmdYg1HAGIcSijaMX++DjwiSlD1czpa7Uwuwk9Ngns7lEdtZZCJ2w5tItj4Rs/Lk
 4715RmcILlST17EEU4gqga15mWeR3tRgqgKBf1ltNmKYsIrK3mZ88mFyoZy29i3Y1T8c
 DL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mVJxenU00nxcYEszNNgSvmlpH8bCaSqTF+LhHb5NT2U=;
 b=q5RpezgVxVj0ECnW32IQcFqjewDLQlR+sMGU9BeeAmhlb8KW+FE4zKAwT5cPLsTD4K
 3y5eEpYarFAexrbWvNW8SfliGjPJ0CQq0gFEmWDI4GI9p5svrGSB2wcmDQqLkYsxqNyR
 fYoO0TRTdT2qam1B/l9e6YKSZJRv1phiUkWYZDmtGJ1NBvvzPOQX+ZIdG+ci77pEqDPT
 cOhUNkbwDfRP6wz2CMgtBy8Va2E0OJYKK7tT/JEWXbkwUdw2NYPf1v+u8Mjkn2DE9kZ+
 q1jX6vE3brlpyJR8gUQWjHm2TV/gpdf8QK408IR7I/HfMF1j9vAN8FmfipnI1dtSOPXx
 Qncg==
X-Gm-Message-State: ACrzQf31JkOq3se6yCwpB2PS7hvXn6Gb46iUsmZxLmorFuJMKgsLcEC8
 a2q7XzcFhOXQnoeJbhx9O0oK38qvdcKzbupDwy8=
X-Google-Smtp-Source: AMsMyM4JyiLU86ajhHWHIWAW7baDACgJqHmb8WANPatDGLCWU8OJVcrE2ShCIYHHqH0oUqquFaMHNQ57WlzPvl5kLPI=
X-Received: by 2002:a05:651c:101:b0:250:896d:f870 with SMTP id
 a1-20020a05651c010100b00250896df870mr10038615ljb.235.1666490796666; Sat, 22
 Oct 2022 19:06:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+vNU3zyrAOVWmgPJpRLzMm1V05b9rEMeb6=4AutmZC_rJN8A@mail.gmail.com>
In-Reply-To: <CAJ+vNU3zyrAOVWmgPJpRLzMm1V05b9rEMeb6=4AutmZC_rJN8A@mail.gmail.com>
From: Chris Healy <cphealy@gmail.com>
Date: Sat, 22 Oct 2022 19:06:25 -0700
Message-ID: <CAFXsbZoizMA8CK=_2uYrwKcZ8Uhwoze6Nod8FD2MPhxs9cOi=A@mail.gmail.com>
Subject: Re: IMX6 etnaviv issue
To: Tim Harvey <tharvey@gateworks.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 23 Oct 2022 10:05:41 +0000
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
Cc: The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I can't speak to why you are experiencing issues when using the GPU,
but in the examples you gave, the example that is working is using a
SW based GL implementation instead of the real GPU.  This can be
determined by looking at the GL_RENDERER string to see if it mentions
a Vivante GPU or something else (like LLVMPIPE).  It's quite likely
that if you were using the real GPU with etnaviv in Mesa with the
older config you would also experience similar issues.  As such, we
shouldn't consider this a regression between the two Ubuntu versions.

One thing you may want to try doing is run with Mesa 22.2.1 and TOT to
see if either of these address any of the issues you are experiencing.

On Thu, Oct 20, 2022 at 1:44 PM Tim Harvey <tharvey@gateworks.com> wrote:
>
> Greetings,
>
> I use a standard Ubuntu 20.04 focal rootfs with a mainline kernel on
> an IMX6Q based board and have had no issues using things like gnome
> desktop, glxgears, glmark2 however recently I updated the rootfs to
> Ubuntu 22.04 jammy using the same mainline kernel and now I see some
> issues. I've replicated the issue with several kernel versions
> including 5.4, 5.10, 5.15 and 6.0 so I would say this is not a kernel
> regression but something related to the graphics stack being used
> which I'm not very familiar with.
>
> The issues I see can be described as:
> - mouse cursor is incorrect (looks like a hatched square)
> - glxgears shows some sort of sync/jitter issue and has a fairly low framerate
> - glmark2 shows a some sync issues then after a few seconds results in
> a GPU hang
>
> My ubuntu focal image that appears to work fine has the following:
> gnome 3.36.5-0
> xserver-xorg 1:7.7+19
> xserver-xorg-core 2:1.20.13-1
> xwayland 2:1.20.13-1
> glmark2 2021.02
> mesa-utils 8.4.0-1
> GL_VENDOR: Mesa/X.org
> GL_RENDERER: llvmpipe (LLVM 12.0.0, 128 bits)
> GL_VERSION: 3.1 Mesa 21.2.6
>
> My ubuntu jammy image that has the issues has the following:
> gnome-41.7-0
> xserver-xorg 1:7.7+23
> xserver-xorg-core 2:21.1.3-2
> xwayland 2:22.1.1-1
> glmark2 2021.02-0
> mesa-utils 8.4.0-1
> GL_VENDOR: etnaviv
> GL_RENDERER: Vivantte GC2000 rev 5108
> GL_VERSION: 2.1 Mesa 22.0.5
>
> Does anyone have any ideas on what might be going on here? I apologize
> for my lack of knowledge regarding the software layers on top of the
> etnaviv kernel driver being used here.
>
> Best Regards,
>
> Tim
