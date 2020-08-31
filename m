Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7B125847A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 01:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2BF6E42C;
	Mon, 31 Aug 2020 23:39:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD37D6E42C
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 23:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598917143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=n5R+f1PNBorU/jsUkdeV70NC+z+cmxf6ppfqklZypiw=;
 b=NsdSmR7jOIU1rhA1znpVX1CrqsoXrzME8noR+K/Bf1H3wCBKIp+afFTpEBl+4elFhOWTYU
 S99qStaNCXRg5WtCGmjb2NCK17gB+5roD9U1DGBtTdUzoJW5qXz+Cn3j+yXzyKf0MUI2SZ
 sk9uC2REIommd5Prrci8klQOsz/lBI8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-b1b1NgfiNDyM_340-ogYng-1; Mon, 31 Aug 2020 19:39:00 -0400
X-MC-Unique: b1b1NgfiNDyM_340-ogYng-1
Received: by mail-qk1-f197.google.com with SMTP id u23so4781634qku.17
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 16:39:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:organization
 :user-agent:mime-version:content-transfer-encoding;
 bh=n5R+f1PNBorU/jsUkdeV70NC+z+cmxf6ppfqklZypiw=;
 b=TW1+sI/jcTHvS0dDm6MCvzWFmhAjp97+TZ8xxydWqMtrH0fo7GMe3b7lezgt5fBnKq
 vKCU7QXu/xzGxz6GJ3pA1msyvGC8B7Lzo7YjLRkyIDN5bRibCjnUdz+lnUdIeSN/XFQv
 80iRCZjMGxLoRi1+DSfkGb6lqxpBi9yEMNZDnY7yv98MP8KZ+8xuqifcPzd+skS1NqdG
 omGGXYHt1196ZPA55Hi03HUhfmxcf6EmLqRYEEQU4tMU1n37HJiBVTLEvPcguxDNv/3u
 B91X7mvWUpNXmmvfi0ZkjJnjKaqzg+SXmVln7xS/iyqXZ8+6XcrOPajMN+P4zCFtI2cs
 YXyQ==
X-Gm-Message-State: AOAM532Cr6juHUo8svIf1XHHlW1ZeWIEo2rPAEc0E5cVrhFqQpkoByL9
 TO/QHhnRD6Nk2+Q0Aud8deignENR5MDQBMoW2WrW/Omxn3mk2OveV9fD62JD02H2IU+1hM+oGPP
 cflltut+ULctaf3Yq1Y5EgjOvM0Af
X-Received: by 2002:a37:5703:: with SMTP id l3mr3335472qkb.125.1598917140398; 
 Mon, 31 Aug 2020 16:39:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyh2vGecgFDzmMhCpTudfXK9+M8MKeOUjCbJMZN6KO19xGuqD62k3eaBxVpoVpy94NLr3TYtg==
X-Received: by 2002:a37:5703:: with SMTP id l3mr3335457qkb.125.1598917140142; 
 Mon, 31 Aug 2020 16:39:00 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id v18sm7271596qtq.15.2020.08.31.16.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 16:38:59 -0700 (PDT)
Message-ID: <11e59ebdea7ee4f46803a21fe9b21443d2b9c401.camel@redhat.com>
Subject: [PULL] topic/nouveau-i915-dp-helpers-and-cleanup
From: Lyude Paul <lyude@redhat.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 31 Aug 2020 19:38:57 -0400
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

topic/nouveau-i915-dp-helpers-and-cleanup-2020-08-31-1:
UAPI Changes:

None

Cross-subsystem Changes:

* Moves a bunch of miscellaneous DP code from the i915 driver into a set
  of shared DRM DP helpers

Core Changes:

* New DRM DP helpers (see above)

Driver Changes:

* Implements usage of the aforementioned DP helpers in the nouveau
  driver, along with some other various HPD related cleanup for nouveau
The following changes since commit bfacb84993eb173c0ab53ca4dd6180f76f4dc176:

  drm: virtio: fix kconfig dependency warning (2020-08-31 08:55:02 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/topic/nouveau-i915-dp-helpers-and-cleanup-2020-08-31-1

for you to fetch changes up to 79416e97dda0118b137302575a70a14259a27d7d:

  drm/nouveau/kms: Start using drm_dp_read_dpcd_caps() (2020-08-31 19:10:09 -0400)

----------------------------------------------------------------
UAPI Changes:

None

Cross-subsystem Changes:

* Moves a bunch of miscellaneous DP code from the i915 driver into a set
  of shared DRM DP helpers

Core Changes:

* New DRM DP helpers (see above)

Driver Changes:

* Implements usage of the aforementioned DP helpers in the nouveau
  driver, along with some other various HPD related cleanup for nouveau

----------------------------------------------------------------
Lyude Paul (20):
      drm/nouveau/kms: Fix some indenting in nouveau_dp_detect()
      drm/nouveau/kms/nv50-: Remove open-coded drm_dp_read_desc()
      drm/nouveau/kms/nv50-: Just use drm_dp_dpcd_read() in nouveau_dp.c
      drm/nouveau/kms/nv50-: Use macros for DP registers in nouveau_dp.c
      drm/nouveau/kms: Don't clear DP_MST_CTRL DPCD in nv50_mstm_new()
      drm/nouveau/kms: Search for encoders' connectors properly
      drm/nouveau/kms/nv50-: Use drm_dp_dpcd_(readb|writeb)() in nv50_sor_disable()
      drm/nouveau/kms/nv50-: Refactor and cleanup DP HPD handling
      drm/i915/dp: Extract drm_dp_read_mst_cap()
      drm/nouveau/kms: Use new drm_dp_read_mst_cap() helper for checking MST caps
      drm/nouveau/kms: Move drm_dp_cec_unset_edid() into nouveau_connector_detect()
      drm/nouveau/kms: Only use hpd_work for reprobing in HPD paths
      drm/i915/dp: Extract drm_dp_read_downstream_info()
      drm/nouveau/kms/nv50-: Use downstream DP clock limits for mode validation
      drm/i915/dp: Extract drm_dp_read_sink_count_cap()
      drm/i915/dp: Extract drm_dp_read_sink_count()
      drm/nouveau/kms/nv50-: Add support for DP_SINK_COUNT
      drm/nouveau/kms: Don't change EDID when it hasn't actually changed
      drm/i915/dp: Extract drm_dp_read_dpcd_caps()
      drm/nouveau/kms: Start using drm_dp_read_dpcd_caps()

 drivers/gpu/drm/drm_dp_helper.c             | 187 ++++++++++++++++-
 drivers/gpu/drm/drm_dp_mst_topology.c       |  22 ++
 drivers/gpu/drm/i915/display/intel_dp.c     | 124 +++--------
 drivers/gpu/drm/i915/display/intel_dp.h     |   1 -
 drivers/gpu/drm/i915/display/intel_lspcon.c |   2 +-
 drivers/gpu/drm/nouveau/dispnv04/dac.c      |   2 +-
 drivers/gpu/drm/nouveau/dispnv04/dfp.c      |   7 +-
 drivers/gpu/drm/nouveau/dispnv04/disp.c     |  24 ++-
 drivers/gpu/drm/nouveau/dispnv04/disp.h     |   4 +
 drivers/gpu/drm/nouveau/dispnv04/tvnv04.c   |   2 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c   |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 305 ++++++++++++++++------------
 drivers/gpu/drm/nouveau/nouveau_connector.c | 132 +++++-------
 drivers/gpu/drm/nouveau/nouveau_connector.h |   1 +
 drivers/gpu/drm/nouveau/nouveau_display.c   |  72 ++++++-
 drivers/gpu/drm/nouveau/nouveau_display.h   |   3 +-
 drivers/gpu/drm/nouveau/nouveau_dp.c        | 210 +++++++++++++++----
 drivers/gpu/drm/nouveau/nouveau_drm.c       |   4 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h       |   2 +
 drivers/gpu/drm/nouveau/nouveau_encoder.h   |  48 ++++-
 include/drm/drm_dp_helper.h                 |  15 +-
 include/drm/drm_dp_mst_helper.h             |   3 +-
 22 files changed, 779 insertions(+), 393 deletions(-)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
