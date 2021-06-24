Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA5D3B3049
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 15:41:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3B66EB95;
	Thu, 24 Jun 2021 13:41:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0D76EB94
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 13:41:49 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id u11so6691562wrw.11
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 06:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=FjNCqJKC4Y1RLns/XS8aAMxmVEkgXAOsPLe38vXYZw4=;
 b=StsOy8gcKSE6fgXgqNzcG4KKUFLz3Ej1CvQbaQbeBlcW77X5GmHwSCJ1cCCKmF3iUo
 xEIJavlnTHil2FXV+8lThyvYh+Yj4lwB3fWD16B2+UCnQ/TH3yYv7vpLwJp8h/YNn+VE
 ffZsBHLoxvfIyne6aOHuOPN1p97SpCRfrJoi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=FjNCqJKC4Y1RLns/XS8aAMxmVEkgXAOsPLe38vXYZw4=;
 b=AA/s55eR42kUDBvOlMQ2A4tuq/uG2eMCfvv0Kv6k4mnZtvfEHYDOpj3N++u0C1Q9Yb
 P00deVQfKo+8xe+/n+dEPxn2kgWLQVdh3SGdIaUdHUUSVtpiATwVrBdkzyTPJnjOkF9+
 AGRXncBBWldfQU3vGoP8Uhg6jO2tTgsE0FrUb4EPw6eNYJ9ta66WRnQ736qUI6q1bT34
 GC0q5qIzaHWasz8ciDSzu7mu3WtXbd8gacMIdfIoFYC4aGqGX6WFzkQs6RCAkpyIlZuL
 OZ2Z+3b+tV/qVjjB7Jk5YbJ2x93SH9Lkx1kg99qBHklDOAghZTlp1lH384oYoNxLTKIP
 aegw==
X-Gm-Message-State: AOAM532X/G1RlGrtjwm06NtLEnE4AXX1EUhOwKn/Ljj7DnVlRcie5P+b
 YWFdyb98T7khEf1ELxBHqDnsMw==
X-Google-Smtp-Source: ABdhPJzoh7guSpX+otzlPPnAeqEiddDQTsa2xWiA7Trp2QX6r0I8ZUPaW4riiTz9RCfRbaqeMTVx8Q==
X-Received: by 2002:a5d:5146:: with SMTP id u6mr4620731wrt.341.1624542108185; 
 Thu, 24 Jun 2021 06:41:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b7sm3317927wrw.20.2021.06.24.06.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 06:41:47 -0700 (PDT)
Date: Thu, 24 Jun 2021 15:41:45 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 14/15] drm/gem: Tiny kernel clarification for
 drm_gem_fence_array_add
Message-ID: <YNSLmQXuowJLP8Se@phenom.ffwll.local>
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
 <20210622165511.3169559-15-daniel.vetter@ffwll.ch>
 <4ed8f1d3-eb9c-74d6-d93f-ee28971af7f6@amd.com>
 <YNR9hSMVmzYmotF0@phenom.ffwll.local>
 <4fba7964-3306-4e2a-f87e-906ebedbe7fe@amd.com>
 <YNSJaizc5BpmTM8p@phenom.ffwll.local>
 <3800d89a-3591-daf5-6a9a-292f95c58619@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3800d89a-3591-daf5-6a9a-292f95c58619@amd.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 24, 2021 at 03:35:19PM +0200, Christian König wrote:
> Am 24.06.21 um 15:32 schrieb Daniel Vetter:
> > On Thu, Jun 24, 2021 at 02:48:54PM +0200, Christian König wrote:
> > > 
> > > Am 24.06.21 um 14:41 schrieb Daniel Vetter:
> > > > On Wed, Jun 23, 2021 at 10:42:50AM +0200, Christian König wrote:
> > > > > Am 22.06.21 um 18:55 schrieb Daniel Vetter:
> > > > > > Spotted while trying to convert panfrost to these.
> > > > > > 
> > > > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > > > Cc: "Christian König" <christian.koenig@amd.com>
> > > > > > Cc: Lucas Stach <l.stach@pengutronix.de>
> > > > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > > > > Cc: David Airlie <airlied@linux.ie>
> > > > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > > > ---
> > > > > >     drivers/gpu/drm/drm_gem.c | 3 +++
> > > > > >     1 file changed, 3 insertions(+)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > > > > > index ba2e64ed8b47..68deb1de8235 100644
> > > > > > --- a/drivers/gpu/drm/drm_gem.c
> > > > > > +++ b/drivers/gpu/drm/drm_gem.c
> > > > > > @@ -1302,6 +1302,9 @@ EXPORT_SYMBOL(drm_gem_unlock_reservations);
> > > > > >      * @fence_array: array of dma_fence * for the job to block on.
> > > > > >      * @fence: the dma_fence to add to the list of dependencies.
> > > > > >      *
> > > > > > + * This functions consumes the reference for @fence both on success and error
> > > > > > + * cases.
> > > > > > + *
> > > > > Oh, the later is a bit ugly I think. But good to know.
> > > > > 
> > > > > Reviewed-by: Christian König <christian.koenig@amd.com>
> > > > Merged to drm-misc-next, thanks for taking a look. Can you perhaps take a
> > > > look at the drm/armada patch too, then I think I have reviews/acks for all
> > > > of them?
> > > What are you talking about? I only see drm/armada patches for the irq stuff
> > > Thomas is working on.
> > There was one in this series, but Maxime was quicker. I'm going to apply
> > all the remaining ones now. After that I'll send out a patch set to add
> > some dependency tracking to drm_sched_job so that there's not so much
> > copypasta going on there. I stumbled over that when reviewing how we
> > handle dependencies.
> 
> Do you mean a common container for dma_fence objects a drm_sched_job depends
> on?

Yup. Well the real usefulness is the interfaces, so that you can just grep
for those when trying to figure out htf a driver handles its implicit
dependencies. And amdgpu is unfortunately going to be a bit in the cold
because it's special (but should be able to benefit too, just more than
1-2 patches to convert it over).

Anyway I'm going to type the cover letter rsn.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
