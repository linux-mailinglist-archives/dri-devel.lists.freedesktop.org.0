Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D287DB24F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 18:27:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF96B6EAD3;
	Thu, 17 Oct 2019 16:27:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA4CE6EAD3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 16:27:47 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:56797
 helo=[192.168.10.177])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1iL8cr-0002gG-Q3; Thu, 17 Oct 2019 18:27:45 +0200
Subject: Re: [PATCH v1] drm/mipi_dbi: Use simple right shift instead of double
 negation
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org
References: <20191017114912.61522-1-andriy.shevchenko@linux.intel.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <56729994-6271-bb30-32d3-5ba18f2ae3c0@tronnes.org>
Date: Thu, 17 Oct 2019 18:27:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191017114912.61522-1-andriy.shevchenko@linux.intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org
 ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lugHXj8K9IKhzWqj35t12Wq62v9RNuGcskTGL/CduMg=; b=dunax6HEblVM9uK2+xA0UXqnGs
 HD1xeqp/cZviVVXShyWxOTTHH8HtS8hdE0DWikQBgM1n1BvySuebDNnK46jpWCSoL8opnBSfA+3do
 f/XbKdRFTea2ijr9QX2S9I1T/PydliUeFcl1a+SHw+EA8md6qcAcdm7Md0n5baT27GFSHxBRQbNSq
 pE17fR0c4YLuS6n0cDZT2zxs7ozN6oSePcxLXPH/SUeFpbPz+J65d5jilMBVXY2OOBO+fmmtCuuKV
 MZ5Sc9rTVPg8PeQ3pj2yDxtsg62h4d8oOC3j3gRWJ+PXkR6hIJsFW5GF78mq91RaW6OJkuUfyq5R6
 pEp6VcUg==;
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

CgpEZW4gMTcuMTAuMjAxOSAxMy40OSwgc2tyZXYgQW5keSBTaGV2Y2hlbmtvOgo+IEdDQyBjb21w
bGFpbnMgYWJvdXQgZHViaW91cyBiaXR3aXNlIE9SIG9wZXJhbmQ6Cj4gCj4gZHJpdmVycy9ncHUv
ZHJtL2RybV9taXBpX2RiaS5jOjEwMjQ6NDk6IHdhcm5pbmc6IGR1YmlvdXM6IHggfCAheQo+ICAg
Q0MgW01dICBkcml2ZXJzL2dwdS9kcm0vZHJtX21pcGlfZGJpLm8KPiAKPiBBcyBsb25nIGFzIGJ1
ZmZlciBpcyBjb25zaXN0IG9mIGJ5dGUgKHU4KSB2YWx1ZXMsIHdlIG1heSB1c2UKPiBzaW1wbGUg
cmlnaHQgc2hpZnQgYW5kIHNhdGlzZnkgY29tcGlsZXIuIEl0IGFsc28gcmVkdWNlcyBhbW91bnQg
b2YKPiBvcGVyYXRpb25zIG5lZWRlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmR5IFNoZXZjaGVu
a28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4KPiAtLS0KClRoYW5rcywgaXQn
cyBldmVuIG1vcmUgcmVhZGFibGUgbm93LCBmb3IgbWUgYXQgbGVhc3QuIEFuZCBzaW5jZSBJIGRv
bid0CnRydXN0IG15IGluLWhlYWQgQyBjb21waWxlci9wYXJzZXIsIEkgcmFuIGEgdGVzdCBhbmQK
L3N5cy9rZXJuZWwvZGVidWcvZHJpLzAvY29tbWFuZCByZXR1cm5zIHRoZSBzYW1lIGZvciBjb21t
YW5kcyAwNEggYW5kCjA5aCB3aGljaCBhcmUgdGhlIG9uZXMgYWZmZWN0ZWQgYnkgdGhpcyBjaGFu
Z2UuCgpSZXZpZXdlZC1ieTogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+ClRl
c3RlZC1ieTogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+CgpUaGlzIHBhdGNo
IGhhc24ndCBzaG93biB1cCBpbiBkcmktZGV2ZWwgcGF0Y2h3b3JrLCBJIGhvcGUgaXQncyBqdXN0
IGEKaGljY3VwIGFuZCBpdCdsbCBzaG93IHVwIGxhdGVyIHNpbmNlIEkgYXBwbHkgcGF0Y2hlcyBm
cm9tIHBhdGNod29yay4KSSBkb24ndCBzZWUgaXQgaW4gdGhlIG1haWxpbmdsaXN0IGFyY2hpdmUg
ZWl0aGVyLCBvbmx5IFNlYW4ncyByZXBsaWVzLApub3QgeW91cnMuIEJ1dCBJIGRvIHNlZSB5b3Vy
IHJlcGxpZXMgdG8gb3RoZXIgcGF0Y2hlcy4gV2UnbGwgc2VlLiBJZiBub3QKdGhlbiBJJ2xsIGhh
dmUgdG8gZXhwb3J0IGl0IGZyb20gV2luZG93cyBUaHVuZGVyYmlyZCBhbmQgZml4IG5ld2xpbmVz
IDovCgpOb3JhbGYuCgo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX21pcGlfZGJpLmMgfCAyICstCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21pcGlfZGJpLmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX21pcGlfZGJpLmMKPiBpbmRleCAxOTYxZjcxM2FhYWIuLjQ0NWU4OGIxZmM5YSAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21pcGlfZGJpLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX21pcGlfZGJpLmMKPiBAQCAtMTAyMSw3ICsxMDIxLDcgQEAgc3RhdGljIGludCBt
aXBpX2RiaV90eXBlYzNfY29tbWFuZF9yZWFkKHN0cnVjdCBtaXBpX2RiaSAqZGJpLCB1OCAqY21k
LAo+ICAJCXVuc2lnbmVkIGludCBpOwo+ICAKPiAgCQlmb3IgKGkgPSAwOyBpIDwgbGVuOyBpKysp
Cj4gLQkJCWRhdGFbaV0gPSAoYnVmW2ldIDw8IDEpIHwgISEoYnVmW2kgKyAxXSAmIEJJVCg3KSk7
Cj4gKwkJCWRhdGFbaV0gPSAoYnVmW2ldIDw8IDEpIHwgKGJ1ZltpICsgMV0gPj4gNyk7Cj4gIAl9
Cj4gIAo+ICAJTUlQSV9EQklfREVCVUdfQ09NTUFORCgqY21kLCBkYXRhLCBsZW4pOwo+IApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
