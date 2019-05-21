Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF0A265E3
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61B5989AB3;
	Wed, 22 May 2019 14:35:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A5058914C;
 Tue, 21 May 2019 04:37:32 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4L4Ylh1150285;
 Tue, 21 May 2019 04:37:26 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2sj9ftascb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 May 2019 04:37:26 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4L4a1Wl183631;
 Tue, 21 May 2019 04:37:25 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2sm046rgtc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 May 2019 04:37:25 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x4L4bLIH030062;
 Tue, 21 May 2019 04:37:21 GMT
Received: from linux.cn.oracle.com (/10.182.69.106)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 21 May 2019 04:37:21 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/1] drm/i915: remove unused IO_TLB_SEGPAGES which should be
 defined by swiotlb
Date: Tue, 21 May 2019 12:40:39 +0800
Message-Id: <1558413639-22568-1-git-send-email-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.7.4
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9263
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905210029
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9263
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905210029
X-Mailman-Approved-At: Wed, 22 May 2019 14:35:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=from : to : cc :
 subject : date : message-id; s=corp-2018-07-02;
 bh=LocLl8jGFL6tj5/xpWQWzeKqZ8xj2DlD6pSYk/0CDQE=;
 b=YXQBVdGTKDHPYrt6PKbsI0O3rI3JPVcdXuVB9uWQeIFLOKHh8iEefXDi7IlvHOH//B8k
 ObQoV3/3vErQqdaV/Lu/t8msw48YOZ4RIvHLQgY7TT0qqPYB2TPb8PjKpnt1izluIvD3
 aueINDxQimvkZGnmLKZ0/tgDvtbMZezC0L6lpDN2eEEjd7dxlzewoU18YNuUJHY0UWp1
 TmtpIMshloXiwSZAwj4s9BBNGlj/Sdy0VHx/EPBE74w4e/OX36c1E4BrO8rM9xMFD9Er
 0H9U148JZprI2LDqzsotlu9LCvqU7q713RRjDgTQ/qOqUfsvs9PuNvMzqfSfBkYGFLRU GQ== 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: airlied@linux.ie, dongli.zhang@oracle.com, linux-kernel@vger.kernel.org,
 rodrigo.vivi@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCByZW1vdmVzIElPX1RMQl9TRUdQQUdFUyB3aGljaCBpcyBubyBsb25nZXIgdXNl
ZCBzaW5jZQpjb21taXQgNTU4NGYxYjFkNzNlICgiZHJtL2k5MTU6IGZpeCBpOTE1IHJ1bm5pbmcg
YXMgZG9tMCB1bmRlciBYZW4iKS4KCkFzIHRoZSBkZWZpbmUgb2YgYm90aCBJT19UTEJfU0VHU0la
RSBhbmQgSU9fVExCX1NISUZUIGFyZSBmcm9tIHN3aW90bGIsCklPX1RMQl9TRUdQQUdFUyBzaG91
bGQgYmUgZGVmaW5lZCBvbiBzd2lvdGxiIHNpZGUgaWYgaXQgaXMgcmVxdWlyZWQgaW4gdGhlCmZ1
dHVyZS4KClNpZ25lZC1vZmYtYnk6IERvbmdsaSBaaGFuZyA8ZG9uZ2xpLnpoYW5nQG9yYWNsZS5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9nZW1faW50ZXJuYWwuYyB8IDMgLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9pOTE1X2dlbV9pbnRlcm5hbC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkx
NV9nZW1faW50ZXJuYWwuYwppbmRleCBhYjYyN2VkLi4yMTY2MjE3IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2dlbV9pbnRlcm5hbC5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2k5MTVfZ2VtX2ludGVybmFsLmMKQEAgLTI4LDkgKzI4LDYgQEAKICNkZWZpbmUgUVVJ
RVQgKF9fR0ZQX05PUkVUUlkgfCBfX0dGUF9OT1dBUk4pCiAjZGVmaW5lIE1BWUZBSUwgKF9fR0ZQ
X1JFVFJZX01BWUZBSUwgfCBfX0dGUF9OT1dBUk4pCiAKLS8qIGNvbnZlcnQgc3dpb3RsYiBzZWdt
ZW50IHNpemUgaW50byBzZW5zaWJsZSB1bml0cyAocGFnZXMpISAqLwotI2RlZmluZSBJT19UTEJf
U0VHUEFHRVMgKElPX1RMQl9TRUdTSVpFIDw8IElPX1RMQl9TSElGVCA+PiBQQUdFX1NISUZUKQot
CiBzdGF0aWMgdm9pZCBpbnRlcm5hbF9mcmVlX3BhZ2VzKHN0cnVjdCBzZ190YWJsZSAqc3QpCiB7
CiAJc3RydWN0IHNjYXR0ZXJsaXN0ICpzZzsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
