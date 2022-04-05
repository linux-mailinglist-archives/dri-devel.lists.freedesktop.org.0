Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C18A54F291D
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 10:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A9310EAD3;
	Tue,  5 Apr 2022 08:40:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6692610EAD3
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 08:40:41 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id g22so14044803edz.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 01:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=QRQdW4TxY/XkOYOT3oxLG3OIsaxqVCqvMm2visUSAZI=;
 b=R5WyFM3Hb3GT2s4H08DzUIMQiUCuX9Lg5BSB6FtLOqpb9+K0R/+NXBIvm5gKP5c9J3
 9uKEocy6gvBxFpFp3qCT0vApX1ZAxWoy2UjfBaiGsZGlxJO8MBrCopzDmKf7hLQSHfEx
 1t/1TiVB/Zv+FY3jh4d8cFdSJTjj852yReO4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=QRQdW4TxY/XkOYOT3oxLG3OIsaxqVCqvMm2visUSAZI=;
 b=4MIfhDE7cSZ+c7a7KTzz6M+AYgoStoGXMoyxbyKN1F10rx9tBMZAyso2pz3D9DL5RQ
 6ZoS0WzuL7kPAv787kM2LFu9Q3m1UmKs7pCjmKynnbSTr123ODzPhqvRGGzoDDqLGWbK
 NRLFlEo5UChEEu0hXvblDc01W9SBTMdHPAl53ze+t9jqaxg4bhK86AD/v6w/imLztJZU
 t607MQfrauhZ4sOSqNlWk6YBXNtCphrVY3h3lNsDA06TYmVxreZG7oJdtMr4mRmXpnRR
 4UZaYEuF/N/vZcxcjiB9x5tFqN1Ty0YWn/qsIopDZCjuAERRxB3E8qAMcwkEPYZfMjb9
 aCKA==
X-Gm-Message-State: AOAM532QPkDsH2UVYjobONQyEowHje6iIKX/DBO5rP1J/F7C0kwr0KuV
 GK1Ggr49HEMDC+qHOPz/U2ZH/g==
X-Google-Smtp-Source: ABdhPJxdMNTJdlht0ASSjqOZpmGfUZPUZ3aVJQxSpEJt0tJUibhrkRySvqoqStIMLvI+YtZTojtm1Q==
X-Received: by 2002:a05:6402:31e2:b0:41c:dd5e:3c61 with SMTP id
 dy2-20020a05640231e200b0041cdd5e3c61mr2342747edb.407.1649148039950; 
 Tue, 05 Apr 2022 01:40:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 d7-20020a170906174700b006e80a7e3111sm568499eje.17.2022.04.05.01.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 01:40:39 -0700 (PDT)
Date: Tue, 5 Apr 2022 10:40:37 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-fbdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Zack Rusin <zackr@vmware.com>, Hans de Goede <hdegoede@redhat.com>,
 Ilya Trukhanov <lahvuun@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Peter Jones <pjones@redhat.com>
Subject: Re: [PATCH v2 18/19] Revert "fbdev: Prevent probing generic drivers
 if a FB is already registered"
Message-ID: <YkwAhSt9HlbxcuZo@phenom.ffwll.local>
Mail-Followup-To: Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-fbdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Zack Rusin <zackr@vmware.com>, Hans de Goede <hdegoede@redhat.com>,
 Ilya Trukhanov <lahvuun@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Peter Jones <pjones@redhat.com>
References: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
 <20220208210824.2238981-19-daniel.vetter@ffwll.ch>
 <4ae20b63-f452-fdb4-ced6-d4968a8d69f0@redhat.com>
 <Ykv/k/WoVemoCJJA@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ykv/k/WoVemoCJJA@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Tue, Apr 05, 2022 at 10:36:35AM +0200, Daniel Vetter wrote:
> On Wed, Feb 09, 2022 at 01:19:26AM +0100, Javier Martinez Canillas wrote:
> > On 2/8/22 22:08, Daniel Vetter wrote:
> > > This reverts commit fb561bf9abde49f7e00fdbf9ed2ccf2d86cac8ee.
> > > 
> > > With
> > > 
> > > commit 27599aacbaefcbf2af7b06b0029459bbf682000d
> > > Author: Thomas Zimmermann <tzimmermann@suse.de>
> > > Date:   Tue Jan 25 10:12:18 2022 +0100
> > > 
> > >     fbdev: Hot-unplug firmware fb devices on forced removal
> > > 
> > > this should be fixed properly and we can remove this somewhat hackish
> > > check here (e.g. this won't catch drm drivers if fbdev emulation isn't
> > > enabled).
> > >
> > 
> > Unfortunately this hack can't be reverted yet. Thomas' patch solves the issue
> > of platform devices matched with fbdev drivers to be properly unregistered if
> > a DRM driver attempts to remove all the conflicting framebuffers.
> > 
> > But the problem that fb561bf9abde ("fbdev: Prevent probing generic drivers if
> > a FB is already registered") worked around is different. It happens when the
> > DRM driver is probed before the {efi,simple}fb and other fbdev drivers, the
> > kicking out of conflicting framebuffers already happened and these drivers
> > will be allowed to probe even when a DRM driver is already present.
> > 
> > We need a clearer way to prevent it, but can't revert fb561bf9abde until that.
> 
> Yeah that entire area is a mess still, ideally we'd have something else
> creating the platform devices, and efifb/offb and all these would just
> bind against them.
> 
> Hm one idea that just crossed my mind: Could we have a flag in fb_info for
> fw drivers, and check this in framebuffer_register? Then at least all the
> logic would be in the fbdev core.

Ok coffee just kicked in, how exactly does your scenario work?

This code I'm reverting here is in the platform_dev->probe function.
Thomas' patch removes the platform_dev. How exactly can you still probe
against a platform dev if that platform dev is gone?

Iow, now that I reponder your case after a few weeks I'm no longer sure
things work like you claim.

There is the issue that offb still bidns without a platform_dev, but
that's not affected by this patch here.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
