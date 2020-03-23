Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A16118F353
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 12:02:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B211089EF7;
	Mon, 23 Mar 2020 11:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A54C389F77
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 11:02:44 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id h15so4244933wrx.9
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 04:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IUrL6RT5B4au/jksoZX0NvHn1tjMEl4mdR//1cfnuhA=;
 b=BJqg6wGqEYi2vq9LBm3GGh8QTcAziBEgeO9Y4/yGVVpWm552u5YTBb8PiLGHEgVO0o
 +qdpthaoxDWCkfgQEUW8aiKGMIBWWohVQUMjuKMXh9uCtQITIGF9zkdSue/JuFwAfdsn
 k8N36o7qKyuCGp/BaxpVGD6nIVH28uQCDnlpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IUrL6RT5B4au/jksoZX0NvHn1tjMEl4mdR//1cfnuhA=;
 b=owI3fbSHICbiiyXx2kLf52/jznhxjxBMDNOjKl0C9NgxU/bLLK/QJBhRLpQ6pwQddG
 FE6oUa8W8/nkvdXUX0hwS7xTv6ZBw84PwrZvMBczVm1voG8G0DR7ajlSaeb1Sw7rnuNb
 0fIO58GfHZWNqIi095ZCI3/7kbj5qMUk+TABhOUIor853kR2uw7A9L13/c7TPsAluKyb
 wstD7ZjXmlG+rdeSPg8QVhDO/bltl/rK/Af7DAyBD+k1qxPxv+EZXh1nYNIIPX8pE/2M
 KVuXprv6q9YWA/pMg4fR81rDXvVu2XkVxGMvkeuKjoIFRjJasMSPxZBG7vVXR8gU5pfC
 WOTA==
X-Gm-Message-State: ANhLgQ3Xbjq4leqt1ujknUxR0WoChzsDOCMReuoT1QJr4X3gW+NXd5gr
 Rsl0Xx9tvBn9IJhEAYC61Sqixg==
X-Google-Smtp-Source: ADFU+vuy0yy7F87SXdslP+hL3OUGRcJkiAjDgnRZdw8bLWbYBBR26u6l7P0EKvVeSOp7GNEcIv3Gig==
X-Received: by 2002:a05:6000:1251:: with SMTP id
 j17mr12786883wrx.228.1584961363305; 
 Mon, 23 Mar 2020 04:02:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t5sm20829173wmi.34.2020.03.23.04.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 04:02:41 -0700 (PDT)
Date: Mon, 23 Mar 2020 12:02:38 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 04/51] drm: Set final_kfree in drm_dev_alloc
Message-ID: <20200323110238.GI2363188@phenom.ffwll.local>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-5-daniel.vetter@ffwll.ch>
 <20200307080608.GA28810@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200307080608.GA28810@ravnborg.org>
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
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Mar 07, 2020 at 09:06:08AM +0100, Sam Ravnborg wrote:
> On Mon, Mar 02, 2020 at 11:25:44PM +0100, Daniel Vetter wrote:
> > I also did a full review of all callers, and only the xen driver
> > forgot to call drm_dev_put in the failure path. Fix that up too.
> 
> So ~40 callers - phew..
> 
> > 
> > v2: I noticed that xen has a drm_driver.release hook, and uses
> > drm_dev_alloc(). We need to remove the kfree from
> > xen_drm_drv_release().
> > 
> > bochs also has a release hook, but leaked the drm_device ever since
> > 
> > commit 0a6659bdc5e8221da99eebb176fd9591435e38de
> > Author: Gerd Hoffmann <kraxel@redhat.com>
> > Date:   Tue Dec 17 18:04:46 2013 +0100
> > 
> >     drm/bochs: new driver
> > 
> > This patch here fixes that leak.
> > 
> > Same for virtio, started leaking with
> > 
> > commit b1df3a2b24a917f8853d43fe9683c0e360d2c33a
> > Author: Gerd Hoffmann <kraxel@redhat.com>
> > Date:   Tue Feb 11 14:58:04 2020 +0100
> > 
> >     drm/virtio: add drm_driver.release callback.
> > 
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> > Cc: xen-devel@lists.xenproject.org
> 
> The above will be picked up by tools as regular Cc: lines.
> But I guess it is fine.

That was the idea, I've deleted the spurious blank line to make this less
confusing.
-Daniel

> 
> > 
> > Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> > Cc: xen-devel@lists.xenproject.org
> 
> For the drivers I looked at everything looked fine.
> 
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> 
> > ---
> >  drivers/gpu/drm/drm_drv.c           | 3 +++
> >  drivers/gpu/drm/xen/xen_drm_front.c | 2 +-
> >  2 files changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > index 153050fc926c..7b84ee8a5eb5 100644
> > --- a/drivers/gpu/drm/drm_drv.c
> > +++ b/drivers/gpu/drm/drm_drv.c
> > @@ -39,6 +39,7 @@
> >  #include <drm/drm_color_mgmt.h>
> >  #include <drm/drm_drv.h>
> >  #include <drm/drm_file.h>
> > +#include <drm/drm_managed.h>
> >  #include <drm/drm_mode_object.h>
> >  #include <drm/drm_print.h>
> >  
> > @@ -819,6 +820,8 @@ struct drm_device *drm_dev_alloc(struct drm_driver *driver,
> >  		return ERR_PTR(ret);
> >  	}
> >  
> > +	drmm_add_final_kfree(dev, dev);
> > +
> >  	return dev;
> >  }
> >  EXPORT_SYMBOL(drm_dev_alloc);
> > diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
> > index 4be49c1aef51..d22b5da38935 100644
> > --- a/drivers/gpu/drm/xen/xen_drm_front.c
> > +++ b/drivers/gpu/drm/xen/xen_drm_front.c
> > @@ -461,7 +461,6 @@ static void xen_drm_drv_release(struct drm_device *dev)
> >  	drm_mode_config_cleanup(dev);
> >  
> >  	drm_dev_fini(dev);
> > -	kfree(dev);
> >  
> >  	if (front_info->cfg.be_alloc)
> >  		xenbus_switch_state(front_info->xb_dev,
> > @@ -561,6 +560,7 @@ static int xen_drm_drv_init(struct xen_drm_front_info *front_info)
> >  fail_modeset:
> >  	drm_kms_helper_poll_fini(drm_dev);
> >  	drm_mode_config_cleanup(drm_dev);
> > +	drm_dev_put(drm_dev);
> >  fail:
> >  	kfree(drm_info);
> >  	return ret;
> > -- 
> > 2.24.1
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
