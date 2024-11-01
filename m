Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E4B9B9A0B
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 22:18:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40EE910EA08;
	Fri,  1 Nov 2024 21:18:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="D8by3Dpj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com
 [209.85.128.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4958F10EA08
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 21:18:44 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id
 00721157ae682-6e7fb84f99cso51840247b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2024 14:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1730495923; x=1731100723;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=ge6tq0CykQ0JdTcvuQi+p1TgzlbFfZoJPBWTv3905dE=;
 b=D8by3DpjUZC8jjay0wYMdDTJLMV2uQNxej5ea795EbRqxvlrgP7Cl3OQdDQL+qlAnt
 yFjtOSbLxTyYsoLdcCNC8Ot3oYhjE2oYtMyMpw1Tsn4hTTNQ3PjyTx10USc8INw8zCfK
 02s35H8Ci4QDSAf9f1giUw4WdsZfDq9zSiHFg8DjXe5rlfQb8+LydiVdazqaBPDdUTng
 R6QRINENFpFeuZaptfC1vEoTivvh9baVaA/hDPKtKg5eSQcI9GDPEuWBG0TY5CQmCQHN
 zfOviqxPKgqUseY6ZoXGwD9MBWuJXI5uOTlRNvA8tPapjJOkOSYQquRHwGAxNBViHHVL
 zRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730495923; x=1731100723;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ge6tq0CykQ0JdTcvuQi+p1TgzlbFfZoJPBWTv3905dE=;
 b=kVTXyxenU9lqEwPia8E/tEvNW7WwB/fj2D0FM+cRt2FVok787hh8k+eH8N0c9zMmY8
 FFH88RmohOXMTYldRlzqk/CGpfIfKrZ4FgxraUf9TTLsSuRhA5Yfhxj9joNPYvW/UhaD
 6ud2kp4/4BMA3K4zwLTpEz4WIbRw4YJjTD1pMKL+x4WtPrLLZvbbCeowL7ILtcDcaorz
 sWRG+GsRTnrMjvrhGMXajZD307V1insvOelwlEhaStm9rn3CBWu3lOPm3XdNFrcvWesT
 z42lLhulZj0ZFjOAszsxvZh9NOYcNGW126TDkqbTgzecDMEWuid8w7gpVHQOag64BEtZ
 ImDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMroljPi7lp4SJrymrZcs1dTr08OeYMcNEvbXrLuvp50jSGvsfEqYt2LVpC+8UheKjHuGhzwUkGDw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw986Cbr4QcZizrFrc5V6CnERfDBXswfPxj/vrhw2fBoIcwdqUT
 7SZA3+UnI9ytPwQCXM9MImkavET0CdHQzlUVWNad/W/TnYXS1H6b9GFtcjHhmJGQkL2T8d/p90M
 s1ecTqQ==
X-Google-Smtp-Source: AGHT+IE/8CzI7i3EySC0vIuva6sxGxU1mgLMmC415LORgd6XesninyBQ7kr/kIBLxbPUm8vOr/8ZTo08y5s7
X-Received: from irogers.svl.corp.google.com
 ([2620:15c:2c5:11:f2e6:5ab5:a95f:35cb])
 (user=irogers job=sendgmr) by 2002:a25:dcd3:0:b0:e28:f231:1aa8 with SMTP id
 3f1490d57ef6-e3087a416d3mr103176276.2.1730495923359; Fri, 01 Nov 2024
 14:18:43 -0700 (PDT)
Date: Fri,  1 Nov 2024 14:18:30 -0700
In-Reply-To: <20241101211830.1298073-1-irogers@google.com>
Message-Id: <20241101211830.1298073-4-irogers@google.com>
Mime-Version: 1.0
References: <20241101211830.1298073-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
Subject: [PATCH v4 4/4] proc_pid_fdinfo.5: Add DRM subsection
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

Signed-off-by: Ian Rogers <irogers@google.com>
---
 man/man5/proc_pid_fdinfo.5 | 94 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/man/man5/proc_pid_fdinfo.5 b/man/man5/proc_pid_fdinfo.5
index b7efde8f4..bcaf33817 100644
--- a/man/man5/proc_pid_fdinfo.5
+++ b/man/man5/proc_pid_fdinfo.5
@@ -300,6 +300,100 @@ fields contain the values that
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
+.IR drm-driver: " .+  (mandatory)"
+The name this driver registered.
+.TP
+.IR drm-pdev: " <aaaa:bb:cc.d>"
+For PCI devices this should contain the PCI slot address of the device
+in question.
+.TP
+.IR drm-client-id: " [0-9]+"
+Unique value relating to the open DRM file descriptor used to
+distinguish duplicated and shared file descriptors.
+.P
+GPUs usually contain multiple execution engines. Each shall be given a
+stable and unique name (<engine_name>), with possible values
+documented in the driver specific documentation.
+.TP
+.IR drm-engine-<engine_name>: " [0-9]+ ns"
+GPU engine utilization, time spent busy executing workloads for this client.
+.TP
+.IR drm-engine-capacity-<engine_name>: " [0-9]+"
+Capacity of the engine if not 1, cannot be 0.
+.TP
+.IR drm-cycles-<engine_name>: " [0-9]+"
+Contains the number of busy cycles for the given engine.  Values are
+not required to be constantly monotonic, but are required to catch up
+with the previously reported larger value within a reasonable
+period. Upon observing a value lower than what was previously read,
+userspace is expected to stay with that larger previous value until a
+monotonic update is seen.
+.TP
+.IR drm-total-cycles-<engine_name>: " [0-9]+"
+Contains the total number cycles for the given engine.  This is a
+timestamp in GPU unspecified unit that matches the update rate of
+drm-cycles-<engine_name>. For drivers that implement this interface,
+the engine utilization can be calculated entirely on the GPU clock
+domain, without considering the CPU sleep time between 2 samples.
+.P
+Each possible memory type which can be used to store buffer objects by
+the GPU in question shall be given a stable and unique name <region>.
+The name "memory" is reserved to refer to normal system memory.
+.TP
+.IR drm-memory-<region>: " [0-9]+ [KiB|MiB]"
+The amount of storage currently consumed by the buffer objects belong
+to this client, in the respective memory region.
+.IP
+Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
+indicating kibi- or mebi-bytes.
+.TP
+.IR drm-shared-<region>: " [0-9]+ [KiB|MiB]"
+The total size of buffers that are shared with another file (e.g., have more
+than a single handle).
+.TP
+.IR drm-total-<region>: " [0-9]+ [KiB|MiB]"
+The total size of buffers that including shared and private memory.
+.TP
+.IR drm-resident-<region>: " [0-9]+ [KiB|MiB]"
+The total size of buffers that are resident in the specified region.
+.TP
+.IR drm-purgeable-<region>: " [0-9]+ [KiB|MiB]"
+The total size of buffers that are purgeable.
+.TP
+.IR drm-active-<region>: " [0-9]+ [KiB|MiB]"
+The total size of buffers that are active on one or more engines.
+
 .SH HISTORY
 Since Linux 2.6.22.
 .SH SEE ALSO
-- 
2.47.0.199.ga7371fff76-goog

