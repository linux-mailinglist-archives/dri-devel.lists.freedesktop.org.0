Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C71E49A377
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 01:04:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03BD56E566;
	Thu, 22 Aug 2019 23:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A51D56E564;
 Thu, 22 Aug 2019 23:04:16 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 18233027-1500050 for multiple; Fri, 23 Aug 2019 00:04:06 +0100
MIME-Version: 1.0
To: Lyude Paul <lyude@redhat.com>, intel-gfx@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190822203127.24648-2-lyude@redhat.com>
References: <20190822203127.24648-1-lyude@redhat.com>
 <20190822203127.24648-2-lyude@redhat.com>
Message-ID: <156651504414.31031.15762618327886046790@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH v2 2/2] drm/i915: Enable CONFIG_DMA_API_DEBUG_SG for
 intel-ci
Date: Fri, 23 Aug 2019 00:04:04 +0100
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBMeXVkZSBQYXVsICgyMDE5LTA4LTIyIDIxOjMxOjI3KQo+IE5vdyB0aGF0IHdlJ3Zl
IGZpeGVkIGk5MTUgc28gdGhhdCBpdCBzZXRzIGEgbWF4IFNHIHNlZ21lbnQgbGVuZ3RoIGFuZAo+
IGdvdHRlbiByaWQgb2YgdGhlIHJlbGV2YW50IHdhcm5pbmdzLCBsZXQncyBlbmFibGUKPiBDT05G
SUdfRE1BX0FQSV9ERUJVR19TRyBmb3IgaW50ZWwtY2kgc28gdGhhdCB3ZSBjYW4gY2F0Y2ggaXNz
dWVzIGxpa2UKPiB0aGlzIGluIHRoZSBmdXR1cmUgYXMgd2VsbC4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgo+IENjOiBDaHJpcyBXaWxzb24gPGNocmlz
QGNocmlzLXdpbHNvbi5jby51az4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvS2NvbmZp
Zy5kZWJ1ZyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvS2NvbmZpZy5kZWJ1ZyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L0tjb25maWcuZGVidWcKPiBpbmRleCAwMDc4NmExNDJmZjAuLmFkOGQzY2Q2M2M5
ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9LY29uZmlnLmRlYnVnCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvS2NvbmZpZy5kZWJ1Zwo+IEBAIC0zMiw2ICszMiw3IEBA
IGNvbmZpZyBEUk1fSTkxNV9ERUJVRwo+ICAgICAgICAgc2VsZWN0IERSTV9ERUJVR19TRUxGVEVT
VAo+ICAgICAgICAgc2VsZWN0IERNQUJVRl9TRUxGVEVTVFMKPiAgICAgICAgIHNlbGVjdCBTV19T
WU5DICMgc2lnbmFsaW5nIHZhbGlkYXRpb24gZnJhbWV3b3JrIChpZ3Qvc3luY29iaiopCgoJc2Vs
ZWN0IERNQV9BUElfREVCVUcKYXMgd2VsbCBmb3IgaXQgdG8gYmUgZW5hYmxlZCwgbm8gcmVjdXJz
aXZlIGRlcGVuZGVuY3kgc29sdmVyIGluIEtjb25maWcuCgo+ICsgICAgICAgIHNlbGVjdCBETUFf
QVBJX0RFQlVHX1NHCj4gICAgICAgICBzZWxlY3QgRFJNX0k5MTVfU1dfRkVOQ0VfREVCVUdfT0JK
RUNUUwo+ICAgICAgICAgc2VsZWN0IERSTV9JOTE1X1NFTEZURVNUCj4gICAgICAgICBzZWxlY3Qg
RFJNX0k5MTVfREVCVUdfUlVOVElNRV9QTQo+IC0tIAo+IDIuMjEuMAo+IApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
