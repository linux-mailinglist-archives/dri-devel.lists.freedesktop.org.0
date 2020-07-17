Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1F02235A3
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 09:22:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 884D56ED0D;
	Fri, 17 Jul 2020 07:22:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37256E2BC
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 01:32:28 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id ED2CFCB7FADA5FB032E4;
 Fri, 17 Jul 2020 09:32:25 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.91) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Fri, 17 Jul 2020
 09:32:22 +0800
Subject: Re: [PATCH -next] gpu: host1x: Convert to DEFINE_SHOW_ATTRIBUTE
To: Thierry Reding <thierry.reding@gmail.com>
References: <20200716090323.13274-1-miaoqinglang@huawei.com>
 <20200716133450.GJ535268@ulmo>
From: miaoqinglang <miaoqinglang@huawei.com>
Message-ID: <5684dcb3-c5a4-96c1-dd96-c44f5a94938f@huawei.com>
Date: Fri, 17 Jul 2020 09:32:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200716133450.GJ535268@ulmo>
X-Originating-IP: [10.174.179.91]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 17 Jul 2020 07:22:00 +0000
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
Cc: linux-tegra@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CuWcqCAyMDIwLzcvMTYgMjE6MzQsIFRoaWVycnkgUmVkaW5nIOWGmemBkzoKPiBPbiBUaHUsIEp1
bCAxNiwgMjAyMCBhdCAwNTowMzoyM1BNICswODAwLCBRaW5nbGFuZyBNaWFvIHdyb3RlOgo+PiBG
cm9tOiBZb25ncWlhbmcgTGl1IDxsaXV5b25ncWlhbmcxM0BodWF3ZWkuY29tPgo+Pgo+PiBVc2Ug
REVGSU5FX1NIT1dfQVRUUklCVVRFIG1hY3JvIHRvIHNpbXBsaWZ5IHRoZSBjb2RlLgo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTGl1IDxsaXV5b25ncWlhbmcxM0BodWF3ZWkuY29tPgo+
PiAtLS0KPj4gICBkcml2ZXJzL2dwdS9ob3N0MXgvZGVidWcuYyB8IDI4ICsrKystLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyNCBk
ZWxldGlvbnMoLSkKPiBUaGlzIGRvZXNuJ3QgYXBwbHkuIENhbiB5b3UgcGxlYXNlIHJlc2VuZCwg
YmFzZWQgb24gc29tZXRoaW5nIGxpa2UKPiBsaW51eC1uZXh0Pwo+Cj4gVGhhbmtzLAo+IFRoaWVy
cnkKSGksIFRoaWVycnkKCiDCoCBTb3JyeSBJIGRpZG4ndCBtZW50aW9uIGl0IGluIGNvbW1pdCBs
b2csIGJ1dCB0aGlzIHBhdGNoIGlzIGJhc2VkIG9uIApsaW51eC1uZXh0IHdoZXJlIGNvbW1pdCA8
NGQ0OTAxYzZkNz4gaGFzIHN3aXRjaGVkIG92ZXIgZGlyZWN0wqAgc2VxX3JlYWQgCm1ldGhvZCBj
YWxscyB0byBzZXFfcmVhZF9pdGVyLCB0aGlzIGlzIHdoeSB0aGVyZSdzIGNvbmZsaWN0IGluwqAg
eW91ciBhcHBseS4KCiDCoCBEbyB5b3UgdGhpbmsgSSBzaG91bGQgc2VuZCBhIG5ldyBwYXRjaCBi
YXNlZCBvbiA1LjhyYz8KClRoYW5rcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
