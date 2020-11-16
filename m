Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 048712B3E63
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 09:17:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37AB89D7D;
	Mon, 16 Nov 2020 08:17:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33AE89ACD
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 01:09:27 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CZ9vb0T4Qzhb83;
 Mon, 16 Nov 2020 09:09:15 +0800 (CST)
Received: from [10.174.177.160] (10.174.177.160) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Mon, 16 Nov 2020 09:09:15 +0800
Subject: Re: [PATCH] drm/sun4i: dw-hdmi: fix error return code in
 sun8i_dw_hdmi_bind()
To: =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@siol.net>,
 <airlied@linux.ie>, <daniel@ffwll.ch>
References: <1605186891-47282-1-git-send-email-wangxiongfeng2@huawei.com>
 <6119042.uhm7frSX9h@jernej-laptop>
From: Xiongfeng Wang <wangxiongfeng2@huawei.com>
Message-ID: <fc7c7191-52d2-2a00-57b3-7b19f4e72955@huawei.com>
Date: Mon, 16 Nov 2020 09:09:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <6119042.uhm7frSX9h@jernej-laptop>
X-Originating-IP: [10.174.177.160]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 16 Nov 2020 08:17:48 +0000
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
Cc: linux-arm-kernel@lists.infradead.org, chenzhou10@huawei.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkhCgpPbiAyMDIwLzExLzE0IDI6MDEsIEplcm5laiDFoGtyYWJlYyB3cm90ZToKPiBIaSEKPiAK
PiBUaGFua3MgZm9yIHRoZSBwYXRjaC4KPiAKPiBEbmUgxI1ldHJ0ZWssIDEyLiBub3ZlbWJlciAy
MDIwIG9iIDE0OjE0OjUxIENFVCBqZSBYaW9uZ2ZlbmcgV2FuZyBuYXBpc2FsKGEpOgo+PiBGaXgg
dG8gcmV0dXJuIGEgbmVnYXRpdmUgZXJyb3IgY29kZSBmcm9tIHRoZSBlcnJvciBoYW5kbGluZyBj
YXNlIGluc3RlYWQKPj4gb2YgMCBpbiBmdW5jdGlvbiBzdW44aV9kd19oZG1pX2JpbmQoKS4KPj4K
Pj4gRml4ZXM6IGI3Yzc0MzZhNWZmMCAoImRybS9zdW40aTogSW1wbGVtZW50IEE4M1QgSERNSSBk
cml2ZXIiKQo+PiBSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+Cj4+
IFNpZ25lZC1vZmYtYnk6IFhpb25nZmVuZyBXYW5nIDx3YW5neGlvbmdmZW5nMkBodWF3ZWkuY29t
Pgo+PiAtLS0KPj4gIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW44aV9kd19oZG1pLmMgfCAxICsK
Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3N1bjRpL3N1bjhpX2R3X2hkbWkuYwo+PiBiL2RyaXZlcnMvZ3B1L2RybS9z
dW40aS9zdW44aV9kd19oZG1pLmMgaW5kZXggZDRjMDgwNC4uZjAxMGZlOCAxMDA2NDQKPj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjhpX2R3X2hkbWkuYwo+PiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vc3VuNGkvc3VuOGlfZHdfaGRtaS5jCj4+IEBAIC0yMDgsNiArMjA4LDcgQEAgc3Rh
dGljIGludCBzdW44aV9kd19oZG1pX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QKPj4g
ZGV2aWNlICptYXN0ZXIsIHBoeV9ub2RlID0gb2ZfcGFyc2VfcGhhbmRsZShkZXYtPm9mX25vZGUs
ICJwaHlzIiwgMCk7Cj4+ICAJaWYgKCFwaHlfbm9kZSkgewo+PiAgCQlkZXZfZXJyKGRldiwgIkNh
bid0IGZvdW5kIFBIWSBwaGFuZGxlXG4iKTsKPj4gKwkJcmV0ID0gLUVOT0RFVjsKPiAKPiBUaGF0
IHNob3VsZCBiZSBFSU5WQUwgYmVjYXVzZSBEVCBub2RlIGRvZXNuJ3QgaGF2ZSBtYW5kYXRvcnkg
cHJvcGVydHkuCj4gCj4gV2l0aCB0aGF0IGZpeGVkLCB5b3UgY2FuIGFkZDoKPiBSZXZpZXdlZC1i
eTogSmVybmVqIFNrcmFiZWMgPGplcm5lai5za3JhYmVjQHNpb2wubmV0PgoKVGhhbmtzIGZvciB5
b3VyIHJldmlldyEgSSB3aWxsIGZpeCBpdCBpbiB0aGUgbmV4dCB2ZXJzaW9uLgoKVGhhbmtzLApY
aW9uZ2ZlbmcKCj4gCj4gQmVzdCByZWdhcmRzLAo+IEplcm5lago+IAo+PiAgCQlnb3RvIGVycl9k
aXNhYmxlX2Nsa190bWRzOwo+PiAgCX0KPiAKPiAKPiAKPiAKPiAuCj4gCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
