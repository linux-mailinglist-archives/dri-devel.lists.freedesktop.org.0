Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CE7324FC8
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 13:19:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD8E6E151;
	Thu, 25 Feb 2021 12:19:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA0266E151
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 12:19:36 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id a11so1126812wmd.5
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 04:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=1KsoHRKW/ThoUZzfR5xLk9411RK+VQI6DIZAlA3M9Hk=;
 b=ju8xAV//Q/VpSmTU1nEnNDciWc05BwjNvu1nj5sZf6OLs66sSfy/iJOwS/QZgTojCU
 81lRgbrzyJ/lxhJRXY6F/wX2xGBqHC2m78fKdhaZJw8j47aTnV2GqedkMO9OK0rBCPYm
 Uyfzs8OBNii1k4Xi7dS+xK6eW9YS33ZkR6zw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=1KsoHRKW/ThoUZzfR5xLk9411RK+VQI6DIZAlA3M9Hk=;
 b=Ksj2dmxWf5KNPZdzvGcpxxp244qZUYdBNdLjG9PwzlneQJ7JT2s0fPipbcxQtp9vzZ
 fJiLnjMnjB2LNHzyjlehtEDyY7zbHexPygpikeXY+31lBBUVhCsHmd3Yw2KB6xXKeDZx
 4Lv1JMekxho0YlSb8hN2laaNnIlbRVVSJHB9fYTsAhXy+jjMtNSiUCmtsvzp0sgB8TNr
 Q4bXGExdgNX7ypIQeWvwd/WN5ZzLySSImm0L+kdHeRbNlq40aWoU/e9uQyRnZz5/074F
 1OoaA7yJutAmWQKBjsm5f6MH5cYejAWXOJM2HwmX88rQqec8+fiFup9HKvvXGbwmkXH/
 btyg==
X-Gm-Message-State: AOAM532Tf6d7rONTs+O/+6nit3pn6WIGauvGIpBPFc/RAfZT0QdNNd9t
 lkFYFpHuqcIhG3ghmUMNlpbjr5KBR3SDyQ==
X-Google-Smtp-Source: ABdhPJycJER3KYTceCd4VTt+zKy07f9zcEv/89GkMWIOVTfZMpoIccaE72ocFgj6aQfuJpFpqphH1g==
X-Received: by 2002:a1c:e905:: with SMTP id q5mr3034729wmc.84.1614255575395;
 Thu, 25 Feb 2021 04:19:35 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b15sm8489955wmd.41.2021.02.25.04.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 04:19:34 -0800 (PST)
Date: Thu, 25 Feb 2021 13:19:32 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 01/15] drm/arc: Switch to devm_drm_dev_alloc
Message-ID: <YDeV1BTZZnEw1TQg@phenom.ffwll.local>
References: <20210112084358.2771527-1-daniel.vetter@ffwll.ch>
 <06a84729-c3e0-ed1a-807c-6629ed8cf2f9@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <06a84729-c3e0-ed1a-807c-6629ed8cf2f9@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Daniel Vetter <daniel.vetter@intel.com>, tiantao6@hisilicon.com,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 12, 2021 at 12:42:16PM +0100, Thomas Zimmermann wrote:
> Hi
> =

> Am 12.01.21 um 09:43 schrieb Daniel Vetter:
> > - Need to embedded the drm_device, but for now we keep the usual
> >    pointer chasing.
> > - No more devm_kzalloc, which fixes a lifetime issues on driver
> >    remove.
> > - No more drm_dev_put, that's done by devm_ now.
> > =

> > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Alexey Brodkin <abrodkin@synopsys.com>
> =

> For the whole patchset:
> =

> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> =

> There's a comment on patch 7.

Queued up the entire pile for 5.13, thanks for taking a look.
-Daniel

> =

> Best regards
> Thomas
> =

> > ---
> >   drivers/gpu/drm/arc/arcpgu.h     |  1 +
> >   drivers/gpu/drm/arc/arcpgu_drv.c | 33 +++++++++++++-------------------
> >   2 files changed, 14 insertions(+), 20 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/arc/arcpgu.h b/drivers/gpu/drm/arc/arcpgu.h
> > index 6aac44b953ad..cd9e932f501e 100644
> > --- a/drivers/gpu/drm/arc/arcpgu.h
> > +++ b/drivers/gpu/drm/arc/arcpgu.h
> > @@ -9,6 +9,7 @@
> >   #define _ARCPGU_H_
> >   struct arcpgu_drm_private {
> > +	struct drm_device	drm;
> >   	void __iomem		*regs;
> >   	struct clk		*clk;
> >   	struct drm_framebuffer	*fb;
> > diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arc=
pgu_drv.c
> > index f164818ec477..68eb4a31c54b 100644
> > --- a/drivers/gpu/drm/arc/arcpgu_drv.c
> > +++ b/drivers/gpu/drm/arc/arcpgu_drv.c
> > @@ -42,18 +42,14 @@ static void arcpgu_setup_mode_config(struct drm_dev=
ice *drm)
> >   DEFINE_DRM_GEM_CMA_FOPS(arcpgu_drm_ops);
> > -static int arcpgu_load(struct drm_device *drm)
> > +static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
> >   {
> > -	struct platform_device *pdev =3D to_platform_device(drm->dev);
> > -	struct arcpgu_drm_private *arcpgu;
> > +	struct platform_device *pdev =3D to_platform_device(arcpgu->drm.dev);
> >   	struct device_node *encoder_node =3D NULL, *endpoint_node =3D NULL;
> > +	struct drm_device *drm =3D &arcpgu->drm;
> >   	struct resource *res;
> >   	int ret;
> > -	arcpgu =3D devm_kzalloc(&pdev->dev, sizeof(*arcpgu), GFP_KERNEL);
> > -	if (arcpgu =3D=3D NULL)
> > -		return -ENOMEM;
> > -
> >   	drm->dev_private =3D arcpgu;
> >   	arcpgu->clk =3D devm_clk_get(drm->dev, "pxlclk");
> > @@ -162,30 +158,28 @@ static struct drm_driver arcpgu_drm_driver =3D {
> >   static int arcpgu_probe(struct platform_device *pdev)
> >   {
> > -	struct drm_device *drm;
> > +	struct arcpgu_drm_private *arcpgu;
> >   	int ret;
> > -	drm =3D drm_dev_alloc(&arcpgu_drm_driver, &pdev->dev);
> > -	if (IS_ERR(drm))
> > -		return PTR_ERR(drm);
> > +	arcpgu =3D devm_drm_dev_alloc(&pdev->dev, &arcpgu_drm_driver,
> > +				    struct arcpgu_drm_private, drm);
> > +	if (IS_ERR(arcpgu))
> > +		return PTR_ERR(arcpgu);
> > -	ret =3D arcpgu_load(drm);
> > +	ret =3D arcpgu_load(arcpgu);
> >   	if (ret)
> > -		goto err_unref;
> > +		return ret;
> > -	ret =3D drm_dev_register(drm, 0);
> > +	ret =3D drm_dev_register(&arcpgu->drm, 0);
> >   	if (ret)
> >   		goto err_unload;
> > -	drm_fbdev_generic_setup(drm, 16);
> > +	drm_fbdev_generic_setup(&arcpgu->drm, 16);
> >   	return 0;
> >   err_unload:
> > -	arcpgu_unload(drm);
> > -
> > -err_unref:
> > -	drm_dev_put(drm);
> > +	arcpgu_unload(&arcpgu->drm);
> >   	return ret;
> >   }
> > @@ -196,7 +190,6 @@ static int arcpgu_remove(struct platform_device *pd=
ev)
> >   	drm_dev_unregister(drm);
> >   	arcpgu_unload(drm);
> > -	drm_dev_put(drm);
> >   	return 0;
> >   }
> > =

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
