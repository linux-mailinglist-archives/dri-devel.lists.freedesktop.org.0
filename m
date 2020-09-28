Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A66A527BDCE
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 09:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C218D89BD5;
	Tue, 29 Sep 2020 07:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5EF989DA5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 14:09:06 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 09CC41CD6F86B26EBFDA;
 Mon, 28 Sep 2020 22:09:03 +0800 (CST)
Received: from [10.174.179.92] (10.174.179.92) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Mon, 28 Sep 2020 22:08:56 +0800
Subject: Re: [PATCH] drm/bridge: analogix_dp: make
 analogix_dp_start_aux_transaction() static
To: <a.hajda@samsung.com>, <narmstrong@baylibre.com>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@siol.net>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
References: <20200912033843.143240-1-yanaijie@huawei.com>
From: Jason Yan <yanaijie@huawei.com>
Message-ID: <d7e82350-206a-9975-9a4b-78925f33d857@huawei.com>
Date: Mon, 28 Sep 2020 22:08:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200912033843.143240-1-yanaijie@huawei.com>
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
YnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4X2RwX3JlZy5jOjUyNzo1OiB3YXJuaW5nOiBzeW1ib2wK
PiAnYW5hbG9naXhfZHBfc3RhcnRfYXV4X3RyYW5zYWN0aW9uJyB3YXMgbm90IGRlY2xhcmVkLiBT
aG91bGQgaXQgYmUKPiBzdGF0aWM/Cj4gCj4gUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtj
aUBodWF3ZWkuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEphc29uIFlhbiA8eWFuYWlqaWVAaHVhd2Vp
LmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhf
ZHBfcmVnLmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dp
eC9hbmFsb2dpeF9kcF9yZWcuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5h
bG9naXhfZHBfcmVnLmMKPiBpbmRleCA5MTRjNTY5YWI4YzEuLmZhZmI0YjQ5MmVhMCAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4X2RwX3JlZy5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeF9kcF9yZWcu
Ywo+IEBAIC01MjQsNyArNTI0LDcgQEAgdm9pZCBhbmFsb2dpeF9kcF9lbmFibGVfc3dfZnVuY3Rp
b24oc3RydWN0IGFuYWxvZ2l4X2RwX2RldmljZSAqZHApCj4gICAJd3JpdGVsKHJlZywgZHAtPnJl
Z19iYXNlICsgQU5BTE9HSVhfRFBfRlVOQ19FTl8xKTsKPiAgIH0KPiAgIAo+IC1pbnQgYW5hbG9n
aXhfZHBfc3RhcnRfYXV4X3RyYW5zYWN0aW9uKHN0cnVjdCBhbmFsb2dpeF9kcF9kZXZpY2UgKmRw
KQo+ICtzdGF0aWMgaW50IGFuYWxvZ2l4X2RwX3N0YXJ0X2F1eF90cmFuc2FjdGlvbihzdHJ1Y3Qg
YW5hbG9naXhfZHBfZGV2aWNlICpkcCkKPiAgIHsKPiAgIAlpbnQgcmVnOwo+ICAgCWludCByZXR2
YWwgPSAwOwo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
