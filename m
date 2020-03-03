Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4D3177134
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 09:25:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E096E9FD;
	Tue,  3 Mar 2020 08:25:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026EA6E9FD
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 08:25:41 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id q8so3177366wrm.4
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2020 00:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=t3zvw95z8Q2VG1iK6TH55Ty7NZdpIUxmnUnuBIFWUwE=;
 b=SK8I//A3LrZ4LK0MQ/B/gsgUbbdof3ZGuSb3rImnnAzABGvLNc53p1PjEPZ/mS5sTH
 EdfpRheM+H8xgLLy0azdMUGkA38Snq69v4oHHAsRYKLBWO+5ndnu1VjS4FkDZLUL8Oaw
 R4+lT9Ql2P5GnTkKvMCC9draaxnLzS9V2W7Nw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t3zvw95z8Q2VG1iK6TH55Ty7NZdpIUxmnUnuBIFWUwE=;
 b=B2fRsDkPWHKKPaZHbLk8TJRP6pcW/5Rfqg5n27W1E717/rNsp6xH3pksvySE9WErAZ
 xQbOvlrL8PMlpbmzkffDBkXyiQZfmwgB4n6yQW/sPj+op8SXCn663sTmWgmoI4je34WZ
 BbNfimhe06BoYndlVWRd7ctdtp27ACChV+S00FBbG+7ShokkPGzHZhH9QBQvJoxW5I8I
 Jj0L/AngcQ1LnjbDXz7268I004iS+FbkUKNwqHHNF5weXbOMWx6GPlAh69TkYJAUgIZe
 Ac1kYkfJc5rN6G6hCRWSh/FKlrao9mIC0jDmLsAw1wuwtyNeJ2i92SZ5kKdowvZ8uNri
 t3Zg==
X-Gm-Message-State: ANhLgQ16pFbIFo33lGh6qEzmVuHZ18U9aTjXzZ4OimD4wZ7FKB8BGXbq
 4sqbY6a53XxxJD+jfBbfROGZ1Q==
X-Google-Smtp-Source: ADFU+vtQ1+d84ZdVzrbMlbkeMXOJERptfawrBSiDYPSKIrf6gQojiWq3oUADG/uASP+Zgn21vNcDSA==
X-Received: by 2002:a05:6000:12c9:: with SMTP id
 l9mr4544865wrx.25.1583223940594; 
 Tue, 03 Mar 2020 00:25:40 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 61sm32754240wrf.65.2020.03.03.00.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 00:25:40 -0800 (PST)
Date: Tue, 3 Mar 2020 09:25:38 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 03/51] drm: add managed resources tied to drm_device
Message-ID: <20200303082538.GK2363188@phenom.ffwll.local>
References: <20200302222631.3861340-4-daniel.vetter@ffwll.ch>
 <20200303080406.GC24372@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200303080406.GC24372@kadam>
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
Cc: kbuild-all@lists.01.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, kbuild@lists.01.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 03, 2020 at 11:04:06AM +0300, Dan Carpenter wrote:
> Hi Daniel,
> 
> I love your patch! Perhaps something to improve:
> 
> url:    https://github.com/0day-ci/linux/commits/Daniel-Vetter/drm_device-managed-resources-v4/20200303-071023
> base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> smatch warnings:
> drivers/gpu/drm/drm_drv.c:843 drm_dev_release() error: dereferencing freed memory 'dev'
> 
> # https://github.com/0day-ci/linux/commit/5aba700d4c32ae5722a9931c959b13a6217a86e2
> git remote add linux-review https://github.com/0day-ci/linux
> git remote update linux-review
> git checkout 5aba700d4c32ae5722a9931c959b13a6217a86e2
> vim +/dev +843 drivers/gpu/drm/drm_drv.c
> 
> 099d1c290e2ebc drivers/gpu/drm/drm_stub.c David Herrmann 2014-01-29  826  static void drm_dev_release(struct kref *ref)
> 0dc8fe5985e01f drivers/gpu/drm/drm_stub.c David Herrmann 2013-10-02  827  {
> 099d1c290e2ebc drivers/gpu/drm/drm_stub.c David Herrmann 2014-01-29  828  	struct drm_device *dev = container_of(ref, struct drm_device, ref);
> 8f6599da8e772f drivers/gpu/drm/drm_stub.c David Herrmann 2013-10-20  829  
> f30c92576af4bb drivers/gpu/drm/drm_drv.c  Chris Wilson   2017-02-02  830  	if (dev->driver->release) {
> f30c92576af4bb drivers/gpu/drm/drm_drv.c  Chris Wilson   2017-02-02  831  		dev->driver->release(dev);
> f30c92576af4bb drivers/gpu/drm/drm_drv.c  Chris Wilson   2017-02-02  832  	} else {
> f30c92576af4bb drivers/gpu/drm/drm_drv.c  Chris Wilson   2017-02-02  833  		drm_dev_fini(dev);
> 5aba700d4c32ae drivers/gpu/drm/drm_drv.c  Daniel Vetter  2020-03-02  834  	}
> 5aba700d4c32ae drivers/gpu/drm/drm_drv.c  Daniel Vetter  2020-03-02  835  
> 5aba700d4c32ae drivers/gpu/drm/drm_drv.c  Daniel Vetter  2020-03-02  836  	drm_managed_release(dev);
> 5aba700d4c32ae drivers/gpu/drm/drm_drv.c  Daniel Vetter  2020-03-02  837  
> 5aba700d4c32ae drivers/gpu/drm/drm_drv.c  Daniel Vetter  2020-03-02  838  	if (!dev->driver->release && !dev->managed.final_kfree) {
> 5aba700d4c32ae drivers/gpu/drm/drm_drv.c  Daniel Vetter  2020-03-02  839  		WARN_ON(!list_empty(&dev->managed.resources));
> 0dc8fe5985e01f drivers/gpu/drm/drm_stub.c David Herrmann 2013-10-02  840  		kfree(dev);
>                                                                                         ^^^^^^^^^^
> Free
> 
> 0dc8fe5985e01f drivers/gpu/drm/drm_stub.c David Herrmann 2013-10-02  841  	}
> 5aba700d4c32ae drivers/gpu/drm/drm_drv.c  Daniel Vetter  2020-03-02  842  
> 5aba700d4c32ae drivers/gpu/drm/drm_drv.c  Daniel Vetter  2020-03-02 @843  	if (dev->managed.final_kfree)
>                                                                                     ^^^^^
> Dereference

Drat, so much for me trying to get this to bisect properly (it's interim
code and will disappear, end is correct I  think). I guess I'll try again.
-Daniel

> 
> 5aba700d4c32ae drivers/gpu/drm/drm_drv.c  Daniel Vetter  2020-03-02  844  		kfree(dev->managed.final_kfree);
> f30c92576af4bb drivers/gpu/drm/drm_drv.c  Chris Wilson   2017-02-02  845  }
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
