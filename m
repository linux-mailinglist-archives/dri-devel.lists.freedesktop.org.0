Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 538F7BA21A1
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 02:38:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F04D710E13F;
	Fri, 26 Sep 2025 00:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1199 seconds by postgrey-1.36 at gabe;
 Fri, 26 Sep 2025 00:38:12 UTC
Received: from 18.mo561.mail-out.ovh.net (18.mo561.mail-out.ovh.net
 [87.98.172.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 769EF10E13F
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 00:38:12 +0000 (UTC)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.110.54.155])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4cXrPw6YQMz6TPT
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 00:03:00 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-x459c (unknown [10.110.178.32])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 377D51001F2;
 Fri, 26 Sep 2025 00:02:58 +0000 (UTC)
Received: from etezian.org ([37.59.142.106])
 by ghost-submission-5b5ff79f4f-x459c with ESMTPSA
 id ntYtLTLY1WgltQIAvcneoQ
 (envelope-from <andi@etezian.org>); Fri, 26 Sep 2025 00:02:58 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006acecf765-2e3a-4495-9e33-170f8d491de4,
 7ABF32FC6A42AA68F07093BAEB8416E50913B476) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 178.39.90.92
From: Andi Shyti <andi.shyti@kernel.org>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Andi Shyti <andi.shyti@kernel.org>, Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH] drm/i915/gvt: Propagate vfio_set_irqs_validate_and_prepare()
 error
Date: Fri, 26 Sep 2025 02:02:52 +0200
Message-ID: <20250926000252.3681360-1-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15579077011979307714
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTE66knR8ViM5B4kWvbayG28X+6KGYpfcegFkNQ5JGCatzgzaI5B7khE3B+l/LOrTHuk0XnHRtLrnWFg5RakYuO68HBaDxnXXyxDxR9MsBMEExZIdfkzCBVuXFUVD60aFtd23SDWZf86VGsI3VLfHW3iGMaPaDrLZ1G3XleID7qcJ1wnfTyKHDr3zQvjBpySikgxu88dMU+nke0i5MMJOGM9ZhOp0iMnV3ETF1RKD6/A5+hRYtFotHP+CIxpFncdV5BFqwUrOQ0LU1XRj63AyncWwvm3mOqmfDXb4CWhk37tQAPh7mUfpSB9oM/kekN4t6TAVqe9XNxfFP4fh3Gh+6g4pJsjhdJSZ+sh3G1CHSSrjou+blB67ziivxroZCPLrXZht/hp6RvneVd+QVg8pynhl0neYcBeszgSBGQnmi066SEpr7nFFCZ+CuD2aIw0MO+rMPCFIpSikyHtiM/SjJnc+1gyT+J244q3is/twGw8okkMftNOiyS+idvc965afi5uL+z/AgnvMskal+TxMA+2Paan/eD9NJEDGQgAAQlRBC5Mxl1gTu6qUAS3BNTcjmRfan2BCO8il5Oc7Ax49AWa61D1vrkXjMN2JHSDA3gBZpru/uMP5zSfpOz1op9r43WjFuQ8GCErBtp+BHCcgNO3bQWXNCKxqe6ySu35RhkxBg
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

From: Andi Shyti <andi.shyti@linux.intel.com>

Return the actual error code from vfio_set_irqs_validate_and_prepare()
instead of always collapsing to -EINVAL. While the helper
currently returns -EINVAL in most cases, passing through the real
error code is more future-proof.

While at it, drop the stray 'intel:' prefix from the error
message.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 69830a5c49d3..450a4673c542 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1367,8 +1367,8 @@ static long intel_vgpu_ioctl(struct vfio_device *vfio_dev, unsigned int cmd,
 			ret = vfio_set_irqs_validate_and_prepare(&hdr, max,
 						VFIO_PCI_NUM_IRQS, &data_size);
 			if (ret) {
-				gvt_vgpu_err("intel:vfio_set_irqs_validate_and_prepare failed\n");
-				return -EINVAL;
+				gvt_vgpu_err("vfio_set_irqs_validate_and_prepare failed\n");
+				return ret;
 			}
 			if (data_size) {
 				data = memdup_user((void __user *)(arg + minsz),
-- 
2.51.0

