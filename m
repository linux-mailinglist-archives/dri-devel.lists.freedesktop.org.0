Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E743B2FFD
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 15:32:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B2D36EB86;
	Thu, 24 Jun 2021 13:32:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A976B6EB88
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 13:32:30 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 j11-20020a05600c1c0bb02901e23d4c0977so5636167wms.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 06:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=UFhiEJt504RTMqp8+hAmLUOvZwafHba6yxHF1LCXlIs=;
 b=NApO4BqpqZKbsAPF2q7911aiX0XFllNygyqDwm4IpfIkqxF/qWVA0VnvAuV0FxRdCF
 6K5D9Z3plpwX8SDdOqUsJjeJZz/Y5lFX8XUrxROI+89xMLhUqqlzSCrLAPF/HRLjBWE1
 T/Ci+swNVAFxxNMtP58pmAxZaM3O3xDFYRElo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=UFhiEJt504RTMqp8+hAmLUOvZwafHba6yxHF1LCXlIs=;
 b=CgQx1QKbW2l/Rg5GMY3Tum/PPf6vZ5T0xgWjVNL22rDeVXpuxMVuYhIXkhqJs7/jH0
 UtYLYP8bmooBiH0IGTaMAtbAlmmlUOQS2ZPrRY5tfPNt7ch8SxRqOQb1c99UuEth1gWf
 Otr2PfiyzFd4HUYL8VeGVFbnOwFOenO9r1MmCWrVcjvJwhoCO20HMhKJyFdufjarlSB7
 Mgn3Ee2H2VnE/EXR/j0W3wy7VDcWV2GleeY8wCZx1f+cRhZ0YH2gFYnWc3giSrK5n6Da
 5ToO5z7nq1zy+jB6fojGZwPRtFnWX6pJWXQ5q5nKe/4mTrIVgHYE8tGIBlHnhydcWKk4
 HLSA==
X-Gm-Message-State: AOAM533STBIHQPLb6tX5ORPRLJMgVXAZy6Xn48fBI64ApO/2NHasCu8A
 xuv6uiYAIYj6tlNPBSkdmWA7ww==
X-Google-Smtp-Source: ABdhPJymDBd9yUGzh0GWCdZP9XBIxJSPvo36dzctTaDRmiC9UV0XJC81gCId6b7YQmM7kwKhDQUcYA==
X-Received: by 2002:a7b:cb8d:: with SMTP id m13mr4353165wmi.8.1624541549303;
 Thu, 24 Jun 2021 06:32:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y4sm3225289wrw.71.2021.06.24.06.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 06:32:28 -0700 (PDT)
Date: Thu, 24 Jun 2021 15:32:26 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 14/15] drm/gem: Tiny kernel clarification for
 drm_gem_fence_array_add
Message-ID: <YNSJaizc5BpmTM8p@phenom.ffwll.local>
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
 <20210622165511.3169559-15-daniel.vetter@ffwll.ch>
 <4ed8f1d3-eb9c-74d6-d93f-ee28971af7f6@amd.com>
 <YNR9hSMVmzYmotF0@phenom.ffwll.local>
 <4fba7964-3306-4e2a-f87e-906ebedbe7fe@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4fba7964-3306-4e2a-f87e-906ebedbe7fe@amd.com>
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

On Thu, Jun 24, 2021 at 02:48:54PM +0200, Christian König wrote:
> 
> 
> Am 24.06.21 um 14:41 schrieb Daniel Vetter:
> > On Wed, Jun 23, 2021 at 10:42:50AM +0200, Christian König wrote:
> > > Am 22.06.21 um 18:55 schrieb Daniel Vetter:
> > > > Spotted while trying to convert panfrost to these.
> > > > 
> > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > Cc: "Christian König" <christian.koenig@amd.com>
> > > > Cc: Lucas Stach <l.stach@pengutronix.de>
> > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > > Cc: David Airlie <airlied@linux.ie>
> > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > ---
> > > >    drivers/gpu/drm/drm_gem.c | 3 +++
> > > >    1 file changed, 3 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > > > index ba2e64ed8b47..68deb1de8235 100644
> > > > --- a/drivers/gpu/drm/drm_gem.c
> > > > +++ b/drivers/gpu/drm/drm_gem.c
> > > > @@ -1302,6 +1302,9 @@ EXPORT_SYMBOL(drm_gem_unlock_reservations);
> > > >     * @fence_array: array of dma_fence * for the job to block on.
> > > >     * @fence: the dma_fence to add to the list of dependencies.
> > > >     *
> > > > + * This functions consumes the reference for @fence both on success and error
> > > > + * cases.
> > > > + *
> > > Oh, the later is a bit ugly I think. But good to know.
> > > 
> > > Reviewed-by: Christian König <christian.koenig@amd.com>
> > Merged to drm-misc-next, thanks for taking a look. Can you perhaps take a
> > look at the drm/armada patch too, then I think I have reviews/acks for all
> > of them?
> 
> What are you talking about? I only see drm/armada patches for the irq stuff
> Thomas is working on.

There was one in this series, but Maxime was quicker. I'm going to apply
all the remaining ones now. After that I'll send out a patch set to add
some dependency tracking to drm_sched_job so that there's not so much
copypasta going on there. I stumbled over that when reviewing how we
handle dependencies.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
