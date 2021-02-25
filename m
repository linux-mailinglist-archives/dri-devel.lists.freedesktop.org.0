Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD323258C8
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 22:39:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA2C56E49B;
	Thu, 25 Feb 2021 21:39:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1F76E49B
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 21:39:10 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id b18so186369wrn.6
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 13:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RKlk+S7U+iGlFCsfzUlcqhvFkWf9gTjST6OuEL8Hf+E=;
 b=QRhaJ15StATCRpNoOCXYalx3Jq//c2l3wxIPSHCx2ZUx7PhPBRcHjSo2KfFraDnR+i
 lW56JkiLTBtb17dN2HGv4Q17VinKVhaOjXvn+SrEwrPsnZkbjbS9UNr4p7yC/Njr+9Dr
 jo+na/UIZgZvTi1kbO90y4pJLRMlow7NLDhiTVhG039Bgh6Gg6g51bxkhup5OJCo4kiq
 BO2ctKIpSDhlKkPVVF1vSwqx+ABYkQeFBAOI8T1eCpK0kovuXE1Jx0F79Gg7P35IwVTE
 2CiGjoxIFqOvRjaqpUPi3bLpRuw9ArdcJmoRSNYPg9N7BlPk6n+d1qOigoae9KxRedKf
 ENIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=RKlk+S7U+iGlFCsfzUlcqhvFkWf9gTjST6OuEL8Hf+E=;
 b=pzegMiFZ9lwDXkverPIY8X7jBt8nHCInhA8ONrHB84CoVyKvXuxvnjmC/jHw/DLCb3
 QJVls1I3tkbiLTXnyubFMUPR0+m2MCe39M9BwyYiVoBe35szd5bx642OHRBeMNhuBb0h
 +GzUhPQNaVV5sgds2Gjy6lg9qaLChgNuBV8r5BivWMEll8O3bXb0srMnrYuL8pzHbb9s
 TMbF04zWh/SaID4hLL9eUXpMPWmyK/2Vf5Urzg1mBZIzNm7JOa+bSs5ft+W9FWjtueut
 ssbIFsV2QU4Psg6mb67nU8PCcavpHdzlYXfVQyvzRJHqWG+oiGJ67JpH8fOB7pCXkBO5
 rj0A==
X-Gm-Message-State: AOAM5311qZsQCQ5dgo7iq0a6uO+ThgL0oJ6QIj9AK3dbwP74c+ZvwJuE
 MlPlpTEYf7si/9NLMNvt1nc=
X-Google-Smtp-Source: ABdhPJzdAThJkYc4rPFOWntXUuVU0UzkKHnBBdJqg7bHtBbcxjDrGGNA7TWI/nrBrSLCjNlAVLQGMA==
X-Received: by 2002:adf:e791:: with SMTP id n17mr5905wrm.322.1614289149567;
 Thu, 25 Feb 2021 13:39:09 -0800 (PST)
Received: from eldamar (80-218-24-251.dclient.hispeed.ch. [80.218.24.251])
 by smtp.gmail.com with ESMTPSA id c3sm10930247wrw.80.2021.02.25.13.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 13:39:08 -0800 (PST)
Date: Thu, 25 Feb 2021 22:39:07 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: Re: [PATCH v3] drm: Use USB controller's DMA mask when importing
 dmabufs
Message-ID: <YDgY+4dE4y231eYF@eldamar.lan>
References: <20210223105842.27011-1-tzimmermann@suse.de>
 <YDTk3L3gNxDE3YrC@kroah.com> <YDTrDAlcFH/7/7DD@phenom.ffwll.local>
 <YDTu4ugLo23APyaM@kroah.com>
 <CAKMK7uG67eHEFOCJBJCtwFbwoUWQsER4DNBKRp6e75uywvF1pw@mail.gmail.com>
 <YDT0GIJEhWRp0w5F@kroah.com>
 <9b1e0c9b-2337-d76b-4870-72fbe8495fd2@suse.de>
 <YDT+pusRy3/JpmRR@kroah.com> <YDf0JdIUJU74J4PJ@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YDf0JdIUJU74J4PJ@debian>
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
Cc: Sean Paul <sean@poorly.run>, Mathias Nyman <mathias.nyman@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@linux.ie>,
 Greg KH <gregkh@linuxfoundation.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Oliver Neukum <oneukum@suse.com>, Johan Hovold <johan@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Hans de Goede <hdegoede@redhat.com>, Alan Stern <stern@rowland.harvard.edu>,
 stable <stable@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ben Hutchings <ben@decadent.org.uk>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Feb 25, 2021 at 07:01:57PM +0000, Sudip Mukherjee wrote:
> On Tue, Feb 23, 2021 at 02:09:58PM +0100, Greg KH wrote:
> > On Tue, Feb 23, 2021 at 01:51:09PM +0100, Thomas Zimmermann wrote:
> > > Hi
> > > 
> > > Am 23.02.21 um 13:24 schrieb Greg KH:
> > > > On Tue, Feb 23, 2021 at 01:14:30PM +0100, Daniel Vetter wrote:
> > > > > On Tue, Feb 23, 2021 at 1:02 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > > > > 
> > > > > > On Tue, Feb 23, 2021 at 12:46:20PM +0100, Daniel Vetter wrote:
> > > > > > > On Tue, Feb 23, 2021 at 12:19:56PM +0100, Greg KH wrote:
> > > > > > > > On Tue, Feb 23, 2021 at 11:58:42AM +0100, Thomas Zimmermann wrote:
> > > > > > > > > USB devices cannot perform DMA and hence have no dma_mask set in their
> > > > > > > > > device structure. Importing dmabuf into a USB-based driver fails, which
> > > > > > > > > break joining and mirroring of display in X11.
> > > > > > > > > 
> > > > > > > > > For USB devices, pick the associated USB controller as attachment device,
> > > > > > > > > so that it can perform DMA. If the DMa controller does not support DMA
> > > > > > > > > transfers, we're aout of luck and cannot import.
> > > > > > > > > 
> > > > > > > > > Drivers should use DRM_GEM_SHMEM_DROVER_OPS_USB to initialize their
> > > > > > > > > instance of struct drm_driver.
> > > > > > > > > 
> > > > > > > > > Tested by joining/mirroring displays of udl and radeon un der Gnome/X11.
> > > > > > > > > 
> > > > > > > > > v3:
> > > > > > > > >    * drop gem_create_object
> > > > > > > > >    * use DMA mask of USB controller, if any (Daniel, Christian, Noralf)
> > > > > > > > > v2:
> > > > > > > > >    * move fix to importer side (Christian, Daniel)
> > > > > > > > >    * update SHMEM and CMA helpers for new PRIME callbacks
> > > > > > > > > 
> > > > > > > > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > > > > > > > Fixes: 6eb0233ec2d0 ("usb: don't inherity DMA properties for USB devices")
> > > > > > > > > Cc: Christoph Hellwig <hch@lst.de>
> > > > > > > > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > > > > > > Cc: Johan Hovold <johan@kernel.org>
> > > > > > > > > Cc: Alan Stern <stern@rowland.harvard.edu>
> > > > > > > > > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > > > > > > Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> > > > > > > > > Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
> > > > > > > > > Cc: Oliver Neukum <oneukum@suse.com>
> > > > > > > > > Cc: Thomas Gleixner <tglx@linutronix.de>
> > > > > > > > > Cc: <stable@vger.kernel.org> # v5.10+
> > > > > > > > > ---
> <snip>
> > > > > > > > 
> > > > > > > > There shouldn't be anything "special" about a DRM driver that needs this
> > > > > > > > vs. any other driver that might want to know about DMA things related to
> > > > > > > > a specific USB device.  Why isn't this an issue with the existing
> > > > > > > > storage or v4l USB devices?
> > > > > > > 
> > > > > > > The trouble is that this is a regression fix for 5.9, because the dma-api
> > > > > > > got more opinionated about what it allows. The proper fix is a lot more
> > > > > > > invasive (we essentially need to rework the drm_prime.c to allow dma-buf
> > > > > > > importing for just cpu access), and that's a ton more invasive than just a
> > > > > > > small patch with can stuff into stable kernels.
> > > > > > > 
> > > > > > > This here is ugly, but it should at least get rid of black screens again.
> > > > > > > 
> > > > > > > I think solid FIXME comment explaining the situation would be good.
> > > > > > 
> > > > > > Why can't I take a USB patch for a regression fix?  Is drm somehow
> > > > > > stand-alone that you make changes here that should belong in other
> > > > > > subsystems?
> > > > > > 
> > > > > > {hint, it shouldn't be}
> > > > > > 
> > > > > > When you start poking in the internals of usb controller structures,
> > > > > > that logic belongs in the USB core for all drivers to use, not in a
> > > > > > random tiny subsystem where no USB developer will ever notice it?  :)
> > > > > 
> > > > > Because the usb fix isn't the right fix here, it's just the duct-tape.
> > > > > We don't want to dig around in these internals, it's just a convenient
> > > > > way to shut up the dma-api until drm has sorted out its confusion.
> > > > > 
> > > > > We can polish the turd if you want, but the thing is, it's still a turd ...
> > > > > 
> > > > > The right fix is to change drm_prime.c code to not call dma_map_sg
> > > > > when we don't need it. The problem is that roughly 3 layers of code
> > > > > (drm_prime, dma-buf, gem shmem helpers) are involved. Plus, since
> > > > > drm_prime is shared by all drm drivers, all other drm drivers are
> > > > > impacted too. We're not going to be able to cc: stable that kind of
> > > > > stuff. Thomas actually started with that series, until I pointed out
> > > > > how bad things really are.
> > > > > 
> > > > > And before you ask: The dma-api change makes sense, and dma-api vs drm
> > > > > relations are strained since years, so we're not going ask for some
> > > > > hack there for our abuse to paper over the regression. I've been in
> > > > > way too many of those threads, only result is shouting and failed
> > > > > anger management.
> > > > 
> > > > Let's do it right.  If this is a regression from 5.9, it isn't a huge
> > > > one as that kernel was released last October.  I don't like to see this
> > > > messing around with USB internals in non-USB-core code please.
> > > 
> > > I get
> > > 
> > >  > git tag --contains 6eb0233ec2d0
> > >  ...
> > >  v5.10-rc1
> > >  ...
> > 
> > Ah, I thought you said 5.9 was when the problem happened, ok, yes, 5.10
> > is slow to get out to a lot of distros that do not update frequently :(
> 
> iiuc, Debian Bullseye release will be having v5.10.y.
> 
> Ben ?

That is correct, Debian bullseye will ship with 5.10.y.

Regards,
Salvatore
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
