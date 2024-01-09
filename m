Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7F2828741
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 14:42:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EA5110E0F3;
	Tue,  9 Jan 2024 13:42:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7432210E0F3
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 13:42:32 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-205dc844e5eso617051fac.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 05:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1704807751; x=1705412551; darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vmRcbAu5bKOJKOBtEpsAYRxyu5lKuff4W580bKuX76Y=;
 b=b012jRPTXmgSc3ql7ipC8O3P2Kp3sVs846GpukAtDe6E5232bmRpUWrQCm63fdjOAK
 3rftbOn4k9WtU45fVBxyGfV+YtIoA4e1YnDCd8ELXHr3W3aGCkZ9MVj043bQM7rK/jrC
 Y6qLKezeBFY4BvQhjpqROofAJrpeQ24XVgC+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704807751; x=1705412551;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vmRcbAu5bKOJKOBtEpsAYRxyu5lKuff4W580bKuX76Y=;
 b=bmqxRWjmpvNacPnb+2ZcQ89XMSEpSAXu50nsXbY43C7RTbW/ekO5V2x2LfgLkw/uG6
 1HoZwl3lXjCXc1lqloRgixudd/zjgrKsawZAvWTcIPtH80kKGrW0qKc9bxklNw4xmNQp
 6NFHFRbsfk7tFVNtDaaiUe5d9DGX/4yX+9+kPgLBDo8EeYKOE5N9MxI3SVNk+L1y0tZJ
 S+yYF0amcPuROvoh38a6TJBB7/zD8Gp1x7UASFfd2yT/xnHcEM61lLL6giwLnlIx84Os
 GsSw8e1XAitdcl1o3TbeurSRdprVXZ3pTlwDj7dbi2LhFvIdZD2PCeuPfghB13a03J23
 Ev6w==
X-Gm-Message-State: AOJu0YyMdT/HK2ZPLQXN7log2+WjeMR9DkE+OgWzjLf4adW5v9faSIy8
 j55P4IjsrjjbBajt/kSnHMM1zNveYKl0EC0eNlUiuLIAQ1JVYg==
X-Google-Smtp-Source: AGHT+IFUP7Cfqhxw9wfvOIGXAR+NbRfkhHdEOBJqOL2b8XiT5tH5BLiIWrHWRv+Rh+J6+REzezoK9bSt9V8ZQ2+zR0w=
X-Received: by 2002:a05:6871:7a1:b0:203:fc17:ebe3 with SMTP id
 o33-20020a05687107a100b00203fc17ebe3mr9182168oap.1.1704807751608; Tue, 09 Jan
 2024 05:42:31 -0800 (PST)
MIME-Version: 1.0
References: <20240106032957.1195-1-rdunlap@infradead.org>
 <944ca2e6-23d9-44a2-a58c-4380e9ee575f@suse.de>
 <dd917333-9ae8-4e76-991d-39b6229ba8ce@infradead.org>
 <ZZ1DIDjGlHP-tmAi@phenom.ffwll.local>
In-Reply-To: <ZZ1DIDjGlHP-tmAi@phenom.ffwll.local>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 9 Jan 2024 14:42:19 +0100
Message-ID: <CAKMK7uFbjQ1apr3-XrnWTH=TwRqW_9TDZ-21QAwJtiNB5FZ8dA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/vram-helper: fix kernel-doc warnings
To: Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 9 Jan 2024 at 13:59, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Jan 08, 2024 at 01:10:12PM -0800, Randy Dunlap wrote:
> > Hi Thomas,
> >
> > On 1/8/24 00:57, Thomas Zimmermann wrote:
> > > Hi,
> > >
> > > thanks for the fix.
> > >
> > > Am 06.01.24 um 04:29 schrieb Randy Dunlap:
> > >> Remove the @funcs entry from struct drm_vram_mm to quieten the kernel-doc
> > >> warning.
> > >>
> > >> Use the "define" kernel-doc keyword and an '\' line continuation
> > >> to fix another kernel-doc warning.
> > >>
> > >> drm_gem_vram_helper.h:129: warning: missing initial short description on line:
> > >>   * DRM_GEM_VRAM_PLANE_HELPER_FUNCS -
> > >> drm_gem_vram_helper.h:185: warning: Excess struct member 'funcs' description in 'drm_vram_mm'
> > >>
> > >> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > >> Cc: David Airlie <airlied@gmail.com>
> > >> Cc: Daniel Vetter <daniel@ffwll.ch>
> > >> Cc: dri-devel@lists.freedesktop.org
> > >> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > >> Cc: Maxime Ripard <mripard@kernel.org>
> > >> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > >> ---
> > >> v2: Add commit description
> > >>
> > >> base-commit: 610a9b8f49fbcf1100716370d3b5f6f884a2835a
> > >>
> > >>   include/drm/drm_gem_vram_helper.h |    3 +--
> > >>   1 file changed, 1 insertion(+), 2 deletions(-)
> > >>
> > >> diff -- a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
> > >> --- a/include/drm/drm_gem_vram_helper.h
> > >> +++ b/include/drm/drm_gem_vram_helper.h
> > >> @@ -126,7 +126,7 @@ drm_gem_vram_plane_helper_cleanup_fb(str
> > >>                        struct drm_plane_state *old_state);
> > >>     /**
> > >> - * DRM_GEM_VRAM_PLANE_HELPER_FUNCS -
> > >> + * define DRM_GEM_VRAM_PLANE_HELPER_FUNCS - \
> > >
> > > Did something change wrt. doc syntax? I think this used to work without warnings. About this 'define': we don't use is in another docs. Can we leave it out here or is this the new syntax?
> > >
> >
> > There are no doc syntax changes that I know of. This is not
> > new syntax. It has been around since 2014:
> >   cbb4d3e6510b ("scripts/kernel-doc: handle object-like macros")
>
> I had no idea this exists, thanks a lot for this TIL :-)
>
> I guess the issue here is that this exists, yay, but it's not documented
> with the other here:
>
> https://dri.freedesktop.org/docs/drm/doc-guide/kernel-doc.html#structure-union-and-enumeration-documentation
>
> I guess a patch to kernel-doc.rst would be great. Adding some kernel-doc
> folks.

Ok I went ahead and typed that patch (just we don't waste effort),
just waiting for the sphinx build to finish to make sure it looks nice
before I send out the patch.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
