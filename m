Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8092433E2
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 08:21:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E8946E217;
	Thu, 13 Aug 2020 06:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE746E217;
 Thu, 13 Aug 2020 06:21:17 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id j22so2452852lfm.2;
 Wed, 12 Aug 2020 23:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=wDWU02+wCKok8nwDMeBlH97/pQcKgRkp+JF5JymdpUo=;
 b=jDpTVC3sIm7gufDjf0d+/+hJrzDRXPB5ir1t8eW5KL1T4aQ4sPLBnwenLQJBq8qKIT
 jbWxj5JszQNrbU7t/NghozcTj8mbbQlIm6qR389+tdkpQMibep+6sVKx04ZpKchRa7LV
 GNarSi2rJdVEBIeItxbNSzQqwt1BU78frDE9wbp2rvt/2v1RWsrdGtn4StePHqGj+jOs
 0hkOuKOaNcoKsUQjwgop4MRJCWhnqOQS/C5bdq1bBa5QlE+tS3/4sQxnvthYHBWU4xY8
 HfUDYiAqSdSuj7GT21GU5fs5apPoGqXCDyMaqNXkiNYk+hF3l+HR3QJrDN2l/Qih7nVD
 R67Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=wDWU02+wCKok8nwDMeBlH97/pQcKgRkp+JF5JymdpUo=;
 b=BzkC4Q+asMc/lE6RZtxbx1JbbfiK2pvKeWkdYqvL9jh5g17jwhXHY/AbR75DKD+7ko
 Uxo6xERuZVXKjLAp7SGxjWvzDglU88INibiirYMZEJ08cnkbP8F0KnB/bm5iHixrQto5
 VGZ0fG5dUTKkP5SWIQVpM9y3hRAgB2AoUrPw+LnC2h2U/3ajsfNHG7bQSWJzqayaj1Qo
 n0I2BuhyBuletqAnFHzljESW9fl/qfsxwEEkK6tyJp36PN5ejAOpJcl5KfbmS+9RZA1C
 OExPjZdZqXSzkb2GHCD9PANkFqPCtzHfNy91VMCUtvCPrBSDTA01vo33FuPyniwbVBWU
 S2Jg==
X-Gm-Message-State: AOAM530AY5zhhbgvxh+ionNZqsO5Z2ClQzRUm+OrSPUPf064iilioIAO
 vSDowlO4wWGmsLzUXMuooig=
X-Google-Smtp-Source: ABdhPJyM6kqvqKmDAxBHlLEed6fda0trrJcviieTKINPyset90Po5kDy6xXF6opl++WeilsLdmCx8A==
X-Received: by 2002:ac2:5ec8:: with SMTP id d8mr1391609lfq.169.1597299675256; 
 Wed, 12 Aug 2020 23:21:15 -0700 (PDT)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id f14sm964060lfd.2.2020.08.12.23.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 23:21:14 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 0/5] Fixes and improvements for Xen pvdrm
Date: Thu, 13 Aug 2020 09:21:08 +0300
Message-Id: <20200813062113.11030-1-andr2000@gmail.com>
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

Thank you,
Oleksandr Andrushchenko

[1] https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=c27a184225eab54d20435c8cab5ad0ef384dc2c0

Changes since v1:
=================

1. Removed patch which adds EDID to PV DRM as it needs more time for review:
"5. Version 2 of the Xen displif protocol adds XENDISPL_OP_GET_EDID
request which allows frontends to request EDID structure per
connector. This request is optional and if not supported by the
backend then visible area is still defined by the relevant
XenStore's "resolution" property.
If backend provides EDID with XENDISPL_OP_GET_EDID request then
its values must take precedence over the resolutions defined in
XenStore."
I will send this as a dedicated patch.

2. Added missing CC stable for the patches with fixes

Oleksandr Andrushchenko (5):
  xen/gntdev: Fix dmabuf import with non-zero sgt offset
  drm/xen-front: Fix misused IS_ERR_OR_NULL checks
  drm/xen-front: Add YUYV to supported formats
  xen: Sync up with the canonical protocol definition in Xen
  drm/xen-front: Pass dumb buffer data offset to the backend

 drivers/gpu/drm/xen/xen_drm_front.c      | 10 +--
 drivers/gpu/drm/xen/xen_drm_front.h      |  2 +-
 drivers/gpu/drm/xen/xen_drm_front_conn.c |  1 +
 drivers/gpu/drm/xen/xen_drm_front_gem.c  | 11 +--
 drivers/gpu/drm/xen/xen_drm_front_kms.c  |  2 +-
 drivers/xen/gntdev-dmabuf.c              |  8 +++
 include/xen/interface/io/displif.h       | 91 +++++++++++++++++++++++-
 7 files changed, 111 insertions(+), 14 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
