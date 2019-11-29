Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4262310DA27
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 20:32:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD7E76FBC1;
	Fri, 29 Nov 2019 19:32:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3946FB99
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 19:32:23 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 58A2D29269E;
 Fri, 29 Nov 2019 19:32:22 +0000 (GMT)
Date: Fri, 29 Nov 2019 20:32:19 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH 1/8] drm/panfrost: Make panfrost_job_run() return an
 ERR_PTR() instead of NULL
Message-ID: <20191129203219.2d47d805@collabora.com>
In-Reply-To: <8bd2367c-00a9-bee0-a1a3-c0b9a5ac716f@arm.com>
References: <20191129135908.2439529-1-boris.brezillon@collabora.com>
 <20191129135908.2439529-2-boris.brezillon@collabora.com>
 <7444054c-52b4-32d1-70c2-52bf9c5f2871@arm.com>
 <20191129153155.78003c4e@collabora.com>
 <8bd2367c-00a9-bee0-a1a3-c0b9a5ac716f@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyOSBOb3YgMjAxOSAxNDozODo1MCArMDAwMApTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5w
cmljZUBhcm0uY29tPiB3cm90ZToKCj4gT24gMjkvMTEvMjAxOSAxNDozMSwgQm9yaXMgQnJlemls
bG9uIHdyb3RlOgo+ID4gT24gRnJpLCAyOSBOb3YgMjAxOSAxNDoxOTo1MCArMDAwMAo+ID4gU3Rl
dmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4gd3JvdGU6Cj4gPiAgIAo+ID4+IE9uIDI5
LzExLzIwMTkgMTM6NTksIEJvcmlzIEJyZXppbGxvbiB3cm90ZTogIAo+ID4+PiBJZiB3ZSBkb24n
dCBkbyB0aGF0LCBkbWFfZmVuY2Vfc2V0X2Vycm9yKCkgY29tcGxhaW5zIChjYWxsZWQgZnJvbQo+
ID4+PiBkcm1fc2NoZWRfbWFpbigpKS4KPiA+Pj4KPiA+Pj4gRml4ZXM6IGYzYmE5MTIyOGU4ZSAo
ImRybS9wYW5mcm9zdDogQWRkIGluaXRpYWwgcGFuZnJvc3QgZHJpdmVyIikKPiA+Pj4gQ2M6IDxz
dGFibGVAdmdlci5rZXJuZWwub3JnPgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxs
b24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPiAgICAKPiA+Pgo+ID4+IFRoaXMgbWln
aHQgYmUgd29ydGggZG9pbmcsIGJ1dCBhY3R1YWxseSBpdCdzIG5vdCBQYW5mcm9zdCB0aGF0IGlz
IGJyb2tlbgo+ID4+IGl0J3MgdGhlIGNhbGxlcnMsIHNlZSBbMV0gYW5kIFsyXS4gU28gSSBkb24n
dCB0aGluayB3ZSB3YW50IHRoZQo+ID4+IEZpeGVzL3N0YWJsZSB0YWcuICAKPiA+IAo+ID4gT2th
eS4KPiA+ICAgCj4gPj4KPiA+PiBbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRj
aC8xMTIxODM5OS8KPiA+PiBbMl0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8x
MTI2NzA3My8KPiA+PiAgCj4gPj4+IC0tLQo+ID4+PiAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0
L3BhbmZyb3N0X2pvYi5jIHwgNCArKy0tCj4gPj4+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2pvYi5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0
L3BhbmZyb3N0X2pvYi5jCj4gPj4+IGluZGV4IDIxZjM0ZDQ0YWFjMi4uY2RkOTQ0OGZiYmRkIDEw
MDY0NAo+ID4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMK
PiA+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2pvYi5jCj4gPj4+
IEBAIC0zMjgsMTMgKzMyOCwxMyBAQCBzdGF0aWMgc3RydWN0IGRtYV9mZW5jZSAqcGFuZnJvc3Rf
am9iX3J1bihzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqc2NoZWRfam9iKQo+ID4+PiAgCXN0cnVjdCBk
bWFfZmVuY2UgKmZlbmNlID0gTlVMTDsKPiA+Pj4gIAo+ID4+PiAgCWlmICh1bmxpa2VseShqb2It
PmJhc2Uuc19mZW5jZS0+ZmluaXNoZWQuZXJyb3IpKQo+ID4+PiAtCQlyZXR1cm4gTlVMTDsKPiA+
Pj4gKwkJcmV0dXJuIEVSUl9QVFIoam9iLT5iYXNlLnNfZmVuY2UtPmZpbmlzaGVkLmVycm9yKTsg
IAo+ID4gCj4gPiBIbSwgc28gd2UgY2FuIGtlZXAgdGhlIHJldHVybiBOVUxMIGhlcmUgaWYgWzFd
IGlzIGFwcGxpZWQgKHRoZSBlcnJvcgo+ID4gaXMgcHJlc2VydmVkKSwgYnV0IEknbSBub3Qgc3Vy
ZSBpdCdzIGNsZWFyZXIgdGhhdCB3YXkuCj4gPiAgIAo+ID4+PiAgCj4gPj4+ICAJcGZkZXYtPmpv
YnNbc2xvdF0gPSBqb2I7Cj4gPj4+ICAKPiA+Pj4gIAlmZW5jZSA9IHBhbmZyb3N0X2ZlbmNlX2Ny
ZWF0ZShwZmRldiwgc2xvdCk7Cj4gPj4+ICAJaWYgKElTX0VSUihmZW5jZSkpCj4gPj4+IC0JCXJl
dHVybiBOVUxMOwo+ID4+PiArCQlyZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsgICAgCj4gPiAKPiA+
IFRoaXMgb25lIHNob3VsZCBiZSBmaXhlZCB0aG91Z2gsIG90aGVyd2lzZSB0aGUgZXJyb3IgaXMg
bmV2ZXIgdXBkYXRlZCwKPiA+IHNvIEknbSB3b25kZXJpbmcgaWYgaXQgZG9lc24ndCBkZXNlcnZl
IGEgRml4ZXMgdGFnIGluIHRoZSBlbmQuLi4gIAo+IAo+IEdvb2QgcG9pbnQsIGFsdGhvdWdoIHRo
aXMgY2FuJ3QgYmUgYmFjay1wb3J0ZWQgYmVmb3JlIFszXSAod2VsbCB1bmxlc3MKPiB0aGF0IGNv
bW1pdCBpcyBjb25zaWRlcmVkIHN0YWJsZSBtYXRlcmlhbCB0b28pLCBzbyB0aGlzIGlzIG9ubHkg
cmVhbGx5Cj4gcmVsZXZhbnQgZm9yIHY1LjQuIEJ1dCB3b3J0aCBmaXhpbmcgdGhlcmUuCgpJSVJj
LCBzdWNoIGNvbnN0cmFpbnRzIGNhbiBiZSBzcGVjaWZpZWQgd2l0aDoKCkNjOiA8c3RhYmxlQHZn
ZXIua2VybmVsLm9yZz4gIyB2NS40KwoKQW55d2F5LCBJJ2xsIGRyb3AgdGhpcyBwYXRjaCBmcm9t
IHRoZSBzZXJpZXMgYW5kIHJlcG9zdCBhIG5ldyB2ZXJzaW9uCm9uY2UgWzFdIGhhcyBsYW5kZWQu
CgpUaGFua3MgZm9yIHRoZSBoZWFkcyB1cC4KCkJvcmlzCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
