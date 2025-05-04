Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 171A8AA89CC
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 00:42:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F5110E0EE;
	Sun,  4 May 2025 22:42:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="CdSZWVdU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com
 [209.85.210.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FFA210E0EE
 for <dri-devel@lists.freedesktop.org>; Sun,  4 May 2025 22:42:49 +0000 (UTC)
Received: by mail-pf1-f201.google.com with SMTP id
 d2e1a72fcca58-736cd36189bso5488743b3a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 04 May 2025 15:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1746398569; x=1747003369;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=YBA2Kzgyk4bRaSZtyL60XM7M/J6C1GLiTyhJYY1riEQ=;
 b=CdSZWVdUyjhXYjD2LgRC77zU4sdJMUSfKZ06qqVpFyEfQSnP9SeOdKBMDx0+VQ7QYO
 hhsXAIdEJJIrkDMBr9sgFbx4Act1z2vh86evMIciJGnjSIramFjB0r/xcGdt0QgCRVdR
 xEUHFdpYTAT1cnE1x7EJTfDDWIXNq0RTkkMIyawkxOnmt3/Hm02xtVjlKvlUkVdsab+F
 rWZ1UqjUdaUjWiymlKDipEf4ZMByWH4b6CPqJ8j21PRvTbaXQpKreH7UgHS2ViwGRFEC
 mWexzD/BDwxFUD8DS6D44q843UFOn8iPRPa3szhmuR3PzlLpFt8EyJeeiLGVDVSF3aIP
 4bfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746398569; x=1747003369;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YBA2Kzgyk4bRaSZtyL60XM7M/J6C1GLiTyhJYY1riEQ=;
 b=xNjcR6bqT06CvwlpGmWGxc5JpL2jevjzxoEFnpIxK/VBwDMZ6pkrrycMlAD5WyTY0D
 1/0VqCT1fQxQre/Er3chaT2/9IlLoOiXAjnePPS7uUHRz5U8hi527ZE8+pDWMZJVv/Ao
 1pNCEBgTGERXJ7qb6T0cBfhYbkqpT+JAPGg6BjNx2VxbNAyCOThFXZmKUMJaFzv3BDL6
 sBs8xnQYdxYZQh1+IRcOcQ35GPh6GcZqO370Agyc+hJyv7AJhLFbo+mSdTHFWT6ZIXCu
 NWJfw3dMOSz3sWQ8LGwv38K9AsbofHXblcRjxZitJlzNb1/faXbYQ2yjPL1ry+gy67fJ
 Tb3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6AoOEh7qCXmyhYq4J5Mg5dD82lptg12a2fowf1d+DJ/smySmzsEKPXmyWIhl1nKjbUFkSQ3443a4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyO0qgPRBJINk04wf0M1SHzBkQht8aOv68lCQf82atl4D+Fa4TX
 YjRpnSjr5WVJP7RA4VNuhv9m+HqWgn9QBPAj1GDPxyyejju1d0o3WyFqyltIaN/NwkjOzSY3k7g
 PqQDv3nsfWE4gzQ==
X-Google-Smtp-Source: AGHT+IHwC69ikkY91ynpNFFyqvrTik6HGGQvUacLwppW1SxT9OjOOg4YcjbpioypJWeEhmmdlWiBcniudgQmznA=
X-Received: from pfbki23.prod.google.com
 ([2002:a05:6a00:9497:b0:73d:b1c4:5d7f])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:1f0b:b0:736:5664:53f3 with SMTP id
 d2e1a72fcca58-7406f164bfbmr6106064b3a.15.1746398568940; 
 Sun, 04 May 2025 15:42:48 -0700 (PDT)
Date: Sun,  4 May 2025 22:41:41 +0000
In-Reply-To: <20250504224149.1033867-1-tjmercier@google.com>
Mime-Version: 1.0
References: <20250504224149.1033867-1-tjmercier@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250504224149.1033867-6-tjmercier@google.com>
Subject: [PATCH v2 5/6] selftests/bpf: Add test for open coded dmabuf_iter
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

Use the same test buffers as the traditional iterator and a new BPF map
to verify the test buffers can be found with the open coded dmabuf
iterator.

Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 .../testing/selftests/bpf/bpf_experimental.h  |  5 ++
 .../selftests/bpf/prog_tests/dmabuf_iter.c    | 52 +++++++++++++++----
 .../testing/selftests/bpf/progs/dmabuf_iter.c | 38 ++++++++++++++
 3 files changed, 86 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/bpf/bpf_experimental.h b/tools/testing/selftests/bpf/bpf_experimental.h
index 6535c8ae3c46..5e512a1d09d1 100644
--- a/tools/testing/selftests/bpf/bpf_experimental.h
+++ b/tools/testing/selftests/bpf/bpf_experimental.h
@@ -591,4 +591,9 @@ extern int bpf_iter_kmem_cache_new(struct bpf_iter_kmem_cache *it) __weak __ksym
 extern struct kmem_cache *bpf_iter_kmem_cache_next(struct bpf_iter_kmem_cache *it) __weak __ksym;
 extern void bpf_iter_kmem_cache_destroy(struct bpf_iter_kmem_cache *it) __weak __ksym;
 
+struct bpf_iter_dmabuf;
+extern int bpf_iter_dmabuf_new(struct bpf_iter_dmabuf *it) __weak __ksym;
+extern struct dma_buf *bpf_iter_dmabuf_next(struct bpf_iter_dmabuf *it) __weak __ksym;
+extern void bpf_iter_dmabuf_destroy(struct bpf_iter_dmabuf *it) __weak __ksym;
+
 #endif
diff --git a/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c b/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
index 35745f4ce0f8..cc02bb555610 100644
--- a/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
+++ b/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
@@ -26,10 +26,11 @@ static int sysheap_dmabuf;
 static const char sysheap_test_buffer_name[DMA_BUF_NAME_LEN] = "sysheap_test_buffer_for_iter";
 static size_t sysheap_test_buffer_size;
 
-static int create_udmabuf(void)
+static int create_udmabuf(int map_fd)
 {
 	struct udmabuf_create create;
 	int dev_udmabuf;
+	bool f = false;
 
 	udmabuf_test_buffer_size = 10 * getpagesize();
 
@@ -63,10 +64,10 @@ static int create_udmabuf(void)
 	if (!ASSERT_OK(ioctl(udmabuf, DMA_BUF_SET_NAME_B, udmabuf_test_buffer_name), "name"))
 		return 1;
 
-	return 0;
+	return bpf_map_update_elem(map_fd, udmabuf_test_buffer_name, &f, BPF_ANY);
 }
 
-static int create_sys_heap_dmabuf(void)
+static int create_sys_heap_dmabuf(int map_fd)
 {
 	sysheap_test_buffer_size = 20 * getpagesize();
 
@@ -77,6 +78,7 @@ static int create_sys_heap_dmabuf(void)
 		.heap_flags = 0,
 	};
 	int heap_fd, ret;
+	bool f = false;
 
 	if (!ASSERT_LE(sizeof(sysheap_test_buffer_name), DMA_BUF_NAME_LEN, "NAMETOOLONG"))
 		return 1;
@@ -95,18 +97,18 @@ static int create_sys_heap_dmabuf(void)
 	if (!ASSERT_OK(ioctl(sysheap_dmabuf, DMA_BUF_SET_NAME_B, sysheap_test_buffer_name), "name"))
 		return 1;
 
-	return 0;
+	return bpf_map_update_elem(map_fd, sysheap_test_buffer_name, &f, BPF_ANY);
 }
 
-static int create_test_buffers(void)
+static int create_test_buffers(int map_fd)
 {
 	int ret;
 
-	ret = create_udmabuf();
+	ret = create_udmabuf(map_fd);
 	if (ret)
 		return ret;
 
-	return create_sys_heap_dmabuf();
+	return create_sys_heap_dmabuf(map_fd);
 }
 
 static void destroy_test_buffers(void)
@@ -187,17 +189,46 @@ static void subtest_dmabuf_iter_check_default_iter(struct dmabuf_iter *skel)
 	close(iter_fd);
 }
 
+static void subtest_dmabuf_iter_check_open_coded(struct dmabuf_iter *skel, int map_fd)
+{
+	LIBBPF_OPTS(bpf_test_run_opts, topts);
+	char key[DMA_BUF_NAME_LEN];
+	int err, fd;
+	bool found;
+
+	/* No need to attach it, just run it directly */
+	fd = bpf_program__fd(skel->progs.iter_dmabuf_for_each);
+
+	err = bpf_prog_test_run_opts(fd, &topts);
+	if (!ASSERT_OK(err, "test_run_opts err"))
+		return;
+	if (!ASSERT_OK(topts.retval, "test_run_opts retval"))
+		return;
+
+	if (!ASSERT_OK(bpf_map_get_next_key(map_fd, NULL, key), "get next key"))
+		return;
+
+	do {
+		ASSERT_OK(bpf_map_lookup_elem(map_fd, key, &found), "lookup elem");
+		ASSERT_TRUE(found, "found test buffer");
+	} while (bpf_map_get_next_key(map_fd, key, key));
+}
+
 void test_dmabuf_iter(void)
 {
 	struct dmabuf_iter *skel = NULL;
+	int iter_fd, map_fd;
 	char buf[256];
-	int iter_fd;
 
 	skel = dmabuf_iter__open_and_load();
 	if (!ASSERT_OK_PTR(skel, "dmabuf_iter__open_and_load"))
 		return;
 
-	if (!ASSERT_OK(create_test_buffers(), "create_buffers"))
+	map_fd = bpf_map__fd(skel->maps.testbuf_hash);
+	if (!ASSERT_OK_FD(map_fd, "map_fd"))
+		goto destroy_skel;
+
+	if (!ASSERT_OK(create_test_buffers(map_fd), "create_buffers"))
 		goto destroy;
 
 	if (!ASSERT_OK(dmabuf_iter__attach(skel), "skel_attach"))
@@ -215,10 +246,13 @@ void test_dmabuf_iter(void)
 
 	if (test__start_subtest("default_iter"))
 		subtest_dmabuf_iter_check_default_iter(skel);
+	if (test__start_subtest("open_coded"))
+		subtest_dmabuf_iter_check_open_coded(skel, map_fd);
 
 	close(iter_fd);
 
 destroy:
 	destroy_test_buffers();
+destroy_skel:
 	dmabuf_iter__destroy(skel);
 }
diff --git a/tools/testing/selftests/bpf/progs/dmabuf_iter.c b/tools/testing/selftests/bpf/progs/dmabuf_iter.c
index 6e80a53c4670..030654ab5717 100644
--- a/tools/testing/selftests/bpf/progs/dmabuf_iter.c
+++ b/tools/testing/selftests/bpf/progs/dmabuf_iter.c
@@ -9,6 +9,13 @@
 
 char _license[] SEC("license") = "GPL";
 
+struct {
+	__uint(type, BPF_MAP_TYPE_HASH);
+	__uint(key_size, DMA_BUF_NAME_LEN);
+	__type(value, bool);
+	__uint(max_entries, 5);
+} testbuf_hash SEC(".maps");
+
 /**
  * Fields output by this iterator are delimited by newlines. Convert any
  * newlines in user-provided printed strings to spaces.
@@ -51,3 +58,34 @@ int dmabuf_collector(struct bpf_iter__dmabuf *ctx)
 	BPF_SEQ_PRINTF(seq, "%lu\n%llu\n%s\n%s\n", inode, size, name, exporter);
 	return 0;
 }
+
+SEC("syscall")
+int iter_dmabuf_for_each(const void *ctx)
+{
+	struct dma_buf *d;
+
+	bpf_for_each(dmabuf, d) {
+		char name[DMA_BUF_NAME_LEN];
+		const char *pname;
+		bool *found;
+
+		if (bpf_core_read(&pname, sizeof(pname), &d->name))
+			return 1;
+
+		/* Buffers are not required to be named */
+		if (!pname)
+			continue;
+
+		if (bpf_probe_read_kernel(name, sizeof(name), pname))
+			return 1;
+
+		found = bpf_map_lookup_elem(&testbuf_hash, name);
+		if (found) {
+			bool t = true;
+
+			bpf_map_update_elem(&testbuf_hash, name, &t, BPF_EXIST);
+		}
+	}
+
+	return 0;
+}
-- 
2.49.0.906.g1f30a19c02-goog

