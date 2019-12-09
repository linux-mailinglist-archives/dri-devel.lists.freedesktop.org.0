Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEDC116E7E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 15:04:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0347D6E451;
	Mon,  9 Dec 2019 14:04:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A196E451;
 Mon,  9 Dec 2019 14:04:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Dec 2019 06:03:58 -0800
X-IronPort-AV: E=Sophos;i="5.69,294,1571727600"; d="scan'208";a="215101123"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Dec 2019 06:03:55 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 12/12] auxdisplay: constify fb ops
In-Reply-To: <31c18e3ce9d6962aabda4799b3051039ff591c92.1575390741.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1575390740.git.jani.nikula@intel.com>
 <31c18e3ce9d6962aabda4799b3051039ff591c92.1575390741.git.jani.nikula@intel.com>
Date: Mon, 09 Dec 2019 16:03:52 +0200
Message-ID: <87pngx4muv.fsf@intel.com>
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
Cc: Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>,
 intel-gfx@lists.freedesktop.org, Robin van der Gracht <robin@protonic.nl>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAwMyBEZWMgMjAxOSwgSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4g
d3JvdGU6Cj4gTm93IHRoYXQgdGhlIGZib3BzIG1lbWJlciBvZiBzdHJ1Y3QgZmJfaW5mbyBpcyBj
b25zdCwgd2UgY2FuIHN0YXJ0Cj4gbWFraW5nIHRoZSBvcHMgY29uc3QgYXMgd2VsbC4KPgo+IENj
OiBNaWd1ZWwgT2plZGEgU2FuZG9uaXMgPG1pZ3VlbC5vamVkYS5zYW5kb25pc0BnbWFpbC5jb20+
Cj4gQ2M6IFJvYmluIHZhbiBkZXIgR3JhY2h0IDxyb2JpbkBwcm90b25pYy5ubD4KPiBSZXZpZXdl
ZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiBSZXZpZXdlZC1i
eTogTWlndWVsIE9qZWRhIDxtaWd1ZWwub2plZGEuc2FuZG9uaXNAZ21haWwuY29tPgo+IEFja2Vk
LWJ5OiBSb2JpbiB2YW4gZGVyIEdyYWNodCA8cm9iaW5AcHJvdG9uaWMubmw+Cj4gU2lnbmVkLW9m
Zi1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KCk1pZ3VlbCwgUm9iaW4s
IGp1c3QgdG8gZXJyIG9uIHRoZSBzYWZlIHNpZGUsIHdlcmUgeW91IGJvdGggb2theSB3aXRoIG1l
Cm1lcmdpbmcgdGhpcyB0aHJvdWdoIGRybS1taXNjPyBOb3QgdmVyeSBsaWtlbHkgdG8gY29uZmxp
Y3QgYmFkbHkuCgpCUiwKSmFuaS4KCj4gLS0tCj4gIGRyaXZlcnMvYXV4ZGlzcGxheS9jZmFnMTI4
NjRiZmIuYyB8IDIgKy0KPiAgZHJpdmVycy9hdXhkaXNwbGF5L2h0MTZrMzMuYyAgICAgIHwgMiAr
LQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2F1eGRpc3BsYXkvY2ZhZzEyODY0YmZiLmMgYi9kcml2ZXJz
L2F1eGRpc3BsYXkvY2ZhZzEyODY0YmZiLmMKPiBpbmRleCA0MDc0ODg2YjdiYzguLjIwMDIyOTFh
YjMzOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2F1eGRpc3BsYXkvY2ZhZzEyODY0YmZiLmMKPiAr
KysgYi9kcml2ZXJzL2F1eGRpc3BsYXkvY2ZhZzEyODY0YmZiLmMKPiBAQCAtNTcsNyArNTcsNyBA
QCBzdGF0aWMgaW50IGNmYWcxMjg2NGJmYl9tbWFwKHN0cnVjdCBmYl9pbmZvICppbmZvLCBzdHJ1
Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPiAgCXJldHVybiB2bV9tYXBfcGFnZXNfemVybyh2bWEs
ICZwYWdlcywgMSk7Cj4gIH0KPiAgCj4gLXN0YXRpYyBzdHJ1Y3QgZmJfb3BzIGNmYWcxMjg2NGJm
Yl9vcHMgPSB7Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZmJfb3BzIGNmYWcxMjg2NGJmYl9vcHMg
PSB7Cj4gIAkub3duZXIgPSBUSElTX01PRFVMRSwKPiAgCS5mYl9yZWFkID0gZmJfc3lzX3JlYWQs
Cj4gIAkuZmJfd3JpdGUgPSBmYl9zeXNfd3JpdGUsCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYXV4
ZGlzcGxheS9odDE2azMzLmMgYi9kcml2ZXJzL2F1eGRpc3BsYXkvaHQxNmszMy5jCj4gaW5kZXgg
YTJmY2RlNTgyZTJhLi5kOTUxZDU0YjI2ZjUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9hdXhkaXNw
bGF5L2h0MTZrMzMuYwo+ICsrKyBiL2RyaXZlcnMvYXV4ZGlzcGxheS9odDE2azMzLmMKPiBAQCAt
MjI4LDcgKzIyOCw3IEBAIHN0YXRpYyBpbnQgaHQxNmszM19tbWFwKHN0cnVjdCBmYl9pbmZvICpp
bmZvLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPiAgCXJldHVybiB2bV9tYXBfcGFnZXNf
emVybyh2bWEsICZwYWdlcywgMSk7Cj4gIH0KPiAgCj4gLXN0YXRpYyBzdHJ1Y3QgZmJfb3BzIGh0
MTZrMzNfZmJfb3BzID0gewo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGZiX29wcyBodDE2azMzX2Zi
X29wcyA9IHsKPiAgCS5vd25lciA9IFRISVNfTU9EVUxFLAo+ICAJLmZiX3JlYWQgPSBmYl9zeXNf
cmVhZCwKPiAgCS5mYl93cml0ZSA9IGZiX3N5c193cml0ZSwKCi0tIApKYW5pIE5pa3VsYSwgSW50
ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
