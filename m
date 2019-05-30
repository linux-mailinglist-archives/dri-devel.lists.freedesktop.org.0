Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2616E30056
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2019 18:47:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B50636E3BC;
	Thu, 30 May 2019 16:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD5806E15E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2019 15:32:23 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 780E2B06B6B9790FDA8F;
 Thu, 30 May 2019 23:31:16 +0800 (CST)
Received: from [127.0.0.1] (10.133.213.239) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0;
 Thu, 30 May 2019 23:31:14 +0800
Subject: Re: [PATCH] drm/nouveau: Fix DEVICE_PRIVATE dependencies
To: <bskeggs@redhat.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <jglisse@redhat.com>, <jgg@mellanox.com>, <rcampbell@nvidia.com>,
 <leonro@mellanox.com>, <akpm@linux-foundation.org>, <sfr@canb.auug.org.au>,
 <gregkh@linuxfoundation.org>, <b.zolnierkie@samsung.com>
References: <20190417142632.12992-1-yuehaibing@huawei.com>
From: Yuehaibing <yuehaibing@huawei.com>
Message-ID: <583de550-d816-f619-d402-688c87c86fe3@huawei.com>
Date: Thu, 30 May 2019 23:31:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20190417142632.12992-1-yuehaibing@huawei.com>
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 30 May 2019 16:46:45 +0000
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLAoKRnJpZW5kbHkgcGluZzoKCldobyBjYW4gdGFrZSB0aGlzPwoKT24gMjAxOS80LzE3
IDIyOjI2LCBZdWUgSGFpYmluZyB3cm90ZToKPiBGcm9tOiBZdWVIYWliaW5nIDx5dWVoYWliaW5n
QGh1YXdlaS5jb20+Cj4gCj4gRHVyaW5nIHJhbmRjb25maWcgYnVpbGRzLCBJIG9jY2FzaW9uYWxs
eSBydW4gaW50byBhbiBpbnZhbGlkIGNvbmZpZ3VyYXRpb24KPiAKPiBXQVJOSU5HOiB1bm1ldCBk
aXJlY3QgZGVwZW5kZW5jaWVzIGRldGVjdGVkIGZvciBERVZJQ0VfUFJJVkFURQo+ICAgRGVwZW5k
cyBvbiBbbl06IEFSQ0hfSEFTX0hNTV9ERVZJQ0UgWz1uXSAmJiBaT05FX0RFVklDRSBbPW5dCj4g
ICBTZWxlY3RlZCBieSBbeV06Cj4gICAtIERSTV9OT1VWRUFVX1NWTSBbPXldICYmIEhBU19JT01F
TSBbPXldICYmIEFSQ0hfSEFTX0hNTSBbPXldICYmIERSTV9OT1VWRUFVIFs9eV0gJiYgU1RBR0lO
RyBbPXldCj4gCj4gbW0vbWVtb3J5Lm86IEluIGZ1bmN0aW9uIGBkb19zd2FwX3BhZ2UnOgo+IG1l
bW9yeS5jOigudGV4dCsweDI3NTQpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBkZXZpY2VfcHJp
dmF0ZV9lbnRyeV9mYXVsdCcKPiAKPiBjb21taXQgNWRhMjUwOTBhYjA0ICgibW0vaG1tOiBrY29u
ZmlnIHNwbGl0IEhNTSBhZGRyZXNzIHNwYWNlIG1pcnJvcmluZyBmcm9tIGRldmljZSBtZW1vcnki
KQo+IHNwbGl0IENPTkZJR19ERVZJQ0VfUFJJVkFURSBkZXBlbmRlbmNpZXMgZnJvbQo+IEFSQ0hf
SEFTX0hNTSB0byBBUkNIX0hBU19ITU1fREVWSUNFIGFuZCBaT05FX0RFVklDRSwKPiBzbyBlbmFi
bGUgRFJNX05PVVZFQVVfU1ZNIHdpbGwgdHJpZ2dlciB0aGlzIHdhcm5pbmcsCj4gY2F1c2UgYnVp
bGRpbmcgZmFpbGVkLgo+IAo+IFJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2Vp
LmNvbT4KPiBGaXhlczogNWRhMjUwOTBhYjA0ICgibW0vaG1tOiBrY29uZmlnIHNwbGl0IEhNTSBh
ZGRyZXNzIHNwYWNlIG1pcnJvcmluZyBmcm9tIGRldmljZSBtZW1vcnkiKQo+IFNpZ25lZC1vZmYt
Ynk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvS2NvbmZpZyB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L0tjb25maWcKPiBpbmRl
eCAwMGNkOWFiLi45OWUzMGMxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L0tjb25maWcKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9LY29uZmlnCj4gQEAgLTc0
LDcgKzc0LDggQEAgY29uZmlnIERSTV9OT1VWRUFVX0JBQ0tMSUdIVAo+ICAKPiAgY29uZmlnIERS
TV9OT1VWRUFVX1NWTQo+ICAJYm9vbCAiKEVYUEVSSU1FTlRBTCkgRW5hYmxlIFNWTSAoU2hhcmVk
IFZpcnR1YWwgTWVtb3J5KSBzdXBwb3J0Igo+IC0JZGVwZW5kcyBvbiBBUkNIX0hBU19ITU0KPiAr
CWRlcGVuZHMgb24gQVJDSF9IQVNfSE1NX0RFVklDRQo+ICsJZGVwZW5kcyBvbiBaT05FX0RFVklD
RQo+ICAJZGVwZW5kcyBvbiBEUk1fTk9VVkVBVQo+ICAJZGVwZW5kcyBvbiBTVEFHSU5HCj4gIAlz
ZWxlY3QgSE1NX01JUlJPUgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
