Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B3825992E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 18:37:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F48C6E890;
	Tue,  1 Sep 2020 16:37:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 507 seconds by postgrey-1.36 at gabe;
 Tue, 01 Sep 2020 07:40:24 UTC
Received: from smtphy.263.net (sg-smtp01.263.net [54.255.195.220])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0553B6E823
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 07:40:24 +0000 (UTC)
Received: from regular2.263xmail.com (unknown [211.157.147.162])
 by smtphy.263.net (Postfix) with ESMTPS id 40763151
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 15:31:53 +0800 (CST)
Received: from regular1.263xmail.com (unknown [192.168.165.232])
 by regular2.263xmail.com (Postfix) with ESMTP id 3DDC9413
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 15:31:46 +0800 (CST)
Received: from localhost (unknown [192.168.167.32])
 by regular1.263xmail.com (Postfix) with ESMTP id 64982D82;
 Tue,  1 Sep 2020 15:30:19 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED: 0
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.39] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P11836T140500728280832S1598945415326857_; 
 Tue, 01 Sep 2020 15:30:16 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <5980efa4ed0b2cbc37153d642df00589>
X-RL-SENDER: algea.cao@rock-chips.com
X-SENDER: algea.cao@rock-chips.com
X-LOGIN-NAME: algea.cao@rock-chips.com
X-FST-TO: linux-rockchip@lists.infradead.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Subject: Re: [PATCH] drm: Parse Colorimetry data block from EDID
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20200826142328.131144-1-algea.cao@rock-chips.com>
 <20200827105701.GS6112@intel.com>
 <4cadf318-cfc3-92d6-6219-170166db94ce@rock-chips.com>
 <20200831195316.GC6112@intel.com>
From: crj <algea.cao@rock-chips.com>
Message-ID: <7a800d9f-2679-73a6-f3d3-dd6cfa829790@rock-chips.com>
Date: Tue, 1 Sep 2020 15:30:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <20200831195316.GC6112@intel.com>
X-Mailman-Approved-At: Tue, 01 Sep 2020 16:37:23 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 tzimmermann@suse.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgrlnKggMjAyMC85LzEgMzo1MywgVmlsbGUgU3lyasOkbMOkIOWGmemBkzoKPiBPbiBGcmks
IEF1ZyAyOCwgMjAyMCBhdCAwOTowNzoxM0FNICswODAwLCBjcmogd3JvdGU6Cj4+IEhpIFZpbGxl
IFN5cmrDpGzDpCwKPj4KPj4g5ZyoIDIwMjAvOC8yNyAxODo1NywgVmlsbGUgU3lyasOkbMOkIOWG
memBkzoKPj4+IE9uIFdlZCwgQXVnIDI2LCAyMDIwIGF0IDEwOjIzOjI4UE0gKzA4MDAsIEFsZ2Vh
IENhbyB3cm90ZToKPj4+PiBDRUEgODYxLjMgc3BlYyBhZGRzIGNvbG9yaW1ldHJ5IGRhdGEgYmxv
Y2sgZm9yIEhETUkuCj4+Pj4gUGFyc2luZyB0aGUgYmxvY2sgdG8gZ2V0IHRoZSBjb2xvcmltZXRy
eSBkYXRhIGZyb20KPj4+PiBwYW5lbC4KPj4+IEFuZCB3aGF0IGV4YWN0bHkgZG8geW91IHdhbnQg
dG8gZG8gd2l0aCB0aGF0IGRhdGE/Cj4+Cj4+IFdlIGNhbiBnZXQgY29sb3JpbWV0cnkgZGF0YSBi
bG9jayBmcm9tIGVkaWQgdGhlbiBzdXBwb3J0Cj4+Cj4+IEhETUkgY29sb3JpbWV0cnkgc3VjaCBh
cyBCVDIwMjAuCj4gQnV0IHdoYXQgZG8geW91IHdhbnQgdG8gZG8gd2l0aCBpdD8gVGhlIHBhdGNo
IGRvZXMgbm90aGluZwo+IGZ1bmN0aW9uYWwuCgpJZiB3ZSB3YW50IHRvIG91dHB1dCBCVDIwMjAg
aW4gSERNSSBkcml2ZXIsIHdlIGNhbiBrbm93IHdoZXRoZXIgVFYgCnN1cHBvcnQgQlQyMDIwCgp2
aWEgY29ubmVjdG9yLT5kaXNwbGF5X2luZm8uaGRtaS5jb2xvcmltZXRyeS4gSWYgVFYgZG9uJ3Qg
c3VwcG9ydCAKQlQyMDIwLCBIRE1JIHNob3VsZG4ndAoKb3VwdXQgaW4gQlQyMDIwLgoKPj4+PiBT
aWduZWQtb2ZmLWJ5OiBBbGdlYSBDYW8gPGFsZ2VhLmNhb0Byb2NrLWNoaXBzLmNvbT4KPj4+PiAt
LS0KPj4+Pgo+Pj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jICB8IDQ1ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4+PiAgICBpbmNsdWRlL2RybS9kcm1fY29u
bmVjdG9yLmggfCAgMyArKysKPj4+PiAgICBpbmNsdWRlL2RybS9kcm1fZWRpZC5oICAgICAgfCAx
NCArKysrKysrKysrKysKPj4+PiAgICAzIGZpbGVzIGNoYW5nZWQsIDYyIGluc2VydGlvbnMoKykK
Pj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZWRpZC5jCj4+Pj4gaW5kZXggMzE0OTZiNmNmYzU2Li42N2U2MDdjMDQ0
OTIgMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKPj4+PiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwo+Pj4+IEBAIC0zMjIzLDYgKzMyMjMsNyBAQCBh
ZGRfZGV0YWlsZWRfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rvciwgc3RydWN0
IGVkaWQgKmVkaWQsCj4+Pj4gICAgI2RlZmluZSBWSURFT19CTE9DSyAgICAgMHgwMgo+Pj4+ICAg
ICNkZWZpbmUgVkVORE9SX0JMT0NLICAgIDB4MDMKPj4+PiAgICAjZGVmaW5lIFNQRUFLRVJfQkxP
Q0sJMHgwNAo+Pj4+ICsjZGVmaW5lIENPTE9SSU1FVFJZX0RBVEFfQkxPQ0sJCTB4NQo+Pj4+ICAg
ICNkZWZpbmUgSERSX1NUQVRJQ19NRVRBREFUQV9CTE9DSwkweDYKPj4+PiAgICAjZGVmaW5lIFVT
RV9FWFRFTkRFRF9UQUcgMHgwNwo+Pj4+ICAgICNkZWZpbmUgRVhUX1ZJREVPX0NBUEFCSUxJVFlf
QkxPQ0sgMHgwMAo+Pj4+IEBAIC00MzA5LDYgKzQzMTAsNDggQEAgc3RhdGljIHZvaWQgZml4dXBf
ZGV0YWlsZWRfY2VhX21vZGVfY2xvY2soc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpCj4+
Pj4gICAgCW1vZGUtPmNsb2NrID0gY2xvY2s7Cj4+Pj4gICAgfQo+Pj4+ICAgIAo+Pj4+ICtzdGF0
aWMgYm9vbCBjZWFfZGJfaXNfaGRtaV9jb2xvcmltZXRyeV9kYXRhX2Jsb2NrKGNvbnN0IHU4ICpk
YikKPj4+PiArewo+Pj4+ICsJaWYgKGNlYV9kYl90YWcoZGIpICE9IFVTRV9FWFRFTkRFRF9UQUcp
Cj4+Pj4gKwkJcmV0dXJuIGZhbHNlOwo+Pj4+ICsKPj4+PiArCWlmIChkYlsxXSAhPSBDT0xPUklN
RVRSWV9EQVRBX0JMT0NLKQo+Pj4+ICsJCXJldHVybiBmYWxzZTsKPj4+PiArCj4+Pj4gKwlpZiAo
Y2VhX2RiX3BheWxvYWRfbGVuKGRiKSA8IDIpCj4+Pj4gKwkJcmV0dXJuIGZhbHNlOwo+Pj4+ICsK
Pj4+PiArCXJldHVybiB0cnVlOwo+Pj4+ICt9Cj4+Pj4gKwo+Pj4+ICtzdGF0aWMgdm9pZAo+Pj4+
ICtkcm1fcGFyc2VfY29sb3JpbWV0cnlfZGF0YV9ibG9jayhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAq
Y29ubmVjdG9yLCBjb25zdCB1OCAqZGIpCj4+Pj4gK3sKPj4+PiArCXN0cnVjdCBkcm1faGRtaV9p
bmZvICppbmZvID0gJmNvbm5lY3Rvci0+ZGlzcGxheV9pbmZvLmhkbWk7Cj4+Pj4gKwo+Pj4+ICsJ
aWYgKGRiWzJdICYgRFJNX0VESURfQ0xSTUVUUllfeHZZQ0NfNjAxKQo+Pj4+ICsJCWluZm8tPmNv
bG9yaW1ldHJ5IHw9IERSTV9FRElEX0NMUk1FVFJZX3h2WUNDXzYwMTsKPj4+PiArCWlmIChkYlsy
XSAmIERSTV9FRElEX0NMUk1FVFJZX3h2WUNDXzcwOSkKPj4+PiArCQlpbmZvLT5jb2xvcmltZXRy
eSB8PSBEUk1fRURJRF9DTFJNRVRSWV94dllDQ183MDk7Cj4+Pj4gKwlpZiAoZGJbMl0gJiBEUk1f
RURJRF9DTFJNRVRSWV9zWUNDXzYwMSkKPj4+PiArCQlpbmZvLT5jb2xvcmltZXRyeSB8PSBEUk1f
RURJRF9DTFJNRVRSWV9zWUNDXzYwMTsKPj4+PiArCWlmIChkYlsyXSAmIERSTV9FRElEX0NMUk1F
VFJZX0FEQllDQ182MDEpCj4+Pj4gKwkJaW5mby0+Y29sb3JpbWV0cnkgfD0gRFJNX0VESURfQ0xS
TUVUUllfQURCWUNDXzYwMTsKPj4+PiArCWlmIChkYlsyXSAmIERSTV9FRElEX0NMUk1FVFJZX0FE
Ql9SR0IpCj4+Pj4gKwkJaW5mby0+Y29sb3JpbWV0cnkgfD0gRFJNX0VESURfQ0xSTUVUUllfQURC
X1JHQjsKPj4+PiArCWlmIChkYlsyXSAmIERSTV9FRElEX0NMUk1FVFJZX0JUMjAyMF9DWUNDKQo+
Pj4+ICsJCWluZm8tPmNvbG9yaW1ldHJ5IHw9IERSTV9FRElEX0NMUk1FVFJZX0JUMjAyMF9DWUND
Owo+Pj4+ICsJaWYgKGRiWzJdICYgRFJNX0VESURfQ0xSTUVUUllfQlQyMDIwX1lDQykKPj4+PiAr
CQlpbmZvLT5jb2xvcmltZXRyeSB8PSBEUk1fRURJRF9DTFJNRVRSWV9CVDIwMjBfWUNDOwo+Pj4+
ICsJaWYgKGRiWzJdICYgRFJNX0VESURfQ0xSTUVUUllfQlQyMDIwX1JHQikKPj4+PiArCQlpbmZv
LT5jb2xvcmltZXRyeSB8PSBEUk1fRURJRF9DTFJNRVRSWV9CVDIwMjBfUkdCOwo+Pj4+ICsJLyog
Qnl0ZSA0IEJpdCA3OiBEQ0ktUDMgKi8KPj4+PiArCWlmIChkYlszXSAmIEJJVCg3KSkKPj4+PiAr
CQlpbmZvLT5jb2xvcmltZXRyeSB8PSBEUk1fRURJRF9DTFJNRVRSWV9EQ0lfUDM7Cj4+Pj4gKwo+
Pj4+ICsJRFJNX0RFQlVHX0tNUygiU3VwcG9ydGVkIENvbG9yaW1ldHJ5IDB4JXhcbiIsIGluZm8t
PmNvbG9yaW1ldHJ5KTsKPj4+PiArfQo+Pj4+ICsKPj4+PiAgICBzdGF0aWMgYm9vbCBjZWFfZGJf
aXNfaGRtaV9oZHJfbWV0YWRhdGFfYmxvY2soY29uc3QgdTggKmRiKQo+Pj4+ICAgIHsKPj4+PiAg
ICAJaWYgKGNlYV9kYl90YWcoZGIpICE9IFVTRV9FWFRFTkRFRF9UQUcpCj4+Pj4gQEAgLTQ5OTQs
NiArNTAzNyw4IEBAIHN0YXRpYyB2b2lkIGRybV9wYXJzZV9jZWFfZXh0KHN0cnVjdCBkcm1fY29u
bmVjdG9yICpjb25uZWN0b3IsCj4+Pj4gICAgCQkJZHJtX3BhcnNlX3ZjZGIoY29ubmVjdG9yLCBk
Yik7Cj4+Pj4gICAgCQlpZiAoY2VhX2RiX2lzX2hkbWlfaGRyX21ldGFkYXRhX2Jsb2NrKGRiKSkK
Pj4+PiAgICAJCQlkcm1fcGFyc2VfaGRyX21ldGFkYXRhX2Jsb2NrKGNvbm5lY3RvciwgZGIpOwo+
Pj4+ICsJCWlmIChjZWFfZGJfaXNfaGRtaV9jb2xvcmltZXRyeV9kYXRhX2Jsb2NrKGRiKSkKPj4+
PiArCQkJZHJtX3BhcnNlX2NvbG9yaW1ldHJ5X2RhdGFfYmxvY2soY29ubmVjdG9yLCBkYik7Cj4+
Pj4gICAgCX0KPj4+PiAgICB9Cj4+Pj4gICAgCj4+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJt
L2RybV9jb25uZWN0b3IuaCBiL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaAo+Pj4+IGluZGV4
IGFmMTQ1NjA4YjVlZC4uZDU5OWMzYjllODgxIDEwMDY0NAo+Pj4+IC0tLSBhL2luY2x1ZGUvZHJt
L2RybV9jb25uZWN0b3IuaAo+Pj4+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaAo+
Pj4+IEBAIC0yMDcsNiArMjA3LDkgQEAgc3RydWN0IGRybV9oZG1pX2luZm8gewo+Pj4+ICAgIAo+
Pj4+ICAgIAkvKiogQHk0MjBfZGNfbW9kZXM6IGJpdG1hcCBvZiBkZWVwIGNvbG9yIHN1cHBvcnQg
aW5kZXggKi8KPj4+PiAgICAJdTggeTQyMF9kY19tb2RlczsKPj4+PiArCj4+Pj4gKwkvKiBAY29s
b3JpbWV0cnk6IGJpdG1hcCBvZiBzdXBwb3J0ZWQgY29sb3JpbWV0cnkgbW9kZXMgKi8KPj4+PiAr
CXUxNiBjb2xvcmltZXRyeTsKPj4+PiAgICB9Owo+Pj4+ICAgIAo+Pj4+ICAgIC8qKgo+Pj4+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZWRpZC5oIGIvaW5jbHVkZS9kcm0vZHJtX2VkaWQu
aAo+Pj4+IGluZGV4IGNmYTRmNWFmNDlhZi4uOThmYTc4YzJmODJkIDEwMDY0NAo+Pj4+IC0tLSBh
L2luY2x1ZGUvZHJtL2RybV9lZGlkLmgKPj4+PiArKysgYi9pbmNsdWRlL2RybS9kcm1fZWRpZC5o
Cj4+Pj4gQEAgLTIyOSw2ICsyMjksMjAgQEAgc3RydWN0IGRldGFpbGVkX3RpbWluZyB7Cj4+Pj4g
ICAgCQkJCSAgICBEUk1fRURJRF9ZQ0JDUjQyMF9EQ18zNiB8IFwKPj4+PiAgICAJCQkJICAgIERS
TV9FRElEX1lDQkNSNDIwX0RDXzMwKQo+Pj4+ICAgIAo+Pj4+ICsvKgo+Pj4+ICsgKiBTdXBwb3J0
ZWQgQ29sb3JpbWV0cnkgZnJvbSBjb2xvcmltZXRyeSBkYXRhIGJsb2NrCj4+Pj4gKyAqIGFzIHBl
ciBDRUEgODYxLUcgc3BlYwo+Pj4+ICsgKi8KPj4+PiArI2RlZmluZSBEUk1fRURJRF9DTFJNRVRS
WV94dllDQ182MDEgICAoMSA8PCAwKQo+Pj4+ICsjZGVmaW5lIERSTV9FRElEX0NMUk1FVFJZX3h2
WUNDXzcwOSAgICgxIDw8IDEpCj4+Pj4gKyNkZWZpbmUgRFJNX0VESURfQ0xSTUVUUllfc1lDQ182
MDEgICAgKDEgPDwgMikKPj4+PiArI2RlZmluZSBEUk1fRURJRF9DTFJNRVRSWV9BREJZQ0NfNjAx
ICAoMSA8PCAzKQo+Pj4+ICsjZGVmaW5lIERSTV9FRElEX0NMUk1FVFJZX0FEQl9SR0IgICAgICgx
IDw8IDQpCj4+Pj4gKyNkZWZpbmUgRFJNX0VESURfQ0xSTUVUUllfQlQyMDIwX0NZQ0MgKDEgPDwg
NSkKPj4+PiArI2RlZmluZSBEUk1fRURJRF9DTFJNRVRSWV9CVDIwMjBfWUNDICAoMSA8PCA2KQo+
Pj4+ICsjZGVmaW5lIERSTV9FRElEX0NMUk1FVFJZX0JUMjAyMF9SR0IgICgxIDw8IDcpCj4+Pj4g
KyNkZWZpbmUgRFJNX0VESURfQ0xSTUVUUllfRENJX1AzICAgICAgKDEgPDwgMTUpCj4+Pj4gKwo+
Pj4+ICAgIC8qIEVMRCBIZWFkZXIgQmxvY2sgKi8KPj4+PiAgICAjZGVmaW5lIERSTV9FTERfSEVB
REVSX0JMT0NLX1NJWkUJNAo+Pj4+ICAgIAo+Pj4+IC0tIAo+Pj4+IDIuMjUuMQo+Pj4+Cj4+Pj4K
Pj4+Pgo+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4+Pj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+Pj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPj4+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
