Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F615A25000
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2025 21:54:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67FA110E085;
	Sun,  2 Feb 2025 20:54:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="AC1sVVoK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1153C10E085
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Feb 2025 20:54:26 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5d3f65844deso6861450a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Feb 2025 12:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1738529665; x=1739134465;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5t2zwiOsM5H/7mjf0AgS4rc7lvfnLgdfVyvCGMgdhDo=;
 b=AC1sVVoKIMvXY7rITb3VmumOGXSz/GBrFyM77Q5hM8cSOWkBgCN7Kcg31i2oRfbPtZ
 P6FDXejgu/8Fzm/ey3rAqxFc4eIR6kpGrb1pB/zi8mGLJAPgL048gpWyHBBMzgacxG5e
 uVWDNr6y76r64MNOtruAAdJOzZBlPDhYGHk9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738529665; x=1739134465;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5t2zwiOsM5H/7mjf0AgS4rc7lvfnLgdfVyvCGMgdhDo=;
 b=qcUYIkq0ETtGXXo2uPOT6wccHcTpYSM3GVX3BcpOdv/MQJqTZea3qHQRmCdZpLGfNi
 +kxO7nG7GF+ay+gTLb3NKiw2oLR4KTrVZPDZXYFzMo4qiPY3di/5DWXUAi5PEMrHRYq6
 Ijo/qRGzyWdJNlE9jgL/rs5XPUDRnVTrxgkdIktIM1uR53qErJ8y2LAT/2FHLRPi+p6t
 6Hs+MLufboRTv+pV2lVxfrtFGhIWqFCtsqeogJlzKtJiK5fFfrsf9NFWSFfJaLZJsGci
 HYnMzGxSM8IlO2S6eqz6OvRQrVBEw95GIagrz4ImbwJysWlhLtmCPxKQauSpegODfDJp
 ZCBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3j5EGpMsSxyqcoZbmqb+v3KbECmhP19IN3EWFDWZVbS7XGkEiYrztkx4YAdSbWZ0N0p3YQohyXP8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBxGmRrtC9/OIUCLAIbwCgYFT0OD4xEyUUdw5dC5aAnzEXsm6R
 HaYIiP/DA6+vP4Km8OfR5awgTtNJQCVC3qSXZD7BTEtR188TFsXsJi+Ssa6l422MLnOWcAysg3O
 GQjWbmg==
X-Gm-Gg: ASbGncsXhSn01HMn1AZ8YtCUoj7/lzmQoOfBhI13R12wyjexazQpqUO2ux+80iE3XXN
 NEddvBjj5rK8b/2HWb+MpOKBmFVq7zFVEW7ZWpVGdEsUIOXQyeiBNWMhmiqIrwK3Sy7rEGdKJIP
 hP25Gr+xTnAh0VNXuAKJD58mSRPXPWIfyleW/yC6SKAi0xmlmTgF5hVy7LINA0O3xTE7Khv8UZb
 bkCrm7zbhK0bibnsnJKCEutt+zMDGyPE5ZjGO9gJb4z6CUW1LbHB83eSSujG2FgimFsr9+oXJHd
 OZF+bCfKDFC6RfVQZPqwHm0YX88qstx3GZejHPtRYkk/dc/pA2TLI2ll0SuyQlFF0A==
X-Google-Smtp-Source: AGHT+IHIEGrjCkn+92gYhFssp90m8DVsHas2uwYs3nuE5Zpzc3mVHzC9OzRMfKATfT8+zWpVkrSFcQ==
X-Received: by 2002:a17:907:3f1e:b0:ab6:fea0:5f14 with SMTP id
 a640c23a62f3a-ab6fea06b3cmr1077982766b.16.1738529664861; 
 Sun, 02 Feb 2025 12:54:24 -0800 (PST)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com.
 [209.85.208.46]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e4a3145bsm640229466b.135.2025.02.02.12.54.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Feb 2025 12:54:24 -0800 (PST)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5d4e2aa7ea9so8050045a12.2
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Feb 2025 12:54:24 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVJ0xUixO2WiJ0jmln8JMYA/fueR/B2AtQqpFjtlAQOyadgqokEWCa0XUnMosT0oIVQeleWwcyHmoc=@lists.freedesktop.org
X-Received: by 2002:a05:6402:400c:b0:5dc:7fbe:730d with SMTP id
 4fb4d7f45d1cf-5dc7fcdb696mr14967854a12.6.1738529663837; Sun, 02 Feb 2025
 12:54:23 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9twyvq3EWkwUeoTdMMj76u_sRPmUDHWrzbzEZFQ8eL++BQ@mail.gmail.com>
In-Reply-To: <CAPM=9twyvq3EWkwUeoTdMMj76u_sRPmUDHWrzbzEZFQ8eL++BQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 2 Feb 2025 12:54:07 -0800
X-Gmail-Original-Message-ID: <CAHk-=whRBX0aQq1J5S5nHXE2GvXnQ5z+cqu=iTY9xU34kvYMzw@mail.gmail.com>
X-Gm-Features: AWEUYZmtdf6Aj4eR4CjeK7M4f9l-h8Ccbl_a-DQ9v5PSq10GpXRW0o0FHXwpAT8
Message-ID: <CAHk-=whRBX0aQq1J5S5nHXE2GvXnQ5z+cqu=iTY9xU34kvYMzw@mail.gmail.com>
Subject: Re: question about firmware caching and relying on it
 (CONFIG_FW_CACHE)
To: Dave Airlie <airlied@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Luis R. Rodriguez" <mcgrof@kernel.org>, russ.weight@linux.dev
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

On Sun, 2 Feb 2025 at 12:15, Dave Airlie <airlied@gmail.com> wrote:
>
> Currently FW_CACHE is an optional feature (that distros may or may not
> configure off), where we will cache loaded firmwares to avoid problems
> over suspend/resume (and speed up resume).
>
> I've just discovered a problem in nouveau's suspend code when the
> FW_CACHE is turned off, it tries to load a few in it's suspend path
> for certain scenarios. Enabling FW_CACHE fixes this, but I'm unsure if
> that is considered properly fixing it or should FW_CACHE just be
> considered an optimisation.

Honestly, if the alternative is "driver hacks up its own caching",
then I think it definitely should just say "select FW_CACHE".

You need to make it conditional on PM_SLEEP to make Kconfig happy, but
arguably that acts as documentation (ie it kind of ends up being a
"this is *why* we select FW_CACHE").

So a simple

        select FW_CACHE if PM_SLEEP

sounds like the right thing to do for nouveau.

And in fact, that was how things used to be globally (with no driver
selection noise needed). There was no FW_CACHE option, we would just
enable it unconditionally for PM_SLEEP, exactly so that drivers would
*not* try to load firmware during resume when the filesystem may be
off-limits.

HOWEVER.

We apparently have some completely cray-cray "uevent messages" thing
going on, which caused commit 030cc787c30e ("firmware_class: make
firmware caching configurable")

Honestly, I'm not sure what broken thing that is all about. What
uevent messages? Firmwas caching should cause *less* uevent noise, not
more, because now we don't need to talk to user space as much.

Is that some Android-only thing, or is it some inherent stupidity in
the FW_CACHE code that I just don't see off-hand?

I do *not* see any real explanation for that commit, only that
statement about netlink that appears very odd.

That commit really makes me angry. It has that pattern that I
absolutely hate: no actual background, and a "Link:" that makes me
follow it ("Yay! Explanation!") that then only points back to the
patch submission ("#^&% this thing").

Useless. Annoying. I absolutely *detest* those links that give no
actual useful backstory to what the thing is about and only point back
to the patch that I'm wondering about. The disappointment it causes is
intense and real.

Anyway, I would say that particularly for a driver that wants caching,
adding that select is very much the right thing to do.

I'd rather get rid of that stupid config option entirely, but since I
don't know what the background is for it having been added, I guess we
can't do that.

Greg, Luis, can you explain that odd uevent message / netlink issue?

            Linus
