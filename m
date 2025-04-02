Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A18A79163
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 16:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7742910E7E5;
	Wed,  2 Apr 2025 14:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="HemM3HrU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCB010E7E5
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 14:41:48 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-ac73723b2d5so858636866b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 07:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1743604907; x=1744209707; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aGEiASZSro6SNX8sjA9X9P0aIH8e4cz3zuHFM4t+mVc=;
 b=HemM3HrU8Ia9uM+Etnq4AlGeWfd5NLpGkfWnLAT6EpmVMYalDGCB5sHIvSH4/lnaoI
 ztLgrtjCc3aOG/WFK+8uaLfAbAWS/35417G18DFdJGW8f3ql8bKGl9uqgZOf2Uf7EaFn
 wG3cAPCqSnU5dnuj7wYZ/o2OSlDzfMNxKPgcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743604907; x=1744209707;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aGEiASZSro6SNX8sjA9X9P0aIH8e4cz3zuHFM4t+mVc=;
 b=gKmxsk1v4mW6LQBUd8KinO/RmJRRoJ5GnvD8A5C/oLi5FANUXviRfWg4NRrkUPTW3s
 ha+7ffnTXhEIkSDCvHl3RUPUg2xWIGl9enGUI7d/zuk9tv4KTLhZI1ZWr5te4HoyO9La
 1M7/oVIb0WRlSIFRiaeppQiBI0F+t01wrZwmocAgzcjkuYl97PNgmL1CzADn7OJHYWOW
 S9sy6QofLw7UsQPsFIVpkVRkDSRkCZURJ/JGAJSB4DwDcO2FCmaOOVEwcQ1et1NQx9hh
 Vo57Nc1/95QSXr4alV+m56RPwiXovLkYG71IWZvOFEBXTNNuUD5LddAxCEBNqh67T7Nd
 oIXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7oIcwESMbTCSGIRL72/Wofdc4jkYcOOmbDkO8r8J8be2kKUKtWQHriTd/lOfznZvo4/xyzlYGkww=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxCi4ZV1akj2bMQ8VaOkUcQNpC3E0KbxS6pCUbnmEGjQnf5zJD
 W3zcu3NyhVIFwPyc8pN/aGEqiRL3IhhC7+S+Gvg8M5emg8PigHIb+dNMXoE4s0Q=
X-Gm-Gg: ASbGncugi4EgH77hZEHG+FSng5UWcLuGS7awBKAap/j/RYTWcslb0jLRvDabZfa/UNc
 JkjGcZU63QeIceyONGmiMd9wKZaktuFa6VLXKqTE6WM5Zs4WaBPx5ZZ/FyUPaPV0IMTrxS5HRMS
 OAHI3/AIE0axfL/jSpuyItjuXcz0PEb6pvd4K/9/VuK0U3gChOOVMRGhERdxgihdmP1TtIvTIPB
 z65ljb9U6S/30qxr51DXD8srosEZpYv05WiJDlve7xMh5zlj1etkWu/6mlH2Ty/8FxN0/i5lA82
 FzI0bz2Q7HjL8MxkzhJmU/H47/0OVpsYoM5119UiPcQs/0J/ACB+RjRmykcTWu3NxQ8=
X-Google-Smtp-Source: AGHT+IGbB74rYUMKNwVBsDPnpOSl78Nh+zCx8TOFn5vmCeSSrll7rHTt8SFf0CFrfFvH9mieMMSzJg==
X-Received: by 2002:a17:907:97c4:b0:ac7:18c9:2975 with SMTP id
 a640c23a62f3a-ac7a1abde58mr206719466b.48.1743604906698; 
 Wed, 02 Apr 2025 07:41:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac71973097dsm911236766b.184.2025.04.02.07.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 07:41:46 -0700 (PDT)
Date: Wed, 2 Apr 2025 16:41:44 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Airlie <airlied@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [git pull] drm for 6.15-rc1
Message-ID: <Z-1MqJen5o0yhoQQ@phenom.ffwll.local>
Mail-Followup-To: Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Airlie <airlied@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <20250331133137.GA263675@nvidia.com> <87tt782htn.fsf@intel.com>
 <CAHk-=wiP0ea7xq2P3ryYs6xGWoqTw1E4jha67ZbJkaFrjqUdkQ@mail.gmail.com>
 <CAK7LNAQThGkgtKgquRPv8Ysi_omedRthF1_++apKda-xWeWcbA@mail.gmail.com>
 <20250401191455.GC325917@nvidia.com> <877c433bys.fsf@intel.com>
 <20250401194649.GE325917@nvidia.com> <87v7rm203e.fsf@intel.com>
 <20250402130347.GB342109@nvidia.com> <87r02a1xge.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r02a1xge.fsf@intel.com>
X-Operating-System: Linux phenom 6.12.17-amd64 
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

On Wed, Apr 02, 2025 at 04:53:37PM +0300, Jani Nikula wrote:
> On Wed, 02 Apr 2025, Jason Gunthorpe <jgg@nvidia.com> wrote:
> > On Wed, Apr 02, 2025 at 03:56:37PM +0300, Jani Nikula wrote:
> >> On Tue, 01 Apr 2025, Jason Gunthorpe <jgg@nvidia.com> wrote:
> >> > On Tue, Apr 01, 2025 at 10:42:35PM +0300, Jani Nikula wrote:
> >> >> On Tue, 01 Apr 2025, Jason Gunthorpe <jgg@nvidia.com> wrote:
> >> >> > So, I'd suggest a better way to run this is first build the kernel,
> >> >> > then mine the gcc -MD output (ie stored in the .XX.cmd files) to
> >> >> > generate a list of headers that are actually part of the build, then
> >> >> > only test those. That eliminates all the kconfig problems. Opt out any
> >> >> > special headers that really have a good reason not to be stand alone.
> >> >> 
> >> >> I think we'd want the drm headers pass the checks independent of configs
> >> >> (apart from CONFIG_DRM). One size doesn't fit all.
> >> >
> >> > Why? That demand is just making it impossible to make shared
> >> > infrastructure, and I don't think DRM should go off and build its own
> >> > stuff just for DRM in a way that nobody else can use it.
> >> >
> >> > If you really, really, care then you can have your makefile codegen an
> >> > "allheaders.c" that #includes drm/*.h and compile that.
> >> 
> >> The v2 series [1] generalizes the header checks and it's no longer in
> >> any way dependent on DRM. For starters, each subsystem/driver needs to
> >> decide for themselves which headers are to be checked.
> >
> > Yuk. The idea at the top of this email is alot better. Why don't you
> > implement it?
> 
> Because quite frankly I don't have the time, and I've already spent a
> disproportionate amount of the time I didn't have on hiding the turds on
> the existing header test thing this week.
> 
> >> This can be expanded with more clever ways to choose the headers to
> >> check. But we have to start *somewhere*.
> >
> > Bah, that argument only works if nobody has better ideas. There are
> > meaningful technical problems with your approach, and proposed
> > solutions here.
> 
> There are also meaningful social problems with the approach of making
> people do a lot of stuff they didn't have time to do in the first place,
> just to end up not merging any of it ever.
> 
> What I've been focusing on is to fix this stuff enough to make it work
> for 6.15. If it's accepted, *maybe* I'll look at further improvements
> for the next merge window. And if there's enough interest, there's a
> baseline for others to build on. But right now, seems to me it could all
> just be reverted in a whim, with all the time wasted.

Yeah, this header test stuff is clearly not as easy as it looks. Even for
drm Jani had to fix up a few things every time this effort was restarted,
and we have very modular and clean headers and really try to make them
stand-alone. Rolling this out as a flag day change is just not realistic I
think, it's just setting yourself up for failure. I think there's two real
optiosn here:

- Gradually roll this out, ideally with support in main Kbuild so it
  doesn't have to be replicated.

- Just shoot it down and move on.

This isn't a refactoring, it's pretty substanstial change in how headers
work and how people need to treat them. And you just never change people
with a flag day approach, that doesn't ever work. And if you try, you'll
just piss of a lot of folks who are taken by surprise by your change.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
