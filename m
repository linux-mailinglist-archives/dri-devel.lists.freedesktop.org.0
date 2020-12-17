Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8902DD00E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 12:08:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D61F6E24D;
	Thu, 17 Dec 2020 11:07:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0981B6E24D
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 11:07:56 +0000 (UTC)
Date: Thu, 17 Dec 2020 11:07:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1608203273;
 bh=dYQa9iZGZ1YqqdPAriugI33Sa1lc9vkDRMj5DrW+XpU=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=jEKy4FgwMj9SqXk8N+W8hzTqcdqkinI28HmfujfAXKGMeC2sUBMQvAVaFogNTrClN
 KM2wZD1e1c2hHQgi2LRXZYoxfc8x+nCVVFdVBbp+vs5I8q/WEkdk6B5m6VR5ksfHRP
 AZ8t4RaKDw9yA4DlSKABX1kg+gd9NRXb3Du+WZOvSaXjnIaYrB5c5F4nc2EEULz+uW
 4vCK2zPwDZDX8ghUvsJQbyNi1F7DaSW1k0OccenlnrisSgW/JDIJaoaVwcF+wf8THW
 1eS4sZNIrmKK8TNUg4TeOA0dRvsCqdItGnZ+/UURlm01xEP3jxYElG2f3CR4xt6jbe
 hHYvHC+cuXVzA==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 7/8] drm/doc: fix drm_plane_type docs
Message-ID: <UVB73W4L-xIbtb-vVoHuKhzQb-EcSv0_JxZS2hyWoPNfr1NLbWbxPqZbMlAtj73nnb0GsJUlkIxRMP6oXNQyvB1BInEXqgGjGDj2lY7uo6Q=@emersion.fr>
In-Reply-To: <CAKMK7uE=oNuyaACKD1H+e5BGyGi8UZYhhgSGF=cZaB60NWNuaA@mail.gmail.com>
References: <20201216202222.48146-1-contact@emersion.fr>
 <20201216202222.48146-8-contact@emersion.fr>
 <X9p51qbZ6il8DH5T@phenom.ffwll.local>
 <co84HmvozNSpZ7qlBqqkMdcpXRupOTigvbWZJvGIdtKH4Fr6GlF8-Np3s15jhMLSqL_cANTarQaL-6ixnVZTmGa7pSIfn2u86oaqEE3ww7U=@emersion.fr>
 <CAKMK7uE=oNuyaACKD1H+e5BGyGi8UZYhhgSGF=cZaB60NWNuaA@mail.gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, December 17th, 2020 at 11:50 AM, Daniel Vetter <daniel@ffwll.ch> wrote:

> > > > @@ -557,19 +561,20 @@ enum drm_plane_type {
> > > >     /**
> > > >      * @DRM_PLANE_TYPE_PRIMARY:
> > > >      *
> > > > -    * Primary planes represent a "main" plane for a CRTC.  Primary planes
> > > > -    * are the planes operated upon by CRTC modesetting and flipping
> > > > -    * operations described in the &drm_crtc_funcs.page_flip and
> > > > -    * &drm_crtc_funcs.set_config hooks.
> > >
> > > I think we should keep the notice which legacy entry hooks implicitly
> > > operate on the primary plane. Not sure why you're removing the above
> > > sentence. Maybe improve it by adding "See also &drm_crtc.primary." for
> > > more context?
> >
> > I intentionally removed it, because setting the plane type will not magically
> > make it used for legacy IOCTLs. The previous version documented the legacy
> > IOCTLs behaviour in the primary and cursor type docs. That was misleading
> > because only the drm_crtc.{primary,cursor} pointers make it so a plane is used
> > for legacy IOCTLs, not the type.
> >
> > This patch does keep a reference to drm_crtc.{primary,cursor}, in the paragraph
> > right above. Clicking on the reference will explain in detail which legacy
> > IOCTLs are affected. I don't think repeating the paragraph again in the primary
> > and cursor type docs is necessary.
>
> Hm I guess works too, I'm not sure documentations must avoid
> repetitions at all costs (since it generally makes stuff harder to
> find, despite all the links).

I didn't find the repetition necessary because the paragraph referencing
drm_crtc.{primary,cursor} is literally just a few lines of text away. But I
guess as long as it's clear that setting the type doesn't set
drm_crtc.{primary,cursor} I'm fine with duplicating the references.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
