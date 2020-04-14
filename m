Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDEA1A8571
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 18:43:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65276E129;
	Tue, 14 Apr 2020 16:43:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EFA66E129
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 16:43:38 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id h26so3743796wrb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 09:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JmBE6vDIWacgssdyxDTzUlIuzDLnrOU/kmYU+faUE80=;
 b=HDPKcEHNK3kFswrnDMcYObxVyGCkRr4lLdNCE1Y++SrJPnniIiUk4vAnBBU2l8e7Qx
 +zbytWp7xUBq2swbo5pruV8NqHKiS9nbYZ+KP1KW/oAc8tIQecHEHuZaW41RSntv1uq7
 JOJcqPyCqYOVDimKiPrc3FYoxVpcP/91zAC9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JmBE6vDIWacgssdyxDTzUlIuzDLnrOU/kmYU+faUE80=;
 b=NhFt+YmcbKx4p0Sbs+7KeTq0QlrVCgTbSg2hlSnNGMPRgTBRaAb6H7GoQrOdxakhyt
 /riEyezoKUk8agRFKQbIKKI1JGr4ysEzrthXcL7P1D5KLhiG6KDLTDdIPS3WAahp5a2s
 1eUbbXmyZYTi0rdfPywQ49zfSgX2cE6oBMmp89dS8P/LnnGt+hbxLtaH8I8gP+t/4Wxq
 TElL4Jj8CfEyDNQ1mURJOmlK11Y16Zn0WaPg1cm59cfngF1Z573KwZCpySIVM25YgTJR
 HNPdkMrGYPc4mu3wG8NkQxE3b5dmzJ4G/qv7wui1+2o9KbW30trsevnEaaK+A0nxe5si
 ky8A==
X-Gm-Message-State: AGi0PuY0hGeb1X1qWgJHtxmofnuh7KhUtPVqQYyFSju2ncx4WDIoSnnb
 XM8VP8WTpqANNgVFEbiEK4af7g==
X-Google-Smtp-Source: APiQypLUenBTIXRPBDr6SLPoUYSOP6mcSouLw6uqb853nbFSJZTCHc5U8Cvy2K6UJ0X14UNm3q6tkA==
X-Received: by 2002:adf:9564:: with SMTP id 91mr25377026wrs.246.1586882616857; 
 Tue, 14 Apr 2020 09:43:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d7sm19733270wrr.77.2020.04.14.09.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 09:43:36 -0700 (PDT)
Date: Tue, 14 Apr 2020 18:43:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 03/44] drm/device: Deprecate dev_private harder
Message-ID: <20200414164334.GY3456981@phenom.ffwll.local>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-4-daniel.vetter@ffwll.ch>
 <20200408070207.GD14965@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408070207.GD14965@ravnborg.org>
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 08, 2020 at 09:02:07AM +0200, Sam Ravnborg wrote:
> On Fri, Apr 03, 2020 at 03:57:47PM +0200, Daniel Vetter wrote:
> > We've had lots of conversions to embeddeding, but didn't stop using
> > ->dev_private. Which defeats the point of this.
> > 
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Went right ahead and pushed this since a doc patch only, thanks for taking
a look!
-Daniel

> > ---
> >  include/drm/drm_device.h | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> > 
> > diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> > index d39132b477dd..a55874db9dd4 100644
> > --- a/include/drm/drm_device.h
> > +++ b/include/drm/drm_device.h
> > @@ -88,9 +88,12 @@ struct drm_device {
> >  	/**
> >  	 * @dev_private:
> >  	 *
> > -	 * DRM driver private data. Instead of using this pointer it is
> > -	 * recommended that drivers use drm_dev_init() and embed struct
> > -	 * &drm_device in their larger per-device structure.
> > +	 * DRM driver private data. This is deprecated and should be left set to
> > +	 * NULL.
> > +	 *
> > +	 * Instead of using this pointer it is recommended that drivers use
> > +	 * drm_dev_init() and embed struct &drm_device in their larger
> > +	 * per-device structure.
> >  	 */
> >  	void *dev_private;
> >  
> > -- 
> > 2.25.1
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
