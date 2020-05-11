Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 819781CE5F6
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 22:46:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC63C89739;
	Mon, 11 May 2020 20:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7242E89739
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 20:46:32 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l11so6792548wru.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 13:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qori0jEe8833K+xXsk8AZatxV7QbwOqjDoJDqGMAGk4=;
 b=onbU+uIICwQ+nUf6GbjAMFfYyrBsWBEDvkqoWG3DCPjlgEc/KBWAmC6KWvo737c5Sk
 cXjeFnPO0ahHjqw1KusWmyZeERtyWKjaMaUD1BbZ4x1nXSVlVEtSBrEFL1jszptV8p/t
 Mp6+zT/rJQGCSGye89mRldqHURuEH62QZpd2it/BEcsf23QRhCUDH9lGMvWjtaCHOWFL
 ZmUWQh5KywWB5xFNwDjnouMD+2RzFPsnX/8fsImVV9Yc6T7Wksbbnladgoz26IBveE1/
 OhygKIsTHRALBWr1JWTKuOyo43a3IbLgeZrA0hM3cEV6iaG2SP86JdVCXA3BXEn6A1jb
 hDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qori0jEe8833K+xXsk8AZatxV7QbwOqjDoJDqGMAGk4=;
 b=Ps/BzBoNPT9629hglOimcr0pNQfscchBsXMkD6oif9qY28U45YwDGrLqt+3p1jrLZY
 uOF/fZ15OHCgIFIK23upTYuDsVWeGxoy3FVxyt26JZZPHvPWoi0+uloxlYSHz1704Gs8
 me3BLC+lkGCwOQLtDoPRsOC4qtD9c14WOI8ZNDzWvmI+wCGuF6vJZq9xep+fK2ckIrTT
 0UGeJlUIUqedgPF5Ucadr2UL4S1PaatR8oad2yCnC/Hm8iSnjfwuGk8/ip/MC2YfBC+Q
 rtBX44VZIZrAIggltvMZOuBvwTJycWGR11ujqYt77rjfdr/IggQJzTNSgdRCUVtb7hhU
 NZwQ==
X-Gm-Message-State: AGi0PuZT6M9Bbk5m2Mxied4GWvl62MwjsQ1AW/QDypAH9Nsq9Q1ZImBr
 RD2Rdc+M0aJZkICQQl4rjBgz2WbzM+Rvh8D8F+E=
X-Google-Smtp-Source: APiQypJZPeU/MpVY/LFr2d/TCmjmMDT6PXHFvfzTOPtb8zQaRTwsgb4RqI65YXvcM2+FRhTApNLBLkCRdeL3A4URy78=
X-Received: by 2002:a5d:4389:: with SMTP id i9mr21645732wrq.374.1589229991186; 
 Mon, 11 May 2020 13:46:31 -0700 (PDT)
MIME-Version: 1.0
References: <d249c339-fa3f-4440-bbc8-c9cf08338174@physik.fu-berlin.de>
 <CADnq5_NkD4+AMbNJceOJVSeBbJNQ3KDJq-kb7aHyF2jW8Y6dOA@mail.gmail.com>
 <21a0d2ba-c27d-6b12-678e-89c04dc64a82@physik.fu-berlin.de>
In-Reply-To: <21a0d2ba-c27d-6b12-678e-89c04dc64a82@physik.fu-berlin.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 11 May 2020 16:46:19 -0400
Message-ID: <CADnq5_MQWJF5MB-1JyVeXCU8EAK2P-g+P13dR7eRKLkP8YmFqA@mail.gmail.com>
Subject: Re: [RFC] Remove AGP support from Radeon/Nouveau/TTM
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 11, 2020 at 4:41 PM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> On 5/11/20 10:05 PM, Alex Deucher wrote:
> >>> For Nouveau I'm not 100% sure, but from the code it of hand looks like we can do it similar to Radeon.
> >>>
> >>> Please comment what you think about this.
> >>
> >> I would be against such a move as AGP graphics is still used by people running the powerpc
> >> and ppc64 Debian ports on their vintage hardware [1].
> >>
> >> I have also CC'ed the debian-powerpc mailing list so that other users can voice their
> >> opinion.
> >
> > Note there is no loss of functionality here, at least on radeon
> > hardware.  It just comes down to which MMU gets used for access to
> > system memory, the AGP MMU on the chipset or the MMU built into the
> > GPU.  On powerpc hardware, AGP has been particularly unstable, and
> > IIRC, AGP has been disabled by default on radeon on powerpc for a
> > while.
> Do you have a code reference at hand for this bit of information (AGP
> being disabled on Macs)?

It was disabled 2 years ago:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=037d1a66ae640ca2723f47c0115ffa9e603699b3

Alex

>
> Thanks,
> Adrian
>
> --
>  .''`.  John Paul Adrian Glaubitz
> : :' :  Debian Developer - glaubitz@debian.org
> `. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
>   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
