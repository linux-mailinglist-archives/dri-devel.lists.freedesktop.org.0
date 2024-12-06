Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F399E680F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 08:38:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5826E10E5F4;
	Fri,  6 Dec 2024 07:38:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="EYVPpQo3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com
 [209.85.128.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5CC10E5F4
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 07:38:39 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id
 00721157ae682-6ef542990dbso20970987b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 23:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1733470719; x=1734075519;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=6tcWcwiswh578N5Sbvm8C5ZdbM+ZrqY2qCpqOjcQh4Y=;
 b=EYVPpQo3Mqpp+X586UXDunkOCwJyFWcizSPzhLJOhAABgP3lhdGdLtyMCL8IvAOTZp
 JDvt+gvEOMO2C8W9BMqzkO7tDv0/mQcnThO12IQz65c/ys48EenOst/ZcSV0IFlS+IVi
 FWJ4ZyUbswVYRAW3A8SwJYqLRaisvrGl1VtL197Hl0Hhnvz3/9AXefmC5mj6urfsUoPd
 LQln9CI7eL9tRYvbyBQ1OkO5+Xr8WI/+b5P+uw3FwkAsE6EsxHsxFGx6yrnzhP6AXF92
 BZCVgW0vkXavPDWwVlYD5oXJHA9bKie/f/MQvFbTx02TLFKA/uX6bkT7r6tmLtJ1tGUm
 qEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733470719; x=1734075519;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6tcWcwiswh578N5Sbvm8C5ZdbM+ZrqY2qCpqOjcQh4Y=;
 b=eo/Ez1vaGOKtdihdj6SUQA8wEB/rJOe42lhPl3QUxKtg1f+moAK6H1oQgIYsTUVIQM
 XlBtErChZ4vvXpx62YRx32DXemHnljN4TXNjSXQ0sizTRMDTZ42Q+H4HvakjQJUdlg7J
 6H8WvG5X0GgVXrSJp8CJF8ZT4vgRKZAYI/Dvx+2chAxKxA1bipG2uX4gB7TKzC4SU7Ib
 jSexUsNeWi6IGHuKvu4jD3heI2sZpil/RANwR59ws0xvDLMzlT/7hXboDkvCF/07i1OX
 9HfSb2Md610uMF64U+ltnMMXbfxrbBS+81rMnVKG2/8ciAW+/01s0y0lLiyPYVJespI8
 W13w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6bvaChdnv06h+q6fQLmPZ//W+v7/NnxOpStjpp1C9UEm3bEFsx5407UlZImkltWyrpYN7rFVo65A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/Ld7ozrD5kmYvoLzEovoKWAx64s/1hJescJMqKldz52rAknJ4
 G0gsvleWT01WqIn0bCaXgnu+AosQoq+giggFkE7Bv5Fj+A6osH8HzINigTSNgCNdPSbCZGBdoKl
 D8Gjmrg==
X-Google-Smtp-Source: AGHT+IHrVWBoiYYD/xmXDfRagPogDl7UXMcm4NMrSYV9vi8DJr6U4VViFkFNqaosBMt+/zmkxpKfltUluk4l
X-Received: from irogers.svl.corp.google.com
 ([2620:15c:2c5:11:bff4:a354:8911:79b3])
 (user=irogers job=sendgmr) by 2002:a05:690c:5a05:b0:6ee:c295:c76e with SMTP
 id 00721157ae682-6efe3c8f290mr8697b3.6.1733470718867; Thu, 05 Dec 2024
 23:38:38 -0800 (PST)
Date: Thu,  5 Dec 2024 23:38:28 -0800
In-Reply-To: <20241206073828.1119464-1-irogers@google.com>
Message-Id: <20241206073828.1119464-4-irogers@google.com>
Mime-Version: 1.0
References: <20241206073828.1119464-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Subject: [PATCH v5 4/4] proc_pid_fdinfo.5: Add DRM subsection
From: Ian Rogers <irogers@google.com>
To: Alejandro Colomar <alx@kernel.org>,
 "G . Branden Robinson" <g.branden.robinson@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-man@vger.kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
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

Add description of DRM fdinfo information based on the Linux kernel's
`Documentation/gpu/drm-usage-stats.rst`:
https://docs.kernel.org/gpu/drm-usage-stats.html
---
v5. Update style a suggested-by G. Branden Robinson
    <g.branden.robinson@gmail.com>
---
 man/man5/proc_pid_fdinfo.5 | 107 +++++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/man/man5/proc_pid_fdinfo.5 b/man/man5/proc_pid_fdinfo.5
index c4914f1f3..bb77ee9a7 100644
--- a/man/man5/proc_pid_fdinfo.5
+++ b/man/man5/proc_pid_fdinfo.5
@@ -300,6 +300,113 @@ fields contain the values that
 .BR timerfd_gettime (2)
 on this file descriptor would return.)
 .RE
+.SS Direct Rendering Manager
+.P
+DRM drivers can optionally choose to expose usage stats through
+/proc/pid/fdinfo/. For example:
+.P
+.in +4n
+.EX
+pos:    0
+flags:  02100002
+mnt_id: 26
+ino:    284
+drm-driver:     i915
+drm-client-id:  39
+drm-pdev:       0000:00:02.0
+drm-total-system0:      6044 KiB
+drm-shared-system0:     0
+drm-active-system0:     0
+drm-resident-system0:   6044 KiB
+drm-purgeable-system0:  1688 KiB
+drm-total-stolen-system0:       0
+drm-shared-stolen-system0:      0
+drm-active-stolen-system0:      0
+drm-resident-stolen-system0:    0
+drm-purgeable-stolen-system0:   0
+drm-engine-render:      346249 ns
+drm-engine-copy:        0 ns
+drm-engine-video:       0 ns
+drm-engine-capacity-video:      2
+drm-engine-video-enhance:       0 ns
+.EE
+.TP
+.BR drm\-driver: " .+  (mandatory)"
+The name this driver registered.
+.TP
+.BR drm\-pdev: " [0-9A-F]{4}:[0-9A-F]{2}:[0-9A-F]{2}.[0-9A-F]"
+For PCI devices this should contain the PCI slot address of the device
+in question.
+.TP
+.BR drm\-client-id: " [0-9]+"
+Unique value relating to the open DRM file descriptor used to
+distinguish duplicated and shared file descriptors.
+.P
+GPUs usually contain multiple execution engines. Each shall be given a
+stable and unique name
+.IR engine-name ,
+with possible values documented in the driver specific documentation.
+.TP
+.BI drm\-engine\- engine-name :\c
+\& [0-9]+ ns
+GPU engine utilization, time spent busy executing workloads for this client.
+.TP
+.BI drm\-engine\-capacity\- engine-name :\c
+\& [0-9]+
+Capacity of the engine if not 1, cannot be 0.
+.TP
+.BI drm\-cycles\- engine-name :\c
+\& [0-9]+
+Contains the number of busy cycles for the given engine.  Values are
+not required to be constantly monotonic, but are required to catch up
+with the previously reported larger value within a reasonable
+period. Upon observing a value lower than what was previously read,
+userspace is expected to stay with that larger previous value until a
+monotonic update is seen.
+.TP
+.BI drm\-total\-cycles\- engine-name :\c
+\& [0-9]+
+Contains the total number cycles for the given engine.  This is a
+timestamp in GPU unspecified unit that matches the update rate of
+drm\-cycles\-\fIengine-name\fP.
+For drivers that implement this interface,
+the engine utilization can be calculated entirely on the GPU clock
+domain, without considering the CPU sleep time between 2 samples.
+.P
+Each possible memory type which can be used to store buffer objects by
+the GPU in question shall be given a stable and unique name
+.IR region .
+The name "memory" is reserved to refer to normal system memory.
+.TP
+.BI drm\-memory\- region :\c
+\& [0-9]+ [KiB|MiB]
+The amount of storage currently consumed by the buffer objects belong
+to this client, in the respective memory region.
+.IP
+Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
+indicating kibi- or mebi-bytes.
+.TP
+.BI drm\-shared\- region :\c
+\& [0-9]+ [KiB|MiB]
+The total size of buffers that are shared with another file (e.g., have more
+than a single handle).
+.TP
+.BI drm\-total\- region :\c
+\& [0-9]+ [KiB|MiB]
+The total size of buffers that including shared and private memory.
+.TP
+.BI drm\-resident\- region :\c
+\& [0-9]+ [KiB|MiB]
+The total size of buffers that are resident in the specified region.
+.TP
+.BI drm\-purgeable\- region :\c
+\& [0-9]+ [KiB|MiB]
+The total size of buffers that are purgeable.
+.TP
+.BI drm\-active\- region :\c
+\& [0-9]+ [KiB|MiB]
+The total size of buffers that are active on one or more engines.
+
 .SH HISTORY
 Linux 2.6.22.
 .SH SEE ALSO
-- 
2.47.0.338.g60cca15819-goog

