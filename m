Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC9A828673
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 13:59:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2290A10E3FE;
	Tue,  9 Jan 2024 12:59:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8D410E3FE
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 12:59:17 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a28a8ca437dso49953366b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 04:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1704805155; x=1705409955; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ajGb4247KZo9KXfE9A+LGftI6qScHSAY4EbVlCZxC6s=;
 b=D4g0nfReACLKtybNfMmxCvXrjTs2w9wkkoE8rsEZ/S0uEAScKRZxgoUJMkhT+rIDey
 jkcBEChQhd9CDgBnXEzgbyvw7tiUD3tj391M3IEHPsTIybwJk4zM3nug3vbzU8vi9Wk3
 ceSSmYZ7YjAAjCcwTJm2XMG9v3HP75rQhgnP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704805155; x=1705409955;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ajGb4247KZo9KXfE9A+LGftI6qScHSAY4EbVlCZxC6s=;
 b=F7+fKSiSi+GSkP2T9kND8nnT5of2LtrPMcXlnhONQ4as6IXMpMaGTSQb9CRb7y03Pg
 rt2eNfqHAlpSLkCOFErR1yQBnZ2KORVrTlSvq4m2uAtzo7Ea3GG7iHR54uGvo8PFbNuS
 QlCLpzVbDoceZQQi+W0kOcPLKd0/aaMRtq7sXGQi8NcxfCDd9KccZJcK8xoFZZ9lIqLD
 eVm+xA4A2Bda/plBoG71qgnyutb0OJ3V35NZOZH8wHL8wQU3M8w2gkZGtnOwtdZ+Mkbv
 zkfIBQEKatCAn3swSZb809rBp4XsCLB5YL8L4XOBEihJJbr7wh4SZzEoPwXKbl6gl4RJ
 SDCw==
X-Gm-Message-State: AOJu0Yw+2U69loHu39O8Ori4h9xyQRZf0RvPANFIiNsaKde7NOKW60Qn
 WzeAbM1w6L+Iw01TD7M3wVEChp1a2jQX/Q==
X-Google-Smtp-Source: AGHT+IEiNvJtidM6AfcfTl6aPABFX/Lddd3jmaxaqV9/ccBNBWaa06ww2Vw6qpTZsv2fGb9xghRo+Q==
X-Received: by 2002:a17:906:6c86:b0:a2b:1e1a:ac4c with SMTP id
 s6-20020a1709066c8600b00a2b1e1aac4cmr1481053ejr.6.1704805155545; 
 Tue, 09 Jan 2024 04:59:15 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 la8-20020a170906ad8800b00a2af8872e9bsm1042408ejb.14.2024.01.09.04.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 04:59:14 -0800 (PST)
Date: Tue, 9 Jan 2024 13:59:12 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2] drm/vram-helper: fix kernel-doc warnings
Message-ID: <ZZ1DIDjGlHP-tmAi@phenom.ffwll.local>
Mail-Followup-To: Randy Dunlap <rdunlap@infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>
References: <20240106032957.1195-1-rdunlap@infradead.org>
 <944ca2e6-23d9-44a2-a58c-4380e9ee575f@suse.de>
 <dd917333-9ae8-4e76-991d-39b6229ba8ce@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dd917333-9ae8-4e76-991d-39b6229ba8ce@infradead.org>
X-Operating-System: Linux phenom 6.5.0-4-amd64 
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 08, 2024 at 01:10:12PM -0800, Randy Dunlap wrote:
> Hi Thomas,
> 
> On 1/8/24 00:57, Thomas Zimmermann wrote:
> > Hi,
> > 
> > thanks for the fix.
> > 
> > Am 06.01.24 um 04:29 schrieb Randy Dunlap:
> >> Remove the @funcs entry from struct drm_vram_mm to quieten the kernel-doc
> >> warning.
> >>
> >> Use the "define" kernel-doc keyword and an '\' line continuation
> >> to fix another kernel-doc warning.
> >>
> >> drm_gem_vram_helper.h:129: warning: missing initial short description on line:
> >>   * DRM_GEM_VRAM_PLANE_HELPER_FUNCS -
> >> drm_gem_vram_helper.h:185: warning: Excess struct member 'funcs' description in 'drm_vram_mm'
> >>
> >> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> >> Cc: David Airlie <airlied@gmail.com>
> >> Cc: Daniel Vetter <daniel@ffwll.ch>
> >> Cc: dri-devel@lists.freedesktop.org
> >> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >> Cc: Maxime Ripard <mripard@kernel.org>
> >> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >> ---
> >> v2: Add commit description
> >>
> >> base-commit: 610a9b8f49fbcf1100716370d3b5f6f884a2835a
> >>
> >>   include/drm/drm_gem_vram_helper.h |    3 +--
> >>   1 file changed, 1 insertion(+), 2 deletions(-)
> >>
> >> diff -- a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
> >> --- a/include/drm/drm_gem_vram_helper.h
> >> +++ b/include/drm/drm_gem_vram_helper.h
> >> @@ -126,7 +126,7 @@ drm_gem_vram_plane_helper_cleanup_fb(str
> >>                        struct drm_plane_state *old_state);
> >>     /**
> >> - * DRM_GEM_VRAM_PLANE_HELPER_FUNCS -
> >> + * define DRM_GEM_VRAM_PLANE_HELPER_FUNCS - \
> > 
> > Did something change wrt. doc syntax? I think this used to work without warnings. About this 'define': we don't use is in another docs. Can we leave it out here or is this the new syntax?
> > 
> 
> There are no doc syntax changes that I know of. This is not
> new syntax. It has been around since 2014:
>   cbb4d3e6510b ("scripts/kernel-doc: handle object-like macros")

I had no idea this exists, thanks a lot for this TIL :-)

I guess the issue here is that this exists, yay, but it's not documented
with the other here:

https://dri.freedesktop.org/docs/drm/doc-guide/kernel-doc.html#structure-union-and-enumeration-documentation

I guess a patch to kernel-doc.rst would be great. Adding some kernel-doc
folks.

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
