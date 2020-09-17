Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E16426DD84
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 16:07:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F33C6EC29;
	Thu, 17 Sep 2020 14:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72AF6EA68
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 12:41:26 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id E55CB31BFF30A85B6887;
 Thu, 17 Sep 2020 20:41:23 +0800 (CST)
Received: from [10.174.179.91] (10.174.179.91) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Thu, 17 Sep 2020 20:41:19 +0800
Subject: Re: [PATCH -next] gpu: host1x: Convert to DEFINE_SHOW_ATTRIBUTE
To: Thierry Reding <thierry.reding@gmail.com>
References: <20200716090323.13274-1-miaoqinglang@huawei.com>
 <20200716133450.GJ535268@ulmo>
 <5684dcb3-c5a4-96c1-dd96-c44f5a94938f@huawei.com>
 <20200717142524.GA1218823@ulmo>
From: miaoqinglang <miaoqinglang@huawei.com>
Message-ID: <cc115577-e536-d9d9-4e82-715309c40ad1@huawei.com>
Date: Thu, 17 Sep 2020 20:41:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200717142524.GA1218823@ulmo>
X-Originating-IP: [10.174.179.91]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 17 Sep 2020 14:07:28 +0000
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

CgrlnKggMjAyMC83LzE3IDIyOjI1LCBUaGllcnJ5IFJlZGluZyDlhpnpgZM6Cj4gT24gRnJpLCBK
dWwgMTcsIDIwMjAgYXQgMDk6MzI6MjFBTSArMDgwMCwgbWlhb3FpbmdsYW5nIHdyb3RlOgo+Pgo+
PiDlnKggMjAyMC83LzE2IDIxOjM0LCBUaGllcnJ5IFJlZGluZyDlhpnpgZM6Cj4+PiBPbiBUaHUs
IEp1bCAxNiwgMjAyMCBhdCAwNTowMzoyM1BNICswODAwLCBRaW5nbGFuZyBNaWFvIHdyb3RlOgo+
Pj4+IEZyb206IFlvbmdxaWFuZyBMaXUgPGxpdXlvbmdxaWFuZzEzQGh1YXdlaS5jb20+Cj4+Pj4K
Pj4+PiBVc2UgREVGSU5FX1NIT1dfQVRUUklCVVRFIG1hY3JvIHRvIHNpbXBsaWZ5IHRoZSBjb2Rl
Lgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIExpdSA8bGl1eW9uZ3FpYW5nMTNA
aHVhd2VpLmNvbT4KPj4+PiAtLS0KPj4+PiAgICBkcml2ZXJzL2dwdS9ob3N0MXgvZGVidWcuYyB8
IDI4ICsrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+PiAgICAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCAyNCBkZWxldGlvbnMoLSkKPj4+IFRoaXMgZG9lc24ndCBhcHBseS4g
Q2FuIHlvdSBwbGVhc2UgcmVzZW5kLCBiYXNlZCBvbiBzb21ldGhpbmcgbGlrZQo+Pj4gbGludXgt
bmV4dD8KPj4+Cj4+PiBUaGFua3MsCj4+PiBUaGllcnJ5Cj4+IEhpLCBUaGllcnJ5Cj4+Cj4+ICDC
oCBTb3JyeSBJIGRpZG4ndCBtZW50aW9uIGl0IGluIGNvbW1pdCBsb2csIGJ1dCB0aGlzIHBhdGNo
IGlzIGJhc2VkIG9uCj4+IGxpbnV4LW5leHQgd2hlcmUgY29tbWl0IDw0ZDQ5MDFjNmQ3PiBoYXMg
c3dpdGNoZWQgb3ZlciBkaXJlY3TCoCBzZXFfcmVhZAo+PiBtZXRob2QgY2FsbHMgdG8gc2VxX3Jl
YWRfaXRlciwgdGhpcyBpcyB3aHkgdGhlcmUncyBjb25mbGljdCBpbsKgIHlvdXIgYXBwbHkuCj4+
Cj4+ICDCoCBEbyB5b3UgdGhpbmsgSSBzaG91bGQgc2VuZCBhIG5ldyBwYXRjaCBiYXNlZCBvbiA1
LjhyYz8KPiAKPiBObyBuZWVkIHRvLiBJJ20gYWJvdXQgdG8gc2VuZCBvdXQgdGhlIHB1bGwgcmVx
dWVzdCBmb3IgdjUuOS1yYzEsIHNvIEknbGwKPiBqdXN0IGRlZmVyIHRoaXMgdG8gdjUuMTAgc2lu
Y2UgaXQgZG9lc24ndCBsb29rIGxpa2UgaXQncyBhbnl0aGluZwo+IHVyZ2VudC4KPiAKPiBUaGll
cnJ5Cj4KSGksIFRoaWVycnkKCkkndmUgc2VudCBhIG5ldyBwYXRjaCBhZ2FpbnN0IGxpbnV4LW5l
eHQoMjAyMDA5MTcpLCBhbmQgY2FuIGJlIGFwcGxpZWQgCnRvIG1haW5saW5lIGNsZWFubHkgbm93
LiBTbyBJIHN1Z2dlc3QgeW91IHYyIHBhdGNoLgoKVGhhbmtzLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
