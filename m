Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5716C8A07
	for <lists+dri-devel@lfdr.de>; Sat, 25 Mar 2023 02:43:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20BEE10E02E;
	Sat, 25 Mar 2023 01:43:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5477110E02E;
 Sat, 25 Mar 2023 01:43:04 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 mp3-20020a17090b190300b0023fcc8ce113so6706044pjb.4; 
 Fri, 24 Mar 2023 18:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679708584;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=4G7GTEkLJyxigscpgaXHx8wuFhpcA7W1uQv4GS0Q4mY=;
 b=FoqxvAznsCIPXUN2bat6fZfzRKWvB8hC7d1uXLR7mVPwwg15e2Wqn4qYAFs4yfyxZt
 uQ4FGAvuaVZaat5ySstLpCG8lARHkK0BiHAzSLQPyB4fWrsxfO19z5zSSBCdHg78qpk7
 VImKYhp9iAwcnpZZbKOxD+SDqXTU8vj2q55k/jL/z6ZCF+PJ6PdSIgMoEIS/L2K5jKJ1
 MdmkS1EAgAqOcMHNgO2tMwHARoSzuWa+UY/kKebbf4b4/FaOO9kJbfisICdL/XubcyI+
 1nJ1lGqoaR6Ifwsn8/YXOnVKWRPi/PJNFJWx+Ai7U53p4TjzVpxqV8pUExZQ2yFK8GNq
 ZPWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679708584;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4G7GTEkLJyxigscpgaXHx8wuFhpcA7W1uQv4GS0Q4mY=;
 b=5VGPE6Zalv0CTYNGD42jTXLJCpGEFe1SC+B0ReyjKCsvNs/PIQXRLbcmaRZDwZXWAG
 hUd/rpy0kqX6pQFsXcgfRJr0KsXQghugPjQUFLErx/+JZGtX9ZNpqGhDt3/XODTOCm5M
 pOtAi+d2X09aWuA/N11K9qO2HkkgqFtW2kMZccZK5fyeQ0Z9O5dGjN3zH1283Esf6WBZ
 +54N7AS12rS4IElJmgAjekTuC/Xg9unOHrBJcerjde8j0zTsfAxpjksBBjm1czTw5LBH
 g6fCcqolOr3KZBSZzDbs0gvNP5Oulmt5aHcQez9NCOSz82Utv3LbU1dfqc4IWJOIdoTl
 TsGw==
X-Gm-Message-State: AAQBX9dx9s3JQRuX0FYOReL21rAuJtlpGqRJUwh07tu/K30CNYJLd0AH
 BYEZsmu+NlMV+srvuWpTQgw=
X-Google-Smtp-Source: AKy350Z/nh8Rvu2lVDDzogpmv1t1+S88s5A0w7csStYDCAnjQ4dO2RPmUh4h2DZoX4bpj+yY8hYu/A==
X-Received: by 2002:a17:902:dad2:b0:1a1:da3c:605f with SMTP id
 q18-20020a170902dad200b001a1da3c605fmr5816708plx.58.1679708584063; 
 Fri, 24 Mar 2023 18:43:04 -0700 (PDT)
Received: from localhost
 (2603-800c-1a02-1bae-a7fa-157f-969a-4cde.res6.spectrum.com.
 [2603:800c:1a02:1bae:a7fa:157f:969a:4cde])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a170902b78b00b0019c92f56983sm14776847pls.120.2023.03.24.18.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 18:43:03 -0700 (PDT)
Date: Fri, 24 Mar 2023 15:43:02 -1000
From: Tejun Heo <tj@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [RFC v4 00/10] DRM scheduling cgroup controller
Message-ID: <ZB5RpmSm9qrpGIMS@slm.duckdns.org>
References: <20230314141904.1210824-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230314141904.1210824-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Kenny.Ho@amd.com,
 Dave Airlie <airlied@redhat.com>,
 =?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Intel-gfx@lists.freedesktop.org,
 Brian Welty <brian.welty@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Zefan Li <lizefan.x@bytedance.com>,
 Johannes Weiner <hannes@cmpxchg.org>, cgroups@vger.kernel.org,
 "T . J . Mercier" <tjmercier@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello, Tvrtko.

On Tue, Mar 14, 2023 at 02:18:54PM +0000, Tvrtko Ursulin wrote:
> DRM scheduling soft limits
> ~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Because of the heterogenous hardware and driver DRM capabilities, soft limits
> are implemented as a loose co-operative (bi-directional) interface between the
> controller and DRM core.
> 
> The controller configures the GPU time allowed per group and periodically scans
> the belonging tasks to detect the over budget condition, at which point it
> invokes a callback notifying the DRM core of the condition.
> 
> DRM core provides an API to query per process GPU utilization and 2nd API to
> receive notification from the cgroup controller when the group enters or exits
> the over budget condition.
> 
> Individual DRM drivers which implement the interface are expected to act on this
> in the best-effort manner only. There are no guarantees that the soft limits
> will be respected.
> 
> DRM scheduling soft limits interface files
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In general, I'm in favor of your approach but can you please stop using the
term "soft limit". That's a term with a specific historical meaning in
cgroup, so it gets really confusing when you use the term for hierarchical
weighted control. If you need a term to refer to how the weighted control is
implemented by throttling cgroups at target rates, please just come up with
a different term "usage threshold based control", "usage throttling based
control" or whichever you may like.

>   drm.weight
> 	Standard cgroup weight based control [1, 10000] used to configure the
> 	relative distributing of GPU time between the sibling groups.
> 
> This builds upon the per client GPU utilisation work which landed recently for a
> few drivers. My thinking is that in principle, an intersect of drivers which
> support both that and some sort of scheduling control, like  priorities, could
> also in theory support this controller.
> 
> Another really interesting angle for this controller is that it mimics the same
> control menthod used by the CPU scheduler. That is the proportional/weight based
> GPU time budgeting. Which makes it easy to configure and does not need a new
> mental model.

FWIW, the hierarchical weighted distribution is also implemented by IO
control.

> However, as the introduction mentions, GPUs are much more heterogenous and
> therefore the controller uses very "soft" wording as to what it promises. The
> general statement is that it can define budgets, notify clients when they are
> over them, and let individual drivers implement best effort handling of those
> conditions.

Maybe "best effort" is more suited than "soft"?

...
> Roughly simultaneously we run the following two benchmarks in each session
> respectively:
> 
> 1)
> ./GpuTest /test=pixmark_julia_fp32 /width=1920 /height=1080 /fullscreen /no_scorebox /benchmark /benchmark_duration_ms=60000
> 
> 2)
> vblank_mode=0 bin/testfw_app --gl_api=desktop_core --width=1920 --height=1080 --fullscreen 1 --gfx=glfw -t gl_manhattan
> 
> (The only reason for vsync off here is because I struggled to find an easily
> runnable and demanding enough benchmark, or to run on a screen large enough to
> make even a simpler ones demanding.)
> 
> With this test we get 252fps from GpuTest and 96fps from GfxBenchmark.
> 
> Premise here is that one of these GPU intensive benchmarks is intended to be ran
> by the user with lower priority. Imagine kicking off some background compute
> processing and continuing to use the UI for other tasks. Hence the user will now
> re-run the test by first lowering the weight control of the first session (DRM
> cgroup):
> 
> 1)
> echo 50 | sudo tee /sys/fs/cgroup/`cut -d':' -f3 /proc/self/cgroup`/drm.weight
> ./GpuTest /test=pixmark_julia_fp32 /width=1920 /height=1080 /fullscreen /no_scorebox /benchmark /benchmark_duration_ms=60000
> 
> 2)
> vblank_mode=0 bin/testfw_app --gl_api=desktop_core --width=1920 --height=1080 --fullscreen 1 --gfx=glfw -t gl_manhattan
> 
> In this case we will see that GpuTest has recorded 208fps (~18% down) and
> GfxBenchmark 114fps (18% up), demonstrating that even a very simple approach of
> wiring up i915 to the DRM cgroup controller can enable external GPU scheduling
> control.

It's really nice to see it working pretty intuitively.

>  * For now (RFC) I haven't implemented the 2nd suggestion from Tejun of having
>    a shadow tree which would only contain groups with DRM clients. (Purpose
>    being less nodes to traverse in the scanning loop.)
> 
>  * Is the global state passing from can_attach to attach really okay? (I need
>    source and destination css.)

Right now, it is and there are other places that depend on it. Obviously,
it's not great and we probably want to add explicit context passed around
instead in the future, but for now, it should be okay.

While not fully polished, from cgroup POV, the series looks pretty good and
I'd be happy to see it merged.

Thanks.

-- 
tejun
