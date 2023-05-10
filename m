Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB626FE42F
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 20:46:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D919B10E50E;
	Wed, 10 May 2023 18:46:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11FF10E50A;
 Wed, 10 May 2023 18:46:03 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-64359d9c531so5731645b3a.3; 
 Wed, 10 May 2023 11:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683744362; x=1686336362;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=5fuvzbzfAPaWz0F0qnb+ng0M3t+DRDPEy+SEvx5Zlpw=;
 b=WaX/lA3Y5RC6vqi8Gstz4xLqZDGmFXeG7a3rgiWsDu5hUwAToAZzkqoYMo1FT7KjnA
 ARUu3pTtOMc7WAoU2YOH9cnEDLX7dlPp5Fk+vl639nloA3cqkDUb96asyf9ZQw15ihXz
 nIf9q2YeVZUyrcSMtyeAkgoRbV+oLyls91sRKUg2xusZZZ3Ihxuq/x0/E/g2898K6qQY
 NY2fYU0eav3eoftoQ/+ak267O1ldNVnrMhtexIpFA1GoP5llXOIGlF9JxtpQi2ToH3Sb
 zXx6m0I8PgYy7bI06tjMymfporVo62Z/NoPWgDzh1wszI52lSrupgJLtKhGceUulCGBv
 Mj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683744362; x=1686336362;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5fuvzbzfAPaWz0F0qnb+ng0M3t+DRDPEy+SEvx5Zlpw=;
 b=ZXv7VsIeuFiYy5oTkblNWidR7W7uHkM/6Wpv8izEVLdLUL4X2eIIePp0XiS6o4d6Fl
 5RyTe+30Yzm65qdxaNZys7qSR+chQvXnjEvOBqfftb+fltfYUljSOkS8dJJ8VQDOXTnn
 vLu262kV7JYt68RuB6e3r96VYdQETkBRxjzphjOEmXatajodaOa0qbnxdDh/TZ3Qr29e
 Pyf/3f03ysMzub3rEbmbkbRcgmxcd5WJCVsd2uYSwjzNTS4s7Mgk2gM4LyXM+mB7Zugo
 cBb3jBvH2H/IBy6GM0OEt66BvR3x06+8wsOJz+OydineJBv1YyYTlRASbqEn/kM0EaHO
 rnhQ==
X-Gm-Message-State: AC+VfDxPyj+H6cfHwkB5RBPvHr9NeP4J3RvRlLzhR6JLTUcMpQY3BDBq
 RBBp1R5gWAA6HwbeiGJs+Tg=
X-Google-Smtp-Source: ACHHUZ5d5WqcqsbpOW8d9gvlIIZZNzXUY94wx3QLBecJ3Q5deydid7nrQYlsF19asRDnaQT3WKzIjA==
X-Received: by 2002:a17:902:ce86:b0:1ad:c1c2:7d14 with SMTP id
 f6-20020a170902ce8600b001adc1c27d14mr224531plg.46.1683744362257; 
 Wed, 10 May 2023 11:46:02 -0700 (PDT)
Received: from localhost
 (2603-800c-1a02-1bae-a7fa-157f-969a-4cde.res6.spectrum.com.
 [2603:800c:1a02:1bae:a7fa:157f:969a:4cde])
 by smtp.gmail.com with ESMTPSA id
 i3-20020a17090332c300b001ac4d3d3f72sm4130469plr.296.2023.05.10.11.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 11:46:01 -0700 (PDT)
Date: Wed, 10 May 2023 08:46:00 -1000
From: Tejun Heo <tj@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [RFC PATCH 0/4] Add support for DRM cgroup memory accounting.
Message-ID: <ZFvmaGNo0buQEUi1@slm.duckdns.org>
References: <20230503083500.645848-1-maarten.lankhorst@linux.intel.com>
 <ZFVeI2DKQXddKDNl@slm.duckdns.org>
 <4d6fbce3-a676-f648-7a09-6f6dcc4bdb46@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d6fbce3-a676-f648-7a09-6f6dcc4bdb46@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Zefan Li <lizefan.x@bytedance.com>,
 Johannes Weiner <hannes@cmpxchg.org>, cgroups@vger.kernel.org,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Wed, May 10, 2023 at 04:59:01PM +0200, Maarten Lankhorst wrote:
> The misc controller is not granular enough. A single computer may have any number of
> graphics cards, some of them with multiple regions of vram inside a single card.

Extending the misc controller to support dynamic keys shouldn't be that
difficult.

...
> In the next version, I will move all the code for handling the resource limit to
> TTM's eviction layer, because otherwise it cannot handle the resource limit correctly.
> 
> The effect of moving the code to TTM, is that it will make the code even more generic
> for drivers that have vram and use TTM. When using TTM, you only have to describe your
> VRAM, update some fields in the TTM manager and (un)register your device with the
> cgroup handler on (un)load. It's quite trivial to add vram accounting to amdgpu and
> nouveau. [2]
> 
> If you want to add a knob for scheduling weight for a process, it makes sense to
> also add resource usage as a knob, otherwise the effect of that knob is very
> limited. So even for Tvrtko's original proposed usecase, it would make sense.

It does make sense but unlike Tvrtko's scheduling weights what's being
proposed doesn't seem to encapsulate GPU memory resource in a generic enough
manner at least to my untrained eyes. ie. w/ drm.weight, I don't need any
specific knoweldge of how a specific GPU operates to say "this guy should
get 2x processing power over that guy". This more or less holds for other
major resources including CPU, memory and IO. What you're proposing seems a
lot more tied to hardware details and users would have to know a lot more
about how memory is configured on that particular GPU.

Now, if this is inherent to how all, or at least most, GPUs operate, sure,
but otherwise let's start small in terms of interface and not take up space
which should be for something universal. If this turns out to be the way,
expanding to take up the generic interface space isn't difficult.

I don't know GPU space so please educate me where I'm wrong.

Thanks.

-- 
tejun
