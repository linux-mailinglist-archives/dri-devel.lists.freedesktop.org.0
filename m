Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADABC13499B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 18:42:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E513D89824;
	Wed,  8 Jan 2020 17:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C4F89824
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 17:42:40 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id g17so4349062wro.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2020 09:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=O+A+WGxi0nAa4MDN7MlwBOCpZtr6xwChxZp9hyHT+/4=;
 b=OJ1/VRTldJ4+N7z9YwHfSDLy+mLK8xLKAYujtuNwaot4RfR5gs/dKu3d806jV/2zDS
 ARhKuDrb1kVXFY1KGKLaEyftVU4+zGNgJPTNUwBJ1b43LSeTrkYDSm1tT+Zmyjy2tAf9
 TaOz25CinXMFGGjxR009IxpoJXF64ON1ooIKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=O+A+WGxi0nAa4MDN7MlwBOCpZtr6xwChxZp9hyHT+/4=;
 b=fXJ8HOEHd91b90wTUwnopLe7JhYbB6I2TCrrX0gMM0p4T0WddGMMnb7fYKzG5C1nAN
 89XzlyQfEFzlWxlr40LrbaL1/2JpG4LVcj9eLptwr+eOyFjAA2DVMk6H/Y4I8uIgOp88
 fV/7Sz19KK04zpFthGFQrVbE/+VKcscqVqtoRg3mhi3+JfhBWRlfBfc3du2H4Z09InqD
 aLCF4DTiR8M14kHLVEbehS52ZzdBnFpDVHlrVEpYlD+6gcTTyuQ58SGB46WRJbBLOtg0
 m6iDhsPfGUw0AfOKnmIW2CAKMDP2TFqREKKcjzPM7ZWb79gJP56vLvEKFzWSdDLj58f6
 Uu3g==
X-Gm-Message-State: APjAAAVMK/09Zs5ArHl1bU5rYd+j+4RWlSRGuzSHUZIrOYCSOVseI4xL
 vxXaET2fBfEfkzZoj2SqjD96b99/FNM=
X-Google-Smtp-Source: APXvYqzw5sExskfpGMJwohq6vsHaqb5uRL/OXFV5TaohyzQzIUisOAsudGz8Ub1PVd9wrc/rArLSCA==
X-Received: by 2002:adf:fa12:: with SMTP id m18mr5658429wrr.309.1578505358959; 
 Wed, 08 Jan 2020 09:42:38 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id q11sm5031155wrp.24.2020.01.08.09.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 09:42:38 -0800 (PST)
Date: Wed, 8 Jan 2020 18:42:36 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH] drm/Kconfig: add missing 'depends on DRM' for DRM_DP_CEC
Message-ID: <20200108174236.GH43062@phenom.ffwll.local>
References: <489bdaae-9b05-2d70-12e1-4fda7899dfc1@xs4all.nl>
 <bbbef09d-6c90-75ba-e480-28365474b1a5@xs4all.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bbbef09d-6c90-75ba-e480-28365474b1a5@xs4all.nl>
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
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 08, 2020 at 01:08:47PM +0100, Hans Verkuil wrote:
> On 12/6/19 12:26 PM, Hans Verkuil wrote:
> > Add a missing 'depends on DRM' for the DRM_DP_CEC config
> > option. Without that enabling DRM_DP_CEC will force CEC_CORE
> > to =y instead of =m if DRM=m as well.
> > 
> > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
> Daniel, can you review this? It's annoying that the cec core is
> compiled as part of the kernel when it can just be a module.

Why did we even make this optional? Really worth it to compile out 4
functions and some change?

Anyway the one you really want here is CONFIG_DRM_KMS_HELPER, but that is
a selected variable, and you can't mix select and depends on because that
breaks Kconfig in hilarious ways. Or so I thought, but other public
symbols like this (e.g. DRM_FBDEV_EMULATION) do the same trick. So I guess

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

But really, is all this complexity?
-Daniel

> 
> Regards,
> 
> 	Hans
> 
> > ---
> > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > index 1168351267fd..e8e478d6da9c 100644
> > --- a/drivers/gpu/drm/Kconfig
> > +++ b/drivers/gpu/drm/Kconfig
> > @@ -163,6 +163,7 @@ config DRM_LOAD_EDID_FIRMWARE
> > 
> >  config DRM_DP_CEC
> >  	bool "Enable DisplayPort CEC-Tunneling-over-AUX HDMI support"
> > +	depends on DRM
> >  	select CEC_CORE
> >  	help
> >  	  Choose this option if you want to enable HDMI CEC support for
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
