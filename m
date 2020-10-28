Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C28329D005
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 14:27:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9629C6E50D;
	Wed, 28 Oct 2020 13:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4F1B86E112;
 Wed, 28 Oct 2020 13:27:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83F4A1766;
 Wed, 28 Oct 2020 06:27:12 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 636513F66E;
 Wed, 28 Oct 2020 06:27:12 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 1B094683244; Wed, 28 Oct 2020 13:27:11 +0000 (GMT)
Date: Wed, 28 Oct 2020 13:27:11 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 10/65] drm/malidp: Annotate dma-fence critical section in
 commit path
Message-ID: <20201028132711.GL1008493@e110455-lin.cambridge.arm.com>
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-10-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201023122216.2373294-10-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMjMsIDIwMjAgYXQgMDI6MjE6MjFQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBBZ2FpbiBuZWVkcyB0byBiZSBwdXQgcmlnaHQgYWZ0ZXIgdGhlIGNhbGwgdG8KPiBk
cm1fYXRvbWljX2hlbHBlcl9jb21taXRfaHdfZG9uZSgpLCBzaW5jZSB0aGF0J3MgdGhlIGxhc3Qg
dGhpbmcgd2hpY2gKPiBjYW4gaG9sZCB1cCBhIHN1YnNlcXVlbnQgYXRvbWljIGNvbW1pdC4KPiAK
PiBObyBzdXJwcmlzZXMgaGVyZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiBDYzogIkphbWVzIChRaWFuKSBXYW5nIiA8amFtZXMu
cWlhbi53YW5nQGFybS5jb20+Cj4gQ2M6IExpdml1IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0uY29t
PgoKQWNrZWQtYnk6IExpdml1IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0uY29tPgoKVGhhbmtzIGZv
ciB0aGUgcGF0Y2ghCgpCZXN0IHJlZ2FyZHMsCkxpdml1Cgo+IENjOiBNaWhhaWwgQXRhbmFzc292
IDxtaWhhaWwuYXRhbmFzc292QGFybS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0v
bWFsaWRwX2Rydi5jIHwgMyArKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9kcnYuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hcm0vbWFsaWRwX2Rydi5jCj4gaW5kZXggNjlmZWUwNWMyNTZjLi4yNmU2MDQw
MWE4ZTEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfZHJ2LmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9kcnYuYwo+IEBAIC0yMzQsNiArMjM0LDcg
QEAgc3RhdGljIHZvaWQgbWFsaWRwX2F0b21pY19jb21taXRfdGFpbChzdHJ1Y3QgZHJtX2F0b21p
Y19zdGF0ZSAqc3RhdGUpCj4gIAlzdHJ1Y3QgZHJtX2NydGMgKmNydGM7Cj4gIAlzdHJ1Y3QgZHJt
X2NydGNfc3RhdGUgKm9sZF9jcnRjX3N0YXRlOwo+ICAJaW50IGk7Cj4gKwlib29sIGZlbmNlX2Nv
b2tpZSA9IGRtYV9mZW5jZV9iZWdpbl9zaWduYWxsaW5nKCk7Cj4gIAo+ICAJcG1fcnVudGltZV9n
ZXRfc3luYyhkcm0tPmRldik7Cj4gIAo+IEBAIC0yNjAsNiArMjYxLDggQEAgc3RhdGljIHZvaWQg
bWFsaWRwX2F0b21pY19jb21taXRfdGFpbChzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUp
Cj4gIAo+ICAJbWFsaWRwX2F0b21pY19jb21taXRfaHdfZG9uZShzdGF0ZSk7Cj4gIAo+ICsJZG1h
X2ZlbmNlX2VuZF9zaWduYWxsaW5nKGZlbmNlX2Nvb2tpZSk7Cj4gKwo+ICAJcG1fcnVudGltZV9w
dXQoZHJtLT5kZXYpOwo+ICAKPiAgCWRybV9hdG9taWNfaGVscGVyX2NsZWFudXBfcGxhbmVzKGRy
bSwgc3RhdGUpOwo+IC0tIAo+IDIuMjguMAo+IAoKLS0gCj09PT09PT09PT09PT09PT09PT09Cnwg
SSB3b3VsZCBsaWtlIHRvIHwKfCBmaXggdGhlIHdvcmxkLCAgfAp8IGJ1dCB0aGV5J3JlIG5vdCB8
CnwgZ2l2aW5nIG1lIHRoZSAgIHwKIFwgc291cmNlIGNvZGUhICAvCiAgLS0tLS0tLS0tLS0tLS0t
CiAgICDCr1xfKOODhClfL8KvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
