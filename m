Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1D9AD4C7
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 10:23:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58F3589973;
	Mon,  9 Sep 2019 08:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D499A8996F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 08:22:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3C6397CB80;
 Mon,  9 Sep 2019 08:22:58 +0000 (UTC)
Received: from [10.36.116.173] (ovpn-116-173.ams2.redhat.com [10.36.116.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E56B5C21F;
 Mon,  9 Sep 2019 08:22:54 +0000 (UTC)
Subject: Re: [PATCH] mm, notifier: Fix early return case for new lockdep
 annotations
To: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>
References: <20190906174730.22462-1-daniel.vetter@ffwll.ch>
From: David Hildenbrand <david@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <8fec380a-7dd1-846a-598a-90ec6f67eb43@redhat.com>
Date: Mon, 9 Sep 2019 10:22:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906174730.22462-1-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Mon, 09 Sep 2019 08:22:58 +0000 (UTC)
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Ralph Campbell <rcampbell@nvidia.com>, Michal Hocko <mhocko@suse.com>,
 linux-mm@kvack.org, DRI Development <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 syzbot+aaedc50d99a03250fe1f@syzkaller.appspotmail.com,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ira Weiny <ira.weiny@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDYuMDkuMTkgMTk6NDcsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gSSBtaXNzZWQgdGhhdCB3
aGVuIGV4dGVuZGluZyB0aGUgbG9ja2RlcCBhbm5vdGF0aW9ucyB0byB0aGUKPiBub25ibG9ja2lu
ZyBjYXNlLgo+IAo+IEkgbWlzc2VkIHRoaXMgd2hpbGUgdGVzdGluZyBzaW5jZSBpbiB0aGUgaTkx
NSBtbXUgbm90aWZpZXJzIGlzIGhpdHRpbmcKPiBhIG5pY2UgbG9ja2RlcCBzcGxhdCBhbHJlYWR5
IGJlZm9yZSB0aGUgcG9pbnQgb2YgZ29pbmcgaW50byBvb20ga2lsbGVyCj4gbW9kZSA6LS8KPiAK
PiBSZXBvcnRlZC1ieTogc3l6Ym90K2FhZWRjNTBkOTlhMDMyNTBmZTFmQHN5emthbGxlci5hcHBz
cG90bWFpbC5jb20KPiBGaXhlczogZDJiMjE5ZWQwM2Q0ICgibW0vbW11X25vdGlmaWVyczogYWRk
IGEgbG9ja2RlcCBtYXAgZm9yIGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQvZW5kIikKPiBDYzogSmFz
b24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWwudmV0dGVyQGludGVsLmNvbT4KPiBDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3Vu
ZGF0aW9uLm9yZz4KPiBDYzogIkrDqXLDtG1lIEdsaXNzZSIgPGpnbGlzc2VAcmVkaGF0LmNvbT4K
PiBDYzogUmFscGggQ2FtcGJlbGwgPHJjYW1wYmVsbEBudmlkaWEuY29tPgo+IENjOiBKYXNvbiBH
dW50aG9ycGUgPGpnZ0B6aWVwZS5jYT4KPiBDYzogSXJhIFdlaW55IDxpcmEud2VpbnlAaW50ZWwu
Y29tPgo+IENjOiBNaWNoYWwgSG9ja28gPG1ob2Nrb0BzdXNlLmNvbT4KPiBDYzogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiBDYzogU2VhbiBDaHJpc3RvcGhlcnNvbiA8
c2Vhbi5qLmNocmlzdG9waGVyc29uQGludGVsLmNvbT4KPiBDYzogSmVhbi1QaGlsaXBwZSBCcnVj
a2VyIDxqZWFuLXBoaWxpcHBlQGxpbmFyby5vcmc+Cj4gQ2M6IGxpbnV4LW1tQGt2YWNrLm9yZwo+
IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+
IC0tLQo+ICBpbmNsdWRlL2xpbnV4L21tdV9ub3RpZmllci5oIHwgNSArKystLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL2xpbnV4L21tdV9ub3RpZmllci5oIGIvaW5jbHVkZS9saW51eC9tbXVfbm90aWZp
ZXIuaAo+IGluZGV4IDVhMDM0MTdlNWJmNy4uNGVkZDk4YjA2ODM0IDEwMDY0NAo+IC0tLSBhL2lu
Y2x1ZGUvbGludXgvbW11X25vdGlmaWVyLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L21tdV9ub3Rp
Zmllci5oCj4gQEAgLTM1NiwxMyArMzU2LDE0IEBAIG1tdV9ub3RpZmllcl9pbnZhbGlkYXRlX3Jh
bmdlX3N0YXJ0KHN0cnVjdCBtbXVfbm90aWZpZXJfcmFuZ2UgKnJhbmdlKQo+ICBzdGF0aWMgaW5s
aW5lIGludAo+ICBtbXVfbm90aWZpZXJfaW52YWxpZGF0ZV9yYW5nZV9zdGFydF9ub25ibG9jayhz
dHJ1Y3QgbW11X25vdGlmaWVyX3JhbmdlICpyYW5nZSkKPiAgewo+ICsJaW50IHJldCA9IDA7Cj4g
IAlsb2NrX21hcF9hY3F1aXJlKCZfX21tdV9ub3RpZmllcl9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0
X21hcCk7Cj4gIAlpZiAobW1faGFzX25vdGlmaWVycyhyYW5nZS0+bW0pKSB7Cj4gIAkJcmFuZ2Ut
PmZsYWdzICY9IH5NTVVfTk9USUZJRVJfUkFOR0VfQkxPQ0tBQkxFOwo+IC0JCXJldHVybiBfX21t
dV9ub3RpZmllcl9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0KHJhbmdlKTsKPiArCQlyZXQgPSBfX21t
dV9ub3RpZmllcl9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0KHJhbmdlKTsKPiAgCX0KPiAgCWxvY2tf
bWFwX3JlbGVhc2UoJl9fbW11X25vdGlmaWVyX2ludmFsaWRhdGVfcmFuZ2Vfc3RhcnRfbWFwKTsK
PiAtCXJldHVybiAwOwo+ICsJcmV0dXJuIHJldDsKPiAgfQo+ICAKPiAgc3RhdGljIGlubGluZSB2
b2lkCj4gCgpSZXZpZXdlZC1ieTogRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+
CgotLSAKClRoYW5rcywKCkRhdmlkIC8gZGhpbGRlbmIKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
