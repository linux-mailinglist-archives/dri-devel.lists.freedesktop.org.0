Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F244B32C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 09:37:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBCF46E2D2;
	Wed, 19 Jun 2019 07:36:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8974D6E2D2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 07:36:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jun 2019 00:36:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,392,1557212400"; d="scan'208";a="181577665"
Received: from mcostacx-wtg.ger.corp.intel.com (HELO localhost)
 ([10.249.47.136])
 by fmsmga001.fm.intel.com with ESMTP; 19 Jun 2019 00:36:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>,
 DRI <dri-devel@lists.freedesktop.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: linux-next: manual merge of the drm tree with the kbuild tree
In-Reply-To: <20190619141949.38e661e6@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190619141949.38e661e6@canb.auug.org.au>
Date: Wed, 19 Jun 2019 10:38:09 +0300
Message-ID: <87imt2m3dq.fsf@intel.com>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxOSBKdW4gMjAxOSwgU3RlcGhlbiBSb3Rod2VsbCA8c2ZyQGNhbmIuYXV1Zy5vcmcu
YXU+IHdyb3RlOgo+IEhpIGFsbCwKPgo+IFRvZGF5J3MgbGludXgtbmV4dCBtZXJnZSBvZiB0aGUg
ZHJtIHRyZWUgZ290IGEgY29uZmxpY3QgaW46Cj4KPiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L01h
a2VmaWxlLmhlYWRlci10ZXN0Cj4KPiBiZXR3ZWVuIGNvbW1pdDoKPgo+ICAgZTg0NmYwZGM1N2Y0
ICgia2J1aWxkOiBhZGQgc3VwcG9ydCBmb3IgZW5zdXJpbmcgaGVhZGVycyBhcmUgc2VsZi1jb250
YWluZWQiKQo+Cj4gZnJvbSB0aGUga2J1aWxkIHRyZWUgYW5kIGNvbW1pdHM6Cj4KPiAgIDExMmVk
MmQzMWE0NiAoImRybS9pOTE1OiBNb3ZlIEdyYXBoaWNzVGVjaG5vbG9neSBmaWxlcyB1bmRlciBn
dC8iKQo+ICAgZDkxZTY1Nzg3NmE5ICgiZHJtL2k5MTU6IEludHJvZHVjZSBzdHJ1Y3QgaW50ZWxf
d2FrZXJlZiIpCj4gICBhYWIzMGI4NWM5N2EgKCJkcm0vaTkxNTogZW5zdXJlIG1vcmUgaGVhZGVy
cyByZW1haW4gc2VsZi1jb250YWluZWQiKQo+ICAgYjM3NWQwZWYyNTg5ICgiZHJtL2k5MTU6IGV4
dHJhY3QgaW50ZWxfdmRzYy5oIGZyb20gaW50ZWxfZHJ2LmggYW5kIGk5MTVfZHJ2LmgiKQo+Cj4g
ZnJvbSB0aGUgZHJtIHRyZWUuCj4KPiBJIGZpeGVkIGl0IHVwIChzZWUgYmVsb3cpIGFuZCBjYW4g
Y2FycnkgdGhlIGZpeCBhcyBuZWNlc3NhcnkuIFRoaXMKPiBpcyBub3cgZml4ZWQgYXMgZmFyIGFz
IGxpbnV4LW5leHQgaXMgY29uY2VybmVkLCBidXQgYW55IG5vbiB0cml2aWFsCj4gY29uZmxpY3Rz
IHNob3VsZCBiZSBtZW50aW9uZWQgdG8geW91ciB1cHN0cmVhbSBtYWludGFpbmVyIHdoZW4geW91
ciB0cmVlCj4gaXMgc3VibWl0dGVkIGZvciBtZXJnaW5nLiAgWW91IG1heSBhbHNvIHdhbnQgdG8g
Y29uc2lkZXIgY29vcGVyYXRpbmcKPiB3aXRoIHRoZSBtYWludGFpbmVyIG9mIHRoZSBjb25mbGlj
dGluZyB0cmVlIHRvIG1pbmltaXNlIGFueSBwYXJ0aWN1bGFybHkKPiBjb21wbGV4IGNvbmZsaWN0
cy4KCkxHVE0sIHRoYW5rcy4KCkJSLApKYW5pLgoKCi0tIApKYW5pIE5pa3VsYSwgSW50ZWwgT3Bl
biBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
