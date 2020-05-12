Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BC21CF593
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 15:22:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 489216E91C;
	Tue, 12 May 2020 13:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846FB6E91C
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 13:22:17 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id z72so13651110wmc.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 06:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+EnH0KWqC8dwxn54jn+UlKp1qHLV0xeQE4GDKe1+aoY=;
 b=IJDgKyD+Re5mAyXKVTtPZ1TN5qOKdpTV7RbZnR/px2smOPqS0ugf6heO0YEMhT+HiG
 3MAKjlgol/bOVoZ+w6yilXS1oZZ2KxnTn8Iac6rHKCmLo7CURmM+uTWcfqWW4koArGgq
 jR8ll0K8frGzlqj1D983L/SvQS3+Pqg+5B8x2TfkiBdzMqAK6hnxojELvyymv25iYTLc
 5hvETpasvRFGvya8oOzIZIhOTOK443TGz5C8/KGuA8Vo+HmGiVbHYBYbUUJ1T6YrGdE4
 yuTlz7Fn444rAvfT9MLvjDPP5Z9HTGdlrsJ7dPWNuh50dzw+FC2t89xKd3vJ5sNNVKHX
 6ZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+EnH0KWqC8dwxn54jn+UlKp1qHLV0xeQE4GDKe1+aoY=;
 b=Wad/9DAmIH0jj61Jev4xFDmxoUjFZ7im/QbJt0/n9PNk4wIYPbtZicQ4CqXT9HNIqH
 DaEktEKW0kBIkeqwOD5FJ44ZY38AQSfEv5UEbXsrvTEJMrLlNANnZVepCsqwdWvsGHSb
 SijbooWNms0ha6me+Ap+46bjVylz1OBHDLxTBYLuv2u3pXd5XWIOekDil6+GM4TlSuzs
 YavkXLJ8OAP776SGusg8+TPAjAEdfGSC4exBvIP//htbqO0rFF/VkkLcnQyLG/vsZF1b
 424d+ELSM8XKHcdlLGCz5HnmoA3sdJo6ncW9nEIL3hXOvZSMCcHlk619nlfAS5OJ3KGe
 Q6zg==
X-Gm-Message-State: AGi0PuZuXlS+IICv7g0WVeZHXurrjahZ1RRiAiaKG18uiAJXqOnnc4gY
 DYWbL2eP61yoAC2+5aQ9v4LGCs02ymmu8pCXldYlcQ==
X-Google-Smtp-Source: APiQypL3iC2BiMlySCWAPlOWSye+X6XQgW9Ch6hWxB3MXivgb0piU/pZBmM2hSQyuJuf+ck+m899TnaDa2SXCqR4+gY=
X-Received: by 2002:a1c:1d41:: with SMTP id d62mr16930524wmd.79.1589289736063; 
 Tue, 12 May 2020 06:22:16 -0700 (PDT)
MIME-Version: 1.0
References: <d249c339-fa3f-4440-bbc8-c9cf08338174@physik.fu-berlin.de>
 <CADnq5_NkD4+AMbNJceOJVSeBbJNQ3KDJq-kb7aHyF2jW8Y6dOA@mail.gmail.com>
 <CALjTZvZcg60rgDux7+Kh3zaMBkd-OiqoJ7GyYrLxfvnwgc4Xng@mail.gmail.com>
 <CADnq5_M61r7CMtfMBx6Cf_N9SnJJn0PouiMjVg8wytEMF1YZfw@mail.gmail.com>
 <c5d29422-21bd-b786-c822-5643730ab8a6@daenzer.net>
 <CALjTZvZOHyEFVv-2RV94dFKDFQY4zxYEHt5uQ+1B48Npo4AwRw@mail.gmail.com>
 <alpine.DEB.2.02.2005121124110.28199@scenergy.dfmk.hu>
In-Reply-To: <alpine.DEB.2.02.2005121124110.28199@scenergy.dfmk.hu>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 May 2020 09:22:05 -0400
Message-ID: <CADnq5_PwY5czTPepDwzc5qoMJ3cKc4Mui=uN=k1EOtmOD42Log@mail.gmail.com>
Subject: Re: [RFC] Remove AGP support from Radeon/Nouveau/TTM
To: "Karoly Balogh (Charlie/SGR)" <charlie@scenergy.dfmk.hu>
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
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Rui Salvaterra <rsalvaterra@gmail.com>,
 "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 12, 2020 at 5:40 AM Karoly Balogh (Charlie/SGR)
<charlie@scenergy.dfmk.hu> wrote:
>
> Hi,
>
> On Tue, 12 May 2020, Rui Salvaterra wrote:
>
> > > FWIW, on my last-generation PowerBook with RV350 (IIRC), there was a
> > > big performance difference between AGP and PCI GART. The latter was
> > > sort of usable for normal desktop operation, but not so much for
> > > OpenGL apps (which were usable with AGP).
> >
> > I never really understood what were the issues with AGP on PowerPC
> > (well, Apple, the only ones I've tested) machines. I mean, did OS X also
> > disable AGP entirely, or did it have workarounds somewhere else on the
> > stack nobody was able to figure out?
>
> I don't know about OS X, but I doubt there is a major/blocker hardware
> issue, at least not one which affects every AGP machine.
>
> MorphOS' own Radeon driver uses the AGP facilities to some degree on all
> AGP PowerPC Macs supported by that OS, which is from PMac AGP Graphics
> (3,1) all the way up to the AGP G5 (7,3), including the various portables
> and the Mac mini G4. For example it can utilize it to stream video data
> directly from mainboard RAM, so you don't have to copy it with the CPU,
> allowing reasonably good 720p h264 video playback on most systems above
> the 1Ghz mark with the native MPlayer port. I'm sure the 3D part of the
> driver also use it to some degree, given the performance improvement we
> experienced when the AGP support was enabled (initially the system was
> running without it), but to which extent I can't say.

The problem is AGP doesn't support CPU cache snooping.  Technically
PCI must support coherent device access to system memory.  Unsnooped
access is an optional feature and some platforms may not support it at
all.  Unfortunately, AGP required unsnooped access.  x8t generally
provides a way to do this, but other platforms, not so much.  I don't
recall to what extent PowerPC supported this.  The Linux DMA API
doesn't really have a way to get uncached memory for DMA so there is
that too.  Windows and Mac may provide a way to do this depending on
the platforms.  What probably should have been done on AGP boards was
to use both the AGP GART and the device GART.  The former for uncached
memory (if the platform supported it) and the latter for cached
memory.  That never happened.

Alex
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
