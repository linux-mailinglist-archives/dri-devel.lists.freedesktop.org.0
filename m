Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA998CC384
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 21:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18D0B6EC1E;
	Fri,  4 Oct 2019 19:27:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D50416EC1E
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 19:27:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D72F15AB;
 Fri,  4 Oct 2019 12:27:22 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EEACE3F534;
 Fri,  4 Oct 2019 12:27:21 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 90F28682570; Fri,  4 Oct 2019 20:27:20 +0100 (BST)
Date: Fri, 4 Oct 2019 20:27:20 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH][next] drm/komeda: remove redundant assignment to pointer
 disable_done
Message-ID: <20191004192720.7eiqdvsm2yv62svg@e110455-lin.cambridge.arm.com>
References: <20191004162156.325-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191004162156.325-1-colin.king@canonical.com>
User-Agent: NeoMutt/20180716
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 James Wang <james.qian.wang@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMDQsIDIwMTkgYXQgMDU6MjE6NTZQTSArMDEwMCwgQ29saW4gS2luZyB3cm90
ZToKPiBGcm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+IAo+
IFRoZSBwb2ludGVyIGRpc2FibGVfZG9uZSBpcyBiZWluZyBpbml0aWFsaXplZCB3aXRoIGEgdmFs
dWUgdGhhdAo+IGlzIG5ldmVyIHJlYWQgYW5kIGlzIGJlaW5nIHJlLWFzc2lnbmVkIGEgbGl0dGxl
IGxhdGVyIG9uLiBUaGUKPiBhc3NpZ25tZW50IGlzIHJlZHVuZGFudCBhbmQgaGVuY2UgY2FuIGJl
IHJlbW92ZWQuCgpOb3QgcmVhbGx5IHRydWUsIGlzbid0IGl0PyBUaGUgcmUtYXNzaWdubWVudCBp
cyBkb25lIHVuZGVyIHRoZSBjb25kaXRpb24gdGhhdApjcnRjLT5zdGF0ZS0+YWN0aXZlIGlzIHRy
dWUuIGRpc2FibGVfZG9uZSB3aWxsIGJlIHVzZWQgcmVnYXJkbGVzcyBhZnRlciB0aGUgaWYKYmxv
Y2ssIHNvIHdlIGNhbid0IHNraXAgdGhpcyBpbml0aWFsaXNhdGlvbi4KCk5vdCBzdXJlIHdoeSBD
b3Zlcml0eSBmbGFncyB0aGlzLCBidXQgSSB3b3VsZCBOQUsgdGhpcyBwYXRjaC4KCkJlc3QgcmVn
YXJkcywKTGl2aXUKCj4gCj4gQWRkcmVzc2VzLUNvdmVyaXR5OiAoIlVudXNlZCB2YWx1ZSIpCj4g
U2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4K
PiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5j
IHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0
Yy5jCj4gaW5kZXggNzUyNjNkOGNkMGJkLi45YmVlZGEwNDgxOGIgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCj4gQEAgLTI5Niw3
ICsyOTYsNyBAQCBrb21lZGFfY3J0Y19hdG9taWNfZGlzYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNy
dGMsCj4gIAlzdHJ1Y3Qga29tZWRhX2NydGNfc3RhdGUgKm9sZF9zdCA9IHRvX2tjcnRjX3N0KG9s
ZCk7Cj4gIAlzdHJ1Y3Qga29tZWRhX3BpcGVsaW5lICptYXN0ZXIgPSBrY3J0Yy0+bWFzdGVyOwo+
ICAJc3RydWN0IGtvbWVkYV9waXBlbGluZSAqc2xhdmUgID0ga2NydGMtPnNsYXZlOwo+IC0Jc3Ry
dWN0IGNvbXBsZXRpb24gKmRpc2FibGVfZG9uZSA9ICZjcnRjLT5zdGF0ZS0+Y29tbWl0LT5mbGlw
X2RvbmU7Cj4gKwlzdHJ1Y3QgY29tcGxldGlvbiAqZGlzYWJsZV9kb25lOwo+ICAJYm9vbCBuZWVk
c19waGFzZTIgPSBmYWxzZTsKPiAgCj4gIAlEUk1fREVCVUdfQVRPTUlDKCJDUlRDJWRfRElTQUJM
RTogYWN0aXZlX3BpcGVzOiAweCV4LCBhZmZlY3RlZDogMHgleFxuIiwKPiAtLSAKPiAyLjIwLjEK
PiAKCi0tIAo9PT09PT09PT09PT09PT09PT09PQp8IEkgd291bGQgbGlrZSB0byB8CnwgZml4IHRo
ZSB3b3JsZCwgIHwKfCBidXQgdGhleSdyZSBub3QgfAp8IGdpdmluZyBtZSB0aGUgICB8CiBcIHNv
dXJjZSBjb2RlISAgLwogIC0tLS0tLS0tLS0tLS0tLQogICAgwq9cXyjjg4QpXy/CrwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
