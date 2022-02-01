Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 753BB4A66B2
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 21:57:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F67510E13C;
	Tue,  1 Feb 2022 20:57:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E20F010E13C
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 20:57:55 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id c27aaef0-83a1-11ec-ac19-0050568cd888;
 Tue, 01 Feb 2022 20:58:51 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 5B36E194B7A;
 Tue,  1 Feb 2022 21:57:54 +0100 (CET)
Date: Tue, 1 Feb 2022 21:57:50 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH 1/4] drm: Add I2C connector type
Message-ID: <YfmeztkVXwZzAwYe@ravnborg.org>
References: <20220131201225.2324984-1-javierm@redhat.com>
 <20220131201225.2324984-2-javierm@redhat.com>
 <YfhMESTylI1NTKDg@ravnborg.org>
 <4d9a56a7-da25-b411-61cc-372c6fa9011d@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d9a56a7-da25-b411-61cc-372c6fa9011d@tronnes.org>
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Noralf,

On Tue, Feb 01, 2022 at 01:58:16PM +0100, Noralf Trønnes wrote:
> 
> 
> Den 31.01.2022 21.52, skrev Sam Ravnborg:
> > On Mon, Jan 31, 2022 at 09:12:21PM +0100, Javier Martinez Canillas wrote:
> >> There isn't a connector type for display controllers accesed through I2C,
> >> most drivers use DRM_MODE_CONNECTOR_Unknown or DRM_MODE_CONNECTOR_VIRTUAL.
> >>
> >> Add an I2C connector type to match the actual connector.
> >>
> >> As Noralf Trønnes mentions in commit fc06bf1d76d6 ("drm: Add SPI connector
> >> type"), user-space should be able to cope with a connector type that does
> >> not yet understand.
> >>
> 
> It turned out that I wasn't entirely correct here, mpv didn't cope with
> unknown types. In the PR to add support Emil Velikov wondered if libdrm
> should handle these connector names:
> https://github.com/mpv-player/mpv/pull/8989#issuecomment-879187711
> 
> >> Tested with `modetest -M ssd1307 -c` and shows the connector as unknown-1.
> > I had expected unknown-21??
> > 
> >>
> >> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> 
> Sam, didn't you and Laurent discuss adding DRM_MODE_CONNECTOR_PANEL for
> such a use case?

You have a splendid memory - yes we did. But no conclusions:
https://lore.kernel.org/dri-devel/?q=DRM_MODE_CONNECTOR_PANEL

As I wrote in another part of this thread(s) - typing the patch is easy.
But I do not understand the userspace implications so I need someone
else to say go.

	Sam
