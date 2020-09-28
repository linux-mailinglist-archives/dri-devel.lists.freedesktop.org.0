Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D84227BDBA
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 09:13:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3B546E44F;
	Tue, 29 Sep 2020 07:13:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04AFC89DA5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 14:07:52 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 0ACF05DBB2DF5A618A7E;
 Mon, 28 Sep 2020 22:07:50 +0800 (CST)
Received: from [10.174.179.92] (10.174.179.92) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Mon, 28 Sep 2020 22:07:43 +0800
Subject: Re: [PATCH] drm: bridge: adv7511: make adv7511_hdmi_hw_params() static
To: <a.hajda@samsung.com>, <narmstrong@baylibre.com>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@siol.net>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <bogdan.togorean@analog.com>, <dri-devel@lists.freedesktop.org>
References: <20200912033826.142923-1-yanaijie@huawei.com>
From: Jason Yan <yanaijie@huawei.com>
Message-ID: <bbbc9ad6-f763-7910-c1af-7cf24f681112@huawei.com>
Date: Mon, 28 Sep 2020 22:07:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200912033826.142923-1-yanaijie@huawei.com>
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cGluZy4uLgoK1NogMjAyMC85LzEyIDExOjM4LCBKYXNvbiBZYW4g0LS1wDoKPiBUaGlzIGVsaW1p
bmF0ZXMgdGhlIGZvbGxvd2luZyBzcGFyc2Ugd2FybmluZzoKPiAKPiBkcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9hdWRpby5jOjU4OjU6IHdhcm5pbmc6IHN5bWJvbAo+ICdh
ZHY3NTExX2hkbWlfaHdfcGFyYW1zJyB3YXMgbm90IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUgc3Rh
dGljPwo+IAo+IFJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBKYXNvbiBZYW4gPHlhbmFpamllQGh1YXdlaS5jb20+Cj4gLS0tCj4gICBk
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9hdWRpby5jIHwgNiArKystLS0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2F1ZGlv
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9hdWRpby5jCj4gaW5k
ZXggZjEwMWRkMjgxOWI1Li40NTgzOGJkMDhkMzcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfYXVkaW8uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2F1ZGlvLmMKPiBAQCAtNTUsOSArNTUsOSBAQCBzdGF0
aWMgaW50IGFkdjc1MTFfdXBkYXRlX2N0c19uKHN0cnVjdCBhZHY3NTExICphZHY3NTExKQo+ICAg
CXJldHVybiAwOwo+ICAgfQo+ICAgCj4gLWludCBhZHY3NTExX2hkbWlfaHdfcGFyYW1zKHN0cnVj
dCBkZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKPiAtCQkJICAgc3RydWN0IGhkbWlfY29kZWNfZGFp
Zm10ICpmbXQsCj4gLQkJCSAgIHN0cnVjdCBoZG1pX2NvZGVjX3BhcmFtcyAqaHBhcm1zKQo+ICtz
dGF0aWMgaW50IGFkdjc1MTFfaGRtaV9od19wYXJhbXMoc3RydWN0IGRldmljZSAqZGV2LCB2b2lk
ICpkYXRhLAo+ICsJCQkJICBzdHJ1Y3QgaGRtaV9jb2RlY19kYWlmbXQgKmZtdCwKPiArCQkJCSAg
c3RydWN0IGhkbWlfY29kZWNfcGFyYW1zICpocGFybXMpCj4gICB7Cj4gICAJc3RydWN0IGFkdjc1
MTEgKmFkdjc1MTEgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPiAgIAl1bnNpZ25lZCBpbnQgYXVk
aW9fc291cmNlLCBpMnNfZm9ybWF0ID0gMDsKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
