Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E1EAC1724
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 01:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B9410E182;
	Thu, 22 May 2025 23:04:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="veMZmlFL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com
 [209.85.216.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F1F10E2B1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 23:04:42 +0000 (UTC)
Received: by mail-pj1-f73.google.com with SMTP id
 98e67ed59e1d1-30ed0017688so4728643a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 16:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1747955079; x=1748559879;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
 bh=u8dGj0Abdvh7XPjbZNccc6ABk5KSqfYP94dRpsBQEFQ=;
 b=veMZmlFL4j9hJHVt4PSS6QavQfgNszysbYluGqZI326xWtBZZ/vtEZJHaD1m0ucKye
 zlSyNfzjZWQ84Asux9elhGakq2RDzFUiX2gytEont7p2uHAsnM8iqsKLXGSMxi6DFkCZ
 xcTf/ZeuSNAFKHQRq9Hb2OId7nflcgRMU3ohOPtWd/yVIo4M/MHkMU5ugzFAi+DCJxpZ
 QH0DIv3UjRqZsjFyq1TT3i6tvZPuYadoKlaFQARy4jarhsIcsSjG+GfT0oHRU/6Z9wrw
 To53cDUuzJWR7fCXuhQzLkRBGc55wd4SvTRZ0CTDXnMXJSAYS5lV/k7rB46vGTMEY6tc
 idSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747955079; x=1748559879;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u8dGj0Abdvh7XPjbZNccc6ABk5KSqfYP94dRpsBQEFQ=;
 b=etyY4uPx0kwJIAQ8E0Ko5S2Jld8sowxxv15z3PQgGn4pRFR7S70Hc+JSQ86vdXqMS2
 SSrWZsOk1RhjkbTZ79WSfByoXX6V5zpW5Qe1lUpIU1xq5qinZ0JWeeGx8j6EYIgKX51g
 rQrgsdGRgedpDTeTrRCIIYGEQoZnYZ6vuojC2LCHYUHMZw0cGG0lVTHuAOX5PgI2LuFm
 GnK/K1c7V2gzR0SRJEybFTshp7b3Cn6jO1lKXgafuSqbaHSn4ipQRbuqaEME9y+O9XtC
 08QsXdqbAwXX/rUWtKbZWq6QInyLzUAp15bpxnIbYyfS9HyXparBxwj/to4tVoGjYQno
 mQJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYOapSjPMqdnuTXZpFBkfnfmenqXyFQ+wkRh5C+4vWPUQXQHekWfIUx8UFCpZR+FRcNGuS4UIlwuM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjkgrTPu1v3Fw896WgnFXWOD/HP8OiOCFtYuJGJqEPG9bd/nw2
 0JbvzQLD/jTrGLP7/kKYmzXznH3eCtMI4vKr6oEw0wuA+mkfE9d5ZkCbuXNY3ZkF2NFV/Kb5I8O
 GgXR+Bgk5ArlfnOkQSw==
X-Google-Smtp-Source: AGHT+IEwmzIUT8YGStliPU77KEwWDLWWSMW6VUWezx0zqgoWVOlibiGqHVnAaZczx2UCmbfZm6yPSMlECmgJUJ0=
X-Received: from pjbsi6.prod.google.com ([2002:a17:90b:5286:b0:2fc:1158:9fe5])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3806:b0:308:5273:4dee with SMTP id
 98e67ed59e1d1-310e96e2ed3mr1380738a91.15.1747955078942; 
 Thu, 22 May 2025 16:04:38 -0700 (PDT)
Date: Thu, 22 May 2025 23:04:24 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522230429.941193-1-tjmercier@google.com>
Subject: [PATCH bpf-next v7 0/5] Replace CONFIG_DMABUF_SYSFS_STATS with BPF
From: "T.J. Mercier" <tjmercier@google.com>
To: sumit.semwal@linaro.org, christian.koenig@amd.com, ast@kernel.org, 
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
 skhan@linuxfoundation.org, alexei.starovoitov@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, android-mm@google.com, 
 simona@ffwll.ch, eddyz87@gmail.com, yonghong.song@linux.dev, 
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
 jolsa@kernel.org, mykolal@fb.com, shuah@kernel.org, song@kernel.org, 
 "T.J. Mercier" <tjmercier@google.com>
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

This will allow us to replace our use of CONFIG_DMABUF_SYSFS_STATS, and
the plan is to remove it from the kernel after the next longterm stable
release.

[1] https://lore.kernel.org/linux-media/20201210044400.1080308-1-hridya@goo=
gle.com
[2] https://lore.kernel.org/all/20220516171315.2400578-1-tjmercier@google.c=
om

v1: https://lore.kernel.org/all/20250414225227.3642618-1-tjmercier@google.c=
om
v1 -> v2:
Make the DMA buffer list independent of CONFIG_DEBUG_FS per Christian
  K=C3=B6nig
Add CONFIG_DMA_SHARED_BUFFER check to kernel/bpf/Makefile per kernel
  test robot
Use BTF_ID_LIST_SINGLE instead of BTF_ID_LIST_GLOBAL_SINGLE per Song Liu
Fixup comment style, mixing code/declarations, and use ASSERT_OK_FD in
  selftest per Song Liu
Add BPF_ITER_RESCHED feature to bpf_dmabuf_reg_info per Alexei
  Starovoitov
Add open-coded iterator and selftest per Alexei Starovoitov
Add a second test buffer from the system dmabuf heap to selftests
Use the BPF program we'll use in production for selftest per Alexei
  Starovoitov
  https://r.android.com/c/platform/system/bpfprogs/+/3616123/2/dmabufIter.c
  https://r.android.com/c/platform/system/memory/libmeminfo/+/3614259/1/lib=
dmabufinfo/dmabuf_bpf_stats.cpp
v2: https://lore.kernel.org/all/20250504224149.1033867-1-tjmercier@google.c=
om
v2 -> v3:
Rebase onto bpf-next/master
Move get_next_dmabuf() into drivers/dma-buf/dma-buf.c, along with the
  new get_first_dmabuf(). This avoids having to expose the dmabuf list
  and mutex to the rest of the kernel, and keeps the dmabuf mutex
  operations near each other in the same file. (Christian K=C3=B6nig)
Add Christian's RB to dma-buf: Rename debugfs symbols
Drop RFC: dma-buf: Remove DMA-BUF statistics
v3: https://lore.kernel.org/all/20250507001036.2278781-1-tjmercier@google.c=
om
v3 -> v4:
Fix selftest BPF program comment style (not kdoc) per Alexei Starovoitov
Fix dma-buf.c kdoc comment style per Alexei Starovoitov
Rename get_first_dmabuf / get_next_dmabuf to dma_buf_iter_begin /
  dma_buf_iter_next per Christian K=C3=B6nig
Add Christian's RB to bpf: Add dmabuf iterator
v4: https://lore.kernel.org/all/20250508182025.2961555-1-tjmercier@google.c=
om
v4 -> v5:
Add Christian's Acks to all patches
Add Song Liu's Acks
Move BTF_ID_LIST_SINGLE and DEFINE_BPF_ITER_FUNC closer to usage per
  Song Liu
Fix open-coded iterator comment style per Song Liu
Move iterator termination check to its own subtest per Song Liu
Rework selftest buffer creation per Song Liu
Fix spacing in sanitize_string per BPF CI
v5: https://lore.kernel.org/all/20250512174036.266796-1-tjmercier@google.co=
m
v5 -> v6:
Song Liu:
  Init test buffer FDs to -1
  Zero-init udmabuf_create for future proofing
  Bail early for iterator fd/FILE creation failure
  Dereference char ptr to check for NUL in sanitize_string()
  Move map insertion from create_test_buffers() to test_dmabuf_iter()
  Add ACK to selftests/bpf: Add test for open coded dmabuf_iter
v6: https://lore.kernel.org/all/20250513163601.812317-1-tjmercier@google.co=
m
v6 -> v7:
Zero uninitialized name bytes following the end of name strings per
  s390x BPF CI
Reorder sanitize_string bounds checks per Song Liu
Add Song's Ack to: selftests/bpf: Add test for dmabuf_iter
Rebase onto bpf-next/master per BPF CI

T.J. Mercier (5):
  dma-buf: Rename debugfs symbols
  bpf: Add dmabuf iterator
  bpf: Add open coded dmabuf iterator
  selftests/bpf: Add test for dmabuf_iter
  selftests/bpf: Add test for open coded dmabuf_iter

 drivers/dma-buf/dma-buf.c                     |  98 ++++--
 include/linux/dma-buf.h                       |   4 +-
 kernel/bpf/Makefile                           |   3 +
 kernel/bpf/dmabuf_iter.c                      | 150 +++++++++
 kernel/bpf/helpers.c                          |   5 +
 .../testing/selftests/bpf/bpf_experimental.h  |   5 +
 tools/testing/selftests/bpf/config            |   3 +
 .../selftests/bpf/prog_tests/dmabuf_iter.c    | 285 ++++++++++++++++++
 .../testing/selftests/bpf/progs/dmabuf_iter.c | 101 +++++++
 9 files changed, 632 insertions(+), 22 deletions(-)
 create mode 100644 kernel/bpf/dmabuf_iter.c
 create mode 100644 tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
 create mode 100644 tools/testing/selftests/bpf/progs/dmabuf_iter.c


base-commit: 6888a036cfc3d617d0843ecc9bd8504e91fb9de6
--=20
2.49.0.1151.ga128411c76-goog

