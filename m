Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8569F519ACF
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 10:53:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E5210FB81;
	Wed,  4 May 2022 08:53:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F6F810FB81
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 08:53:16 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id y3so1534487ejo.12
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 01:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=FWeYiYf0DMm7V+g21Cbm+9C9Pn1oqo14ZQ670Fj9soM=;
 b=H3LWFD2SKqhgrKGammVqLPu1+tsxAB77OiaspD7wNyK6giB6LGiCB0egmuFelRz0xd
 Wwr8iW5bq7rM304cdd3tRii/BntL55bHQGs59Jj+dRjdM5XT8vOzIahu7OZtSg/9zgsA
 PYg9GxvGp61ZKK8xDG4sWyfqcA89Y++1uLPP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=FWeYiYf0DMm7V+g21Cbm+9C9Pn1oqo14ZQ670Fj9soM=;
 b=vAcqmF8chduO7LRNH9wU9hgnTB4J+S7c0tV2mkZ/rbgj3NK0Xi3jbEyDoXnCs4Zqim
 VrHtd5y79hUBIoDKFgCtf9XWGwZz3A4QGYKeZBKnbaAH4+HsF5wgTWiN0Pl4PLZaHt99
 xANTcj7QuqCOgWtVf/hchg9NVdHM2Bhxy3zw5ZbmNvEwL44cJHqVoLc0MIJLaq0SEM4o
 gNVkH9WoyB/Htar0fQyQ3+u63riPAhVthpQEV0lm3vM85kz3DgHgZ/BTjFgWzSFL5wpE
 RjlndjmcmyS6qBY6QRhZpx8vY07QwD75Z9jUAxXUK6lcRXIe+pnVzlVWC+jasKrxQh+K
 IRXg==
X-Gm-Message-State: AOAM530NMfKsSHWWhCNag6dPppDhl/Mha8sNmUXxQfKPsRdad7DksdCK
 Jc3CbdOzk/HlcCKnR38qFPivIA==
X-Google-Smtp-Source: ABdhPJynePYca4h8hGIO/ma6nS7rL//o7qYPz+d7uodB/VCGwalHggLOksWn/GzUnOuMimdixtbeHg==
X-Received: by 2002:a17:907:50a3:b0:6f3:a302:96aa with SMTP id
 fv35-20020a17090750a300b006f3a30296aamr18975623ejc.2.1651654395002; 
 Wed, 04 May 2022 01:53:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 gz21-20020a170907a05500b006f3ef214e3csm5502964ejc.162.2022.05.04.01.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 01:53:14 -0700 (PDT)
Date: Wed, 4 May 2022 10:53:12 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] drm/todo: Add entry for using kunit in the subsystem
Message-ID: <YnI++MYijJFqyStF@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <maxime@cerno.tech>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
References: <20220504080212.713275-1-javierm@redhat.com>
 <20220504081030.ky57nenipnif5r2e@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220504081030.ky57nenipnif5r2e@houat>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, linux-doc@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 04, 2022 at 10:10:30AM +0200, Maxime Ripard wrote:
> Hi,
> 
> On Wed, May 04, 2022 at 10:02:12AM +0200, Javier Martinez Canillas wrote:
> > The Kernel Unit Testing (KUnit) framework provides a common framework for
> > unit tests within the Linux kernel. Having a test suite would allow to
> > identify regressions earlier.
> > 
> > Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> > ---
> > 
> >  Documentation/gpu/todo.rst | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> > index 127e76ee0b2d..10bfb50908d1 100644
> > --- a/Documentation/gpu/todo.rst
> > +++ b/Documentation/gpu/todo.rst
> > @@ -603,6 +603,20 @@ Level: Advanced
> >  Better Testing
> >  ==============
> >  
> > +Add unit tests using the Kernel Unit Testing (KUnit) framework
> > +--------------------------------------------------------------
> > +
> > +The `KUnit <https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html>`_
> > +provides a common framework for unit tests within the Linux kernel. Having a
> > +test suite would allow to identify regressions earlier.
> > +
> > +A good candidate for the first unit tests are the format-conversion helpers in
> > +``drm_format_helper.c``.
> > +
> > +Contact: Javier Martinez Canillas <javierm@redhat.com>
> > +
> > +Level: Intermediate
> 
> Kunit is fairly easy to grasp if you have some knowledge of other unit
> testing frameworks already (pytest, cmocka, etc.)
> 
> Another good candidate would be to convert (some ?) selftests to kunit.
> I'm not sure the others, but at least test-drm_cmdline_parser should be
> fairly easy to convert.

All the drm selftest should be good candidates for conversion to kunit.

Either way patch is Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
