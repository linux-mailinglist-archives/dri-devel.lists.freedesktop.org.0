Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9790532B7E3
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 13:50:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68DCC6E3CE;
	Wed,  3 Mar 2021 12:49:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD5A6E3CE
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 12:49:56 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id e9so4089177pjs.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 04:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=UENSETCCSEDGxjTkQmqskiUgabV6KTJ5GVCGqRR2WeU=;
 b=FCtkSXDEcxgX1TqpqqdTnD8DMSoRVbK1hEuV3/IhT/lllSVvPuEtO4J4uGFDBefbOj
 ImvnczGzv+lY/tPJLrhxQqyNFK9mB8S3WK430mXnkWSTY+HNP7JVFga5xneXH4SoIGru
 Kmi5BFYtY69xEBr6B8BJKuGTMT6yC3GpB43G0lds2vOPR7/yhALobcKNHJmM2yFdRtfS
 5y07AutoWsGjS+sPh+dcj1S4kddIUpMNDre6Yc1WxKKbXKJbrOvitFaPQGawApqRNxY4
 bCU5QJszHbPbysh8ofYcOsDuCSMuQa4pBYJ5z+IJSpJTltnwvNfxfArSO+Qk9vmFGSzY
 gePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=UENSETCCSEDGxjTkQmqskiUgabV6KTJ5GVCGqRR2WeU=;
 b=Vvn4IU81EvO+/BDKvmRzz+qW/THKV4M5/s/aCQDGkbNs7J0vWh5l0/icrXDGbeZ5Bt
 Yu4q+67u81T5eOOKne/lOffo6Fxkavy8JrchyQ7HsWDP5tjTKr+UAqTRlzpCvkfHRW12
 U/Zm61mTE5W4ZEd7A8wbIjozTdpG1JYlh5+Vaer5wxuxYnq124XznKrwuR7rWyukVsIh
 g0RiyhW//JotWcmy6ht4XWDW4dDS2qWD6nR+9XE3JnwHGY/hxvub+EUkYDHVGo9oZAXI
 IWUTOGlkvRnmx2HagUJT3hpHxEl9iJaUGGxxiR54s64nVjk0D+y6GpNVDipe7TrnfdKn
 iXhg==
X-Gm-Message-State: AOAM530rnjzLC5TPSplLEm1CK93b6Wbz97qmAFsWe5gd0+wkHL457NzL
 lPONcoLDCykSyT8k9Z/gWDU=
X-Google-Smtp-Source: ABdhPJxKGgC9YUoFjWyKXMfkcrb48impfAYkzV47xMdbWioftwa0OsXTkQLd+BsvpwC2mHNsIm1Mzg==
X-Received: by 2002:a17:90a:5887:: with SMTP id
 j7mr9143604pji.178.1614775795754; 
 Wed, 03 Mar 2021 04:49:55 -0800 (PST)
Received: from adolin ([49.207.223.176])
 by smtp.gmail.com with ESMTPSA id q192sm24878430pfc.85.2021.03.03.04.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 04:49:55 -0800 (PST)
Date: Wed, 3 Mar 2021 18:19:50 +0530
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
To: melissa.srw@gmail.com
Subject: [PATCH V2 0/2] Add virtual hardware module
Message-ID: <cover.1614775351.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset adds support for emulating virtual hardware with VKMS.
The virtual hardware mode can be enabled by using the following command
while loading the module:
        sudo modprobe vkms enable_virtual_hw=1

The first patch adds virtual hardware support as a module option. The
second patch adds new atomic helper functions for the virtual mode
and modifies the existing atomic helpers for usage by the vblank mode
This gives us two sets of drm_crtc_helper_funcs struct for both modes,
making the code flow cleaner and easier to debug.

This patchset has been tested with the igt tests, kms_writeback, kms_atomic,
kms_lease, kms_flip, kms_pipe_get_crc and preserves results except for
subtests related to crc reads and skips tests that rely on vertical
blanking. This patchset must be tested after incorporating the
igt-tests patch: https://lists.freedesktop.org/archives/igt-dev/2021-February/029355.html .

Sumera Priyadarsini (2):
  drm/vkms: Add support for virtual hardware mode
  drm/vkms: Add crtc atomic helper functions for virtual mode

 drivers/gpu/drm/vkms/vkms_composer.c | 88 +++++++++++++++++-----------
 drivers/gpu/drm/vkms/vkms_crtc.c     | 45 ++++++++++----
 drivers/gpu/drm/vkms/vkms_drv.c      | 18 ++++--
 drivers/gpu/drm/vkms/vkms_drv.h      |  4 ++
 4 files changed, 106 insertions(+), 49 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
