Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B416273C87
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 09:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3309D6E825;
	Tue, 22 Sep 2020 07:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B5B6E5D4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 02:32:30 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 095C3B7D920535714ADE;
 Tue, 22 Sep 2020 10:32:26 +0800 (CST)
Received: from [10.174.179.91] (10.174.179.91) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Tue, 22 Sep 2020 10:32:22 +0800
Subject: Re: [PATCH -next] drm: omapdrm: dss: simplify the return expression
 of hdmi_init_pll_data
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20200921131015.91422-1-miaoqinglang@huawei.com>
 <1f22b1c4-d92e-2dc8-7052-f6df23a187a6@ti.com>
From: miaoqinglang <miaoqinglang@huawei.com>
Message-ID: <75a43778-c374-89e3-3f5a-8eea028472e9@huawei.com>
Date: Tue, 22 Sep 2020 10:32:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1f22b1c4-d92e-2dc8-7052-f6df23a187a6@ti.com>
X-Originating-IP: [10.174.179.91]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 22 Sep 2020 07:46:38 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgrlnKggMjAyMC85LzIxIDIxOjM5LCBUb21pIFZhbGtlaW5lbiDlhpnpgZM6Cj4gSGksCj4gCj4g
T24gMjEvMDkvMjAyMCAxNjoxMCwgUWluZ2xhbmcgTWlhbyB3cm90ZToKPj4gU2ltcGxpZnkgdGhl
IHJldHVybiBleHByZXNzaW9uLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBRaW5nbGFuZyBNaWFvIDxt
aWFvcWluZ2xhbmdAaHVhd2VpLmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVycy9ncHUvZHJtL29tYXBk
cm0vZHNzL2hkbWlfcGxsLmMgfCA3ICstLS0tLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDYgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vb21hcGRybS9kc3MvaGRtaV9wbGwuYyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9o
ZG1pX3BsbC5jCj4+IGluZGV4IGNmMmIwMDBmMy4uYzNlODViNjM2IDEwMDY0NAo+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvaGRtaV9wbGwuYwo+PiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vb21hcGRybS9kc3MvaGRtaV9wbGwuYwo+PiBAQCAtMTMxLDcgKzEzMSw2IEBAIHN0YXRp
YyBpbnQgaGRtaV9pbml0X3BsbF9kYXRhKHN0cnVjdCBkc3NfZGV2aWNlICpkc3MsCj4+ICAgewo+
PiAgIAlzdHJ1Y3QgZHNzX3BsbCAqcGxsID0gJmhwbGwtPnBsbDsKPj4gICAJc3RydWN0IGNsayAq
Y2xrOwo+PiAtCWludCByOwo+PiAgIAo+PiAgIAljbGsgPSBkZXZtX2Nsa19nZXQoJnBkZXYtPmRl
diwgInN5c19jbGsiKTsKPj4gICAJaWYgKElTX0VSUihjbGspKSB7Cj4+IEBAIC0xNTEsMTEgKzE1
MCw3IEBAIHN0YXRpYyBpbnQgaGRtaV9pbml0X3BsbF9kYXRhKHN0cnVjdCBkc3NfZGV2aWNlICpk
c3MsCj4+ICAgCj4+ICAgCXBsbC0+b3BzID0gJmhkbWlfcGxsX29wczsKPj4gICAKPj4gLQlyID0g
ZHNzX3BsbF9yZWdpc3Rlcihkc3MsIHBsbCk7Cj4+IC0JaWYgKHIpCj4+IC0JCXJldHVybiByOwo+
PiAtCj4+IC0JcmV0dXJuIDA7Cj4+ICsJcmV0dXJuIGRzc19wbGxfcmVnaXN0ZXIoZHNzLCBwbGwp
Owo+PiAgIH0KPj4gICAKPj4gICBpbnQgaGRtaV9wbGxfaW5pdChzdHJ1Y3QgZHNzX2RldmljZSAq
ZHNzLCBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LAo+Pgo+IAo+IEkgbGlrZSBpdCBtb3Jl
IHdoZW4gdGhlcmUncyBhIHJldHVybiAwIGF0IHRoZSBlbmQgb2YgdGhlIGZ1bmN0aW9uLCBlc3Bl
Y2lhbGx5IGluIGZ1bmN0aW9ucyB3aGVyZQo+IHRoZXJlIGFyZSBtdWx0aXBsZSBjYXNlcyBvZiBp
ZiguLi4pIHJldHVybiByLiBJdCdzIG1vcmUgZWFzaWx5IHJlYWRhYmxlLCBhdCBsZWFzdCB0byBt
eSBleWVzLgo+IAo+ICAgVG9taQoKSGkgVG9taSwKCkdsYWQgdG8ga25vdyB5b3VyIG9wbmlvbiBh
bmQgaXQgc291bmRzIGZpbmUgdG8gbWUuCgpUaGFua3MKCj4gCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
