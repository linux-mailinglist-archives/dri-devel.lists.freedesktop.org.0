Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC8910C6CD
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 11:35:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB5C06E7A2;
	Thu, 28 Nov 2019 10:35:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97EF16E79D;
 Thu, 28 Nov 2019 10:35:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Nov 2019 02:35:35 -0800
X-IronPort-AV: E=Sophos;i="5.69,253,1571727600"; d="scan'208";a="199487561"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Nov 2019 02:35:32 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Christophe de Dinechin <christophe.de.dinechin@gmail.com>
Subject: Re: [PATCH 13/13] samples: vfio-mdev: constify fb ops
In-Reply-To: <39B62C70-3E60-48AB-8F11-534EF5B8EFBD@dinechin.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1574871797.git.jani.nikula@intel.com>
 <fc8342eef9fcd2f55c86fcd78f7df52f7c76fa87.1574871797.git.jani.nikula@intel.com>
 <39B62C70-3E60-48AB-8F11-534EF5B8EFBD@dinechin.org>
Date: Thu, 28 Nov 2019 12:35:29 +0200
Message-ID: <87y2w0mgpa.fsf@intel.com>
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Kirti Wankhede <kwankhede@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyOCBOb3YgMjAxOSwgQ2hyaXN0b3BoZSBkZSBEaW5lY2hpbiA8Y2hyaXN0b3BoZS5k
ZS5kaW5lY2hpbkBnbWFpbC5jb20+IHdyb3RlOgo+PiBPbiAyNyBOb3YgMjAxOSwgYXQgMTc6MzIs
IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+IHdyb3RlOgo+PiAKPj4gTm93IHRo
YXQgdGhlIGZib3BzIG1lbWJlciBvZiBzdHJ1Y3QgZmJfaW5mbyBpcyBjb25zdCwgd2UgY2FuIHN0
YXIgbWFraW5nCj4gcy9zdGFyL3N0YXJ0LwoKT29vcHMsIHRoYW5rcy4KCkJSLApKYW5pLgoKPgo+
PiB0aGUgb3BzIGNvbnN0IGFzIHdlbGwuCj4+IAo+PiBDYzogS2lydGkgV2Fua2hlZGUgPGt3YW5r
aGVkZUBudmlkaWEuY29tPgo+PiBDYzoga3ZtQHZnZXIua2VybmVsLm9yZwo+PiBTaWduZWQtb2Zm
LWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgo+PiAtLS0KPj4gc2FtcGxl
cy92ZmlvLW1kZXYvbWRweS1mYi5jIHwgMiArLQo+PiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPj4gCj4+IGRpZmYgLS1naXQgYS9zYW1wbGVzL3ZmaW8tbWRl
di9tZHB5LWZiLmMgYi9zYW1wbGVzL3ZmaW8tbWRldi9tZHB5LWZiLmMKPj4gaW5kZXggMjcxOWJi
MjU5NjUzLi4yMWRiZjYzZDZlNDEgMTAwNjQ0Cj4+IC0tLSBhL3NhbXBsZXMvdmZpby1tZGV2L21k
cHktZmIuYwo+PiArKysgYi9zYW1wbGVzL3ZmaW8tbWRldi9tZHB5LWZiLmMKPj4gQEAgLTg2LDcg
Kzg2LDcgQEAgc3RhdGljIHZvaWQgbWRweV9mYl9kZXN0cm95KHN0cnVjdCBmYl9pbmZvICppbmZv
KQo+PiAJCWlvdW5tYXAoaW5mby0+c2NyZWVuX2Jhc2UpOwo+PiB9Cj4+IAo+PiAtc3RhdGljIHN0
cnVjdCBmYl9vcHMgbWRweV9mYl9vcHMgPSB7Cj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGZiX29w
cyBtZHB5X2ZiX29wcyA9IHsKPj4gCS5vd25lcgkJPSBUSElTX01PRFVMRSwKPj4gCS5mYl9kZXN0
cm95CT0gbWRweV9mYl9kZXN0cm95LAo+PiAJLmZiX3NldGNvbHJlZwk9IG1kcHlfZmJfc2V0Y29s
cmVnLAo+PiAtLSAKPj4gMi4yMC4xCj4+IAo+CgotLSAKSmFuaSBOaWt1bGEsIEludGVsIE9wZW4g
U291cmNlIEdyYXBoaWNzIENlbnRlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
