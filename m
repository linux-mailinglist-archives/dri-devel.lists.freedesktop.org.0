Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 661B84358D2
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 05:10:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E7A6E3D8;
	Thu, 21 Oct 2021 03:10:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABFE26E3D8
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 03:10:30 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id f11so4620142pfc.12
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 20:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g2/c7kNr+L+bnQHj96ZSgBzYFVMm/OZQExWVf8I1Y2M=;
 b=Z19Rd530BAvTK0weosYJVHc/zeGfmqokpqX9UhreNfKZ87Mq6E0RYEPlQAY8RS3noN
 CDXXI1ywk5+1M6TZssdKnXj5muZfiP3e4ulEYlP5RpDxz3c4+KQK3pbVj+A4cKf7d3pF
 QX+6NmoByhrRZJzW80pcQ89V1FBRx9YASOF2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g2/c7kNr+L+bnQHj96ZSgBzYFVMm/OZQExWVf8I1Y2M=;
 b=Ag3BU+9HsBY3IJaKhYfiXE8cj81D+Lqcrq3KpTC2JFz085kUC+mRSqoUokTb//KMjf
 7Gpa/8j8/aquneXPs/FQGQEjweTCOkJ7IyhhElq/QYwsJ/ccMMNPqq/GMjwQx4AVytR2
 usl8z22wqmrAa+ObQb0K1BjRTwwaiaPLIA2OGGfJCI3tgMm1AJeZehXu0G+kIBRhBWai
 k4hJEEGFwfgZVygTc7AHh115Mb0foTAtu5d3eEbTUUgU7v3e8vrjSpQrzM39iJ/cZf9S
 mWaYvqrv3kWyhNIU68aYZS20vSx41XMzsf+JeevlYHDwzlrHIIGSIiHlbfQLP+Y9Oh2X
 KNzA==
X-Gm-Message-State: AOAM531TxLa0uwrsbfV48NNV6ph984cwpJL1u9eEFWWWh1jz6ktHRPl1
 zm1EuRFNi436G1nVezBZHb6SutsYfKsBXQ==
X-Google-Smtp-Source: ABdhPJx6FGN8cqPfcdDoPT5tcjnwysj8GS3uhz0Jrbg7J7PoF2TlKenqwA0x3boZggGw7sWJvMGtHA==
X-Received: by 2002:a05:6a00:2410:b0:409:5fbd:cb40 with SMTP id
 z16-20020a056a00241000b004095fbdcb40mr3188867pfh.8.1634785829892; 
 Wed, 20 Oct 2021 20:10:29 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:21a4:fcf9:f5bb:f740])
 by smtp.gmail.com with ESMTPSA id z1sm4016255pfh.150.2021.10.20.20.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 20:10:29 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: kaleshsingh@google.com,
	daniel@ffwll.ch,
	rostedt@goodmis.org
Subject: [RFC PATCH 0/8] GPU memory tracepoints
Date: Wed, 20 Oct 2021 20:10:19 -0700
Message-Id: <20211021031027.537-1-gurchetansingh@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is latest iteration of GPU memory tracepoints [1].

In the past, there were questions about the "big picture" of memory  
accounting [2], especially given related work on dma-buf heaps and DRM
cgroups [3].  Also, there was a desire for a non-driver specific solution.

The great news is the dma-buf heaps work as recently landed [4].  It uses
sys-fs and the plan is to use it in conjunction with the tracepoint
solution [5].  We're aiming for the GPU tracepoint to calculate totals
per DRM-instance (a proxy for per-process on Android) and per-DRM device.

The cgroups work looks terrific too and hopefully we can deduplicate code once
that's merged.  Though that's abit of an implementation detail, so long as
the "GPU tracepoints" +  "dma-buf heap stats" plan sounds good for Android.

This series modifies the GPU memory tracepoint API in a non-breaking fashion
(patch 1), and adds accounting via the GEM subsystem (patches 2 --> 7). Given
the multiple places where memory events happen, there's a bunch trace events
scattered in various places.  The hardest part is allocation, where each driver
has their own API.  If there's a better way, do say so.

The last patch is incomplete; we would like general feedback before proceeding
further.

[1] https://lore.kernel.org/lkml/20200302235044.59163-1-zzyiwei@google.com/
[2] https://lists.freedesktop.org/archives/dri-devel/2021-January/295120.html
[3] https://www.spinics.net/lists/cgroups/msg27867.html
[4] https://www.spinics.net/lists/linux-doc/msg97788.html
[5] https://source.android.com/devices/graphics/implement-dma-buf-gpu-mem

Gurchetan Singh (8):
  tracing/gpu: modify gpu_mem_total
  drm: add new tracepoint fields to drm_device and drm_file
  drm: add helper functions for gpu_mem_total and gpu_mem_instance
  drm: start using drm_gem_trace_gpu_mem_total
  drm: start using drm_gem_trace_gpu_mem_instance
  drm: track real and fake imports in drm_prime_member
  drm: trace memory import per DRM file
  drm: trace memory import per DRM device

 drivers/gpu/drm/Kconfig        |  1 +
 drivers/gpu/drm/drm_gem.c      | 65 +++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/drm_internal.h |  4 +--
 drivers/gpu/drm/drm_prime.c    | 22 +++++++++---
 include/drm/drm_device.h       | 16 +++++++++
 include/drm/drm_file.h         | 16 +++++++++
 include/drm/drm_gem.h          |  7 ++++
 include/trace/events/gpu_mem.h | 61 +++++++++++++++++++++----------
 8 files changed, 166 insertions(+), 26 deletions(-)

-- 
2.25.1

