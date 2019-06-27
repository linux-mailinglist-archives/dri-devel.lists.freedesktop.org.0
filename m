Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF80358304
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 14:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8766E245;
	Thu, 27 Jun 2019 12:58:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B8546E245
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 12:58:06 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190627125804euoutp023d02e02776ffc58751e11a3bcd5cacd9~sD5CqdNV41526815268euoutp02z
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 12:58:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190627125804euoutp023d02e02776ffc58751e11a3bcd5cacd9~sD5CqdNV41526815268euoutp02z
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190627125804eucas1p179796d899992baa418afa5ccb5c94114~sD5CLmXTJ0314703147eucas1p1f;
 Thu, 27 Jun 2019 12:58:04 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id CB.7B.04377.B5DB41D5; Thu, 27
 Jun 2019 13:58:03 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190627125803eucas1p1eb6a37f5fa96fd732e41ab1501367de5~sD5BVZ0ad1266112661eucas1p1t;
 Thu, 27 Jun 2019 12:58:03 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190627125803eusmtrp16e6dbba330708606e66c4b391ccbc292~sD5BUyRWI0648206482eusmtrp1S;
 Thu, 27 Jun 2019 12:58:03 +0000 (GMT)
X-AuditID: cbfec7f4-113ff70000001119-ae-5d14bd5b2501
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 12.73.04140.B5DB41D5; Thu, 27
 Jun 2019 13:58:03 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190627125803eusmtip1017d6b7cd9a96311891678170d0aefdb~sD5BEy9-Z0970609706eusmtip1_;
 Thu, 27 Jun 2019 12:58:03 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] video: fbdev: s3c-fb: fix sparse warnings about using
 incorrect types
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <908fc26e-3bfa-c204-6c32-7d814fdcb37b@samsung.com>
Date: Thu, 27 Jun 2019 14:58:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIKsWRmVeSWpSXmKPExsWy7djPc7rRe0ViDT5eN7e48vU9m8WKLzPZ
 LU70fWC1uLxrDpsDi8fOWXfZPe53H2fy+LxJLoA5issmJTUnsyy1SN8ugStj0sNe9oINPBX3
 T51kbmBcz9XFyMkhIWAiselTC1MXIxeHkMAKRon+b0uZIZwvjBKfN05ng3A+M0psXbSBCaZl
 78ludojEckaJ95eOM0I4bxklFrf/YAepYhOwkpjYvgoowcEhLBAhseKHCkhYRCBBYsX0GYwg
 NrOAqsSu5qVgJbwCdhJ7ZrCAhFmAwi9PXmIGsUWBOu8f28AKYvMKCEqcnPmEBaJVXOLWk/lM
 ELa8xPa3c8CulhD4zCax5dlpVohDXSSOXvvHAmELS7w6voUdwpaROD25hwWiYR2jxN+OF1Dd
 2xkllk/+xwZRZS1x+PhFVpDrmAU0Jdbv0ocIO0o0zj3HBhKWEOCTuPFWEOIIPolJ26YzQ4R5
 JTrahCCq1SQ2LNvABrO2a+dKZgjbQ2LVng7GCYyKs5C8NgvJa7OQvDYL4YYFjCyrGMVTS4tz
 01OLjfJSy/WKE3OLS/PS9ZLzczcxAhPK6X/Hv+xg3PUn6RCjAAejEg+vwk6RWCHWxLLiytxD
 jBIczEoivPlhQCHelMTKqtSi/Pii0pzU4kOM0hwsSuK81QwPooUE0hNLUrNTUwtSi2CyTByc
 Ug2MIZ9ythfKflbk32T1rbbQlfOE81/rKlfzJncfqz1Xl5ueUIpo/ZPe7iL6Zce2GcUGDg8S
 +1Nn/rW6kbjA8XKuj/b7ST+ONrKeWOuldpbZcMWuvOQzJjZfl7+1mNBxUX17xsUL05xWGNy4
 7rdA23L6qU1fLjZ+q4885lV0X++bsEWJTOlzdUkNJZbijERDLeai4kQAiDCosiQDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgkeLIzCtJLcpLzFFi42I5/e/4Xd3ovSKxBisnCltc+fqezWLFl5ns
 Fif6PrBaXN41h82BxWPnrLvsHve7jzN5fN4kF8AcpWdTlF9akqqQkV9cYqsUbWhhpGdoaaFn
 ZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJcx6WEve8EGnor7p04yNzCu5+pi5OSQEDCR2Huy
 mx3EFhJYyijxbGphFyMHUFxG4vj6MogSYYk/17rYuhi5gEpeM0ocOLyHCSTBJmAlMbF9FSNI
 vbBAhMSKHyogYRGBBImnr+ezgdjMAqoSu5qXgpXwCthJ7JnBAhJmAQq/PHmJGcQWBeo8834F
 WJxXQFDi5MwnLBCt6hJ/5kHUMAuIS9x6Mp8JwpaX2P52DvMERoFZSFpmIWmZhaRlFpKWBYws
 qxhFUkuLc9Nzi430ihNzi0vz0vWS83M3MQJjYduxn1t2MHa9Cz7EKMDBqMTDq7BTJFaINbGs
 uDL3EKMEB7OSCG9+GFCINyWxsiq1KD++qDQntfgQoynQQxOZpUST84FxmlcSb2hqaG5haWhu
 bG5sZqEkztshcDBGSCA9sSQ1OzW1ILUIpo+Jg1OqgVFyySIOtQvPD2ztKVpsVH7oe7TIgkmq
 aVP3ls32XdnsVu7cWBtwfeNf4wC/jzWHncX3WK1UOxnA/+FYxcHUKbdY99nnWL2+vlG+sb8x
 r/a7xYy+Js6CvY+81xzVPtrKorW3ddfOvF28942e/W7itj5+7PLVkEt6XUs2hGeVsShZv/gh
 NTMjZ5YSS3FGoqEWc1FxIgCo9uCVmwIAAA==
X-CMS-MailID: 20190627125803eucas1p1eb6a37f5fa96fd732e41ab1501367de5
X-Msg-Generator: CA
X-RootMTR: 20190627125803eucas1p1eb6a37f5fa96fd732e41ab1501367de5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190627125803eucas1p1eb6a37f5fa96fd732e41ab1501367de5
References: <CGME20190627125803eucas1p1eb6a37f5fa96fd732e41ab1501367de5@eucas1p1.samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1561640284;
 bh=fgQPkZ+qNSfjVPEvknAlGgFpuJaobLYqy/q5w+0niyc=;
 h=From:Subject:To:Cc:Date:References:From;
 b=V7Uh1+8OCd7DU5GBWm4ds1WVWfRKXD8bzOlWl6WMKe09th6oVWdAyyIZGkJXd0b0R
 WaYKUDGmlZT+ITMf8F6Vq2fC460404vvTWmhAXh5ftSHyPgujR+eiErAvoEwNIpzrf
 7DOcCIWNAzqE6KbXATfghCpuO6dU6I6eEcHiEmzk=
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
Cc: Jingoo Han <jingoohan1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIC0+c2NyZWVuX2J1ZmZlciBpbnN0ZWFkIG9mIC0+c2NyZWVuX2Jhc2UgdG8gZml4IHNwYXJz
ZSB3YXJuaW5ncy4KClsgUGxlYXNlIHNlZSBjb21taXQgMTdhN2IwYjRkOTc0ICgiZmIuaDogUHJv
dmlkZSBhbHRlcm5hdGUgc2NyZWVuX2Jhc2UKICBwb2ludGVyIikgZm9yIGRldGFpbHMuIF0KClJl
cG9ydGVkLWJ5OiBrYnVpbGQgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KQ2M6IEppbmdvbyBI
YW4gPGppbmdvb2hhbjFAZ21haWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBCYXJ0bG9taWVqIFpvbG5p
ZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+Ci0tLQogZHJpdmVycy92aWRlby9m
YmRldi9zM2MtZmIuYyB8ICAgMTIgKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNl
cnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKSW5kZXg6IGIvZHJpdmVycy92aWRlby9mYmRldi9z
M2MtZmIuYwo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvczNjLWZiLmMKKysr
IGIvZHJpdmVycy92aWRlby9mYmRldi9zM2MtZmIuYwpAQCAtMTEwNSwxNCArMTEwNSwxNCBAQCBz
dGF0aWMgaW50IHMzY19mYl9hbGxvY19tZW1vcnkoc3RydWN0IHMzCiAKIAlkZXZfZGJnKHNmYi0+
ZGV2LCAid2FudCAldSBieXRlcyBmb3Igd2luZG93XG4iLCBzaXplKTsKIAotCWZiaS0+c2NyZWVu
X2Jhc2UgPSBkbWFfYWxsb2Nfd2Moc2ZiLT5kZXYsIHNpemUsICZtYXBfZG1hLCBHRlBfS0VSTkVM
KTsKLQlpZiAoIWZiaS0+c2NyZWVuX2Jhc2UpCisJZmJpLT5zY3JlZW5fYnVmZmVyID0gZG1hX2Fs
bG9jX3djKHNmYi0+ZGV2LCBzaXplLCAmbWFwX2RtYSwgR0ZQX0tFUk5FTCk7CisJaWYgKCFmYmkt
PnNjcmVlbl9idWZmZXIpCiAJCXJldHVybiAtRU5PTUVNOwogCiAJZGV2X2RiZyhzZmItPmRldiwg
Im1hcHBlZCAleCB0byAlcFxuIiwKLQkJKHVuc2lnbmVkIGludCltYXBfZG1hLCBmYmktPnNjcmVl
bl9iYXNlKTsKKwkJKHVuc2lnbmVkIGludCltYXBfZG1hLCBmYmktPnNjcmVlbl9idWZmZXIpOwog
Ci0JbWVtc2V0KGZiaS0+c2NyZWVuX2Jhc2UsIDB4MCwgc2l6ZSk7CisJbWVtc2V0KGZiaS0+c2Ny
ZWVuX2J1ZmZlciwgMHgwLCBzaXplKTsKIAlmYmktPmZpeC5zbWVtX3N0YXJ0ID0gbWFwX2RtYTsK
IAogCXJldHVybiAwOwpAQCAtMTEyOSw5ICsxMTI5LDkgQEAgc3RhdGljIHZvaWQgczNjX2ZiX2Zy
ZWVfbWVtb3J5KHN0cnVjdCBzMwogewogCXN0cnVjdCBmYl9pbmZvICpmYmkgPSB3aW4tPmZiaW5m
bzsKIAotCWlmIChmYmktPnNjcmVlbl9iYXNlKQorCWlmIChmYmktPnNjcmVlbl9idWZmZXIpCiAJ
CWRtYV9mcmVlX3djKHNmYi0+ZGV2LCBQQUdFX0FMSUdOKGZiaS0+Zml4LnNtZW1fbGVuKSwKLQkJ
ICAgICAgICAgICAgZmJpLT5zY3JlZW5fYmFzZSwgZmJpLT5maXguc21lbV9zdGFydCk7CisJCQkg
ICAgZmJpLT5zY3JlZW5fYnVmZmVyLCBmYmktPmZpeC5zbWVtX3N0YXJ0KTsKIH0KIAogLyoqCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
