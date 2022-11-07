Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F34E61FE9F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 20:28:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F0910E3A7;
	Mon,  7 Nov 2022 19:28:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C4C10E3A7
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 19:28:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 49FD7B810B3
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 19:28:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8915DC4347C
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 19:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667849292;
 bh=TZKyIaX0u5nJ3UCma7bzPt1mKZ6/XSl9drIlz/9920I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=sXWkVldcgB3q6cs/Wz7FXe2KoWwpioNLFzaTOmsrZerJ8v3hxPfwk21YXuqprbS6R
 mTpkEok0mR2rU+E52CySxPevkNICPzrenDdbDEslasbEJKFROGLzKSwWrpDk6jsZRd
 ftPmiARRNape3VGPO/niNQo9CFG0dZfuMKKEIDquAuLeoLCVrCObNikUmUH1rk99Mn
 4S9JV84eYtgOzCn6CzGLAXIXhO89T+HoI2jkBFn+z72pKQnbL/F7czyOTb4sxAJxhU
 T8Yz3HRG8SbJmjVyHj+3Jf4GaWbDCsw8kW+BOPVjU+doCLHJP+xx+0e6TC/a3vQvCI
 GW/rpNOAOLhnQ==
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-3701a0681daso114306317b3.4
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 11:28:12 -0800 (PST)
X-Gm-Message-State: ACrzQf2lWP4tIbimgUxTRkwn9E4WYULdyjkPYZ3Ph7aFrGMUdFMOj3li
 iVIAN7P+SLqeiGUXf9QyUgEv5TPogDdrbGBCWmQ=
X-Google-Smtp-Source: AMsMyM5sSsqkCEAZ6ZNJYdROpT7FWWWPULEgBRn6snyuHnepkxvU3yGCTRWry1wc7DqPA+3ZyNclkz3eUjO5EJdtpkg=
X-Received: by 2002:a81:5f46:0:b0:370:2d8c:8193 with SMTP id
 t67-20020a815f46000000b003702d8c8193mr777050ywb.221.1667849291594; Mon, 07
 Nov 2022 11:28:11 -0800 (PST)
MIME-Version: 1.0
References: <20221102203405.1797491-2-ogabbay@kernel.org>
 <Y2MMCIe5wND2XPqE@kroah.com>
 <CAFCwf13uLj=P6u6FAcY8M5qAXoaBdb+Ha-TYj0j2FAZnFAPFYg@mail.gmail.com>
 <CAFCwf12yRUG4593ozJMEwaaJBKyWqXTTCjef9O_fzWdQBxVrtw@mail.gmail.com>
 <Y2kAcCu4z2LUMN7u@nvidia.com>
 <CAFCwf10K-dTu455QfOK8i6thismY-FUN2Rws830EGiqOcGWFgA@mail.gmail.com>
 <Y2kDzPswkKyZyRpS@nvidia.com>
 <CAFCwf10A=-bj2nR8WasNxyQQ07D24Je04tzKxqv2X_XnA0BUSQ@mail.gmail.com>
 <Y2kRvyR8VrZrO/1H@nvidia.com>
 <CAFCwf12E4K7bpLcDvTtG1mKxoy1JnchXGCKDvcKAayCFvGWXXQ@mail.gmail.com>
 <Y2kyvswuCsO0x1/2@nvidia.com>
In-Reply-To: <Y2kyvswuCsO0x1/2@nvidia.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Mon, 7 Nov 2022 21:27:45 +0200
X-Gmail-Original-Message-ID: <CAFCwf11x1pwsgu=UWGOhjCYcLzRWOiAaiPonRB9Nh3TCo4KiUw@mail.gmail.com>
Message-ID: <CAFCwf11x1pwsgu=UWGOhjCYcLzRWOiAaiPonRB9Nh3TCo4KiUw@mail.gmail.com>
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

On Mon, Nov 7, 2022 at 6:31 PM Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> On Mon, Nov 07, 2022 at 05:53:55PM +0200, Oded Gabbay wrote:
> > On Mon, Nov 7, 2022 at 4:10 PM Jason Gunthorpe <jgg@nvidia.com> wrote:
> > >
> > > On Mon, Nov 07, 2022 at 04:02:01PM +0200, Oded Gabbay wrote:
> > > > On Mon, Nov 7, 2022 at 3:10 PM Jason Gunthorpe <jgg@nvidia.com> wrote:
> > > > >
> > > > > On Mon, Nov 07, 2022 at 03:01:08PM +0200, Oded Gabbay wrote:
> > > > > > I don't agree with your statement that it should be "a layer over top of DRM".
> > > > > > Anything on top of DRM is a device driver.
> > > > > > Accel is not a device driver, it is a new type of drm minor / drm driver.
> > > > >
> > > > > Yeah, I still think this is not the right way, you are getting almost
> > > > > nothing from DRM and making everything more complicated in the
> > > > > process.
> > > > >
> > > > > > The only alternative imo to that is to abandon the idea of reusing
> > > > > > drm, and just make an independant accel core code.
> > > > >
> > > > > Not quite really, layer it properly and librarize parts of DRM into
> > > > > things accel can re-use so they are not intimately tied to the DRM
> > > > > struct device notion.
> > > > >
> > > > > IMHO this is much better, because accel has very little need of DRM to
> > > > > manage a struct device/cdev in the first place.
> > > > >
> > > > > Jason
> > > > I'm not following. How can an accel device be a new type of drm_minor,
> > > > if it doesn't have access to all its functions and members ?
> > >
> > > "drm_minor" is not necessary anymore. Strictly managing minor numbers
> > > lost its value years ago when /dev/ was reorganized. Just use
> > > dynamic minors fully.
> > drm minor is not just about handling minor numbers. It contains the
> > entire code to manage devices that register with drm framework (e.g.
> > supply callbacks to file operations), manage their lifecycle,
> > resources (e.g. automatic free of resources on release), sysfs,
> > debugfs, etc.
>
> This is why you are having such troubles, this is already good library
> code. You don't need DRM to wrapper debugfs APIs, for instance. We
> have devm, though maybe it is not a good idea, etc
>
> Greg already pointed out the sysfs was not being done correctly
> anyhow.
>
> I don't think DRM is improving on these core kernel services. Just use
> the normal stuff directly.
I get what you are saying but if I do all that, then how is this
subsystem related to DRM and re-using its code ? (at least at this
stage)
btw, using the basic stuff directly was my original intention, if you
remember the original accel mail thread from July/August.
And then we all decided in LPC that we shouldn't do that and instead
accel should use the DRM code and just expose a new major+minor for
the new drivers.

So, something doesn't add up...
imo, we need to choose between doing accel either as a small new
feature in drm, or as an independent subsystem.
I just don't see how I do the former without calling drm code directly
and using all its wrappers.

>
> > > > How will accel device leverage, for example, the GEM code without
> > > > being a drm_minor ?
> > >
> > > Split GEM into a library so it doesn't require that.
> > I don't see the advantage of doing that over defining accel as a new
> > type of drm minor.
>
> Making things into smaller libraries is recognized as a far better
> kernel approach than trying to make a gigantic wide midlayer that stuffs
> itself into everything. LWN called this the "midlayer mistake" and
> wrote about the pitfalls a long time ago:
>
> https://lwn.net/Articles/336262/
>
> It is exactly what you are experiencing trying to stretch a
> midlayer even further out.
>
> Jason
I'm all for breaking it down to smaller libraries, I completely agree with you.
But as you wrote above, why do I even need to use the drm wrappers for
the basic stuff ? I'll just call the kernel api directly.
And if that's the case then I don't need to rip that code out of the
heart of drm and make it a separate module.

For GEM (as an example of something less basic) it might be a
different story, but we are not there yet.

Oded
