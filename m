Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEBC3114CD
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 23:18:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB8C36F513;
	Fri,  5 Feb 2021 22:18:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B646F511
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 22:18:38 +0000 (UTC)
IronPort-SDR: jx2qzvr/y09RXgFZKYxMjIy6HZVDBm7NLCP1JpOcKWUAwO1yMmjodlgbHhge+60UWUNQbJLakE
 SDIuppRk8Ozw==
X-IronPort-AV: E=McAfee;i="6000,8403,9886"; a="242998362"
X-IronPort-AV: E=Sophos;i="5.81,156,1610438400"; d="scan'208";a="242998362"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2021 14:18:36 -0800
IronPort-SDR: QyI4pjYweq5Cyf21lJtvuTK/MG/ULI0uf5IV9FwaROBjbSrv5/lT1PTY5rr8VH+W1tTiIFikx7
 J+jyMDzmt3Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,156,1610438400"; d="scan'208";a="394034433"
Received: from cst-dev.jf.intel.com ([10.23.221.69])
 by orsmga008.jf.intel.com with ESMTP; 05 Feb 2021 14:18:36 -0800
From: Jianxin Xiong <jianxin.xiong@intel.com>
To: linux-rdma@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH rdma-core v3 2/3] pyverbs,
 tests: Cosmetic improvements for dma-buf allocation routines
Date: Fri,  5 Feb 2021 14:33:38 -0800
Message-Id: <1612564419-103455-3-git-send-email-jianxin.xiong@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1612564419-103455-1-git-send-email-jianxin.xiong@intel.com>
References: <1612564419-103455-1-git-send-email-jianxin.xiong@intel.com>
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
Cc: Yishai Hadas <yishaih@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, Edward Srouji <edwards@nvidia.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, Gal Pressman <galpress@amazon.com>,
 Ali Alnubani <alialnu@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rename the parameter 'unit' to 'gpu'. Expand GTT to the full name in the
comments.

Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
---
 pyverbs/dmabuf.pyx     | 12 ++++----
 pyverbs/dmabuf_alloc.c | 12 ++++----
 pyverbs/dmabuf_alloc.h |  2 +-
 pyverbs/mr.pyx         |  6 ++--
 tests/test_mr.py       | 78 +++++++++++++++++++++++++-------------------------
 5 files changed, 55 insertions(+), 55 deletions(-)

diff --git a/pyverbs/dmabuf.pyx b/pyverbs/dmabuf.pyx
index b9406bd..591c4e8 100644
--- a/pyverbs/dmabuf.pyx
+++ b/pyverbs/dmabuf.pyx
@@ -12,7 +12,7 @@ from pyverbs.mr cimport DmaBufMR
 cdef extern from "dmabuf_alloc.h":
     cdef struct dmabuf:
         pass
-    dmabuf *dmabuf_alloc(unsigned long size, int unit, int gtt)
+    dmabuf *dmabuf_alloc(unsigned long size, int gpu, int gtt)
     void dmabuf_free(dmabuf *dmabuf)
     int dmabuf_get_drm_fd(dmabuf *dmabuf)
     int dmabuf_get_fd(dmabuf *dmabuf)
@@ -20,20 +20,20 @@ cdef extern from "dmabuf_alloc.h":
 
 
 cdef class DmaBuf:
-    def __init__(self, size, unit=0, gtt=0):
+    def __init__(self, size, gpu=0, gtt=0):
         """
         Allocate DmaBuf object from a GPU device. This is done through the
         DRI device interface. Usually this requires the effective user id
         being a member of the 'render' group.
         :param size: The size (in number of bytes) of the buffer.
-        :param unit: The unit number of the GPU to allocate the buffer from.
-        :param gtt: Allocate from GTT instead of VRAM.
+        :param gpu: The GPU unit to allocate the buffer from.
+        :param gtt: Allocate from GTT (Graphics Translation Table) instead of VRAM.
         :return: The newly created DmaBuf object on success.
         """
         self.dmabuf_mrs = weakref.WeakSet()
-        self.dmabuf = dmabuf_alloc(size, unit, gtt)
+        self.dmabuf = dmabuf_alloc(size, gpu, gtt)
         if self.dmabuf == NULL:
-            raise PyverbsRDMAErrno(f'Failed to allocate dmabuf of size {size} on unit {unit}')
+            raise PyverbsRDMAErrno(f'Failed to allocate dmabuf of size {size} on gpu {gpu}')
         self.drm_fd = dmabuf_get_drm_fd(<dmabuf *>self.dmabuf)
         self.fd = dmabuf_get_fd(<dmabuf *>self.dmabuf)
         self.map_offset = dmabuf_get_offset(<dmabuf *>self.dmabuf)
diff --git a/pyverbs/dmabuf_alloc.c b/pyverbs/dmabuf_alloc.c
index 05eae75..85ffb7a 100644
--- a/pyverbs/dmabuf_alloc.c
+++ b/pyverbs/dmabuf_alloc.c
@@ -95,7 +95,7 @@ static int amdgpu_mmap_offset(struct drm *drm, uint32_t handle,
 	return 0;
 }
 
-static struct drm *drm_open(int unit)
+static struct drm *drm_open(int gpu)
 {
 	char path[32];
 	struct drm_version version = {};
@@ -107,7 +107,7 @@ static struct drm *drm_open(int unit)
 	if (!drm)
 		return NULL;
 
-	snprintf(path, sizeof(path), "/dev/dri/renderD%d", unit + 128);
+	snprintf(path, sizeof(path), "/dev/dri/renderD%d", gpu + 128);
 
 	drm->fd = open(path, O_RDWR);
 	if (drm->fd < 0)
@@ -204,10 +204,10 @@ struct dmabuf {
 /*
  * dmabuf_alloc - allocate a dmabuf from GPU
  * @size - byte size of the buffer to allocate
- * @unit - the GPU unit to use
- * @gtt - if true, allocate from GTT instead of VRAM
+ * @gpu - the GPU unit to use
+ * @gtt - if true, allocate from GTT (Graphics Translation Table) instead of VRAM
  */
-struct dmabuf *dmabuf_alloc(uint64_t size, int unit, int gtt)
+struct dmabuf *dmabuf_alloc(uint64_t size, int gpu, int gtt)
 {
 	struct dmabuf *dmabuf;
 	int err;
@@ -216,7 +216,7 @@ struct dmabuf *dmabuf_alloc(uint64_t size, int unit, int gtt)
 	if (!dmabuf)
 		return NULL;
 
-	dmabuf->drm = drm_open(unit);
+	dmabuf->drm = drm_open(gpu);
 	if (!dmabuf->drm)
 		goto out_free;
 
diff --git a/pyverbs/dmabuf_alloc.h b/pyverbs/dmabuf_alloc.h
index f1b03c5..4698b11 100644
--- a/pyverbs/dmabuf_alloc.h
+++ b/pyverbs/dmabuf_alloc.h
@@ -10,7 +10,7 @@
 
 struct dmabuf;
 
-struct dmabuf *dmabuf_alloc(uint64_t size, int unit, int gtt);
+struct dmabuf *dmabuf_alloc(uint64_t size, int gpu, int gtt);
 void dmabuf_free(struct dmabuf *dmabuf);
 int dmabuf_get_drm_fd(struct dmabuf *dmabuf);
 int dmabuf_get_fd(struct dmabuf *dmabuf);
diff --git a/pyverbs/mr.pyx b/pyverbs/mr.pyx
index aad47e2..d05d044 100644
--- a/pyverbs/mr.pyx
+++ b/pyverbs/mr.pyx
@@ -384,7 +384,7 @@ cdef class DMMR(MR):
 
 cdef class DmaBufMR(MR):
     def __init__(self, PD pd not None, length, access, DmaBuf dmabuf=None,
-                 offset=0, unit=0, gtt=0):
+                 offset=0, gpu=0, gtt=0):
         """
         Initializes a DmaBufMR (DMA-BUF Memory Region) of the given length
         and access flags using the given PD and DmaBuf objects.
@@ -393,14 +393,14 @@ cdef class DmaBufMR(MR):
         :param access: Access flags, see ibv_access_flags enum
         :param dmabuf: A DmaBuf object. One will be allocated if absent
         :param offset: Byte offset from the beginning of the dma-buf
-        :param unit: GPU unit for internal dmabuf allocation
+        :param gpu: GPU unit for internal dmabuf allocation
         :param gtt: If true allocate internal dmabuf from GTT instead of VRAM
         :return: The newly created DMABUFMR
         """
         self.logger = logging.getLogger(self.__class__.__name__)
         if dmabuf is None:
             self.is_dmabuf_internal = True
-            dmabuf = DmaBuf(length + offset, unit, gtt)
+            dmabuf = DmaBuf(length + offset, gpu, gtt)
         self.mr = v.ibv_reg_dmabuf_mr(pd.pd, offset, length, offset, dmabuf.fd, access)
         if self.mr == NULL:
             raise PyverbsRDMAErrno(f'Failed to register a dma-buf MR. length: {length}, access flags: {access}')
diff --git a/tests/test_mr.py b/tests/test_mr.py
index 03a645f..028be71 100644
--- a/tests/test_mr.py
+++ b/tests/test_mr.py
@@ -429,14 +429,14 @@ class DMMRTest(PyverbsAPITestCase):
                         dm_mr.close()
 
 
-def check_dmabuf_support(unit=0):
+def check_dmabuf_support(gpu=0):
     """
     Check if dma-buf allocation is supported by the system.
     Skip the test on failure.
     """
-    device_num = 128 + unit
+    device_num = 128 + gpu
     try:
-        DmaBuf(1, unit=unit)
+        DmaBuf(1, gpu=gpu)
     except PyverbsRDMAError as ex:
         if ex.error_code == errno.ENOENT:
             raise unittest.SkipTest(f'Device /dev/dri/renderD{device_num} is not present')
@@ -446,13 +446,13 @@ def check_dmabuf_support(unit=0):
             raise unittest.SkipTest(f'Allocating dmabuf is not supported by /dev/dri/renderD{device_num}')
 
 
-def check_dmabuf_mr_support(pd, unit=0):
+def check_dmabuf_mr_support(pd, gpu=0):
     """
     Check if dma-buf MR registration is supported by the driver.
     Skip the test on failure
     """
     try:
-        DmaBufMR(pd, 1, 0, unit=unit)
+        DmaBufMR(pd, 1, 0, gpu=gpu)
     except PyverbsRDMAError as ex:
         if ex.error_code == errno.EOPNOTSUPP:
             raise unittest.SkipTest('Reg dma-buf MR is not supported by the RDMA driver')
@@ -464,22 +464,22 @@ class DmaBufMRTest(PyverbsAPITestCase):
     """
     def setUp(self):
         super().setUp()
-        self.unit = self.config['gpu']
+        self.gpu = self.config['gpu']
         self.gtt = self.config['gtt']
 
     def test_dmabuf_reg_mr(self):
         """
         Test ibv_reg_dmabuf_mr()
         """
-        check_dmabuf_support(self.unit)
+        check_dmabuf_support(self.gpu)
         for ctx, attr, attr_ex in self.devices:
             with PD(ctx) as pd:
-                check_dmabuf_mr_support(pd, self.unit)
+                check_dmabuf_mr_support(pd, self.gpu)
                 flags = u.get_dmabuf_access_flags(ctx)
                 for f in flags:
                     len = u.get_mr_length()
                     for off in [0, len//2]:
-                        with DmaBufMR(pd, len, f, offset=off, unit=self.unit,
+                        with DmaBufMR(pd, len, f, offset=off, gpu=self.gpu,
                                       gtt=self.gtt) as mr:
                             pass
 
@@ -487,15 +487,15 @@ class DmaBufMRTest(PyverbsAPITestCase):
         """
         Test ibv_dereg_mr() with DmaBufMR
         """
-        check_dmabuf_support(self.unit)
+        check_dmabuf_support(self.gpu)
         for ctx, attr, attr_ex in self.devices:
             with PD(ctx) as pd:
-                check_dmabuf_mr_support(pd, self.unit)
+                check_dmabuf_mr_support(pd, self.gpu)
                 flags = u.get_dmabuf_access_flags(ctx)
                 for f in flags:
                     len = u.get_mr_length()
                     for off in [0, len//2]:
-                        with DmaBufMR(pd, len, f, offset=off, unit=self.unit,
+                        with DmaBufMR(pd, len, f, offset=off, gpu=self.gpu,
                                       gtt=self.gtt) as mr:
                             mr.close()
 
@@ -503,15 +503,15 @@ class DmaBufMRTest(PyverbsAPITestCase):
         """
         Verify that explicit call to DmaBufMR's close() doesn't fail
         """
-        check_dmabuf_support(self.unit)
+        check_dmabuf_support(self.gpu)
         for ctx, attr, attr_ex in self.devices:
             with PD(ctx) as pd:
-                check_dmabuf_mr_support(pd, self.unit)
+                check_dmabuf_mr_support(pd, self.gpu)
                 flags = u.get_dmabuf_access_flags(ctx)
                 for f in flags:
                     len = u.get_mr_length()
                     for off in [0, len//2]:
-                        with DmaBufMR(pd, len, f, offset=off, unit=self.unit,
+                        with DmaBufMR(pd, len, f, offset=off, gpu=self.gpu,
                                       gtt=self.gtt) as mr:
                             # Pyverbs supports multiple destruction of objects,
                             # we are not expecting an exception here.
@@ -522,10 +522,10 @@ class DmaBufMRTest(PyverbsAPITestCase):
         """
         Verify that illegal flags combination fails as expected
         """
-        check_dmabuf_support(self.unit)
+        check_dmabuf_support(self.gpu)
         for ctx, attr, attr_ex in self.devices:
             with PD(ctx) as pd:
-                check_dmabuf_mr_support(pd, self.unit)
+                check_dmabuf_mr_support(pd, self.gpu)
                 for i in range(5):
                     flags = random.sample([e.IBV_ACCESS_REMOTE_WRITE,
                                            e.IBV_ACCESS_REMOTE_ATOMIC],
@@ -535,7 +535,7 @@ class DmaBufMRTest(PyverbsAPITestCase):
                         mr_flags += i.value
                     try:
                         DmaBufMR(pd, u.get_mr_length(), mr_flags,
-                                 unit=self.unit, gtt=self.gtt)
+                                 gpu=self.gpu, gtt=self.gtt)
                     except PyverbsRDMAError as err:
                         assert 'Failed to register a dma-buf MR' in err.args[0]
                     else:
@@ -545,17 +545,17 @@ class DmaBufMRTest(PyverbsAPITestCase):
         """
         Test writing to DmaBufMR's buffer
         """
-        check_dmabuf_support(self.unit)
+        check_dmabuf_support(self.gpu)
         for ctx, attr, attr_ex in self.devices:
             with PD(ctx) as pd:
-                check_dmabuf_mr_support(pd, self.unit)
+                check_dmabuf_mr_support(pd, self.gpu)
                 for i in range(10):
                     mr_len = u.get_mr_length()
                     flags = u.get_dmabuf_access_flags(ctx)
                     for f in flags:
                         for mr_off in [0, mr_len//2]:
                             with DmaBufMR(pd, mr_len, f, offset=mr_off,
-                                          unit=self.unit, gtt=self.gtt) as mr:
+                                          gpu=self.gpu, gtt=self.gtt) as mr:
                                 write_len = min(random.randint(1, MAX_IO_LEN),
                                                 mr_len)
                                 mr.write('a' * write_len, write_len)
@@ -564,17 +564,17 @@ class DmaBufMRTest(PyverbsAPITestCase):
         """
         Test reading from DmaBufMR's buffer
         """
-        check_dmabuf_support(self.unit)
+        check_dmabuf_support(self.gpu)
         for ctx, attr, attr_ex in self.devices:
             with PD(ctx) as pd:
-                check_dmabuf_mr_support(pd, self.unit)
+                check_dmabuf_mr_support(pd, self.gpu)
                 for i in range(10):
                     mr_len = u.get_mr_length()
                     flags = u.get_dmabuf_access_flags(ctx)
                     for f in flags:
                         for mr_off in [0, mr_len//2]:
                             with DmaBufMR(pd, mr_len, f, offset=mr_off,
-                                          unit=self.unit, gtt=self.gtt) as mr:
+                                          gpu=self.gpu, gtt=self.gtt) as mr:
                                 write_len = min(random.randint(1, MAX_IO_LEN),
                                                 mr_len)
                                 write_str = 'a' * write_len
@@ -588,14 +588,14 @@ class DmaBufMRTest(PyverbsAPITestCase):
         """
         Test reading lkey property
         """
-        check_dmabuf_support(self.unit)
+        check_dmabuf_support(self.gpu)
         for ctx, attr, attr_ex in self.devices:
             with PD(ctx) as pd:
-                check_dmabuf_mr_support(pd, self.unit)
+                check_dmabuf_mr_support(pd, self.gpu)
                 length = u.get_mr_length()
                 flags = u.get_dmabuf_access_flags(ctx)
                 for f in flags:
-                    with DmaBufMR(pd, length, f, unit=self.unit,
+                    with DmaBufMR(pd, length, f, gpu=self.gpu,
                                   gtt=self.gtt) as mr:
                         mr.lkey
 
@@ -603,38 +603,38 @@ class DmaBufMRTest(PyverbsAPITestCase):
         """
         Test reading rkey property
         """
-        check_dmabuf_support(self.unit)
+        check_dmabuf_support(self.gpu)
         for ctx, attr, attr_ex in self.devices:
             with PD(ctx) as pd:
-                check_dmabuf_mr_support(pd, self.unit)
+                check_dmabuf_mr_support(pd, self.gpu)
                 length = u.get_mr_length()
                 flags = u.get_dmabuf_access_flags(ctx)
                 for f in flags:
-                    with DmaBufMR(pd, length, f, unit=self.unit,
+                    with DmaBufMR(pd, length, f, gpu=self.gpu,
                                   gtt=self.gtt) as mr:
                         mr.rkey
 
 
 class DmaBufRC(RCResources):
-    def __init__(self, dev_name, ib_port, gid_index, unit, gtt):
+    def __init__(self, dev_name, ib_port, gid_index, gpu, gtt):
         """
         Initialize an DmaBufRC object.
         :param dev_name: Device name to be used
         :param ib_port: IB port of the device to use
         :param gid_index: Which GID index to use
-        :param unit: GPU unit to allocate dmabuf from
+        :param gpu: GPU unit to allocate dmabuf from
         :gtt: Allocate dmabuf from GTT instead og VRAM
         """
-        self.unit = unit
+        self.gpu = gpu
         self.gtt = gtt
         super(DmaBufRC, self).__init__(dev_name=dev_name, ib_port=ib_port,
                                        gid_index=gid_index)
 
     def create_mr(self):
-        check_dmabuf_support(self.unit)
-        check_dmabuf_mr_support(self.pd, self.unit)
+        check_dmabuf_support(self.gpu)
+        check_dmabuf_mr_support(self.pd, self.gpu)
         access = e.IBV_ACCESS_LOCAL_WRITE | e.IBV_ACCESS_REMOTE_WRITE
-        mr = DmaBufMR(self.pd, self.msg_size, access, unit=self.unit,
+        mr = DmaBufMR(self.pd, self.msg_size, access, gpu=self.gpu,
                       gtt=self.gtt)
         self.mr = mr
 
@@ -649,7 +649,7 @@ class DmaBufTestCase(RDMATestCase):
     def setUp(self):
         super(DmaBufTestCase, self).setUp()
         self.iters = 100
-        self.unit = self.config['gpu']
+        self.gpu = self.config['gpu']
         self.gtt = self.config['gtt']
 
     def create_players(self, resource, **resource_arg):
@@ -671,7 +671,7 @@ class DmaBufTestCase(RDMATestCase):
         """
         Test send/recv using dma-buf MR over RC
         """
-        client, server = self.create_players(DmaBufRC, unit=self.unit,
+        client, server = self.create_players(DmaBufRC, gpu=self.gpu,
                                              gtt=self.gtt)
         u.traffic(client, server, self.iters, self.gid_index, self.ib_port)
 
@@ -679,7 +679,7 @@ class DmaBufTestCase(RDMATestCase):
         """
         Test rdma write using dma-buf MR
         """
-        client, server = self.create_players(DmaBufRC, unit=self.unit,
+        client, server = self.create_players(DmaBufRC, gpu=self.gpu,
                                              gtt=self.gtt)
         server.rkey = client.mr.rkey
         server.remote_addr = client.mr.offset
-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
