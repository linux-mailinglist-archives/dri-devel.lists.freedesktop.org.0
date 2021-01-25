Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D42630270C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 16:42:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54DF889C7F;
	Mon, 25 Jan 2021 15:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E62289C7F;
 Mon, 25 Jan 2021 15:42:54 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id r189so15185970oih.4;
 Mon, 25 Jan 2021 07:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fhDzmASCMUV6IxisjcynF4pwOh3anKSgoGsiuxfLkJI=;
 b=cWQbQogjQbOEAR60mOwu/6Pb/tS8R8R5mBxaWPvAwcGQXbfkCUgFfdcqh7jk8EPCEY
 0WSkuOLOhOLPiQMkqy047H0++X2+CmwjXR3QEuzI8lIgYguX2STjospoO4GeFs1+3twp
 xsF7Ofh8rFiRFObbxe29mkZFQ9y7vDFioC6dwA2DAV73OTLVWwsalL6UIIDIHKRl1Vqf
 BYTZpTvJ+zBL/LBMyDzDCMRnOiU25NEEt8jORSk+MX0ak5SKV9UKC7UzHpYMfePLwJ3S
 0O0uiEDvoXkHfrMIkYJFCxvvYIVT7xShEYR6K2mhqo0rUCeb7Y198GzT296e3/e2X23g
 dvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fhDzmASCMUV6IxisjcynF4pwOh3anKSgoGsiuxfLkJI=;
 b=V1bLG0KpwQsNzh98TCpoz358uI+2QwgT3HsHN7r1qLdk5hXzyVGvbKN4HDVR29Rz+Y
 u5bmjxJFQ0saCNtv82sHIKefoJsVqkZPs+FHwGxPRxgEPjRNnUglbTxVJWxF3spgYRgZ
 yDfSARHqjnRcet8RLP/AZConyAdYwF+yvMWeHtFme45XQeAZffXk/upHPw/oCWdfRRTp
 xMtIJhJCl2F/wIH7K5IKtbuMJtvHbZl8HSqMck051VO1JVecmxJAfkfTDKn5USOuTjkv
 EPm7+NLYHqFS0OhkF+vhCg/y12yiGYpnzMqprpW8+xOdIMFLAZru5dbs2ZzAfuzbMgmX
 AgZg==
X-Gm-Message-State: AOAM533x3aRCh1iCSnwRxin0MyZEdtQNJEyNbRv5YDzj417NgCJMVczp
 61u2Sc0/XHePAZVZvch25IpFKJvrC6iRMqG9NiVgz5vf
X-Google-Smtp-Source: ABdhPJxWd/RXbO51X77ucQ3RmPWd/koRnLpt6IICMM90OpWRoBSB2gjokh3qkIhGtXzvgsGPU3wqMx9uBxUPCdXoeC8=
X-Received: by 2002:aca:1a17:: with SMTP id a23mr476832oia.120.1611589373467; 
 Mon, 25 Jan 2021 07:42:53 -0800 (PST)
MIME-Version: 1.0
References: <20201119023041.77269-1-jsg@jsg.id.au>
 <20210125120032.GA18504@largo.jsg.id.au>
In-Reply-To: <20210125120032.GA18504@largo.jsg.id.au>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 25 Jan 2021 10:42:42 -0500
Message-ID: <CADnq5_P-wNbgU3zfnOFhkqM9o9ceXT9_aaFiXiTPeDS70y0ScQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: change license of color_table.c
To: Jonathan Gray <jsg@jsg.id.au>
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
Cc: "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 25, 2021 at 7:07 AM Jonathan Gray <jsg@jsg.id.au> wrote:
>
> This still needs to be corrected.

Applied.  Thanks!

Alex

>
> On Thu, Nov 19, 2020 at 01:30:41PM +1100, Jonathan Gray wrote:
> > Change the license of color_table.c to match color_table.h granting
> > permission to modify and distribute.
> >
> > Signed-off-by: Jonathan Gray <jsg@jsg.id.au>
> > ---
> >  .../amd/display/modules/color/color_table.c   | 26 +++++++++++++++----
> >  1 file changed, 21 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/modules/color/color_table.c b/drivers/gpu/drm/amd/display/modules/color/color_table.c
> > index 692e536e7d05..410f2a82b9a2 100644
> > --- a/drivers/gpu/drm/amd/display/modules/color/color_table.c
> > +++ b/drivers/gpu/drm/amd/display/modules/color/color_table.c
> > @@ -1,10 +1,26 @@
> >  /*
> > - * Copyright (c) 2019 Advanced Micro Devices, Inc. (unpublished)
> > + * Copyright 2019 Advanced Micro Devices, Inc.
> > + *
> > + * Permission is hereby granted, free of charge, to any person obtaining a
> > + * copy of this software and associated documentation files (the "Software"),
> > + * to deal in the Software without restriction, including without limitation
> > + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> > + * and/or sell copies of the Software, and to permit persons to whom the
> > + * Software is furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice shall be included in
> > + * all copies or substantial portions of the Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> > + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> > + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> > + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> > + * OTHER DEALINGS IN THE SOFTWARE.
> > + *
> > + * Authors: AMD
> >   *
> > - * All rights reserved.  This notice is intended as a precaution against
> > - * inadvertent publication and does not imply publication or any waiver
> > - * of confidentiality.  The year included in the foregoing notice is the
> > - * year of creation of the work.
> >   */
> >
> >  #include "color_table.h"
> > --
> > 2.29.2
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
