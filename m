Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1997AC1726
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 01:05:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A8C10E753;
	Thu, 22 May 2025 23:04:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="NYpUziA0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com
 [209.85.216.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B0D10E74A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 23:04:47 +0000 (UTC)
Received: by mail-pj1-f74.google.com with SMTP id
 98e67ed59e1d1-3108d5156e8so3320322a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 16:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1747955087; x=1748559887;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=Sjvt2FSndoyzHpiTi00fqP3aNPbtMl1ng2ZPdHNNLQk=;
 b=NYpUziA0uU33/a5hPsg4wpy8RsBFcUiRPpc4patFXTHTHPULo6G/ijIB7bcWShHhT8
 osQnY80gBhN22d9P4enk1qg5nkfXEJmibcU5RlyYSExxYvCeUJLVbGu2cmEfy4rTfT1P
 NMXrbJ6Vas7wn/v8nhN82MFboOcqE2cXjtMeeZdA1yFgMqSrnyFQv+UhWUfrmxmLUvhY
 AK9g835vSIxrogXFvL7rTinknLDH2o8QAYvXcrLlXeLi7hkooD8KK2j42VLiOPapTd+V
 5ZOp2anIdqEoCe32A8BbFimFQowhF1DSyfY0GiEx+qd9nlKIs/m+3ZcJZ/u4frfVdAK6
 u5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747955087; x=1748559887;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Sjvt2FSndoyzHpiTi00fqP3aNPbtMl1ng2ZPdHNNLQk=;
 b=gUfFBFZBFgf+QgorsT4QjlVJTBh3zsxt8GOLiaxUZJfvzZKweSjBFsBrqg3Lc6U6bu
 5kG+C5ehkfBERN+2rO382pdpnAJ9xLg5g+skqaHulAgppoLTl4TlBr4q7qg6pbZ+q1dX
 V+lbK8SPxKcy9qC8COvKTkWdy0WjWhtGr7h4/A+UWfUNuoZvfFKvjVSuS3iJL7w5zKvO
 HNavrLqpDCyVRVN3lHN10F/SemB5DghZQFyN5t+lu72oWpnvyLsxsrVR3nESmBeK35O4
 ctgpVOESRkuZOqoDZP5n4vS4kHlTuTqx5D3rSH0H5G8RRnG2o3wjiZLAHgJk8hdZLhoK
 82LA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUavDSgHiuZmbvh8x1ooPFNCPcAmk+3rJd9MTTyN5vZEMD9QVw8pH/kcA5W4ZyiZ/PDDOAsnyN15zw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuCVGsq5qMISpWh4PQ3y35THvQSJisfzpwjQgvsL2FRt446T6W
 iNIseb3nXExac0wmkxal6aqG7q875SjLLyYNCDCdHRoV0ojEf5r6osgZMsYq2PYjBDV9+P6dduz
 qeHuEMMChfRc+0HKcJA==
X-Google-Smtp-Source: AGHT+IGmBEEC3D+iQhUBmXN1VONTwNdgdzLmg2mtljqXxgk37nf0oQytjH+Iy15NdK+asUPGlaAXITDgBdNduEE=
X-Received: from pjur12.prod.google.com ([2002:a17:90a:d40c:b0:2ff:4be0:c675])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1e01:b0:30c:540b:99e with SMTP id
 98e67ed59e1d1-310e96cbff2mr1317193a91.13.1747955087546; 
 Thu, 22 May 2025 16:04:47 -0700 (PDT)
Date: Thu, 22 May 2025 23:04:29 +0000
In-Reply-To: <20250522230429.941193-1-tjmercier@google.com>
Mime-Version: 1.0
References: <20250522230429.941193-1-tjmercier@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522230429.941193-6-tjmercier@google.com>
Subject: [PATCH bpf-next v7 5/5] selftests/bpf: Add test for open coded
 dmabuf_iter
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

Use the same test buffers as the traditional iterator and a new BPF map
to verify the test buffers can be found with the open coded dmabuf
iterator.

Signed-off-by: T.J. Mercier <tjmercier@google.com>
Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
Acked-by: Song Liu <song@kernel.org>
---
 .../testing/selftests/bpf/bpf_experimental.h  |  5 ++
 .../selftests/bpf/prog_tests/dmabuf_iter.c    | 41 ++++++++++++++++
 .../testing/selftests/bpf/progs/dmabuf_iter.c | 48 +++++++++++++++++++
 3 files changed, 94 insertions(+)

diff --git a/tools/testing/selftests/bpf/bpf_experimental.h b/tools/testing=
/selftests/bpf/bpf_experimental.h
index 6535c8ae3c46..5e512a1d09d1 100644
--- a/tools/testing/selftests/bpf/bpf_experimental.h
+++ b/tools/testing/selftests/bpf/bpf_experimental.h
@@ -591,4 +591,9 @@ extern int bpf_iter_kmem_cache_new(struct bpf_iter_kmem=
_cache *it) __weak __ksym
 extern struct kmem_cache *bpf_iter_kmem_cache_next(struct bpf_iter_kmem_ca=
che *it) __weak __ksym;
 extern void bpf_iter_kmem_cache_destroy(struct bpf_iter_kmem_cache *it) __=
weak __ksym;
=20
+struct bpf_iter_dmabuf;
+extern int bpf_iter_dmabuf_new(struct bpf_iter_dmabuf *it) __weak __ksym;
+extern struct dma_buf *bpf_iter_dmabuf_next(struct bpf_iter_dmabuf *it) __=
weak __ksym;
+extern void bpf_iter_dmabuf_destroy(struct bpf_iter_dmabuf *it) __weak __k=
sym;
+
 #endif
diff --git a/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c b/tools/t=
esting/selftests/bpf/prog_tests/dmabuf_iter.c
index dc740bd0e2bd..6c2b0c3dbcd8 100644
--- a/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
+++ b/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
@@ -219,14 +219,52 @@ static void subtest_dmabuf_iter_check_default_iter(st=
ruct dmabuf_iter *skel)
 	close(iter_fd);
 }
=20
+static void subtest_dmabuf_iter_check_open_coded(struct dmabuf_iter *skel,=
 int map_fd)
+{
+	LIBBPF_OPTS(bpf_test_run_opts, topts);
+	char key[DMA_BUF_NAME_LEN];
+	int err, fd;
+	bool found;
+
+	/* No need to attach it, just run it directly */
+	fd =3D bpf_program__fd(skel->progs.iter_dmabuf_for_each);
+
+	err =3D bpf_prog_test_run_opts(fd, &topts);
+	if (!ASSERT_OK(err, "test_run_opts err"))
+		return;
+	if (!ASSERT_OK(topts.retval, "test_run_opts retval"))
+		return;
+
+	if (!ASSERT_OK(bpf_map_get_next_key(map_fd, NULL, key), "get next key"))
+		return;
+
+	do {
+		ASSERT_OK(bpf_map_lookup_elem(map_fd, key, &found), "lookup");
+		ASSERT_TRUE(found, "found test buffer");
+	} while (bpf_map_get_next_key(map_fd, key, key));
+}
+
 void test_dmabuf_iter(void)
 {
 	struct dmabuf_iter *skel =3D NULL;
+	int map_fd;
+	const bool f =3D false;
=20
 	skel =3D dmabuf_iter__open_and_load();
 	if (!ASSERT_OK_PTR(skel, "dmabuf_iter__open_and_load"))
 		return;
=20
+	map_fd =3D bpf_map__fd(skel->maps.testbuf_hash);
+	if (!ASSERT_OK_FD(map_fd, "map_fd"))
+		goto destroy_skel;
+
+	if (!ASSERT_OK(bpf_map_update_elem(map_fd, udmabuf_test_buffer_name, &f, =
BPF_ANY),
+		       "insert udmabuf"))
+		goto destroy_skel;
+	if (!ASSERT_OK(bpf_map_update_elem(map_fd, sysheap_test_buffer_name, &f, =
BPF_ANY),
+		       "insert sysheap buffer"))
+		goto destroy_skel;
+
 	if (!ASSERT_OK(create_test_buffers(), "create_test_buffers"))
 		goto destroy;
=20
@@ -237,8 +275,11 @@ void test_dmabuf_iter(void)
 		subtest_dmabuf_iter_check_no_infinite_reads(skel);
 	if (test__start_subtest("default_iter"))
 		subtest_dmabuf_iter_check_default_iter(skel);
+	if (test__start_subtest("open_coded"))
+		subtest_dmabuf_iter_check_open_coded(skel, map_fd);
=20
 destroy:
 	destroy_test_buffers();
+destroy_skel:
 	dmabuf_iter__destroy(skel);
 }
diff --git a/tools/testing/selftests/bpf/progs/dmabuf_iter.c b/tools/testin=
g/selftests/bpf/progs/dmabuf_iter.c
index e53d7646d07a..13cdb11fdeb2 100644
--- a/tools/testing/selftests/bpf/progs/dmabuf_iter.c
+++ b/tools/testing/selftests/bpf/progs/dmabuf_iter.c
@@ -9,6 +9,13 @@
=20
 char _license[] SEC("license") =3D "GPL";
=20
+struct {
+	__uint(type, BPF_MAP_TYPE_HASH);
+	__uint(key_size, DMA_BUF_NAME_LEN);
+	__type(value, bool);
+	__uint(max_entries, 5);
+} testbuf_hash SEC(".maps");
+
 /*
  * Fields output by this iterator are delimited by newlines. Convert any
  * newlines in user-provided printed strings to spaces.
@@ -51,3 +58,44 @@ int dmabuf_collector(struct bpf_iter__dmabuf *ctx)
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
+		long len;
+		int i;
+
+		if (bpf_core_read(&pname, sizeof(pname), &d->name))
+			return 1;
+
+		/* Buffers are not required to be named */
+		if (!pname)
+			continue;
+
+		len =3D bpf_probe_read_kernel_str(name, sizeof(name), pname);
+		if (len < 0)
+			return 1;
+
+		/*
+		 * The entire name buffer is used as a map key.
+		 * Zeroize any uninitialized trailing bytes after the NUL.
+		 */
+		bpf_for(i, len, DMA_BUF_NAME_LEN)
+			name[i] =3D 0;
+
+		found =3D bpf_map_lookup_elem(&testbuf_hash, name);
+		if (found) {
+			bool t =3D true;
+
+			bpf_map_update_elem(&testbuf_hash, name, &t, BPF_EXIST);
+		}
+	}
+
+	return 0;
+}
--=20
2.49.0.1151.ga128411c76-goog

