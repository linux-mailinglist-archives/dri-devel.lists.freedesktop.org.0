Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 041BFCA2032
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 01:05:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CBFE10E82B;
	Thu,  4 Dec 2025 00:05:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="KlgTwobQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com
 [209.85.210.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 749EC10E162
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 00:05:27 +0000 (UTC)
Received: by mail-pf1-f201.google.com with SMTP id
 d2e1a72fcca58-7b9321b9312so667979b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 16:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1764806727; x=1765411527;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=ntEJ7gGn1a+C6xdaOK38Dw1hgtUSvuAfJEVchxv0EQk=;
 b=KlgTwobQKhHuw6l6cfyfQcsfIuJHF91OH0Y5nWXwYHdbkRfHsg40fh0KcYTJjhG1Lo
 k041w4ouRBLWe7znmgf3uUkyozAFCj0MQWJcCd+/H0Yj1/aLRAK2rEiyDRC2LUyCLBBB
 uMeN1vz0DV7aodZ78+dyITVheSfkMykh/fdtYDX+d7+FLW4uFZki+izcqwUei9BLanw5
 13ZZpnCcWMZjTDSDjefVGIwUgp1UCIrQegEhZA+Q1+C9HO8MWH0/jgvKnF+Xy+V56YD2
 rzPY9f7/j8DxB94g5FBktwTO1PnUL1C731hPHItTc30nO9h8DTsYT+FFguyxz+pghLiY
 p42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764806727; x=1765411527;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ntEJ7gGn1a+C6xdaOK38Dw1hgtUSvuAfJEVchxv0EQk=;
 b=P9ZCQp7M/4ricrxYMaEcI1xDwQeMe1cN57PZDdTldb5I7oFDdakxU+DO1MqW3Cev1+
 f9WGFXdkPVJC6grmY3sOVDTVXylBDls/SfMSWqftfln9zwivzOSrZbUiz373u2/qYrEL
 dsjlvtaEBh3r8l4H/lZLHnrc6FohsaPZEdsWGLiBQH8Djrn2A8I9rTs/KGTG3k/pSqok
 ZqOYRAFfTBnm1bnNgC9I+r3CtxTubIfi9luTLrd5l4vDA9SpGoe3guJww8LG74HHprk7
 KlFUUuFGP+0KZUZsE53bhAsU8iNWB8dDE019JZAfX7T9hnHQlDb779pDf6y3WKQQfj6c
 Ohkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6Ef9Q4vxVTOdFqfK2g2qtQRyFtVBgarVIZ2N5KtZ128ELLKvsHzLfN8mpVp3DPa9gl+B6oZEMSm8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzbz5HdLf5c+bToTWPjPY2Qtgydf8JoQyV+deUKhgI8kgnY9ZCS
 wmtwPVM9MhIqIBZnoSbZs2HyJHgiqFkmeGvmsCgIjSISIYiSiTpH4vI/lrpQxWNkwlR4PbEyB0Y
 zp9w04m1Tl9MBFkqMKQ==
X-Google-Smtp-Source: AGHT+IGanVIDs+7Y69ywHMHsNbcI0LEOaWi2CkaERYx1M22ypSftKd5oK/BkZTdgl+fJSBjubibGBoyAYRxfcc8=
X-Received: from pffa10.prod.google.com ([2002:a62:bd0a:0:b0:7dd:8bba:63ab])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:4615:b0:7aa:4f1d:c458 with SMTP id
 d2e1a72fcca58-7e00d236c39mr4941316b3a.19.1764806726792; 
 Wed, 03 Dec 2025 16:05:26 -0800 (PST)
Date: Wed,  3 Dec 2025 16:03:48 -0800
In-Reply-To: <20251204000348.1413593-1-tjmercier@google.com>
Mime-Version: 1.0
References: <20251204000348.1413593-1-tjmercier@google.com>
X-Mailer: git-send-email 2.52.0.177.g9f829587af-goog
Message-ID: <20251204000348.1413593-2-tjmercier@google.com>
Subject: [PATCH bpf 2/2] selftests/bpf: Add test for truncated dmabuf_iter
 reads
From: "T.J. Mercier" <tjmercier@google.com>
To: yonghong.song@linux.dev, ast@kernel.org, daniel@iogearbox.net, 
 andrii@kernel.org, martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org, 
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
 haoluo@google.com, jolsa@kernel.org, shuah@kernel.org, bpf@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 android-mm@google.com
Cc: christian.koenig@amd.com, sumit.semwal@linaro.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, "T.J. Mercier" <tjmercier@google.com>
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

If many dmabufs are present, reads of the dmabuf iterator can be
truncated at PAGE_SIZE or user buffer size boundaries before the fix in
"selftests/bpf: Add test for open coded dmabuf_iter". Add a test to
confirm truncation does not occur.

Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 .../selftests/bpf/prog_tests/dmabuf_iter.c    | 47 +++++++++++++++++--
 1 file changed, 42 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c b/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
index 6c2b0c3dbcd8..e442be9dde7e 100644
--- a/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
+++ b/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
@@ -73,12 +73,10 @@ static int create_udmabuf(void)
 	return -1;
 }
 
-static int create_sys_heap_dmabuf(void)
+static int create_sys_heap_dmabuf(size_t bytes)
 {
-	sysheap_test_buffer_size = 20 * getpagesize();
-
 	struct dma_heap_allocation_data data = {
-		.len = sysheap_test_buffer_size,
+		.len = bytes,
 		.fd = 0,
 		.fd_flags = O_RDWR | O_CLOEXEC,
 		.heap_flags = 0,
@@ -110,7 +108,9 @@ static int create_sys_heap_dmabuf(void)
 static int create_test_buffers(void)
 {
 	udmabuf = create_udmabuf();
-	sysheap_dmabuf = create_sys_heap_dmabuf();
+
+	sysheap_test_buffer_size = 20 * getpagesize();
+	sysheap_dmabuf = create_sys_heap_dmabuf(sysheap_test_buffer_size);
 
 	if (udmabuf < 0 || sysheap_dmabuf < 0)
 		return -1;
@@ -219,6 +219,26 @@ static void subtest_dmabuf_iter_check_default_iter(struct dmabuf_iter *skel)
 	close(iter_fd);
 }
 
+static void subtest_dmabuf_iter_check_lots_of_buffers(struct dmabuf_iter *skel)
+{
+	int iter_fd;
+	char buf[1024];
+	size_t total_bytes_read = 0;
+	ssize_t bytes_read;
+
+	iter_fd = bpf_iter_create(bpf_link__fd(skel->links.dmabuf_collector));
+	if (!ASSERT_OK_FD(iter_fd, "iter_create"))
+		return;
+
+	while ((bytes_read = read(iter_fd, buf, sizeof(buf))) > 0)
+		total_bytes_read += bytes_read;
+
+	ASSERT_GT(total_bytes_read, getpagesize(), "total_bytes_read");
+
+	close(iter_fd);
+}
+
+
 static void subtest_dmabuf_iter_check_open_coded(struct dmabuf_iter *skel, int map_fd)
 {
 	LIBBPF_OPTS(bpf_test_run_opts, topts);
@@ -275,6 +295,23 @@ void test_dmabuf_iter(void)
 		subtest_dmabuf_iter_check_no_infinite_reads(skel);
 	if (test__start_subtest("default_iter"))
 		subtest_dmabuf_iter_check_default_iter(skel);
+	if (test__start_subtest("lots_of_buffers")) {
+		size_t NUM_BUFS = 100;
+		int buffers[NUM_BUFS];
+		int i;
+
+		for (i = 0; i < NUM_BUFS; ++i) {
+			buffers[i] = create_sys_heap_dmabuf(getpagesize());
+			if (!ASSERT_OK_FD(buffers[i], "dmabuf_fd"))
+				goto cleanup_bufs;
+		}
+
+		subtest_dmabuf_iter_check_lots_of_buffers(skel);
+
+cleanup_bufs:
+		for (--i; i >= 0; --i)
+			close(buffers[i]);
+	}
 	if (test__start_subtest("open_coded"))
 		subtest_dmabuf_iter_check_open_coded(skel, map_fd);
 
-- 
2.52.0.177.g9f829587af-goog

