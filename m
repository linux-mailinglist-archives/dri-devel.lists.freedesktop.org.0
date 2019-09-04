Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8579AA872B
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 20:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF69890CD;
	Wed,  4 Sep 2019 18:06:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6586C890CD
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 18:06:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7B92337;
 Wed,  4 Sep 2019 11:06:37 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 255A43F67D;
 Wed,  4 Sep 2019 11:06:37 -0700 (PDT)
Subject: Re: Adreno crash on i.MX53 running 5.3-rc6
To: Rob Clark <robdclark@gmail.com>, Fabio Estevam <festevam@gmail.com>
References: <CAOMZO5Cuk+t16bNFA+sm5=ZEdf+BNRtSpX27OCoQ==DbEyBtCw@mail.gmail.com>
 <ec11a377-fca3-ed12-2a05-abb3de936f8b@arm.com>
 <CAOMZO5BK0CJ8aA0CdBrYF75FRRHjqm0aOM4TpS9C+nHVuD8M_w@mail.gmail.com>
 <CAF6AEGtGXshOACrHYE7kkfvsBXRZ_ZF3xugJDOEFP9zr--vB5g@mail.gmail.com>
 <95ae3680-02c7-a1b8-5ea6-1a4d89293649@marek.ca>
 <CAOMZO5C7m6ZfFVXna18ZSZDgiggyTygK5VXZLxkx5Hg6Sy6G4w@mail.gmail.com>
 <CAF6AEGt5R34JBBY_X6kc5nSyGJexEy02ohijEtgoF=ff5o+-sQ@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <7029e8fa-301d-9c20-749f-13436bd5308f@arm.com>
Date: Wed, 4 Sep 2019 19:06:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAF6AEGt5R34JBBY_X6kc5nSyGJexEy02ohijEtgoF=ff5o+-sQ@mail.gmail.com>
Content-Language: en-GB
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
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>,
 Chris Healy <cphealy@gmail.com>, Jonathan Marek <jonathan@marek.ca>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDQvMDkvMjAxOSAwMToxMiwgUm9iIENsYXJrIHdyb3RlOgo+IE9uIFR1ZSwgU2VwIDMsIDIw
MTkgYXQgMTI6MzEgUE0gRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPiB3cm90ZToK
Pj4KPj4gSGkgSm9uYXRoYW4sCj4+Cj4+IE9uIFR1ZSwgU2VwIDMsIDIwMTkgYXQgNDoyNSBQTSBK
b25hdGhhbiBNYXJlayA8am9uYXRoYW5AbWFyZWsuY2E+IHdyb3RlOgo+Pj4KPj4+IEhpLAo+Pj4K
Pj4+IEkgdHJpZWQgdGhpcyBhbmQgaXQgd29ya3Mgd2l0aCBwYXRjaGVzIDQrNSBmcm9tIFJvYidz
IHNlcmllcyBhbmQKPj4+IGNoYW5naW5nIGdwdW1tdSB0byB1c2Ugc2dfcGh5cyhzZykgaW5zdGVh
ZCBvZiBzZy0+ZG1hX2FkZHJlc3MKPj4+IChkbWFfYWRkcmVzcyBpc24ndCBzZXQgbm93IHRoYXQg
ZG1hX21hcF9zZyBpc24ndCB1c2VkKS4KPj4KPj4gVGhhbmtzIGZvciB0ZXN0aW5nIGl0LiBJIGhh
dmVuJ3QgaGFkIGEgY2hhbmNlIHRvIHRlc3QgaXQgeWV0Lgo+Pgo+PiBSb2IsCj4+Cj4+IEkgYXNz
dW1lIHlvdXIgc2VyaWVzIGlzIHRhcmdldGVkIHRvIDUuNCwgY29ycmVjdD8KPiAKPiBtYXliZSwg
YWx0aG91Z2ggQ2hyaXN0b3BoIEhlbGx3aWcgZGlkbid0IHNlZW0gbGlrZSBhIGJpZyBmYW4gb2YK
PiBleHBvc2luZyBjYWNoZSBvcHMsIGFuZCB3b3VsZCByYXRoZXIgYWRkIGEgbmV3IGFsbG9jYXRp
b24gQVBJIGZvcgo+IHVuY2FjaGVkIHBhZ2VzLi4gc28gSSdtIG5vdCBlbnRpcmVseSBzdXJlIHdo
YXQgdGhlIHdheSBmb3J3YXJkIHdpbGwKPiBiZS4KClRCSCwgdGhlIHVzZSBvZiBtYXAvdW5tYXAg
bG9va2VkIHJlYXNvbmFibGUgaW4gdGhlIGNvbnRleHQgb2YgCiJzdGFydC9zdG9wIHVzaW5nIHRo
ZXNlIHBhZ2VzIGZvciBzdHVmZiB3aGljaCBtYXkgaW5jbHVkZSBETUEiLCBzbyBldmVuIAppZiBp
dCB3YXMgY2hlZWtpbHkgaWdub3Jpbmcgc2ctPmRtYV9hZGRyZXNzIEknbSBub3Qgc3VyZSBJJ2Qg
cmVhbGx5IApjb25zaWRlciBpdCAiYWJ1c2UiIC0gaW4gY29tcGFyaXNvbiwgdXNpbmcgc3luYyB3
aXRob3V0IGEgcHJpb3IgbWFwIAp1bnF1ZXN0aW9uYWJseSB2aW9sYXRlcyB0aGUgQVBJLCBhbmQg
bWVhbnMgdGhhdCBDT05GSUdfRE1BX0FQSV9ERUJVRyAKd2lsbCBiZSByZW5kZXJlZCB1c2VsZXNz
IHdpdGggZmFsc2UgcG9zaXRpdmVzIGlmIHRoaXMgZHJpdmVyIGlzIGFjdGl2ZSAKd2hpbGUgdHJ5
aW5nIHRvIGRlYnVnIHNvbWV0aGluZyBlbHNlLgoKVGhlIHdhcm5pbmcgcmVmZXJlbmNlZCBpbiAw
MDM2YmM3M2NjYmUgcmVwcmVzZW50cyBzb21ldGhpbmcgYmVpbmcgCnVubWFwcGVkIHdoaWNoIGRp
ZG4ndCBtYXRjaCBhIGNvcnJlc3BvbmRpbmcgbWFwIC0gZnJvbSB3aGF0IEkgY2FuIG1ha2UgCm9m
IGdldF9wYWdlcygpL3B1dF9wYWdlcygpIGl0IGxvb2tzIGxpa2UgdGhhdCB3b3VsZCBuZWVkIG1z
bV9vYmotPmZsYWdzIApvciBtc21fb2JqLT5zZ3QgdG8gY2hhbmdlIGR1cmluZyB0aGUgbGlmZXRp
bWUgb2YgdGhlIG9iamVjdCwgbmVpdGhlciBvZiAKd2hpY2ggc291bmRzIGxpa2UgYSB0aGluZyB0
aGF0IHNob3VsZCBsZWdpdGltYXRlbHkgaGFwcGVuLiBBcmUgeW91IHN1cmUgCnRoaXMgaXNuJ3Qg
YWxsIGp1c3QgaGlkaW5nIGEgc3VidGxlIGJ1ZyBlbHNld2hlcmU/IEFmdGVyIGFsbCwgaWYgd2hh
dCAKd2FzIGJlaW5nIHVubWFwcGVkIHdhc24ndCByaWdodCwgd2hvIHNheXMgdGhhdCB3aGF0J3Mg
bm93IGJlaW5nIHN5bmNlZCBpcz8KClJvYmluLgoKPiBJbiB0aGUgbWVhbiB0aW1lLCBpdCBpcyBh
IGJpdCB1Z2x5LCBidXQgSSBndWVzcyBzb21ldGhpbmcgbGlrZSB0aGlzIHNob3VsZCB3b3JrOgo+
IAo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
c20vbXNtX2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ2VtLmMKPiBpbmRleCA3MjYz
ZjQzNzNmMDcuLjVhNmE3OWZiYzlkNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNt
L21zbV9nZW0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dlbS5jCj4gQEAgLTUy
LDcgKzUyLDcgQEAgc3RhdGljIHZvaWQgc3luY19mb3JfZGV2aWNlKHN0cnVjdCBtc21fZ2VtX29i
amVjdCAqbXNtX29iaikKPiAgIHsKPiAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSBtc21fb2Jq
LT5iYXNlLmRldi0+ZGV2Owo+IAo+IC0gICAgaWYgKGdldF9kbWFfb3BzKGRldikpIHsKPiArICAg
IGlmIChnZXRfZG1hX29wcyhkZXYpICYmIElTX0VOQUJMRUQoQ09ORklHX0FSTTY0KSkgewo+ICAg
ICAgICAgICBkbWFfc3luY19zZ19mb3JfZGV2aWNlKGRldiwgbXNtX29iai0+c2d0LT5zZ2wsCj4g
ICAgICAgICAgICAgICBtc21fb2JqLT5zZ3QtPm5lbnRzLCBETUFfQklESVJFQ1RJT05BTCk7Cj4g
ICAgICAgfSBlbHNlIHsKPiBAQCAtNjUsNyArNjUsNyBAQCBzdGF0aWMgdm9pZCBzeW5jX2Zvcl9j
cHUoc3RydWN0IG1zbV9nZW1fb2JqZWN0ICptc21fb2JqKQo+ICAgewo+ICAgICAgIHN0cnVjdCBk
ZXZpY2UgKmRldiA9IG1zbV9vYmotPmJhc2UuZGV2LT5kZXY7Cj4gCj4gLSAgICBpZiAoZ2V0X2Rt
YV9vcHMoZGV2KSkgewo+ICsgICAgaWYgKGdldF9kbWFfb3BzKGRldikgJiYgSVNfRU5BQkxFRChD
T05GSUdfQVJNNjQpKSB7Cj4gICAgICAgICAgIGRtYV9zeW5jX3NnX2Zvcl9jcHUoZGV2LCBtc21f
b2JqLT5zZ3QtPnNnbCwKPiAgICAgICAgICAgICAgIG1zbV9vYmotPnNndC0+bmVudHMsIERNQV9C
SURJUkVDVElPTkFMKTsKPiAgICAgICB9IGVsc2Ugewo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tCj4g
Cj4gQlIsCj4gLVIKPiAKPj4gSWYgdGhpcyBpcyB0aGUgY2FzZSwgd2hhdCB3ZSBzaG91bGQgZG8g
YWJvdXQgdGhlIGkuTVg1IHJlZ3Jlc3Npb24gb24gNS4zPwo+Pgo+PiBXb3VsZCBhIHJldmVydCBv
ZiB0aGUgdHdvIGNvbW1pdHMgYmUgYWNjZXB0YWJsZSBpbiA1LjMgaW4gb3JkZXIgdG8KPj4gYXZv
aWQgdGhlIHJlZ3Jlc3Npb24/Cj4+Cj4+IFBsZWFzZSBhZHZpc2UuCj4+Cj4+IFRoYW5rcwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
