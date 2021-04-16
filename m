Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 909A436217F
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 15:53:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D63A96EA9A;
	Fri, 16 Apr 2021 13:53:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E4F56E0C5;
 Fri, 16 Apr 2021 13:53:47 +0000 (UTC)
IronPort-SDR: s5t8+FNr1juIil10IWsGCjaUIFFce3i3fhNngTHKZyhabl9MTN0hnaJKOo/fxmYB1YdJiHpE5p
 PkORSsMzR29g==
X-IronPort-AV: E=McAfee;i="6200,9189,9956"; a="280360333"
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="280360333"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2021 06:53:46 -0700
IronPort-SDR: skT04xgQZfDJGwcf32LC53DFT4SzrBbkeTbPKJp7DIWUAUcA09ngZP/NDZgXa89m0U2b2EjHyf
 q2B8t+nwi0yA==
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="453346243"
Received: from pmwillia-mobl2.ger.corp.intel.com (HELO [10.252.7.203])
 ([10.252.7.203])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2021 06:53:45 -0700
Subject: Re: [Intel-gfx] [PATCH 06/19] drm/i915/stolen: pass the allocation
 flags
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20210412090526.30547-1-matthew.auld@intel.com>
 <20210412090526.30547-7-matthew.auld@intel.com>
 <4dc60bcc-ffb8-db6a-dc0d-4a3700661258@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <026a38d2-3953-9dd1-ad90-9ad781374e6b@intel.com>
Date: Fri, 16 Apr 2021 14:53:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <4dc60bcc-ffb8-db6a-dc0d-4a3700661258@linux.intel.com>
Content-Language: en-GB
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTQvMDQvMjAyMSAxNjowOSwgVHZydGtvIFVyc3VsaW4gd3JvdGU6Cj4gCj4gT24gMTIvMDQv
MjAyMSAxMDowNSwgTWF0dGhldyBBdWxkIHdyb3RlOgo+PiBGcm9tOiBDUSBUYW5nIDxjcS50YW5n
QGludGVsLmNvbT4KPj4KPj4gU3RvbGVuIG1lbW9yeSBpcyBhbHdheXMgYWxsb2NhdGVkIGFzIHBo
eXNpY2FsbHkgY29udGlndW91cyBwYWdlcywgbWFyawo+PiB0aGUgb2JqZWN0IGZsYWdzIGFzIHN1
Y2guCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENRIFRhbmcgPGNxLnRhbmdAaW50ZWwuY29tPgo+PiBT
aWduZWQtb2ZmLWJ5OiBNYXR0aGV3IEF1bGQgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+Cj4+IC0t
LQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fc3RvbGVuLmMgfCAxMCAr
KysrKystLS0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9n
ZW1fc3RvbGVuLmMgCj4+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3N0b2xl
bi5jCj4+IGluZGV4IGY3MTNlYWJiNzY3MS4uNDlhMmRmY2M4YmE3IDEwMDY0NAo+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fc3RvbGVuLmMKPj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3N0b2xlbi5jCj4+IEBAIC02MzMsMTQgKzYzMywx
NSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9pOTE1X2dlbV9vYmplY3Rfb3BzIAo+PiBpOTE1
X2dlbV9vYmplY3Rfc3RvbGVuX29wcyA9IHsKPj4gwqAgc3RhdGljIGludCBfX2k5MTVfZ2VtX29i
amVjdF9jcmVhdGVfc3RvbGVuKHN0cnVjdCAKPj4gaW50ZWxfbWVtb3J5X3JlZ2lvbiAqbWVtLAo+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0
IGRybV9pOTE1X2dlbV9vYmplY3QgKm9iaiwKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fbW1fbm9kZSAqc3RvbGVuKQo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRybV9tbV9ub2Rl
ICpzdG9sZW4sCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB1bnNpZ25lZCBpbnQgZmxhZ3MpCj4+IMKgIHsKPj4gwqDCoMKgwqDCoCBzdGF0aWMgc3RydWN0
IGxvY2tfY2xhc3Nfa2V5IGxvY2tfY2xhc3M7Cj4+IMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IGNh
Y2hlX2xldmVsOwo+PiDCoMKgwqDCoMKgIGludCBlcnI7Cj4+IMKgwqDCoMKgwqAgZHJtX2dlbV9w
cml2YXRlX29iamVjdF9pbml0KCZtZW0tPmk5MTUtPmRybSwgJm9iai0+YmFzZSwgCj4+IHN0b2xl
bi0+c2l6ZSk7Cj4+IC3CoMKgwqAgaTkxNV9nZW1fb2JqZWN0X2luaXQob2JqLCAmaTkxNV9nZW1f
b2JqZWN0X3N0b2xlbl9vcHMsIAo+PiAmbG9ja19jbGFzcywgMCk7Cj4+ICvCoMKgwqAgaTkxNV9n
ZW1fb2JqZWN0X2luaXQob2JqLCAmaTkxNV9nZW1fb2JqZWN0X3N0b2xlbl9vcHMsIAo+PiAmbG9j
a19jbGFzcywgZmxhZ3MpOwo+PiDCoMKgwqDCoMKgIG9iai0+c3RvbGVuID0gc3RvbGVuOwo+PiDC
oMKgwqDCoMKgIG9iai0+cmVhZF9kb21haW5zID0gSTkxNV9HRU1fRE9NQUlOX0NQVSB8IEk5MTVf
R0VNX0RPTUFJTl9HVFQ7Cj4+IEBAIC02ODIsNyArNjgzLDcgQEAgc3RhdGljIGludCBfaTkxNV9n
ZW1fb2JqZWN0X3N0b2xlbl9pbml0KHN0cnVjdCAKPj4gaW50ZWxfbWVtb3J5X3JlZ2lvbiAqbWVt
LAo+PiDCoMKgwqDCoMKgIGlmIChyZXQpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVycl9m
cmVlOwo+PiAtwqDCoMKgIHJldCA9IF9faTkxNV9nZW1fb2JqZWN0X2NyZWF0ZV9zdG9sZW4obWVt
LCBvYmosIHN0b2xlbik7Cj4+ICvCoMKgwqAgcmV0ID0gX19pOTE1X2dlbV9vYmplY3RfY3JlYXRl
X3N0b2xlbihtZW0sIG9iaiwgc3RvbGVuLCBmbGFncyk7Cj4+IMKgwqDCoMKgwqAgaWYgKHJldCkK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZXJyX3JlbW92ZTsKPj4gQEAgLTg0MCw3ICs4NDEs
OCBAQCAKPj4gaTkxNV9nZW1fb2JqZWN0X2NyZWF0ZV9zdG9sZW5fZm9yX3ByZWFsbG9jYXRlZChz
dHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAKPj4gKmk5MTUsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBn
b3RvIGVycl9zdG9sZW47Cj4+IMKgwqDCoMKgwqAgfQo+PiAtwqDCoMKgIHJldCA9IF9faTkxNV9n
ZW1fb2JqZWN0X2NyZWF0ZV9zdG9sZW4obWVtLCBvYmosIHN0b2xlbik7Cj4+ICvCoMKgwqAgcmV0
ID0gX19pOTE1X2dlbV9vYmplY3RfY3JlYXRlX3N0b2xlbihtZW0sIG9iaiwgc3RvbGVuLAo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSTkxNV9C
T19BTExPQ19DT05USUdVT1VTKTsKPj4gwqDCoMKgwqDCoCBpZiAocmV0KQo+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgZ290byBlcnJfb2JqZWN0X2ZyZWU7Cj4+Cj4gCj4gQXJlIGFsbCBzdG9sZW4gb2Jq
ZWN0cyBhbHdheXMgY29udGlndW91cyBvciBvbmx5IG9uZXMgYWxsb2NhdGVkIGJ5IAo+IGk5MTVf
Z2VtX29iamVjdF9jcmVhdGVfc3RvbGVuX2Zvcl9wcmVhbGxvY2F0ZWQ/IElmIGZvcm1lciBzaG91
bGQgCj4gX19pOTE1X2dlbV9vYmplY3RfY3JlYXRlX3N0b2xlbiBqdXN0IHNldCB0aGUgZmxhZyB3
aXRob3V0IHRoZSBuZWVkIHRvIAo+IHBhc3MgaXQgaW4/CgpZZXMsIGFsbCBzdG9sZW4gb2JqZWN0
IGFyZSBwaHlzaWNhbGx5IGNvbnRpZ3VvdXMuIEFncmVlZCwgbW92aW5nIHRoZSAKSTkxNV9CT19B
TExPQ19DT05USUdVT1VTIGludG8gX19pOTE1X2dlbV9vYmplY3RfY3JlYXRlX3N0b2xlbigpIG1h
a2VzIAptb3JlIHNlbnNlIGhlcmUuCgo+IAo+IFJlZ2FyZHMsCj4gCj4gVHZydGtvCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
