Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3CC2DE735
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 17:08:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840F36E1A4;
	Fri, 18 Dec 2020 16:08:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B23906E1A4
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 16:08:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E500C30E
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 08:08:15 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C29143F66B;
 Fri, 18 Dec 2020 08:08:15 -0800 (PST)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 61F5168409A; Fri, 18 Dec 2020 16:08:14 +0000 (GMT)
Date: Fri, 18 Dec 2020 16:08:14 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: carsten.haitzler@foss.arm.com
Subject: Re: [PATCH] drm/komeda: Fix bit check to import to value of proper
 type
Message-ID: <X9zT7q0FzC+DBJpU@e110455-lin.cambridge.arm.com>
References: <20201218150812.68195-1-carsten.haitzler@foss.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201218150812.68195-1-carsten.haitzler@foss.arm.com>
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
Cc: Carsten Haitzler <carsten.haitzler@arm.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBEZWMgMTgsIDIwMjAgYXQgMDM6MDg6MTJQTSArMDAwMCwgY2Fyc3Rlbi5oYWl0emxl
ckBmb3NzLmFybS5jb20gd3JvdGU6Cj4gRnJvbTogQ2Fyc3RlbiBIYWl0emxlciA8Y2Fyc3Rlbi5o
YWl0emxlckBhcm0uY29tPgo+IAo+IEtBU0FOIGZvdW5kIHRoaXMgcHJvYmxlbS4gZmluZF9maXJz
dF9iaXQoKSBleHBlY3RzIHRvIGxvb2sgYXQgYQo+IHBvaW50ZXIgcG9pbnRpbmcgdG8gYSBsb25n
LCBidXQgd2UgbG9vayBhdCBhIHUzMiAtIHRoaXMgaXMgZ29pbmcgdG8gYmUKPiBhbiBpc3N1ZSB3
aXRoIGVuZGlhbmVzcyBidXQsIEtTQU4gYWxyZWFkeSBmbGFncyB0aGlzIGFzIG91dC1vZi1ib3Vu
ZHMKPiBzdGFjayByZWFkcy4gVGhpcyBmaXhlcyBpdCBieSBqdXN0IGltcG9ydGluZyBpbm90IGEg
bG9jYWwgbG9uZy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDYXJzdGVuIEhhaXR6bGVyIDxjYXJzdGVu
LmhhaXR6bGVyQGFybS5jb20+CgpBY2tlZC1ieTogTGl2aXUgRHVkYXUgPGxpdml1LmR1ZGF1QGFy
bS5jb20+CgpCZXN0IHJlZ2FyZHMsCkxpdml1Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5jIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuYwo+IGluZGV4IDQ1
MmU1MDVhMWZkMy4uNzE5YTc5NzI4ZTI0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5jCj4gQEAgLTEzNyw5ICsxMzcs
MTAgQEAga29tZWRhX3BpcGVsaW5lX2dldF9maXJzdF9jb21wb25lbnQoc3RydWN0IGtvbWVkYV9w
aXBlbGluZSAqcGlwZSwKPiAgCQkJCSAgICB1MzIgY29tcF9tYXNrKQo+ICB7Cj4gIAlzdHJ1Y3Qg
a29tZWRhX2NvbXBvbmVudCAqYyA9IE5VTEw7Cj4gKwl1bnNpZ25lZCBsb25nIGNvbXBfbWFza19s
b2NhbCA9ICh1bnNpZ25lZCBsb25nKWNvbXBfbWFzazsKPiAgCWludCBpZDsKPiAgCj4gLQlpZCA9
IGZpbmRfZmlyc3RfYml0KCh1bnNpZ25lZCBsb25nICopJmNvbXBfbWFzaywgMzIpOwo+ICsJaWQg
PSBmaW5kX2ZpcnN0X2JpdCgmY29tcF9tYXNrX2xvY2FsLCAzMik7Cj4gIAlpZiAoaWQgPCAzMikK
PiAgCQljID0ga29tZWRhX3BpcGVsaW5lX2dldF9jb21wb25lbnQocGlwZSwgaWQpOwo+ICAKPiAt
LSAKPiAyLjI5LjIKPiAKCi0tIAo9PT09PT09PT09PT09PT09PT09PQp8IEkgd291bGQgbGlrZSB0
byB8CnwgZml4IHRoZSB3b3JsZCwgIHwKfCBidXQgdGhleSdyZSBub3QgfAp8IGdpdmluZyBtZSB0
aGUgICB8CiBcIHNvdXJjZSBjb2RlISAgLwogIC0tLS0tLS0tLS0tLS0tLQogICAgwq9cXyjjg4Qp
Xy/CrwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
