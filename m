Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC5C15A3FB
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 09:53:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E5089D4D;
	Wed, 12 Feb 2020 08:52:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 230748800B;
 Wed, 12 Feb 2020 08:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 4B3042A604B;
 Wed, 12 Feb 2020 09:52:53 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id TBwHZvsU78He; Wed, 12 Feb 2020 09:52:53 +0100 (CET)
Received: from thor (252.80.76.83.dynamic.wline.res.cust.swisscom.ch
 [83.76.80.252])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id F28972A6046;
 Wed, 12 Feb 2020 09:52:52 +0100 (CET)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.93)
 (envelope-from <michel@daenzer.net>)
 id 1j1nlM-000lgh-8D; Wed, 12 Feb 2020 09:52:52 +0100
Subject: Re: [PATCH v2] drm/i915: Disable
 -Wtautological-constant-out-of-range-compare
To: Nathan Chancellor <natechancellor@gmail.com>
References: <20200211050808.29463-1-natechancellor@gmail.com>
 <20200211061338.23666-1-natechancellor@gmail.com>
 <4c806435-f32d-1559-9563-ffe3fa69f0d1@daenzer.net>
 <20200211203935.GA16176@ubuntu-m2-xlarge-x86>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <f3a6346b-2abf-0b6a-3d84-66e12f700b2b@daenzer.net>
Date: Wed, 12 Feb 2020 09:52:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200211203935.GA16176@ubuntu-m2-xlarge-x86>
Content-Language: en-CA
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
Cc: clang-built-linux@googlegroups.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wMi0xMSA5OjM5IHAubS4sIE5hdGhhbiBDaGFuY2VsbG9yIHdyb3RlOgo+IE9uIFR1
ZSwgRmViIDExLCAyMDIwIGF0IDEwOjQxOjQ4QU0gKzAxMDAsIE1pY2hlbCBEw6RuemVyIHdyb3Rl
Ogo+PiBPbiAyMDIwLTAyLTExIDc6MTMgYS5tLiwgTmF0aGFuIENoYW5jZWxsb3Igd3JvdGU6Cj4+
PiBBIHJlY2VudCBjb21taXQgaW4gY2xhbmcgYWRkZWQgLVd0YXV0b2xvZ2ljYWwtY29tcGFyZSB0
byAtV2FsbCwgd2hpY2ggaXMKPj4+IGVuYWJsZWQgZm9yIGk5MTUgc28gd2Ugc2VlIHRoZSBmb2xs
b3dpbmcgd2FybmluZzoKPj4+Cj4+PiAuLi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9n
ZW1fZXhlY2J1ZmZlci5jOjE0ODU6MjI6IHdhcm5pbmc6Cj4+PiByZXN1bHQgb2YgY29tcGFyaXNv
biBvZiBjb25zdGFudCA1NzY0NjA3NTIzMDM0MjM0ODcgd2l0aCBleHByZXNzaW9uIG9mCj4+PiB0
eXBlICd1bnNpZ25lZCBpbnQnIGlzIGFsd2F5cyBmYWxzZQo+Pj4gWy1XdGF1dG9sb2dpY2FsLWNv
bnN0YW50LW91dC1vZi1yYW5nZS1jb21wYXJlXQo+Pj4gICAgICAgICBpZiAodW5saWtlbHkocmVt
YWluID4gTl9SRUxPQyhVTE9OR19NQVgpKSkKPj4+ICAgICAgICAgICAgIH5+fn5+fn5+fn5+fn5+
fn5efn5+fn5+fn5+fn5+fn5+fn5+fn4KPj4+Cj4+PiBUaGlzIHdhcm5pbmcgb25seSBoYXBwZW5z
IG9uIHg4Nl82NCBidXQgdGhhdCBjaGVjayBpcyByZWxldmFudCBmb3IKPj4+IDMyLWJpdCB4ODYg
c28gd2UgY2Fubm90IHJlbW92ZSBpdC4KPj4KPj4gVGhhdCdzIHN1cHJpc2luZy4gQUZBSUNUIE5f
UkVMT0MoVUxPTkdfTUFYKSB3b3JrcyBvdXQgdG8gdGhlIHNhbWUgdmFsdWUKPj4gaW4gYm90aCBj
YXNlcywgYW5kIHJlbWFpbiBpcyBhIDMyLWJpdCB2YWx1ZSBpbiBib3RoIGNhc2VzLiBIb3cgY2Fu
IGl0IGJlCj4+IGxhcmdlciB0aGFuIE5fUkVMT0MoVUxPTkdfTUFYKSBvbiAzMi1iaXQgKGJ1dCBu
b3Qgb24gNjQtYml0KT8KPj4KPiAKPiBIaSBNaWNoZWwsCj4gCj4gQ2FuJ3QgdGhpcyBjb25kaXRp
b24gYmUgdHJ1ZSB3aGVuIFVJTlRfTUFYID09IFVMT05HX01BWD8KCk9oLCByaWdodCwgSSB0aGlu
ayBJIHdhcyB3cm9uZ2x5IHRoaW5raW5nIGxvbmcgaGFkIDY0IGJpdHMgZXZlbiBvbiAzMi1iaXQu
CgoKQW55d2F5LCB0aGlzIHN1Z2dlc3RzIGEgcG9zc2libGUgYmV0dGVyIHNvbHV0aW9uOgoKI2lm
IFVJTlRfTUFYID09IFVMT05HX01BWAoJaWYgKHVubGlrZWx5KHJlbWFpbiA+IE5fUkVMT0MoVUxP
TkdfTUFYKSkpCgkJcmV0dXJuIC1FSU5WQUw7CiNlbmRpZgoKCk9yIGlmIHRoYXQgY2FuJ3QgYmUg
dXNlZCBmb3Igc29tZSByZWFzb24sIHNvbWV0aGluZyBsaWtlCgoJaWYgKHVubGlrZWx5KCh1bnNp
Z25lZCBsb25nKXJlbWFpbiA+IE5fUkVMT0MoVUxPTkdfTUFYKSkpCgkJcmV0dXJuIC1FSU5WQUw7
CgpzaG91bGQgc2lsZW5jZSB0aGUgd2FybmluZy4KCgpFaXRoZXIgb2YgdGhlc2Ugc2hvdWxkIGJl
IGJldHRlciB0aGFuIGNvbXBsZXRlbHkgZGlzYWJsaW5nIHRoZSB3YXJuaW5nCmZvciB0aGUgd2hv
bGUgZmlsZS4KCgotLSAKRWFydGhsaW5nIE1pY2hlbCBEw6RuemVyICAgICAgICAgICAgICAgfCAg
ICAgICAgICAgICAgIGh0dHBzOi8vcmVkaGF0LmNvbQpMaWJyZSBzb2Z0d2FyZSBlbnRodXNpYXN0
ICAgICAgICAgICAgIHwgICAgICAgICAgICAgTWVzYSBhbmQgWCBkZXZlbG9wZXIKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
