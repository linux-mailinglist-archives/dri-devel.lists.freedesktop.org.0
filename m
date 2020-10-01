Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 243C127FDAD
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 12:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F876E16F;
	Thu,  1 Oct 2020 10:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD52F6E16F
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Oct 2020 10:50:16 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id k10so5122357wru.6
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Oct 2020 03:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mlyU4BygPiV+TaP+AAhTDUagnZtzJ03RO/hmokAgQvY=;
 b=a/QzzUnoIBXFdZjR3CW7l2zzZFAsP6vPlwLt1ozXDilD8hUtRX3EjlxUYE6Kkgs4GD
 jzX5ei1dRyWu1PPXxKjx4xjiar5rkIi+hEsFQFoQ42FdOBVc5dBubsWIZ14RfkD+4CVY
 5NGFqFsTWjKhJoTnJN3+eFSo0WCwH0IOIUkCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mlyU4BygPiV+TaP+AAhTDUagnZtzJ03RO/hmokAgQvY=;
 b=uYh+ZFwXntB7zSQh7hPNdR8j2A94re/4+Vmxdt9O8fMsvhK+YkXoP139v4MO1hxF9x
 SxaNsBTsi28M1P7FXZCYOaE7Ko0adP+LL0vEpdhy8XVnIx+ItWlL1AOrPm1XJCW98GRo
 MI+VbipnJn3pV4DdxuvjALKQJbgAxGtOqb/F0oqjxiSjB5qUsqnNCB7hJKmtTyNhlia9
 /WyA/QzHP+gL20McV5gvnYuAXxMh4WXzcXFmm7Z50FWx+pbA3uI1WMyd69GT0Ub/MoZ2
 0wfCCEWgbNP5vPqksw1igSkau5JVXHMnkduKCf+BTo/1iO3WwxiWXZrW2FPxj6V/cacd
 t9aQ==
X-Gm-Message-State: AOAM530TRHFU0CU6w18I8nSYhJnF/zyByFrsRlpG8cD15iTrf1hUuwhh
 45SzVG7xEbH6aFNZYm0oSU5REKavvJ3zVKI1
X-Google-Smtp-Source: ABdhPJy+PNZirmRkxYI3hp+Fwyt6sQ6mtYF9pTiYdXoxYmlLbIGyjTTM+2E4jPHGp8Y9yINpJF3zHA==
X-Received: by 2002:a05:6000:12c3:: with SMTP id
 l3mr8779524wrx.164.1601549415277; 
 Thu, 01 Oct 2020 03:50:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x17sm9100075wrg.57.2020.10.01.03.50.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 03:50:14 -0700 (PDT)
Date: Thu, 1 Oct 2020 12:50:12 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v2] drm: bridge: cdns-mhdp8546: fix compile warning
Message-ID: <20201001105012.GE438822@phenom.ffwll.local>
References: <20200929091918.24813-1-tomi.valkeinen@ti.com>
 <5e683867-b148-a9fb-f8ea-f763d567030b@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5e683867-b148-a9fb-f8ea-f763d567030b@ti.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Yuti Amonkar <yamonkar@cadence.com>, Dave Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 01, 2020 at 12:57:46PM +0300, Tomi Valkeinen wrote:
> Hi Dave,
> 
> Can you pick this up to drm-next? Fixes the x64 build warnings for the recent cdns-mhdp-5.10 pull.

Applied, hopefully that's fast enough before sfr does the next round of
linux-next.
-Daniel

> 
>  Tomi
> 
> On 29/09/2020 12:19, Tomi Valkeinen wrote:
> > On x64 we get:
> > 
> > drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:751:10: warning: conversion from 'long unsigned int' to 'unsigned int' changes value from '18446744073709551613' to '4294967293' [-Woverflow]
> > 
> > The registers are 32 bit, so fix by casting to u32.
> > 
> > Fixes: fb43aa0acdfd ("drm: bridge: Add support for Cadence MHDP8546 DPI/DP bridge")
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Reviewed-by: Swapnil Jakhade <sjakhade@cadence.com>
> > Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > 
> > v2:
> > 
> > No changes to code, added tags.
> > 
> > 
> >  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> > index 621ebdbff8a3..d0c65610ebb5 100644
> > --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> > +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> > @@ -748,7 +748,7 @@ static int cdns_mhdp_fw_activate(const struct firmware *fw,
> >  	 * bridge should already be detached.
> >  	 */
> >  	if (mhdp->bridge_attached)
> > -		writel(~CDNS_APB_INT_MASK_SW_EVENT_INT,
> > +		writel(~(u32)CDNS_APB_INT_MASK_SW_EVENT_INT,
> >  		       mhdp->regs + CDNS_APB_INT_MASK);
> >  
> >  	spin_unlock(&mhdp->start_lock);
> > @@ -1689,7 +1689,7 @@ static int cdns_mhdp_attach(struct drm_bridge *bridge,
> >  
> >  	/* Enable SW event interrupts */
> >  	if (hw_ready)
> > -		writel(~CDNS_APB_INT_MASK_SW_EVENT_INT,
> > +		writel(~(u32)CDNS_APB_INT_MASK_SW_EVENT_INT,
> >  		       mhdp->regs + CDNS_APB_INT_MASK);
> >  
> >  	return 0;
> > @@ -2122,7 +2122,7 @@ static void cdns_mhdp_bridge_hpd_enable(struct drm_bridge *bridge)
> >  
> >  	/* Enable SW event interrupts */
> >  	if (mhdp->bridge_attached)
> > -		writel(~CDNS_APB_INT_MASK_SW_EVENT_INT,
> > +		writel(~(u32)CDNS_APB_INT_MASK_SW_EVENT_INT,
> >  		       mhdp->regs + CDNS_APB_INT_MASK);
> >  }
> >  
> > 
> 
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
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
