Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2831945985C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 00:22:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AFA689DD2;
	Mon, 22 Nov 2021 23:22:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B4E589CE2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 23:22:13 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id u80so5883751pfc.9
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 15:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OI3PER0QyhzbqL/owzvJRWlcUQAw61UhZINkcBBC/60=;
 b=JLlv1hEZgx9TXvq+f2lUFXZHdisezqPcSjx7IEgFt5dV3hsnVnGdHQA9R0Znk8tCUp
 9dtYqxLeroaOffxoBqqHRzsdPNur6msscsav5Scy+P7mR3uPyDND62Mq8VT+gOPwiZNu
 v7XHBj0oYmCU1G5SCoo2zopPp6q+tgIAWCxo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OI3PER0QyhzbqL/owzvJRWlcUQAw61UhZINkcBBC/60=;
 b=cwisJVOPLotr7I5Q/c/Q+EtSWMca9IhGEwKzn6H0BNcHjyPzZC6hfhKtmfBOaNhVms
 vZazUlvjiI2qh7YxRVROBv5GeJn2bvsRbY9Vh4Sb9tYytVuF+CaIZMy0fTre0KHKJecV
 7lWOpJWh0cXVKuR+2w0YhbaW9DS/9M3WntczdapS8wrZkQ9qWsjWtu/IXn/cpUda032s
 g6twkj9rMadQgWSZmnY8FB3cMUOJvt5OKealvRC7XtdHxZcebAGWSyMMBqrHH5j86hld
 oIJDWNmJSiEc+9tohfL9H5bDBaZ8eKBkcjQwRC8baybFidIgdue4JKXOMFxtJm38TIvT
 NI+A==
X-Gm-Message-State: AOAM533YdnykIx8i34xdYcRX73rBuj8YR5/cMAoLhWfzvvaUwgEDJDpx
 hAp17g8vrpiBS+dTPFiA2FqraObapHMpLw==
X-Google-Smtp-Source: ABdhPJyaIPJ4eoBfF43Rw+3c4Mvy3ERX2GhO+F+paESaV14Dg8LGmIR/UgdY2XCk4T1UiupBWxlU4A==
X-Received: by 2002:a05:6a00:1909:b0:49f:a0d0:abcf with SMTP id
 y9-20020a056a00190900b0049fa0d0abcfmr681510pfi.70.1637623332910; 
 Mon, 22 Nov 2021 15:22:12 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:f3a1:7064:7e03:2f0a])
 by smtp.gmail.com with ESMTPSA id b15sm10539045pfl.118.2021.11.22.15.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 15:22:12 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
X-Google-Original-From: Gurchetan Singh <gurchetansingh@google.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] virtgpu dummy events
Date: Mon, 22 Nov 2021 15:22:08 -0800
Message-Id: <20211122232210.602-1-gurchetansingh@google.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: kraxel@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Gurchetan Singh <gurchetansingh@chromium.org>

There was a desire to not have a virtgpu-specific implementation of
poll(..), but there wasn't any real event to return either.

Solution: Dummy event with just event code

Context:

https://lists.freedesktop.org/archives/dri-devel/2021-November/330950.html

Userspace:

crrev.com/c/3296610

This series applies to drm-misc-fixes.

Gurchetan Singh (2):
  drm/virtgpu api: define a dummy fence signaled event
  drm/virtio: use drm_poll(..) instead of virtio_gpu_poll(..)

 drivers/gpu/drm/virtio/virtgpu_drv.c   | 42 +-------------------------
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  1 -
 drivers/gpu/drm/virtio/virtgpu_ioctl.c |  2 +-
 include/uapi/drm/virtgpu_drm.h         |  7 +++++
 4 files changed, 9 insertions(+), 43 deletions(-)

-- 
2.34.0.rc2.393.gf8c9666880-goog

