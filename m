Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2338D61F800
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 16:54:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB7FC10E424;
	Mon,  7 Nov 2022 15:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868B610E424
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 15:54:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CA68E60E01
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 15:54:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03690C4314F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 15:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667836463;
 bh=Du4ly8cNdD6kjhACACFPcG0D53BO1orBmWkVY19SAC8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jSPZaL/qYt8lVzFah4sOQFP9Y9mdruk+onCFhiT9URVGSdOSv3knpSF1Tk37S7thp
 PHHx00VeajRbHY7NBuGNHSDLPqWjOd3GpwzLTCfVtgN776UoUIP+YBwXKiW+jOLv0L
 tkiSm7J51AL2RDTJrh2EgcatR0blclMSwsAs0jZuM2pVfiZrcl55qddGU7wCgf7J69
 cGpiC4oFjOZZiz9G+nXka9UlJtj3d6AXPM48wwU7/MRegtBEMfqvAA3+dq4Usy28yo
 DSqV6wZWp2w121L1Ju/KiEsaua4pukpDAoF/DoCI0K+sSSbwqIfv0ewsVpo7Zgu0Kr
 OUBJbkUw/dZog==
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-367b8adf788so108493677b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 07:54:22 -0800 (PST)
X-Gm-Message-State: ACrzQf3ceSr/SfnegDnTpIHMRIijVW608+SYWZsdq8458hZRO0xQVm3l
 drk3MBpWXVWtA4KZj1Io3mGL6E1Pz5CkXRSphDU=
X-Google-Smtp-Source: AMsMyM4jwnUpLxOtIWwo+X7ZHHcfMiwY9qO4EgINDShI8Y6XVbjNjiu+ZLswLYHTygF5kRDP46mEmEeYgHV6lgGl9vg=
X-Received: by 2002:a05:690c:825:b0:36a:b160:21b with SMTP id
 by5-20020a05690c082500b0036ab160021bmr48865140ywb.211.1667836461563; Mon, 07
 Nov 2022 07:54:21 -0800 (PST)
MIME-Version: 1.0
References: <20221102203405.1797491-1-ogabbay@kernel.org>
 <20221102203405.1797491-2-ogabbay@kernel.org>
 <Y2MMCIe5wND2XPqE@kroah.com>
 <CAFCwf13uLj=P6u6FAcY8M5qAXoaBdb+Ha-TYj0j2FAZnFAPFYg@mail.gmail.com>
 <CAFCwf12yRUG4593ozJMEwaaJBKyWqXTTCjef9O_fzWdQBxVrtw@mail.gmail.com>
 <Y2kAcCu4z2LUMN7u@nvidia.com>
 <CAFCwf10K-dTu455QfOK8i6thismY-FUN2Rws830EGiqOcGWFgA@mail.gmail.com>
 <Y2kDzPswkKyZyRpS@nvidia.com>
 <CAFCwf10A=-bj2nR8WasNxyQQ07D24Je04tzKxqv2X_XnA0BUSQ@mail.gmail.com>
 <Y2kRvyR8VrZrO/1H@nvidia.com>
In-Reply-To: <Y2kRvyR8VrZrO/1H@nvidia.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Mon, 7 Nov 2022 17:53:55 +0200
X-Gmail-Original-Message-ID: <CAFCwf12E4K7bpLcDvTtG1mKxoy1JnchXGCKDvcKAayCFvGWXXQ@mail.gmail.com>
Message-ID: <CAFCwf12E4K7bpLcDvTtG1mKxoy1JnchXGCKDvcKAayCFvGWXXQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/3] drivers/accel: define kconfig and register a
 new major
To: Jason Gunthorpe <jgg@nvidia.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Christoph Hellwig <hch@infradead.org>,
 Jagan Teki <jagan@amarulasolutions.com>, John Hubbard <jhubbard@nvidia.com>,
 stanislaw.gruszka@intel.com, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Arnd Bergmann <arnd@arndb.de>, Jiho Chu <jiho.chu@samsung.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 7, 2022 at 4:10 PM Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> On Mon, Nov 07, 2022 at 04:02:01PM +0200, Oded Gabbay wrote:
> > On Mon, Nov 7, 2022 at 3:10 PM Jason Gunthorpe <jgg@nvidia.com> wrote:
> > >
> > > On Mon, Nov 07, 2022 at 03:01:08PM +0200, Oded Gabbay wrote:
> > > > I don't agree with your statement that it should be "a layer over top of DRM".
> > > > Anything on top of DRM is a device driver.
> > > > Accel is not a device driver, it is a new type of drm minor / drm driver.
> > >
> > > Yeah, I still think this is not the right way, you are getting almost
> > > nothing from DRM and making everything more complicated in the
> > > process.
> > >
> > > > The only alternative imo to that is to abandon the idea of reusing
> > > > drm, and just make an independant accel core code.
> > >
> > > Not quite really, layer it properly and librarize parts of DRM into
> > > things accel can re-use so they are not intimately tied to the DRM
> > > struct device notion.
> > >
> > > IMHO this is much better, because accel has very little need of DRM to
> > > manage a struct device/cdev in the first place.
> > >
> > > Jason
> > I'm not following. How can an accel device be a new type of drm_minor,
> > if it doesn't have access to all its functions and members ?
>
> "drm_minor" is not necessary anymore. Strictly managing minor numbers
> lost its value years ago when /dev/ was reorganized. Just use
> dynamic minors fully.
drm minor is not just about handling minor numbers. It contains the
entire code to manage devices that register with drm framework (e.g.
supply callbacks to file operations), manage their lifecycle,
resources (e.g. automatic free of resources on release), sysfs,
debugfs, etc.

To take all of that out of drm.ko and make it a separate kernel module
is a big change, which I don't know if the drm people even want me to
do.

>
> > How will accel device leverage, for example, the GEM code without
> > being a drm_minor ?
>
> Split GEM into a library so it doesn't require that.
I don't see the advantage of doing that over defining accel as a new
type of drm minor.
>
> > Librarizing parts of DRM sounds nice in theory but the reality is that
> > everything there is interconnected, all the structures are
> > interdependent.
>
> Yes, the kernel is full of stuff that needs improving. Let's not take
> shortcuts.
It's not about shortcuts. It's about a different way to solve this
issue which I don't think is anyway hacky or inappropriate.

>
> > I would have to re-write the entire DRM library to make such a thing
> > work. I don't think this was the intention.
>
> Not necessarily you, whoever someday needs GEM would have to do some
> work.
>
> > The current design makes the accel device an integral part of drm,
> > with very minimal code duplication and without re-writing DRM.
>
> And it smells bad, you can't even make it into a proper module. Who
> knows what other problems will come.
I would argue that if accel is part of drm, it doesn't have to be a
proper module. I don't see that as a hard requirement.
Oded

>
> Jason
