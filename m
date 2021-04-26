Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4B536B9A8
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 21:06:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C636E868;
	Mon, 26 Apr 2021 19:06:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1486E868
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 19:06:13 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id ja3so10151485ejc.9
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 12:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qzrC1Kq+MFBMN6fW/1czS9SkAtIfV8nGIBcDBhlNciY=;
 b=Tb9VmsvMB/FivTuyRMIAr19B99fb8vQEgeIf+3VRXtNPE15M8rtK8gghpsNzV4Ttyl
 lxObizfHcldMaQqCl9udQpKjNzapKnZzO4ZNNFhePp/bO6VS4ztacmwvfDLRAYZONsWO
 br/KyjyETMvDiXk+ZQJbbF5S2DixoIgx4qVpouCJBbcyJ5jC/R6Tppgi/KPDNvO3+P96
 n2aOY/EZbIBWUUskwvx/g+lpAVVg11KBp47aloDxpnd1uAB3Ac7slprlYtyZQ0o88toe
 jPUIrgwmS9H2vQiAAsGCL9uqfJPVDmtxWCLRScwXLa4bDo/ujvHrMU0ljZZwjZ9SmuKl
 IcPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qzrC1Kq+MFBMN6fW/1czS9SkAtIfV8nGIBcDBhlNciY=;
 b=GSKqD8GLUhNRAK0+IGpIIZqSNpRRTyBbdTeVI+GvI1m+po15QXACYRXu6tkPM7Iqfk
 aYLAdVGh9er+EbbeQQmJ8JTxipdwcZJ7dN4VeWkHh767ptYrFfUiRTbOcMTVVbQ4OB1F
 jOBhuO+M0UJjHutlLHSP2ewPivIsGTVutRixWsAI4EXwWw4R/pSr5UQ612TwvPc81+me
 aTIj9LYO4JDtF6pUS72zd4Li+QlHT5SU2xj8Qdw1Z+EnPHqZv0caeD/uKbO+aN0eeM51
 IlUj1DpHuLlIT+54J44eMuIb/Uk8Zd+rTksCT5qJ8ssjrF3wSbtgRbfLnPUeQgdiRSFB
 3FdA==
X-Gm-Message-State: AOAM530OMYb+X3oTRY5sCYugZexF981fCnG+msGxlaTqObAinSpl/AIk
 mHL80dSTw2d2PhnOoo/QQsE=
X-Google-Smtp-Source: ABdhPJw5Ywwd/QvHUBnUl1XoxS56aFkZIGMrMvR+1GbW+V8G4KNO6cen1AWUazf8uYGziLa23kDnwA==
X-Received: by 2002:a17:906:5906:: with SMTP id
 h6mr20186115ejq.176.1619463972520; 
 Mon, 26 Apr 2021 12:06:12 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it.
 [79.52.107.152])
 by smtp.gmail.com with ESMTPSA id q25sm11756648ejd.9.2021.04.26.12.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 12:06:12 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Outreachy kernel] Re: [PATCH] drm/amd/amdgpu/amdgpu_drv.c:
 Replace drm_modeset_lock_all with drm_modeset_lock
Date: Mon, 26 Apr 2021 21:06:10 +0200
Message-ID: <28921365.3cLsizAqWR@linux.local>
In-Reply-To: <YIbmH4LXzIej62su@phenom.ffwll.local>
References: <20210422155951.6314-1-fmdefrancesco@gmail.com>
 <20210422165034.GP3596236@casper.infradead.org>
 <YIbmH4LXzIej62su@phenom.ffwll.local>
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
Cc: Matthew Wilcox <willy@infradead.org>, David Airlie <airlied@linux.ie>,
 Melissa Wen <melissa.srw@gmail.com>, outreachy-kernel@googlegroups.com,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, April 26, 2021 6:11:11 PM CEST Daniel Vetter wrote:
> On Thu, Apr 22, 2021 at 05:50:34PM +0100, Matthew Wilcox wrote:
> > On Thu, Apr 22, 2021 at 05:59:51PM +0200, Fabio M. De Francesco wrote:
> > > -		drm_modeset_lock_all(drm_dev);
> > > -
> > > 
> > >  		drm_for_each_crtc(crtc, drm_dev) {
> > > 
> > > +			drm_modeset_lock(&crtc->mutex, NULL);
> > > 
> > >  			if (crtc->state->active) {
> > >  			
> > >  				ret = -EBUSY;
> > > 
> > > -				break;
> > > 
> > >  			}
> > > 
> > > +			drm_modeset_unlock(&crtc->mutex);
> > > +			if (ret < 0)
> > > +				break;
> > > 
> > >  		}
> > > 
> > > -		drm_modeset_unlock_all(drm_dev);
> > > -
> > 
> > I might remove the {} around ret = -EBUSY, but this is good.
> > 
> > Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> 
> Yup patch looks good, but it's not cc'ed to drm/amdgpu maintainers/m-l, so
> likely won't get picked up. Can you pls check scripts/get_maintainers for
> anything you've missed, add those and resend with Willy's r-b tag
> included?
> 
> Then Alex can pick it up for merging.
> 
> Thanks, Daniel
>
I had already submitted a v2 of this patch with an added 'Review-by' Matthew 
Wilcox under my name. It removed the unnecessary braces that willy pointed 
out. However I see that not all maintainers had been cc'ed, so I'm going to  
resend it as v3.

Thanks,

Fabio





_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
