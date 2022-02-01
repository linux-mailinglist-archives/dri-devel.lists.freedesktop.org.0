Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DC04A6672
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 21:54:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9142410E143;
	Tue,  1 Feb 2022 20:54:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A6E10E143
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 20:54:06 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 3a4211e5-83a1-11ec-b20b-0050568c148b;
 Tue, 01 Feb 2022 20:55:03 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 5A64D194B9E;
 Tue,  1 Feb 2022 21:54:05 +0100 (CET)
Date: Tue, 1 Feb 2022 21:54:01 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 1/4] fbtft: Unorphan the driver
Message-ID: <Yfmd6V9F4JlgwQu4@ravnborg.org>
References: <b8eb7111-43aa-cc8a-a1bc-f08e0f2987ed@redhat.com>
 <YfFV4EJosayH+e6C@smile.fi.intel.com>
 <YfFWPmG2D093gz4N@smile.fi.intel.com>
 <6e74d4cc-655a-e38e-0856-a59e4e6deb36@redhat.com>
 <c423a2f0-e7be-3884-3568-7629c7e9104e@redhat.com>
 <ddb0f354-be19-92fe-20b3-56b00c9304ab@suse.de>
 <840ec74d-60c6-9480-709c-8cd597c6f5b0@redhat.com>
 <e7fbef3c-2f87-15f9-b24d-34ffaa5a2853@suse.de>
 <CAMuHMdXnn+JcyMAV_Vbb4Yj8hJmae=Snc2R2fLviq67UYXg7Ew@mail.gmail.com>
 <CAKMK7uEPuw1+-=h7gvSyCxW4zNuTK3UNZP6yjpP6MPV17sAasQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uEPuw1+-=h7gvSyCxW4zNuTK3UNZP6yjpP6MPV17sAasQ@mail.gmail.com>
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
Cc: Andy Shevchenko <andy@kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev, Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Carlis <zhangxuezhi1@yulong.com>,
 Phillip Potter <phil@philpotter.co.uk>, Lee Jones <lee.jones@linaro.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Tue, Feb 01, 2022 at 06:06:33PM +0100, Daniel Vetter wrote:
> On Tue, Feb 1, 2022 at 6:01 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >
> > Hi Thomas,
> >
> > On Tue, Feb 1, 2022 at 5:16 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > > Am 31.01.22 um 11:18 schrieb Javier Martinez Canillas:
> > > > Another thing that's missing is a DRM_MODE_CONNECTOR_I2C, because I used for
> > > > now a DRM_MODE_CONNECTOR_Unknown.
> > >
> > > That might have implications on userspace. Maybe ask around. (Not that
> > > we actually run userspace on the device).
> >
> > Looking at the list of connector types (and wondering if we're gonna
> > need more when converting existing fbdev drivers to drm drivers),
> > there seem to be two different families of connector types, for
> >   1. transports between CRTC and display (e.g. VGA, DVID, HDMI),
> >   2. transports between CPU and CRTC (e.g. SPI, possibly USB, and
> >      the proposed I2C)?
> 
> I was trying to argue for a panel connector type and stop doing all
> these internal things because like you point out, it kinda doesn't,
> only the external connectors are relevant to users. But it didn't
> stick anywhere yet, we keep adding more connector types and then
> having to update userspace, which should map these all to "it's the
> panel" or something like that. But also since various technicolor
> abbreviations are about as useful to end-users as "unknown" it really
> doesn't matter, so I'm happy to let this bikeshed get a tad fancier
> every year :-)

We discussed DRM_MODE_CONNECTOR_PANEL or some sort - but I recall we ended up
with worrying about breaking userspace.
See https://lore.kernel.org/dri-devel/?q=DRM_MODE_CONNECTOR_PANEL

For this kind of change I chicken out due to lack of understanding of
the userspace implications.

Typing the patch is simple but taking the correct decision not so.

The discussion popped up when we made it mandatory to specify a
connector so we could better match up stuff between display
drivers/bridges and panel drivers.

	Sam
