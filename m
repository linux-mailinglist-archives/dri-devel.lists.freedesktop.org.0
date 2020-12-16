Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDB02DC2A7
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 16:03:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DFCD6E1E8;
	Wed, 16 Dec 2020 15:03:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E9A36E1E8
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 15:03:34 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 653112CF;
 Wed, 16 Dec 2020 16:03:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1608131012;
 bh=0Xdhf/CunWIJlDKkCKBQvS7jTP/k15OUsRpW2yhRyqc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bko96xPKI4JX55xrGkdqz+W/BodcE+aIhzQNQUyjRNOfzFUqoEdoBvYVjT4nAF6IH
 P2uDDwavMBrh/MWR0tRWf6cZQuNrLtqLh2Ti8dMQvLKZwwBZsZfaffR0M/evsT9pQB
 UbCfGYP/z5ruaXOhRxF3L0wvzGwHI1x00tONCbAo=
Date: Wed, 16 Dec 2020 17:03:25 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 01/10] drm: uapi: Use SPDX in DRM core uAPI headers
Message-ID: <X9ohvfor42YFta/A@pendragon.ideasonboard.com>
References: <20201216024359.12995-1-laurent.pinchart+renesas@ideasonboard.com>
 <X9oa+8CzHpkwGRSn@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X9oa+8CzHpkwGRSn@phenom.ffwll.local>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Wed, Dec 16, 2020 at 03:34:35PM +0100, Daniel Vetter wrote:
> On Wed, Dec 16, 2020 at 04:43:50AM +0200, Laurent Pinchart wrote:
> > The DRM core uAPI headers are licensed under the MIT license, and carry
> > copies of the license with slight variations. Replace them with SPDX
> > headers.
> > 
> > Following a discussion with Daniel Vetter on this topic, add a
> > clarification in the drm-uapi.rst file that independent closed-source
> > userspace implementations of software using the DRM uAPI are accepted,
> > as allowed by the MIT license.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Maybe get and ack from Alex and Dave on this too, just to make sure
> everyone's happy.

CC'ing Dave. Which Alex are you talking about ?

> > ---
> >  Documentation/gpu/drm-uapi.rst |  4 ++++
> >  include/uapi/drm/drm.h         | 20 +-------------------
> >  include/uapi/drm/drm_fourcc.h  | 20 +-------------------
> >  include/uapi/drm/drm_mode.h    | 19 +------------------
> >  include/uapi/drm/drm_sarea.h   | 20 +-------------------
> >  5 files changed, 8 insertions(+), 75 deletions(-)
> > 
> > diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> > index 7dce175f6d75..96ea55200f04 100644
> > --- a/Documentation/gpu/drm-uapi.rst
> > +++ b/Documentation/gpu/drm-uapi.rst
> > @@ -109,6 +109,10 @@ is already rather painful for the DRM subsystem, with multiple different uAPIs
> >  for the same thing co-existing. If we add a few more complete mistakes into the
> >  mix every year it would be entirely unmanageable.
> >  
> > +The DRM subsystem has however no concern with independent closed-source
> > +userspace implementations. To officialize that position, the DRM uAPI headers
> > +are covered by the MIT license.
> > +
> >  .. _drm_render_node:
> >  
> >  Render nodes
> > diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> > index 808b48a93330..14d57361e580 100644
> > --- a/include/uapi/drm/drm.h
> > +++ b/include/uapi/drm/drm.h
> > @@ -1,3 +1,4 @@
> > +/* SPDX-License-Identifier: MIT */
> >  /**
> >   * \file drm.h
> >   * Header for the Direct Rendering Manager
> > @@ -12,25 +13,6 @@
> >   * Copyright 1999 Precision Insight, Inc., Cedar Park, Texas.
> >   * Copyright 2000 VA Linux Systems, Inc., Sunnyvale, California.
> >   * All rights reserved.
> > - *
> > - * Permission is hereby granted, free of charge, to any person obtaining a
> > - * copy of this software and associated documentation files (the "Software"),
> > - * to deal in the Software without restriction, including without limitation
> > - * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> > - * and/or sell copies of the Software, and to permit persons to whom the
> > - * Software is furnished to do so, subject to the following conditions:
> > - *
> > - * The above copyright notice and this permission notice (including the next
> > - * paragraph) shall be included in all copies or substantial portions of the
> > - * Software.
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> > - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> > - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> > - * VA LINUX SYSTEMS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> > - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> > - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> > - * OTHER DEALINGS IN THE SOFTWARE.
> >   */
> >  
> >  #ifndef _DRM_H_
> > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> > index 723c8e23ca87..51e2c8a825a3 100644
> > --- a/include/uapi/drm/drm_fourcc.h
> > +++ b/include/uapi/drm/drm_fourcc.h
> > @@ -1,24 +1,6 @@
> > +/* SPDX-License-Identifier: MIT */
> >  /*
> >   * Copyright 2011 Intel Corporation
> > - *
> > - * Permission is hereby granted, free of charge, to any person obtaining a
> > - * copy of this software and associated documentation files (the "Software"),
> > - * to deal in the Software without restriction, including without limitation
> > - * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> > - * and/or sell copies of the Software, and to permit persons to whom the
> > - * Software is furnished to do so, subject to the following conditions:
> > - *
> > - * The above copyright notice and this permission notice (including the next
> > - * paragraph) shall be included in all copies or substantial portions of the
> > - * Software.
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> > - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> > - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> > - * VA LINUX SYSTEMS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> > - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> > - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> > - * OTHER DEALINGS IN THE SOFTWARE.
> >   */
> >  
> >  #ifndef DRM_FOURCC_H
> > diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> > index b49fbf2bdc40..21dfec63b338 100644
> > --- a/include/uapi/drm/drm_mode.h
> > +++ b/include/uapi/drm/drm_mode.h
> > @@ -1,27 +1,10 @@
> > +/* SPDX-License-Identifier: MIT */
> >  /*
> >   * Copyright (c) 2007 Dave Airlie <airlied@linux.ie>
> >   * Copyright (c) 2007 Jakob Bornecrantz <wallbraker@gmail.com>
> >   * Copyright (c) 2008 Red Hat Inc.
> >   * Copyright (c) 2007-2008 Tungsten Graphics, Inc., Cedar Park, TX., USA
> >   * Copyright (c) 2007-2008 Intel Corporation
> > - *
> > - * Permission is hereby granted, free of charge, to any person obtaining a
> > - * copy of this software and associated documentation files (the "Software"),
> > - * to deal in the Software without restriction, including without limitation
> > - * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> > - * and/or sell copies of the Software, and to permit persons to whom the
> > - * Software is furnished to do so, subject to the following conditions:
> > - *
> > - * The above copyright notice and this permission notice shall be included in
> > - * all copies or substantial portions of the Software.
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> > - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> > - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> > - * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> > - * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> > - * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> > - * IN THE SOFTWARE.
> >   */
> >  
> >  #ifndef _DRM_MODE_H
> > diff --git a/include/uapi/drm/drm_sarea.h b/include/uapi/drm/drm_sarea.h
> > index a951ced60ebe..1e38d028332d 100644
> > --- a/include/uapi/drm/drm_sarea.h
> > +++ b/include/uapi/drm/drm_sarea.h
> > @@ -1,3 +1,4 @@
> > +/* SPDX-License-Identifier: MIT */
> >  /**
> >   * \file drm_sarea.h
> >   * \brief SAREA definitions
> > @@ -8,25 +9,6 @@
> >  /*
> >   * Copyright 2002 Tungsten Graphics, Inc., Cedar Park, Texas.
> >   * All Rights Reserved.
> > - *
> > - * Permission is hereby granted, free of charge, to any person obtaining a
> > - * copy of this software and associated documentation files (the "Software"),
> > - * to deal in the Software without restriction, including without limitation
> > - * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> > - * and/or sell copies of the Software, and to permit persons to whom the
> > - * Software is furnished to do so, subject to the following conditions:
> > - *
> > - * The above copyright notice and this permission notice (including the next
> > - * paragraph) shall be included in all copies or substantial portions of the
> > - * Software.
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> > - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> > - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> > - * TUNGSTEN GRAPHICS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> > - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> > - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> > - * OTHER DEALINGS IN THE SOFTWARE.
> >   */
> >  
> >  #ifndef _DRM_SAREA_H_

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
