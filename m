Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9470436549F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 10:53:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B623989D84;
	Tue, 20 Apr 2021 08:53:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC62089D84
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 08:53:34 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id l4so57040494ejc.10
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 01:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=vfvESN/gBp6lSDsc53ylG47pXzs7CkRT+8vTU5ER8fE=;
 b=UVt3Jj+giddEw1gXzvvJgW7GH2rByotrzjsklb3TMUhTakV6N9PIyk8XwIMDRXdCwe
 4bT8kJ8t3ClZYZLyYZxAIvAdGx1RObZlIeHOj5LMS5ydh3mipINJjX0euIENiUBv3Nsx
 onodR7A4PMIZJ/Xdaq3xHvVKK+z3BcrI3sg+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=vfvESN/gBp6lSDsc53ylG47pXzs7CkRT+8vTU5ER8fE=;
 b=fhZHI/YFvZvc8BK6efFy5NxE6iDuhES8+k+HvfnZFz3QwAPgvyerBTwHH7b9UP+gDA
 aTdp/CwY0IT6c7ISxs4ATR0vaXjfq8XWeW6vDc0yPqKFY05+rMeGUmMzuwPlc0WJEEmo
 qBYRCByLcRf8pQk71WrCwEpXU3ieqdhuCtNzf5O9FQJjVsA7AbSehsHNWfTmNaFjywJl
 e+LSSIH+gU8CFD/q8Dq1NCUSp6+4oRlCAatmv3sYW6Pm9H13CC54FG5yhPEqN6vf2B50
 q+Ggc64WZzhiloThriHiI23Lyxpd+wZtW8WYqU32leUzWkpbhgYC8cQhPp4L5tcf+DaF
 V/mw==
X-Gm-Message-State: AOAM533WjN3z1FN7GlPJ0M8DAVTHerVDNlnegPhCxl+C9l1wI1EGB1iN
 IFwI2hs2ssfSVZhQ8+IAOtZYIw==
X-Google-Smtp-Source: ABdhPJyATYz5gFThajrn+vAZ03jRTZbYI/wOtEqW7s6k/cmJat7HnnMVoyPrPmMo5dE9s+QZv34IjQ==
X-Received: by 2002:a17:907:c0b:: with SMTP id
 ga11mr25987809ejc.545.1618908813188; 
 Tue, 20 Apr 2021 01:53:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id lj21sm11937012ejb.74.2021.04.20.01.53.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 01:53:32 -0700 (PDT)
Date: Tue, 20 Apr 2021 10:53:30 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 27/40] drm/ttm/ttm_device: Demote kernel-doc abuses
Message-ID: <YH6Wiuy/Vw1Et4Kn@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
 Huang Rui <ray.huang@amd.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-28-lee.jones@linaro.org>
 <e5d30ac1-3037-0101-0e1a-9df6a8580c70@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e5d30ac1-3037-0101-0e1a-9df6a8580c70@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 16, 2021 at 05:32:52PM +0200, Christian K=F6nig wrote:
> Am 16.04.21 um 16:37 schrieb Lee Jones:
> > Fixes the following W=3D1 kernel build warning(s):
> > =

> >   drivers/gpu/drm/ttm/ttm_device.c:42: warning: Function parameter or m=
ember 'ttm_global_mutex' not described in 'DEFINE_MUTEX'
> >   drivers/gpu/drm/ttm/ttm_device.c:42: warning: expecting prototype for=
 ttm_global_mutex(). Prototype was for DEFINE_MUTEX() instead
> >   drivers/gpu/drm/ttm/ttm_device.c:112: warning: Function parameter or =
member 'ctx' not described in 'ttm_global_swapout'
> >   drivers/gpu/drm/ttm/ttm_device.c:112: warning: Function parameter or =
member 'gfp_flags' not described in 'ttm_global_swapout'
> >   drivers/gpu/drm/ttm/ttm_device.c:112: warning: expecting prototype fo=
r A buffer object shrink method that tries to swap out the first(). Prototy=
pe was for ttm_global_swapout() instead
> > =

> > Cc: Christian Koenig <christian.koenig@amd.com>
> > Cc: Huang Rui <ray.huang@amd.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> =

> Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>

Can you pls also land all the patches you reviewed from Lee into
drm-misc-next? Just so they wont' get lost. Will all head in for 5.14.
-Daniel
> =

> > ---
> >   drivers/gpu/drm/ttm/ttm_device.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm=
_device.c
> > index 9b787b3caeb50..a8bec8358350d 100644
> > --- a/drivers/gpu/drm/ttm/ttm_device.c
> > +++ b/drivers/gpu/drm/ttm/ttm_device.c
> > @@ -36,7 +36,7 @@
> >   #include "ttm_module.h"
> > -/**
> > +/*
> >    * ttm_global_mutex - protecting the global state
> >    */
> >   DEFINE_MUTEX(ttm_global_mutex);
> > @@ -104,7 +104,7 @@ static int ttm_global_init(void)
> >   	return ret;
> >   }
> > -/**
> > +/*
> >    * A buffer object shrink method that tries to swap out the first
> >    * buffer object on the global::swap_lru list.
> >    */
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
