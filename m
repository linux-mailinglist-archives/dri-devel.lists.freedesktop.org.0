Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 907841917A3
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 18:32:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D498789218;
	Tue, 24 Mar 2020 17:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66D8389218
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 17:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585071115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YKYVUc3+krvW6CPC9TPnDi0EmOpDKThFNJs1I7s+nis=;
 b=WqqIWe5ZkAvfDtM57VS0bto/D0dImSZr6IkReHZYzfq5ttG0nK7wq7Ds3vfnl6DeP9Hx13
 o+AIgRYVRHzWeB0PUKeLxyf/mZeqOM2X1JfFZd4NekgDRw3/0z2tP3D/53mEnJUNqaRvMa
 VMLy90VhU8B4kdv1We+CS2GEgj4zU6Y=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-LCXu7q6_MtishIe9AFTpIg-1; Tue, 24 Mar 2020 13:31:53 -0400
X-MC-Unique: LCXu7q6_MtishIe9AFTpIg-1
Received: by mail-qk1-f200.google.com with SMTP id a136so16067370qkc.13
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 10:31:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PJHNzYzu8vMBhLyQungT7C1b2BGUh9KVFCtBdVqVQ8A=;
 b=Z5IevRwMB3igzzMJRgLh8xRrUTRnSucEAoQf6HMUXIA1HZkwDsBwPiFpQ2Ibr+7tto
 COM2b0Dg0KxEj9msvu42thWPkI8//xCP+ubGYlGysabnimU+l10Y4svP5D7wFhMxjKCu
 sUHQfkSonzFTK6PuJOXn/P7D9Z/sNEIf2mxfg9PzgIwemVyiDs96UUrcZ8Vk2R7Eg6eE
 H2J2LGSED3ZPzArOk1EeSs7MRDbToKQcvb+IrhGufEr12niT+GKVDEEy88K86+Ase5T8
 fcIjLY8eK5DRLAgSnBUdxMaNfeNnfsyjcGNj9ILcOfNvsEtyoQKHnbLc68vJ8erRA6Ig
 s4fw==
X-Gm-Message-State: ANhLgQ1gCo/IMYo8o5s4DHs4F1RTV/Sw7eGghbOw7M2Ij0EPJZAM0www
 mUblBgUi39oL53zCJCi8rvDV0OWOp23SsirYuZXOfoUQlO7dfOsBvs8Rmc9cRhCxK2796BqRmZk
 hV3MQQCiz7feELu5feC4WdI0Ga8bNoyk7mcRKI3Z8dJwI
X-Received: by 2002:a37:a151:: with SMTP id k78mr15810446qke.62.1585071113022; 
 Tue, 24 Mar 2020 10:31:53 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsT3+/NsUg5fFEiC7sl/xL5+Je1Wup8Qo3qgB+ijo3E137wcTx+VJFpMve9UNQQtDpuEDBDe/wRAdiHFGyqiS4=
X-Received: by 2002:a37:a151:: with SMTP id k78mr15810420qke.62.1585071112699; 
 Tue, 24 Mar 2020 10:31:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200310192627.437947-1-kherbst@redhat.com>
 <20200320221931.GA23783@google.com>
 <CACO55tsamLG5WE16U=psJpRWfz=7Fy5K8haGKHnhic1h0WAmqA@mail.gmail.com>
In-Reply-To: <CACO55tsamLG5WE16U=psJpRWfz=7Fy5K8haGKHnhic1h0WAmqA@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 24 Mar 2020 18:31:08 +0100
Message-ID: <CACO55ttvb5uC37ORiLuVBidhfSn-+WSReJ+aCfWR3k-fLtPBnA@mail.gmail.com>
Subject: Re: [PATCH v7] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
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
Cc: Linux PM <linux-pm@vger.kernel.org>, Linux PCI <linux-pci@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Mar 21, 2020 at 2:02 AM Karol Herbst <kherbst@redhat.com> wrote:
>
> On Fri, Mar 20, 2020 at 11:19 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> >
> > On Tue, Mar 10, 2020 at 08:26:27PM +0100, Karol Herbst wrote:
> > > Fixes the infamous 'runtime PM' bug many users are facing on Laptops with
> > > Nvidia Pascal GPUs by skipping said PCI power state changes on the GPU.
> > >
> > > Depending on the used kernel there might be messages like those in demsg:
> > >
> > > "nouveau 0000:01:00.0: Refused to change power state, currently in D3"
> > > "nouveau 0000:01:00.0: can't change power state from D3cold to D0 (config
> > > space inaccessible)"
> > > followed by backtraces of kernel crashes or timeouts within nouveau.
> > >
> > > It's still unkown why this issue exists, but this is a reliable workaround
> > > and solves a very annoying issue for user having to choose between a
> > > crashing kernel or higher power consumption of their Laptops.
> >
> > Thanks for the bugzilla link.  The bugzilla mentions lots of mailing
> > list discussion.  Can you include links to some of that?
> >
> > IIUC this basically just turns off PCI power management for the GPU.
> > Can you do that with something like the following?  I don't know
> > anything about DRM, so I don't know where you could save the pm_cap,
> > but I'm sure the driver could keep it somewhere.
> >
>
> Sure this would work? From a quick look over the pci code, it looks
> like a of code would be skipped we really need, like the platform code
> to turn off the GPU via ACPI. But I could also remember incorrectly on
> how all of that worked again. I can of course try and see what the
> effect of this patch would be. And would the parent bus even go into
> D3hot if it knows one of its children is still at D0? Because that's
> what the result of that would be as well, no? And I know that if the
> bus stays in D0, that it has a negative impact on power consumption.
>
> Anyway, I will try that out, I am just not seeing how that would help.
>

so it seems like that has worked unless I screwed up locally. Will do
some proper testing and then I think we won't need to go through the
pci tree anymore as no changes are required there with that.

> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> > index b65ae817eabf..2ad825e8891c 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> > @@ -618,6 +618,23 @@ nouveau_drm_device_fini(struct drm_device *dev)
> >         kfree(drm);
> >  }
> >
> > +static void quirk_broken_nv_runpm(struct drm_device *drm_dev)
> > +{
> > +       struct pci_dev *pdev = drm_dev->pdev;
> > +       struct pci_dev *bridge = pci_upstream_bridge(pdev);
> > +
> > +       if (!bridge || bridge->vendor != PCI_VENDOR_ID_INTEL)
> > +               return;
> > +
> > +       switch (bridge->device) {
> > +       case 0x1901:
> > +               STASH->pm_cap = pdev->pm_cap;
> > +               pdev->pm_cap = 0;
> > +               NV_INFO(drm_dev, "Disabling PCI power management to avoid bug\n");
> > +               break;
> > +       }
> > +}
> > +
> >  static int nouveau_drm_probe(struct pci_dev *pdev,
> >                              const struct pci_device_id *pent)
> >  {
> > @@ -699,6 +716,7 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
> >         if (ret)
> >                 goto fail_drm_dev_init;
> >
> > +       quirk_broken_nv_runpm(drm_dev);
> >         return 0;
> >
> >  fail_drm_dev_init:
> > @@ -735,6 +753,9 @@ nouveau_drm_remove(struct pci_dev *pdev)
> >  {
> >         struct drm_device *dev = pci_get_drvdata(pdev);
> >
> > +       /* If we disabled PCI power management, restore it */
> > +       if (STASH->pm_cap)
> > +               pdev->pm_cap = STASH->pm_cap;
> >         nouveau_drm_device_remove(dev);
> >         pci_disable_device(pdev);
> >  }
> >

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
