Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E5036310E
	for <lists+dri-devel@lfdr.de>; Sat, 17 Apr 2021 18:05:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C5DE6E52E;
	Sat, 17 Apr 2021 16:05:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 002996E52E
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Apr 2021 16:04:59 +0000 (UTC)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AUi16O6nAYfUX/OHWO1XgbpJGVK7pDfLN3DAb?=
 =?us-ascii?q?vn1ZSRFFG/GwvcaogfgdyFvImC8cMUtQ/eyoFaGcTRrnnqJdzpIWOd6ZNjXOmG?=
 =?us-ascii?q?ztF4166Jun/juIIUzD38p88YslTKRkEt33CjFB/KPHyS21CcwpztXC0I3Av4fj?=
 =?us-ascii?q?5kxgRw1rdK1shj0RYjqzKUF4SBJLApA0DvOnl6l6jgC9cncaZNnTPBc4dtXEzu?=
 =?us-ascii?q?emqLvbexIcQzYo5A6S5AnYioLSIlyomi0TVD5C2t4ZnFTtmQaR3Mqej80=3D?=
X-IronPort-AV: E=Sophos;i="5.82,230,1613430000"; d="scan'208";a="378941452"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Apr 2021 18:04:58 +0200
Date: Sat, 17 Apr 2021 18:04:57 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: Re: [Outreachy kernel] [PATCH Resend] drm/drm_bufs.c: In switch,
 add break in default case
In-Reply-To: <3022803.ysd8NKUkcf@linux.local>
Message-ID: <alpine.DEB.2.22.394.2104171804140.2982@hadrien>
References: <20210417153540.22017-1-fmdefrancesco@gmail.com>
 <alpine.DEB.2.22.394.2104171745391.2982@hadrien>
 <3022803.ysd8NKUkcf@linux.local>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, outreachy-kernel@googlegroups.com,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On Sat, 17 Apr 2021, Fabio M. De Francesco wrote:

> On Saturday, April 17, 2021 5:45:46 PM CEST Julia Lawall wrote:
> > On Sat, 17 Apr 2021, Fabio M. De Francesco wrote:
> > > Added a 'break' in the default case of a switch selection statement.
> >
> > Why?
> >
> GCC issues a warning, even if it is not strictly necessary for the code to
> work properly. Do you think that I have to explain in the patch log the reason
> why I made that change?

It would be helpful.

julia

>
> Thanks,
>
> Fabio
> >
> > julia
> >
> > > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > > ---
> > >
> > >  drivers/gpu/drm/drm_bufs.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
> > > index e3d77dfefb0a..fc40aa0adf73 100644
> > > --- a/drivers/gpu/drm/drm_bufs.c
> > > +++ b/drivers/gpu/drm/drm_bufs.c
> > > @@ -79,7 +79,7 @@ static struct drm_map_list *drm_find_matching_map(struct
> > > drm_device *dev,>
> > >  				return entry;
> > >
> > >  			break;
> > >
> > >  		default: /* Make gcc happy */
> > >
> > > -			;
> > > +			break;
> > >
> > >  		}
> > >  		if (entry->map->offset == map->offset)
> > >
> > >  			return entry;
> > >
> > > --
> > > 2.31.1
> > >
> > > --
> > > You received this message because you are subscribed to the Google Groups
> > > "outreachy-kernel" group. To unsubscribe from this group and stop
> receiving
> > > emails from it, send an email to
> > > outreachy-kernel+unsubscribe@googlegroups.com. To view this discussion on
> > > the web visit
> > > https://groups.google.com/d/msgid/outreachy-kernel/20210417153540.22017-1-f
> > > mdefrancesco%40gmail.com.
>
>
>
>
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
