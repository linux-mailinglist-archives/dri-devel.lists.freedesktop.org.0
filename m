Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF89AA58B3
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 01:31:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C49810E14B;
	Wed, 30 Apr 2025 23:31:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="f3gty8og";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7C910E14B
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 23:31:18 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-736c3e7b390so458451b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 16:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1746055876; x=1746660676;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7kkJOaWRkAsIP/ls9ASqGbXAxOgOs1WU+P/bZPko4NY=;
 b=f3gty8og/Nr88RH3UU6iFZ9PN0/gGf/CsVZIxpUaewdDWboE8zLh0J/lrNKP9j1U4A
 L+l/Yqtbo4FEULL4mLUaKw1xXFQrwTS+UEGPEaV1GdP5048xQSvX7TRNnPeL8Jcls/NV
 P+0Xc8KLWdhbmeZOq1L3RYbxkfXzBIs2kPeuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746055876; x=1746660676;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7kkJOaWRkAsIP/ls9ASqGbXAxOgOs1WU+P/bZPko4NY=;
 b=iIv5odRTWey9PMxGG20SWsMFPLVYL0g/NSa/6eTxxLnt7s5vz+g6zXvcybcgNb09tG
 XfTmQkx4HMLTlQ4MW/VFrpG1JLPxa4p2Ak6dpa9VqH8XnsyNEINBrKrFtSim9QHUElT8
 pA1z3+xIBVPPMoEZ3QCWv1fLPWjXAj6dM9JopAjAUwjByRe108nQOOVTvzhV7TgsnzGZ
 vIrNiIOvAQd25zyiVrRSRJGjLDme1VfV8CoV/V3mx6ME27K1poDEq/y/UU/pDAzKsdHI
 GRaAkF+nE6kGnKG1+WbwK0PXUZYosgN9sHxDYZ/skYxj3p2PS4/j/P+IvNzQ6+81DkxO
 4new==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2WohyxT+aw8SvJlxCC08m5hQ3YzwJqtXtTGZHZ7z43wkN4dUvrhZb4SF4WYoab7hWTKLbufmt+Ko=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSh48vhZcN3/X/pnvHEU96EqKmHlHai03e6So5cVM2gTD9nw0/
 YYsCDNjU09pn5LHGrtJDvUvxMbly7l5mQ+A9PUZHJHNaL+skEpwsKvy/nJLX5BtgkP0YWqdF28c
 =
X-Gm-Gg: ASbGncuLlDoj+grKJGhbnaPf2qbAhK8PYstFbVnBbHqHPgj2dUcGpHcCYQB2sEYaKhc
 QvPpgDAQpiIXOstgHdoUt8B8HMw21psCdJ40AIGGDhgJUlKzx2TVSQyIbcmc6JSluLdCBaR3eea
 AhMvRKFhufR3fBdWs+mA5XgCBnXmAnA0S0W1oOMIkn89xyeUX2SaSCWum8O4Dzpp2VKL7jX6qvL
 iy4crqRVOXrZG5YIja6l5TyJsiqtnrdxAnbsQOpxq8COvpRRknIiCrPt+ndVY4pV/enanmWS9Jz
 +tw/cyzLnkwRyNGC2EfgwWKaxnb62mS4AJ8DOziQzZak/nejEBE3oyfJV7UBzAjHQlCymwTGsFX
 RWcNsRm72NKxcpHIwQ2k=
X-Google-Smtp-Source: AGHT+IGewXVl9DngsWSK/M7m7L2gpAb35EtIHRoNagEnLKdwT6IAw+CwQOA89bcSins7s0cRGdVXHw==
X-Received: by 2002:a05:6a00:1897:b0:736:450c:fa54 with SMTP id
 d2e1a72fcca58-740491cce9amr487526b3a.6.1746055876515; 
 Wed, 30 Apr 2025 16:31:16 -0700 (PDT)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com.
 [209.85.210.174]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-740399202efsm2374945b3a.54.2025.04.30.16.31.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 16:31:15 -0700 (PDT)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-736c3e7b390so458430b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 16:31:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUFADg0gF1a0Vqp//6JflJPsGT4/5OiGp4mInEDjy4QD/k0NKJNARQDKvAz+bk1SgrsEsV3mEfbqyU=@lists.freedesktop.org
X-Received: by 2002:a17:90b:562d:b0:301:98fc:9b2f with SMTP id
 98e67ed59e1d1-30a41cfc2e0mr915708a91.1.1746055874808; Wed, 30 Apr 2025
 16:31:14 -0700 (PDT)
MIME-Version: 1.0
References: <wpwd7rit6t4mnu6kdqbtsnk5bhftgslio6e2jgkz6kgw6cuvvr@xbfswsczfqsi>
 <CAD=FV=Xp7zOQ2iEVf896P074RW911F-e2Qa36deD0e8fWksFBA@mail.gmail.com>
 <u7ek3ccya4c3c4rteliskjjfczpmrt4vmqo5c6kjdotxdgitn7@ko24dpb35pq4>
 <CAD=FV=Wc9TnDg6vDb8r5A8dT9TvOzU2kNSKi_6TzTtb0ka=8jA@mail.gmail.com>
 <nchsanp7nc7nqy3kqlu7c5iwvfj6vmrkqbxyjxmoc5eq3dthjk@fusw4pm52auq>
In-Reply-To: <nchsanp7nc7nqy3kqlu7c5iwvfj6vmrkqbxyjxmoc5eq3dthjk@fusw4pm52auq>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 30 Apr 2025 16:31:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U4PdTgRsxJ3HVRRQEZAPHinKxhUE9FpKDOnv=nDQo3KQ@mail.gmail.com>
X-Gm-Features: ATxdqUFKrr33v60MdJ7VLJEtzDzKpshe0mGaGV2WsW8O5fvBduy-dvNn_PfNeFQ
Message-ID: <CAD=FV=U4PdTgRsxJ3HVRRQEZAPHinKxhUE9FpKDOnv=nDQo3KQ@mail.gmail.com>
Subject: Re: PROBLEM: AST2500 BMC video output disabled by reboot (regression)
To: Nick Bowler <nbowler@draconx.ca>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Apr 30, 2025 at 10:52=E2=80=AFAM Nick Bowler <nbowler@draconx.ca> w=
rote:
>
> > > To clarify, there is no boot failure.  There is just no video output
> > > after rebooting.  I can then boot Linux again by any method that work=
s
> > > without being able to see the screen, and then everything is fine onc=
e
> > > I do that.
> >
> > Super weird. So every other boot works?
>
> On a new/broken kernel, every time I run "reboot" the video turns off
> when Linux does whatever it does to make the system restart.
>
> The video comes on again if I manage to boot it up again.
>
> The problem is that I have to do that without using the screen.  So I
> can boot Linux via the serial port, or via the BMC web interface, or
> by just typing on the keyboard without seeing what is happening.

Ohhhhhh! I was assuming that your problem looked like this:

1. Boot up Linux, video works.

2. Type "reboot" and the system boots back to Linux w/ no video.

3. Log into Linux via UART or ssh and type "reboot". System boots back
to Linux and video works.

...and then if you repeat steps #2 and #3 it keeps alternating with
Linux having video and not having video.

It sounds like instead what you're saying is that you're typing
"reboot" and then booting into some other operating system / BIOS and
the video doesn't work in that other (non-Linux) environment. Is that
right?

If I (finally) got it right, then I'm not really sure what to suggest.
It would sure seem like a bug in the other OS/BIOS. We could possibly
land the revert you have. I'd imagine it's papering over the bug, but
it's no real skin off my teeth. As a test, I'd imagine that if you
turned the screen off via commandline (I never really do this, but a
search turns up [1]) and then reboot with the screen off then I'd
imagine you run into the same trouble with or without the patch. Is
that true?

FWIW: The original incentive for adding all the shutdown calls (aside
from the fact that it's documented that they should be there) was to
make sure embedded panels shutdown properly. It looks as if no
embedded panels will really be used with this driver anyway.

[1] https://www.baeldung.com/linux/cli-monitor-turn-on-off
