Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47ACB3FE03A
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 18:42:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D05C36E207;
	Wed,  1 Sep 2021 16:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB436E207
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 16:42:14 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id x4so24914pgh.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Sep 2021 09:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=1rGeijHq8WZgg+lrwUTnmHa7aiFWRXgtn3qY3995sgA=;
 b=ceTE2ch8NNIa92TZhOHa1RRLewscF9g9GuxKxhL/HkPP7v7lfazyZalGElcYWHyX9L
 zAMevYtcQFRsaaiTb8orLn2cb5q5FY233/uKgTK9xzzgCZHY+IT42xhC6VfDiXCGq45M
 TwZ039c9Xox2GO6CQxzGJbJP+xwC9ODaIxW+Pp1KfaQO2A/IYM1P2SpMtaCrCLzddmKD
 5gW+s3ZFtM+k5MED5VHduMvDDol05Hp/rp/IbjbCaATy5I4tXMjiXLAn8TUWSTX4D2VI
 md3b4zLELgvS5pMOG9aTMG8gkQ9VRiDelRnhHlDBS1J6o9UPE17rz27mVB/qsW4dOCRi
 eq1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=1rGeijHq8WZgg+lrwUTnmHa7aiFWRXgtn3qY3995sgA=;
 b=Q1pV0wdALxpFErf/8/AAThX6xXmxLCSGcRSx7UOFoj8HID/2KtWJnkqJ5VWCferXrx
 5pQXVcnalYUbOR3q5xUQoN9zRZOE1ljTqHoGUo/0BWTREkBzt0i6fNhWBdyyd4mrZCsw
 gZh+0cx0NqU+igsS5SR2PE7SeTPZaDqH+ltu6g0iz+HH0oJvGe59QpFOU2TcHnpuPN8D
 3Kv2wgiBEaLECwxOUsPHGTHj/mhg875wq/92BZS2EAgrcrQ0uPZDrJdGWYYHkxSoUg9x
 Kn/kRS9a98oSCqltIvcmEn2kPgzkWc6GeoJLmPmba1j0fJawlTDwnOs0v1NgS/zDIlqQ
 0VHw==
X-Gm-Message-State: AOAM531TQxnU5a21Ov1yKKen8HLjna58BdlHvV8ei7PIkKwkBbcCfPmp
 TXl6PNsgXwT5296fmQWGfh8=
X-Google-Smtp-Source: ABdhPJxywaujLQLOBCM9G/jjnxtpahJPwLQrm88Lz/Rb+Tb6db2w7Gq7LNrwMSgxW5S+aVGIhtBNbw==
X-Received: by 2002:aa7:800b:0:b029:330:455f:57a8 with SMTP id
 j11-20020aa7800b0000b0290330455f57a8mr363476pfi.7.1630514534105; 
 Wed, 01 Sep 2021 09:42:14 -0700 (PDT)
Received: from adolin ([49.207.225.208])
 by smtp.gmail.com with ESMTPSA id cm17sm79295pjb.35.2021.09.01.09.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 09:42:13 -0700 (PDT)
Date: Wed, 1 Sep 2021 22:10:49 +0530
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
To: melissa.srw@gmail.com
Cc: rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH V6 0/2] drm/vkms: Add virtual hardware module
Message-ID: <cover.1630512292.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset adds support for emulating virtual hardware with VKMS.
The virtual hardware mode can be enabled by using the following command
while loading the module:
        sudo modprobe vkms enable_virtual_hw=1

The first patch is prep work for adding virtual_hw mode and refactors
the plane composition in vkms by adding a helper function
vkms_composer_common() which can be used for both vblank mode
and virtual mode.

The second patch adds virtual hardware support as a module option.
It adds new atomic helper functions for the virtual mode
and uses the existing atomic helpers for vblank mode
This gives us two sets of drm_crtc_funcs and drm_crtc_helper_funcs
structs for both modes, making the code flow cleaner and
easier to debug.

This patchset has been tested with the igt tests- kms_writeback, kms_atomic,
kms_lease, kms_flip, kms_pipe_get_crc and preserves results except for
subtests related to crc reads and vertical blanking, in which case,
tests are skipped.

Sumera Priyadarsini (2):
  drm/vkms: Refactor vkms_composer_worker() to prep for virtual_hw mode
  drm/vkms: Add support for virtual hardware mode

 drivers/gpu/drm/vkms/vkms_composer.c  | 92 +++++++++++++++++----------
 drivers/gpu/drm/vkms/vkms_crtc.c      | 43 ++++++++++++-
 drivers/gpu/drm/vkms/vkms_drv.c       | 16 +++--
 drivers/gpu/drm/vkms/vkms_drv.h       |  4 ++
 drivers/gpu/drm/vkms/vkms_writeback.c |  3 +-
 5 files changed, 117 insertions(+), 41 deletions(-)

-- 
2.31.1

