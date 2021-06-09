Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9548D3A1872
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 17:03:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2538089FA9;
	Wed,  9 Jun 2021 15:03:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E131A89F27
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 15:03:44 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id i94so20828363wri.4
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 08:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NhWMTI3K3PvSyT4NX7+k9YdckpneaIXEDt7tMcMwDfc=;
 b=CUnfqPaSTOC4qTLr1T+8SHq/dQ5EswOC7eRbj66eMP8gV9oDaPfsI20KBYIaclnOBa
 bS6EznDT1K5skEB4NXJ3bldYrYdJHhTTd6LTDACBY4IK9izJ4Kv8Kq2koJBBfnYnfvsC
 LLTga4raXNj6JOxYdMe4oEyq3WNqDeO+JoxHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NhWMTI3K3PvSyT4NX7+k9YdckpneaIXEDt7tMcMwDfc=;
 b=lcBDtCmF0FHYmDE4A36E/Km51h+3Nl2fc+b2dY+W+8qh8se14iR8EyGZKt7ShlvKoN
 5IXq8bGNnZh0kTxC4Yc6b5iX+6Kv96FyconXuFs1eOBbDmxsoBNuAw+GdqyogtZOCK0d
 5xuG0zhKrMMnpXaqvWfWNllGhXPL2BEP/0+YZ5OGrqY3pYW4cJhrLvoqnsY7p/2AunYx
 SmFL5CE87gKUA+7wMSVIEfzfZd7ocZ95+8M0bCkMFVGs8/cIEdfODPu9RDEpWJQ2REHW
 UrPtgesnvmsWtUrCzesqvwFiPDQXk0DdwwGzNXDRviJxEKY8IOl0FRiGuJ5/xanzvs5y
 Ukkg==
X-Gm-Message-State: AOAM531ZicsjeD+vP4EiY/61kBSc9s1J8AFQ6/QkzGd+IyWH3Z5BRJle
 OnyUW4opcoPH+RpbVeCG+ozbQMVHQiSR2Q==
X-Google-Smtp-Source: ABdhPJyoGh4/10EMowah85We+jCaIYLAki3i8bo9vvnJEmzrzQ6xVOSuoyOCsu99TuT3F3lSHURXsA==
X-Received: by 2002:a5d:61d0:: with SMTP id q16mr239612wrv.175.1623251023568; 
 Wed, 09 Jun 2021 08:03:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u2sm219793wrn.38.2021.06.09.08.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 08:03:42 -0700 (PDT)
Date: Wed, 9 Jun 2021 17:03:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 0/4] drm: add per-connector hotplug events
Message-ID: <YMDYTNXAE+EeB/TI@phenom.ffwll.local>
References: <H6LOTVFhdBPSi5N5zQIYRvkif2VhbZgfDIyWTvdSrY@cp3-web-051.plabs.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <H6LOTVFhdBPSi5N5zQIYRvkif2VhbZgfDIyWTvdSrY@cp3-web-051.plabs.ch>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: pekka.paalanen@collabora.com, michel@daenzer.net,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 09, 2021 at 10:39:03AM +0000, Simon Ser wrote:
> When a uevent only updates a single connector, add a CONNECTOR property
> to the uevent. This allows user-space to ignore other connectors when
> handling the uevent. This is purely an optimization, drivers can still
> send a uevent without the CONNECTOR property.
> 
> The CONNECTOR property is already set when sending HDCP property update
> uevents, see drm_sysfs_connector_status_event.
> 
> This has been tested with a wlroots patch [1].
> 
> amdgpu has been updated to use these new fine-grained uevents.

That's a bit thin for motivating roll-out ... Also my idea was that with
the per-connector epoch counter we could make this happen for anyone using
the probe helpers.

I also thought that the dp hotplug code was a bit more unified by now to
not need the duplication across all drivers. But there's only three for
that.

Ofc drivers that hand-roll their hpd code need to be adjusted, but I've
hoped that with the epoch counter we could just make the current hotplug
event code dtrt thing here automatically maybe?

Consistent kms interface across drivers is good, and I think we should
aim for that.
-Daniel

> 
> [1]: https://github.com/swaywm/wlroots/pull/2959
> 
> Simon Ser (4):
>   drm/sysfs: introduce drm_sysfs_connector_hotplug_event
>   drm/probe-helper: add drm_kms_helper_connector_hotplug_event
>   drm/connector: use drm_sysfs_connector_hotplug_event
>   amdgpu: use drm_kms_helper_connector_hotplug_event
> 
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  8 +++---
>  .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |  4 +--
>  drivers/gpu/drm/drm_connector.c               |  2 +-
>  drivers/gpu/drm/drm_probe_helper.c            | 20 +++++++++++++++
>  drivers/gpu/drm/drm_sysfs.c                   | 25 +++++++++++++++++++
>  include/drm/drm_probe_helper.h                |  1 +
>  include/drm/drm_sysfs.h                       |  1 +
>  7 files changed, 54 insertions(+), 7 deletions(-)
> 
> -- 
> 2.31.1
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
