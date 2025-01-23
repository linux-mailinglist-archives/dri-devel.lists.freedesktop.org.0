Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E37A1A43E
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 13:30:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3490B10E28B;
	Thu, 23 Jan 2025 12:30:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Y3j8UHDC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17EBC10E28B
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 12:29:59 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43635796b48so5819615e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 04:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1737635397; x=1738240197; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1Iysso47toCPdE6r3sVjrZQkPchlFoXG6ItweiTyE4Q=;
 b=Y3j8UHDCxrcDEKglIGjQ9+2p8uTvzq4YtM/YdQKEWXgalNuwY/rI+ZbCj5tMBoF7/s
 PP/5h7K3FvZmCogdgxrYkKM2etPp5rRZNRvRug7i1G4MEi/eRRLFs/DcHphp0/o62wUg
 j/LpaOnnaDk1VCwpQ1VMnMIgS/SX6BV/O4qPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737635397; x=1738240197;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Iysso47toCPdE6r3sVjrZQkPchlFoXG6ItweiTyE4Q=;
 b=t8ejPMxJuF5miSegerlaJVUF87ev2GxImpf2qXkgndG3Z/tkSGq8w/EAWHL6BQY/y+
 piqHyT77uxbTnjWI7NkwrjX3pI1g9InWuBU0E3/wyhQQ3clHEbUJA/QTyrVUaDYyFRgm
 j9eMe1YvzrPvF1Omqws1XO1DKWXjmWl03fsRWxaLC1pHf6WrMKAd1hLyqagf3lzbgq20
 3TVUMW3cofftzNKiKnL+6vU0UOysAPPdeiZs6uGBw8tBI4s8XUHSVeGKygGWOTTjJgBh
 pdmvYHNZXade5+tiXMNypQpLkKFkIyJczRF5tj09tC9kPnzhaWCdmTgL9fk8QwgH7pd6
 lTAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNsr+dKYU7iGyeIUjiJIktB9wRIEGakVA0ll1HYOoZ4me+4y2AwTPo7PAp3lOUpi5ku/DzoXOjDdk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJr1JGmLfZ7Fl/+kSXwJv96zgnAqPisRaA++n8gEVh0KeHLg6G
 Awq72jeTxlvO3QgVWEwpp7rSjzFIv6i/+VUic5aiDtCevO/vTl3j2en/4QSd6Mfu6iKsNdUV5gT
 U
X-Gm-Gg: ASbGncs5eIZvfAKQgyJD1VjreL7Mh++CLCWOOB0YCIH4iylbq1LqZd4yjuoFF6jGfPH
 Koh2FoB+aSWo7aI5VJ8AL7dwpWUKGHFRAFAUHRW+pHbP0J+/qexIdlnWRnyJfAOlrGoCV8qHEjS
 9bqjfC0CI4k9HWL708tzb2bqgfoNb4zU8nys1mwfsTHMD+GfC/Ai3t/bJDQ5dYvhOTxgVXKs2lC
 M1m6cEqw+nsRdzgPpsBZhABDU15tTxd0/NBZEKRhXCzmpR7ZDZ8uiYUlMTpZ/Nv4Ii5Wtqb2+v0
 p8nrbi6NV1y+/xcuMe+pZpDgY4Q=
X-Google-Smtp-Source: AGHT+IHUXUscEju419RkmGTHJqXC2kzMjzRX4ZqwJPgIsLqtck4nQHnwLBeW4aON6OpQ6h3mr8qg/w==
X-Received: by 2002:a05:600c:3546:b0:434:fc5d:179c with SMTP id
 5b1f17b1804b1-438b885f8ebmr29341205e9.13.1737635397286; 
 Thu, 23 Jan 2025 04:29:57 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438b318a38bsm63275435e9.6.2025.01.23.04.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 04:29:56 -0800 (PST)
Date: Thu, 23 Jan 2025 13:29:53 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/print: Include drm_device.h
Message-ID: <Z5I2QW6Wv_yg7Iac@phenom.ffwll.local>
References: <20250121210935.84357-1-gustavo.sousa@intel.com>
 <Z5DSeQjrUKym5Dzb@phenom.ffwll.local>
 <173755097154.5500.15568058785162208000@intel.com>
 <87jzanndzc.fsf@intel.com>
 <173755624141.5500.13245593483082552961@intel.com>
 <87h65qoqdq.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h65qoqdq.fsf@intel.com>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Wed, Jan 22, 2025 at 04:49:21PM +0200, Jani Nikula wrote:
> On Wed, 22 Jan 2025, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
> > Quoting Jani Nikula (2025-01-22 11:02:31-03:00)
> >>On Wed, 22 Jan 2025, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
> >>> Quoting Simona Vetter (2025-01-22 08:11:53-03:00)
> >>>>On Tue, Jan 21, 2025 at 06:09:25PM -0300, Gustavo Sousa wrote:
> >>>>> The header drm_print.h uses members of struct drm_device pointers, as
> >>>>> such, it should include drm_device.h to let the compiler know the full
> >>>>> type definition.
> >>>>> 
> >>>>> Without such include, users of drm_print.h that don't explicitly need
> >>>>> drm_device.h would bump into build errors and be forced to include the
> >>>>> latter.
> >>>>> 
> >>>>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> >>>>> ---
> >>>>>  include/drm/drm_print.h | 1 +
> >>>>>  1 file changed, 1 insertion(+)
> >>>>> 
> >>>>> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> >>>>> index f77fe1531cf8..9732f514566d 100644
> >>>>> --- a/include/drm/drm_print.h
> >>>>> +++ b/include/drm/drm_print.h
> >>>>> @@ -32,6 +32,7 @@
> >>>>>  #include <linux/dynamic_debug.h>
> >>>>>  
> >>>>>  #include <drm/drm.h>
> >>>>> +#include <drm/drm_device.h>
> >>>>
> >>>>We much prefer just a struct device forward decl to avoid monster headers.
> >>>>Is that not doable here?
> >>>
> >>> I don't think so. This header explicitly uses members of struct
> >>> drm_device, so the compiler needs to know the full type definition. As
> >>> an example see the definition of drm_WARN(), it uses (drm)->dev.
> >>
> >>I grudgingly agree. I don't think there are actual cases where this
> >>happens, but I can imagine you could create one.
> >
> > It happened to me, and that motivated me to send this patch.
> >
> > I had a local patch where I just needed the drm_print.h header, but I
> > ended up having to include drm_device.h in my .c file.
> 
> Right.
> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

So at least in the past we sometimes intentionally used macros instead of
static inline functions, so that we could avoid pulling in headers from
headers all over the place. That's why I only looked at the one static
inline functions, which treats the pointer as opaque so should work.

I don't mind either way, just bringing this in so that we're consistent
here.
-Sima

> 
> >
> >>
> >>>> Worst case I'd convert the drm_info_printer() static inline to a
> >>>> macro, not sure about the exact rules here if you never deref a
> >>>> pointer.
> >>
> >>The forward declaration is enough for passing pointers around without
> >>dereferencing. It's the dereferencing in the macros that could fail the
> >>build if the .c using them doesn't include drm_device.h.
> >>
> >>To balance things out, I think we could probably drop drm/drm.h if we
> >>inlined one use of DRM_NAME to just "drm".
> >>
> >>
> >>BR,
> >>Jani.
> >>
> >>
> >>>>-Sima
> >>>>
> >>>>>  
> >>>>>  struct debugfs_regset32;
> >>>>>  struct drm_device;
> >>>>> -- 
> >>>>> 2.48.1
> >>>>> 
> >>>>
> >>>>-- 
> >>>>Simona Vetter
> >>>>Software Engineer, Intel Corporation
> >>>>http://blog.ffwll.ch
> >>
> >>-- 
> >>Jani Nikula, Intel
> 
> -- 
> Jani Nikula, Intel

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
