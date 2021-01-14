Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82ED12F5E1B
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 10:55:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D4F389803;
	Thu, 14 Jan 2021 09:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F084489337
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 09:54:58 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id n16so5158820wmc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 01:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=0mYCl2AGOHthXayCOObfgORajEyPV4a7M6hPbrxSVfE=;
 b=OGfYek0QWxWFQbIodeF+I2Bnoycmv8aqFpoguggftzndaos1+4FsM0LzNOF9PqLs73
 LBqT9QBnK1LVPv7NOJ8FhEGManM1ltfbvIeQzJkRKrHinoRFoTGD8S71I5kPaApZpkau
 aX7tsUxXtaclwdlowioNdUqnt7BIeqBPL0tdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=0mYCl2AGOHthXayCOObfgORajEyPV4a7M6hPbrxSVfE=;
 b=fYsY+ibYr5MgJF3bGhgOOpcC+EoxOT++Sa+bBQSdhIGVEK2fhTd2813TMeoLnByvgq
 BaPkIwICrKmMyRCkA+A/SyC3fT9dOr2onFBoZFb3LBdUmjJ/4uueqpR2VDdlzeGpZGg/
 4GnGuSTUxreXeL9xC7bC850VWT5ybUWEZoRCT7BEGWRdVAdOgE9ohODgLYUM7njLzIRm
 zi7mdZBOjgGoXjS9eqj8dCX4Sy5DJ9S9YXSDcTEAe8yZrr5ghgxyk8dAYDjRQL0gxSHp
 FG5pSxnUx1oQwOBm6ZOC9ltLQJZJ7gjLQv14w6PVT7JPYqo6e2GbLvpsFKeAcT8TFDhG
 C2Qg==
X-Gm-Message-State: AOAM531GY0ERbFZXijENH956tM+0VmETedsmx00bk1mCVpGrDaVPJPbl
 b8bL7M+x+Zwtp+TDG7jrFOm7Vw==
X-Google-Smtp-Source: ABdhPJxMZdtZOll2yUYWhxoHrZkm7K1UYrf/Enkfq57xEWjn4zTL4cYP4vIGllDJ/kTPG2hIM6eiwg==
X-Received: by 2002:a1c:4843:: with SMTP id v64mr3158507wma.186.1610618097602; 
 Thu, 14 Jan 2021 01:54:57 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j15sm9298512wrr.85.2021.01.14.01.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 01:54:56 -0800 (PST)
Date: Thu, 14 Jan 2021 10:54:53 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 00/31] Rid W=1 warnings from Video
Message-ID: <YAAU7V8Pr15+iUha@phenom.ffwll.local>
Mail-Followup-To: Jani Nikula <jani.nikula@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Jakub Jelinek <jakub@redhat.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Anthony Tong <atong@uiuc.edu>, Alex Kern <alex.kern@gmx.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Software Engineering <lg@denx.de>,
 Paul Mundt <lethal@chaoticdreams.org>,
 Frodo Looijaard <frodol@dds.nl>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 James Simmons <jsimmons@users.sf.net>, Urs Ganse <ursg@uni.de>,
 Thibaut VARENE <varenet@parisc-linux.org>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>, Helge Deller <deller@gmx.de>,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Ani Joshi <ajoshi@unixbox.com>,
 Emmanuel Marty <core@ggi-project.org>,
 "Mark D. Studebaker" <mdsxyz123@yahoo.com>,
 daniel.mantione@freepascal.org, carter@compsci.bristol.ac.uk,
 Alan Cox <alan@redhat.com>, Jeff Garzik <jgarzik@pobox.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "Eddie C. Dost" <ecd@skynet.be>,
 Ani Joshi <ajoshi@shell.unixbox.com>,
 "Thomas J. Moore" <dark@mama.indstate.edu>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 John Fremlin <vii@users.sourceforge.net>,
 Ilario Nardinocchi <nardinoc@cs.unibo.it>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Jakub Jelinek <jj@ultra.linux.cz>,
 William Rucklidge <wjr@cs.cornell.edu>,
 Antonino Daplas <adaplas@pol.net>, Brad Douglas <brad@neruo.com>,
 Ralph Metzler <rjkm@thp.uni-koeln.de>,
 Alex Dewar <alex.dewar90@gmail.com>,
 Philip Edelbrock <phil@netroedge.com>,
 Jim Hague <jim.hague@acm.org>,
 Egbert Eich <Egbert.Eich@physik.tu-darmstadt.de>,
 Jes Sorensen <jds@kom.auc.dk>,
 Gerd Knorr <kraxel@goldbach.in-berlin.de>,
 Jingoo Han <jingoohan1@gmail.com>, Oliver Kropp <dok@directfb.org>,
 Martin Mares <mj@ucw.cz>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ben Dooks <ben@simtec.co.uk>, Hannu Mallat <hmallat@cc.hut.fi>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Ghozlane Toumi <gtoumi@laposte.net>,
 Mike Rapoport <rppt@kernel.org>
References: <20210113145009.1272040-1-lee.jones@linaro.org>
 <20210113190118.GA180942@ravnborg.org>
 <20210113202546.GG3975472@dell> <877dofriss.fsf@intel.com>
 <CAKMK7uEU32=Sw4F6b4RzkX0Y6svVn0nL+b6cm6e6KYN8bni_SQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uEU32=Sw4F6b4RzkX0Y6svVn0nL+b6cm6e6KYN8bni_SQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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

On Thu, Jan 14, 2021 at 10:11:01AM +0100, Daniel Vetter wrote:
> On Thu, Jan 14, 2021 at 10:04 AM Jani Nikula
> <jani.nikula@linux.intel.com> wrote:
> >
> > On Wed, 13 Jan 2021, Lee Jones <lee.jones@linaro.org> wrote:
> > > On Wed, 13 Jan 2021, Sam Ravnborg wrote:
> > >
> > >> Hi Lee,
> > >>
> > >> On Wed, Jan 13, 2021 at 02:49:38PM +0000, Lee Jones wrote:
> > >> > This set is part of a larger effort attempting to clean-up W=1
> > >> > kernel builds, which are currently overwhelmingly riddled with
> > >> > niggly little warnings.
> > >> >
> > >> > This patch-set clears all of the W=1 warnings currently residing
> > >> > in drivers/video.
> > >>
> > >> I am sorry to say that I expect most of your nice patches to clash
> > >> with patches that is already present in drm-misc-next.
> > >>
> > >> drivers/video/ are warning free with W=1 in drm-misc-next today.
> > >>
> > >> I do not know why drm-misc-next is not yet pullled into linux-next.
> > >
> > > Well that kinda sucks.  What are the chances of that?
> > >
> > > Most of my patches fix issues that have been there for years!
> 
> I planned to go through them all today, let's see what's still needed.

First bunch of patches are all not needed anymore, I think this is quicker
if you're rebasing. Unfortunate this happened :-/
-Daniel

> 
> > We auto-update the for-linux-next and for-linux-next-fixes branches, and
> > they seem to be up-to-date [1].
> 
> It only happened last week instead of right after -rc1 due to some
> confusion, but it should have been in linux-next for a few days
> already.
> 
> > How recent are the fixes, maybe because of this: [2]?
> >
> > BR,
> > Jani.
> >
> >
> > [1] https://cgit.freedesktop.org/drm/drm-misc
> > [2] http://lore.kernel.org/r/20210114113107.622102e0@canb.auug.org.au
> 
> Patch for that just got committted, so this shouldn't be too big a
> window for drm-misc-next to be excluded should have been very small.
> -Daniel
> 
> >
> > --
> > Jani Nikula, Intel Open Source Graphics Center
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
> 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
