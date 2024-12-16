Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B7A9F3360
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 15:41:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 707AD10E6AD;
	Mon, 16 Dec 2024 14:41:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="eNQog1+v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CB1210E6AD
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 14:41:34 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3862d6d5765so2922211f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 06:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1734360093; x=1734964893; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=h4e0o/EChopge9iHDGlCcrGi54fhpHon4WXwZ2Or538=;
 b=eNQog1+v7JQYmfA2ENxQSW9Y8UqnFYL+AEznt14TwClwIE3HFttpKfLQla3jRocDmI
 ZFjKLLwoCWO5MpemfOvH3DE3Mut+aQTWs1a9xtXXRJp4pgg/YrObjdWBLzN1/vbYsm43
 VLTLinAMAJ75XiWyC/IdTKFBfxBlTUuDcKZ3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734360093; x=1734964893;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h4e0o/EChopge9iHDGlCcrGi54fhpHon4WXwZ2Or538=;
 b=TsfUUhBRXVvEKyutSXLZ3RBfPOsQxyhiIucd0Cin4UzQ3ZWyybQ8yYJB+/Dmyocu6R
 PKl7Sz6lvfjxXhyXnfh2X8UsH2VDMniyS9gnlVfaD/+zsY80B/acTR2YFvPqHTYiKNFC
 JwBZLo8KIObvVrTdrQItxLhes7wMMptf9wctKUGi1S72W303LLKldtPzl4YJK5+CykcP
 sH3/hbu1Z7xyeY3dbmektiIWiyaVyhfsJRP7Wj+vxbdtmR9XaugjMWhcFOx/14CWo/ES
 bOSy7NMNNr3U2bAb51YoyQE6pUsvKkS9ecY7Dvi0uJj6NfDtLiSknDk7rTbuhWMLA46N
 goBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLe90kdKQiPPpzf9J4dobLNPdWKeLrCvKcOYoIc7EB6AYhZKM6BjgUNfY0MWrISMbJU15jt+5UPfY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6W9M5cyNjLfmI6iDKI0w2VjJ7Jg4ZaAfUA6rzQ2HHtY0TztHk
 KcOLeRC/+1aQmLcpoMoGUMlgdjcJs+zF+eWa6Oj0FM3vRZhPwrmzYLXgAHKGMZU=
X-Gm-Gg: ASbGnctO/mf7zV8FOXRkt+bmMYeDbjUbpLfXM5fnX1GzfeEC6ITyYrqQuMXDUxHTw9p
 Wh8T7VGLwLp28dofFxYcy0hS6p2sYDEiGkDYMRnr9RvRf77ZGBkOx51XDeL0g2vTEMZSFg2zPGS
 2WYImSPUxOjkXuZxBUWJoVdzxi0WwUWJr7EuY9vy+BAwxSFLzeWWagcjNIuDNMUn4n+apwT6USE
 vdrnmy7kWCgrP5q+8apvxqGiA8nQsFbodV8KjEe/Rotl7+scBjP/Bd3W3wRkFt6M8/b
X-Google-Smtp-Source: AGHT+IHNuXaQbcaOzWDlJLVdH2VVVV7M1p7IawdDEoc0b+Y3XGEWD6gvsewijzhv1O9NvZ73cJsOkA==
X-Received: by 2002:a05:6000:1544:b0:385:f47a:e9d1 with SMTP id
 ffacd0b85a97d-38880ac7641mr8437760f8f.17.1734360092860; 
 Mon, 16 Dec 2024 06:41:32 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c8016c0bsm8410974f8f.42.2024.12.16.06.41.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 06:41:32 -0800 (PST)
Date: Mon, 16 Dec 2024 15:41:30 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Helge Deller <deller@gmx.de>, Jani Nikula <jani.nikula@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Simona Vetter <simona@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 1/3] fbdev: Fix recursive dependencies wrt
 BACKLIGHT_CLASS_DEVICE
Message-ID: <Z2A8Guea5d7cZoBj@phenom.ffwll.local>
References: <20241212100636.45875-1-tzimmermann@suse.de>
 <20241212100636.45875-2-tzimmermann@suse.de>
 <09edb59a-527a-4ddb-bfaf-ea74fb5a3023@gmx.de>
 <88ce6863-4458-47cb-9b28-274c91bd8764@app.fastmail.com>
 <87frmstrhd.fsf@intel.com>
 <2701e824-d330-49c0-88fa-a26658a9710c@gmx.de>
 <5566a3f5-496a-4b39-a0fa-6a1a5af9a67a@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5566a3f5-496a-4b39-a0fa-6a1a5af9a67a@suse.de>
X-Operating-System: Linux phenom 6.12.3-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 13, 2024 at 08:26:19AM +0100, Thomas Zimmermann wrote:
> Hi
> 
> 
> Am 13.12.24 um 00:56 schrieb Helge Deller:
> > On 12/13/24 00:24, Jani Nikula wrote:
> > > On Thu, 12 Dec 2024, "Arnd Bergmann" <arnd@arndb.de> wrote:
> > > > On Thu, Dec 12, 2024, at 19:44, Helge Deller wrote:
> > > > > On 12/12/24 11:04, Thomas Zimmermann wrote:
> > > > > > Do not select BACKLIGHT_CLASS_DEVICE from FB_BACKLIGHT. The latter
> > > > > > only controls backlight support within fbdev core code and data
> > > > > > structures.
> > > > > > 
> > > > > > Make fbdev drivers depend on BACKLIGHT_CLASS_DEVICE and let users
> > > > > > select it explicitly. Fixes warnings about recursive dependencies,
> > > > > > such as [...]
> > > > > 
> > > > > I think in the fbdev drivers themselves you should do:
> > > > >     select BACKLIGHT_CLASS_DEVICE
> > > > > instead of "depending" on it.
> > > > > This is the way as it's done in the DRM tiny and the
> > > > > i915/gma500 DRM drivers.
> > > > > 
> > > > > So, something like:
> > > > > 
> > > > > --- a/drivers/staging/fbtft/Kconfig
> > > > >          tristate "Support for small TFT LCD display modules"
> > > > >          depends on FB && SPI
> > > > >          depends on FB_DEVICE
> > > > >     +    select BACKLIGHT_DEVICE_CLASS
> > > > >          depends on GPIOLIB || COMPILE_TEST
> > > > >          select FB_BACKLIGHT
> > > > > 
> > > > > config FB_BACKLIGHT
> > > > >             tristate
> > > > >             depends on FB
> > > > >     -      select BACKLIGHT_CLASS_DEVICE
> > > > >     +       depends on BACKLIGHT_CLASS_DEVICE
> > > > > 
> > > > > 
> > > > > Would that fix the dependency warning?
> > > > 
> > > > The above is generally a mistake and the root cause of the
> > > > dependency loops. With very few exceptions, the solution in
> > > > these cases is to find the inconsistent 'select' and change
> > > > it into 'depends on'.
> > > 
> > > Agreed.
> > 
> > That's fine, but my point is that it should be consistent.
> > For example:
> > 
> > ~:/git-kernel/linux$ grep -r "select.*BACKLIGHT_CLASS_DEVICE"
> > drivers/gpu/
> > drivers/gpu/drm/tilcdc/Kconfig: select BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/nouveau/Kconfig:        select BACKLIGHT_CLASS_DEVICE if
> > DRM_NOUVEAU_BACKLIGHT
> > drivers/gpu/drm/nouveau/Kconfig:        select BACKLIGHT_CLASS_DEVICE if
> > ACPI && X86
> > drivers/gpu/drm/tiny/Kconfig:   select BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/tiny/Kconfig:   select BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/tiny/Kconfig:   select BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/tiny/Kconfig:   select BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/tiny/Kconfig:   select BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/tiny/Kconfig:   select BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/tiny/Kconfig:   select BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/fsl-dcu/Kconfig:        select BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/i915/Kconfig:   select BACKLIGHT_CLASS_DEVICE if ACPI
> > drivers/gpu/drm/gma500/Kconfig: select BACKLIGHT_CLASS_DEVICE if ACPI
> > drivers/gpu/drm/amd/amdgpu/Kconfig:     select BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/xe/Kconfig:     select BACKLIGHT_CLASS_DEVICE if ACPI
> > drivers/gpu/drm/solomon/Kconfig:        select BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/radeon/Kconfig: select BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/renesas/shmobile/Kconfig:       select
> > BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/gud/Kconfig:    select BACKLIGHT_CLASS_DEVICE
> > drivers/gpu/drm/bridge/Kconfig: select BACKLIGHT_CLASS_DEVICE
> > 
> > All major drm graphics drivers *select* BACKLIGHT_CLASS_DEVICE.
> > Are you changing them to "depend on" as well?
> 
> All these drivers should be changed to either 'depends on' or maybe 'imply'.

Yeah, select on non-leaf/library function Kconfig symbols tends to be a
complete pain. There's some push to use select so it's easier for people
to enable complex drivers, but I honestly don't think it's worth it.
menuconfig can give you a list of things you need to enable first, so it's
all discoverable enough (but a bit painful to get them all if it's a
really complex driver with lots of dependencies).

tldr; I concur fully, please no more select but instead less.
-Sima

> 
> Best regards
> Thomas
> 
> > 
> > Helge
> 
> -- 
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
