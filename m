Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 271C430D8A3
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 12:28:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA576EA5B;
	Wed,  3 Feb 2021 11:28:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1AC06EA5B
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 11:28:32 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id b3so5667236wrj.5
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Feb 2021 03:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=uxZHRqUeZooylYJaL3VrxiNipcqZjrlXyrtVM2mdH/0=;
 b=Z1f2aUkvgjbXv7j7XiHrSl1fi5MCkCGpd+7scOOnTaVZNLkWW6FNHcz1cBwPQqoRqV
 8tlJBClGwErL5MUAxDibHXOTMemgRCicHN0/qq4H3v5Ug20sj7cgSLv4LgLyQkQLXSIx
 4/oRDctDaUFvzJWArEa5i9bciqxvby65gDOKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=uxZHRqUeZooylYJaL3VrxiNipcqZjrlXyrtVM2mdH/0=;
 b=ObzmYmn8SaaRXSm1PoBMqgfsDC6qBlJM8sND4Snx8ZaJQrsAmX359hmnoaU/Rg5bgW
 EqUTBbS/5wc/cJQBOttcWOuGEHbsJIBcvyzHTKzoIvVmDY5V34xAUQyLhTF+6P+Lxcr9
 WIQXos6MqfDXK7PRcF7DmUrnqLCXv5+n+f9uK+RKuKh2TiR0FKlQXYcE+3Ah/N1wtwqu
 fqxVD+TIGVJpPfJaiLK8VUeLRNEepFMMhKlvq2Yp9S1+J8ilNDC+riDj4+P0EEp6NvFE
 SKtLdHMUeL53dLcMHwgGFEQmJKA7WeuIH0XpaeN8AlahbQJd18Bv6OIk2xTmngLofR++
 vLrA==
X-Gm-Message-State: AOAM5331Duwq6Tp0DYljm9RMEJB/NHbUfK80MkYCO97bjrpLlckKNRPE
 xaghPgqdr/+OtxFf+MNZBZl85A==
X-Google-Smtp-Source: ABdhPJwNpRlaFJ+plQKWXKZL1oWeXD/nmAODys+buGr15UlGwR44CuyH8FvQ8VNikOhw27oYN/wrxw==
X-Received: by 2002:adf:f28b:: with SMTP id k11mr2965521wro.418.1612351711435; 
 Wed, 03 Feb 2021 03:28:31 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u6sm3553885wro.75.2021.02.03.03.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 03:28:30 -0800 (PST)
Date: Wed, 3 Feb 2021 12:28:28 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 3/3] drm/ttm: drop sysfs directory
Message-ID: <YBqI3Je9ssGgNoPx@phenom.ffwll.local>
References: <20210128131604.149660-1-christian.koenig@amd.com>
 <20210128131604.149660-3-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210128131604.149660-3-christian.koenig@amd.com>
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
Cc: linux-graphics-maintainer@vmware.com, dri-devel@lists.freedesktop.org,
 sroland@vmware.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 28, 2021 at 02:16:04PM +0100, Christian K=F6nig wrote:
> Not used any more.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/ttm/ttm_module.c | 50 --------------------------------
>  drivers/gpu/drm/ttm/ttm_module.h |  2 --
>  2 files changed, 52 deletions(-)
> =

> diff --git a/drivers/gpu/drm/ttm/ttm_module.c b/drivers/gpu/drm/ttm/ttm_m=
odule.c
> index f6566603a60f..56b0efdba1a9 100644
> --- a/drivers/gpu/drm/ttm/ttm_module.c
> +++ b/drivers/gpu/drm/ttm/ttm_module.c
> @@ -37,66 +37,16 @@
>  =

>  #include "ttm_module.h"
>  =

> -static DECLARE_WAIT_QUEUE_HEAD(exit_q);
> -static atomic_t device_released;
>  struct dentry *ttm_debugfs_root;
>  =

> -static struct device_type ttm_drm_class_type =3D {
> -	.name =3D "ttm",
> -	/**
> -	 * Add pm ops here.
> -	 */
> -};
> -
> -static void ttm_drm_class_device_release(struct device *dev)
> -{
> -	atomic_set(&device_released, 1);
> -	wake_up_all(&exit_q);
> -}
> -
> -static struct device ttm_drm_class_device =3D {
> -	.type =3D &ttm_drm_class_type,
> -	.release =3D &ttm_drm_class_device_release
> -};
> -
> -struct kobject *ttm_get_kobj(void)
> -{
> -	struct kobject *kobj =3D &ttm_drm_class_device.kobj;
> -	BUG_ON(kobj =3D=3D NULL);
> -	return kobj;
> -}
> -
>  static int __init ttm_init(void)
>  {
> -	int ret;
> -
> -	ret =3D dev_set_name(&ttm_drm_class_device, "ttm");
> -	if (unlikely(ret !=3D 0))
> -		return ret;
> -
> -	atomic_set(&device_released, 0);
> -	ret =3D drm_class_device_register(&ttm_drm_class_device);
> -	if (unlikely(ret !=3D 0))
> -		goto out_no_dev_reg;
> -
>  	ttm_debugfs_root =3D debugfs_create_dir("ttm", NULL);
>  	return 0;
> -out_no_dev_reg:
> -	atomic_set(&device_released, 1);
> -	wake_up_all(&exit_q);
> -	return ret;
>  }
>  =

>  static void __exit ttm_exit(void)
>  {
> -	drm_class_device_unregister(&ttm_drm_class_device);
> -
> -	/**
> -	 * Refuse to unload until the TTM device is released.
> -	 * Not sure this is 100% needed.
> -	 */
> -
> -	wait_event(exit_q, atomic_read(&device_released) =3D=3D 1);
>  	debugfs_remove(ttm_debugfs_root);
>  }
>  =

> diff --git a/drivers/gpu/drm/ttm/ttm_module.h b/drivers/gpu/drm/ttm/ttm_m=
odule.h
> index 2f03c2fcf570..d7cac5d4b835 100644
> --- a/drivers/gpu/drm/ttm/ttm_module.h
> +++ b/drivers/gpu/drm/ttm/ttm_module.h
> @@ -33,10 +33,8 @@
>  =

>  #define TTM_PFX "[TTM] "
>  =

> -struct kobject;
>  struct dentry;
>  =

> -extern struct kobject *ttm_get_kobj(void);
>  extern struct dentry *ttm_debugfs_root;
>  =

>  #endif /* _TTM_MODULE_H_ */
> -- =

> 2.25.1
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
