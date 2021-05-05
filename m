Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC90373C38
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 15:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69AC16E4A7;
	Wed,  5 May 2021 13:18:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66D366E4A1;
 Wed,  5 May 2021 13:18:22 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 0E7ECC800B4;
 Wed,  5 May 2021 15:18:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 1Qag4sH1Yh9M; Wed,  5 May 2021 15:18:20 +0200 (CEST)
Received: from [IPv6:2003:e3:7f39:8600:6e35:22:d0af:f0c]
 (p200300e37F3986006e350022d0aF0F0C.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f39:8600:6e35:22:d0af:f0c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPSA id 469BFC800B3;
 Wed,  5 May 2021 15:18:19 +0200 (CEST)
Subject: Re: [PATCH 4/4] Use YCbCr420 as fallback when RGB fails
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20210503182148.851790-1-wse@tuxedocomputers.com>
 <20210503182148.851790-5-wse@tuxedocomputers.com>
 <YJEdLbE5EOQv+Nib@intel.com>
From: Werner Sembach <wse@tuxedocomputers.com>
Message-ID: <733f307c-9c39-e3a4-e1d9-fc238286ecc6@tuxedocomputers.com>
Date: Wed, 5 May 2021 15:18:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YJEdLbE5EOQv+Nib@intel.com>
Content-Language: de-DE
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
Cc: airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkFtIDA0LjA1LjIxIHVtIDEyOjA4IHNjaHJpZWIgVmlsbGUgU3lyasOkbMOkOgo+IE9uIE1vbiwg
TWF5IDAzLCAyMDIxIGF0IDA4OjIxOjQ4UE0gKzAyMDAsIFdlcm5lciBTZW1iYWNoIHdyb3RlOgo+
PiBXaGVuIGVuY29kZXIgdmFsaWRhdGlvbiBvZiBhIGRpc3BsYXkgbW9kZSBmYWlscywgcmV0cnkg
d2l0aCBsZXNzIGJhbmR3aWR0aAo+PiBoZWF2eSBZQ2JDcjQyMCBjb2xvciBtb2RlLCBpZiBhdmFp
bGFibGUuIFRoaXMgZW5hYmxlcyBzb21lIEhETUkgMS40IHNldHVwcwo+PiB0byBzdXBwb3J0IDRr
NjBIeiBvdXRwdXQsIHdoaWNoIHByZXZpb3VzbHkgZmFpbGVkIHNpbGVudGx5Lgo+Pgo+PiBBTURH
UFUgaGFkIG5lYXJseSB0aGUgZXhhY3Qgc2FtZSBpc3N1ZS4gVGhpcyBwcm9ibGVtIGRlc2NyaXB0
aW9uIGlzCj4+IHRoZXJlZm9yZSBjb3BpZWQgZnJvbSBteSBjb21taXQgbWVzc2FnZSBvZiB0aGUg
QU1ER1BVIHBhdGNoLgo+Pgo+PiBPbiBzb21lIHNldHVwcywgd2hpbGUgdGhlIG1vbml0b3IgYW5k
IHRoZSBncHUgc3VwcG9ydCBkaXNwbGF5IG1vZGVzIHdpdGgKPj4gcGl4ZWwgY2xvY2tzIG9mIHVw
IHRvIDYwME1IeiwgdGhlIGxpbmsgZW5jb2RlciBtaWdodCBub3QuIFRoaXMgcHJldmVudHMKPj4g
WUNiQ3I0NDQgYW5kIFJHQiBlbmNvZGluZyBmb3IgNGs2MEh6LCBidXQgWUNiQ3I0MjAgZW5jb2Rp
bmcgbWlnaHQgc3RpbGwgYmUKPj4gcG9zc2libGUuIEhvd2V2ZXIsIHdoaWNoIGNvbG9yIG1vZGUg
aXMgdXNlZCBpcyBkZWNpZGVkIGJlZm9yZSB0aGUgbGluawo+PiBlbmNvZGVyIGNhcGFiaWxpdGll
cyBhcmUgY2hlY2tlZC4gVGhpcyBwYXRjaCBmaXhlcyB0aGUgcHJvYmxlbSBieSByZXRyeWluZwo+
PiB0byBmaW5kIGEgZGlzcGxheSBtb2RlIHdpdGggWUNiQ3I0MjAgZW5mb3JjZWQgYW5kIHVzaW5n
IGl0LCBpZiBpdCBpcwo+PiB2YWxpZC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogV2VybmVyIFNlbWJh
Y2ggPHdzZUB0dXhlZG9jb21wdXRlcnMuY29tPgo+PiAtLS0KPj4KPj4gPkZyb20gNGVhMGM4ODM5
YjQ3ZTg0NmQ0NmM2MTNlMzhhZjQ3NTIzMTk5NGYwZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
Pj4gRnJvbTogV2VybmVyIFNlbWJhY2ggPHdzZUB0dXhlZG9jb21wdXRlcnMuY29tPgo+PiBEYXRl
OiBNb24sIDMgTWF5IDIwMjEgMTY6MjM6MTcgKzAyMDAKPj4gU3ViamVjdDogW1BBVENIIDQvNF0g
VXNlIFlDYkNyNDIwIGFzIGZhbGxiYWNrIHdoZW4gUkdCIGZhaWxzCj4+Cj4+IC0tLQo+PiAgZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZG1pLmMgfCAxMCArKysrKysrKystCj4+
ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkbWkuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRtaS5jCj4+IGluZGV4IGUyNTUzYWM2
ZmQxMy4uMjBjODAwZjJlZDYwIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2hkbWkuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2hkbWkuYwo+PiBAQCAtMTkxMyw3ICsxOTEzLDcgQEAgaW50ZWxfaGRtaV9tb2RlX3Zh
bGlkKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCj4+ICAJCWNsb2NrICo9IDI7Cj4+
ICAJfQo+PiAgCj4+IC0JaWYgKGNvbm5lY3Rvci0+eWNiY3JfNDIwX2FsbG93ZWQgJiYgZHJtX21v
ZGVfaXNfNDIwX29ubHkoJmNvbm5lY3Rvci0+ZGlzcGxheV9pbmZvLCBtb2RlKSkKPj4gKwlpZiAo
Y29ubmVjdG9yLT55Y2Jjcl80MjBfYWxsb3dlZCAmJiBkcm1fbW9kZV9pc180MjAoJmNvbm5lY3Rv
ci0+ZGlzcGxheV9pbmZvLCBtb2RlKSkKPj4gIAkJY2xvY2sgLz0gMjsKPiBUaGlzIGlzIHRvbyBl
YXJseS4gV2Ugd2FudCB0byBrZWVwIGNsb2NrIGFzIGlzIGZvciBjaGVja2luZyB3aGV0aGVyIFJH
Qgo+IG91dHB1dCBpcyBwb3NzaWJsZSB3aXRoIDQyMF9hbHNvIG1vZGVzLgo+Cj4gU28gdGhlIHN0
cnVjdHVyZSB5b3UgaGFkIGluIHlvdXIgb3JpZ2luYWwgcGF0Y2ggd2FzIHRoZSBjb3JyZWN0IHdh
eSB0bwo+IGdvIGFib3V0IGl0LiBXaGljaCBJIHRoaW5rIHdhcyBzb21ldGhpbmcgYWxvbmcgdGhl
IGxpbmVzIG9mOgo+Cj4gaWYgKDQyMF9vbmx5KQo+IAljbG9jayAvPSAyOwo+Cj4gc3RhdHVzID0g
aW50ZWxfaGRtaV9tb2RlX2Nsb2NrX3ZhbGlkKCkKPiBpZiAoc3RhdHVzICE9IE9LKSB7Cj4gCWlm
ICg0MjBfb25seSB8fCAhNDIwX2Fsc28gfHwgITQyMF9hbGxvd2VkKQo+IAkJcmV0dXJuIHN0YXR1
czsKPiAJCj4gCWNsb2NrIC89IDI7Cj4gCXN0YXR1cyA9IGludGVsX2hkbWlfbW9kZV9jbG9ja192
YWxpZCgpCj4gfQpEb2VzIGl0IG1ha2UgYSBkaWZmZXJlbmNlPwoKSW4gY2FzZSAhNDIwX2FsbG93
ZWQgb25seSByZ2IgaXMgZXZlciB0ZXN0ZWQKSW4gY2FzZSA0MjBfYWxsb3dlZCAmJiA0MjBfb25s
eSBvbmx5IDQyMCBpcyBldmVyIHRlc3RlZApJbiBjYXNlIDQyMF9hbGxvd2VkICYmIDQyMF9hbHNv
IHRoZSByZXR1cm4gdmFsdWUgb2YgdGhlIHJnYiB0ZXN0IGlzIGRpc2NhcmRlZCBhbnl3YXlzCj4K
Pj4gIAo+PiAgCXN0YXR1cyA9IGludGVsX2hkbWlfbW9kZV9jbG9ja192YWxpZChoZG1pLCBjbG9j
aywgaGFzX2hkbWlfc2luayk7Cj4+IEBAIC0yMTE5LDYgKzIxMTksMTQgQEAgaW50IGludGVsX2hk
bWlfY29tcHV0ZV9vdXRwdXRfZm9ybWF0KHN0cnVjdCBpbnRlbF9lbmNvZGVyICplbmNvZGVyLAo+
PiAgCQljcnRjX3N0YXRlLT5vdXRwdXRfZm9ybWF0ID0gSU5URUxfT1VUUFVUX0ZPUk1BVF9SR0I7
Cj4+ICAKPj4gIAlyZXQgPSBpbnRlbF9oZG1pX2NvbXB1dGVfY2xvY2soZW5jb2RlciwgY3J0Y19z
dGF0ZSk7Cj4+ICsJaWYgKHJldCkgewo+PiArCQlpZiAoY3J0Y19zdGF0ZS0+b3V0cHV0X2Zvcm1h
dCAhPSBJTlRFTF9PVVRQVVRfRk9STUFUX1lDQkNSNDIwIHx8Cj4+ICsJCQkJY29ubmVjdG9yLT55
Y2Jjcl80MjBfYWxsb3dlZCB8fAo+PiArCQkJCWRybV9tb2RlX2lzXzQyMF9hbHNvKCZjb25uZWN0
b3ItPmRpc3BsYXlfaW5mbywgYWRqdXN0ZWRfbW9kZSkpIHsKPiBUaGF0IG5lZWRzIHMvfHwvJiYv
IG9yIHdlIGZsaXAgdGhlIGNvbmRpdGlvbnMgYXJvdW5kIHRvOgo+Cj4gaWYgKHJldCkgewo+IAlp
ZiAob3V0cHV0X2Zvcm1hdCA9PSA0MjAgfHwgITQyMF9hbGxvd2VkIHx8ICE0MjBfYWxzbykKPiAJ
CXJldHVybiByZXQ7Cj4KPiAJb3V0cHV0X2Zvcm1hdCA9IDQyMDsKPiAJLi4uCj4gfQo+Cj4gd2hp
Y2ggd291bGQgaGF2ZSB0aGUgYmVuZWZpdCBvZiBhdm9pZGluZyB0aGUgZXh0cmEgaW5kZW50IGxl
dmVsLgo+Cj4+ICsJCQljcnRjX3N0YXRlLT5vdXRwdXRfZm9ybWF0ID0gSU5URUxfT1VUUFVUX0ZP
Uk1BVF9ZQ0JDUjQyMDsKPj4gKwkJCXJldCA9IGludGVsX2hkbWlfY29tcHV0ZV9jbG9jayhlbmNv
ZGVyLCBjcnRjX3N0YXRlKTsKPj4gKwkJfQo+PiArCX0KPj4gIAo+PiAgCXJldHVybiByZXQ7Cj4+
ICB9Cj4+IC0tIAo+PiAyLjI1LjEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
