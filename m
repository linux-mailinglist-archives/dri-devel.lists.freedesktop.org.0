Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F28FEFAB7A
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 08:56:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D6A6E5BD;
	Wed, 13 Nov 2019 07:56:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E5076E02A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 03:08:21 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 0FC56FC4C047A1E9C210;
 Wed, 13 Nov 2019 11:08:16 +0800 (CST)
Received: from [127.0.0.1] (10.184.213.217) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0;
 Wed, 13 Nov 2019 11:08:13 +0800
Subject: Re: [PATCH] drm/vmwgfx: remove set but not used variable 'srf'
To: <linux-graphics-maintainer@vmware.com>, <thellstrom@vmware.com>,
 <airlied@linux.ie>, <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
References: <1572529284-88089-1-git-send-email-zhengbin13@huawei.com>
From: "zhengbin (A)" <zhengbin13@huawei.com>
Message-ID: <3f03548d-3309-10a4-7d28-3af4e7d87a8d@huawei.com>
Date: Wed, 13 Nov 2019 11:08:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <1572529284-88089-1-git-send-email-zhengbin13@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.184.213.217]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 13 Nov 2019 07:55:45 +0000
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cGluZwoKT24gMjAxOS8xMC8zMSAyMTo0MSwgemhlbmdiaW4gd3JvdGU6Cj4gRml4ZXMgZ2NjICct
V3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgo+Cj4gZHJpdmVycy9ncHUvZHJtL3Zt
d2dmeC92bXdnZnhfc3VyZmFjZS5jOiBJbiBmdW5jdGlvbiB2bXdfaHdfc3VyZmFjZV9kZXN0cm95
Ogo+IGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3N1cmZhY2UuYzozMzU6MjI6IHdhcm5p
bmc6IHZhcmlhYmxlIHNyZiBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlh
YmxlXQo+Cj4gSXQgaXMgaW50cm9kdWNlZCBieSBjb21taXQgNTQzODMxY2ZjOTc2ICgiZHJtL3Zt
d2dmeDoKPiBCcmVhayBvdXQgc3VyZmFjZSBhbmQgY29udGV4dCBtYW5hZ2VtZW50IHRvIHNlcGFy
YXRlIGZpbGVzIiksCj4gYnV0IG5ldmVyIHVzZWQsIHNvIHJlbW92ZSBpdC4KPgo+IFJlcG9ydGVk
LWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiB6aGVu
Z2JpbiA8emhlbmdiaW4xM0BodWF3ZWkuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vdm13
Z2Z4L3Ztd2dmeF9zdXJmYWNlLmMgfCAyIC0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3N1cmZh
Y2UuYyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3N1cmZhY2UuYwo+IGluZGV4IDI5
ZDg3OTQuLmRlMDUzMGIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdn
Znhfc3VyZmFjZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfc3VyZmFj
ZS5jCj4gQEAgLTMzNiw3ICszMzYsNiBAQCBzdGF0aWMgdm9pZCB2bXdfaHdfc3VyZmFjZV9kZXN0
cm95KHN0cnVjdCB2bXdfcmVzb3VyY2UgKnJlcykKPiAgewo+Cj4gIAlzdHJ1Y3Qgdm13X3ByaXZh
dGUgKmRldl9wcml2ID0gcmVzLT5kZXZfcHJpdjsKPiAtCXN0cnVjdCB2bXdfc3VyZmFjZSAqc3Jm
Owo+ICAJdm9pZCAqY21kOwo+Cj4gIAlpZiAocmVzLT5mdW5jLT5kZXN0cm95ID09IHZtd19nYl9z
dXJmYWNlX2Rlc3Ryb3kpIHsKPiBAQCAtMzYwLDcgKzM1OSw2IEBAIHN0YXRpYyB2b2lkIHZtd19o
d19zdXJmYWNlX2Rlc3Ryb3koc3RydWN0IHZtd19yZXNvdXJjZSAqcmVzKQo+ICAJCSAqLwo+Cj4g
IAkJbXV0ZXhfbG9jaygmZGV2X3ByaXYtPmNtZGJ1Zl9tdXRleCk7Cj4gLQkJc3JmID0gdm13X3Jl
c190b19zcmYocmVzKTsKPiAgCQlkZXZfcHJpdi0+dXNlZF9tZW1vcnlfc2l6ZSAtPSByZXMtPmJh
Y2t1cF9zaXplOwo+ICAJCW11dGV4X3VubG9jaygmZGV2X3ByaXYtPmNtZGJ1Zl9tdXRleCk7Cj4g
IAl9Cj4gLS0KPiAyLjcuNAo+Cj4KPiAuCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
