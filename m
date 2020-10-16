Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0E82902A9
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 12:19:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D7C6EABB;
	Fri, 16 Oct 2020 10:18:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33856EAB9
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 10:18:54 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id n6so2070714wrm.13
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 03:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GlIvRCBazyQjS5aYzK3tRmPNMAVhxdGHniz7Um1oBms=;
 b=f1xhskLIgAu07XFPJl35YhJ0Oa6ErCbhPSLvYaimVcDI8tDfMtLHt03Lz/2ucnPyrG
 5XkW9iLvyqEG86625IQ9n+1NN0LbmV4RKvPg2b0zCpEUUG7HxOJlxP5GFxoxBjlII6z0
 WIgkYyeJPqSvpIvGLxrhlWOqBh9iw1sO2CqUkA7PL73ZhpqcLe2hCFW4nvXh0Ql/fBEa
 ImwG74xG24WijBOagkylNz2Ix04ZDUwbfKSbdaEzGxYoNBqvKCjSIEJipJSorKbEI1Zp
 QgrAfZ2ndcj2m6xYFZMYR5uneGCv3V96A4BxS4XE8f4KN2t9YuA0lGZSSNbdqLEpoFL2
 QdEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GlIvRCBazyQjS5aYzK3tRmPNMAVhxdGHniz7Um1oBms=;
 b=CjCKjSla24usGx9u53TxkefY7wTA7+DNrKVaf+iVda67jSw2foDLqToI4DobolJKWB
 aBWEblz7sDFm87zeVA0EBRB9YUHe6TqS1a+tr8UCe7AurMVxO5EHoAYbSfFd/2kRrbLC
 8fBoiUSNH0UOJdaLCzaNpK65l4WeLWQu82yYoBmEQbAAQHCM7dwJQIUrerCyLg56Pn9K
 GjfKKN7gYBNb5nz8d45nK8C+9of4x9njmFm3qaxAnIhEB73JUM6/T8wDlRyxmPc0gb3M
 WQfgA92sizUArIp5QDXDD7S1AxqhPyR6Tjsrha+kDsulYzIkR3weJngXtWk7qfb75qAm
 aJSw==
X-Gm-Message-State: AOAM532OwRv080P8m5ldSQIFKm9byL0BrPBPDUn9af0sHyUb6NVhVaY8
 Vz41Lf/myGpdutIqDPJbpS4izJp6f5Y=
X-Google-Smtp-Source: ABdhPJxEs5Nyi1OB1zHFKq6VbiAzjThF0/3R6nJ5hn+lnEUz/VA59nhBr+oTKZumTWAhUASqLSsU0g==
X-Received: by 2002:adf:e304:: with SMTP id b4mr2949294wrj.141.1602843533477; 
 Fri, 16 Oct 2020 03:18:53 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id v189sm2377434wmg.14.2020.10.16.03.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 03:18:52 -0700 (PDT)
Date: Fri, 16 Oct 2020 07:18:46 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/3] drm/vkms: Set preferred depth correctly
Message-ID: <20201016101846.6eyg6woq3lecnned@smtp.gmail.com>
References: <20201009232156.3916879-1-daniel.vetter@ffwll.ch>
 <20201012125922.utoehriuovbs66bk@smtp.gmail.com>
 <20201015213930.GD401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201015213930.GD401619@phenom.ffwll.local>
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
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/15, Daniel Vetter wrote:
> On Mon, Oct 12, 2020 at 09:59:22AM -0300, Melissa Wen wrote:
> > On 10/10, Daniel Vetter wrote:
> > > The only thing we support is xrgb8888.
> > > 
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > > Cc: Melissa Wen <melissa.srw@gmail.com>
> > > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > ---
> > >  drivers/gpu/drm/vkms/vkms_drv.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> > > index 726801ab44d4..eb4007443706 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > > @@ -124,7 +124,7 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
> > >  	dev->mode_config.max_height = YRES_MAX;
> > >  	dev->mode_config.cursor_width = 512;
> > >  	dev->mode_config.cursor_height = 512;
> > > -	dev->mode_config.preferred_depth = 24;
> > > +	dev->mode_config.preferred_depth = 32;
> > nice catch!
> > 
> > >  	dev->mode_config.helper_private = &vkms_mode_config_helpers;
> > >  
> > >  	return vkms_output_init(vkmsdev, 0);
> > > -- 
> > > 2.28.0
> > >
> > Thanks, 
> > 
> > Reviewed-by: Melissa Wen <melissa.srw@gmail.com>
> 
> I merged the first 2 patches of this series, but noticed that you didn't
> reply with a r-b tag on the 3rd patch. Is that intentional or just
> oversight?
Hi Daniel,

Initially, it was intentional because I was following the feedback and
still wanted to check it out better, then I forgot to come back to
comment.

My fault, but it's done now.

Thanks for the touch,

Melissa

> 
> Thanks, Daniel
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
