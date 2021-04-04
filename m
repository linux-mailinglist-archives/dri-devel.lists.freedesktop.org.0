Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7FF35382C
	for <lists+dri-devel@lfdr.de>; Sun,  4 Apr 2021 15:10:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92BB86E4A1;
	Sun,  4 Apr 2021 13:10:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96EED6E4A1
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Apr 2021 13:10:12 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 q6-20020a17090a4306b02900c42a012202so4595878pjg.5
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Apr 2021 06:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=/of33qOjnEhY45uD1x/HAVtGTCodSVzYWgcg1uH37ss=;
 b=GGjHQuQk821BGc1xUvWgR8KKM5g2fcrC/69hMeb1RKziiCL4ZqJRmR4Ejp9HkTNgZQ
 gOylSgwjogyoTqDp/AikdqkE2Mdy9PENS9XNYzjMBZZ9MqISpkyH65IJGhK5UFn7Sdwz
 iRzC3syWjwCPACuni5MBx4XkozafIm1rHqyUGr2dQ0aHu7I8EMAkxI+P6dpuP86I1Djw
 6rX6JXOhGP4xrpoHLbfjMSfHa9sawrvXIMOsm2zmCUxv/wohrhYTvJQGGdfW39mf8B0V
 JumKVd5NGIJQ0In0TgE53C/z/s/ccYRRzSXHH7JoHtfQfGaxyn8k2gLNgOFjQ6CVpm/g
 PeTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=/of33qOjnEhY45uD1x/HAVtGTCodSVzYWgcg1uH37ss=;
 b=E+qP06ckhAcPjmxe7ljDXg/NnUxIYMr+QV0YVSWNlps368IZ39P/FKp6TqZMqnPPV0
 yWFg+WoS2b4wgw734U+J+BMuTmbshY3/76iEivMl9PAxVsDv/fOAyrJnrsE4xhfmJu21
 jMeuS7msY+t7p7ywfaWhlpymZU0S7cDYnBbLwnZiBGIlU0nyWcGuQJpm/cDg9O6CRlSv
 CpaUaXP80so0P72ZsQU2txY29fUmWY6qP2z+aRWCXjwne2BqOupyX0Y2AUuMfVUYRjx7
 2OC+TDjweLrx4qty/eb9qrEU4WIFy1xuhnrosh+O5aWXioj1LsSFcAEB/QA7x0YwuXD+
 ZCtg==
X-Gm-Message-State: AOAM532P1wUh8IFkBDM6BhJhwg2f4PXow1keCVD6IEGM2t6Y8nwNl9OC
 +3FaUoTRKl+zbH+Pwz9Z97s=
X-Google-Smtp-Source: ABdhPJxdUlBgl/WGy0d+ibbRpFm4MOUmQ8jTnB5/7hGYLMKMlRY+EI4M9/dsO2Jrkg2gM5pg25I9FA==
X-Received: by 2002:a17:902:7585:b029:e6:cc10:61fe with SMTP id
 j5-20020a1709027585b02900e6cc1061femr20072418pll.23.1617541812110; 
 Sun, 04 Apr 2021 06:10:12 -0700 (PDT)
Received: from adolin ([49.207.202.237])
 by smtp.gmail.com with ESMTPSA id i7sm12581945pgq.16.2021.04.04.06.10.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Apr 2021 06:10:11 -0700 (PDT)
Date: Sun, 4 Apr 2021 18:40:06 +0530
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
To: melissa.srw@gmail.com
Subject: [PATCH V3 0/2] Add virtual hardware module
Message-ID: <cover.1617539357.git.sylphrenadin@gmail.com>
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

The first patch is prep work for adding virtual_hw mode and refactors
the plane composition in vkms by adding a helper function vkms_composer_common()
which can be used for both vblank mode and virtual mode.

The second patch adds virtual hardware support as a module option. The
second patch adds new atomic helper functions for the virtual mode
and modifies the existing atomic helpers for usage by the vblank mode
This gives us two sets of drm_crtc_helper_funcs struct for both modes,
making the code flow cleaner and easier to debug.

This patchset has been tested with the igt tests, kms_writeback, kms_atomic,
kms_lease, kms_flip, kms_pipe_get_crc and preserves results except for
subtests related to crc reads and skips tests that rely on vertical
blanking. This patchset must be tested after incorporating the
igt-tests patch: https://lists.freedesktop.org/archives/igt-dev/2021-February/029355.html 

Sumera Priyadarsini (2):
  drm/vkms: Refactor vkms_composer_worker() to prep for virtual_hw mode
  drm/vkms: Add support for virtual hardware mode

 drivers/gpu/drm/vkms/vkms_composer.c | 88 +++++++++++++++++-----------
 drivers/gpu/drm/vkms/vkms_crtc.c     | 51 +++++++++++-----
 drivers/gpu/drm/vkms/vkms_drv.c      | 18 ++++--
 drivers/gpu/drm/vkms/vkms_drv.h      |  4 ++
 4 files changed, 109 insertions(+), 52 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
