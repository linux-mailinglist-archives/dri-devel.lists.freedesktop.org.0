Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6501D1BC06D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 16:00:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B1F36E499;
	Tue, 28 Apr 2020 14:00:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEADC6E4AB
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 14:00:15 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id u16so2969646wmc.5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 07:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Ps7I9Le1y+DBQ90d3polh0iWEICybIDac38fYlXMUHU=;
 b=RTXgbW5JR0qaHgN6xT1CbnFJkWffgxVeYV9PCtA/lHqfLfEeR37BG3yppLYmEhp9Oo
 9AV97owvuWPTrWYj9o9dDUq8lcxHcw6cctt4Lyj8cSIfxEcL6KbuQesljWupR6oSs9w/
 R8I1b9G4gFRCAbkHMZGlZWQMIxZhYww8BqPxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ps7I9Le1y+DBQ90d3polh0iWEICybIDac38fYlXMUHU=;
 b=Gx5mY0W4C6X2GJVHOjTv1it5p15kBQyvKrf0LM+wBFYrEliSLKKRLDOQQz/1rJUlnW
 ilDG52WQXWOH3XzVoivl9WtRzMhJ1o8LU8KgIz5A6jLZ5CpvDnUfj9NkuCyousOCkckC
 LRarC7q6voUuLylMz+krDivXHdhQrdhVKUUe7BsT2dtp5fJEfLwVgfw9pIK2JtCveYhe
 8kSylk8kEVo69CNBD8XiSsFEEhVLG/l0XPm3yEbD7Uu6cgGJSLkQW2KxZwNWblkGFFXM
 wt1DurmSpRshL80UDS5pJAKafPvP4HE/gVo4t9o1fxl8eeBCEZwU1N6TUvkJX8o3Xw4E
 fekg==
X-Gm-Message-State: AGi0PuZ/e6UEbYV+a7sAlHfKgbmBAuxpcQ+9ByZavAIbF8AjbpbGklpu
 aIFgN1lrvOA0jRh85ycGhYh/DQ==
X-Google-Smtp-Source: APiQypIEnobdueqT/cHpOrriPZZPy/M74lLsyOtUmRObtKxhAJT95KOZC9e05zorxNWpOlR6T77frg==
X-Received: by 2002:a1c:808c:: with SMTP id b134mr4975620wmd.131.1588082414409; 
 Tue, 28 Apr 2020 07:00:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w12sm25030016wrk.56.2020.04.28.07.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 07:00:13 -0700 (PDT)
Date: Tue, 28 Apr 2020 16:00:11 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 26/59] drm/qxl: Use devm_drm_dev_alloc
Message-ID: <20200428140011.GK3456981@phenom.ffwll.local>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-27-daniel.vetter@ffwll.ch>
 <20200424150911.GB20856@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200424150911.GB20856@ravnborg.org>
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
Cc: Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, spice-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 24, 2020 at 05:09:11PM +0200, Sam Ravnborg wrote:
> Hi Daniel
> 
> On Wed, Apr 15, 2020 at 09:40:01AM +0200, Daniel Vetter wrote:
> > Also need to remove the drm_dev_put from the remove hook.
> > 
> > Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Dave Airlie <airlied@redhat.com>
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: virtualization@lists.linux-foundation.org
> > Cc: spice-devel@lists.freedesktop.org
> > ---
> >  drivers/gpu/drm/qxl/qxl_drv.c | 15 ++++++++-------
> >  drivers/gpu/drm/qxl/qxl_drv.h |  3 +--
> >  drivers/gpu/drm/qxl/qxl_kms.c | 12 +-----------
> >  3 files changed, 10 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
> > index 09102e2efabc..6b4ae4c5fb76 100644
> > --- a/drivers/gpu/drm/qxl/qxl_drv.c
> > +++ b/drivers/gpu/drm/qxl/qxl_drv.c
> > @@ -81,13 +81,16 @@ qxl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> >  		return -EINVAL; /* TODO: ENODEV ? */
> >  	}
> >  
> > -	qdev = kzalloc(sizeof(struct qxl_device), GFP_KERNEL);
> > -	if (!qdev)
> > +	qdev = devm_drm_dev_alloc(&pdev->dev, &qxl_driver,
> > +				  struct qxl_device, ddev);
> > +	if (IS_ERR(qdev)) {
> > +		pr_err("Unable to init drm dev");
> >  		return -ENOMEM;
> > +	}
> 
> The other patches do not add any error message when devm_drm_dev_alloc()
> fails and driver core will log that driver init failed.
> 
> So the pr_err() above should be dropped.
> I know it comes from qxl_device_init() but that does not make it a good
> idea.

Hm I know we're inconsistent here, but some drivers have error logging on
all branches, some dont. I'm just trying to go with the prevailing style.

> With this fixed:

Insisting on this or ok as-is?
-Daniel

> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> 
> >  
> >  	ret = pci_enable_device(pdev);
> >  	if (ret)
> > -		goto free_dev;
> > +		return ret;
> >  
> >  	ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "qxl");
> >  	if (ret)
> > @@ -101,7 +104,7 @@ qxl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> >  		}
> >  	}
> >  
> > -	ret = qxl_device_init(qdev, &qxl_driver, pdev);
> > +	ret = qxl_device_init(qdev, pdev);
> >  	if (ret)
> >  		goto put_vga;
> >  
> > @@ -128,8 +131,7 @@ qxl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> >  		vga_put(pdev, VGA_RSRC_LEGACY_IO);
> >  disable_pci:
> >  	pci_disable_device(pdev);
> > -free_dev:
> > -	kfree(qdev);
> > +
> >  	return ret;
> >  }
> >  
> > @@ -155,7 +157,6 @@ qxl_pci_remove(struct pci_dev *pdev)
> >  	drm_atomic_helper_shutdown(dev);
> >  	if (is_vga(pdev))
> >  		vga_put(pdev, VGA_RSRC_LEGACY_IO);
> > -	drm_dev_put(dev);
> >  }
> >  
> >  DEFINE_DRM_GEM_FOPS(qxl_fops);
> > diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.h
> > index 435126facc9b..86ac191d9205 100644
> > --- a/drivers/gpu/drm/qxl/qxl_drv.h
> > +++ b/drivers/gpu/drm/qxl/qxl_drv.h
> > @@ -276,8 +276,7 @@ struct qxl_device {
> >  extern const struct drm_ioctl_desc qxl_ioctls[];
> >  extern int qxl_max_ioctl;
> >  
> > -int qxl_device_init(struct qxl_device *qdev, struct drm_driver *drv,
> > -		    struct pci_dev *pdev);
> > +int qxl_device_init(struct qxl_device *qdev, struct pci_dev *pdev);
> >  void qxl_device_fini(struct qxl_device *qdev);
> >  
> >  int qxl_modeset_init(struct qxl_device *qdev);
> > diff --git a/drivers/gpu/drm/qxl/qxl_kms.c b/drivers/gpu/drm/qxl/qxl_kms.c
> > index 9eed1a375f24..91a34dd835d7 100644
> > --- a/drivers/gpu/drm/qxl/qxl_kms.c
> > +++ b/drivers/gpu/drm/qxl/qxl_kms.c
> > @@ -108,21 +108,13 @@ static void qxl_gc_work(struct work_struct *work)
> >  }
> >  
> >  int qxl_device_init(struct qxl_device *qdev,
> > -		    struct drm_driver *drv,
> >  		    struct pci_dev *pdev)
> >  {
> >  	int r, sb;
> >  
> > -	r = drm_dev_init(&qdev->ddev, drv, &pdev->dev);
> > -	if (r) {
> > -		pr_err("Unable to init drm dev");
> > -		goto error;
> > -	}
> > -
> >  	qdev->ddev.pdev = pdev;
> >  	pci_set_drvdata(pdev, &qdev->ddev);
> >  	qdev->ddev.dev_private = qdev;
> > -	drmm_add_final_kfree(&qdev->ddev, qdev);
> >  
> >  	mutex_init(&qdev->gem.mutex);
> >  	mutex_init(&qdev->update_area_mutex);
> > @@ -138,8 +130,7 @@ int qxl_device_init(struct qxl_device *qdev,
> >  	qdev->vram_mapping = io_mapping_create_wc(qdev->vram_base, pci_resource_len(pdev, 0));
> >  	if (!qdev->vram_mapping) {
> >  		pr_err("Unable to create vram_mapping");
> > -		r = -ENOMEM;
> > -		goto error;
> > +		return -ENOMEM;
> >  	}
> >  
> >  	if (pci_resource_len(pdev, 4) > 0) {
> > @@ -293,7 +284,6 @@ int qxl_device_init(struct qxl_device *qdev,
> >  	io_mapping_free(qdev->surface_mapping);
> >  vram_mapping_free:
> >  	io_mapping_free(qdev->vram_mapping);
> > -error:
> >  	return r;
> >  }
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
