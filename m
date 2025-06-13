Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 939D3AD8D02
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 15:21:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FDCC10E2A0;
	Fri, 13 Jun 2025 13:20:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Tc3tfICG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0454910E9AC
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 13:20:56 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3a36748920cso2082114f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 06:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1749820855; x=1750425655; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=raJrCdR6b2lneSH8VF1vulY9hnsIvh06J0aLVVHMCpc=;
 b=Tc3tfICG7F3iIaFHBC3ACtbKPf29Gpq7YDJRoogF21TQWfk09rHj7xZVP6QYdrejRP
 1nb2uXKZMFPEiOPFrirgJMK4VUcHwZsHaUrVGfrzoWRHQB/OArkTwhi6FlD9j6aEzrrp
 8Tl45zI49bYrLaIk32m73toCBIwtQgh67oOP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749820855; x=1750425655;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=raJrCdR6b2lneSH8VF1vulY9hnsIvh06J0aLVVHMCpc=;
 b=kXx3138WZkZyLfQODXHHRXGrTlfYouDUWSAx34Twv9D0wvqxYLnAgp7cV0IUqsZDo4
 1eCpvGW+zWdlfnRcKuTWk95KDTTqLiGIm6tJP/n/R0fi/rq1eY0C9rBsrJpE0SSEbdV4
 l0Lr8HNa9nzDYOUKDP+gqCwxdrp+UNdWPg+50rX+8EDXaEdJoeGdR32mD71v72BFJjRm
 vJRzaMNODoRZIk000ICzZ4Ayl6/P6ltpprr6ybrqCn6QUdnAYJdqHfkB1sjYWtRuCWXr
 oIiS5ema9XOB0F+Km04EAenv1G4uOFI2Q+NaZ2nc46aglhTUbEJU2FFXjno7XFxFeAGE
 3vWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeh8/H5kUuK+0zcsnrFaW+0ElDO9mmTENzHQNN8Zn3KmnAUuTIyjcKTC/X9G4daLwwjH/4OGr04pU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0Az0si2P5Dg2X8kDU8Wzk3oGv97dLyZuapyTXe1KNhpaGG4Sv
 KvwTwxRNAH5y5WkSBtz0D+wR2w+JbWm/2Z0XXQO0S7DWqM4E6QQe+W26WsKcmwl/5OY=
X-Gm-Gg: ASbGncux8sgBs/qf2oMy0h6ZOBRK7vBdRxjl7/a7pr4d48lEFB4ip0Lbp14MeWGTyvX
 9gp8840yQj2K9H+slCWcNBF1jLjeRDv50QKg4aS3dg42VyUyTHV+3LY5wyOXN8YJZLQ6zk/LX/r
 rkfjS8hRYxcmdzm4yeVMlTWNrGnEycVZN20oXKTZnuyZ/8I28Hw5t9jaJkc2f8gsKhOyr9BVw1y
 fM1BfQYDsjs8i2SfGgaBHN6cfoC/7bjW8NfYThDlFatQetOd9t0iUfW6LtIXu8AY+98BtEFZtQm
 iNaFQ5Y3IK0PDbGnK6U6Qc9Yy93YKrr+dkG0xU2C16uEzoeOe+oT3ft+59TbxbpOxTpK5bwzQA=
 =
X-Google-Smtp-Source: AGHT+IGBZol4ydsu67RWqT3AVYrFjt81+DWC3L2YRnHi7Intg5nYAg6KbEQhJYwKW3ivqaDkBnnsTw==
X-Received: by 2002:a05:6000:2f86:b0:3a4:cf40:ff37 with SMTP id
 ffacd0b85a97d-3a5686dfb66mr2482182f8f.6.1749820854365; 
 Fri, 13 Jun 2025 06:20:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568b089c2sm2370792f8f.59.2025.06.13.06.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 06:20:53 -0700 (PDT)
Date: Fri, 13 Jun 2025 15:20:51 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: "Saarinen, Jani" <jani.saarinen@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/prime: remove drm_prime_lookup_buf_by_handle
Message-ID: <aEwls5hPP9p-DPtt@phenom.ffwll.local>
References: <20250604113234.2520-1-christian.koenig@amd.com>
 <aEBn9o-bARNut3ek@phenom.ffwll.local>
 <aEByd4gidRpxJkfp@phenom.ffwll.local>
 <7497bb60649f9459b9734514bd320033f45651e2@intel.com>
 <dca65c78-9af4-4266-b60e-ce13b5a61f06@ursulin.net>
 <39cf23f66c3f872dddbaf8948e42decc810263c6@intel.com>
 <DM8PR11MB5655FD4DC309FFFA44E87BD6E077A@DM8PR11MB5655.namprd11.prod.outlook.com>
 <362e5fc8-8cb9-4bfb-940c-555514e51912@amd.com>
 <cc1f8c8a-c01b-432d-a466-94ce532d0183@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cc1f8c8a-c01b-432d-a466-94ce532d0183@amd.com>
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

On Fri, Jun 13, 2025 at 02:24:41PM +0200, Christian König wrote:
> On 6/13/25 14:15, Christian König wrote:
> > On 6/13/25 14:11, Saarinen, Jani wrote:
> >> Hi, 
> >>
> >>> -----Original Message-----
> >>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Jani
> >>> Nikula
> >>> Sent: Friday, 13 June 2025 14.02
> >>> To: Tvrtko Ursulin <tursulin@ursulin.net>; Simona Vetter
> >>> <simona.vetter@ffwll.ch>; Christian König
> >>> <ckoenig.leichtzumerken@gmail.com>
> >>> Cc: tzimmermann@suse.de; dri-devel@lists.freedesktop.org
> >>> Subject: Re: [PATCH] drm/prime: remove drm_prime_lookup_buf_by_handle
> >>>
> >>> On Fri, 13 Jun 2025, Tvrtko Ursulin <tursulin@ursulin.net> wrote:
> >>>> On 13/06/2025 11:09, Jani Nikula wrote:
> >>>>> On Wed, 04 Jun 2025, Simona Vetter <simona.vetter@ffwll.ch> wrote:
> >>>>>> On Wed, Jun 04, 2025 at 05:36:22PM +0200, Simona Vetter wrote:
> >>>>> This regressed one of our CI IGT tests [1].
> >>>>>
> >>>>> BR,
> >>>>> Jani.
> >>>>>
> >>>>>
> >>>>> [1] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14463
> >>>>
> >>>> It also explodes even more trivially when logging into a KDE Wayland
> >>>> session:
> >>>
> >>> Smells like a revert, and back to the drawing board, perhaps?
> > 
> > Potentially, but any idea what's going wrong? Sounds like I missed something, but I don't see what.
> 
> Oh! I now see what's going on.
> 
> Looks like the code previously had a race condition and by removing the extra check I made the race condition 100% likely.
> 
> Ups, I think a simple revert won't do it here. Give me a second.

Please make sure you cc: xe-devel so intel-gfx-ci can pick it up and test.
It's a bit embarrassing.

Also since this breaks things quite badly might be good to push the revert
right away since I don't think we can land the proper fix before the w/e.
For that

Acked-by: Simona Vetter <simona.vetter@ffwll.ch>

Cheers, Sima
> 
> Regards,
> Christian.
> 
> > 
> > Regards,
> > Christian.
> > 
> >> I would say so. Looks like this on our CI https://intel-gfx-ci.01.org/tree/drm-tip/igt@prime_self_import@basic-with_one_bo.html 
> >> And systems stop testing anything after (see eg https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16692/bat-twl-1/igt_runner0.txt ) when aborts happens. 
> >>
> >>>
> >>>
> >>> BR,
> >>> Jani.
> >>
> >> Br
> >> Other Jani
> >>>
> >>>
> >>> --
> >>> Jani Nikula, Intel
> > 
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
