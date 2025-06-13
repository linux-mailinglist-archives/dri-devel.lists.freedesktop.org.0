Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 632B8AD8CF9
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 15:16:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F2D10E04C;
	Fri, 13 Jun 2025 13:16:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="h8jlefw8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB2510E04C
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 13:16:22 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43ea40a6e98so24691025e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 06:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1749820581; x=1750425381; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=SfNKnb3kqkYrK5iGAm/WRLSoV2itv/7DDqhNnQ3ezpY=;
 b=h8jlefw8M6UL1p8T5Z82BHyOvXNH6yN2ERI4516/kU7wcdk30wqsWUu63taCg/tKGB
 osgsevV5b3FTmyWRE0DzgLeAwg66QhZtN5ns608h2RaylDTvwFKQdLLt1YEjQb/Y2nI1
 T8hlJY+C6OdtnSVSjou6D0cYvLoLZErHD+KTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749820581; x=1750425381;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SfNKnb3kqkYrK5iGAm/WRLSoV2itv/7DDqhNnQ3ezpY=;
 b=u2+vOLuYIKnU8D5t+V/qUoEL8hit0QoyaRJtiIUjPV9oM7fIiAhFV293gUhBKKDJMc
 Sv+euIroSqHCUw7OtidwFlguMyJ9umEJvrxZ0tJAh2L3PDTFtnJm5vyZd9yMW0IopWkm
 O2ih0F7ObQ+s+GH/PocqF61EbZ+yS+vxJebO4lCPBOkB1faV724E9b6L7CPRrRt5J7GY
 uTIjKoqF+xmwiOuooACoSjZOjJBkVJuNbM60n2zK4m8Ph0HhhxtuvG9Jhes4Lu8FODNo
 htneTxTfn3fWy639HKkyxx8orhIVXZ2uLYXsO8fBchVGxB6sTRwQFHUVjeASLqVdwIuM
 hXaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqJNW7TegwXBL/XNFui69t9iuBuCwVai7IDEU/jVvhXSFHtXzsbc+aC5972VmlVmGQx94SgYX7w+8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjEj2zQMSkScQ9i8aKa9U1nGbI/MWBhV2yxM6pyL8gfjNeWWGI
 LxpUbKDACvKg/STIVWnJ3mLm5a5pyZMQIZWWudAM/pCY5Na0hn/Vj1obesdbrFDAMRs=
X-Gm-Gg: ASbGncug3tDWeaDld9FMigppRV7V4YikIEgXLdGOTpL70ne/2oUbPzU89sReS71c+no
 OZ2Jmt+7jKc7SKVCv8JlbtgqNE6pJI9Q9vVnbe5a9VBFyQHoTvsxE2UFg0JthS/9ySAzHYPIwXz
 XheKxQZHnESZ2vETWSN4k4bsyoWGMwMEU+tAlRHJEosmp3fuibi475DAxwDugcMJ54Ofk+yiAyt
 Zdu1pOcKXQTuF/RMh8LYKZQAx83BZ1EpILIE++iOPrQdedfsAh7oKwBktwWZaakEci+JWQxwr39
 kYjLgHLQPpA2PsGIQ955/V5qrrzFvjF5vaJlzZPCdvkDu2s58VUCsP5UiKrqRoSyl8XKwJ8wmg=
 =
X-Google-Smtp-Source: AGHT+IHIDlDsJtXkZUuc7zjCPYSYsn1IEzeH9EtdSfeeV8sFV+DHxn4wvgYvRXTU5QrN8eQK5BLKBQ==
X-Received: by 2002:a05:600c:4e02:b0:442:e147:bea6 with SMTP id
 5b1f17b1804b1-45334a7fce4mr29352195e9.11.1749820580779; 
 Fri, 13 Jun 2025 06:16:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532e232219sm51436475e9.9.2025.06.13.06.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 06:16:20 -0700 (PDT)
Date: Fri, 13 Jun 2025 15:16:17 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: "Saarinen, Jani" <jani.saarinen@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/prime: remove drm_prime_lookup_buf_by_handle
Message-ID: <aEwkoSZ1BInohrXp@phenom.ffwll.local>
References: <20250604113234.2520-1-christian.koenig@amd.com>
 <aEBn9o-bARNut3ek@phenom.ffwll.local>
 <aEByd4gidRpxJkfp@phenom.ffwll.local>
 <7497bb60649f9459b9734514bd320033f45651e2@intel.com>
 <dca65c78-9af4-4266-b60e-ce13b5a61f06@ursulin.net>
 <39cf23f66c3f872dddbaf8948e42decc810263c6@intel.com>
 <DM8PR11MB5655FD4DC309FFFA44E87BD6E077A@DM8PR11MB5655.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM8PR11MB5655FD4DC309FFFA44E87BD6E077A@DM8PR11MB5655.namprd11.prod.outlook.com>
X-Operating-System: Linux phenom 6.12.30-amd64 
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

On Fri, Jun 13, 2025 at 12:11:39PM +0000, Saarinen, Jani wrote:
> Hi, 
> 
> > -----Original Message-----
> > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Jani
> > Nikula
> > Sent: Friday, 13 June 2025 14.02
> > To: Tvrtko Ursulin <tursulin@ursulin.net>; Simona Vetter
> > <simona.vetter@ffwll.ch>; Christian König
> > <ckoenig.leichtzumerken@gmail.com>
> > Cc: tzimmermann@suse.de; dri-devel@lists.freedesktop.org
> > Subject: Re: [PATCH] drm/prime: remove drm_prime_lookup_buf_by_handle
> > 
> > On Fri, 13 Jun 2025, Tvrtko Ursulin <tursulin@ursulin.net> wrote:
> > > On 13/06/2025 11:09, Jani Nikula wrote:
> > >> On Wed, 04 Jun 2025, Simona Vetter <simona.vetter@ffwll.ch> wrote:
> > >>> On Wed, Jun 04, 2025 at 05:36:22PM +0200, Simona Vetter wrote:
> > >> This regressed one of our CI IGT tests [1].
> > >>
> > >> BR,
> > >> Jani.
> > >>
> > >>
> > >> [1] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463
> > >
> > > It also explodes even more trivially when logging into a KDE Wayland
> > > session:
> > 
> > Smells like a revert, and back to the drawing board, perhaps?
> I would say so. Looks like this on our CI https://intel-gfx-ci.01.org/tree/drm-tip/igt@prime_self_import@basic-with_one_bo.html 
> And systems stop testing anything after (see eg https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16692/bat-twl-1/igt_runner0.txt ) when aborts happens. 

Oops, sorry, I should have asked for a CI run to make sure, because I did
review igt_prime test coverage a bit while looking at this patch to make
sure we're not screwing up too badly.
-Sima

> 
> > 
> > 
> > BR,
> > Jani.
> 
> Br
> Other Jani
> > 
> > 
> > --
> > Jani Nikula, Intel

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
