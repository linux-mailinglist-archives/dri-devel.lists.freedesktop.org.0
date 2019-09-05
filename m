Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED97AABB5
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 21:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E82A089EB1;
	Thu,  5 Sep 2019 19:05:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9237F89EB1
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 19:05:44 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id c19so3714680edy.10
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2019 12:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eEgrZFalnY6kXF/J1ItbceFHJaJ+3XHkHHSjT/ls0pg=;
 b=Si23RR2vUSmahXBALQX+Slst6ElRog88DGuFDoaqQcIHbpSVOeWQs6QGoqwKPQVFjb
 zvN22JbsnJdiq1h/Yy3iJCxX2eNBEuxqs961X7nVDswhT0EAxuHYKAw/2i2ERzHT1Fc1
 jzR61fH8oe6D+R1QeI2hwZxu44dXj9oM5bfoBtnttC55hgBi1wQsqEIdQEPHfspBLUTj
 fs8uCXEnQXbOBqRlTIAf+YB3FxSmasNTVKY3jEaDF/S6vFyNspfzBtImq8mCYd5ZfMyQ
 93fVjEx3OlAiTuW8Y6yRPHF0O65DZiUGFTK96ize1H0f78Pgr9+GNk91qgnJgAUnGuIK
 536w==
X-Gm-Message-State: APjAAAUlhUJHQ6WNfnX3iVoaxdHg7DPCSweBawcmje9RusBYIeQUavQI
 8nlW7cIc8vAPcA6DMi2/SCMP3+/z0etEaWNdNuE=
X-Google-Smtp-Source: APXvYqw5cXnETP5CD7rjHwLEyPs63OFqQHO/rdaobfut5frUu+MTi/WFraoCBSlU2FdSo9dO+1SoOA0LcOeNrE2TcVo=
X-Received: by 2002:a50:e885:: with SMTP id f5mr5407340edn.163.1567710343101; 
 Thu, 05 Sep 2019 12:05:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5Cuk+t16bNFA+sm5=ZEdf+BNRtSpX27OCoQ==DbEyBtCw@mail.gmail.com>
 <ec11a377-fca3-ed12-2a05-abb3de936f8b@arm.com>
 <CAOMZO5BK0CJ8aA0CdBrYF75FRRHjqm0aOM4TpS9C+nHVuD8M_w@mail.gmail.com>
 <CAF6AEGtGXshOACrHYE7kkfvsBXRZ_ZF3xugJDOEFP9zr--vB5g@mail.gmail.com>
 <95ae3680-02c7-a1b8-5ea6-1a4d89293649@marek.ca>
 <CAOMZO5C7m6ZfFVXna18ZSZDgiggyTygK5VXZLxkx5Hg6Sy6G4w@mail.gmail.com>
 <CAF6AEGt5R34JBBY_X6kc5nSyGJexEy02ohijEtgoF=ff5o+-sQ@mail.gmail.com>
 <7029e8fa-301d-9c20-749f-13436bd5308f@arm.com>
 <CAF6AEGuR3ZT6Dgt+b_-7E=xCH0h_1KdburBs7F_+HboH7Edq6w@mail.gmail.com>
In-Reply-To: <CAF6AEGuR3ZT6Dgt+b_-7E=xCH0h_1KdburBs7F_+HboH7Edq6w@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 5 Sep 2019 12:05:31 -0700
Message-ID: <CAF6AEGtwWELFzizL-=Lk9LsqwN_GMpfTizGP0uq+wQZnmgukOg@mail.gmail.com>
Subject: Re: Adreno crash on i.MX53 running 5.3-rc6
To: Robin Murphy <robin.murphy@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=eEgrZFalnY6kXF/J1ItbceFHJaJ+3XHkHHSjT/ls0pg=;
 b=gU0R48rjN2AXw2TF/mrjJaIImsbbColyda1g8SfPvX0rdfpJa/OfgdzwkjLrpnwlDW
 9mmP6++tuglgX5KeayjuAHCqnKVXkzfFSeF5B7skFlD6cQjn0eyo3WOc12AQ5EutfXw4
 F5wvhhypjG4RA+pYACKyqO78wBzwFtQ5kEavqFsDaZAthdZHrdV0qSMeKtW+KIrXtlwW
 2nMkZnE0wCPdSht6T99+DsJH11DRIOM0enKPUTEXfQz9FF5f7Brx9Z2QH4c1w2Vmmz/K
 x0htx8LgUx2hc0ZFL+Rj/uaQq/pWU/Lkj0Q3lmylG9vr4CNWFozd0T4wPZbc67HgGlxo
 MZ5g==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgNSwgMjAxOSBhdCAxMDowMyBBTSBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBTZXAgNCwgMjAxOSBhdCAxMTowNiBBTSBSb2JpbiBN
dXJwaHkgPHJvYmluLm11cnBoeUBhcm0uY29tPiB3cm90ZToKPiA+Cj4gPiBPbiAwNC8wOS8yMDE5
IDAxOjEyLCBSb2IgQ2xhcmsgd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgU2VwIDMsIDIwMTkgYXQgMTI6
MzEgUE0gRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPiB3cm90ZToKPiA+ID4+Cj4g
PiA+PiBIaSBKb25hdGhhbiwKPiA+ID4+Cj4gPiA+PiBPbiBUdWUsIFNlcCAzLCAyMDE5IGF0IDQ6
MjUgUE0gSm9uYXRoYW4gTWFyZWsgPGpvbmF0aGFuQG1hcmVrLmNhPiB3cm90ZToKPiA+ID4+Pgo+
ID4gPj4+IEhpLAo+ID4gPj4+Cj4gPiA+Pj4gSSB0cmllZCB0aGlzIGFuZCBpdCB3b3JrcyB3aXRo
IHBhdGNoZXMgNCs1IGZyb20gUm9iJ3Mgc2VyaWVzIGFuZAo+ID4gPj4+IGNoYW5naW5nIGdwdW1t
dSB0byB1c2Ugc2dfcGh5cyhzZykgaW5zdGVhZCBvZiBzZy0+ZG1hX2FkZHJlc3MKPiA+ID4+PiAo
ZG1hX2FkZHJlc3MgaXNuJ3Qgc2V0IG5vdyB0aGF0IGRtYV9tYXBfc2cgaXNuJ3QgdXNlZCkuCj4g
PiA+Pgo+ID4gPj4gVGhhbmtzIGZvciB0ZXN0aW5nIGl0LiBJIGhhdmVuJ3QgaGFkIGEgY2hhbmNl
IHRvIHRlc3QgaXQgeWV0Lgo+ID4gPj4KPiA+ID4+IFJvYiwKPiA+ID4+Cj4gPiA+PiBJIGFzc3Vt
ZSB5b3VyIHNlcmllcyBpcyB0YXJnZXRlZCB0byA1LjQsIGNvcnJlY3Q/Cj4gPiA+Cj4gPiA+IG1h
eWJlLCBhbHRob3VnaCBDaHJpc3RvcGggSGVsbHdpZyBkaWRuJ3Qgc2VlbSBsaWtlIGEgYmlnIGZh
biBvZgo+ID4gPiBleHBvc2luZyBjYWNoZSBvcHMsIGFuZCB3b3VsZCByYXRoZXIgYWRkIGEgbmV3
IGFsbG9jYXRpb24gQVBJIGZvcgo+ID4gPiB1bmNhY2hlZCBwYWdlcy4uIHNvIEknbSBub3QgZW50
aXJlbHkgc3VyZSB3aGF0IHRoZSB3YXkgZm9yd2FyZCB3aWxsCj4gPiA+IGJlLgo+ID4KPiA+IFRC
SCwgdGhlIHVzZSBvZiBtYXAvdW5tYXAgbG9va2VkIHJlYXNvbmFibGUgaW4gdGhlIGNvbnRleHQg
b2YKPiA+ICJzdGFydC9zdG9wIHVzaW5nIHRoZXNlIHBhZ2VzIGZvciBzdHVmZiB3aGljaCBtYXkg
aW5jbHVkZSBETUEiLCBzbyBldmVuCj4gPiBpZiBpdCB3YXMgY2hlZWtpbHkgaWdub3Jpbmcgc2ct
PmRtYV9hZGRyZXNzIEknbSBub3Qgc3VyZSBJJ2QgcmVhbGx5Cj4gPiBjb25zaWRlciBpdCAiYWJ1
c2UiIC0gaW4gY29tcGFyaXNvbiwgdXNpbmcgc3luYyB3aXRob3V0IGEgcHJpb3IgbWFwCj4gPiB1
bnF1ZXN0aW9uYWJseSB2aW9sYXRlcyB0aGUgQVBJLCBhbmQgbWVhbnMgdGhhdCBDT05GSUdfRE1B
X0FQSV9ERUJVRwo+ID4gd2lsbCBiZSByZW5kZXJlZCB1c2VsZXNzIHdpdGggZmFsc2UgcG9zaXRp
dmVzIGlmIHRoaXMgZHJpdmVyIGlzIGFjdGl2ZQo+ID4gd2hpbGUgdHJ5aW5nIHRvIGRlYnVnIHNv
bWV0aGluZyBlbHNlLgo+ID4KPiA+IFRoZSB3YXJuaW5nIHJlZmVyZW5jZWQgaW4gMDAzNmJjNzNj
Y2JlIHJlcHJlc2VudHMgc29tZXRoaW5nIGJlaW5nCj4gPiB1bm1hcHBlZCB3aGljaCBkaWRuJ3Qg
bWF0Y2ggYSBjb3JyZXNwb25kaW5nIG1hcCAtIGZyb20gd2hhdCBJIGNhbiBtYWtlCj4gPiBvZiBn
ZXRfcGFnZXMoKS9wdXRfcGFnZXMoKSBpdCBsb29rcyBsaWtlIHRoYXQgd291bGQgbmVlZCBtc21f
b2JqLT5mbGFncwo+ID4gb3IgbXNtX29iai0+c2d0IHRvIGNoYW5nZSBkdXJpbmcgdGhlIGxpZmV0
aW1lIG9mIHRoZSBvYmplY3QsIG5laXRoZXIgb2YKPiA+IHdoaWNoIHNvdW5kcyBsaWtlIGEgdGhp
bmcgdGhhdCBzaG91bGQgbGVnaXRpbWF0ZWx5IGhhcHBlbi4gQXJlIHlvdSBzdXJlCj4gPiB0aGlz
IGlzbid0IGFsbCBqdXN0IGhpZGluZyBhIHN1YnRsZSBidWcgZWxzZXdoZXJlPyBBZnRlciBhbGws
IGlmIHdoYXQKPiA+IHdhcyBiZWluZyB1bm1hcHBlZCB3YXNuJ3QgcmlnaHQsIHdobyBzYXlzIHRo
YXQgd2hhdCdzIG5vdyBiZWluZyBzeW5jZWQgaXM/Cj4gPgo+Cj4gQ29ycmVjdCwgbXNtX29iai0+
ZmxhZ3Mvc2d0IHNob3VsZCBub3QgY2hhbmdlLgo+Cj4gSSByZXZlcnRlZCB0aGUgdmFyaW91cyBw
YXRjaGVzLCBhbmQgd2VudCBiYWNrIHRvIHRoZSBvcmlnaW5hbCBzZXR1cAo+IHRoYXQgdXNlZCBk
bWFfe21hcCx1bm1hcH1fc2coKSB0byByZXByb2R1Y2UgdGhlIG9yaWdpbmFsIGlzc3VlIHRoYXQK
PiBwcm9tcHRlZCB0aGUgY2hhbmdlIGluIHRoZSBmaXJzdCBwbGFjZS4gIEl0IGlzIGEgcHJldHR5
IG1hc3NpdmUgZmxvb2QKPiBvZiBzcGxhdHMsIHdoaWNoIHByZXR0eSBxdWlja2x5IG92ZXJmbG93
ZWQgdGhlIGRtZXNnIHJpbmcgYnVmZmVyLCBzbyBJCj4gbWlnaHQgYmUgbWlzc2luZyBzb21lIHRo
aW5ncywgYnV0IEknbGwgcG9rZSBhcm91bmQgc29tZSBtb3JlLgo+Cj4gVGhlIG9uZSB0aGluZyBJ
IHdvbmRlciBhYm91dCwgd2hhdCB3b3VsZCBoYXBwZW4gaWYgdGhlIGJ1ZmZlciBpcwo+IGFsbG9j
YXRlZCBhbmQgZG1hX21hcF9zZygpIGNhbGxlZCBiZWZvcmUgZHJtL21zbSBhdHRhY2hlcyBpdCdz
IG93bgo+IGlvbW11X2RvbWFpbnMsIGFuZCB0aGVuIGRtYV91bm1hcF9zZygpIGFmdGVyd2FyZHMu
ICBXZSBhcmVuJ3QgYWN0dWFsbHkKPiBldmVyIHVzaW5nIHRoZSBpb21tdSBkb21haW4gdGhhdCBE
TUEgQVBJIGlzIGNyZWF0aW5nIGZvciB0aGUgZGV2aWNlLAo+IHNvIGFsbCB0aGUgZXh0cmEgaW9t
bXVfbWFwL3VubWFwIChhbmQgdGxiIGZsdXNoKSBpcyBhdCBiZXN0Cj4gdW5uZWNlc3NhcnkuICBC
dXQgSSdtIG5vdCBzdXJlIGlmIGl0IGNvdWxkIGJlIGhhdmluZyBzb21lIHVuaW50ZW5kZWQKPiBz
aWRlIGVmZmVjdHMgdGhhdCBjYXVzZSB0aGlzIHNvcnQgb2YgcHJvYmxlbS4KPgoKaXQgc2VlbXMg
bGlrZSBldmVyeSB0aW1lIChvciBhdCBsZWFzdCBldmVyeSB0aW1lIHdlIHNwbGF0KSwgd2UgZW5k
IHVwCncvIGlvdmE9ZmZmZmZmZmZmZmZmZjAwMCAuLiB3aGljaCBkb2Vzbid0IHNvdW5kIGxpa2Vs
eSB0byBiZSByaWdodC4KQWx0aG91Z2ggZnJvbSBqdXN0IGxvb2tpbmcgYXQgdGhlIGRtYS1pb21t
dS5jIGNvZGUsIEknbSBub3Qgc3VyZSBob3cKdGhpcyBoYXBwZW5zLiAgQW5kIGFkZGluZyBzb21l
IHByaW50aydzIHJlc3VsdHMgaW4gZW5vdWdoIHRyYWNlcyB0aGF0CkkgY2FuJ3QgYm9vdCBmb3Ig
c29tZSByZWFzb24uLgoKQlIsCi1SCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
