Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCCE15AE93
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 18:17:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E15C06E07D;
	Wed, 12 Feb 2020 17:17:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 19F696E07D;
 Wed, 12 Feb 2020 17:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 514DB2A604B;
 Wed, 12 Feb 2020 18:17:06 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id TidibmeR2N2o; Wed, 12 Feb 2020 18:17:06 +0100 (CET)
Received: from thor (252.80.76.83.dynamic.wline.res.cust.swisscom.ch
 [83.76.80.252])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 01A9A2A6046;
 Wed, 12 Feb 2020 18:17:05 +0100 (CET)
Received: from [::1] by thor with esmtp (Exim 4.93)
 (envelope-from <michel@daenzer.net>)
 id 1j1vdJ-000ow8-2f; Wed, 12 Feb 2020 18:17:05 +0100
Subject: Re: [PATCH v2] drm/i915: Disable
 -Wtautological-constant-out-of-range-compare
To: Nathan Chancellor <natechancellor@gmail.com>
References: <20200211050808.29463-1-natechancellor@gmail.com>
 <20200211061338.23666-1-natechancellor@gmail.com>
 <4c806435-f32d-1559-9563-ffe3fa69f0d1@daenzer.net>
 <20200211203935.GA16176@ubuntu-m2-xlarge-x86>
 <f3a6346b-2abf-0b6a-3d84-66e12f700b2b@daenzer.net>
 <20200212170734.GA16396@ubuntu-m2-xlarge-x86>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <d81a2cfe-79b6-51d4-023e-0960c0593856@daenzer.net>
Date: Wed, 12 Feb 2020 18:17:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200212170734.GA16396@ubuntu-m2-xlarge-x86>
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

T24gMjAyMC0wMi0xMiA2OjA3IHAubS4sIE5hdGhhbiBDaGFuY2VsbG9yIHdyb3RlOgo+IE9uIFdl
ZCwgRmViIDEyLCAyMDIwIGF0IDA5OjUyOjUyQU0gKzAxMDAsIE1pY2hlbCBEw6RuemVyIHdyb3Rl
Ogo+PiBPbiAyMDIwLTAyLTExIDk6MzkgcC5tLiwgTmF0aGFuIENoYW5jZWxsb3Igd3JvdGU6Cj4+
PiBPbiBUdWUsIEZlYiAxMSwgMjAyMCBhdCAxMDo0MTo0OEFNICswMTAwLCBNaWNoZWwgRMOkbnpl
ciB3cm90ZToKPj4+PiBPbiAyMDIwLTAyLTExIDc6MTMgYS5tLiwgTmF0aGFuIENoYW5jZWxsb3Ig
d3JvdGU6Cj4+Pj4+IEEgcmVjZW50IGNvbW1pdCBpbiBjbGFuZyBhZGRlZCAtV3RhdXRvbG9naWNh
bC1jb21wYXJlIHRvIC1XYWxsLCB3aGljaCBpcwo+Pj4+PiBlbmFibGVkIGZvciBpOTE1IHNvIHdl
IHNlZSB0aGUgZm9sbG93aW5nIHdhcm5pbmc6Cj4+Pj4+Cj4+Pj4+IC4uL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2dlbS9pOTE1X2dlbV9leGVjYnVmZmVyLmM6MTQ4NToyMjogd2FybmluZzoKPj4+Pj4g
cmVzdWx0IG9mIGNvbXBhcmlzb24gb2YgY29uc3RhbnQgNTc2NDYwNzUyMzAzNDIzNDg3IHdpdGgg
ZXhwcmVzc2lvbiBvZgo+Pj4+PiB0eXBlICd1bnNpZ25lZCBpbnQnIGlzIGFsd2F5cyBmYWxzZQo+
Pj4+PiBbLVd0YXV0b2xvZ2ljYWwtY29uc3RhbnQtb3V0LW9mLXJhbmdlLWNvbXBhcmVdCj4+Pj4+
ICAgICAgICAgaWYgKHVubGlrZWx5KHJlbWFpbiA+IE5fUkVMT0MoVUxPTkdfTUFYKSkpCj4+Pj4+
ICAgICAgICAgICAgIH5+fn5+fn5+fn5+fn5+fn5efn5+fn5+fn5+fn5+fn5+fn5+fn4KPj4+Pj4K
Pj4+Pj4gVGhpcyB3YXJuaW5nIG9ubHkgaGFwcGVucyBvbiB4ODZfNjQgYnV0IHRoYXQgY2hlY2sg
aXMgcmVsZXZhbnQgZm9yCj4+Pj4+IDMyLWJpdCB4ODYgc28gd2UgY2Fubm90IHJlbW92ZSBpdC4K
Pj4+Pgo+Pj4+IFRoYXQncyBzdXByaXNpbmcuIEFGQUlDVCBOX1JFTE9DKFVMT05HX01BWCkgd29y
a3Mgb3V0IHRvIHRoZSBzYW1lIHZhbHVlCj4+Pj4gaW4gYm90aCBjYXNlcywgYW5kIHJlbWFpbiBp
cyBhIDMyLWJpdCB2YWx1ZSBpbiBib3RoIGNhc2VzLiBIb3cgY2FuIGl0IGJlCj4+Pj4gbGFyZ2Vy
IHRoYW4gTl9SRUxPQyhVTE9OR19NQVgpIG9uIDMyLWJpdCAoYnV0IG5vdCBvbiA2NC1iaXQpPwo+
Pj4+Cj4+Pgo+Pj4gSGkgTWljaGVsLAo+Pj4KPj4+IENhbid0IHRoaXMgY29uZGl0aW9uIGJlIHRy
dWUgd2hlbiBVSU5UX01BWCA9PSBVTE9OR19NQVg/Cj4+Cj4+IE9oLCByaWdodCwgSSB0aGluayBJ
IHdhcyB3cm9uZ2x5IHRoaW5raW5nIGxvbmcgaGFkIDY0IGJpdHMgZXZlbiBvbiAzMi1iaXQuCj4+
Cj4+Cj4+IEFueXdheSwgdGhpcyBzdWdnZXN0cyBhIHBvc3NpYmxlIGJldHRlciBzb2x1dGlvbjoK
Pj4KPj4gI2lmIFVJTlRfTUFYID09IFVMT05HX01BWAo+PiAJaWYgKHVubGlrZWx5KHJlbWFpbiA+
IE5fUkVMT0MoVUxPTkdfTUFYKSkpCj4+IAkJcmV0dXJuIC1FSU5WQUw7Cj4+ICNlbmRpZgo+Pgo+
Pgo+PiBPciBpZiB0aGF0IGNhbid0IGJlIHVzZWQgZm9yIHNvbWUgcmVhc29uLCBzb21ldGhpbmcg
bGlrZQo+Pgo+PiAJaWYgKHVubGlrZWx5KCh1bnNpZ25lZCBsb25nKXJlbWFpbiA+IE5fUkVMT0Mo
VUxPTkdfTUFYKSkpCj4+IAkJcmV0dXJuIC1FSU5WQUw7Cj4+Cj4+IHNob3VsZCBzaWxlbmNlIHRo
ZSB3YXJuaW5nLgo+IAo+IEkgZG8gbGlrZSB0aGlzIG9uZSBiZXR0ZXIgdGhhbiB0aGUgZm9ybWVy
LgoKRldJVywgb25lIGRvd25zaWRlIG9mIHRoaXMgb25lIGNvbXBhcmVkIHRvIGFsbCBhbHRlcm5h
dGl2ZXMgKHByZXN1bWFibHkpCmlzIHRoYXQgaXQgbWlnaHQgZW5kIHVwIGdlbmVyYXRpbmcgYWN0
dWFsIGNvZGUgZXZlbiBvbiA2NC1iaXQsIHdoaWNoCmFsd2F5cyBlbmRzIHVwIHNraXBwaW5nIHRo
ZSByZXR1cm4uCgoKLS0gCkVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAgICAgIHwg
ICAgICAgICAgICAgICBodHRwczovL3JlZGhhdC5jb20KTGlicmUgc29mdHdhcmUgZW50aHVzaWFz
dCAgICAgICAgICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVyCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
