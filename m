Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9C122121C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 18:19:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D36806E0F3;
	Wed, 15 Jul 2020 16:19:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6036F6E0F3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 16:19:11 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id j18so6135860wmi.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 09:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=K8K16Ug7DuWA31N4O61soohSIaNxOE+qX/SsdrPbYkw=;
 b=k2byX8Yf6KKBEpSSHxnugguEhcpgQJTjFailD766ldevMQCVUVzJfxR0SEu4oNYjnx
 NacBshulQzzzhrDVjp8yc8JftPDZh2qFC4h4UifFj0Mq5v/AsI7WMFgZhvvFkZJlAAXs
 j4CnfkUre9PyUokV8tt89r0vy/4OEl7dnBVWs4Oe3k8XRV9eN6+NKxZ1nL4oy9a4YgIZ
 rzCeDM+mc7vDD/YDd+KFiLFw3knjy2h7tty0UOXG80xkeSQYClr9q3Qm6GPO0c/CgHFg
 kIk9QkSSjsR1hi72l990x9XLDKxXyY+j5CaZizk5r5axNytPPY9jCYR+UdvvQTNWAng1
 tHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=K8K16Ug7DuWA31N4O61soohSIaNxOE+qX/SsdrPbYkw=;
 b=cTfYj3EUI9tU6ViD/7iQbJ/xrdGV1qNDsCvwr3/iBWdnl/p53QmkdEon7s6DtVxZ8x
 B2NJlmoQ2zN7nUQivIpNSkTb/Zt+vnMbRKZYHNxsG5cWFdYr3Q9bLYER60gpDf9PeuuN
 6C7zkeYYJZnhGpdQcmyfUa0zOfeojWlJWQGbanB1FlxJd8k7vgSmRT4INRsVBpa+tbJB
 15tv8f+fVFUEa7JklH2e10xghTxnTL1lOssvm0X3ScO59dun/UnyDZ54Lv3abDIbA2x4
 HywMqZlUWIGM4knwydSG97bL4/NjiBj98eDWAJNOVtTHvvUXsaUrdRTW7q9yrK6I7g9J
 AVPA==
X-Gm-Message-State: AOAM530get7f8PcZmLMzCN9HMkogzPDL+jQ8vGToiGvA+tBmyrrUGrid
 0fQecpXcrAj0IWBL6amn+jE=
X-Google-Smtp-Source: ABdhPJxT3yLF4KoD4kHay4NtMY4t2L7+uyitZ0zlHifS+eDSvu5fIHOBsVrmfIeiGnG0u8oSMSokGw==
X-Received: by 2002:a1c:ba0b:: with SMTP id k11mr227745wmf.140.1594829949104; 
 Wed, 15 Jul 2020 09:19:09 -0700 (PDT)
Received: from sroland-t5810.vmware.com (46-126-183-173.dynamic.hispeed.ch.
 [46.126.183.173])
 by smtp.gmail.com with ESMTPSA id h2sm4001688wrw.62.2020.07.15.09.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 09:19:08 -0700 (PDT)
From: "Roland Scheidegger (VMware)" <rscheidegger.oss@gmail.com>
To: airlied@redhat.com,
	daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [git pull] vmwgfx-fixes-5.8
Date: Wed, 15 Jul 2020 18:18:43 +0200
Message-Id: <20200715161843.21118-1-rscheidegger.oss@gmail.com>
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
Cc: linux-graphics-maintainer@vmware.com,
 Roland Scheidegger <rscheidegger.oss@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dave, Daniel,

vmwgfx-fixes pull for 5.8.
Just one fix for now, but it's a really important one, causing black
screens in VMs (sometimes on boot), hence marking it for stable.

The following changes since commit 1f054fd26e29784d373c3d29c348ee48f1c41fb2:

  drm/vmwgfx: fix update of display surface when resolution changes (2020-07-14 04:05:52 +0200)

are available in the Git repository at:

  git://people.freedesktop.org/~sroland/linux vmwgfx-fixes-5.8

for you to fetch changes up to 1f054fd26e29784d373c3d29c348ee48f1c41fb2:

  drm/vmwgfx: fix update of display surface when resolution changes (2020-07-14 04:05:52 +0200)

----------------------------------------------------------------
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
