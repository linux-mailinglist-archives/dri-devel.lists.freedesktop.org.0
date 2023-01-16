Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6496266BAE1
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 10:51:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC1510E2AC;
	Mon, 16 Jan 2023 09:51:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 373 seconds by postgrey-1.36 at gabe;
 Mon, 16 Jan 2023 09:51:11 UTC
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D0310E2AC
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 09:51:11 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20230116094456epoutp038eff6f92c4ae08acae93aa78cc25b7ce~6wOPg_Ba43081130811epoutp03k
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 09:44:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20230116094456epoutp038eff6f92c4ae08acae93aa78cc25b7ce~6wOPg_Ba43081130811epoutp03k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1673862296;
 bh=sRdthrgjnb4dCCDJfninO3npwJae9dAxsY1MtX8iqWw=;
 h=From:To:Subject:Date:References:From;
 b=iq5dyVfKNjYozRdnC+sBT+xWT6jdgRb7vL3auTxIuQkyGH/jvPbf9OW5sBRdyASlJ
 kshEjiCNQ5mYf+dUEBYUHM4dD2DCutvlIuaH4ZoEzZKkPbumpvBTVtPUuSC4YR0kaw
 aGgb5U/CjXwYEWlIiVu8TrPKEcKNzmmoXE5jkrrM=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20230116094456epcas1p4dce4bd5932268b813178341d5ae96f88~6wOPMBQWE0792107921epcas1p45;
 Mon, 16 Jan 2023 09:44:56 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.38.231]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4NwRvW1SpKz4x9Q0; Mon, 16 Jan
 2023 09:44:55 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 53.DF.41504.79C15C36; Mon, 16 Jan 2023 18:44:55 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20230116094454epcas1p104533e1c24b32fb09f2500c8b42bb1ea~6wON_atNs0051600516epcas1p1w;
 Mon, 16 Jan 2023 09:44:54 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230116094454epsmtrp2eec9193ecc1515d2ffec7dfdd47ac9cf~6wON94o-l0494304943epsmtrp25;
 Mon, 16 Jan 2023 09:44:54 +0000 (GMT)
X-AuditID: b6c32a39-24bfd7000001a220-2b-63c51c9732e8
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 00.F8.02211.69C15C36; Mon, 16 Jan 2023 18:44:54 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.111.64]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230116094454epsmtip162b69d851a76c5c2f02c1c926fd07053~6wONyaozz0804708047epsmtip1O;
 Mon, 16 Jan 2023 09:44:54 +0000 (GMT)
From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
To: dri-devel@lists.freedesktop.org, hoegeun.kwon@samsung.com
Subject: [PATCH libdrm] vbltest: add option to use high pipe
Date: Mon, 16 Jan 2023 18:44:20 +0900
Message-Id: <20230116094420.26075-1-hoegeun.kwon@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNKsWRmVeSWpSXmKPExsWy7bCmnu50maPJBs+WsVlc+fqezeL98i42
 ByaP+93HmTz6tqxiDGCKyrbJSE1MSS1SSM1Lzk/JzEu3VfIOjneONzUzMNQ1tLQwV1LIS8xN
 tVVy8QnQdcvMAZqvpFCWmFMKFApILC5W0rezKcovLUlVyMgvLrFVSi1IySkwLdArTswtLs1L
 18tLLbEyNDAwMgUqTMjOmLN+GlPBS6GKL4+uMjUwfuXrYuTkkBAwkZix+hFTFyMXh5DADkaJ
 yzcXsoAkhAQ+MUrcmF8HkfjGKDHl2mR2mI7nx14xQiT2Mkrs2XkGyvnMKLHj/wawdjYBXYmv
 PdeZQGwRAVuJD3u3s4HYwgI2EltPLwWrYRFQlZjfeJIZxOYFqun50AW1QV5i9YYDzCBDJQRe
 s0ls29TLBJFwkeiZ/JkVwhaWeHV8C1SDlMTnd3vZIOxsiXsnrkPZJRIPTv5khLCNJfYvnQw0
 h4ODWUBTYv0ufYiwosTO33PBSpgF+CTefe1hBSmREOCV6GgTgihRk3jWcABqq4zEqd7lTBAl
 HhIzT6lCAitW4tOunywTGGVmIcxfwMi4ilEstaA4Nz212LDAFB4vyfm5mxjBqUTLcgfj9Lcf
 9A4xMnEwHmKU4GBWEuH123U4WYg3JbGyKrUoP76oNCe1+BCjKTC4JjJLiSbnA5NZXkm8oYml
 gYmZkbGJhaGZoZI4r03EumQhgfTEktTs1NSC1CKYPiYOTqkGJha+q3/n6WWmcSQ4PA8ta69l
 Nv2/O7v3geg0VuWV5cZL1277eH7brK0z7nSkighnx/48+sElXEKjcfsxdt1c7xDe2sAfp3Yd
 /zHdWOz2itQvuZfm75Ca7iB7OK0t57Vka7/VxqrLF3VWP1/m7rXNn/v9+fh3nquuL+VaOEFg
 WpHSzgSPK7/3/nl/mMny6oZtzSdt5DcZfp9kuJZBvzb0OWPkkePesz+Z3uM9eFu3/uVy3kPt
 cjvSVjycwOIkaH+220Jnje+27bKSB242GDSYHvneXCrO1f4vpH+yv+qhI/Odbm75vk1Oq2CJ
 +5YrpfEWlcH963bHVNzcOM9nwczvkc8rQ3Z3ObBnO51ILmS2YlFiKc5INNRiLipOBAA6X7/E
 rgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFJMWRmVeSWpSXmKPExsWy7bCSnO40maPJBken6Fhc+fqezeL98i42
 ByaP+93HmTz6tqxiDGCK4rJJSc3JLEst0rdL4MqYs34aU8FLoYovj64yNTB+5eti5OSQEDCR
 eH7sFWMXIxeHkMBuRom+bwuZIRIyEqv6t7B2MXIA2cIShw8XQ9R8ZJR43v6BCaSGTUBX4mvP
 dSaQGhEBe4mNkzVAwsICNhJbTy9lAbFZBFQl5jeeBBvJK2Ar0fOhix1ivLzE6g0HmCcwci9g
 ZFjFKJlaUJybnltsWGCYl1quV5yYW1yal66XnJ+7iRHsXS3NHYzbV33QO8TIxMF4iFGCg1lJ
 hNdv1+FkId6UxMqq1KL8+KLSnNTiQ4zSHCxK4rwXuk7GCwmkJ5akZqemFqQWwWSZODilGphK
 ecQ9N0dtZK8T4Zo63VxNYXrQxTWNjVx9hVPO7WH6vZB/3hu/yucBi9/Hz1imk3oz+Omd3ZMf
 24kVcEl/Ls7fN0dq3o//JTNX9f6Knm7qFWjQz3fFMXeTzeQKLsZCqQr1hW3LXp8JNGYy4tIO
 +zdhPeef0EYhg0WlprLT5q/5xHqY4+yxfT8kdd/pbjm71yTxpaXZxRcWx1P2X7rN9ut0xcmS
 erdfKz93eUQ/3SrV1XnJao6CwPWV734UZ70PVrWynVX5L7V+Q/ofB38tD4GlG8+ka5yOfv/M
 949VGfMlq/AaMz+LPUHTddO3Pvmo+b52osZnplKfL5LaXHf+PSyeOleG78TDl4oM5T8FN4sq
 sRRnJBpqMRcVJwIAokq5sV0CAAA=
X-CMS-MailID: 20230116094454epcas1p104533e1c24b32fb09f2500c8b42bb1ea
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230116094454epcas1p104533e1c24b32fb09f2500c8b42bb1ea
References: <CGME20230116094454epcas1p104533e1c24b32fb09f2500c8b42bb1ea@epcas1p1.samsung.com>
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

Add option to use high pipe.

Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
---
 tests/vbltest/vbltest.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/tests/vbltest/vbltest.c b/tests/vbltest/vbltest.c
index 1c2b519eec4a..1be77b81c560 100644
--- a/tests/vbltest/vbltest.c
+++ b/tests/vbltest/vbltest.c
@@ -45,10 +45,13 @@
 
 extern char *optarg;
 extern int optind, opterr, optopt;
-static char optstr[] = "D:M:s";
+static char optstr[] = "D:M:p:s";
 
 int secondary = 0;
 
+#define DRM_VBLANK_HIGH_CRTC_SHIFT 1
+static int high_pipe = 0;
+
 struct vbl_info {
 	unsigned int vbl_count;
 	struct timeval start;
@@ -65,6 +68,8 @@ static void vblank_handler(int fd, unsigned int frame, unsigned int sec,
 	vbl.request.type = DRM_VBLANK_RELATIVE | DRM_VBLANK_EVENT;
 	if (secondary)
 		vbl.request.type |= DRM_VBLANK_SECONDARY;
+	if (high_pipe)
+		vbl.request.type |= high_pipe << DRM_VBLANK_HIGH_CRTC_SHIFT;
 	vbl.request.sequence = 1;
 	vbl.request.signal = (unsigned long)data;
 
@@ -90,6 +95,7 @@ static void usage(char *name)
 	fprintf(stderr, "  -D DEVICE  open the given device\n");
 	fprintf(stderr, "  -M MODULE  open the given module\n");
 	fprintf(stderr, "  -s         use secondary pipe\n");
+	fprintf(stderr, "  -p NUM     use high pipe\n");
 	exit(0);
 }
 
@@ -113,12 +119,18 @@ int main(int argc, char **argv)
 		case 's':
 			secondary = 1;
 			break;
+		case 'p':
+			high_pipe = atoi(optarg);
+			break;
 		default:
 			usage(argv[0]);
 			break;
 		}
 	}
 
+	if (secondary && high_pipe)
+		return 1;
+
 	fd = util_open(device, module);
 	if (fd < 0)
 		return 1;
@@ -127,6 +139,8 @@ int main(int argc, char **argv)
 	vbl.request.type = DRM_VBLANK_RELATIVE;
 	if (secondary)
 		vbl.request.type |= DRM_VBLANK_SECONDARY;
+	if (high_pipe)
+		vbl.request.type |= high_pipe << DRM_VBLANK_HIGH_CRTC_SHIFT;
 	vbl.request.sequence = 0;
 	ret = drmWaitVBlank(fd, &vbl);
 	if (ret != 0) {
@@ -143,6 +157,8 @@ int main(int argc, char **argv)
 	vbl.request.type = DRM_VBLANK_RELATIVE | DRM_VBLANK_EVENT;
 	if (secondary)
 		vbl.request.type |= DRM_VBLANK_SECONDARY;
+	if (high_pipe)
+		vbl.request.type |= high_pipe << DRM_VBLANK_HIGH_CRTC_SHIFT;
 	vbl.request.sequence = 1;
 	vbl.request.signal = (unsigned long)&handler_info;
 	ret = drmWaitVBlank(fd, &vbl);
-- 
2.17.1

