Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79357AC172A
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 01:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8710410E74A;
	Thu, 22 May 2025 23:04:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="jgnJNfR8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com
 [209.85.216.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4925210E2B1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 23:04:46 +0000 (UTC)
Received: by mail-pj1-f74.google.com with SMTP id
 98e67ed59e1d1-310a3196132so1765349a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 16:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1747955086; x=1748559886;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=0IbPgqyIKkPyz8iyW5Xf7yTEYr1WSE1NWdF6MzBIozo=;
 b=jgnJNfR8dCb1HmNBsBpKGZggkUo4lK38pJXR4c78sjg6TP6h+p/8AwfbcOShcVqg5w
 Av6QL7CCOnVcCeWJU0MA3APiP+XvXCVVJQN16a96/DBVpe6ohNBlfCRHQzMNHKcK6d3N
 5xi3MvizAXK084pKiYRjPQ5iPOmdB9btxVHGqjX5NsNzd73mLWN8rZol2I5ztNvMugEM
 vCUSou3tmtJRo597qeLTu0BH8sFY4VJ+qvjqg/2wUNQSEzTd/5b0xP/JcFVewifg4CtA
 WQqhN9x+1VfvUUiOrnu1E9l51pjw26ICpn8y1r6RG3VKgkdiO5fHWMqFIWKutbWSytnR
 Zy0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747955086; x=1748559886;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=0IbPgqyIKkPyz8iyW5Xf7yTEYr1WSE1NWdF6MzBIozo=;
 b=fXuW6fb4Z3ZFA7RRoIZJDBXYtSHVCCucSnq7gFk+jwQmzgavH0V7BwXmGqvoebuHYD
 R2lNfIXc+DhIiT1Jbwq8GG26cMGbQQFd/CB2xmQJrgrzCIv2Al7kLdsGweigXIcfdWUU
 8zE6b4SpNP3/bWIyGiovgXGF/wYYQ4ExZa69nC61UlMv5BGYxV53s75q7KXyLTQS0+6I
 menTuXM/0bpOWgzSrjuGH3OXMkuXKKAV9fz28AXH/PH0ZDdclarhNQ0iEYGn+uhH09Ie
 C2u9k2eej0Hbhy5pCoblslExkZhHUzERUos2YSIptPcwibf/h2WovyH/KDk/nFa6EbTo
 VrQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXle/tbH/RWeSDyyNoqFJ8N88/SCx2UquYpqfypXwzNQUAzeCsF6TaCzb/zUg624Uq9k+bd6GviFiA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxtyko4D9JyJTQfkUueCqXPh4e4Ld046f/0zzWoOxjtCdRq17i1
 VdCgRVIQ30AMGwbvwtFCONrbU1+RrjdQ2DZaU6mtog0eSr1AVpbR1/5ZQ9WBp7rmEL0scMcHxOA
 B7CYWyvFHbZMi9+SRiA==
X-Google-Smtp-Source: AGHT+IGBbkcmAxIKetdsAsLuSwZuoYiYYChXp69PreWM063tL20B86lUtH6JAK6TnQPVzUNqlsIoqwpnOz7FBI0=
X-Received: from pjbsd11.prod.google.com ([2002:a17:90b:514b:b0:30a:2095:204b])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1a88:b0:310:99bd:3ba8 with SMTP id
 98e67ed59e1d1-310e97403cemr1454737a91.33.1747955085829; 
 Thu, 22 May 2025 16:04:45 -0700 (PDT)
Date: Thu, 22 May 2025 23:04:28 +0000
In-Reply-To: <20250522230429.941193-1-tjmercier@google.com>
Mime-Version: 1.0
References: <20250522230429.941193-1-tjmercier@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522230429.941193-5-tjmercier@google.com>
Subject: [PATCH bpf-next v7 4/5] selftests/bpf: Add test for dmabuf_iter
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

This test creates a udmabuf, and a dmabuf from the system dmabuf heap,
and uses a BPF program that prints dmabuf metadata with the new
dmabuf_iter to verify they can be found.

Signed-off-by: T.J. Mercier <tjmercier@google.com>
Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
Acked-by: Song Liu <song@kernel.org>
---
 tools/testing/selftests/bpf/config            |   3 +
 .../selftests/bpf/prog_tests/dmabuf_iter.c    | 244 ++++++++++++++++++
 .../testing/selftests/bpf/progs/dmabuf_iter.c |  53 ++++
 3 files changed, 300 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
 create mode 100644 tools/testing/selftests/bpf/progs/dmabuf_iter.c

diff --git a/tools/testing/selftests/bpf/config b/tools/testing/selftests/b=
pf/config
index c378d5d07e02..2bdff2f3285f 100644
--- a/tools/testing/selftests/bpf/config
+++ b/tools/testing/selftests/bpf/config
@@ -22,6 +22,8 @@ CONFIG_CRYPTO_AES=3Dy
 CONFIG_DEBUG_INFO=3Dy
 CONFIG_DEBUG_INFO_BTF=3Dy
 CONFIG_DEBUG_INFO_DWARF4=3Dy
+CONFIG_DMABUF_HEAPS=3Dy
+CONFIG_DMABUF_HEAPS_SYSTEM=3Dy
 CONFIG_DUMMY=3Dy
 CONFIG_DYNAMIC_FTRACE=3Dy
 CONFIG_FPROBE=3Dy
@@ -106,6 +108,7 @@ CONFIG_SECURITY=3Dy
 CONFIG_SECURITYFS=3Dy
 CONFIG_SYN_COOKIES=3Dy
 CONFIG_TEST_BPF=3Dm
+CONFIG_UDMABUF=3Dy
 CONFIG_USERFAULTFD=3Dy
 CONFIG_VSOCKETS=3Dy
 CONFIG_VXLAN=3Dy
diff --git a/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c b/tools/t=
esting/selftests/bpf/prog_tests/dmabuf_iter.c
new file mode 100644
index 000000000000..dc740bd0e2bd
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
@@ -0,0 +1,244 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2025 Google */
+
+#include <test_progs.h>
+#include <bpf/libbpf.h>
+#include <bpf/btf.h>
+#include "dmabuf_iter.skel.h"
+
+#include <fcntl.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+#include <unistd.h>
+
+#include <linux/dma-buf.h>
+#include <linux/dma-heap.h>
+#include <linux/udmabuf.h>
+
+static int udmabuf =3D -1;
+static const char udmabuf_test_buffer_name[DMA_BUF_NAME_LEN] =3D "udmabuf_=
test_buffer_for_iter";
+static size_t udmabuf_test_buffer_size;
+static int sysheap_dmabuf =3D -1;
+static const char sysheap_test_buffer_name[DMA_BUF_NAME_LEN] =3D "sysheap_=
test_buffer_for_iter";
+static size_t sysheap_test_buffer_size;
+
+static int create_udmabuf(void)
+{
+	struct udmabuf_create create;
+	int dev_udmabuf, memfd, local_udmabuf;
+
+	udmabuf_test_buffer_size =3D 10 * getpagesize();
+
+	if (!ASSERT_LE(sizeof(udmabuf_test_buffer_name), DMA_BUF_NAME_LEN, "NAMET=
OOLONG"))
+		return -1;
+
+	memfd =3D memfd_create("memfd_test", MFD_ALLOW_SEALING);
+	if (!ASSERT_OK_FD(memfd, "memfd_create"))
+		return -1;
+
+	if (!ASSERT_OK(ftruncate(memfd, udmabuf_test_buffer_size), "ftruncate"))
+		goto close_memfd;
+
+	if (!ASSERT_OK(fcntl(memfd, F_ADD_SEALS, F_SEAL_SHRINK), "seal"))
+		goto close_memfd;
+
+	dev_udmabuf =3D open("/dev/udmabuf", O_RDONLY);
+	if (!ASSERT_OK_FD(dev_udmabuf, "open udmabuf"))
+		goto close_memfd;
+
+	memset(&create, 0, sizeof(create));
+	create.memfd =3D memfd;
+	create.flags =3D UDMABUF_FLAGS_CLOEXEC;
+	create.offset =3D 0;
+	create.size =3D udmabuf_test_buffer_size;
+
+	local_udmabuf =3D ioctl(dev_udmabuf, UDMABUF_CREATE, &create);
+	close(dev_udmabuf);
+	if (!ASSERT_OK_FD(local_udmabuf, "udmabuf_create"))
+		goto close_memfd;
+
+	if (!ASSERT_OK(ioctl(local_udmabuf, DMA_BUF_SET_NAME_B, udmabuf_test_buff=
er_name), "name"))
+		goto close_udmabuf;
+
+	return local_udmabuf;
+
+close_udmabuf:
+	close(local_udmabuf);
+close_memfd:
+	close(memfd);
+	return -1;
+}
+
+static int create_sys_heap_dmabuf(void)
+{
+	sysheap_test_buffer_size =3D 20 * getpagesize();
+
+	struct dma_heap_allocation_data data =3D {
+		.len =3D sysheap_test_buffer_size,
+		.fd =3D 0,
+		.fd_flags =3D O_RDWR | O_CLOEXEC,
+		.heap_flags =3D 0,
+	};
+	int heap_fd, ret;
+
+	if (!ASSERT_LE(sizeof(sysheap_test_buffer_name), DMA_BUF_NAME_LEN, "NAMET=
OOLONG"))
+		return -1;
+
+	heap_fd =3D open("/dev/dma_heap/system", O_RDONLY);
+	if (!ASSERT_OK_FD(heap_fd, "open dma heap"))
+		return -1;
+
+	ret =3D ioctl(heap_fd, DMA_HEAP_IOCTL_ALLOC, &data);
+	close(heap_fd);
+	if (!ASSERT_OK(ret, "syheap alloc"))
+		return -1;
+
+	if (!ASSERT_OK(ioctl(data.fd, DMA_BUF_SET_NAME_B, sysheap_test_buffer_nam=
e), "name"))
+		goto close_sysheap_dmabuf;
+
+	return data.fd;
+
+close_sysheap_dmabuf:
+	close(data.fd);
+	return -1;
+}
+
+static int create_test_buffers(void)
+{
+	udmabuf =3D create_udmabuf();
+	sysheap_dmabuf =3D create_sys_heap_dmabuf();
+
+	if (udmabuf < 0 || sysheap_dmabuf < 0)
+		return -1;
+
+	return 0;
+}
+
+static void destroy_test_buffers(void)
+{
+	close(udmabuf);
+	udmabuf =3D -1;
+
+	close(sysheap_dmabuf);
+	sysheap_dmabuf =3D -1;
+}
+
+enum Fields { INODE, SIZE, NAME, EXPORTER, FIELD_COUNT };
+struct DmabufInfo {
+	unsigned long inode;
+	unsigned long size;
+	char name[DMA_BUF_NAME_LEN];
+	char exporter[32];
+};
+
+static bool check_dmabuf_info(const struct DmabufInfo *bufinfo,
+			      unsigned long size,
+			      const char *name, const char *exporter)
+{
+	return size =3D=3D bufinfo->size &&
+	       !strcmp(name, bufinfo->name) &&
+	       !strcmp(exporter, bufinfo->exporter);
+}
+
+static void subtest_dmabuf_iter_check_no_infinite_reads(struct dmabuf_iter=
 *skel)
+{
+	int iter_fd;
+	char buf[256];
+
+	iter_fd =3D bpf_iter_create(bpf_link__fd(skel->links.dmabuf_collector));
+	if (!ASSERT_OK_FD(iter_fd, "iter_create"))
+		return;
+
+	while (read(iter_fd, buf, sizeof(buf)) > 0)
+		; /* Read out all contents */
+
+	/* Next reads should return 0 */
+	ASSERT_EQ(read(iter_fd, buf, sizeof(buf)), 0, "read");
+
+	close(iter_fd);
+}
+
+static void subtest_dmabuf_iter_check_default_iter(struct dmabuf_iter *ske=
l)
+{
+	bool found_test_sysheap_dmabuf =3D false;
+	bool found_test_udmabuf =3D false;
+	struct DmabufInfo bufinfo;
+	size_t linesize =3D 0;
+	char *line =3D NULL;
+	FILE *iter_file;
+	int iter_fd, f =3D INODE;
+
+	iter_fd =3D bpf_iter_create(bpf_link__fd(skel->links.dmabuf_collector));
+	if (!ASSERT_OK_FD(iter_fd, "iter_create"))
+		return;
+
+	iter_file =3D fdopen(iter_fd, "r");
+	if (!ASSERT_OK_PTR(iter_file, "fdopen"))
+		goto close_iter_fd;
+
+	while (getline(&line, &linesize, iter_file) !=3D -1) {
+		if (f % FIELD_COUNT =3D=3D INODE) {
+			ASSERT_EQ(sscanf(line, "%ld", &bufinfo.inode), 1,
+				  "read inode");
+		} else if (f % FIELD_COUNT =3D=3D SIZE) {
+			ASSERT_EQ(sscanf(line, "%ld", &bufinfo.size), 1,
+				  "read size");
+		} else if (f % FIELD_COUNT =3D=3D NAME) {
+			ASSERT_EQ(sscanf(line, "%s", bufinfo.name), 1,
+				  "read name");
+		} else if (f % FIELD_COUNT =3D=3D EXPORTER) {
+			ASSERT_EQ(sscanf(line, "%31s", bufinfo.exporter), 1,
+				  "read exporter");
+
+			if (check_dmabuf_info(&bufinfo,
+					      sysheap_test_buffer_size,
+					      sysheap_test_buffer_name,
+					      "system"))
+				found_test_sysheap_dmabuf =3D true;
+			else if (check_dmabuf_info(&bufinfo,
+						   udmabuf_test_buffer_size,
+						   udmabuf_test_buffer_name,
+						   "udmabuf"))
+				found_test_udmabuf =3D true;
+		}
+		++f;
+	}
+
+	ASSERT_EQ(f % FIELD_COUNT, INODE, "number of fields");
+
+	ASSERT_TRUE(found_test_sysheap_dmabuf, "found_test_sysheap_dmabuf");
+	ASSERT_TRUE(found_test_udmabuf, "found_test_udmabuf");
+
+	free(line);
+	fclose(iter_file);
+close_iter_fd:
+	close(iter_fd);
+}
+
+void test_dmabuf_iter(void)
+{
+	struct dmabuf_iter *skel =3D NULL;
+
+	skel =3D dmabuf_iter__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "dmabuf_iter__open_and_load"))
+		return;
+
+	if (!ASSERT_OK(create_test_buffers(), "create_test_buffers"))
+		goto destroy;
+
+	if (!ASSERT_OK(dmabuf_iter__attach(skel), "skel_attach"))
+		goto destroy;
+
+	if (test__start_subtest("no_infinite_reads"))
+		subtest_dmabuf_iter_check_no_infinite_reads(skel);
+	if (test__start_subtest("default_iter"))
+		subtest_dmabuf_iter_check_default_iter(skel);
+
+destroy:
+	destroy_test_buffers();
+	dmabuf_iter__destroy(skel);
+}
diff --git a/tools/testing/selftests/bpf/progs/dmabuf_iter.c b/tools/testin=
g/selftests/bpf/progs/dmabuf_iter.c
new file mode 100644
index 000000000000..e53d7646d07a
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/dmabuf_iter.c
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2025 Google LLC */
+#include <vmlinux.h>
+#include <bpf/bpf_core_read.h>
+#include <bpf/bpf_helpers.h>
+
+/* From uapi/linux/dma-buf.h */
+#define DMA_BUF_NAME_LEN 32
+
+char _license[] SEC("license") =3D "GPL";
+
+/*
+ * Fields output by this iterator are delimited by newlines. Convert any
+ * newlines in user-provided printed strings to spaces.
+ */
+static void sanitize_string(char *src, size_t size)
+{
+	for (char *c =3D src; (size_t)(c - src) < size && *c; ++c)
+		if (*c =3D=3D '\n')
+			*c =3D ' ';
+}
+
+SEC("iter/dmabuf")
+int dmabuf_collector(struct bpf_iter__dmabuf *ctx)
+{
+	const struct dma_buf *dmabuf =3D ctx->dmabuf;
+	struct seq_file *seq =3D ctx->meta->seq;
+	unsigned long inode =3D 0;
+	size_t size;
+	const char *pname, *exporter;
+	char name[DMA_BUF_NAME_LEN] =3D {'\0'};
+
+	if (!dmabuf)
+		return 0;
+
+	if (BPF_CORE_READ_INTO(&inode, dmabuf, file, f_inode, i_ino) ||
+	    bpf_core_read(&size, sizeof(size), &dmabuf->size) ||
+	    bpf_core_read(&pname, sizeof(pname), &dmabuf->name) ||
+	    bpf_core_read(&exporter, sizeof(exporter), &dmabuf->exp_name))
+		return 1;
+
+	/* Buffers are not required to be named */
+	if (pname) {
+		if (bpf_probe_read_kernel(name, sizeof(name), pname))
+			return 1;
+
+		/* Name strings can be provided by userspace */
+		sanitize_string(name, sizeof(name));
+	}
+
+	BPF_SEQ_PRINTF(seq, "%lu\n%llu\n%s\n%s\n", inode, size, name, exporter);
+	return 0;
+}
--=20
2.49.0.1151.ga128411c76-goog

