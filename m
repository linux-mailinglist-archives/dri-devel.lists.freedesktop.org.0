Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47570189D2A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 14:40:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70DF76E8EC;
	Wed, 18 Mar 2020 13:40:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56D26E8EC
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 13:40:11 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id d1so1832903wmb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 06:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Oxxqs72RJGmK3RfRWy8o6tiIfTF1DGIUQZYdvFpPTb0=;
 b=CZveKGv6dYRmv+T+RA1x765j7XfbrICq86+FpvVLZLzcC0ctnSeH95r5KXoTLlyOu3
 g9Mj+1BGwnwEASHMmfVtY/OnhNdjhh/+ubknYjbEOILQQvZ63y7nau6l68otRfRFGkt5
 88HHw6MXac5T/U7+Jd7hwgXZlyZgxrlYO4hcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Oxxqs72RJGmK3RfRWy8o6tiIfTF1DGIUQZYdvFpPTb0=;
 b=BYSwIlPZ9FDDrDAAddLRYbah+uHbLu7X2uohtGYeucfxYm7AcZHcfbpj8XnGw/ihsG
 QYPM0d6J+C1kf5ZYiyMxieMJXZ/hxCky2MFGhHWlmMln9JuhQGdn5zWFNyqhdI/zZNLd
 MHZQ0gmixImbv/I4D56kusEB+Q1NsPWeH+bsOiZLdHGxRIM/IGfUGTE7gJC0kPOIE0JR
 R+rP5tsLL4tZDAENImfsMTwQ5ziG6bKE4vNvgGb2jnXRzkFPDfBTTdujnBhTD+oq27BH
 2Z3EMEBGJiYaomWSR2DAGvFb+g4RnjWbds8DNnFnoc2ib7uXsQcJkpnIeWdP+/ryxC1p
 UNxw==
X-Gm-Message-State: ANhLgQ3ym4viVHx8J2c5pZ9INhYE9dRkCxVhVgUtlGPAev8CXdpxvikQ
 +nGj7+VFB5O7rUK3WQ15jVxI03HASemzdqjx
X-Google-Smtp-Source: ADFU+vvsJPyXSSN4l/x7WjnvcjCI9ylFqaourmE/qZHqd18HJ1+CUtEUPUdJuNKi2Ueqq0YDR+5Ksg==
X-Received: by 2002:a1c:8097:: with SMTP id b145mr5547517wmd.159.1584538227030; 
 Wed, 18 Mar 2020 06:30:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k12sm9713343wrm.26.2020.03.18.06.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 06:30:26 -0700 (PDT)
Date: Wed, 18 Mar 2020 14:30:24 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm/hisilicon: Drop unused #include
Message-ID: <20200318133024.GT2363188@phenom.ffwll.local>
References: <20200318073122.1032945-1-daniel.vetter@ffwll.ch>
 <20200318110937.GA4733@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200318110937.GA4733@pendragon.ideasonboard.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 18, 2020 at 01:09:37PM +0200, Laurent Pinchart wrote:
> Hi Daniel,
> 
> On Wed, Mar 18, 2020 at 08:31:22AM +0100, Daniel Vetter wrote:
> > drm_encoder_slave is really not something anyone should be using,
> > the last real user is only nouveau.
> 
> Fully agreed.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Is there any plan to convert nouveau to drm_bridge ?

Apparently the only user in nouveau is for nv17 cards - after that the tv
encoder is integrated. This is so old and cards rare (quick irc chat among
the usual suspects suggested there might be none available anymore) that a
quick rm might be the better solution than trying to convert this over to
drm_bridge :-)

We should definitely look into pushing the drm_encoder_slave into
drm/nouveau, and maybe delete drm/i2c. The other two things in there kinda
don't belong - one isn't even a drm driver!

Cheers, Daniel

> 
> > Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Boris Brezillon <boris.brezillon@collabora.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > Cc: Allison Randal <allison@lohutok.net>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
> > index f31068d74b18..d399c1077242 100644
> > --- a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
> > +++ b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
> > @@ -20,7 +20,6 @@
> >  #include <drm/drm_atomic_helper.h>
> >  #include <drm/drm_bridge.h>
> >  #include <drm/drm_device.h>
> > -#include <drm/drm_encoder_slave.h>
> >  #include <drm/drm_mipi_dsi.h>
> >  #include <drm/drm_of.h>
> >  #include <drm/drm_print.h>
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
