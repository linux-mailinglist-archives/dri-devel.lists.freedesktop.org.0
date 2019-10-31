Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DBFEBEFF
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 09:10:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC2889FED;
	Fri,  1 Nov 2019 08:10:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E176EE8D
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 13:33:48 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 59160C34EDB324E71694;
 Thu, 31 Oct 2019 21:33:44 +0800 (CST)
Received: from [127.0.0.1] (10.133.213.239) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0;
 Thu, 31 Oct 2019 21:33:40 +0800
Subject: Re: [PATCH -next] gpu: host1x: Fix compile test failure
To: Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
 <mperttunen@nvidia.com>, <arnd@arndb.de>, <seanpaul@chromium.org>
References: <20191030135458.27960-1-yuehaibing@huawei.com>
 <283304d6-bf23-8107-29b6-9f3e7dda943c@gmail.com>
From: Yuehaibing <yuehaibing@huawei.com>
Message-ID: <cb0a976a-0148-d554-15ff-5f4059eccd37@huawei.com>
Date: Thu, 31 Oct 2019 21:33:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <283304d6-bf23-8107-29b6-9f3e7dda943c@gmail.com>
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 01 Nov 2019 08:09:55 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS8xMC8zMSA2OjI2LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMzAuMTAuMjAxOSAx
Njo1NCwgWXVlSGFpYmluZyDQv9C40YjQtdGCOgo+PiBJZiBJT01NVV9TVVBQT1JUIGlzIG5vdCBz
ZXQsIGJ1dCBJT01NVV9JT1ZBIGlzIG0gYW5kCj4+IENPTVBJTEVfVEVTVCBpcyB5LCBidWlsZGlu
ZyBmYWlsczoKPj4KPj4gZHJpdmVycy9ncHUvaG9zdDF4L2Rldi5vOiBJbiBmdW5jdGlvbiBgaG9z
dDF4X3JlbW92ZSc6Cj4+IGRldi5jOigudGV4dCsweDYyNCk6IHVuZGVmaW5lZCByZWZlcmVuY2Ug
dG8gYHB1dF9pb3ZhX2RvbWFpbicKPj4gZGV2LmM6KC50ZXh0KzB4NjI0KTogcmVsb2NhdGlvbiB0
cnVuY2F0ZWQgdG8gZml0OiBSX0FBUkNINjRfQ0FMTDI2IGFnYWluc3QgdW5kZWZpbmVkIHN5bWJv
bCBgcHV0X2lvdmFfZG9tYWluJwo+PiBkZXYuYzooLnRleHQrMHg2MmMpOiB1bmRlZmluZWQgcmVm
ZXJlbmNlIHRvIGBpb3ZhX2NhY2hlX3B1dCcKPj4gZGV2LmM6KC50ZXh0KzB4NjJjKTogcmVsb2Nh
dGlvbiB0cnVuY2F0ZWQgdG8gZml0OiBSX0FBUkNINjRfQ0FMTDI2IGFnYWluc3QgdW5kZWZpbmVk
IHN5bWJvbCBgaW92YV9jYWNoZV9wdXQnCj4+Cj4+IFNlbGVjdCBJT01NVV9JT1ZBIHdoaWxlIENP
TVBJTEVfVEVTVCBpcyBzZXQgdG8gZml4IHRoaXMuCj4+Cj4+IFJlcG9ydGVkLWJ5OiBIdWxrIFJv
Ym90IDxodWxrY2lAaHVhd2VpLmNvbT4KPj4gRml4ZXM6IDUyNDk5YTZhZDJhZSAoImdwdTogaG9z
dDF4OiBzZWxlY3QgSU9NTVVfSU9WQSIpCj4+IFNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1
ZWhhaWJpbmdAaHVhd2VpLmNvbT4KPj4gLS0tCj4+ICBkcml2ZXJzL2dwdS9ob3N0MXgvS2NvbmZp
ZyB8IDIgKy0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvaG9zdDF4L0tjb25maWcgYi9kcml2ZXJz
L2dwdS9ob3N0MXgvS2NvbmZpZwo+PiBpbmRleCBjZjk4N2EzLi4zNTQyMzJkIDEwMDY0NAo+PiAt
LS0gYS9kcml2ZXJzL2dwdS9ob3N0MXgvS2NvbmZpZwo+PiArKysgYi9kcml2ZXJzL2dwdS9ob3N0
MXgvS2NvbmZpZwo+PiBAQCAtMiw3ICsyLDcgQEAKPj4gIGNvbmZpZyBURUdSQV9IT1NUMVgKPj4g
IAl0cmlzdGF0ZSAiTlZJRElBIFRlZ3JhIGhvc3QxeCBkcml2ZXIiCj4+ICAJZGVwZW5kcyBvbiBB
UkNIX1RFR1JBIHx8IChBUk0gJiYgQ09NUElMRV9URVNUKQo+PiAtCXNlbGVjdCBJT01NVV9JT1ZB
IGlmIElPTU1VX1NVUFBPUlQKPj4gKwlzZWxlY3QgSU9NTVVfSU9WQSBpZiAoSU9NTVVfU1VQUE9S
VCB8fCBDT01QSUxFX1RFU1QpCj4+ICAJaGVscAo+PiAgCSAgRHJpdmVyIGZvciB0aGUgTlZJRElB
IFRlZ3JhIGhvc3QxeCBoYXJkd2FyZS4KPj4gIAo+Pgo+IAo+IEl0IHNob3VsZCBiZSBiZXR0ZXIg
dG8gdW5jb25kaXRpb25hbGx5IHNlbGVjdCBJT01NVV9JT1ZBIGhlcmUuCj4gCj4gVGhlIHNhbWUg
Y291bGQgYmUgZG9uZSBmb3IgZHJpdmVycy9zdGFnaW5nL21lZGlhL3RlZ3JhLXZkZS8gYW5kCj4g
ZHJpdmVycy9ncHUvaG9zdDF4LywgcGxlYXNlIHNlZSBbMV0uCgpZZXAsIEkgd2lsbCByZXBvc3Qs
IHRoYW5rcyEKCj4gCj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWlvbW11LzIw
MTkwODI5MTU0OTAyLkdDMTk4NDJAdWxtby8KPiAKPiAuCj4gCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
