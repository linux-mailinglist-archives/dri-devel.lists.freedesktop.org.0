Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D07234624
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 14:51:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB33B6EA7D;
	Fri, 31 Jul 2020 12:51:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E45A86EA7E;
 Fri, 31 Jul 2020 12:51:13 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id x9so32337900ljc.5;
 Fri, 31 Jul 2020 05:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=B/WYQkneNHHasyBibLNJc39P94On0q0Yf/0dGxBiCnM=;
 b=bH1oegfq4F1BjeNTK0Nmijn8MhoTBmIOgLZoaVfUGo0h2JoRT+aO14I78TeLvdBHYm
 Pt4W0qwPJ4s9jm03v4G0XX/uCdXRfRLPIyYfE7mgknlRuHgczule6rCWmicdbvvZkVR5
 FK1yg1ZEqij2/fftNtqZXSMUYpyr8RLHPKXEKIlnDfhXUcnkj7I+tcnqEu4OLCIdRvwU
 kdCVHuuI5NS6sIq8V5pwcioRFKnchzzF27Gus5xnrUP4lSfxpu9uXYL8eh3rwklF60Hw
 yDmB2W+Hz3BQ8SKUUY/ifYHZeaBqiQgP66TgtLdW15C+Z/XUEQZamtVRWmfGMyn6Brg4
 z6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=B/WYQkneNHHasyBibLNJc39P94On0q0Yf/0dGxBiCnM=;
 b=IYNBepI1VUhPnvOt7Tc/A2aRijjQh04/KK4nfm6Ly6wf9kfsZvTsOAuS3+rw/HyLss
 bJ9bhKv1XQaUaiaWfOK8JNwPYImIn97xeyuu2a9zEnFWhka+Iy50cokNQvI2vQ8EnWX1
 PmU2n3gL+247PdP73SnzWUKH7QTMexPF/LL5EwnMlkvOjNtcOWmm9ZywAnPa9VvFSzNf
 iY9yIfYf7qMEfu6zFGvg1pQpiSfd5q5D3LoHcTyn3CccPnfz/IMEklHFV5rsP5OgXrQj
 EwiswD+LOXGrqZZ/7pEAM78XUGHdS9+SnAuxAZZhl2LC5S0Fy3fj6swSi+cqARDpumOJ
 Tbxg==
X-Gm-Message-State: AOAM530Hkz6KPD2BYqKotCoIybJuiaLPH+e9DmP8FvrbJxqbo07csBJY
 9zZKoDyQxTayr02j5852M8A=
X-Google-Smtp-Source: ABdhPJwQKJDe178RRgB019PdVZcaJRxYEd+DG5Tp68DUOkwsyOEYd5yGBw9xFWQf08QnB4cwBtO9VA==
X-Received: by 2002:a2e:7a07:: with SMTP id v7mr1822750ljc.159.1596199872208; 
 Fri, 31 Jul 2020 05:51:12 -0700 (PDT)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id s2sm1923362lfs.4.2020.07.31.05.51.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 05:51:11 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 0/6] Fixes and improvements for Xen pvdrm
Date: Fri, 31 Jul 2020 15:51:03 +0300
Message-Id: <20200731125109.18666-1-andr2000@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: intel-gfx@lists.freedesktop.org, sstabellini@kernel.org,
 dan.carpenter@oracle.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Hello,

This series contains an assorted set of fixes and improvements for
the Xen para-virtualized display driver and grant device driver which
I have collected over the last couple of months:

1. Minor fixes to grant device driver and drm/xen-front.

2. New format (YUYV) added to the list of the PV DRM supported formats
which allows the driver to be used in zero-copying use-cases when
a camera device is the source of the dma-bufs.

3. Synchronization with the latest para-virtualized protocol definition
in Xen [1].

4. SGT offset is now propagated to the backend: while importing a dmabuf
it is possible that the data of the buffer is put with offset which is
indicated by the SGT offset. This is needed for some GPUs which have
non-zero offset.

5. Version 2 of the Xen displif protocol adds XENDISPL_OP_GET_EDID
request which allows frontends to request EDID structure per
connector. This request is optional and if not supported by the
backend then visible area is still defined by the relevant
XenStore's "resolution" property.
If backend provides EDID with XENDISPL_OP_GET_EDID request then
its values must take precedence over the resolutions defined in
XenStore.

Thank you,
Oleksandr Andrushchenko

[1] https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=c27a184225eab54d20435c8cab5ad0ef384dc2c0

Oleksandr Andrushchenko (6):
  xen/gntdev: Fix dmabuf import with non-zero sgt offset
  drm/xen-front: Fix misused IS_ERR_OR_NULL checks
  drm/xen-front: Add YUYV to supported formats
  xen: Sync up with the canonical protocol definition in Xen
  drm/xen-front: Pass dumb buffer data offset to the backend
  drm/xen-front: Add support for EDID based configuration

 drivers/gpu/drm/xen/xen_drm_front.c         | 72 +++++++++++++++-
 drivers/gpu/drm/xen/xen_drm_front.h         | 11 ++-
 drivers/gpu/drm/xen/xen_drm_front_cfg.c     | 82 +++++++++++++++++++
 drivers/gpu/drm/xen/xen_drm_front_cfg.h     |  7 ++
 drivers/gpu/drm/xen/xen_drm_front_conn.c    | 27 +++++-
 drivers/gpu/drm/xen/xen_drm_front_evtchnl.c |  3 +
 drivers/gpu/drm/xen/xen_drm_front_evtchnl.h |  3 +
 drivers/gpu/drm/xen/xen_drm_front_gem.c     | 11 +--
 drivers/gpu/drm/xen/xen_drm_front_kms.c     |  7 +-
 drivers/xen/gntdev-dmabuf.c                 |  8 ++
 include/xen/interface/io/displif.h          | 91 ++++++++++++++++++++-
 11 files changed, 305 insertions(+), 17 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
