Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD59A3D518
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 10:46:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C6C10E4B7;
	Thu, 20 Feb 2025 09:46:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="X4Noble0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F8710E4B9
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 09:45:58 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-38dd9b3419cso382624f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 01:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1740044757; x=1740649557; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j/QbdcI7C6XxVE5jz6sKFGZdf665BDupYKEBKSwxSEs=;
 b=X4Noble0GS90b+QuH2pGjLISpTs1qZFVg9+Ex3gqZEWvXgZKOK9iy6o3cKUhOD8IMZ
 p1YqODujjEu+2WXBzg01ph/M0+90mWcmorVUy26G12LMSNoQDwWVK1WEFSKzu37qZ0mA
 +u6pTMJShMecQdrYjkFvHeULxwjmxl6zz15fQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740044757; x=1740649557;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j/QbdcI7C6XxVE5jz6sKFGZdf665BDupYKEBKSwxSEs=;
 b=b6Tjcgd6G7vJSqEMw66EieiObEJs0K2j+NzuiZX+GQzSGSY3OxpvtKVb/2jcyEkZhc
 V+Z+HSJVuoflzr+R7HOfYXZfbPQYtNgj1RJEgQUqwhqz+aZWEh03OVfdlu1ERa3WP4tD
 6siD54u4m8cz9GU60vtF2LplWGOkZiF0ZwU567D8qYxcv+yRGjB2nDK+mMkGAkggzyto
 CyvfNc2dJP96k1JU8+GK8JQAOuG/4IfQxs2hWupIrST7E4z8XWjDyTwpuyP49XESrC+a
 wsVVpbFJlErRJs7g/blzimf0Bq4nlFE5dyg4BU6oq4QyzY1RIelqo4SFoQpKXhyqAJ58
 k5YA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnRyd2+J6dMMGiLmUkc0fEsUrBCZHL9/mnPvS5sADzXJAY/sk2RWUJt8UAYE1pDo7DYA9dm95V2XA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxziIlPD6597wZa4gj1J+eUlr3DXYswJ8zcfkbnQttqUYxwmoZY
 6mrU1NXApCcYF2e6N45fUzQCvtSvWVYU7jzjS33Ph5rLBfFf5jdxyGF6WS49bD4=
X-Gm-Gg: ASbGncsUfimjQkNRIxnjsGpoB6FT/vhKjgO/VNO4LKFRdj9Tqslci/d3mVeMTocjbay
 R+vV0t12ROek2RQMC9SuvLa1BtYogDTnlA0RvTbpdPrCt7Nw5iTZb7XE48zukkdiBpzOMbpDZ6v
 hW2p8z2do5r2MouBMxlvf+X3DnBxWsqo5M9y/5SC0gjiYSHXbJVTGVP5gTUsm19FYmye9B/1rYH
 4i0MlxGg5TAhu74eE8R4MN7iZtKr/YO4gJoF+Xa5VdXxjRWLo2q7/kAidi4voxzfZj3hAhWxsFo
 nt2OiWRc7hMXkfcDLxU+afBqrK0=
X-Google-Smtp-Source: AGHT+IGpuAwEB4NAeWO90X12ML8FmH1WxKE/6GeffuYce5PPhHcnTL5xNEF5aXBpLAm2OEdPIQ/h0w==
X-Received: by 2002:a05:6000:1948:b0:38f:218c:f672 with SMTP id
 ffacd0b85a97d-38f65145d52mr1206188f8f.41.1740044757301; 
 Thu, 20 Feb 2025 01:45:57 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258b434fsm20419757f8f.16.2025.02.20.01.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 01:45:56 -0800 (PST)
Date: Thu, 20 Feb 2025 10:45:54 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Jim Cromie <jim.cromie@gmail.com>, linux-kernel@vger.kernel.org,
 jbaron@akamai.com, ukaszb@chromium.org,
 intel-gfx-trybot@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com
Subject: Re: [PATCH 00/63] Fix CONFIG_DRM_USE_DYNAMIC_DEBUG=y
Message-ID: <Z7b50rGRA4RuybgC@phenom.ffwll.local>
Mail-Followup-To: Greg KH <gregkh@linuxfoundation.org>,
 Jim Cromie <jim.cromie@gmail.com>, linux-kernel@vger.kernel.org,
 jbaron@akamai.com, ukaszb@chromium.org,
 intel-gfx-trybot@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com
References: <20250125064619.8305-1-jim.cromie@gmail.com>
 <2025022012-viscous-cringing-bf88@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025022012-viscous-cringing-bf88@gregkh>
X-Operating-System: Linux phenom 6.12.11-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 20, 2025 at 09:31:41AM +0100, Greg KH wrote:
> On Fri, Jan 24, 2025 at 11:45:14PM -0700, Jim Cromie wrote:
> > This series fixes dynamic-debug's support for DRM debug-categories.
> > Classmaps-v1 evaded full review, and got committed in 2 chunks:
> > 
> >   b7b4eebdba7b..6ea3bf466ac6	# core dyndbg changes
> >   0406faf25fb1..ee7d633f2dfb	# drm adoption
> > 
> > DRM-CI found a regression during init with drm.debug=<initval>; the
> > static-keys under the drm-dbgs in drm.ko got enabled, but those in
> > drivers & helpers did not.
> > 
> > Root Problem:
> > 
> > DECLARE_DYNDBG_CLASSMAP violated a K&R rule "define once, refer
> > afterwards".  Replace it with DYNDBG_CLASSMAP_DEFINE (invoked once in
> > drm-core) and DYNDBG_CLASSMAP_USE (invoked repeatedly, in drivers &
> > helpers).
> > 
> > _DEFINE exports the classmap it creates (in drm.ko), other modules
> > _USE the classmap.  The _USE adds a record ref'g the _DEFINEd (&
> > exported) classmap, in a 2nd __dyndbg_class_users section.
> > 
> > So now at modprobe, dyndbg scans the new section after the 1st
> > __dyndbg_class_maps section, follows the linkage to the _DEFINEr
> > module, finds the (optional) kernel-param controlling the classmap,
> > examines its drm.debug=<initval>, and applies it to the module being
> > initialized.
> > 
> > To recapitulate the multi-module problem wo DRM involvement, Add:
> > 
> > A. tools/testing/selftests/dynamic_debug/*
> > 
> > This alters pr_debugs in the test-modules, counts the results and
> > checks them against expectations.  It uses this formula to test most
> > of the control grammar, including the new class keyword.
> > 
> > B. test_dynamic_debug_submod.ko
> > 
> > This alters the test-module to build both parent & _submod ko's, with
> > _DEFINE and _USE inside #if/#else blocks.  This recap's DRM's 2 module
> > failure scenario, allowing A to exersize several cases.
> > 
> > The #if/#else puts the 2 macro uses together for clarity, and gives
> > the 2 modules identical sets of debugs.
> > 
> > Recent DRM-CI tests are here:
> >   https://patchwork.freedesktop.org/series/139147/
> > 
> > Previous rev:
> >   https://lore.kernel.org/lkml/20240716185806.1572048-1-jim.cromie@gmail.com/
> > 
> > Noteworthy Additions:
> > 
> > 1- drop class "protection" special case, per JBaron's preference.
> >    only current use is marked BROKEN so nobody to affect.
> >    now framed as policy-choice:
> >    #define ddebug_client_module_protects_classes() false
> >    subsystems wanting protection can change this.
> > 
> > 2- compile-time arg-tests in DYNDBG_CLASSMAP_DEFINE
> >    implement several required constraints, and fail obviously.
> > 
> > 3- modprobe time check of conflicting class-id reservations
> >    only affects 2+classmaps users.
> >    compile-time solution not apparent.
> > 
> > 4- dyndbg can now cause modprobe to fail.
> >    needed to catch 3.
> >    maybe some loose ends here on failure.
> > 
> > 5- refactor & rename ddebug_attach_*module_classes
> >    reduce repetetive boilerplate on 2 types: maps, users.
> >    rework mostly brought forward in patchset to reduce churn
> >    TBD: maybe squash more.
> > 
> > Several recent trybot submissions (against drm-tip) have been passing
> > CI.BAT, and failing one or few CI.IGT tests randomly; re-tests do not
> > reliably repeat the failures.
> > 
> > its also at github.com:jimc/linux.git
> >   dd-fix-9[st]-ontip  &  dd-fix-9-13
> > 
> > Ive been running it on my desktop w/o issues.
> > 
> > The drivers/gpu/drm patches are RFC, I think there might be a single
> > place to call DRM_CLASSMAP_USE(drm_dedbug_classes) to replace the
> > sprinkling of _USEs in drivers and helpers.  IIRC, I tried adding a
> > _DEFINE into drm_drv.c, that didn't do it, so I punted for now.
> > 
> > I think the dyndbg core additions are ready for review and merging
> > into a (next-next) test/integration tree.
> 
> So whose tree should this go through?

I'm trying to get some drm folks to review/test this, but thus far not
much success :-/ I think it's good stuff, but I'm somewhat hesitant if no
one else agrees that it's useful for CI or in-field crash-recording or
whatever ...

I guess worst case we can land it and hope it attracts more folks?

Wrt tree I don't care, but I guess we should then also land the drm side
too.
-Sima

> And I think the last patch in this series isn't correct, it looks like a
> 000 email somehow.
> 
> thanks,
> 
> greg k-h

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
