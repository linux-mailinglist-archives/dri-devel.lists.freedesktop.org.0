Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8076145721
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 14:52:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E10B66F522;
	Wed, 22 Jan 2020 13:52:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A5776F4F3;
 Wed, 22 Jan 2020 12:57:59 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id d16so7132408wre.10;
 Wed, 22 Jan 2020 04:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=dHe7Uw+KSQ7ok647ZtHPz0AWKdV1HTTdLE26ujWRi0w=;
 b=koNXw/fT1qXhYi99gvLLfGHaOWJ4X1GLHcgnLo9AxrzAfEViIa/hCr7L6NeuWZo5T/
 k4rypq+YXhFGuwzzpAGg3Ujn2z6F496kr3xEIlHOPXPj7dcdZVALQ/kddUmvmgCQcqxq
 L9goGVzim1hyzMKrL4/IHLztZuQXq0/73x2c1udUm3jp1uZ/s4bgWLCs6KTX418aJ1Up
 lOwgKfmoXxAPXNIHyN+3211Bqgwng1g+dQFsqYWoUIdk1FUWfjWBQnEpjwAzGJFTdZ2Z
 KMcax1aBYDczdVF5FUv3vGb1sN8PJzLW4biyzSHVlRQjch1l9mbv7j+lwa8t9ALvtPkT
 mxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=dHe7Uw+KSQ7ok647ZtHPz0AWKdV1HTTdLE26ujWRi0w=;
 b=lnjXXsSd2I6kD82nwDF1P2zynHmcHzUilLrkIjJ9UxC4sBDBHZ920b3E0/+Z6qsM5c
 S0y5jwsBSSsGUC2/Pep+ShCmHnF7lkLyEV5VvEepYTGKBTHqiacD59mGPEoGhJTeWwP8
 l+eJcEtR8DVxYv3Hgbzq0kdX6unTnd13K3/u+zWFB1u8iouozmoOF8iBGvwQd3L7nkwe
 olF2I2KvYD8SWZBsGCA0mRTTA2XK7LIuqOmzJLnxXm8y4o82FrNJ3CS6mHYuDAGAvvJn
 vmO09IUJgnwBIRPO9YJ2KJMAxJZFSYEZMYiSbccmkoeTO/sjH+vlW1xPjN2EfMfkOJNz
 /CYw==
X-Gm-Message-State: APjAAAWKXjJHI/1eov3UWo/r1MUFYJLxM2w7LIN41H/ml80fS9wqF6O4
 kJW9EtXqUWGaFIxXVos072M=
X-Google-Smtp-Source: APXvYqzMqFi2hCE+U3hNwqDJ7/7SDjvjEEzqZ07PGG/u5ER2xBAIr7LZfUSYrSk12fCbB95BymfZEA==
X-Received: by 2002:adf:a41c:: with SMTP id d28mr11659150wra.410.1579697878272; 
 Wed, 22 Jan 2020 04:57:58 -0800 (PST)
Received: from localhost.localdomain ([197.254.95.38])
 by smtp.googlemail.com with ESMTPSA id p26sm3736109wmc.24.2020.01.22.04.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 04:57:57 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] drm/i915/gem: conversion to new drm logging macros
Date: Wed, 22 Jan 2020 15:57:48 +0300
Message-Id: <20200122125750.9737-1-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 22 Jan 2020 13:52:23 +0000
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series is a part of the conversion to  the new struct drm_device
based logging macros in drm/i915.
This series focuses on the drm/i915/gem directory and converts all
straightforward instances of the printk based logging macros to the new
macros.

Wambui Karuga (2):
  drm/i915/gem: initial conversion to new logging macros using
    coccinelle.
  drm/i915/gem: manual conversion to struct drm_device logging macros.

 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 68 +++++++++++--------
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 60 +++++++++-------
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     |  4 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    | 56 ++++++++-------
 4 files changed, 110 insertions(+), 78 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
