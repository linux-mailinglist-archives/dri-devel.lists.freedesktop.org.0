Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5424BAB1F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 21:34:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC0B10E311;
	Thu, 17 Feb 2022 20:34:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA8C10E311
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 20:34:43 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 1366a9bc-9031-11ec-baa1-0050568c148b;
 Thu, 17 Feb 2022 20:34:59 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id B1800194B4A;
 Thu, 17 Feb 2022 21:34:40 +0100 (CET)
Date: Thu, 17 Feb 2022 21:34:36 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/8] drm/fb-helper: Add support for DRM_FORMAT_C[124]
Message-ID: <Yg6xXFouzq/4YCgU@ravnborg.org>
References: <20220215165226.2738568-1-geert@linux-m68k.org>
 <20220215165226.2738568-3-geert@linux-m68k.org>
 <4fff0c08-adab-c1d5-4a7e-1513cb2bf7ca@suse.de>
 <CAMuHMdVK7eWfod73JQAntO=7BAMEcS-ktH4NJmDjna3zUn7giw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVK7eWfod73JQAntO=7BAMEcS-ktH4NJmDjna3zUn7giw@mail.gmail.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Helge Deller <deller@gmx.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linux/m68k <linux-m68k@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

> > > +     switch (fb->format->depth) {
> >
> > The depth field is deprecated. It's probably better to use
> > fb->format->format and test against 4CC codes.
> 
> The reason I checked for depth instead of a 4CC code is that the only
> thing that matters here is the number of bits per pixel.  Hence this
> function won't need any changes to support R1, R2, R4, and D1 later.
> When we get here, we already know that we are using a format that
> is supported by the fbdev helper code, and thus passed the 4CC
> checks elsewhere.
> 
> Alternatively, we could introduce drm_format_info_bpp() earlier in
> the series, and use that?

The drm_format_info_bpp() is very descriptive, so yes it would be good to use
it here also.

	Sam
