Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F31C3ABA91
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 19:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E336B6E94D;
	Thu, 17 Jun 2021 17:20:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2D0F6E94D
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 17:20:37 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 h21-20020a1ccc150000b02901d4d33c5ca0so2091059wmb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 10:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=J7yV/HNR6uZD5gzEK+dIMTGHHDQ2KF+YCo0SplrkfIo=;
 b=Rc/lVXaMcLcIndLwZaNYYbPgQqGaym5fMYjBCea6t7INn6FFMPqn3ucDC6hikuVxeu
 5v36ctkoH9a+usu7+3pr6KDNcNMCWjqLO8akUt4Q9c1pFcP34uQy56qcSzPARvseKY3k
 qLImMaqKmuTG+l2TDg4GguyqZzKD5+ab09a/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=J7yV/HNR6uZD5gzEK+dIMTGHHDQ2KF+YCo0SplrkfIo=;
 b=XAb8zPrnPFkB8Iv2lTcI4tkFYjg8gndhLiq3nmHAQUS8h31MUapPrysMGlzwA/vkXj
 dKn69CBf0hZyCkBrzuq419VW6Q0EoMzUBWZSMezfmz95Zp13xTd0A5jKQqTJeVAljmcv
 CDFdeOJmjTINGM0DzBAwrOvaLAl+e2lUYQ/atm+p2ozRa6HDuqEccHvBG3WNyVrrHT4b
 HVt1auQDIbkRCYCpk39yD7PSMroxSBAeFeMJF9EcWcwQDb/T9T/ICJIlB7yOBMEGjXZL
 nB9i6BX7jDIem68Ebw77Z1dFaDrhFJCIDHMvkZd1yeJXDym1sZZ4hPeA/VPh/aAX/TOx
 pAYQ==
X-Gm-Message-State: AOAM531KKGTzSwQGy0N2PHJT2ZOd2A1YMZn9CzfuSnv+o+1qdENhIiJL
 aYlVfYdZoBG0ZqiETBI2Cut5fQ==
X-Google-Smtp-Source: ABdhPJwktsd9B9fWM2zs+SLi5wu+oCEyAMp25mpmAcJqskS+T3ME4YsjxTjj8W24FnEvsUqn9RZv3Q==
X-Received: by 2002:a7b:c94a:: with SMTP id i10mr6408999wml.29.1623950436390; 
 Thu, 17 Jun 2021 10:20:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h9sm8415350wmm.33.2021.06.17.10.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 10:20:35 -0700 (PDT)
Date: Thu, 17 Jun 2021 19:20:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Auld <matthew.william.auld@gmail.com>
Subject: Re: [PATCH] drm/i915: allow DG1 autoprobe for CONFIG_BROKEN
Message-ID: <YMuEYsMqbOUW7A2T@phenom.ffwll.local>
References: <20210614092227.97421-1-matthew.auld@intel.com>
 <CAM0jSHPacC6S6u1eCgaDUd6UNNJV5UgqQSBzRbtNXSzw3mdLyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAM0jSHPacC6S6u1eCgaDUd6UNNJV5UgqQSBzRbtNXSzw3mdLyg@mail.gmail.com>
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 16, 2021 at 03:29:26PM +0100, Matthew Auld wrote:
> On Mon, 14 Jun 2021 at 10:22, Matthew Auld <matthew.auld@intel.com> wrote:
> >
> > Purely for CI so we can get some pre-merge results for DG1. This is
> > especially useful for cross driver TTM changes where CI can hopefully
> > catch regressions. This is similar to how we already handle the DG1
> > specific uAPI, which are also hidden behind CONFIG_BROKEN.
> >
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Dave Airlie <airlied@gmail.com>
> 
> Daniel, any objections to landing this?

I think stuffing this into topic/core-for-CI is fine, lets wait a bit more
until mesa and everything is ready with adding the pciids to an official
tree.

(Catching up on mails, apologies and all that).
-Daniel

> 
> > ---
> >  drivers/gpu/drm/i915/i915_pci.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> > index 83b500bb170c..78742157aaa3 100644
> > --- a/drivers/gpu/drm/i915/i915_pci.c
> > +++ b/drivers/gpu/drm/i915/i915_pci.c
> > @@ -1040,6 +1040,9 @@ static const struct pci_device_id pciidlist[] = {
> >         INTEL_RKL_IDS(&rkl_info),
> >         INTEL_ADLS_IDS(&adl_s_info),
> >         INTEL_ADLP_IDS(&adl_p_info),
> > +#if IS_ENABLED(CONFIG_DRM_I915_UNSTABLE_FAKE_LMEM)
> > +       INTEL_DG1_IDS(&dg1_info),
> > +#endif
> >         {0, 0, 0}
> >  };
> >  MODULE_DEVICE_TABLE(pci, pciidlist);
> > --
> > 2.26.3
> >

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
