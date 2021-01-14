Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E9B2F5CF1
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 10:11:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B86FF6E08C;
	Thu, 14 Jan 2021 09:11:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EFC06E08C
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 09:11:13 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id x13so4575253oto.8
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 01:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1QrDVL3JghRKNRHXL12rqtEE0tKj2MqpWK7d7Dp7koU=;
 b=j27X4dwjO4Ly94sasNgINsUIh1NWEsF5UTfak9x5atHAeWWZiIbuaLwkiXiyHR4lHC
 2nQXhfulw5ihbAKgOjlO32328eHJ98wHGC3O3Tms28ltWSytb+hNjW6GzhnnBj9Ws/I/
 v9vITQfeAskAHWoUudBGMewa24VNZNWjqsIyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1QrDVL3JghRKNRHXL12rqtEE0tKj2MqpWK7d7Dp7koU=;
 b=HX/TSvDxOC9AuzkD+eZ0r25nFYmws7v4UA2ox6KzbymQZUyO2/EBBcRmXnUdJ8tAVa
 gbyW2Vn6a/k8SnSYY/jU2sAqh0rosBH3htFiqemJWJuGe7Xn0I2Rrde2QJmzzYgtPCAH
 A3X37ky0vnanlU5bQDkNzwvjONJ+ke68tDR5F31DpeRNIWPKHfKJm5EkBUy3Om6ocJ0a
 c6TnYuQfNN0PrnpWFTuN4w0HXe81v/tMkSWYMPOtHGGtKfqdeZWYq7U+lMQb/g2DvkVh
 KfveQn01PNi/s9w20A1Rwe3Un0N7jIqrFLUVPUdInYF3l0l6fGdL2Ep/f2jJQj8vv31/
 F9Ug==
X-Gm-Message-State: AOAM531mdvgscyqDBTHo38gyMsh8EzTyrH1sl/FiXaxX0MTALFt9d8VR
 VNPKH29Z3ZI2hxERQV8/JYCJkE6EjMOGUqPqSBhlug==
X-Google-Smtp-Source: ABdhPJzCOWPyVHkXXcDvYk5dCjB0QhimhzZ6T8IE/czFeItPQR0TAeKiu6z7JidRPyHoe2BOUth2Y9ayNic9tvMeU0U=
X-Received: by 2002:a9d:23ca:: with SMTP id t68mr4050934otb.281.1610615472722; 
 Thu, 14 Jan 2021 01:11:12 -0800 (PST)
MIME-Version: 1.0
References: <20210113145009.1272040-1-lee.jones@linaro.org>
 <20210113190118.GA180942@ravnborg.org> <20210113202546.GG3975472@dell>
 <877dofriss.fsf@intel.com>
In-Reply-To: <877dofriss.fsf@intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 14 Jan 2021 10:11:01 +0100
Message-ID: <CAKMK7uEU32=Sw4F6b4RzkX0Y6svVn0nL+b6cm6e6KYN8bni_SQ@mail.gmail.com>
Subject: Re: [PATCH 00/31] Rid W=1 warnings from Video
To: Jani Nikula <jani.nikula@linux.intel.com>
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
Cc: "Eddie C. Dost" <ecd@skynet.be>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Anthony Tong <atong@uiuc.edu>, Alex Kern <alex.kern@gmx.de>,
 dri-devel <dri-devel@lists.freedesktop.org>, Oliver Kropp <dok@directfb.org>,
 Software Engineering <lg@denx.de>, Antonino Daplas <adaplas@pol.net>,
 Frodo Looijaard <frodol@dds.nl>, Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>, Urs Ganse <ursg@uni.de>,
 Thibaut VARENE <varenet@parisc-linux.org>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>, Sam Ravnborg <sam@ravnborg.org>,
 Helge Deller <deller@gmx.de>, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Ani Joshi <ajoshi@unixbox.com>, daniel.mantione@freepascal.org,
 "Mark D. Studebaker" <mdsxyz123@yahoo.com>,
 Alex Dewar <alex.dewar90@gmail.com>, Emmanuel Marty <core@ggi-project.org>,
 carter@compsci.bristol.ac.uk, Alan Cox <alan@redhat.com>,
 Jeff Garzik <jgarzik@pobox.com>, Ilario Nardinocchi <nardinoc@cs.unibo.it>,
 Jakub Jelinek <jakub@redhat.com>, Ani Joshi <ajoshi@shell.unixbox.com>,
 "Thomas J. Moore" <dark@mama.indstate.edu>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 John Fremlin <vii@users.sourceforge.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 William Rucklidge <wjr@cs.cornell.edu>, Paul Mundt <lethal@chaoticdreams.org>,
 Brad Douglas <brad@neruo.com>, Ralph Metzler <rjkm@thp.uni-koeln.de>,
 James Simmons <jsimmons@users.sf.net>, Ghozlane Toumi <gtoumi@laposte.net>,
 Jim Hague <jim.hague@acm.org>,
 Egbert Eich <Egbert.Eich@physik.tu-darmstadt.de>,
 Jes Sorensen <jds@kom.auc.dk>, Gerd Knorr <kraxel@goldbach.in-berlin.de>,
 Jingoo Han <jingoohan1@gmail.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Martin Mares <mj@ucw.cz>,
 Philip Edelbrock <phil@netroedge.com>, Ben Dooks <ben@simtec.co.uk>,
 Hannu Mallat <hmallat@cc.hut.fi>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Jakub Jelinek <jj@ultra.linux.cz>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 14, 2021 at 10:04 AM Jani Nikula
<jani.nikula@linux.intel.com> wrote:
>
> On Wed, 13 Jan 2021, Lee Jones <lee.jones@linaro.org> wrote:
> > On Wed, 13 Jan 2021, Sam Ravnborg wrote:
> >
> >> Hi Lee,
> >>
> >> On Wed, Jan 13, 2021 at 02:49:38PM +0000, Lee Jones wrote:
> >> > This set is part of a larger effort attempting to clean-up W=1
> >> > kernel builds, which are currently overwhelmingly riddled with
> >> > niggly little warnings.
> >> >
> >> > This patch-set clears all of the W=1 warnings currently residing
> >> > in drivers/video.
> >>
> >> I am sorry to say that I expect most of your nice patches to clash
> >> with patches that is already present in drm-misc-next.
> >>
> >> drivers/video/ are warning free with W=1 in drm-misc-next today.
> >>
> >> I do not know why drm-misc-next is not yet pullled into linux-next.
> >
> > Well that kinda sucks.  What are the chances of that?
> >
> > Most of my patches fix issues that have been there for years!

I planned to go through them all today, let's see what's still needed.

> We auto-update the for-linux-next and for-linux-next-fixes branches, and
> they seem to be up-to-date [1].

It only happened last week instead of right after -rc1 due to some
confusion, but it should have been in linux-next for a few days
already.

> How recent are the fixes, maybe because of this: [2]?
>
> BR,
> Jani.
>
>
> [1] https://cgit.freedesktop.org/drm/drm-misc
> [2] http://lore.kernel.org/r/20210114113107.622102e0@canb.auug.org.au

Patch for that just got committted, so this shouldn't be too big a
window for drm-misc-next to be excluded should have been very small.
-Daniel

>
> --
> Jani Nikula, Intel Open Source Graphics Center
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
