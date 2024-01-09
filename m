Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 721B28288FD
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 16:26:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2412010E45D;
	Tue,  9 Jan 2024 15:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9EBD10E45D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 15:26:09 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-2057f388b2dso632254fac.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 07:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1704813969; x=1705418769; darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LrLYI16OgzxKgYJ1jGYpx/Mfzuzfk7qGCLrN1GbNKCw=;
 b=bXnOCONF2LrAWdVz8y4WcvM7Ecg3pJ2zHXmD/70Zod2qTPVpHkh3hTXLrJ1u4IBLgG
 Ujgx0bOTyS6mKIxHksVWU5jj2Tl8R1+0E2R2YS+ZqxPZiDBCg8/z0Ds7KEGfo+dSlpXo
 ThjVz/w3A/ufl1wrtZIO4RnbAPVCyQWmcPq3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704813969; x=1705418769;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LrLYI16OgzxKgYJ1jGYpx/Mfzuzfk7qGCLrN1GbNKCw=;
 b=vbI6wE0JtA+39oM4eqpU0cG8QPW+3vzEWum0485wN+zaeBGB85ozj6PP5QWrFmpfx4
 EAQ/rUn6xiqdF8tl0QS+FhxV08OpFq132d5cI3cnCGEXX1uKBRitKMDYfHAPhipdekbR
 9WlwcWArWZubuSLiTvKyQoA5+PYPiyBV7Th0bCtacwNvVFS3WDVfsrWDWBs6Flyw8K8k
 GnepSPkvgjz5hTnji+m7AhUHSjFvYsPLFrAOlHQqQ4fq00Ft6R7haPUJ27aCj7TSMmqa
 jhYjIwOELnnrPP5ceYMIpucEYmCzdxblCYHy2qK7Re6SvYCqMl+/FjoDHTu5qpApA/B5
 JLCQ==
X-Gm-Message-State: AOJu0YzN/OwAUC7tGir9Whzflwhbsjv0feP09XeztVtDCDpDxfaQXA4Z
 9xm/c+ilpFd3lIqnjm3k6VddXcEdvHw/H3qClMe3esyi+Rb9Nj3nKtf18iof
X-Google-Smtp-Source: AGHT+IFmDDUKIijRu0PcUyrPxdiy93SWEgCYr7vhP/J/b/SeA02LnXFUq67GlFuakTKaGZysPkX7JwemNYknY/AAFpc=
X-Received: by 2002:a05:6870:e256:b0:206:16d9:e76d with SMTP id
 d22-20020a056870e25600b0020616d9e76dmr8562714oac.5.1704813968983; Tue, 09 Jan
 2024 07:26:08 -0800 (PST)
MIME-Version: 1.0
References: <20240106032957.1195-1-rdunlap@infradead.org>
 <944ca2e6-23d9-44a2-a58c-4380e9ee575f@suse.de>
 <dd917333-9ae8-4e76-991d-39b6229ba8ce@infradead.org>
 <ZZ1DIDjGlHP-tmAi@phenom.ffwll.local>
 <CAKMK7uFbjQ1apr3-XrnWTH=TwRqW_9TDZ-21QAwJtiNB5FZ8dA@mail.gmail.com>
 <10b6ec8a-8b58-43a0-a3f8-c6d354b71ee4@infradead.org>
In-Reply-To: <10b6ec8a-8b58-43a0-a3f8-c6d354b71ee4@infradead.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 9 Jan 2024 16:25:57 +0100
Message-ID: <CAKMK7uHwcXq+gSBx1RdJ84OVS0BheyDJp-c7byhR7EfJ0s+qQA@mail.gmail.com>
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

On Tue, 9 Jan 2024 at 16:23, Randy Dunlap <rdunlap@infradead.org> wrote:
>
>
>
> On 1/9/24 05:42, Daniel Vetter wrote:
> > On Tue, 9 Jan 2024 at 13:59, Daniel Vetter <daniel@ffwll.ch> wrote:
> >>
> >> On Mon, Jan 08, 2024 at 01:10:12PM -0800, Randy Dunlap wrote:
> >>> Hi Thomas,
> >>>
> >>> On 1/8/24 00:57, Thomas Zimmermann wrote:
> >>>> Hi,
> >>>>
> >>>> thanks for the fix.
> >>>>
> >>>> Am 06.01.24 um 04:29 schrieb Randy Dunlap:
> >>>>> Remove the @funcs entry from struct drm_vram_mm to quieten the kernel-doc
> >>>>> warning.
> >>>>>
> >>>>> Use the "define" kernel-doc keyword and an '\' line continuation
> >>>>> to fix another kernel-doc warning.
> >>>>>
> >>>>> drm_gem_vram_helper.h:129: warning: missing initial short description on line:
> >>>>>   * DRM_GEM_VRAM_PLANE_HELPER_FUNCS -
> >>>>> drm_gem_vram_helper.h:185: warning: Excess struct member 'funcs' description in 'drm_vram_mm'
> >>>>>
> >>>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> >>>>> Cc: David Airlie <airlied@gmail.com>
> >>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
> >>>>> Cc: dri-devel@lists.freedesktop.org
> >>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >>>>> Cc: Maxime Ripard <mripard@kernel.org>
> >>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >>>>> ---
> >>>>> v2: Add commit description
> >>>>>
> >>>>> base-commit: 610a9b8f49fbcf1100716370d3b5f6f884a2835a
> >>>>>
> >>>>>   include/drm/drm_gem_vram_helper.h |    3 +--
> >>>>>   1 file changed, 1 insertion(+), 2 deletions(-)
> >>>>>
> >>>>> diff -- a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
> >>>>> --- a/include/drm/drm_gem_vram_helper.h
> >>>>> +++ b/include/drm/drm_gem_vram_helper.h
> >>>>> @@ -126,7 +126,7 @@ drm_gem_vram_plane_helper_cleanup_fb(str
> >>>>>                        struct drm_plane_state *old_state);
> >>>>>     /**
> >>>>> - * DRM_GEM_VRAM_PLANE_HELPER_FUNCS -
> >>>>> + * define DRM_GEM_VRAM_PLANE_HELPER_FUNCS - \
> >>>>
> >>>> Did something change wrt. doc syntax? I think this used to work without warnings. About this 'define': we don't use is in another docs. Can we leave it out here or is this the new syntax?
> >>>>
> >>>
> >>> There are no doc syntax changes that I know of. This is not
> >>> new syntax. It has been around since 2014:
> >>>   cbb4d3e6510b ("scripts/kernel-doc: handle object-like macros")
> >>
> >> I had no idea this exists, thanks a lot for this TIL :-)
> >>
> >> I guess the issue here is that this exists, yay, but it's not documented
> >> with the other here:
> >>
> >> https://dri.freedesktop.org/docs/drm/doc-guide/kernel-doc.html#structure-union-and-enumeration-documentation
> >>
> >> I guess a patch to kernel-doc.rst would be great. Adding some kernel-doc
> >> folks.
> >
> > Ok I went ahead and typed that patch (just we don't waste effort),
> > just waiting for the sphinx build to finish to make sure it looks nice
> > before I send out the patch.
> > -Sima
>
> I sent one a few days ago:
>
> https://lore.kernel.org/lkml/20240107012400.32587-1-rdunlap@infradead.org/

Could you please also add documentation for function-like macros,
since that's also missing? With that acked-by: me.

Cheers!
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
