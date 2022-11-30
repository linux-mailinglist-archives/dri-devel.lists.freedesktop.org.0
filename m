Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 096B263D40B
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 12:11:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4712910E002;
	Wed, 30 Nov 2022 11:11:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 906FA10E002
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 11:11:44 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id bs21so26516232wrb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 03:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=juKWxF5oTD0FcdVr6vmRKJx9lD1N7VVH5XonHNDYvKI=;
 b=ZeLJpRgvKOGWEOW4EgtAkpVPc8pF30xRPEQDkJvUfV4oWOggtksYkh0wrqehizoYQZ
 qgWms415U1t3zr+nXd6FDdXnOZKbAeNH8D8m9SSNLLkDeAk8GOm4Yz+uPZhYeJ7LPqV4
 1EhJdMtb76hFaUYi5iCkoy5P1q4EZZB5DFFlw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=juKWxF5oTD0FcdVr6vmRKJx9lD1N7VVH5XonHNDYvKI=;
 b=ahWBDib9OmoyQIFIIOhtt2v91OUAnBbhKM5MZq9QvJhd30GnxMsS2rIVUqKiWBFm8q
 ae+18wbaxgTk3aQkuo24b59E6+bVq/pUi5CW7R01Hc5IY4yHsYBIVIBa7lBZxPiAWpqn
 ruwtmUGStxKO/KqTCS6EW1Uz0hvhmrVBWu6MBlPM4JidsDGZwPiNhVbqaLpiMADd8jTg
 YlnwrXnJWDYNISmyJKUPfVUoQBYG1WazwETcDZFeWN5AIfLmNmLw5tdZaMt3ADBtC2jF
 Mbc4UJ2nym40OxgmOzZrYSF1DySg3wmgl9ozICdxM9B7qm91mIA4T/iXAyJLcko9bPXd
 mJQw==
X-Gm-Message-State: ANoB5pleWWjtdRhA4ycHNQjBVe+IGdvz0tCmKvFbCg7xxZechM2VCkHS
 F7mke685BBkp5fqh2LcpLLSxUw==
X-Google-Smtp-Source: AA0mqf6BVoJ5NdmkjOUzns5ytVRpOWb5ZskQA0IXSEu46GclvHUql9ZDew4cSkL5vDOJV2/HzlkZ1Q==
X-Received: by 2002:adf:ec4b:0:b0:242:803:538c with SMTP id
 w11-20020adfec4b000000b002420803538cmr15569253wrn.656.1669806702599; 
 Wed, 30 Nov 2022 03:11:42 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 w12-20020a05600c474c00b003b435c41103sm6798614wmo.0.2022.11.30.03.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 03:11:40 -0800 (PST)
Date: Wed, 30 Nov 2022 12:11:38 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Subject: Re: [PATCH v3 0/2] drm: Add GPU reset sysfs
Message-ID: <Y4c6arwh4NAxbeTv@phenom.ffwll.local>
Mail-Followup-To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, contactshashanksharma@gmail.com,
 amaranath.somalapuram@amd.com, christian.koenig@amd.com,
 pierre-eric.pelloux-prayer@amd.com, Simon Ser <contact@emersion.fr>,
 Rob Clark <robdclark@gmail.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 Daniel Stone <daniel@fooishbar.org>,
 'Marek =?utf-8?B?T2zFocOhayc=?= <maraeo@gmail.com>,
 Dave Airlie <airlied@gmail.com>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>
References: <20221125175203.52481-1-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221125175203.52481-1-andrealmeid@igalia.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: pierre-eric.pelloux-prayer@amd.com, Pekka Paalanen <ppaalanen@gmail.com>,
 'Marek =?utf-8?B?T2zFocOhayc=?= <maraeo@gmail.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>, amaranath.somalapuram@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, contactshashanksharma@gmail.com,
 christian.koenig@amd.com,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 25, 2022 at 02:52:01PM -0300, André Almeida wrote:
> This patchset adds a udev event for DRM device's resets.
> 
> Userspace apps can trigger GPU resets by misuse of graphical APIs or driver
> bugs. Either way, the GPU reset might lead the system to a broken state[1], that
> might be recovered if user has access to a tty or a remote shell. Arguably, this
> recovery could happen automatically by the system itself, thus this is the goal
> of this patchset.
> 
> For debugging and report purposes, device coredump support was already added
> for amdgpu[2], but it's not suitable for programmatic usage like this one given
> the uAPI not being stable and the need for parsing.
> 
> GL/VK is out of scope for this use, giving that we are dealing with device
> resets regardless of API.
> 
> A basic userspace daemon is provided at [3] showing how the interface is used
> to recovery from resets.
> 
> [1] A search for "reset" in DRM/AMD issue tracker shows reports of resets
> making the system unusable:
> https://gitlab.freedesktop.org/drm/amd/-/issues/?search=reset
> 
> [2] https://lore.kernel.org/amd-gfx/20220602081538.1652842-2-Amaranath.Somalapuram@amd.com/
> 
> [3] https://gitlab.freedesktop.org/andrealmeid/gpu-resetd
> 
> v2: https://lore.kernel.org/dri-devel/20220308180403.75566-1-contactshashanksharma@gmail.com/
> 
> André Almeida (1):
>   drm/amdgpu: Add work function for GPU reset event
> 
> Shashank Sharma (1):
>   drm: Add GPU reset sysfs event

This seems a bit much amd specific, and a bit much like an ad-hoc stopgap.

On the amd specific piece:

- amd's gpus suck the most for gpu hangs, because aside from the shader
  unblock, there's only device reset, which thrashes vram and display and
  absolutely everything. Which is terrible. Everyone else has engine only
  reset since years (i.e. doesn't thrash display or vram), and very often
  even just context reset (i.e. unless the driver is busted somehow or hw
  bug, malicious userspace will _only_ ever impact itself).

- robustness extensions for gl/vk already have very clear specifications
  of all cases of reset, and this work here just ignores that. Yes on amd
  you only have device reset, but this is drm infra, so you need to be
  able to cope with ctx reset or reset which only affected a limited set
  of context. If this is for compute and compute apis lack robustness
  extensions, then those apis need to be fixed to fill that gap.

- the entire deamon thing feels a bit like overkill and I'm not sure why
  it exists. I think for a start it would be much simpler if we just have
  a (per-device maybe) sysfs knob to enable automatic killing of process
  that die and which don't have arb robustness enabled (for gl case, for
  vk case the assumption is that _every_ app supports VK_DEVICE_LOST and
  can recover).

Now onto the ad-hoc part:

- Everyone hand-rolls ad-hoc gpu context structures and how to associate
  them with a pid. I think we need to stop doing that, because it's just
  endless pain and prevents us from building useful management stuff like
  cgroups for drivers that work across drivers (and driver/vendor specific
  cgroup wont be accepted by upstream cgroup maintainers). Or gpu reset
  events and dumps like here. This is going to be some work unforutnately.

- I think the best starting point is the context structure drm/scheduler
  already has, but it needs some work:
  * untangling it from the scheduler part, so it can be used also for
    compute context that are directly scheduled by hw
  * (amd specific) moving amdkfd over to that context structure, at least
    internally
  * tracking the pid in there

- I think the error dump facility should also be integrated into this.
  Userspace needs to know which dump is associated with which reset event,
  so that remote crash reporting works correctly.

- ideally this framework can keep track of impacted context so that
  drivers don't have to reinvent the "which context are impacted"
  robustness ioctl book-keeping all on their own. For amd gpus it's kinda
  easy, since the impact is "everything", but for other gpus the impact
  can be all the way from "only one context" to "only contexts actively
  running on $set_of_engines" to "all the context actively running" to "we
  thrashed vram, everything is gone"

- i915 has a bunch of this already, but I have honestly no idea whether
  it's any use because i915-gem is terminally not switching over to
  drm/scheduler (it needs a full rewrite, which is happening somewhere).
  So might only be useful to look at to make sure we're not building
  something which only works for full device reset gpus and nothing else.
  Over the various generations i915 has pretty much every possible gpu
  reset options you can think of, with resulting different reporting
  requirements to make sure robustness extensions work correctly.

- pid isn't enough once you have engine/context reset, you need pid (well
  drm_file really, but I guess we can bind those to pid somehow) and gpu
  ctx id. Both gl and vk allow you to allocate limitless gpu context on
  the same device, and so this matters.

- igt for this stuff. Probably needs some work to generalize the i915
  infra for endless batchbuffers so that you can make very controlled gpu
  hangs.

Cheers, Daniel

>  drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  4 +++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 30 ++++++++++++++++++++++
>  drivers/gpu/drm/drm_sysfs.c                | 26 +++++++++++++++++++
>  include/drm/drm_sysfs.h                    | 13 ++++++++++
>  4 files changed, 73 insertions(+)
> 
> -- 
> 2.38.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
