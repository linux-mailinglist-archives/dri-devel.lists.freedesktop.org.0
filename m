Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C28827BDB8
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 09:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE0A89FD3;
	Tue, 29 Sep 2020 07:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D7CC89DA5;
 Mon, 28 Sep 2020 14:07:01 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 644D99080E9949794B51;
 Mon, 28 Sep 2020 22:06:54 +0800 (CST)
Received: from [10.174.179.92] (10.174.179.92) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Mon, 28 Sep 2020 22:06:43 +0800
Subject: Re: [PATCH] drm/amd/display: add debugfs entry for trigger_hotplug
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <mikita.lipski@amd.com>, <eryk.brol@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20200912022214.3767954-1-yanaijie@huawei.com>
From: Jason Yan <yanaijie@huawei.com>
Message-ID: <8097f391-c62e-5b4d-a1d4-d2661714066e@huawei.com>
Date: Mon, 28 Sep 2020 22:06:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200912022214.3767954-1-yanaijie@huawei.com>
X-Originating-IP: [10.174.179.92]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 29 Sep 2020 07:12:58 +0000
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
Cc: Hulk Robot <hulkci@huawei.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cGluZy4uLgoK5ZyoIDIwMjAvOS8xMiAxMDoyMiwgSmFzb24gWWFuIOWGmemBkzoKPiBUaGUgJ3Ry
aWdnZXJfaG90cGx1ZycgZW50cnkgaW4gZGVidWdmcyBpcyBkZWZpbmVkIGJ1dCBub3Qgd2lyZWQg
dXAuIFRoaXMKPiBjYXVzZXMgYSBnY2Mgd2FybmluZyBidWlsZCB3aXRoIFc9MS4KPiAKPiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fZGVi
dWdmcy5jOjIwNDU6Mzc6Cj4gd2FybmluZzog4oCYZHBfdHJpZ2dlcl9ob3RwbHVnX2RlYnVnZnNf
Zm9wc+KAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZAo+IFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1d
Cj4gICAyMDQ1IHwgc3RhdGljIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJhdGlvbnMKPiAgICAgICAg
ZHBfdHJpZ2dlcl9ob3RwbHVnX2RlYnVnZnNfZm9wcyA9IHsKPiAgICAgICAgfAo+IF5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiAKPiBSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVs
a2NpQGh1YXdlaS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSmFzb24gWWFuIDx5YW5haWppZUBodWF3
ZWkuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG1fZGVidWdmcy5jIHwgMSArCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9k
bS9hbWRncHVfZG1fZGVidWdmcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG1fZGVidWdmcy5jCj4gaW5kZXggOTRmY2IwODYxNTRjLi45NzJjNzgwYjYy
OTMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG1fZGVidWdmcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG1fZGVidWdmcy5jCj4gQEAgLTIxMTUsNiArMjExNSw3IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3Qgewo+ICAgCQl7ImRzY19waWNfaGVpZ2h0IiwgJmRwX2RzY19waWNfaGVp
Z2h0X2RlYnVnZnNfZm9wc30sCj4gICAJCXsiZHNjX2NodW5rX3NpemUiLCAmZHBfZHNjX2NodW5r
X3NpemVfZGVidWdmc19mb3BzfSwKPiAgIAkJeyJkc2Nfc2xpY2VfYnBnIiwgJmRwX2RzY19zbGlj
ZV9icGdfb2Zmc2V0X2RlYnVnZnNfZm9wc30sCj4gKwkJeyJ0cmlnZ2VyX2hvdHBsdWciLCAmZHBf
dHJpZ2dlcl9ob3RwbHVnX2RlYnVnZnNfZm9wc30sCj4gICAJCXsiZHBfZHNjX2ZlY19zdXBwb3J0
IiwgJmRwX2RzY19mZWNfc3VwcG9ydF9mb3BzfQo+ICAgfTsKPiAgIAo+IApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
