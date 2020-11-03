Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B1E2A447A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 12:46:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059756EC6A;
	Tue,  3 Nov 2020 11:46:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E03C6EC6A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 11:46:40 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b3so12286989wrx.11
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Nov 2020 03:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=v9zBxXo2df1AnoezGK/wVV9EmN0bJs0g58KZVKvJadk=;
 b=f3Pd+fnslyKGUR5dMhHC/JdwkhW8K1KStcRWAllCfNjxd7FMqAup5EA7Gqw09toU4N
 2Pomxt0E7/SsCkhP9R7Gkts+9wd2X5a54VImwV546onxGlbM9OyiRkBLym/5lbxBdiX4
 JqJ4sL78YQoO5YnliwAc4IR+RY00pswxdOg7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=v9zBxXo2df1AnoezGK/wVV9EmN0bJs0g58KZVKvJadk=;
 b=k07naqW+pRAK5b0a930Tfzlplu8ACdc4M7I84qo1/guLc5MVVONj6iGmuSrpAfrZDI
 xq73LF3ZGr2gANMNLMFRaCssvbAKj20Eeh2voy/Yl6SHV6ZJd5K8RRm9ag3TG1s9SuaB
 AT26dNeY3918jiBy8bq04m75MGt85e4It8b0cXCXExP5+PCGHDIebhUaS1IA3nuA/CRT
 t7UrKLRqw0YzG852A5/fQzKCDupvLIsiulWtWAeRic0g9Jmt1OcDNZPs2ChC6MtpFtGh
 fkQr92Qfp0C1AdQMIPMbsa/B9ouanGThzE1lGT+BPwF5BV5ZVAFWplrlLDbOshxa0YGu
 YW1A==
X-Gm-Message-State: AOAM532RSSEbIAVvDZm0LYnWpf7UDa0xVyONJp0OjWWX/85caT7HVstL
 VAuh7Dg/uGhty0HPYeRTvUiwV+g+5Vgn0tg4
X-Google-Smtp-Source: ABdhPJz84ykhgsAYFuFMJUnFsGj569o4DnS4RM+VcbhrSivHNErnhaWPbWTWEPOp4QreLd0ztZUIGQ==
X-Received: by 2002:a5d:4c4b:: with SMTP id n11mr25281388wrt.171.1604403999151; 
 Tue, 03 Nov 2020 03:46:39 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e2sm27170785wrr.85.2020.11.03.03.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 03:46:38 -0800 (PST)
Date: Tue, 3 Nov 2020 12:46:36 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2] drm: Add the new api to install irq
Message-ID: <20201103114636.GH401619@phenom.ffwll.local>
Mail-Followup-To: Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <maxime@cerno.tech>,
 Tian Tao <tiantao6@hisilicon.com>,
 maarten.lankhorst@linux.intel.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <1604369441-65254-1-git-send-email-tiantao6@hisilicon.com>
 <20201103095205.ywabphbc2xbop6ae@gilmour.lan>
 <f89640fb-6994-76dc-7862-a3b26b67dc24@suse.de>
 <20201103103832.gwjqf4urrn5y7zk5@gilmour.lan>
 <20201103105508.GD401619@phenom.ffwll.local>
 <2c364588-7636-f6ad-4cc6-0800088c511b@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2c364588-7636-f6ad-4cc6-0800088c511b@suse.de>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Tian Tao <tiantao6@hisilicon.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 03, 2020 at 12:25:06PM +0100, Thomas Zimmermann wrote:
> Hi
> =

> Am 03.11.20 um 11:55 schrieb Daniel Vetter:
> > On Tue, Nov 03, 2020 at 11:38:32AM +0100, Maxime Ripard wrote:
> >> On Tue, Nov 03, 2020 at 11:10:27AM +0100, Thomas Zimmermann wrote:
> >>> Hi
> >>>
> >>> Am 03.11.20 um 10:52 schrieb Maxime Ripard:
> >>>> On Tue, Nov 03, 2020 at 10:10:41AM +0800, Tian Tao wrote:
> >>>>> Add new api devm_drm_irq_install() to register interrupts,
> >>>>> no need to call drm_irq_uninstall() when the drm module is removed.
> >>>>>
> >>>>> v2:
> >>>>> fixed the wrong parameter.
> >>>>>
> >>>>> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> >>>>> ---
> >>>>>  drivers/gpu/drm/drm_drv.c | 23 +++++++++++++++++++++++
> >>>>>  include/drm/drm_drv.h     |  3 ++-
> >>>>>  2 files changed, 25 insertions(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> >>>>> index cd162d4..0fe5243 100644
> >>>>> --- a/drivers/gpu/drm/drm_drv.c
> >>>>> +++ b/drivers/gpu/drm/drm_drv.c
> >>>>> @@ -39,6 +39,7 @@
> >>>>>  #include <drm/drm_color_mgmt.h>
> >>>>>  #include <drm/drm_drv.h>
> >>>>>  #include <drm/drm_file.h>
> >>>>> +#include <drm/drm_irq.h>
> >>>>>  #include <drm/drm_managed.h>
> >>>>>  #include <drm/drm_mode_object.h>
> >>>>>  #include <drm/drm_print.h>
> >>>>> @@ -678,6 +679,28 @@ static int devm_drm_dev_init(struct device *pa=
rent,
> >>>>>  	return ret;
> >>>>>  }
> >>>>>  =

> >>>>> +static void devm_drm_dev_irq_uninstall(void *data)
> >>>>> +{
> >>>>> +	drm_irq_uninstall(data);
> >>>>> +}
> >>>>> +
> >>>>> +int devm_drm_irq_install(struct device *parent,
> >>>>> +			 struct drm_device *dev, int irq)
> >>>>> +{
> >>>>> +	int ret;
> >>>>> +
> >>>>> +	ret =3D drm_irq_install(dev, irq);
> >>>>> +	if (ret)
> >>>>> +		return ret;
> >>>>> +
> >>>>> +	ret =3D devm_add_action(parent, devm_drm_dev_irq_uninstall, dev);
> >>>>> +	if (ret)
> >>>>> +		devm_drm_dev_irq_uninstall(dev);
> >>>>> +
> >>>>> +	return ret;
> >>>>> +}
> >>>>> +EXPORT_SYMBOL(devm_drm_irq_install);
> >>>>> +
> >>>>
> >>>> Shouldn't we tie the IRQ to the drm device (so with drmm_add_action)
> >>>> instead of tying it to the underlying device?
> >>>
> >>> If the HW device goes away, there won't be any more interrupts. So it=
's
> >>> similar to devm_ functions for I/O memory. Why would you use the drmm_
> >>> interface?
> >>
> >> drm_irq_install/uninstall do more that just calling request_irq and
> >> free_irq though, they will also run (among other things) the irq-relat=
ed
> >> hooks in the drm driver (irq_preinstall, irq_postinstall irq_uninstall)
> >> and wake anything waiting for a vblank to occur, so we need the DRM
> >> device and driver to still be around when we run drm_irq_uninstall.
> >> That's why (I assume) you have to pass the drm_device as an argument a=
nd
> >> not simply the device.
> > =

> > drm_device is guaranteed to outlive devm_, plus the hooks are meant to
> > shut down hw. hw isn't around anymore when we do drmm_ cleanup, at least
> > not in full generality.
> > =

> >> This probably works in most case since you would allocate the drm_devi=
ce
> >> with devm_drm_dev_alloc, and then run drm_irq_install, so in the undoi=
ng
> >> phase you would have first drm_irq_uninstall to run, and everything is
> >> fine.
> >>
> >> However, if one doesn't use devm_drm_dev_alloc but would use
> >> devm_drm_irq_install, you would have first remove being called that
> >> would free the drm device, and then drm_irq_uninstall which will use a
> >> free'd pointer.
> > =

> > Don't do that, it's broken :-)
> =

> Umm, I just saw that hibmc doesn't use devm_drm_dev_alloc. So maybe we
> have to convert it first before using the managed irq function. OTOH
> converting it is a good idea in any case, so why not. :)

Yeah that doesn't work as-is.

I guess the second option would be if devm_drm_dev_irqinstall would take a
drm_dev_get() reference of its own. Not sure that's a good idea, but it
would make the thing a bit more flexible.
-Daniel

> =

> Best regards
> Thomas
> =

> > =

> >> So yeah, even though the interrupt line itself is tied to the device,
> >> all the logic we have around the interrupt that is dealt with in
> >> drm_irq_install is really tied to the drm_device. And since we tie the
> >> life of drm_device to its underlying device already (either implicitly
> >> through devm_drm_dev_alloc, or explictly through manual allocation in
> >> probe and free in remove) we can't end up in a situation where the
> >> drm_device outlives its device.
> > =

> > Most drivers get their drm_device lifetime completely wrong. That's why=
 I
> > typed drmm_ stuff. So this isn't a surprise at all, but it might motive=
ate
> > a bunch more people to fix this up correctly.
> > =

> > Also, these drm_irq functions are 100% optional helpers (should maybe
> > rename them to make this clearer) for modern drivers. They're only built
> > in for DRIVER_LEGACY, because hysterical raisins.
> > -Daniel
> > =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer






> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
