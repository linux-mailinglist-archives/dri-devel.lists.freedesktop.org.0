Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6A93D3C5D
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 17:23:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B936F43E;
	Fri, 23 Jul 2021 15:23:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 503566F43E
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 15:23:23 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id r2so2816198wrl.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 08:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=VpD6pBpuIHkxy1hH2QDgXSeXKJgN811ge6cKz/eevh8=;
 b=ia6NdzfXPkb9IiHoHZzpTRtoWu2xUftCOAginiO6qKMddK3ZUnSobx3m4IJXfhqYZW
 8xT5CdNA9mt6zcu1EutCvhFGozYYPio0BuAX1DqfGwq3HC95h+FjoJTxYCuaZGDyEQ7h
 upzVl/RQp0BQ7Eb+s7tnf5zRfBp+oWiUU1j5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=VpD6pBpuIHkxy1hH2QDgXSeXKJgN811ge6cKz/eevh8=;
 b=I7CZ76qGZqtidkeRI73GEeMM0xihwIj9slvWxAjKmjwFgO4m5SChpkYh4J+cca/hCg
 FVHHdsCb6CE2kpwHBzCSSX0qiwLA4gBlaXvPYnhhAbzoYBLVrdXRCtj5Ow49VX5cKteh
 4YH1pRS3oc3+atYb2pJMuaes+mYikCeO8aDS9qXqA8LUCi3nN2p3DTR/Pkd+ElCd+x+s
 hApV3OgPO1XMF6N5oHZytD4tZv72d4OdBbmJgz7syGrb3nvPHEJMIT8UjNi9mW+XRoaA
 RmRSlN59nQhsKAXfsn5FcjGsmJ3+C4dZDdplfDSW5Up5pnt1DoH77zz/nDihWl+eMPY4
 gjjw==
X-Gm-Message-State: AOAM5318Pws0d96FL540PZZ/cwcv9Y8/hKUDIIqTRCRaL+Tbzp4tZs57
 7WYq02+M03AozryZvtZaRDu6kA==
X-Google-Smtp-Source: ABdhPJxWjpKj9xIb+Pq3LUjDM/QHddsL70N5mpK2d8rkq2dS+LUwjZ9DqSk3/vwkpEz8h0zdiMQdtQ==
X-Received: by 2002:adf:edd1:: with SMTP id v17mr5736357wro.276.1627053801948; 
 Fri, 23 Jul 2021 08:23:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r19sm35170770wrr.32.2021.07.23.08.23.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 08:23:21 -0700 (PDT)
Date: Fri, 23 Jul 2021 17:23:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] drm/nouveau/kms/nv50-: fix build failure with
 CONFIG_BACKLIGHT=n
Message-ID: <YPre51p6TirescUu@phenom.ffwll.local>
Mail-Followup-To: Arnd Bergmann <arnd@kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Lyude Paul <lyude@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Nikola Cornij <nikola.cornij@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210723091534.1730564-1-arnd@kernel.org>
 <CAKMK7uHG0T7kgHzrkxoGj+Cv1-5f=GaH1CviunoZd_wEL5G4YQ@mail.gmail.com>
 <CAK8P3a3xjS-zJFiQgjYDz2Gja4KBeHWyrQX4PrbkkZfEV2OJgg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a3xjS-zJFiQgjYDz2Gja4KBeHWyrQX4PrbkkZfEV2OJgg@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nikola Cornij <nikola.cornij@amd.com>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 12:16:31PM +0200, Arnd Bergmann wrote:
> On Fri, Jul 23, 2021 at 11:25 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Fri, Jul 23, 2021 at 11:15 AM Arnd Bergmann <arnd@kernel.org> wrote:
> > >
> > > From: Arnd Bergmann <arnd@arndb.de>
> > >
> > > When the backlight support is disabled, the driver fails to build:
> > >
> > > drivers/gpu/drm/nouveau/dispnv50/disp.c: In function 'nv50_sor_atomic_disable':
> > > drivers/gpu/drm/nouveau/dispnv50/disp.c:1665:59: error: 'struct nouveau_connector' has no member named 'backlight'
> > >  1665 |         struct nouveau_backlight *backlight = nv_connector->backlight;
> > >       |                                                           ^~
> > > drivers/gpu/drm/nouveau/dispnv50/disp.c:1670:35: error: invalid use of undefined type 'struct nouveau_backlight'
> > >  1670 |         if (backlight && backlight->uses_dpcd) {
> > >       |                                   ^~
> > > drivers/gpu/drm/nouveau/dispnv50/disp.c:1671:64: error: invalid use of undefined type 'struct nouveau_backlight'
> > >  1671 |                 ret = drm_edp_backlight_disable(aux, &backlight->edp_info);
> > >       |                                                                ^~
> > >
> > > The patch that introduced the problem already contains some #ifdef
> > > checks, so just add another one that makes it build again.
> > >
> > > Fixes: 6eca310e8924 ("drm/nouveau/kms/nv50-: Add basic DPCD backlight support for nouveau")
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >
> > Can we just toss the idea that BACKTLIGHT=n is a reasonable config for
> > drm drivers using backlights, and add depends BACKLIGHT to all of
> > them?
> >
> > I mean this is a perfect source of continued patch streams to keep us
> > all busy, but beyond that I really don't see the point ... I frankly
> > have better things to do, and especially with the big drivers we have
> > making backlight optional saves comparitively nothing.
> > -Daniel
> 
> Yes! I'd definitely be in favor of that, I've wasted way too much time trying
> to sort through dependency loops and other problems with backlight support.
> 
> Maybe we should leave the drivers/video/fbdev/ drivers untouched in this
> regard, at least for the moment, but for the drivers/gpu/drm users of
> backlight that would be a nice simplification, and even the smallest ones
> are unlikely to be used on systems that are too memory constrained to
> deal with 4KB extra .text.

Yeah I think we can do this entirely ad-hoc, i.e. any time the backlight
wheel wobbles off again we nail it down for good for that driver with a
depends on BACKGLIGHT and remove any lingering #ifdef all over.

If you want maybe start out with the biggest drm drivers in a series, I
think if nouveau/amdgpu/i915 folks ack this you're good to go to just
convert as things get in the way.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
