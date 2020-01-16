Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0925913E015
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 17:29:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A229A6EDD8;
	Thu, 16 Jan 2020 16:28:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D6B76EDD7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 16:28:58 +0000 (UTC)
Received: by mail-yw1-xc43.google.com with SMTP id n184so12982546ywc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 08:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=lS8F+CwbTI610S/KA97UmC4Nj3AKvTLOMWBRVZYZmxw=;
 b=VunRtgaCFl7cOe3E6LHVeuqzjicSp+mp6ZDHO5vO3qnqUZ2vv4YcKdxCKTO+NFZmGj
 YVL4c6Ms9AqHHn+Knx3DWNtY67ZWGyL1bmtu0uo8nsJATV+JoKfQNWryR+00Mm67OlPY
 eI7IoyCfnmFMqcwhRyJGZ81hVrCcYZUq+b2wWuF1Tvon3EgLxkfrrozFmlEFH6chTsLJ
 1vuGAyexOSeDPUqP3l0HKxQXjzMpORn5PTEOHM9ntM1UChPyROBeKBuwkZkk0WhmKU4q
 X0gVqig0vEAS5d49ga4jbZgAaFE7KSQzJeAHjdFmH/6SM2I76q6rhREloRpo/BH2zotF
 eiZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=lS8F+CwbTI610S/KA97UmC4Nj3AKvTLOMWBRVZYZmxw=;
 b=MC0deKVL7DcVdP5f2FSsVs7ftE6o5jYyyQtUNAdmWL1f3es21/Sto1uMCNagNfxYab
 5kUhMmXDrA6S7WF1UAvsYj0A9UhSOMuU3p1YfOmDZExzGL/gQWuFa0Zh8Am1FS9S7p7V
 i7yuSYi0z1XyBIRyE2Kfw4Wq0OSuPUnQPX1eMLswI0J/N3jtZ7PH8tYYykIzGYgFxxXD
 htbEdUnnEwwBJGjN3PK5U8xXU6jvDd1/zZ2BHNQk3r6Ert85Lg62ZPqJiZS9oVv+nMm9
 ZwtjuCnEO+3qQO1ezHDYf5ryvg8V7ztWJtPiSz6rQWTcaOBcca2IrYAAK5lh3Zu8YeR5
 Fkdg==
X-Gm-Message-State: APjAAAWOqrI4XVbXe98zqLBSH38u0oId2zSIGEDC5oXySyYsI0xE386v
 dTFHceF9KYvtHyWKmdVUdzuEKA==
X-Google-Smtp-Source: APXvYqxjIOnk8/6JogOo+wwv5UAgK9I+vtUbC7Kidl7Cvv4IG3whWnt0uyS9VvKPdGg/8MY4V41TdA==
X-Received: by 2002:a0d:dd47:: with SMTP id g68mr25558542ywe.299.1579192137472; 
 Thu, 16 Jan 2020 08:28:57 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id r10sm10298215ywr.97.2020.01.16.08.28.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2020 08:28:57 -0800 (PST)
Date: Thu, 16 Jan 2020 11:28:56 -0500
From: Sean Paul <sean@poorly.run>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20200116162856.GA11524@art_vandelay>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: dim-tools@lists.freedesktop.org, Tobias Schramm <t.schramm@manjaro.org>,
 Wayne Lin <Wayne.Lin@amd.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave and Daniel,
I'm delighted to present another -misc-fixes pull. Dock users rejoice, MST
keeps getting better!

Please pull!

drm-misc-fixes-2020-01-16:
virtio: maintain obj reservation lock when submitting cmds (Gerd)
rockchip: increase link rate var size to accommodate rates (Tobias)
mst: serialize down messages and clear timeslots are on unplug (Wayne)

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Tobias Schramm <t.schramm@manjaro.org>
Cc: Wayne Lin <Wayne.Lin@amd.com>

Cheers, Sean


The following changes since commit 023b3b0e139f54a680202790ba801f61aa43a5c8:

  Merge tag 'drm-intel-fixes-2020-01-09-1' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2020-01-10 11:43:02 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2020-01-16

for you to fetch changes up to 5a64967a2f3bbc01cc708ee43c7b0893089c61c4:

  drm/dp_mst: Have DP_Tx send one msg at a time (2020-01-15 17:01:21 -0500)

----------------------------------------------------------------
virtio: maintain obj reservation lock when submitting cmds (Gerd)
rockchip: increase link rate var size to accommodate rates (Tobias)
mst: serialize down messages and clear timeslots are on unplug (Wayne)

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Tobias Schramm <t.schramm@manjaro.org>
Cc: Wayne Lin <Wayne.Lin@amd.com>

----------------------------------------------------------------
Gerd Hoffmann (1):
      drm/virtio: add missing virtio_gpu_array_lock_resv call

Tobias Schramm (1):
      drm/rockchip: fix integer type used for storing dp data rate

Wayne Lin (2):
      drm/dp_mst: clear time slots for ports invalid
      drm/dp_mst: Have DP_Tx send one msg at a time

 drivers/gpu/drm/drm_dp_mst_topology.c  | 39 +++++++++++++++++++++++++++++++---
 drivers/gpu/drm/rockchip/cdn-dp-core.h |  2 +-
 drivers/gpu/drm/virtio/virtgpu_plane.c |  1 +
 include/drm/drm_dp_mst_helper.h        |  6 ++++++
 4 files changed, 44 insertions(+), 4 deletions(-)

-- 
Sean Paul, Software Engineer, Google / Chromium OS
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
