Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A52136613
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2020 05:27:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E4B6E0A8;
	Fri, 10 Jan 2020 04:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85436E0A8
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2020 04:27:40 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20200110042738epoutp045ec9f7ef694b68bcc3889c2a56d93f1b~obAnBRtth2462024620epoutp04M
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2020 04:27:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20200110042738epoutp045ec9f7ef694b68bcc3889c2a56d93f1b~obAnBRtth2462024620epoutp04M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1578630458;
 bh=EcbPsOqLiShZBVOl65dt3Z2/wDYXiCX+Kk6h+JHs1gg=;
 h=From:To:Cc:Subject:Date:References:From;
 b=H3p+RLDZppsj5iOjrpdFrAKuupFh8CJJBLpOA5+RUSaIrYArJ+bmog+TIbQ7wShKD
 ERkURgjR7iKZzlUpMcXq9hkcx16qb7nf48zJFwSFAloAvejwZxYyXd/73l18tRwXcf
 2Whe6Bcbhhad4ExSY+idgOmVZC/1ts5w4nP6Scwg=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20200110042738epcas1p44a0f9be9eab13872a8f299e1f508abc9~obAmqSgMm2851828518epcas1p4O;
 Fri, 10 Jan 2020 04:27:38 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.158]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 47v9210qwQzMqYkw; Fri, 10 Jan
 2020 04:27:37 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 A5.E5.48498.63DF71E5; Fri, 10 Jan 2020 13:27:34 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200110042734epcas1p1a80d5c2c9dd1fb3c2be7bb869cdc4311~obAjICXNt2125321253epcas1p16;
 Fri, 10 Jan 2020 04:27:34 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200110042734epsmtrp1f8e085cbff393f907ef742314a6b03bc~obAjHbHuQ2250122501epsmtrp1i;
 Fri, 10 Jan 2020 04:27:34 +0000 (GMT)
X-AuditID: b6c32a36-a55ff7000001bd72-7f-5e17fd3658cb
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 EC.0C.10238.63DF71E5; Fri, 10 Jan 2020 13:27:34 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.222]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200110042734epsmtip2b051af97dca54e66cd763b9c8a4426e9~obAi-K7DX1117511175epsmtip2V;
 Fri, 10 Jan 2020 04:27:34 +0000 (GMT)
From: Seung-Woo Kim <sw0312.kim@samsung.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm] meson.build: Don't detect <sys/sysctl.h> header for
 linux
Date: Fri, 10 Jan 2020 13:30:41 +0900
Message-Id: <1578630641-5301-1-git-send-email-sw0312.kim@samsung.com>
X-Mailer: git-send-email 1.7.4.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIKsWRmVeSWpSXmKPExsWy7bCmvq7ZX/E4g6O/jSyufH3PZrH21kEW
 i+WX1zNazJj8ks2i/9QfJgdWjx1vjzN5LN7zkslj3slAj/vdQF7fllWMAaxR2TYZqYkpqUUK
 qXnJ+SmZeem2St7B8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5QMuVFMoSc0qBQgGJxcVK
 +nY2RfmlJakKGfnFJbZKqQUpOQWWBXrFibnFpXnpesn5uVaGBgZGpkCFCdkZNzcfYimYzVPR
 cv8IYwPjfK4uRk4OCQETib1LLjF1MXJxCAnsYJSY8u4XI4TziVHi18tJUJlvQM6J+ywwLffe
 3GCGSOxllHi3+xgrSEJI4AujxOSPJSA2m4COxP4lv8HiIgLKEn8nrmIEsZkFMiRWzr/NDGIL
 CwRL9JzuYQOxWQRUJXa0P2UHsXkFXCWWLV7PCLFMQWLBvbdsEPZXVomXa1MgbBeJzi9LoeLC
 Eq+Ob2GHsKUkXva3QdnVEtsn/GQHOVRCoINRoqe9EeoDY4n9SycDvcYBdJCmxPpd+hBhRYmd
 v+dC3ckn8e5rDytIiYQAr0RHmxBEiYrEzqOT2CDCUhKzNgRDhD0k3tyF+EpIIFai/99X9gmM
 srMQ5i9gZFzFKJZaUJybnlpsWGCEHEebGMHJSctsB+Oicz6HGAU4GJV4eDOExeOEWBPLiitz
 DzFKcDArifAevSEWJ8SbklhZlVqUH19UmpNafIjRFBh2E5mlRJPzgYkzryTe0NTI2NjYwsTQ
 zNTQUEmcl+PHxVghgfTEktTs1NSC1CKYPiYOTqkGxlS1IseTgi2vZVbbL3z40+X45PrkR6yH
 +86q+j1cVVb6Qdt39Z7LxTnMxz68yeT4WnzjkdBMp6m3OG5/erGbr4Bllyfbhnniv85eXGK4
 jF92U2+EI1+Qo879Sha1HNk0R94gg9AvwS++iGcIiy5ZXlC0dPbNgAZdg8qpjzUX8itfbo76
 e/6RghJLcUaioRZzUXEiACtLMfRkAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpgluLIzCtJLcpLzFFi42LZdlhJXtfsr3icwZWJwhZXvr5ns1h76yCL
 xfLL6xktZkx+yWbRf+oPkwOrx463x5k8Fu95yeQx72Sgx/1uIK9vyyrGANYoLpuU1JzMstQi
 fbsEroybmw+xFMzmqWi5f4SxgXE+VxcjJ4eEgInEvTc3mLsYuTiEBHYzSrx82c0EkZCSmPtt
 O2MXIweQLSxx+HAxRM0nRolvN7rAatgEdCT2L/nNCmKLCChL/J24ihHEZhbIkdjw5RUbSK+w
 QKDEk2mBIGEWAVWJHe1P2UFsXgFXiWWL1zNCrFKQWHDvLdsERp4FjAyrGCVTC4pz03OLDQsM
 81LL9YoTc4tL89L1kvNzNzGCw0VLcwfj5SXxhxgFOBiVeHgzhMXjhFgTy4orcw8xSnAwK4nw
 Hr0hFifEm5JYWZValB9fVJqTWnyIUZqDRUmc92nesUghgfTEktTs1NSC1CKYLBMHp1QD46In
 8V7BV7pMi6MFvRcmpapZydWJ7uGyNgut/cmz/u6Z7z8rlI6p/pZ8k//hD8uV6GnuPaxc6jt/
 3DL0Xml1TvgrnyfPbC7FwLCQ941uFza8LBRLmz6/bdL7eV0vLObPLpBOc1i9xWlzM7Mw09fM
 NWt2huxt4MiYdlp0e+jF81/4Qs6efRcboMRSnJFoqMVcVJwIAIo3ngETAgAA
X-CMS-MailID: 20200110042734epcas1p1a80d5c2c9dd1fb3c2be7bb869cdc4311
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200110042734epcas1p1a80d5c2c9dd1fb3c2be7bb869cdc4311
References: <CGME20200110042734epcas1p1a80d5c2c9dd1fb3c2be7bb869cdc4311@epcas1p1.samsung.com>
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
Cc: eric.engestrom@intel.com, zeising@daemonic.se, sw0312.kim@samsung.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The <sys/sysctl.h> header is not required for Linux and GNU libc
2.30 starts to warn about Linux specific <sys/sysctl.h> header
deprecation. Don't detect <sys/sysctl.h> header for linux.

Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>
---
Fix meson.build script instead of code itself as commented below:
https://patchwork.kernel.org/patch/11325345/
---
 meson.build |   15 +++++++++++----
 1 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/meson.build b/meson.build
index 782b1a3..b1c557a 100644
--- a/meson.build
+++ b/meson.build
@@ -183,10 +183,17 @@ else
   dep_rt = []
 endif
 dep_m = cc.find_library('m', required : false)
-# From Niclas Zeising:
-# FreeBSD requires sys/types.h for sys/sysctl.h, add it as part of the
-# includes when checking for headers.
-foreach header : ['sys/sysctl.h', 'sys/select.h', 'alloca.h']
+if not ['linux'].contains(host_machine.system())
+  # From Niclas Zeising:
+  # FreeBSD requires sys/types.h for sys/sysctl.h, add it as part of the
+  # includes when checking for headers.
+  foreach header : ['sys/sysctl.h']
+    config.set('HAVE_' + header.underscorify().to_upper(),
+      cc.compiles('#include <sys/types.h>\n#include <@0@>'.format(header), name : '@0@ works'.format(header)))
+  endforeach
+endif
+endforeach
+foreach header : ['sys/select.h', 'alloca.h']
   config.set('HAVE_' + header.underscorify().to_upper(),
     cc.compiles('#include <sys/types.h>\n#include <@0@>'.format(header), name : '@0@ works'.format(header)))
 endforeach
-- 
1.7.4.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
