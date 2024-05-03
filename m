Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CBA8BAFE6
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 17:33:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B69112185;
	Fri,  3 May 2024 15:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="aU1V17y1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23920112185
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 15:33:11 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-51fbdff4c3eso89455e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 08:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1714750389; x=1715355189; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=53hBzkdoK1M6hhh0Jja2F6N4xdAtTdNpQqJA5zIBOqI=;
 b=aU1V17y1XvUFFcl+9myYSzHs31WpNwucJlxL8xCw6p/zblyhUuFSJpoO/40Mbdm8rX
 kRN9JVaaZddSvXXwqDtEP31cA7aKABywH4cDGSeFmnuFEuVd+IVE8JJkJKGcgCK25OPk
 QJLNT3D0d1lO0+oHwwaHVtYEQ6GuwoibbBdWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714750389; x=1715355189;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=53hBzkdoK1M6hhh0Jja2F6N4xdAtTdNpQqJA5zIBOqI=;
 b=ekGahBBy0SLozpbQVGbh1izVVd0enhjJjlyuPH64MhzN03nTLSQdzUJcHk2pwI2zx0
 lNZtK7tsEVw6tPCzF1ynLSd70vP8SobDBqJgwQ0EqDAwmP4n4Zanrvguz/7vwgU1Vlud
 HawnE8htxIbVczaPdbn3MTR9hsa8hChEhC9rSu1yuN/UiZB+lT763ep3/GrcLdkPL3n4
 RYji/thcq1sRPQ66e8Eu1+brhgjyF9YaCbR8Rs/INUb2NI9iMVer/7BpMur+Ax9NjD5Y
 TmFiL1sbKDmALs48I04J6xbEbVEyjFPrRsSec6Xn+bsU/OqyAf2uPiq6Ss/Y8yIRZz92
 CCUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcZiXlGKzAVw5xvecKO6Jl2FSgOMFke3lJMYWuQH2dQ95tCn9UVMBTN5v6lelA3xqps9q3jUPQo7sYP1wlaP15lgPKWhhvuPeqcRXel614
X-Gm-Message-State: AOJu0YwMYsZk1mVocniKKRlbVEkGJw8LC1gsaJLlHBjDeWRCs75nFcru
 jeAdrq/zELW5NNUsE1F70xYCXNpB8Y9yi9TYkRHMzA4HmUpoHH4cn58qdXwuPgE=
X-Google-Smtp-Source: AGHT+IGVW30o41Q7uDAxXP0liYFZAScFShOknTKvcYRh1okVAakYNjtcaCsYaYmv27b56GfYBrBPrg==
X-Received: by 2002:a2e:9110:0:b0:2dd:60d3:7664 with SMTP id
 m16-20020a2e9110000000b002dd60d37664mr1854429ljg.5.1714750388465; 
 Fri, 03 May 2024 08:33:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a05600c35cd00b0041bf45c0665sm9668481wmq.15.2024.05.03.08.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 08:33:07 -0700 (PDT)
Date: Fri, 3 May 2024 17:33:05 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, Alex Deucher <alexander.deucher@amd.com>,
 Rob Clark <robdclark@chromium.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] Documentation/gpu: Document the situation with
 unqualified drm-memory-
Message-ID: <ZjUDsRIHHmJ0oM-1@phenom.ffwll.local>
References: <20240503123657.9441-1-tursulin@igalia.com>
 <736ba0a2-035b-4727-bbcc-437029420377@igalia.com>
 <2cdee989-f48d-4923-b12a-f09a1cc2b34d@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2cdee989-f48d-4923-b12a-f09a1cc2b34d@igalia.com>
X-Operating-System: Linux phenom 6.6.15-amd64 
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

On Fri, May 03, 2024 at 01:58:38PM +0100, Tvrtko Ursulin wrote:
> 
> [And I forgot dri-devel.. doing well!]
> 
> On 03/05/2024 13:40, Tvrtko Ursulin wrote:
> > 
> > [Correcting Christian's email]
> > 
> > On 03/05/2024 13:36, Tvrtko Ursulin wrote:
> > > From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > 
> > > Currently it is not well defined what is drm-memory- compared to other
> > > categories.
> > > 
> > > In practice the only driver which emits these keys is amdgpu and in them
> > > exposes the total memory use (including shared).
> > > 
> > > Document that drm-memory- and drm-total-memory- are aliases to
> > > prevent any
> > > confusion in the future.
> > > 
> > > While at it also clarify that the reserved sub-string 'memory' refers to
> > > the memory region component.
> > > 
> > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > Cc: Christian König <christian.keonig@amd.com>
> > 
> > Mea culpa, I copied the mistake from
> > 77d17c4cd0bf52eacfad88e63e8932eb45d643c5. :)
> > 
> > Regards,
> > 
> > Tvrtko
> > 
> > > Cc: Rob Clark <robdclark@chromium.org>
> > > ---
> > >   Documentation/gpu/drm-usage-stats.rst | 10 +++++++++-
> > >   1 file changed, 9 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/Documentation/gpu/drm-usage-stats.rst
> > > b/Documentation/gpu/drm-usage-stats.rst
> > > index 6dc299343b48..ef5c0a0aa477 100644
> > > --- a/Documentation/gpu/drm-usage-stats.rst
> > > +++ b/Documentation/gpu/drm-usage-stats.rst
> > > @@ -128,7 +128,9 @@ Memory
> > >   Each possible memory type which can be used to store buffer
> > > objects by the
> > >   GPU in question shall be given a stable and unique name to be
> > > returned as the
> > > -string here.  The name "memory" is reserved to refer to normal
> > > system memory.
> > > +string here.
> > > +
> > > +The region name "memory" is reserved to refer to normal system memory.
> > >   Value shall reflect the amount of storage currently consumed by
> > > the buffer
> > >   objects belong to this client, in the respective memory region.
> > > @@ -136,6 +138,9 @@ objects belong to this client, in the respective
> > > memory region.
> > >   Default unit shall be bytes with optional unit specifiers of 'KiB'
> > > or 'MiB'
> > >   indicating kibi- or mebi-bytes.
> > > +This is an alias for drm-total-<region> and only one of the two
> > > should be
> > > +present.

This feels a bit awkward and seems to needlessly complicate fdinfo uapi.

- Could we just patch amdgpu to follow everyone else, and avoid the
  special case? If there's no tool that relies on the special amdgpu
  prefix then that would be a lot easier.

- If that's not on the table, could we make everyone (with a suitable
  helper or something) just print both variants, so that we again have
  consisent fdinfo output? Or breaks that a different set of existing
  tools.

- Finally maybe could we get away with fixing amd by adding the common
  format there, deprecating the old, fixing the tools that would break and
  then maybe if we're lucky, remove the old one from amdgpu in a year or
  so?

Uapi that's "either do $foo or on this one driver, do $bar" is just
guaranteed to fragement the ecosystem, so imo that should be the absolute
last resort.
-Sima

> > > +
> > >   - drm-shared-<region>: <uint> [KiB|MiB]
> > >   The total size of buffers that are shared with another file (e.g.,
> > > have more
> > > @@ -145,6 +150,9 @@ than a single handle).
> > >   The total size of buffers that including shared and private memory.
> > > +This is an alias for drm-memory-<region> and only one of the two
> > > should be
> > > +present.
> > > +
> > >   - drm-resident-<region>: <uint> [KiB|MiB]
> > >   The total size of buffers that are resident in the specified region.

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
