Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC4011CF27
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 15:04:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BACD46E0F6;
	Thu, 12 Dec 2019 14:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A0986ED67
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 14:04:39 +0000 (UTC)
Received: by mail-yw1-xc43.google.com with SMTP id z7so637629ywd.4
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 06:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=QhoTimPNvUHtF4G/YQIFrnbKGTtI6y52ps3VPMiqmho=;
 b=FTmINJcFP3tdJJXAr+PyHF7DFztgt6kLHEPm5o6v7jp62QXM8lrykdX9t8JNdBppiC
 h2VbjhHDaig6vwV7L9tGAEvtVjGe8nC3A2xyo5eWGI3VpqmyiR7QgFO40XHFvevZKsCv
 Eeo50Cie7p4JftaBx2YzNbplLxB0q+992SJYcWj4lgo0hNtf8bwBWbJxQSmg+2e4PMmi
 j0hLiXLOhPgcRrCufZrAWuQKYHDJ/sX7Q7JdA86FzaRaKQ8kfkBCy0dlelat8eidVWlj
 NkkCMV2lCE/AX0Sa345IqKDTPTieb8Udcto+vuAAgY5Hm0pQaRxcwZx6+KsQ7K3I4NeR
 HG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=QhoTimPNvUHtF4G/YQIFrnbKGTtI6y52ps3VPMiqmho=;
 b=EarWKpyB/MmSGWXrvdXFvLysw0frxMfKcSSkD7f34FdWDFvFWj1/TqUkYxvXAXjxyo
 dKjbKDy7r+q6qwrccR0R2zBXY73v5XPqCBYPo7yYPhIw5fqXdGCjaNYphlmqyaQdX2Fl
 2Skh5agD/6sx/e2oyyYq93b7HBKOGQ4De6AcvbCatvTFXmXC/Om/9uNRlPf/Zzc0re52
 CXHaV6X0LDesI9MXxOf0c9Rf/+2jw3mkVBHwBAGvSOajjRc6QQdDg1f8hixxvOrDEmfI
 QNEmvZ0DSbMNwsSSLpzPDpWCCj9ExuQwXrlDv7F+sLeFPW6sBu6hT0tYgEYhFYG4S8Zk
 IOBg==
X-Gm-Message-State: APjAAAWM+V1n5wpeICmhdUfljxVKhqj0m2EIYBmGoyo/gEEWP4+U/+go
 T1IdeASDqGtyUg2sxs68m677SA==
X-Google-Smtp-Source: APXvYqyBRrIAwhRyJ81WNxMSHIIBpTOYhjbJDuPCFoDjQYTQ6gT7GEk+U/en3HKEeGINuhEuhWnn0g==
X-Received: by 2002:a0d:d44c:: with SMTP id w73mr4155687ywd.492.1576159478688; 
 Thu, 12 Dec 2019 06:04:38 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id d9sm2689910ywh.55.2019.12.12.06.04.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2019 06:04:37 -0800 (PST)
Date: Thu, 12 Dec 2019 09:04:37 -0500
From: Sean Paul <sean@poorly.run>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20191212140145.GA145200@art_vandelay>
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave and Daniel,
I realized there were a few leftovers from -next-fixes which should find
their way to drm-fixes.

Sean


drm-misc-next-fixes-2019-12-12:
-mgag200: more startadd mitigation (Thomas)
-panfrost: devfreq fix + several memory fixes (Steven, Boris)

Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>

Cheers, Sean


The following changes since commit e5a6ca27eb72c67533ddfc11c06df84beaa167fa:

  drm/dp_mst: Correct the bug in drm_dp_update_payload_part1() (2019-12-04 15:31:16 -0500)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2019-12-12

for you to fetch changes up to 0a5239985a3bc084738851afdf3fceb7d5651b0c:

  drm/panfrost: Open/close the perfcnt BO (2019-12-06 11:06:20 -0600)

----------------------------------------------------------------
-mgag200: more startadd mitigation (Thomas)
-panfrost: devfreq fix + several memory fixes (Steven, Boris)

Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>

----------------------------------------------------------------
Boris Brezillon (4):
      drm/panfrost: Fix a race in panfrost_ioctl_madvise()
      drm/panfrost: Fix a BO leak in panfrost_ioctl_mmap_bo()
      drm/panfrost: Fix a race in panfrost_gem_free_object()
      drm/panfrost: Open/close the perfcnt BO

Steven Price (1):
      drm/panfrost: devfreq: Round frequencies to OPPs

Thomas Zimmermann (1):
      drm/mgag200: Flag all G200 SE A machines as broken wrt <startadd>

 drivers/gpu/drm/mgag200/mgag200_drv.c       |  3 +--
 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 19 ++++++-------------
 drivers/gpu/drm/panfrost/panfrost_drv.c     | 20 +++++++++++---------
 drivers/gpu/drm/panfrost/panfrost_gem.c     | 19 ++++++++++++-------
 drivers/gpu/drm/panfrost/panfrost_gem.h     |  4 ++++
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c | 23 ++++++++++++++---------
 drivers/gpu/drm/panfrost/panfrost_perfcnt.h |  2 +-
 7 files changed, 49 insertions(+), 41 deletions(-)

-- 
Sean Paul, Software Engineer, Google / Chromium OS
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
