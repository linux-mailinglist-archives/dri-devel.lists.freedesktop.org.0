Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDD467A6F
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jul 2019 16:24:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C319897E4;
	Sat, 13 Jul 2019 14:24:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF78893A4
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 12:43:39 +0000 (UTC)
Received: from [167.98.27.226] (helo=[10.35.6.255])
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1hlutf-0005tl-S8; Fri, 12 Jul 2019 13:43:31 +0100
Subject: Re: [PATCH v1 07/11] ti948: Add sysfs node for alive attribute
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20190611140412.32151-1-michael.drake@codethink.co.uk>
 <20190611140412.32151-8-michael.drake@codethink.co.uk>
 <20190611181144.GV5016@pendragon.ideasonboard.com>
From: Michael Drake <michael.drake@codethink.co.uk>
Message-ID: <bc3f0563-f7d9-42ef-21a7-836ad4ded6b1@codethink.co.uk>
Date: Fri, 12 Jul 2019 13:43:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190611181144.GV5016@pendragon.ideasonboard.com>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 13 Jul 2019 14:24:23 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nate Case <ncase@tesla.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@lists.codethink.co.uk,
 Patrick Glaser <pglaser@tesla.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwKCk9uIDExLzA2LzIwMTkgMTk6MTEsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6
Cj4gSGkgTWljaGFlbCwKPiAKPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk15IHBsZWFzdXJl
LCBhbmQgdGhhbmsgeW91IGZvciB0aGUgZmVlZGJhY2shCgo+IE9uIFR1ZSwgSnVuIDExLCAyMDE5
IGF0IDAzOjA0OjA4UE0gKzAxMDAsIE1pY2hhZWwgRHJha2Ugd3JvdGU6Cj4+IFRoaXMgbWF5IGJl
IHVzZWQgYnkgdXNlcnNwYWNlIHRvIGRldGVybWluZSB0aGUgc3RhdGUKPj4gb2YgdGhlIGRldmlj
ZS4KPiAKPiBXaHkgaXMgdGhpcyBuZWVkZWQgPyBVc2Vyc3BhY2Ugc2hvdWxkbid0IGV2ZW4gYmUg
YXdhcmUgdGhhdCB0aGlzIGRldmljZQo+IGV4aXN0cy4KClRoZSBkaXNwbGF5IChjb250YWluaW5n
IHRoZSB0aTk0OCkgY291bGQgYmUgdW5wbHVnZ2VkLiAgKFNlZSBteQpyZXNwb25zZSB0byB0aGUg
ZmVlZGJhY2sgb24gdGhlIHByZXZpb3VzIGNvbW1pdCBpbiB0aGUgc2VyaWVzLikKCklmIHlvdSBj
YW4gc3VnZ2VzdCBhIGJldHRlciBvciBtb3JlIHN0YW5kYXJkIHdheSBvZiBkb2luZyB0aGlzCkkg
d291bGQgYmUgdmVyeSBoYXBweSB0byBsZWFybiBvZiBpdC4KCj4+IFNpZ25lZC1vZmYtYnk6IE1p
Y2hhZWwgRHJha2UgPG1pY2hhZWwuZHJha2VAY29kZXRoaW5rLmNvLnVrPgo+PiBDYzogUGF0cmlj
ayBHbGFzZXIgPHBnbGFzZXJAdGVzbGEuY29tPgo+PiBDYzogTmF0ZSBDYXNlIDxuY2FzZUB0ZXNs
YS5jb20+Cj4+IC0tLQo+PiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aTk0OC5jIHwgMjggKysr
KysrKysrKysrKysrKysrKysrKysrKystLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3RpOTQ4LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpOTQ4LmMKPj4gaW5kZXgg
YjVjNzY2NzExYzRiLi5iNjI0ZWFlYWJiNDMgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvdGk5NDguYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpOTQ4LmMK
Pj4gQEAgLTQxMiw2ICs0MTIsMTYgQEAgc3RhdGljIHZvaWQgdGk5NDhfYWxpdmVfY2hlY2soc3Ry
dWN0IHdvcmtfc3RydWN0ICp3b3JrKQo+PiAgCXNjaGVkdWxlX2RlbGF5ZWRfd29yaygmdGk5NDgt
PmFsaXZlX2NoZWNrLCBUSTk0OF9BTElWRV9DSEVDS19ERUxBWSk7Cj4+ICB9Cj4+ICAKPj4gK3N0
YXRpYyBzc2l6ZV90IGFsaXZlX3Nob3coc3RydWN0IGRldmljZSAqZGV2LAo+PiArCQlzdHJ1Y3Qg
ZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwgY2hhciAqYnVmKQo+PiArewo+PiArCXN0cnVjdCB0aTk0
OF9jdHggKnRpOTQ4ID0gdGk5NDhfY3R4X2Zyb21fZGV2KGRldik7Cj4+ICsKPj4gKwlyZXR1cm4g
c2NucHJpbnRmKGJ1ZiwgUEFHRV9TSVpFLCAiJXVcbiIsICh1bnNpZ25lZCBpbnQpdGk5NDgtPmFs
aXZlKTsKPj4gK30KPj4gKwo+PiArc3RhdGljIERFVklDRV9BVFRSX1JPKGFsaXZlKTsKPj4gKwo+
PiAgc3RhdGljIGludCB0aTk0OF9wbV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQo+PiAgewo+
PiAgCXN0cnVjdCB0aTk0OF9jdHggKnRpOTQ4ID0gdGk5NDhfY3R4X2Zyb21fZGV2KGRldik7Cj4+
IEBAIC02MTQsMTcgKzYyNCwzMSBAQCBzdGF0aWMgaW50IHRpOTQ4X3Byb2JlKHN0cnVjdCBpMmNf
Y2xpZW50ICpjbGllbnQsCj4+ICAKPj4gIAlpMmNfc2V0X2NsaWVudGRhdGEoY2xpZW50LCB0aTk0
OCk7Cj4+ICAKPj4gKwlyZXQgPSBkZXZpY2VfY3JlYXRlX2ZpbGUoJmNsaWVudC0+ZGV2LCAmZGV2
X2F0dHJfYWxpdmUpOwo+PiArCWlmIChyZXQpIHsKPj4gKwkJZGV2X2VycigmY2xpZW50LT5kZXYs
ICJDb3VsZCBub3QgY3JlYXRlIGFsaXZlIGF0dHJcbiIpOwo+PiArCQlyZXR1cm4gcmV0Owo+PiAr
CX0KPj4gKwo+PiAgCXJldCA9IHRpOTQ4X3BtX3Jlc3VtZSgmY2xpZW50LT5kZXYpOwo+PiAtCWlm
IChyZXQgIT0gMCkKPj4gLQkJcmV0dXJuIC1FUFJPQkVfREVGRVI7Cj4+ICsJaWYgKHJldCAhPSAw
KSB7Cj4+ICsJCXJldCA9IC1FUFJPQkVfREVGRVI7Cj4+ICsJCWdvdG8gZXJyb3I7Cj4+ICsJfQo+
PiAgCj4+ICAJZGV2X2luZm8oJnRpOTQ4LT5pMmMtPmRldiwgIkVuZCBwcm9iZSAoYWRkcjogJXgp
XG4iLCB0aTk0OC0+aTJjLT5hZGRyKTsKPj4gIAo+PiAgCXJldHVybiAwOwo+PiArCj4+ICtlcnJv
cjoKPj4gKwlkZXZpY2VfcmVtb3ZlX2ZpbGUoJmNsaWVudC0+ZGV2LCAmZGV2X2F0dHJfYWxpdmUp
Owo+PiArCXJldHVybiByZXQ7Cj4+ICB9Cj4+ICAKPj4gIHN0YXRpYyBpbnQgdGk5NDhfcmVtb3Zl
KHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpCj4+ICB7Cj4+ICsJZGV2aWNlX3JlbW92ZV9maWxl
KCZjbGllbnQtPmRldiwgJmRldl9hdHRyX2FsaXZlKTsKPj4gKwo+PiAgCXJldHVybiB0aTk0OF9w
bV9zdXNwZW5kKCZjbGllbnQtPmRldik7Cj4+ICB9Cj4+ICAKPiAKCi0tIApNaWNoYWVsIERyYWtl
ICAgICAgICAgICAgICAgICBodHRwczovL3d3dy5jb2RldGhpbmsuY28udWsvCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
