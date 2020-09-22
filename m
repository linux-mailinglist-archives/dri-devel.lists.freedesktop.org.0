Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF789273C7C
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 09:48:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840DB6E7FE;
	Tue, 22 Sep 2020 07:48:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D39016E5D4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 02:33:28 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id A910716B416F9FC71983;
 Tue, 22 Sep 2020 10:33:26 +0800 (CST)
Received: from [10.174.179.91] (10.174.179.91) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Tue, 22 Sep 2020 10:33:21 +0800
Subject: Re: [PATCH -next] gpu: host1x: simplify the return expression of
 host1x_cdma_init()
To: Mikko Perttunen <cyndis@kapsi.fi>, Thierry Reding
 <thierry.reding@gmail.com>
References: <20200921131032.91972-1-miaoqinglang@huawei.com>
 <4378d69a-2338-779f-ab4d-3c64fbf7dfd3@kapsi.fi>
From: miaoqinglang <miaoqinglang@huawei.com>
Message-ID: <1d224422-a67d-8157-4212-646098f223c9@huawei.com>
Date: Tue, 22 Sep 2020 10:33:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <4378d69a-2338-779f-ab4d-3c64fbf7dfd3@kapsi.fi>
X-Originating-IP: [10.174.179.91]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 22 Sep 2020 07:46:36 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgrlnKggMjAyMC85LzIxIDIxOjEyLCBNaWtrbyBQZXJ0dHVuZW4g5YaZ6YGTOgo+IE9uIDkvMjEv
MjAgNDoxMCBQTSwgUWluZ2xhbmcgTWlhbyB3cm90ZToKPj4gU2ltcGxpZnkgdGhlIHJldHVybiBl
eHByZXNzaW9uLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBRaW5nbGFuZyBNaWFvIDxtaWFvcWluZ2xh
bmdAaHVhd2VpLmNvbT4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvZ3B1L2hvc3QxeC9jZG1hLmMgfCA4
ICstLS0tLS0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNyBkZWxldGlv
bnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2hvc3QxeC9jZG1hLmMgYi9kcml2
ZXJzL2dwdS9ob3N0MXgvY2RtYS5jCj4+IGluZGV4IGU4ZDNmZGE5MS4uMDhhMGY5ZTEwIDEwMDY0
NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9ob3N0MXgvY2RtYS5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1
L2hvc3QxeC9jZG1hLmMKPj4gQEAgLTQ0OCw4ICs0NDgsNiBAQCB2b2lkIGhvc3QxeF9jZG1hX3Vw
ZGF0ZV9zeW5jX3F1ZXVlKHN0cnVjdCAKPj4gaG9zdDF4X2NkbWEgKmNkbWEsCj4+IMKgwqAgKi8K
Pj4gwqAgaW50IGhvc3QxeF9jZG1hX2luaXQoc3RydWN0IGhvc3QxeF9jZG1hICpjZG1hKQo+PiDC
oCB7Cj4+IC3CoMKgwqAgaW50IGVycjsKPj4gLQo+PiDCoMKgwqDCoMKgIG11dGV4X2luaXQoJmNk
bWEtPmxvY2spOwo+PiDCoMKgwqDCoMKgIGluaXRfY29tcGxldGlvbigmY2RtYS0+Y29tcGxldGUp
Owo+PiBAQCAtNDU5LDExICs0NTcsNyBAQCBpbnQgaG9zdDF4X2NkbWFfaW5pdChzdHJ1Y3QgaG9z
dDF4X2NkbWEgKmNkbWEpCj4+IMKgwqDCoMKgwqAgY2RtYS0+cnVubmluZyA9IGZhbHNlOwo+PiDC
oMKgwqDCoMKgIGNkbWEtPnRvcm5kb3duID0gZmFsc2U7Cj4+IC3CoMKgwqAgZXJyID0gaG9zdDF4
X3B1c2hidWZmZXJfaW5pdCgmY2RtYS0+cHVzaF9idWZmZXIpOwo+PiAtwqDCoMKgIGlmIChlcnIp
Cj4+IC3CoMKgwqDCoMKgwqDCoCByZXR1cm4gZXJyOwo+PiAtCj4+IC3CoMKgwqAgcmV0dXJuIDA7
Cj4+ICvCoMKgwqAgcmV0dXJuIGhvc3QxeF9wdXNoYnVmZmVyX2luaXQoJmNkbWEtPnB1c2hfYnVm
ZmVyKTsKPiAKPiBJTUhPLCB0aGlzIG1ha2VzIGl0IGxlc3MgcmVhZGFibGUgc2luY2Ugbm93IGl0
IGtpbmQgb2YgbG9va3MgbGlrZSAKPiBob3N0MXhfcHVzaGJ1ZmZlcl9pbml0IGlzIHJldHVybmlu
ZyBzb21lIG1lYW5pbmdmdWwgdmFsdWUsIGluc3RlYWQgb2YgCj4gdGhlIGNvZGUganVzdCBoYW5k
bGluZyBlcnJvciB2YWx1ZXMgaW4gYSBzZXF1ZW5jZS4KPiAKPiBNaWtrbwo+IApIaSBNaWtrbywK
Ckl0IHNvdW5kcyByZXNvbmFibGUsIHRoYW5rcyBmb3IgeW91ciByZXBseS4KCj4+IMKgIH0KPj4g
wqAgLyoKPj4KPiAuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
