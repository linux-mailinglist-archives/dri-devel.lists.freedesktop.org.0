Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5E0AA89C0
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 00:42:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D087E10E0B6;
	Sun,  4 May 2025 22:42:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Z08ugTcd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com
 [209.85.214.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B60A10E0B6
 for <dri-devel@lists.freedesktop.org>; Sun,  4 May 2025 22:42:24 +0000 (UTC)
Received: by mail-pl1-f202.google.com with SMTP id
 d9443c01a7336-22c31b55ac6so55692355ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 04 May 2025 15:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1746398544; x=1747003344;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
 bh=h2Ves7K5HSdZ8gJm7O2bxGfv8D+1P/iEs4NcrGFZQAU=;
 b=Z08ugTcd+m6IfE/XqmDxFC/KK6KZH66i5bvz2YBGs1LcErcd020Vvf6MdtIXWRyvaV
 opxvOkYvZyjWRpEpIXdmuy2ByT8NYvZ1zfhcjSmTqgFefvht1ennvuQoqNtvZjPwlLOb
 WT9Qmo0gEKKhedAQQpk+vyrFKpTiVlmgTj4S1OmHyom/FlWFngm50N+JGfpRnY5vvkrd
 uCjJ/pN+/wpaHMmxQLGgknrkGVwnI5qWhNfg+oOCS4y0JRyHng5VTtoUeChart91YpqB
 +ZOrCTyb44God6cnbydnNWkQMhx8XE9p2LciHyweVFaITXxHYcPvKx2pvq/rL3ZmUS7i
 rZjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746398544; x=1747003344;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h2Ves7K5HSdZ8gJm7O2bxGfv8D+1P/iEs4NcrGFZQAU=;
 b=vh2GtIWNwsTnXB8k9U6R1ztcq6AduT8n3qcS1WzDe8tFpy1PqGtNf7pwKltlZhOYqu
 ZmwSGT2hrtZpctY7wFnPIaVpzILhaoyhmvTfZUycviOT2pecv9PE7uDTBPRbNPkEozLJ
 QDr5pN1E/VzUQC98D3DWf0BT47Y17Ww5Vn2nW6/xBaPeWNJRi34gDL2di+C5P8Zorsf8
 1N3219nfEPzvGYM4phyqc1pOk9JQo4wEYW1M9sYJTBC0AnNldwrbS1zb0ZTEtxDEnh9N
 ++5T8aKcdMOBiTPsfYG2J3ERbUfIVbaHU2Unji9Dohz9yTA13+nos7HzEcK/rV4paIOI
 0Dtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2Q+TaaeKzet2CJoNy17L7S15jbMJARqXt1LC11sPOO6TBi04jtYkJprDzyDIAlfszS5vW2VBJV7Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yze3Lrd8WiL2+n2S5eJHVE+SgDTbFcmjsyb8ipzPFqZC1m6l2bj
 hUsjzzbKp7XVYqJZAH76Jqk7Y2ZnGRA6xyEiEQ8GQY6/qtMxg6v2USlyyrc3yLdKK8ss5MgH/jQ
 DflZEt5m37Er+hQ==
X-Google-Smtp-Source: AGHT+IG3s83AHDeqTtbeNWFu9VJHl3WJY2PIPoEJXseXQ3szKVonPVO7le0fvgXadvoDti/xd87e1NfGDxlroAA=
X-Received: from plbmk14.prod.google.com ([2002:a17:903:2bce:b0:21f:4f0a:c7e2])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2350:b0:220:d078:eb33 with SMTP id
 d9443c01a7336-22e18c0dda7mr103753045ad.36.1746398543674; 
 Sun, 04 May 2025 15:42:23 -0700 (PDT)
Date: Sun,  4 May 2025 22:41:36 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250504224149.1033867-1-tjmercier@google.com>
Subject: [PATCH v2 0/6] Replace CONFIG_DMABUF_SYSFS_STATS with BPF
From: "T.J. Mercier" <tjmercier@google.com>
To: sumit.semwal@linaro.org, christian.koenig@amd.com, ast@kernel.org, 
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
 skhan@linuxfoundation.org, song@kernel.org, alexei.starovoitov@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, android-mm@google.com, simona@ffwll.ch, 
 corbet@lwn.net, eddyz87@gmail.com, yonghong.song@linux.dev, 
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
 jolsa@kernel.org, mykolal@fb.com, "T.J. Mercier" <tjmercier@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Until CONFIG_DMABUF_SYSFS_STATS was added [1] it was only possible to
perform per-buffer accounting with debugfs which is not suitable for
production environments. Eventually we discovered the overhead with
per-buffer sysfs file creation/removal was significantly impacting
allocation and free times, and exacerbated kernfs lock contention. [2]
dma_buf_stats_setup() is responsible for 39% of single-page buffer
creation duration, or 74% of single-page dma_buf_export() duration when
stressing dmabuf allocations and frees.

I prototyped a change from per-buffer to per-exporter statistics with a
RCU protected list of exporter allocations that accommodates most (but
not all) of our use-cases and avoids almost all of the sysfs overhead.
While that adds less overhead than per-buffer sysfs, and less even than
the maintenance of the dmabuf debugfs_list, it's still *additional*
overhead on top of the debugfs_list and doesn't give us per-buffer info.

This series uses the existing dmabuf debugfs_list to implement a BPF
dmabuf iterator, which adds no overhead to buffer allocation/free and
provides per-buffer info. The list has been moved outside of
CONFIG_DEBUG_FS scope so that it is always populated. The BPF program
loaded by userspace that extracts per-buffer information gets to define
its own interface which avoids the lack of ABI stability with debugfs.

As this is a replacement for our use of CONFIG_DMABUF_SYSFS_STATS, the
last patch is a RFC for removing it from the kernel. Please see my
suggestion there regarding the timeline for that.

[1] https://lore.kernel.org/linux-media/20201210044400.1080308-1-hridya@goo=
gle.com
[2] https://lore.kernel.org/all/20220516171315.2400578-1-tjmercier@google.c=
om

v1: https://lore.kernel.org/all/20250414225227.3642618-1-tjmercier@google.c=
om

v1 -> v2:
Make the DMA buffer list independent of CONFIG_DEBUG_FS per Christian K=C3=
=B6nig
Add CONFIG_DMA_SHARED_BUFFER check to kernel/bpf/Makefile per kernel test r=
obot
Use BTF_ID_LIST_SINGLE instead of BTF_ID_LIST_GLOBAL_SINGLE per Song Liu
Fixup comment style, mixing code/declarations, and use ASSERT_OK_FD in self=
test per Song Liu
Add BPF_ITER_RESCHED feature to bpf_dmabuf_reg_info per Alexei Starovoitov
Add open-coded iterator and selftest per Alexei Starovoitov
Add a second test buffer from the system dmabuf heap to selftests
Use the BPF program we'll use in production for selftest per Alexei Starovo=
itov
  https://r.android.com/c/platform/system/bpfprogs/+/3616123/2/dmabufIter.c
  https://r.android.com/c/platform/system/memory/libmeminfo/+/3614259/1/lib=
dmabufinfo/dmabuf_bpf_stats.cpp

T.J. Mercier (6):
  dma-buf: Rename and expose debugfs symbols
  bpf: Add dmabuf iterator
  bpf: Add open coded dmabuf iterator
  selftests/bpf: Add test for dmabuf_iter
  selftests/bpf: Add test for open coded dmabuf_iter
  RFC: dma-buf: Remove DMA-BUF statistics

 .../ABI/testing/sysfs-kernel-dmabuf-buffers   |  24 --
 Documentation/driver-api/dma-buf.rst          |   5 -
 drivers/dma-buf/Kconfig                       |  15 -
 drivers/dma-buf/Makefile                      |   1 -
 drivers/dma-buf/dma-buf-sysfs-stats.c         | 202 --------------
 drivers/dma-buf/dma-buf-sysfs-stats.h         |  35 ---
 drivers/dma-buf/dma-buf.c                     |  58 +---
 include/linux/dma-buf.h                       |   6 +-
 kernel/bpf/Makefile                           |   3 +
 kernel/bpf/dmabuf_iter.c                      | 177 ++++++++++++
 kernel/bpf/helpers.c                          |   5 +
 .../testing/selftests/bpf/bpf_experimental.h  |   5 +
 tools/testing/selftests/bpf/config            |   3 +
 .../selftests/bpf/prog_tests/dmabuf_iter.c    | 258 ++++++++++++++++++
 .../testing/selftests/bpf/progs/dmabuf_iter.c |  91 ++++++
 15 files changed, 561 insertions(+), 327 deletions(-)
 delete mode 100644 Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
 delete mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.c
 delete mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.h
 create mode 100644 kernel/bpf/dmabuf_iter.c
 create mode 100644 tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
 create mode 100644 tools/testing/selftests/bpf/progs/dmabuf_iter.c


base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
--=20
2.49.0.906.g1f30a19c02-goog

