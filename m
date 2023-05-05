Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 169F66F89DA
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 21:51:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B215010E669;
	Fri,  5 May 2023 19:51:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F7BF10E665;
 Fri,  5 May 2023 19:51:02 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-64115eef620so22092048b3a.1; 
 Fri, 05 May 2023 12:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683316261; x=1685908261;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=9VTfSz0yyeWdPF85h+AGQ/vGWi6fRSpfJvLR0EPjDWQ=;
 b=YzCXidzcvcJPIoxaBZ+1nS64ayb4z2Nf/LW7iWyUN9Mns5/BbiJOUSxxUH/670nETy
 MIs5soNpscb526ENU8VjKh6AdiDPRH98QzW13/BUp9S+rDbjVHfd3KCVMKP9SEX3qgfA
 K1ywoVkU2tKVOeJIyZdnfV9SFvQ+jCeepatv589ecD3xCxWZvUiuoMFaAVK0Vw+XLPIa
 VpXQlYmhF33TSjEjtEeLUKbnUMQd2SJy9bedok132XO7Har+gUApfjkynV5S5dUx+MDg
 ftBonzsxuMC4noRNfzT1bUaXe150dGe63LYuU5IwhhM4dL63Q7uC6ix1Fn5ZgosyQkuN
 bSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683316261; x=1685908261;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9VTfSz0yyeWdPF85h+AGQ/vGWi6fRSpfJvLR0EPjDWQ=;
 b=Q1G5IM2gqq9mNJoL/04GBdoos83fCFCWEBkY+Jceq0Zpf69oVQhZuM+ow1m69cOUbW
 9tmVPdyHsSCgpuiLW0ogji+7wmSN5TftaNflxdg5umEDGwVBUiIXW04WMyCS3koTWuwo
 x37VuIZbfUyV1dfWNSsQtm4Aoo3+lsUTffvw1NbDL/jxzA3YLXee6tLsO9KphD8xRvKe
 c0oNws0O+2AYpMv5dxZFOnfocVJeYwV7+FFkoBG+i9LTJkLy8PvHCOKgEW9nNxFnU7Te
 SdywNzpI0WsAxfMt0/dJFhEKMShgDFQcYQ2JN4FS+MUxPcinaDo5riGUqab+FSHxxlHq
 DFiw==
X-Gm-Message-State: AC+VfDy5A5eKwMiTbC8if4be8Zs5onA4175M/Rp6BJaG6BJTDg2HedEI
 1TyID0hzkTAHTmgyOkizpLY=
X-Google-Smtp-Source: ACHHUZ4bkyJhNlajHLHjulTevnzyI8SPsU3iBUFjjRbWKMZ5Oh2cdTySHlBCCO1k0lGiFMNc3urMIg==
X-Received: by 2002:a05:6a00:298e:b0:63c:b3be:9784 with SMTP id
 cj14-20020a056a00298e00b0063cb3be9784mr7723066pfb.3.1683316260908; 
 Fri, 05 May 2023 12:51:00 -0700 (PDT)
Received: from localhost
 (2603-800c-1a02-1bae-a7fa-157f-969a-4cde.res6.spectrum.com.
 [2603:800c:1a02:1bae:a7fa:157f:969a:4cde])
 by smtp.gmail.com with ESMTPSA id
 c13-20020aa7880d000000b0063d2bb0d10asm1965319pfo.113.2023.05.05.12.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 12:51:00 -0700 (PDT)
Date: Fri, 5 May 2023 09:50:59 -1000
From: Tejun Heo <tj@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [RFC PATCH 0/4]  Add support for DRM cgroup memory accounting.
Message-ID: <ZFVeI2DKQXddKDNl@slm.duckdns.org>
References: <20230503083500.645848-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230503083500.645848-1-maarten.lankhorst@linux.intel.com>
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

On Wed, May 03, 2023 at 10:34:56AM +0200, Maarten Lankhorst wrote:
> RFC as I'm looking for comments.
> 
> For long running compute, it can be beneficial to partition the GPU memory
> between cgroups, so each cgroup can use its maximum amount of memory without
> interfering with other scheduled jobs. Done properly, this can alleviate the
> need for eviction, which might result in a job being terminated if the GPU
> doesn't support mid-thread preemption or recoverable page faults.
> 
> This is done by adding a bunch of knobs to cgroup:
> drm.capacity: Shows maximum capacity of each resource region.
> drm.max: Display or limit max amount of memory.
> drm.current: Current amount of memory in use.
> 
> TTM has not been made cgroup aware yet, so instead of evicting from
> the current cgroup to stay within the cgroup limits, it simply returns
> the error -ENOSPC to userspace.
> 
> I've used Tvrtko's cgroup controller series as a base, but it implemented
> scheduling weight, not memory accounting, so I only ended up keeping the
> base patch.
> 
> Xe is not upstream yet, so the driver specific patch will only apply on
> https://gitlab.freedesktop.org/drm/xe/kernel

Some high-level feedbacks.

* There have been multiple attempts at this but the track record is kinda
  poor. People don't seem to agree what should constitute DRM memory and how
  they should be accounted / controlled.

* I like Tvrtko's scheduling patchset because it exposes a generic interface
  which makes sense regardless of hardware details and then each driver can
  implement the configured control in whatever way they can. However, even
  for that, there doesn't seem much buy-in from other drivers.

* This proposal seems narrowly scoped trying to solve a specific problem
  which may not translate to different hardware configurations. Please let
  me know if I got that wrong, but if that's the case, I think a better and
  easier approach might be just being a part of the misc controller. That
  doesn't require much extra code and should be able to provide everything
  necessary for statically limiting specific resources.

Thanks.

-- 
tejun
