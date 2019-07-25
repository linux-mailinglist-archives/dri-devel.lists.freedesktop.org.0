Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F6B76285
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 11:49:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA556ECD5;
	Fri, 26 Jul 2019 09:41:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2D634899D4
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 15:38:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB54D174E;
 Thu, 25 Jul 2019 08:38:03 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B42323F71A;
 Thu, 25 Jul 2019 08:38:02 -0700 (PDT)
Subject: Re: [PATCH v2 2/7] drm/shmem: Put pages independent of a SG table
 being set
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org
References: <20190725011003.30837-1-robh@kernel.org>
 <20190725011003.30837-3-robh@kernel.org>
From: Steven Price <steven.price@arm.com>
Message-ID: <0f84d845-82b8-a05e-59da-dc46a7a6cda4@arm.com>
Date: Thu, 25 Jul 2019 16:38:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190725011003.30837-3-robh@kernel.org>
Content-Language: en-GB
X-Mailman-Approved-At: Fri, 26 Jul 2019 09:41:34 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Robin Murphy <robin.murphy@arm.com>,
 David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjUvMDcvMjAxOSAwMjowOSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gSWYgYSBkcml2ZXIgZG9l
cyBpdHMgb3duIG1hbmFnZW1lbnQgb2YgcGFnZXMsIHRoZSBzaG1lbSBoZWxwZXIgb2JqZWN0J3MK
PiBwYWdlcyBhcnJheSBjb3VsZCBiZSBhbGxvY2F0ZWQgd2hlbiBhIFNHIHRhYmxlIGlzIG5vdC4g
VGhlcmUncyBub3QKPiByZWFsbHkgYW55ICBnb29kIHJlYXNvbiB0byB0aWUgcHV0dGluZyBwYWdl
cyB3aXRoIGhhdmluZyBhIFNHIHRhYmxlIHdoZW4KPiBmcmVlaW5nIHRoZSBvYmplY3QsIHNvIGp1
c3QgcHV0IHBhZ2VzIGlmIHRoZSBwYWdlcyBhcnJheSBpcyBwb3B1bGF0ZWQuCj4gCj4gQ2M6IE1h
YXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6
IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Cj4gQ2M6IFNlYW4gUGF1
bCA8c2VhbkBwb29ybHkucnVuPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+
Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogRXJpYyBBbmhvbHQg
PGVyaWNAYW5ob2x0Lm5ldD4KPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPgoKTEdUTTogUmV2aWV3ZWQtYnk6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFy
bS5jb20+Cgo+IC0tLQo+IHYyOgo+ICAtIG5ldyBwYXRjaAo+IAo+ICBkcml2ZXJzL2dwdS9kcm0v
ZHJtX2dlbV9zaG1lbV9oZWxwZXIuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVt
X2hlbHBlci5jCj4gaW5kZXggMmY2NDY2N2FjODA1Li40NzdlNGNjNTBmN2EgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYwo+IEBAIC0xMTgsMTEgKzExOCwxMSBAQCB2
b2lkIGRybV9nZW1fc2htZW1fZnJlZV9vYmplY3Qoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmop
Cj4gIAkJaWYgKHNobWVtLT5zZ3QpIHsKPiAgCQkJZG1hX3VubWFwX3NnKG9iai0+ZGV2LT5kZXYs
IHNobWVtLT5zZ3QtPnNnbCwKPiAgCQkJCSAgICAgc2htZW0tPnNndC0+bmVudHMsIERNQV9CSURJ
UkVDVElPTkFMKTsKPiAtCj4gLQkJCWRybV9nZW1fc2htZW1fcHV0X3BhZ2VzKHNobWVtKTsKPiAg
CQkJc2dfZnJlZV90YWJsZShzaG1lbS0+c2d0KTsKPiAgCQkJa2ZyZWUoc2htZW0tPnNndCk7Cj4g
IAkJfQo+ICsJCWlmIChzaG1lbS0+cGFnZXMpCj4gKwkJCWRybV9nZW1fc2htZW1fcHV0X3BhZ2Vz
KHNobWVtKTsKPiAgCX0KPiAKPiAgCVdBUk5fT04oc2htZW0tPnBhZ2VzX3VzZV9jb3VudCk7Cj4g
LS0KPiAyLjIwLjEKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
