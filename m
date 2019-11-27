Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 070F210AB41
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 08:41:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 189856E1BA;
	Wed, 27 Nov 2019 07:41:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B8E76E16B;
 Wed, 27 Nov 2019 07:41:08 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E08A728E055;
 Wed, 27 Nov 2019 07:41:06 +0000 (GMT)
Date: Wed, 27 Nov 2019 08:41:04 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 5/5] drm: drop DRM_AUTH from PRIME_TO/FROM_HANDLE ioctls
Message-ID: <20191127084104.1ceb1f62@collabora.com>
In-Reply-To: <20191101130313.8862-5-emil.l.velikov@gmail.com>
References: <20191101130313.8862-1-emil.l.velikov@gmail.com>
 <20191101130313.8862-5-emil.l.velikov@gmail.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Sean Paul <sean@poorly.run>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRW1pbCwKCk9uIEZyaSwgIDEgTm92IDIwMTkgMTM6MDM6MTMgKzAwMDAKRW1pbCBWZWxpa292
IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5jb20+IHdyb3RlOgoKPiBGcm9tOiBFbWlsIFZlbGlrb3Yg
PGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgo+IAo+IEFzIG1lbnRpb25lZCBieSBDaHJpc3Rp
YW4sIGZvciBkcml2ZXJzIHdoaWNoIHN1cHBvcnQgb25seSBwcmltYXJ5IG5vZGVzCj4gdGhpcyBj
aGFuZ2VzIHRoZSByZXR1cm5lZCBlcnJvciBmcm9tIC1FQUNDRVMgaW50byAtRU9QTk9UU1VQUC8t
RU5PU1lTLgoKQXJlIHlvdSBzdXJlIHRoaXMgaXMgdHJ1ZSBmb3IgTU9ERVNFVC1vbmx5IG5vZGVz
ICh0aG9zZSB0aGF0IGRvIG5vdApoYXZlIHRoZSBSRU5ERVIgY2FwIHNldCkgaW1wbGVtZW50aW5n
IC0+e2ZkX3RvX2hhbmRsZSxoYW5kbGVfdG9fZmR9KCk/ClNob3VsZG4ndCB0aGUgaXNfYXV0aGVu
dGljYXRlZCgpIGNoZWNrIHN0aWxsIGJlIGRvbmUgaW4gdGhhdCBjYXNlPwoKUmVnYXJkcywKCkJv
cmlzCgo+IAo+IEZvciBvdGhlcnMsIHRoaXMgY2hlY2sgaW4gcGFydGljdWxhciB3aWxsIGJlIGEg
bm9vcC4gU28gbGV0J3MgcmVtb3ZlIGl0Cj4gYXMgc3VnZ2VzdGVkIGJ5IENocmlzdGlhbi4KPiAK
PiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+Cj4gQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgo+IEFja2VkLWJ5OiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gU2lnbmVkLW9mZi1ieTog
RW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KPiAtLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL2RybV9pb2N0bC5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1faW9jdGwuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1faW9jdGwuYwo+IGluZGV4IGZjZDcy
OGQ3Y2Y3Mi4uNWFmYjM5Njg4YjU1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
aW9jdGwuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1faW9jdGwuYwo+IEBAIC02NTIsOCAr
NjUyLDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1faW9jdGxfZGVzYyBkcm1faW9jdGxzW10g
PSB7Cj4gIAo+ICAJRFJNX0lPQ1RMX0RFRihEUk1fSU9DVExfTU9ERV9HRVRSRVNPVVJDRVMsIGRy
bV9tb2RlX2dldHJlc291cmNlcywgMCksCj4gIAo+IC0JRFJNX0lPQ1RMX0RFRihEUk1fSU9DVExf
UFJJTUVfSEFORExFX1RPX0ZELCBkcm1fcHJpbWVfaGFuZGxlX3RvX2ZkX2lvY3RsLCBEUk1fQVVU
SHxEUk1fUkVOREVSX0FMTE9XKSwKPiAtCURSTV9JT0NUTF9ERUYoRFJNX0lPQ1RMX1BSSU1FX0ZE
X1RPX0hBTkRMRSwgZHJtX3ByaW1lX2ZkX3RvX2hhbmRsZV9pb2N0bCwgRFJNX0FVVEh8RFJNX1JF
TkRFUl9BTExPVyksCj4gKwlEUk1fSU9DVExfREVGKERSTV9JT0NUTF9QUklNRV9IQU5ETEVfVE9f
RkQsIGRybV9wcmltZV9oYW5kbGVfdG9fZmRfaW9jdGwsIERSTV9SRU5ERVJfQUxMT1cpLAo+ICsJ
RFJNX0lPQ1RMX0RFRihEUk1fSU9DVExfUFJJTUVfRkRfVE9fSEFORExFLCBkcm1fcHJpbWVfZmRf
dG9faGFuZGxlX2lvY3RsLCBEUk1fUkVOREVSX0FMTE9XKSwKPiAgCj4gIAlEUk1fSU9DVExfREVG
KERSTV9JT0NUTF9NT0RFX0dFVFBMQU5FUkVTT1VSQ0VTLCBkcm1fbW9kZV9nZXRwbGFuZV9yZXMs
IDApLAo+ICAJRFJNX0lPQ1RMX0RFRihEUk1fSU9DVExfTU9ERV9HRVRDUlRDLCBkcm1fbW9kZV9n
ZXRjcnRjLCAwKSwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
