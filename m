Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B08406F93
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 18:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B2CF6EA2D;
	Fri, 10 Sep 2021 16:22:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC716EA2D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 16:22:39 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id cfa7e488-1252-11ec-a02a-0050568c148b;
 Fri, 10 Sep 2021 16:19:02 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 73D00194BF7;
 Fri, 10 Sep 2021 18:05:52 +0200 (CEST)
Date: Fri, 10 Sep 2021 18:05:58 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc: airlied@linux.ie, bp@alien8.de, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, hdegoede@redhat.com, hpa@zytor.com,
 javierm@redhat.com, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mingo@redhat.com, mripard@kernel.org, pbrobinson@gmail.com,
 tglx@linutronix.de, tzimmermann@suse.de, x86@kernel.org
Subject: Re: [RFC PATCH 0/4] Allow to use DRM fbdev emulation layer with
 CONFIG_FB disabled
Message-ID: <YTuCZjdV1tH5+tB/@ravnborg.org>
References: <2527f0ef-dae1-9ad5-84a4-00712c44940d@tronnes.org>
 <ff6a590e-19ee-b2b6-bed5-236962637418@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff6a590e-19ee-b2b6-bed5-236962637418@tronnes.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Noralf,

On Thu, Sep 09, 2021 at 06:27:02PM +0200, Noralf Trønnes wrote:
> 
> > > Hi Daniel,
> > >
> > > >
> > > > I think for a substantial improvement here in robustness what you
> really
> > > > want is
> > > > - kmscon in userspace
> > > > - disable FB layer
> > > > - ideally also disable console/vt layer in the kernel
> > > > - have a minimal emergency/boot-up log thing in drm, patches for that
> > > >   floated around a few times
> > >
> > > I assume you refer to this work by David Herrmann:
> > > "[RFC] drm: add kernel-log renderer"
> > > https://lists.freedesktop.org/archives/dri-devel/2014-March/055136.html
> > >
> >
> > There's also this:
> >
> > [PATCH v2 0/3] drm: Add panic handling
> >
> https://lore.kernel.org/dri-devel/20190311174218.51899-1-noralf@tronnes.org/
> 
> And here's a DRM console example that was part of the early drm_client work:
> 
> [RFC v4 25/25] drm/client: Hack: Add DRM VT console client
> https://lore.kernel.org/dri-devel/20180414115318.14500-26-noralf@tronnes.org/

Thanks for providing these pointers. Looks forwards to find time to play
with all this. Having an embedded board without any fbdev stuff seems
like a nice goal.

	Sam
