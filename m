Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA8D82C03C
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 13:59:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA14410EB08;
	Fri, 12 Jan 2024 12:59:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B4410EB08
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 12:59:03 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a2bea904e72so78099866b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 04:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1705064341; x=1705669141; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q/IzbCUttBySDW4UF+/3Rn+hm1gmEpaoc8lHsutNmx8=;
 b=hC4H6XZs2L0X0bcBCQip0IVqqP6Yy92XJLdxddDgINP/5NXEC7jtq9hsM4/bJuV/r0
 2WxFiFg4UB7J5ucOUV/dfk6Q9SB2iKVEmCOIc3X2gd7o0BOkavTp/tipAI2XBtflldxz
 r95s2WLBLPNgEy2usHhq38BZFhDKmlLz2P69k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705064341; x=1705669141;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q/IzbCUttBySDW4UF+/3Rn+hm1gmEpaoc8lHsutNmx8=;
 b=gGG3lwyUjJaKLi/lBVy3dhBp5KHzPC2G+rNzkDGd2v1RbV30XtDX2r1DetEOonaLgl
 TFrT3NBM18V+hv9bAr+m5ZE8vUqXP1HNZvISuyJGSG1fM65pptg50+SY0aX8izSf5rCF
 iYqp+i6KoRu0HEwTMKyhOeegVkF0etcJz1EHIVFxEzEaDqrUAPYl6/GbH5hiYc1+12vs
 KRjkW8r9YLOZyBCu4aS9nIfZTB0RMfV5hcvd0bbLPJtdlpzb9zm7qCZfzv/jCSbg/lX3
 YOack+VsFb2VlUjN0WCMYXYSCyzJpZxYEe91g3cDpfTKNqz05TCkd55wQJ5VEOjb8V0h
 /9eg==
X-Gm-Message-State: AOJu0Yww1tWgkcjPQUNPNuOfGmJJ/S/h6hmrBas8sLfjY22kjI6DiVfj
 ciIGO5C7FhMsQ8O9JdQYLZoPiRCrPF49Wg==
X-Google-Smtp-Source: AGHT+IEfYaqUTOGYXCnanYoymnssMQ6JQhm90dq0lyVwhDnSY+yy0Tw5ugD8WF4joaSuBa55ngsAoA==
X-Received: by 2002:a17:906:5859:b0:a28:6639:ba53 with SMTP id
 h25-20020a170906585900b00a286639ba53mr1417632ejs.6.1705064341418; 
 Fri, 12 Jan 2024 04:59:01 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 tg14-20020a1709078dce00b00a2cb117050fsm806326ejc.126.2024.01.12.04.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 04:59:01 -0800 (PST)
Date: Fri, 12 Jan 2024 13:58:59 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] drm/doc: internals: remove section on PCI legacy support
Message-ID: <ZaE3k1042oCQdft0@phenom.ffwll.local>
Mail-Followup-To: Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20240112051731.15722-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240112051731.15722-1-rdunlap@infradead.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 11, 2024 at 09:17:31PM -0800, Randy Dunlap wrote:
> The functions that were described in this section of
> drm-internals.rst were removed in NOV-2023, along with all of the
> kernel-doc comments in the source file. This now causes a
> docs build warning, so remove that section of the documentation also.
> 
> drivers/gpu/drm/drm_pci.c:1: warning: no structured comments found
> 
> Fixes: 2504c7ec728b ("drm: Remove source code for non-KMS drivers")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org

Applied to drm-misc-next, thanks!
-Sima

> ---
>  Documentation/gpu/drm-internals.rst |   12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff -- a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-internals.rst
> --- a/Documentation/gpu/drm-internals.rst
> +++ b/Documentation/gpu/drm-internals.rst
> @@ -153,18 +153,6 @@ Managed Resources
>  .. kernel-doc:: include/drm/drm_managed.h
>     :internal:
>  
> -Bus-specific Device Registration and PCI Support
> -------------------------------------------------
> -
> -A number of functions are provided to help with device registration. The
> -functions deal with PCI and platform devices respectively and are only
> -provided for historical reasons. These are all deprecated and shouldn't
> -be used in new drivers. Besides that there's a few helpers for pci
> -drivers.
> -
> -.. kernel-doc:: drivers/gpu/drm/drm_pci.c
> -   :export:
> -
>  Open/Close, File Operations and IOCTLs
>  ======================================
>  

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
