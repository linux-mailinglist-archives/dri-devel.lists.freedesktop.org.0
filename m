Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1806CDFD
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 14:20:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 830426E3AC;
	Thu, 18 Jul 2019 12:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 678E36E3AC
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 12:20:49 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:59185
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1ho5Ox-0006WJ-FJ; Thu, 18 Jul 2019 14:20:47 +0200
Subject: Re: [PATCH 07/10] drm/tinydrm: Move tinydrm_machine_little_endian()
To: David Lechner <david@lechnology.com>, dri-devel@lists.freedesktop.org
References: <20190717115817.30110-1-noralf@tronnes.org>
 <20190717115817.30110-8-noralf@tronnes.org>
 <a9a68626-fb19-243a-932d-4c864ed683b6@lechnology.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <dd8b08f5-ba3b-542b-6316-53128bd5eb85@tronnes.org>
Date: Thu, 18 Jul 2019 14:20:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a9a68626-fb19-243a-932d-4c864ed683b6@lechnology.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject;
 bh=5x1ui2qAIvM8JzyxxYeYm7tW4h7UlPIhz/dlBqCCIgU=; 
 b=QWvC1ZN55JDtxsQ4hj7qasLE/1aRYFl4HXjAPGaXPIxiKjWWkj47gAiaXnwEJRFkBUmiZxDkZ+t2deBBO54DosquNMHvTo60jMYRnSDygHzeWEr4CXkMIM/dLsDp7g+3qv/Mu9b2MyQJEPaReWCMabZR7R5HiBbm6jAgXXSdtM3L5BLzl6+6KSpzOQtvU9TQppFWm1qR7YcQzehVMAPTPH3IAQ6iZB4S+h3Tsxmu1gebL3wYfW/65xmpte152F/r3WHqr0Iumh0oREfcy+Vr9NH7VsFAKUY592U3OZRSHHTpUaiVy8GEkemJtqCQguzu/Lb75aFwjIxZoa7qYfFkMw==;
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

CgpEZW4gMTcuMDcuMjAxOSAyMi4wOSwgc2tyZXYgRGF2aWQgTGVjaG5lcjoKPiBPbiA3LzE3LzE5
IDY6NTggQU0sIE5vcmFsZiBUcsO4bm5lcyB3cm90ZToKPj4gVGhlIHRpbnlkcm0gaGVscGVyIGlz
IGdvaW5nIGF3YXkgc28gbW92ZSBpdCBpbnRvIHRoZSBvbmx5IHVzZXIgbWlwaS1kYmkuCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgo+PiAt
LS0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vbWlwaS1kYmkuY8KgwqDCoCB8IDE1ICsr
KysrKysrKysrKy0tLQo+PiDCoCBpbmNsdWRlL2RybS90aW55ZHJtL3Rpbnlkcm0taGVscGVycy5o
IHwgMTUgLS0tLS0tLS0tLS0tLS0tCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9u
cygrKSwgMTggZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
dGlueWRybS9taXBpLWRiaS5jCj4+IGIvZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vbWlwaS1kYmku
Ywo+PiBpbmRleCA2YThmMmQ2NjM3N2YuLjczZGIyODdlNWM1MiAxMDA2NDQKPj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3Rpbnlkcm0vbWlwaS1kYmkuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
dGlueWRybS9taXBpLWRiaS5jCj4+IEBAIC02MjgsNiArNjI4LDE1IEBAIHUzMiBtaXBpX2RiaV9z
cGlfY21kX21heF9zcGVlZChzdHJ1Y3Qgc3BpX2RldmljZQo+PiAqc3BpLCBzaXplX3QgbGVuKQo+
PiDCoCB9Cj4+IMKgIEVYUE9SVF9TWU1CT0wobWlwaV9kYmlfc3BpX2NtZF9tYXhfc3BlZWQpOwo+
PiDCoCArc3RhdGljIGJvb2wgbWlwaV9kYmlfbWFjaGluZV9saXR0bGVfZW5kaWFuKHZvaWQpCj4+
ICt7Cj4+ICsjaWYgZGVmaW5lZChfX0xJVFRMRV9FTkRJQU4pCj4+ICvCoMKgwqAgcmV0dXJuIHRy
dWU7Cj4+ICsjZWxzZQo+PiArwqDCoMKgIHJldHVybiBmYWxzZTsKPj4gKyNlbmRpZgo+PiArfQo+
PiArCj4gCj4gSSdtIGtpbmQgb2Ygc3VycHJpc2VkIHRoYXQgdGhlcmUgaXNuJ3Qgc29tZXRoaW5n
IGxpa2UgdGhpcyBlbHNld2hlcmUKPiBpbiB0aGUga2VybmVsIGFscmVhZHkuIFRoZSB3YXkgdGhp
cyBmdW5jdGlvbiBpcyBiZWluZyB1c2VkIGl0IGtpbmQgb2YKPiBzZWVtcyBsaWtlIGl0IHNob3Vs
ZCBiZSBzdGF0aWMgX19hbHdheXNfaW5saW5lIChvciBhIG1hY3JvKSBzbyB0aGF0Cj4gdGhlIGNv
bXBpbGVyIGNhbiBkbyBhIGJldHRlciBqb2Igb3B0aW1pemluZyB0aGUgY29kZSAoYWx0aG91Z2gg
aXQgaXMKPiBhIHZlcnkgbWlub3IgaW1wcm92ZW1lbnQpLgoKSWRlYWxseSB0aGlzIHNob3VsZCBi
ZSBpbiB0aGUgY29yZSBzb21ld2hlcmUsIGJ1dCBJIGRvbid0IHdhbnQgdG8gc3BlbmQKbW9yZSB0
aW1lIG9uIHJlZmFjdG9yaW5nLiBJIGhhdmUgYSB1c2IgZHJpdmVyIHRoYXQgSSB3YW50IHRvIHdy
aXRlIGFuZApJJ3ZlIHdhaXRlZCBuZWFybHkgMiB5ZWFycyBub3cuIEkgZ290IHN1Y2tlZCBpbnRv
IGEgZ2lhbnQgcmVmYWN0b3JpbmcKaG9sZSA6LSkKCkRvaW5nIGEgcXVpY2sgc2NhbiBJIGZvdW5k
IHZpcnRpb19sZWdhY3lfaXNfbGl0dGxlX2VuZGlhbigpIHdoaWNoIGRvZXMKdGhlIHNhbWUsIGJ1
dCBpdCdzIGNsZWFybHkgdmlydGlvIHJlbGF0ZWQgYW5kIEkgZG9uJ3Qgd2FudCB0byBkcmFnIGlu
IHRoYXQuCgpOb3JhbGYuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
