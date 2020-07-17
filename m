Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A52B3223A8E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 13:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE9506E12A;
	Fri, 17 Jul 2020 11:32:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24AF56E118
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 11:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594985543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TYpWDk5YRbEJgevYd6gB8eGgLm0tIiJeUcncZGG+w6o=;
 b=i6ABQZygQAef7piM003bSba61BBGO8Rvdm6v1YtrN9Uf4Fm32+vz9lXwjJcUQ+5oJMgedJ
 7mRYlrUVRAV0uwNbnxqRcLYnCt9kPyaFOm3dpYXzxZSAL3ZUdCMdwpqWs0OOTA/kS7dDOg
 Y1AYhXm+3PnveeHdtzlvHkWmmy4WDQc=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-N9rMbJamOGunt2UhQWTNpg-1; Fri, 17 Jul 2020 07:32:21 -0400
X-MC-Unique: N9rMbJamOGunt2UhQWTNpg-1
Received: by mail-qt1-f199.google.com with SMTP id m25so6061749qtk.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 04:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TYpWDk5YRbEJgevYd6gB8eGgLm0tIiJeUcncZGG+w6o=;
 b=fOhBE9XnFidhcFsllADkXPRpNB2BQX0f5VxYTRKOHBW7qtDSQX1kDsFdRSI5tpiyKt
 fBYAo+aAxUp663IRONnUr8aN2T4RtEEHRodyeJpTKUr1JsP4rnQeCuoGBVIfEArFETlW
 1HMsQD/SFnaUgmrfn2UnXWcP5PdlIyI6LvvrOFX5VjD8QB7E/xv/9Seghicikp3xCZSC
 IzFZkVUgFCT9xM/755SjStkU5GwBv58KTRLrbkz13aJlH24FC888m25PlJ8x43Yg6XDA
 CChwlnMfNWwLT0lHEWr9Lc1HdjrjE6eK/7mCtUMYEiZUZdMBQGh6gE5un3Li6OKyBAOF
 42AQ==
X-Gm-Message-State: AOAM531KXvjPjokZc6P6Om542DJI6O6kSnkxBtA5IVv7mqeEb6M8DE0z
 7uy55DkK8n318kLUMlWvr5UqxNFHTO79AO7Wb5aPUT9U/tN2QhcXxPq32tREi/KacaTKbEN6pFi
 hoS3dVJjK7RdfZpznLmhqtSjREsUbRFuLeY8TKOPf3i4R
X-Received: by 2002:a37:a589:: with SMTP id o131mr8525059qke.102.1594985541186; 
 Fri, 17 Jul 2020 04:32:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8U5sWpquWmgK/Rg67k2lvFtnWDq2c6Co4MkYKbyr1oubN2HBDkG+dq9s8lm6gAwtT3o4kndbiPD79JItfOvo=
X-Received: by 2002:a37:a589:: with SMTP id o131mr8525028qke.102.1594985540875; 
 Fri, 17 Jul 2020 04:32:20 -0700 (PDT)
MIME-Version: 1.0
References: <CACO55tuA+XMgv=GREf178NzTLTHri4kyD5mJjKuDpKxExauvVg@mail.gmail.com>
 <20200716235440.GA675421@bjorn-Precision-5520>
 <CACO55tuVJHjEbsW657ToczN++_iehXA8pimPAkzc=NOnx4Ztnw@mail.gmail.com>
In-Reply-To: <CACO55tuVJHjEbsW657ToczN++_iehXA8pimPAkzc=NOnx4Ztnw@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 17 Jul 2020 13:32:10 +0200
Message-ID: <CACO55tso5SVipAR=AZfqhp6GGkKO9angv6f+nd61wvgAJtrOKg@mail.gmail.com>
Subject: Re: nouveau regression with 5.7 caused by "PCI/PM: Assume ports
 without DLL Link Active train links in 100 ms"
To: Bjorn Helgaas <helgaas@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Sasha Levin <sashal@kernel.org>, Patrick Volkerding <volkerdi@gmail.com>,
 Linux PCI <linux-pci@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Filed at https://bugzilla.kernel.org/show_bug.cgi?id=208597

oddly enough I wasn't able to reproduce it on my XPS 9560, will ping
once something breaks.

On Fri, Jul 17, 2020 at 2:43 AM Karol Herbst <kherbst@redhat.com> wrote:
>
> On Fri, Jul 17, 2020 at 1:54 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> >
> > [+cc Sasha -- stable kernel regression]
> > [+cc Patrick, Kai-Heng, LKML]
> >
> > On Fri, Jul 17, 2020 at 12:10:39AM +0200, Karol Herbst wrote:
> > > On Tue, Jul 7, 2020 at 9:30 PM Karol Herbst <kherbst@redhat.com> wrote:
> > > >
> > > > Hi everybody,
> > > >
> > > > with the mentioned commit Nouveau isn't able to load firmware onto the
> > > > GPU on one of my systems here. Even though the issue doesn't always
> > > > happen I am quite confident this is the commit breaking it.
> > > >
> > > > I am still digging into the issue and trying to figure out what
> > > > exactly breaks, but it shows up in different ways. Either we are not
> > > > able to boot the engines on the GPU or the GPU becomes unresponsive.
> > > > Btw, this is also a system where our runtime power management issue
> > > > shows up, so maybe there is indeed something funky with the bridge
> > > > controller.
> > > >
> > > > Just pinging you in case you have an idea on how this could break Nouveau
> > > >
> > > > most of the times it shows up like this:
> > > > nouveau 0000:01:00.0: acr: AHESASC binary failed
> > > >
> > > > Sometimes it works at boot and fails at runtime resuming with random
> > > > faults. So I will be investigating a bit more, but yeah... I am super
> > > > sure the commit triggered this issue, no idea if it actually causes
> > > > it.
> > >
> > > so yeah.. I reverted that locally and never ran into issues again.
> > > Still valid on latest 5.7. So can we get this reverted or properly
> > > fixed? This breaks runtime pm for us on at least some hardware.
> >
> > Yeah, that stinks.  We had another similar report from Patrick:
> >
> >   https://lore.kernel.org/r/CAErSpo5sTeK_my1dEhWp7aHD0xOp87+oHYWkTjbL7ALgDbXo-Q@mail.gmail.com
> >
> > Apparently the problem is ec411e02b7a2 ("PCI/PM: Assume ports without
> > DLL Link Active train links in 100 ms"), which Patrick found was
> > backported to v5.4.49 as 828b192c57e8, and you found was backported to
> > v5.7.6 as afaff825e3a4.
> >
> > Oddly, Patrick reported that v5.7.7 worked correctly, even though it
> > still contains afaff825e3a4.
> >
> > I guess in the absence of any other clues we'll have to revert it.
> > I hate to do that because that means we'll have slow resume of
> > Thunderbolt-connected devices again, but that's better than having
> > GPUs completely broken.
> >
> > Could you and Patrick open bugzilla.kernel.org reports, attach dmesg
> > logs and "sudo lspci -vv" output, and add the URLs to Kai-Heng's
> > original report at https://bugzilla.kernel.org/show_bug.cgi?id=206837
> > and to this thread?
> >
> > There must be a way to fix the slow resume problem without breaking
> > the GPUs.
> >
>
> I wouldn't be surprised if this is related to the Intel bridge we
> check against for Nouveau.. I still have to check on another laptop
> with the same bridge our workaround was required as well but wouldn't
> be surprised if it shows the same problem. Will get you the
> information from both systems tomorrow then.
>
> > Bjorn
> >

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
