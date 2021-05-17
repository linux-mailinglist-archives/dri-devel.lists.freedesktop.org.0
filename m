Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9447D383D84
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 21:32:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE766EA46;
	Mon, 17 May 2021 19:32:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431BF6EA46
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 19:32:56 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id a4so7651163wrr.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 12:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NI7fG+Iz42tCTRW4FnFZEbmA6acgFeQJ4sXoAsYOays=;
 b=VPCiE/4FqXs81DF9CoNcuueDHeNNUjkvCfoCRnWBVPQjLW0j0pQz5y5NaRVERJMCpf
 B1DwT4s6SLMGXniu9FL9gxnGwYyUUM2smZUQvt2Qb1gXnj2J8YcJovyJWWPR0mD+OPsa
 UdPanHaQSl/KBZuSjumBEvbmgDHeFdUFZ1Zw8HAdGciyhOpy9GsqxNApeCXuh+jyv3yA
 Uvd69dvTrhNJosq/Y4Z/wTfokI0qDtUWTcFL2CObaB4e6cQq0wMs4pDqCcH+o5doJSFT
 vFNyRl4SS/PCni3LqTTPlsjiRG6H0yExQJtvROhJjO+ODsPp7FcMZMNTUONnclFrr4qG
 2Ugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NI7fG+Iz42tCTRW4FnFZEbmA6acgFeQJ4sXoAsYOays=;
 b=BXfouxP5Kj//RYqNLxaZeF6oR+RQyjAJEUWW0JWqMYsBUuNf07ccBYmnDYps4LOtMm
 9CtNvdwWWVKdc8wmh4xG3fiw1ZGCd8hvZQKfq5dYqoVdN9MZReVXbLzoXdafmYMEeApT
 4JJGvnLgRVwerGKcAfbuJeLVvLXcpGzduG/mHn2SM+IX/Kt3bDlv9QgWpBcRW5Jb1H/O
 pZVMXiYn4eUQ+mUZJf78Ef+5QmcIAao1wl/xxNPLM0PeipdhBT7mjn54iCa4e1mIX78M
 9wSx3VG8W+0/o6OpLdhyut3Ao/hSf4Nm0uVNHs53WwsfRqJfHAwJu7aHnc/d66QKuGd0
 WywA==
X-Gm-Message-State: AOAM533H1HX4HyADA6iCeFQNvG3eBD/vVnfHASj4aCu+LRfRMdIGWprn
 QF3q0OHy/wnYHKxzBIqhOEAd9EqX1aVfVuZ1h8rEDA==
X-Google-Smtp-Source: ABdhPJw13Z70zQiULTMByvvk76vtGj/6H/7RaAlGaSiPA1JN5oUYA3Uxd1gKghjbNVX4S49IhfOKd1J6WUKFBD1aB8o=
X-Received: by 2002:a5d:570c:: with SMTP id a12mr1526197wrv.354.1621279974949; 
 Mon, 17 May 2021 12:32:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210513110040.2268-1-maciej.kwapulinski@linux.intel.com>
 <YJ42MEgwDZrAEQLl@kroah.com>
 <CAK8P3a0pcBHfrwu9fHHRWim5WgQuCqpROpMM83yCCpjjwu1FJQ@mail.gmail.com>
 <YKIeBdwFb9Ng275X@phenom.ffwll.local>
 <503d101d-7273-757a-2809-e272db93c45d@suse.de>
In-Reply-To: <503d101d-7273-757a-2809-e272db93c45d@suse.de>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 17 May 2021 20:32:43 +0100
Message-ID: <CAPj87rMqYNdHMT5v9fiMuDzcB8462nJuthB9To70JOsORgxk=w@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] Driver of Intel(R) Gaussian & Neural Accelerator
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Derek Kiernan <derek.kiernan@xilinx.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 17 May 2021 at 20:12, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 17.05.21 um 09:40 schrieb Daniel Vetter:
> > We have, it's called drivers/gpu. Feel free to rename to drivers/xpu or
> > think G as in General, not Graphisc.
>
> I hope this was a joke.
>
> Just some thoughts:
>
> AFAICT AI first came as an application of GPUs, but has now
> evolved/specialized into something of its own. I can imagine sharing
> some code among the various subsystems, say GEM/TTM internals for memory
> management. Besides that there's probably little that can be shared in
> the userspace interfaces. A GPU is device that puts an image onto the
> screen and an AI accelerator isn't.

But it isn't. A GPU is a device that has a kernel-arbitrated MMU
hosting kernel-managed buffers, executes user-supplied compiled
programs with reference to those buffers and other jobs, and informs
the kernel about progress.

KMS lies under the same third-level directory, but even when GPU and
display are on the same die, they're totally different IP blocks
developed on different schedules which are just periodically glued
together.

> Treating both as the same, even if
> they share similar chip architectures, seems like a stretch. They might
> evolve in different directions and fit less and less under the same
> umbrella.

Why not? All we have in common in GPU land right now is MMU + buffer
references + job scheduling + synchronisation. None of this has common
top-level API, or even a common top-level model. It's not just ISA
differences, but we have very old-school devices where the kernel
needs to register fill on every job, living next to middle-age devices
where the kernel and userspace co-operate to fill a ring buffer,
living next to modern devices where userspace does some stuff and then
the hardware makes it happen with the bare minimum of kernel
awareness.

Honestly I think there's more difference between lima and amdgpu then
there is between amdgpu and current NN/ML devices.

Cheers,
Daniel
