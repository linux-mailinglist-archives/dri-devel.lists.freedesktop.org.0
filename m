Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE492DB5A
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 13:04:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A006E2BF;
	Wed, 29 May 2019 11:04:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7590F6E2BE;
 Wed, 29 May 2019 11:04:19 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4TB3rK3050351;
 Wed, 29 May 2019 11:04:11 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 2spu7dh4t2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 May 2019 11:04:11 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4TB3tRQ171803;
 Wed, 29 May 2019 11:04:10 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 2srbdxaqdq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 May 2019 11:04:10 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x4TB457n011770;
 Wed, 29 May 2019 11:04:05 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 29 May 2019 04:04:04 -0700
Date: Wed, 29 May 2019 14:03:55 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Subject: [PATCH] drm/i915: selftest_lrc: Check the correct variable
Message-ID: <20190529110355.GA19119@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9271
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905290074
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9271
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905290075
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=/dOi6b63bF6FhujuHMYrWgc0GTNTW1VuZCOhNzc+LXM=;
 b=uzQxAiN6E00f9nCIr2c97tQ+CnvaNyg0ktwV6/2v4aE2tlrbf1rfvz614kiMSlASQvcI
 94eY1WqzpE+8TbTQ3oQJnMk1XKYI1xm3bG2t8s8CtUkZl9GdiFg2g+HQV45lM0N1UqEa
 gwj6auMllKfWHEVrMXTS1MI3WmiPFkuoL5xE+lwTdkjJqYgC3LKGT3M2vLWfcMaocJYd
 AN8q2eWVSGc29rWObK9sQvUQrhHwEgEz7+g93JJ+5Gm8GfM4wMv+CETozktP29CxWxsF
 IYfiXeS76XsOeRYk7dyn+v0WpIWv1E4X+CMChTaJqxSNsZo8UyWmwxq7untzX1Ib8D9h mg== 
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
Cc: kernel-janitors@vger.kernel.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 David Airlie <airlied@linux.ie>, Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.william.auld@gmail.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2Ugc2hvdWxkIGNoZWNrICJyZXF1ZXN0W25dIiBpbnN0ZWFkIG9mIGp1c3QgInJlcXVlc3QiLgoK
Rml4ZXM6IDc4ZTQxZGRkMjE5OCAoImRybS9pOTE1OiBBcHBseSBhbiBleGVjdXRpb25fbWFzayB0
byB0aGUgdmlydHVhbF9lbmdpbmUiKQpTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4u
Y2FycGVudGVyQG9yYWNsZS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qvc2VsZnRl
c3RfbHJjLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qvc2VsZnRlc3Rf
bHJjLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9zZWxmdGVzdF9scmMuYwppbmRleCBhOGM1
MDkwMGUyZDQuLjEzNjc0ZjgzNjk1NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3Qvc2VsZnRlc3RfbHJjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qvc2VsZnRlc3Rf
bHJjLmMKQEAgLTE1MjYsOCArMTUyNiw4IEBAIHN0YXRpYyBpbnQgbWFza192aXJ0dWFsX2VuZ2lu
ZShzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSwKIAogCWZvciAobiA9IDA7IG4gPCBuc2li
bGluZzsgbisrKSB7CiAJCXJlcXVlc3Rbbl0gPSBpOTE1X3JlcXVlc3RfY3JlYXRlKHZlKTsKLQkJ
aWYgKElTX0VSUihyZXF1ZXN0KSkgewotCQkJZXJyID0gUFRSX0VSUihyZXF1ZXN0KTsKKwkJaWYg
KElTX0VSUihyZXF1ZXN0W25dKSkgeworCQkJZXJyID0gUFRSX0VSUihyZXF1ZXN0W25dKTsKIAkJ
CW5zaWJsaW5nID0gbjsKIAkJCWdvdG8gb3V0OwogCQl9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
