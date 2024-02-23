Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF738613B1
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 15:12:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63A910EB8F;
	Fri, 23 Feb 2024 14:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=analog.com header.i=@analog.com header.b="ytcpBCp4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F245510EB8F
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 14:12:15 +0000 (UTC)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41N9b2JT014757; Fri, 23 Feb 2024 07:11:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
 from:date:subject:mime-version:content-type
 :content-transfer-encoding:message-id:references:in-reply-to:to
 :cc; s=DKIM; bh=S4d0AT6oM91tAUIZJ87WXIleXKClwHIJCUxbBY7ixLU=; b=
 ytcpBCp4nKV/s/z/L40R22WVMQ/yKve1MzYfbYk9cr5uAeFBCQH+IV5j47nGlX7h
 OzdhWwY84nI5/mPaMLngaGhWU696+6JJh1S6MpguOSt1CfX0HFhTO+tIciXaR5fm
 wBcNqHU7YPQqS2PaTGmIbdyNqUE4ND9aOmp2gdYLgxJfdTYu/BtlirO00VGZcMya
 9P5nNPwVHg0adUAN7nkaYn2KE/GZfWA57YMJ0mGuoq7edTjB9S8WvzsUrzdYMtaM
 Api/7TKjhjKqRBbVfKmySiR4AWYQBZy9HEBZoc1zn+9oQwPVV+z1qJcecDbfHVWm
 aI1V40Y2eJAcAqK/Y0S36w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
 by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3wd21pectf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Feb 2024 07:11:12 -0500 (EST)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
 by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 41NCBBD1004375
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL); 
 Fri, 23 Feb 2024 07:11:11 -0500
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 23 Feb 2024 07:11:11 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 23 Feb 2024 07:11:10 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 23 Feb 2024 07:11:10 -0500
Received: from [127.0.0.1] ([10.44.3.55])
 by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 41NCAb2X032246;
 Fri, 23 Feb 2024 07:11:03 -0500
From: Nuno Sa <nuno.sa@analog.com>
Date: Fri, 23 Feb 2024 13:14:04 +0100
Subject: [PATCH v7 6/6] Documentation: iio: Document high-speed DMABUF
 based API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240223-iio-dmabuf-v7-6-78cfaad117b9@analog.com>
References: <20240223-iio-dmabuf-v7-0-78cfaad117b9@analog.com>
In-Reply-To: <20240223-iio-dmabuf-v7-0-78cfaad117b9@analog.com>
To: Vinod Koul <vkoul@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Jonathan Cameron <jic23@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jonathan Corbet <corbet@lwn.net>, Paul Cercueil <paul@crapouillou.net>
CC: Daniel Vetter <daniel@ffwll.ch>, Michael Hennerich
 <Michael.Hennerich@analog.com>,
 <linux-doc@vger.kernel.org>, <dmaengine@vger.kernel.org>,
 <linux-iio@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708690439; l=3175;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=z7VWDFc/regIP5bhzx5ddI5hjHZUDa7CubfT2DvBqJ8=;
 b=ZeCFCCmBGvyup+Nc++CCzyNQ3WY0zc4zrSfRBrsq/X9t0SdbOXSWy6WJu+e/NnQ/chIERoHRI
 2XzSTAcXv0pCOdDqVE3ZBXbWcRsFyFzJWuvmExyBgMrE1NgvR8ybw4e
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: Nt2f0PucLUTrPhVHTJjsdoVNy_yaYrct
X-Proofpoint-ORIG-GUID: Nt2f0PucLUTrPhVHTJjsdoVNy_yaYrct
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_15,2024-02-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=521 priorityscore=1501
 impostorscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402230087
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

From: Paul Cercueil <paul@crapouillou.net>

Document the new DMABUF based API.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 Documentation/iio/dmabuf_api.rst | 54 ++++++++++++++++++++++++++++++++++++++++
 Documentation/iio/index.rst      |  2 ++
 2 files changed, 56 insertions(+)

diff --git a/Documentation/iio/dmabuf_api.rst b/Documentation/iio/dmabuf_api.rst
new file mode 100644
index 000000000000..1cd6cd51a582
--- /dev/null
+++ b/Documentation/iio/dmabuf_api.rst
@@ -0,0 +1,54 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===================================
+High-speed DMABUF interface for IIO
+===================================
+
+1. Overview
+===========
+
+The Industrial I/O subsystem supports access to buffers through a
+file-based interface, with read() and write() access calls through the
+IIO device's dev node.
+
+It additionally supports a DMABUF based interface, where the userspace
+can attach DMABUF objects (externally created) to a IIO buffer, and
+subsequently use them for data transfers.
+
+A userspace application can then use this interface to share DMABUF
+objects between several interfaces, allowing it to transfer data in a
+zero-copy fashion, for instance between IIO and the USB stack.
+
+The userspace application can also memory-map the DMABUF objects, and
+access the sample data directly. The advantage of doing this vs. the
+read() interface is that it avoids an extra copy of the data between the
+kernel and userspace. This is particularly useful for high-speed devices
+which produce several megabytes or even gigabytes of data per second.
+It does however increase the userspace-kernelspace synchronization
+overhead, as the DMA_BUF_SYNC_START and DMA_BUF_SYNC_END IOCTLs have to
+be used for data integrity.
+
+2. User API
+===========
+
+As part of this interface, three new IOCTLs have been added. These three
+IOCTLs have to be performed on the IIO buffer's file descriptor,
+obtained using the IIO_BUFFER_GET_FD_IOCTL() ioctl.
+
+  ``IIO_BUFFER_DMABUF_ATTACH_IOCTL(int)``
+    Attach the DMABUF object, identified by its file descriptor, to the
+    IIO buffer. Returns zero on success, and a negative errno value on
+    error.
+
+  ``IIO_BUFFER_DMABUF_DETACH_IOCTL(int)``
+    Detach the given DMABUF object, identified by its file descriptor,
+    from the IIO buffer. Returns zero on success, and a negative errno
+    value on error.
+
+    Note that closing the IIO buffer's file descriptor will
+    automatically detach all previously attached DMABUF objects.
+
+  ``IIO_BUFFER_DMABUF_ENQUEUE_IOCTL(struct iio_dmabuf *iio_dmabuf)``
+    Enqueue a previously attached DMABUF object to the buffer queue.
+    Enqueued DMABUFs will be read from (if output buffer) or written to
+    (if input buffer) as long as the buffer is enabled.
diff --git a/Documentation/iio/index.rst b/Documentation/iio/index.rst
index 1b7292c58cd0..3eae8fcb1938 100644
--- a/Documentation/iio/index.rst
+++ b/Documentation/iio/index.rst
@@ -9,6 +9,8 @@ Industrial I/O
 
    iio_configfs
 
+   dmabuf_api
+
    ep93xx_adc
 
    bno055

-- 
2.43.2

