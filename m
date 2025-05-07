Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAD6AAD1DD
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 02:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C9710E0F1;
	Wed,  7 May 2025 00:10:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="N5OemeHS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com
 [209.85.216.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7E210E068
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 00:10:42 +0000 (UTC)
Received: by mail-pj1-f73.google.com with SMTP id
 98e67ed59e1d1-306b590faaeso4465090a91.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 May 2025 17:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1746576642; x=1747181442;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XbM0hT4nN9Qi5ds4e0j9GLdbgAxkWG3cIrhqKGc4+Co=;
 b=N5OemeHSChn82g3I6cKBD51smIUCk+kUH8F6P4srKRpVn3d/aPhmcawnNE1DelYeF4
 p8tG3aCIisYN6VedxIAhr0y8DCzw48hbp1MVoF5Rrq3OkczBODvPEAWMAnkCmhwtBXtL
 uCx3hm1VFeD3myuPQXDLEpCahQJFhtQ0Z1LMeO7meCITNvOU9T1F7FB6KUUJ0MItwgT1
 98ru1i54uItqi97P26RD1xURlRtGClrr757rGyIooLsqQxOS34QXXakYescZUopxrX8z
 x3ml7WMjy/BPZMdq3x/ConoO0bMaHRzjGgYvQ+J0uim8f0jGYa8JrrbYce9zRQVZm117
 CrLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746576642; x=1747181442;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XbM0hT4nN9Qi5ds4e0j9GLdbgAxkWG3cIrhqKGc4+Co=;
 b=TmfKTKo3I5B8MX9R3uM6SGuKuCUS1PhFcivsWCOCBSLUuj0zVKIoZIvEvpGSgfOBSs
 ElplEBCRobCC9cGRo+34stg+WyzcKJO8rLgdbBTVfrE4HIYzj2Yic3ja/QK0EknRhNg2
 7SIPHz6xAg77cz6WPjdOt+bqzVf8wHNxBC9zDPNK6178kCTdOhLqZeNEbnu5x7cfR1gm
 hPkImwdoyTLNTE3OnSvMjGeWUKfqu4QnE1wwMJAbNhpKIWqPN64mKHBdt1eQ7DSN3qIm
 8HDI+QjB2B6nhKzTVferLWY0QN1GJlA2rdU9g5N+mCYeoqBMCgGb+ApH9YYzcjTmECr2
 30lA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWU8AwkpqR5WqiXprLrm6dviG2fvKy4cL5kDf3kg8+sCVhAQtR0bBV3rCKipLN9jvWKOg/DZWzHuUI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6eUDS/Umz0tvOAX4TGO2SZvcnN5A1ossyK0VB3AJuYfx68Eg0
 F1Ci4wHu+GMOea35fMzjuWVJnePQdqqogcWELlPviGoGh5atNQc2pfn4Dcg9vU60IAAm0OkBjqR
 Ad4utrsHBIZv38A==
X-Google-Smtp-Source: AGHT+IGgh9HyAs9Nj/w00VjUmiwsbbsyaNDbuDxCtSFIr9y5AQvyC41+3cohLwHox+GxYYqlbWOuGxl6mDGD8Sc=
X-Received: from pjbpt3.prod.google.com ([2002:a17:90b:3d03:b0:2fa:15aa:4d1e])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3d8c:b0:2ee:e317:69ab with SMTP id
 98e67ed59e1d1-30aabf6f73emr2662572a91.0.1746576642184; 
 Tue, 06 May 2025 17:10:42 -0700 (PDT)
Date: Wed,  7 May 2025 00:10:31 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <20250507001036.2278781-1-tjmercier@google.com>
Subject: [PATCH bpf-next v3 0/5] Replace CONFIG_DMABUF_SYSFS_STATS with BPF
From: "T.J. Mercier" <tjmercier@google.com>
To: sumit.semwal@linaro.org, christian.koenig@amd.com, ast@kernel.org, 
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
 skhan@linuxfoundation.org, alexei.starovoitov@gmail.com, song@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, android-mm@google.com, 
 simona@ffwll.ch, eddyz87@gmail.com, yonghong.song@linux.dev, 
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

T.J. Mercier (5):
  dma-buf: Rename debugfs symbols
  bpf: Add dmabuf iterator
  bpf: Add open coded dmabuf iterator
  selftests/bpf: Add test for dmabuf_iter
  selftests/bpf: Add test for open coded dmabuf_iter

 drivers/dma-buf/dma-buf.c                     |  94 +++++--
 include/linux/dma-buf.h                       |   5 +-
 kernel/bpf/Makefile                           |   3 +
 kernel/bpf/dmabuf_iter.c                      | 149 ++++++++++
 kernel/bpf/helpers.c                          |   5 +
 .../testing/selftests/bpf/bpf_experimental.h  |   5 +
 tools/testing/selftests/bpf/config            |   3 +
 .../selftests/bpf/prog_tests/dmabuf_iter.c    | 258 ++++++++++++++++++
 .../testing/selftests/bpf/progs/dmabuf_iter.c |  91 ++++++
 9 files changed, 591 insertions(+), 22 deletions(-)
 create mode 100644 kernel/bpf/dmabuf_iter.c
 create mode 100644 tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
 create mode 100644 tools/testing/selftests/bpf/progs/dmabuf_iter.c


base-commit: 43745d11bfd9683abdf08ad7a5cc403d6a9ffd15
--=20
2.49.0.1045.g170613ef41-goog

