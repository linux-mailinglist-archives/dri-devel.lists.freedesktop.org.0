Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E259B9B5B
	for <lists+dri-devel@lfdr.de>; Sat,  2 Nov 2024 01:01:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BCDD10E218;
	Sat,  2 Nov 2024 00:01:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kuYzN4Re";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF3FA10E20E;
 Sat,  2 Nov 2024 00:01:14 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-20cceb8d8b4so15941715ad.1; 
 Fri, 01 Nov 2024 17:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730505674; x=1731110474; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tQlnDsBGBd5CAx+c3fZXd9BvBPvh5/l0g6m2gnycK5Y=;
 b=kuYzN4Re0MdiCWwlh1jIzah26UdcbPb6wEqjWEevh2TOydp6nyST7aDTGfrNsv2wNX
 g0tlhSfy61ZHU2ltxHafRVUqEs+E5jaw8XfF4y23AUvKle2HPEqx4+RXUG0u8gk+R/Jz
 XdcUBYXWRLnHW0tI3kIPkhv6DNNXWkcriPQkf+pHYI+egZtgOaJqxICvnW/PcAdUEDUN
 jwSYCuX0I5z9AdC4iCGMqfq/4l/RxJuYVLQk4yEN3oWG/AU7hmvV8H0wonjAIfC14QkO
 ePTaMqdK5JI5eTr5iFFJIUcN0HjiwT615Kq/cAFZ9TbxqGrDBHJISNWNk+ZuuMh97fgJ
 jhNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730505674; x=1731110474;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tQlnDsBGBd5CAx+c3fZXd9BvBPvh5/l0g6m2gnycK5Y=;
 b=uYPZshNX83DRp0R7ujwa4cJ4hJ5WhEqT8FWsxh2q9kB78GJc7UVDbss65iFn+R3t+3
 ulPqR0CwihyMwwcfjeP6FnA12N0OFVtiz0adyEz4Lc4tT3ZDFnsCmQ9rBmMFMWh9ZPcn
 0StZPenq6TkIBjGrxOBUcC+otUT9UFCPeeNtzD5HeafzQkK0h/SsTPHsNXRIK344AM+9
 xga03sj4qEoipwQgmFVxDKmqvziloALxUQ0kXjoR6y9+IFkEZANYO+/iie5+lHBIPVRC
 HkQExXlpCSC8AzbDViDWGORiP1IkkTvRZInHbj1bGunS0wOoC3c9WmW7hKYY01riOTQn
 JUiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLZQEKjI0F1el4n+AjsxGWlV4zVUnBg7L/vQalZOYfSDlSTR7kU7AG6FZAp9M/JSP/uJOCsHxoIG4=@lists.freedesktop.org,
 AJvYcCWb38BQTFoKJeX/N2DmU0kJGal4ujKDOineXgvhVcshsqw0lvIqVb2XrBsaGn95k7ROOL5kmvZevn4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4/b7mibTCoUJe2y1agWB/wZcNZ0VPaR4iQlV3kwdeSgPwfhV6
 8srAAlelhfmIiBHTNd3+Fg6o0R3E4OdPl30Nc33910wznA71+2HxNcUcVtOj9AuiIiNpNsGbVuX
 nWjjWqLFxabIxSh4Su3pW6Zx1oHs=
X-Google-Smtp-Source: AGHT+IEnrcAVcZXkp/niZpYU2l8IpIjNYvOacuB+pzIpPD3b46rCkHvlbrWia7qukikf0ww499n9eAGJYXsuaqXBQrE=
X-Received: by 2002:a17:903:2a8b:b0:20b:6c1e:1e13 with SMTP id
 d9443c01a7336-21119468f38mr80067875ad.23.1730505674296; Fri, 01 Nov 2024
 17:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <20241029084859.135172-1-gye976@gmail.com>
 <6um3enfackjotwj2ikhvpbnyq3ocro34b5iahx72yhzfxemjsn@xqnovtxzsapb>
In-Reply-To: <6um3enfackjotwj2ikhvpbnyq3ocro34b5iahx72yhzfxemjsn@xqnovtxzsapb>
From: gyeyoung <gye976@gmail.com>
Date: Sat, 2 Nov 2024 09:01:02 +0900
Message-ID: <CAKbEznuRLDwDhuYi3WwWR7GWbvu0oBCB53UF_4Yr+FpScYmWDA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/xe: Fix build error for XE_IOCTL_DBG macro
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> >--- a/drivers/gpu/drm/xe/xe_macros.h
> >+++ b/drivers/gpu/drm/xe/xe_macros.h
> >@@ -11,8 +11,12 @@
> > #define XE_WARN_ON WARN_ON
> >
> > #define XE_IOCTL_DBG(xe, cond) \
> >-      ((cond) && (drm_dbg(&(xe)->drm, \
> >-                          "Ioctl argument check failed at %s:%d: %s", \
> >-                          __FILE__, __LINE__, #cond), 1))
> >+({ \
> >+      if ((cond)) \
> >+              drm_dbg(&(xe)->drm, \
> >+                      "Ioctl argument check failed at %s:%d: %s", \
> >+                      __FILE__, __LINE__, #cond); \
> >+      (cond); \
>
> there's a double cond evaluation here and given any expression can be
> given to XE_IOCTL_DBG(), this doens't look very safe. I think this would
> be safer as:
>
> #define XE_IOCTL_DBG(xe, cond) ({                                       \
>          int cond__ = !!(cond);                                          \
>          if (cond__)                                                     \
>                  drm_dbg(&(xe)->drm,                                     \
>                          "Ioctl argument check failed at %s:%d: %s",     \
>                          __FILE__, __LINE__, #cond);                     \
>          cond__;                                                         \
> })
>
> as it then evaluates cond just once. Also the generated code seems to be
> sane compared to what we had before too.
>

Yes, if (cond) has operator like ++, it will be a bug. I miss that...
I will revise a patch again by referring to your review, thanks.

> And I also needed this to build-test:
>
> | diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> | index 08cfea04e22bd..82585d442f017 100644
> | --- a/drivers/gpu/drm/drm_print.c
> | +++ b/drivers/gpu/drm/drm_print.c
> | @@ -215,9 +215,8 @@ void __drm_printfn_dbg(struct drm_printer *p, struct va_format *vaf)
> |  {
> |         const struct drm_device *drm = p->arg;
> |         const struct device *dev = drm ? drm->dev : NULL;
> | -       enum drm_debug_category category = p->category;
> |
> | -       if (!__drm_debug_enabled(category))
> | +       if (!__drm_debug_enabled(p->category))
> |                 return;
> |
> |         __drm_dev_vprintk(dev, KERN_DEBUG, p->origin, p->prefix, vaf);
>
> as otherwise it complains category is unused.
>

I also submitted a seperate patch to fix '__drm_debug_enabled' macro,
from '#define __drm_debug_enabled(category)  true'
to     '#define __drm_debug_enabled(category)  ({ void(category);  true; })'
This removes the build error caused by the unused 'category', too.

Anyway, it can be build. I tested both cases.
I realize now that these two patches should have been submitted as a
patch series
I'm sorry for my mistakes.

Thanks,
Gyeyoung Baek

> Lucas De Marchi
