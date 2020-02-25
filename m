Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9156D16ECEC
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 18:44:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3588C6EB65;
	Tue, 25 Feb 2020 17:44:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC6B6EB64
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 17:44:04 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id l5so11552035wrx.4
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 09:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PzvK6EDQquxDjvxYudkNLwfN8HySHKUIb3bNyy91jcw=;
 b=AbJS1+yX/SOdDXUsaoTsJg9grNZxTs+MNKagxElWMF96f8Cj9Y1ymNCD6NJEmylcLy
 AYJFxBn97EYyqiE5Tpxit+Eoa9hFCLsULCX00wLjOAy/psXowxOiVjifUOU4Uar6Jogz
 j4CJH1yhYuNipt5+LjkHgX8EWPWktF4ANFfno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PzvK6EDQquxDjvxYudkNLwfN8HySHKUIb3bNyy91jcw=;
 b=UD/K/J+rR2mq18D1lpGubKGwZqC8c0UoIdMLsjBFo4ur2JsoGf6HuJnS2NIgbPTzcJ
 1SRmxeMqjNWLQe38U9BHupdmsy2Otxh6QLIECF4f2Q59IcjiwaJNMbeJcdYlgY2u2P6J
 KnSxQuPzZLUOPeCyvDTE7aK3DYq3hdLMk1YUBinWu5mdz+8kcOZWwDmJJALdcH4cPWsK
 iQaVzZAsWq0lNxQ7ayItKl9mX3HG9DVGkjKBq6cG+Ri/U2n9plc0Aav0Gyg7D8+y+jER
 0b4NZgYWVxaWXKBEIzWA81NBLGbDS/5/acm9KOKO5ME7dYqipuVY0O4o8C6l8nKQfR5m
 6W2w==
X-Gm-Message-State: APjAAAXRiVbAkwdE/HLwKXbJDUccAFtsFv1QivrZZVpOajeZF/s4JA8F
 dfKYudCsQIae6H3IH8mSzYazew==
X-Google-Smtp-Source: APXvYqzMsMPYwbBdDmhH8RB9IS6E1fulWmap9jYTXKewjYg/u9Pbhqsggz4wzqzEaeFCklmUx99YKA==
X-Received: by 2002:adf:ed42:: with SMTP id u2mr253724wro.345.1582652643173;
 Tue, 25 Feb 2020 09:44:03 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z21sm4885590wml.5.2020.02.25.09.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 09:44:02 -0800 (PST)
Date: Tue, 25 Feb 2020 18:44:00 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/3] Add separate non-KMS state; constify struct drm_driver
Message-ID: <20200225174400.GP2363188@phenom.ffwll.local>
References: <20200225155902.9751-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200225155902.9751-1-tzimmermann@suse.de>
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
Cc: airlied@linux.ie, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, bskeggs@redhat.com, alexander.deucher@amd.com,
 sam@ravnborg.org, emil.velikov@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 25, 2020 at 04:58:59PM +0100, Thomas Zimmermann wrote:
> This patchset moves legacy, non-KMS driver state from struct drm_driver
> into struct drm_legacy_state. Only non-KMS drivers provide an instance
> of the latter structure. One special case is nouveau, which supports
> legacy interfaces. It also provides an instance of the legacy state if
> the legacy interfaces have been enabled (i.e., defines the config option
> CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT)
> 
> I reviewed all call sites of legacy state and functions to verify that
> DRIVER_LEGACY or DRIVER_KMS_LEGACY_CONTEXT is set on the device; or that
> DRIVER_MODESET is not set.
> 
> With the mutable KMS state removed, instances of struct drm_driver can
> be declared as constant. The patchset modifies the DRM core accordingly.
> Individual drivers can follow later on.

Bikeshed: We very much have modern non-KMS drivers (vgem, etnaviv, v3d,
panfrost, ...). non-KMS != legacy, which is what you're talking about
here.

Other thing, and it's a bit raining on your parade: I don't see the point.
Sprinkling a few more #ifdef CONFIG_DRM_LEGACY over the relevant parts
sounds like a reasonable idea. But this is a lot of churn for drivers
which are all pretty much dead, and just waiting for their eventual
removal. And from a compile-testing pov of making sure modern drivers
don't use any of the deprecated stuff wrapping it in CONFIG_DRM_LEGACY
should be plenty enough.

And from a "make stuff const" I think Laurent's much more minimal series
also gets us there for all the drivers we care about.
-Daniel

> 
> Thomas Zimmermann (3):
>   drm: Add separate state structure for legacy, non-KMS drivers
>   drm: Move non-kms driver state into struct drm_legacy_state
>   drm: Constify struct drm_driver in DRM core
> 
>  drivers/gpu/drm/drm_bufs.c            | 10 +++++-----
>  drivers/gpu/drm/drm_context.c         |  9 +++++----
>  drivers/gpu/drm/drm_drv.c             | 12 ++++++++----
>  drivers/gpu/drm/drm_file.c            |  4 ++--
>  drivers/gpu/drm/drm_legacy_misc.c     |  6 +++---
>  drivers/gpu/drm/drm_lock.c            |  7 ++++---
>  drivers/gpu/drm/drm_pci.c             | 16 ++++++++++------
>  drivers/gpu/drm/drm_vblank.c          | 11 ++++++-----
>  drivers/gpu/drm/i810/i810_drv.c       | 10 +++++++---
>  drivers/gpu/drm/mga/mga_drv.c         | 16 ++++++++++------
>  drivers/gpu/drm/nouveau/nouveau_drm.c |  8 ++++++++
>  drivers/gpu/drm/r128/r128_drv.c       | 16 ++++++++++------
>  drivers/gpu/drm/savage/savage_drv.c   | 12 ++++++++----
>  drivers/gpu/drm/sis/sis_drv.c         |  8 ++++++--
>  drivers/gpu/drm/tdfx/tdfx_drv.c       |  6 +++++-
>  drivers/gpu/drm/via/via_drv.c         | 16 ++++++++++------
>  include/drm/drm_device.h              |  2 +-
>  include/drm/drm_drv.h                 | 21 +++++----------------
>  include/drm/drm_legacy.h              | 27 +++++++++++++++++++++++----
>  include/drm/drm_pci.h                 |  4 ++--
>  20 files changed, 138 insertions(+), 83 deletions(-)
> 
> --
> 2.25.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
