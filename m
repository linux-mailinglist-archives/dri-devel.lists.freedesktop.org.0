Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5822199F5C0
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 20:38:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E4110E5ED;
	Tue, 15 Oct 2024 18:38:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="fdNnMuRU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com
 [209.85.219.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F24010E5ED
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 18:38:50 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id
 3f1490d57ef6-e28ef71f0d8so9200598276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 11:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1729017530; x=1729622330;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=gMeke42q77vKZdk9CqMaOeiApW1FFSuUHd/dD3slT+g=;
 b=fdNnMuRURl3NnLlgYyTakvusBCMn96lLGBJDLirU+/cRphDRxYBpEf0YIxxzrEFX0Z
 vpzE+Sie8mLhVKHJ1McfmzwNj6+S39XUBpMuX+lxc0BGGXP7854cgsd2GyeGLP57n3tZ
 dePKGh6I5k2C5C69ZDPo8UowFIrCSDOWFwXErmMk6lqGKhie+zYt5T1ir9WlDTulrnvf
 7nx6Z7ettap3BMbWLQbj7oIPTGP2oDuILXQfJruKt7gjct8DhVfVqnpr5y4neXoge+tm
 g82rlGku4cHXw6Qvj6+EJh8WVorw19MmC7d+lxe51WRuqSAqzjIMIC6Yp74H8bLJlQ0R
 zgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729017530; x=1729622330;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gMeke42q77vKZdk9CqMaOeiApW1FFSuUHd/dD3slT+g=;
 b=pS6mL6BkBxSjA1mpopKWIL076c03NDdKIqsc2PpwyfWBf4YCdnrYL8dKdcuBJ4wGSo
 A9Hi4uw4g5laeNd3JWs7B+vIenxQ+bJ2qNekYNh4iw3q9lmYdWBvLqEdolRdYc+BAyWJ
 QkCwGdYw6+QENNtAaE8afrf2ywBmaIpGFraQwxiUeMthhGrIWHlbFGwxkj60wjhG5t2T
 w0KKLkgCTwd3cct9NXZI1VhenOkC1CnK+cyJLSNFDjDVthURJFJY08azDR3pUV93gpmv
 AKK1M2xvD5gthmUW+iM/RtGyiLEAerawz+twUeA3bAdej5TblokvmAKgdDBFQVZgtPhO
 ymOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1E+ZA2o3ScJQwLT+onr5YfTBQbJPxqWXTWPrKlyHUT7mHkreiHfTuW9cD4/JX70/WJ0pDjT5nKhg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1a1Qvz6/Zy/H+nhtHnE+c84v9COR1SVgeFV2pmP/yTotzhJd/
 iYKepomNXyZ9TbDCxKDgJSvtohh90Hr4QcSVmW12cRurmR979kDa7qOXe8u+A1+5dLuAp/O9q6T
 setE+JQ==
X-Google-Smtp-Source: AGHT+IGETkEI/5EAubwwlNl50B+eFDsqD15jqw1peUq+N2xQNvJcU/MhNMYfdP+IJSFOGW9SBOZ45gGLwb1l
X-Received: from irogers.svl.corp.google.com
 ([2620:15c:2c5:11:61a1:4d9d:aca1:ada])
 (user=irogers job=sendgmr) by 2002:a25:aa09:0:b0:e29:74e3:616c with SMTP id
 3f1490d57ef6-e29782e9e9cmr600276.3.1729017529497; Tue, 15 Oct 2024 11:38:49
 -0700 (PDT)
Date: Tue, 15 Oct 2024 11:38:24 -0700
In-Reply-To: <20241015183824.1014964-1-irogers@google.com>
Message-Id: <20241015183824.1014964-3-irogers@google.com>
Mime-Version: 1.0
References: <20241015183824.1014964-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Subject: [PATCH v1 3/3] proc_pid_fdinfo.5: Add DRM subsection
From: Ian Rogers <irogers@google.com>
To: Alejandro Colomar <alx@kernel.org>
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
index 3f90f6bb5..76a2562e8 100644
--- a/man/man5/proc_pid_fdinfo.5
+++ b/man/man5/proc_pid_fdinfo.5
@@ -302,5 +302,99 @@ fields contain the values that
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
 .SH SEE ALSO
 .BR proc (5)
-- 
2.47.0.rc1.288.g06298d1525-goog

