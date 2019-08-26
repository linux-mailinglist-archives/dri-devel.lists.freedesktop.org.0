Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA6B9CC43
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 11:11:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9DD76E219;
	Mon, 26 Aug 2019 09:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1737F6E218
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 09:11:01 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 98E03EE471DA0DD908C3;
 Mon, 26 Aug 2019 17:10:57 +0800 (CST)
Received: from [127.0.0.1] (10.57.77.74) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.439.0; Mon, 26 Aug 2019
 17:10:52 +0800
Subject: Re: [PATCH] drm/hisilicon: Use dev_get_drvdata
To: Chuhong Yuan <hslester96@gmail.com>
References: <20190723103852.3907-1-hslester96@gmail.com>
From: xinliang <z.liuxinliang@hisilicon.com>
Message-ID: <5D63A21B.1020207@hisilicon.com>
Date: Mon, 26 Aug 2019 17:10:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20190723103852.3907-1-hslester96@gmail.com>
X-Originating-IP: [10.57.77.74]
X-CFilter-Loop: Reflected
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
Cc: Rongrong Zou <zourongrong@gmail.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAyMDE5LzcvMjMgMTg6MzgsIENodWhvbmcgWXVhbiB3cm90ZToKPiBJbnN0ZWFkIG9m
IHVzaW5nIHRvX3BjaV9kZXYgKyBwY2lfZ2V0X2RydmRhdGEsCj4gdXNlIGRldl9nZXRfZHJ2ZGF0
YSB0byBtYWtlIGNvZGUgc2ltcGxlci4KPgo+IFNpZ25lZC1vZmYtYnk6IENodWhvbmcgWXVhbiA8
aHNsZXN0ZXI5NkBnbWFpbC5jb20+CgpDaHVob25nLCB0aGFua3MgZm9yIHRoZSBwYXRjaC4gQW5k
IHNvcnJ5IGZvciBsYXRlIHJlcGx5LgpBY2tlZC1ieTogWGlubGlhbmcgTGl1IDx6LmxpdXhpbmxp
YW5nQGhpc2lsaWNvbi5jb20+CkFwcGxpZWQgdG8gZHJtLWhpc2lsaWNvbi1oaWJtYy1uZXh0LgoK
VGhhbmtzLApYaW5saWFuZwoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGli
bWMvaGlibWNfZHJtX2Rydi5jIHwgNiArKy0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vaGlzaWxp
Y29uL2hpYm1jL2hpYm1jX2RybV9kcnYuYwo+IGluZGV4IGNlODllNTY5MzdiMC4uZjBiZTI2M2Zl
ZmY1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNf
ZHJtX2Rydi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19k
cm1fZHJ2LmMKPiBAQCAtNjAsMTYgKzYwLDE0IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciBo
aWJtY19kcml2ZXIgPSB7Cj4gICAKPiAgIHN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgaGlibWNf
cG1fc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gICB7Cj4gLQlzdHJ1Y3QgcGNpX2RldiAq
cGRldiA9IHRvX3BjaV9kZXYoZGV2KTsKPiAtCXN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2ID0g
cGNpX2dldF9kcnZkYXRhKHBkZXYpOwo+ICsJc3RydWN0IGRybV9kZXZpY2UgKmRybV9kZXYgPSBk
ZXZfZ2V0X2RydmRhdGEoZGV2KTsKPiAgIAo+ICAgCXJldHVybiBkcm1fbW9kZV9jb25maWdfaGVs
cGVyX3N1c3BlbmQoZHJtX2Rldik7Cj4gICB9Cj4gICAKPiAgIHN0YXRpYyBpbnQgIF9fbWF5YmVf
dW51c2VkIGhpYm1jX3BtX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gICB7Cj4gLQlzdHJ1
Y3QgcGNpX2RldiAqcGRldiA9IHRvX3BjaV9kZXYoZGV2KTsKPiAtCXN0cnVjdCBkcm1fZGV2aWNl
ICpkcm1fZGV2ID0gcGNpX2dldF9kcnZkYXRhKHBkZXYpOwo+ICsJc3RydWN0IGRybV9kZXZpY2Ug
KmRybV9kZXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPiAgIAo+ICAgCXJldHVybiBkcm1fbW9k
ZV9jb25maWdfaGVscGVyX3Jlc3VtZShkcm1fZGV2KTsKPiAgIH0KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
