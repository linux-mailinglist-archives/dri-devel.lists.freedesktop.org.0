Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4D9ECBB7
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 23:51:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F1E6F895;
	Fri,  1 Nov 2019 22:51:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B1B6F7C2
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 11:33:48 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id D808A592C0034E188BBA;
 Fri,  1 Nov 2019 19:33:45 +0800 (CST)
Received: from [127.0.0.1] (10.133.213.239) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0;
 Fri, 1 Nov 2019 19:33:42 +0800
Subject: Re: [PATCH -next] gpu: host1x: Fix compile test failure
To: Thierry Reding <thierry.reding@gmail.com>
References: <20191030135458.27960-1-yuehaibing@huawei.com>
 <283304d6-bf23-8107-29b6-9f3e7dda943c@gmail.com>
 <cb0a976a-0148-d554-15ff-5f4059eccd37@huawei.com>
 <20191101094757.GA1167505@ulmo>
From: Yuehaibing <yuehaibing@huawei.com>
Message-ID: <01997f01-27d7-7468-c331-9b2920ad8193@huawei.com>
Date: Fri, 1 Nov 2019 19:33:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20191101094757.GA1167505@ulmo>
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 01 Nov 2019 22:51:09 +0000
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
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mperttunen@nvidia.com, seanpaul@chromium.org,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS8xMS8xIDE3OjQ3LCBUaGllcnJ5IFJlZGluZyB3cm90ZToKPiBPbiBUaHUsIE9jdCAz
MSwgMjAxOSBhdCAwOTozMzozOFBNICswODAwLCBZdWVoYWliaW5nIHdyb3RlOgo+PiBPbiAyMDE5
LzEwLzMxIDY6MjYsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4+IDMwLjEwLjIwMTkgMTY6NTQs
IFl1ZUhhaWJpbmcg0L/QuNGI0LXRgjoKPj4+PiBJZiBJT01NVV9TVVBQT1JUIGlzIG5vdCBzZXQs
IGJ1dCBJT01NVV9JT1ZBIGlzIG0gYW5kCj4+Pj4gQ09NUElMRV9URVNUIGlzIHksIGJ1aWxkaW5n
IGZhaWxzOgo+Pj4+Cj4+Pj4gZHJpdmVycy9ncHUvaG9zdDF4L2Rldi5vOiBJbiBmdW5jdGlvbiBg
aG9zdDF4X3JlbW92ZSc6Cj4+Pj4gZGV2LmM6KC50ZXh0KzB4NjI0KTogdW5kZWZpbmVkIHJlZmVy
ZW5jZSB0byBgcHV0X2lvdmFfZG9tYWluJwo+Pj4+IGRldi5jOigudGV4dCsweDYyNCk6IHJlbG9j
YXRpb24gdHJ1bmNhdGVkIHRvIGZpdDogUl9BQVJDSDY0X0NBTEwyNiBhZ2FpbnN0IHVuZGVmaW5l
ZCBzeW1ib2wgYHB1dF9pb3ZhX2RvbWFpbicKPj4+PiBkZXYuYzooLnRleHQrMHg2MmMpOiB1bmRl
ZmluZWQgcmVmZXJlbmNlIHRvIGBpb3ZhX2NhY2hlX3B1dCcKPj4+PiBkZXYuYzooLnRleHQrMHg2
MmMpOiByZWxvY2F0aW9uIHRydW5jYXRlZCB0byBmaXQ6IFJfQUFSQ0g2NF9DQUxMMjYgYWdhaW5z
dCB1bmRlZmluZWQgc3ltYm9sIGBpb3ZhX2NhY2hlX3B1dCcKPj4+Pgo+Pj4+IFNlbGVjdCBJT01N
VV9JT1ZBIHdoaWxlIENPTVBJTEVfVEVTVCBpcyBzZXQgdG8gZml4IHRoaXMuCj4+Pj4KPj4+PiBS
ZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+Cj4+Pj4gRml4ZXM6IDUy
NDk5YTZhZDJhZSAoImdwdTogaG9zdDF4OiBzZWxlY3QgSU9NTVVfSU9WQSIpCj4+Pj4gU2lnbmVk
LW9mZi1ieTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgo+Pj4+IC0tLQo+Pj4+
ICBkcml2ZXJzL2dwdS9ob3N0MXgvS2NvbmZpZyB8IDIgKy0KPj4+PiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvaG9zdDF4L0tjb25maWcgYi9kcml2ZXJzL2dwdS9ob3N0MXgvS2NvbmZpZwo+Pj4+
IGluZGV4IGNmOTg3YTMuLjM1NDIzMmQgMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvaG9z
dDF4L0tjb25maWcKPj4+PiArKysgYi9kcml2ZXJzL2dwdS9ob3N0MXgvS2NvbmZpZwo+Pj4+IEBA
IC0yLDcgKzIsNyBAQAo+Pj4+ICBjb25maWcgVEVHUkFfSE9TVDFYCj4+Pj4gIAl0cmlzdGF0ZSAi
TlZJRElBIFRlZ3JhIGhvc3QxeCBkcml2ZXIiCj4+Pj4gIAlkZXBlbmRzIG9uIEFSQ0hfVEVHUkEg
fHwgKEFSTSAmJiBDT01QSUxFX1RFU1QpCj4+Pj4gLQlzZWxlY3QgSU9NTVVfSU9WQSBpZiBJT01N
VV9TVVBQT1JUCj4+Pj4gKwlzZWxlY3QgSU9NTVVfSU9WQSBpZiAoSU9NTVVfU1VQUE9SVCB8fCBD
T01QSUxFX1RFU1QpCj4+Pj4gIAloZWxwCj4+Pj4gIAkgIERyaXZlciBmb3IgdGhlIE5WSURJQSBU
ZWdyYSBob3N0MXggaGFyZHdhcmUuCj4+Pj4gIAo+Pj4+Cj4+Pgo+Pj4gSXQgc2hvdWxkIGJlIGJl
dHRlciB0byB1bmNvbmRpdGlvbmFsbHkgc2VsZWN0IElPTU1VX0lPVkEgaGVyZS4KPj4+Cj4+PiBU
aGUgc2FtZSBjb3VsZCBiZSBkb25lIGZvciBkcml2ZXJzL3N0YWdpbmcvbWVkaWEvdGVncmEtdmRl
LyBhbmQKPj4+IGRyaXZlcnMvZ3B1L2hvc3QxeC8sIHBsZWFzZSBzZWUgWzFdLgo+Pgo+PiBZZXAs
IEkgd2lsbCByZXBvc3QsIHRoYW5rcyEKPiAKPiBObyBuZWVkIHRvIHJlc2VuZCwgSSBhbHJlYWR5
IGhhdmUgcGF0Y2hlcyBmb3IgdGhhdC4KCk9rLCB0aGFua3MhCgo+IAo+IFRoaWVycnkKPiAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
