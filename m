Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F3411E1DD
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 11:23:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD8DF6E317;
	Fri, 13 Dec 2019 10:23:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E0716E317
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 10:23:36 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id q6so6008993wro.9
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 02:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=lkuRiZ9r37ASkewTrZu6kurpJOdsWcISSYo88JQ20/4=;
 b=Jmt28bU11AgCa3D8F1L3MLtcapj1L6fZeTA2AVtQJUv47pbFKoeakjQR+5FNXXc5QS
 hdpZ/HkYDiDZ7lIH/P/S7Zwt8zDnIBPScVUDxU/7kdDfDLVWNY0nPujmD5Ta8yrU8v6S
 P7JTgDmbheCYu39fXFAYX4YPQgLRpbohEuklc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=lkuRiZ9r37ASkewTrZu6kurpJOdsWcISSYo88JQ20/4=;
 b=cd21GRJmWyFNLREXIfLu9KZXBjYfY1Dk4e4K8s2naGv1M6NxsAOowrJ3HqTj7ZJXH2
 iKBfzKo7XPdwjwtayiC+2uV9s7ofwwcvUfOzD48iof2ecnDVQ1VoC8PZRges2qwCY94N
 bPp3fCU9EEAHQjzdvmLMAg+zmnCD6WwuWzXmLKW9EjQ/0FxjX+SV1BStOBsHMa49E34i
 kTI+E6Zvm6BhG7+9RU2x4S91EmoxwpsHtzvQPz9DvH4830fzazO/+xx6gjRNRNzaYtF5
 XT+aQ8LLzCN9IfR0KzrmdxCfvDNx8wBlV7FwBlxCPpH3u+O6rPcoZDacxC9bpHGojnMq
 c+Ag==
X-Gm-Message-State: APjAAAWzmYAkqZIGwcHFZKa6xrGNVMlbVeL1z7LYPZWq8BGddlFq977o
 CKqTLU1B1LEdT2JRHcWazC3jdA==
X-Google-Smtp-Source: APXvYqxidik5DhdseBjm91UHFN9L0Rk5m9aDinuqhNpX/3VasKv2fki7HKuvU7T5As5WETsNN1JSkg==
X-Received: by 2002:adf:d184:: with SMTP id v4mr11896637wrc.76.1576232615264; 
 Fri, 13 Dec 2019 02:23:35 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id h8sm10010781wrx.63.2019.12.13.02.23.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 02:23:34 -0800 (PST)
Date: Fri, 13 Dec 2019 11:23:32 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/3] drm/vram-helper: Support struct
 drm_driver.gem_create_object
Message-ID: <20191213102332.GF624164@phenom.ffwll.local>
References: <20191211180832.7159-1-tzimmermann@suse.de>
 <20191211180832.7159-4-tzimmermann@suse.de>
 <20191211191128.GA8889@ravnborg.org>
 <c9ae9948-06b7-377a-7b4e-35ed60a344b6@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c9ae9948-06b7-377a-7b4e-35ed60a344b6@suse.de>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: puck.chen@hisilicon.com, dri-devel@lists.freedesktop.org,
 z.liuxinliang@hisilicon.com, kong.kongxinwei@hisilicon.com, kraxel@redhat.com,
 zourongrong@gmail.com, airlied@redhat.com, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 12, 2019 at 06:39:04AM +0100, Thomas Zimmermann wrote:
> Hi Sam
> =

> Am 11.12.19 um 20:11 schrieb Sam Ravnborg:
> > Hi Thomas,
> > =

> > On Wed, Dec 11, 2019 at 07:08:32PM +0100, Thomas Zimmermann wrote:
> >> Drivers that what to allocate VRAM GEM objects with additional fields
> >> can now do this by implementing struct drm_driver.gem_create_object.
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> ---
> >>  drivers/gpu/drm/drm_gem_vram_helper.c | 11 +++++++++--
> >>  1 file changed, 9 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/d=
rm_gem_vram_helper.c
> >> index b760fd27f3c0..d475d94e2e3e 100644
> >> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> >> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> >> @@ -2,6 +2,7 @@
> >>  =

> >>  #include <drm/drm_debugfs.h>
> >>  #include <drm/drm_device.h>
> >> +#include <drm/drm_drv.h>
> >>  #include <drm/drm_file.h>
> >>  #include <drm/drm_framebuffer.h>
> >>  #include <drm/drm_gem_ttm_helper.h>
> >> @@ -142,13 +143,19 @@ struct drm_gem_vram_object *drm_gem_vram_create(=
struct drm_device *dev,
> >>  						size_t size,
> >>  						unsigned long pg_align)
> >>  {
> >> +	struct drm_gem_object *gem;
> >>  	struct drm_gem_vram_object *gbo;
> >>  	int ret;
> >>  =

> >> -	gbo =3D kzalloc(sizeof(*gbo), GFP_KERNEL);
> >> -	if (!gbo)
> >> +	if (dev->driver->gem_create_object)
> >> +		gem =3D dev->driver->gem_create_object(dev, size);
> >> +	else
> >> +		gem =3D kzalloc(sizeof(*gbo), GFP_KERNEL);
> > The size is (*gbo) but you assume it is a gem.
> > Looks wrong at first glance???
> =

> The conversion to gbo is...
> =

> > =

> > 	Sam
> > =

> > =

> >> +	if (!gem)
> >>  		return ERR_PTR(-ENOMEM);
> >>  =

> >> +	gbo =3D drm_gem_vram_of_gem(gem);
> >> +
> =

> ...here. This could be pushed into the if branch, but I found it more
> readable to put the statement here. For the else branch, it doesn't
> matter as 'gem' goes first in the structure.
> =

> I'll move it into the if branch, so it's more obvious what's going on
> and doesn't break accidentally.

If you push this into the if() branch them imo also push the gem temp
variable there. I think that would be quite readable again. Also, probably
means you need to push the if (!gem) check too, and make it if (!gbo) in
the else branch.

Either way: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> =

> Best regards
> Thomas
> =

> >>  	ret =3D drm_gem_vram_init(dev, gbo, size, pg_align);
> >>  	if (ret < 0)
> >>  		goto err_kfree;
> >> -- =

> >> 2.24.0
> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =





-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
