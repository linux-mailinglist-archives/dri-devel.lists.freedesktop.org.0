Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 885612A85DF
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 19:15:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488116EDDB;
	Thu,  5 Nov 2020 18:15:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 183D96EDD9
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 18:15:08 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id k3so2282109otp.12
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 10:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2lVJy0oZJ1HKj/RNi/yGkNbXnVBFsYr/3+ED5ZMQfKw=;
 b=IyWaPau7ZYEzIkgrk5Vh4h4G9HhBgXbnf18iSExSSwD8Va8GOuKADUz4CytksalbiW
 MzScsBKf5oiY2HuZ1YhHj0f7X2yZf4RR6/ROIepItR8F8D/GCz6dcRvPz2s9Pv5dXK3q
 wNxzRh7wgI7g0lSub9uEkZLBBMgnB7KSZ/94o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2lVJy0oZJ1HKj/RNi/yGkNbXnVBFsYr/3+ED5ZMQfKw=;
 b=kHp7ka6eyr0tBpz0c3ePVBYZO3Hyfmo0cjEry2rvfJuWkbJxfcl/LjcXCXPKl2RB2z
 jYmjQvhiFr2kndfr0lDbhS178CQ6FaVC2Gm+Wg5yhqSkiJGwfCKA2qshktOBfjs42oNp
 FVTJSB1qCV8jlu6J1R4FoU7Bg5kPDjecxCQLuf2stWAE1yM5wiozAzox5FOLV65fdvQV
 3vDYoQk0rOLesoy+hJC5pqNfpRJ58MDNphbZFSfko0sG8uEScS0sFX1WrE5uzw4GEThp
 w1vRFiy6NOpwEcGdJQyBtNjetaLlaES2EPBBd6+UaBluQwKoMGOWYQPHdm3klqzzqmx5
 i8xQ==
X-Gm-Message-State: AOAM5318HMGheTzfTGoySxN7hm+BD/e16p94vAtHI4tKTTl7qjeSAAeV
 /fuVtiM8rWeTGTTXz5t36lMXEqUL1qmUoVgbTGQ62A==
X-Google-Smtp-Source: ABdhPJz6LySZvQ0VpbbSmLJZyloCrKQbelizcXBsEwRVJaITj+vGbbcw3XfkOTnXZG1mD1JdtddL+vEJaCj1UVIENNw=
X-Received: by 2002:a9d:3b4:: with SMTP id f49mr2710790otf.188.1604600105882; 
 Thu, 05 Nov 2020 10:15:05 -0800 (PST)
MIME-Version: 1.0
References: <20201105144517.1826692-1-lee.jones@linaro.org>
 <20201105164841.GH485884@ulmo> <20201105181053.GP4488@dell>
In-Reply-To: <20201105181053.GP4488@dell>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 5 Nov 2020 19:14:54 +0100
Message-ID: <CAKMK7uEyW_KJ1qC3gLASDe4Qyk_5UMr+yCu7VVVdAq+Z0J6RwQ@mail.gmail.com>
Subject: Re: [PATCH 00/19] [Set 1] Rid W=1 warnings from GPU
To: Lee Jones <lee.jones@linaro.org>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Gareth Hughes <gareth@valinux.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Francis <David.Francis@amd.com>, Jingoo Han <jg1.han@samsung.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Rob Clark <rob.clark@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, NXP Linux Team <linux-imx@nxp.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 linux-tegra <linux-tegra@vger.kernel.org>, Nirmoy Das <nirmoy.aiemd@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jason Yan <yanaijie@huawei.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 5, 2020 at 7:10 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Thu, 05 Nov 2020, Thierry Reding wrote:
>
> > On Thu, Nov 05, 2020 at 02:44:58PM +0000, Lee Jones wrote:
> > > This set is part of a larger effort attempting to clean-up W=1
> > > kernel builds, which are currently overwhelmingly riddled with
> > > niggly little warnings.
> > >
> > > There are 5000 warnings to work through.
> > >
> > > It will take a couple more sets.
> > >
> > > Lee Jones (19):
> > >   gpu: host1x: bus: Add missing description for 'driver'
> > >   gpu: ipu-v3: ipu-di: Strip out 2 unused 'di_sync_config' entries
> > >   gpu: drm: imx: ipuv3-plane: Mark 'crtc_state' as __always_unused
> > >   gpu: drm: omapdrm: omap_irq: Fix a couple of doc-rot issues
> > >   gpu: drm: selftests: test-drm_mm: Mark 'hole_end' as always_unused
> > >   gpu: drm: scheduler: sched_main: Provide missing description for
> > >     'sched' paramter
> > >   gpu: drm: scheduler: sched_entity: Demote non-conformant kernel-doc
> > >     headers
> > >   gpu: drm: omapdrm: dss: dsi: Rework and remove a few unused variables
> > >   gpu: drm: selftests: test-drm_framebuffer: Remove set but unused
> > >     variable 'fb'
> > >   gpu: drm: ttm: ttm_bo: Fix one function header - demote lots of
> > >     kernel-doc abuses
> > >   gpu: drm: panel: panel-simple: Fix 'struct panel_desc's header
> > >   gpu: drm: bridge: analogix: analogix_dp_reg: Remove unused function
> > >     'analogix_dp_write_byte_to_dpcd'
> > >   gpu: drm: ttm: ttm_tt: Demote kernel-doc header format abuses
> > >   gpu: drm: selftests: test-drm_dp_mst_helper: Place 'struct
> > >     drm_dp_sideband_msg_req_body' onto the heap
> > >   gpu: drm: radeon: radeon_drv: Remove unused variable 'ret'
> > >   gpu: drm: panel: panel-ilitek-ili9322: Demote non-conformant
> > >     kernel-doc header
> > >   gpu: drm: radeon: radeon_device: Fix a bunch of kernel-doc
> > >     misdemeanours
> > >   gpu: drm: amd: amdgpu: amdgpu: Mark global variables as __maybe_unused
> > >   gpu: drm: bridge: analogix: analogix_dp_reg: Remove unused function
> > >     'analogix_dp_start_aux_transaction'
> >
> > As commented on the other patches, the subject prefixes on most of these
> > look wrong, but it's generally a nice cleanup.
>
> The prefixes are automated.  I'll add this to my list of awkward
> subsystems and go through them all manually again tomorrow. :D

tbh for autmoation they look really good :-)

I'd say if you replace the intermediate ": " with just a / you'll be
perfectly in style for drivers/gpu. But really I think it's ok as-is,
imo no need to change since this is a giantic tree wide effort.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
