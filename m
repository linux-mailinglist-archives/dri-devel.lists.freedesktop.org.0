Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0996AA9A1
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 19:04:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2AC889327;
	Thu,  5 Sep 2019 17:03:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E3F89327
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 17:03:56 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id t50so3405673edd.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2019 10:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HyIH4OO9X5Swa/dMPTyumsVOcUV/3JMtn3yrweBLv4w=;
 b=p/bfo/mhOHcg9IjwEhOeS37taDOjiPwO/2mybm9Src8Ih6wCn/lMq3PUHRoQRkeone
 VNRFLspSoqjzXZW9qIePGmxiVj3XvT2eHErinMhPQFU7RoFTshvVTAmjzi66wLEKU56t
 CkLtJ0gV7DUb2Y40lEmT5Eh3J8NMIL2k/pO+29MXtTxMIG7f87pnpDyLaLWpXhMYqjY9
 tMiYzz1w0kDLwf+nQAQC9/pmaIuogZWzxnL493c79bqBzlv0uZg0Y57um3LCk6oY1+zd
 bOUnk7WbArVx/YWgr52Alk8XGsA7tGZdf+Ob2nGJp2KRoQgXbLiEzmkNiIT/tkq3MEpi
 2LQg==
X-Gm-Message-State: APjAAAXag/1dKp1iVsaRo+DUt/QG1qkaSf6QUXA1+z5q+FyV5GEJbI/Y
 bGUCmL+jKkUfG60fgxDTdtLapfGOcNBjqZw58cA=
X-Google-Smtp-Source: APXvYqzvTLmoJ81OTJlytbq9vnitQec5n6DXtCSo6nBT0M/D4oBOaAhLfBiffUsn0VK1Aw+Qa33VQwmTpsDFRPxx2pU=
X-Received: by 2002:a50:935d:: with SMTP id n29mr5011822eda.294.1567703035025; 
 Thu, 05 Sep 2019 10:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5Cuk+t16bNFA+sm5=ZEdf+BNRtSpX27OCoQ==DbEyBtCw@mail.gmail.com>
 <ec11a377-fca3-ed12-2a05-abb3de936f8b@arm.com>
 <CAOMZO5BK0CJ8aA0CdBrYF75FRRHjqm0aOM4TpS9C+nHVuD8M_w@mail.gmail.com>
 <CAF6AEGtGXshOACrHYE7kkfvsBXRZ_ZF3xugJDOEFP9zr--vB5g@mail.gmail.com>
 <95ae3680-02c7-a1b8-5ea6-1a4d89293649@marek.ca>
 <CAOMZO5C7m6ZfFVXna18ZSZDgiggyTygK5VXZLxkx5Hg6Sy6G4w@mail.gmail.com>
 <CAF6AEGt5R34JBBY_X6kc5nSyGJexEy02ohijEtgoF=ff5o+-sQ@mail.gmail.com>
 <7029e8fa-301d-9c20-749f-13436bd5308f@arm.com>
In-Reply-To: <7029e8fa-301d-9c20-749f-13436bd5308f@arm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 5 Sep 2019 10:03:43 -0700
Message-ID: <CAF6AEGuR3ZT6Dgt+b_-7E=xCH0h_1KdburBs7F_+HboH7Edq6w@mail.gmail.com>
Subject: Re: Adreno crash on i.MX53 running 5.3-rc6
To: Robin Murphy <robin.murphy@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=HyIH4OO9X5Swa/dMPTyumsVOcUV/3JMtn3yrweBLv4w=;
 b=kn+7ycXt3CgPqg6+hy1cywOlLmF9WbYrZMy0kenACfUi123u7RYOVymAinM1AWawXD
 LtN4IHv/+CLteYBBp8QsfH7rwHtUedD7T2Td1pBoYUgfPjQWAzzGmehh4NdQ6G1nFS9c
 S8LpvS9bUoErcf2j6ru+PQNeFCeVoqDO1bO77ZOWjZ+qBHKugQAFHE80cJHThIBDc+KK
 LyJCdLaBUY21hxiE5HueX8eNv9psWZ1CncHhdRhrV/jdUkz0Ju3OkeCt0d6j5iDmiMDs
 F5tQi2r73u1t2Z5aJJYXYP+QmjftaWkP46E6cQN6C2g/W/JdVjGaE0OBYlDDZKs16Xy5
 iSrQ==
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

T24gV2VkLCBTZXAgNCwgMjAxOSBhdCAxMTowNiBBTSBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBo
eUBhcm0uY29tPiB3cm90ZToKPgo+IE9uIDA0LzA5LzIwMTkgMDE6MTIsIFJvYiBDbGFyayB3cm90
ZToKPiA+IE9uIFR1ZSwgU2VwIDMsIDIwMTkgYXQgMTI6MzEgUE0gRmFiaW8gRXN0ZXZhbSA8ZmVz
dGV2YW1AZ21haWwuY29tPiB3cm90ZToKPiA+Pgo+ID4+IEhpIEpvbmF0aGFuLAo+ID4+Cj4gPj4g
T24gVHVlLCBTZXAgMywgMjAxOSBhdCA0OjI1IFBNIEpvbmF0aGFuIE1hcmVrIDxqb25hdGhhbkBt
YXJlay5jYT4gd3JvdGU6Cj4gPj4+Cj4gPj4+IEhpLAo+ID4+Pgo+ID4+PiBJIHRyaWVkIHRoaXMg
YW5kIGl0IHdvcmtzIHdpdGggcGF0Y2hlcyA0KzUgZnJvbSBSb2IncyBzZXJpZXMgYW5kCj4gPj4+
IGNoYW5naW5nIGdwdW1tdSB0byB1c2Ugc2dfcGh5cyhzZykgaW5zdGVhZCBvZiBzZy0+ZG1hX2Fk
ZHJlc3MKPiA+Pj4gKGRtYV9hZGRyZXNzIGlzbid0IHNldCBub3cgdGhhdCBkbWFfbWFwX3NnIGlz
bid0IHVzZWQpLgo+ID4+Cj4gPj4gVGhhbmtzIGZvciB0ZXN0aW5nIGl0LiBJIGhhdmVuJ3QgaGFk
IGEgY2hhbmNlIHRvIHRlc3QgaXQgeWV0Lgo+ID4+Cj4gPj4gUm9iLAo+ID4+Cj4gPj4gSSBhc3N1
bWUgeW91ciBzZXJpZXMgaXMgdGFyZ2V0ZWQgdG8gNS40LCBjb3JyZWN0Pwo+ID4KPiA+IG1heWJl
LCBhbHRob3VnaCBDaHJpc3RvcGggSGVsbHdpZyBkaWRuJ3Qgc2VlbSBsaWtlIGEgYmlnIGZhbiBv
Zgo+ID4gZXhwb3NpbmcgY2FjaGUgb3BzLCBhbmQgd291bGQgcmF0aGVyIGFkZCBhIG5ldyBhbGxv
Y2F0aW9uIEFQSSBmb3IKPiA+IHVuY2FjaGVkIHBhZ2VzLi4gc28gSSdtIG5vdCBlbnRpcmVseSBz
dXJlIHdoYXQgdGhlIHdheSBmb3J3YXJkIHdpbGwKPiA+IGJlLgo+Cj4gVEJILCB0aGUgdXNlIG9m
IG1hcC91bm1hcCBsb29rZWQgcmVhc29uYWJsZSBpbiB0aGUgY29udGV4dCBvZgo+ICJzdGFydC9z
dG9wIHVzaW5nIHRoZXNlIHBhZ2VzIGZvciBzdHVmZiB3aGljaCBtYXkgaW5jbHVkZSBETUEiLCBz
byBldmVuCj4gaWYgaXQgd2FzIGNoZWVraWx5IGlnbm9yaW5nIHNnLT5kbWFfYWRkcmVzcyBJJ20g
bm90IHN1cmUgSSdkIHJlYWxseQo+IGNvbnNpZGVyIGl0ICJhYnVzZSIgLSBpbiBjb21wYXJpc29u
LCB1c2luZyBzeW5jIHdpdGhvdXQgYSBwcmlvciBtYXAKPiB1bnF1ZXN0aW9uYWJseSB2aW9sYXRl
cyB0aGUgQVBJLCBhbmQgbWVhbnMgdGhhdCBDT05GSUdfRE1BX0FQSV9ERUJVRwo+IHdpbGwgYmUg
cmVuZGVyZWQgdXNlbGVzcyB3aXRoIGZhbHNlIHBvc2l0aXZlcyBpZiB0aGlzIGRyaXZlciBpcyBh
Y3RpdmUKPiB3aGlsZSB0cnlpbmcgdG8gZGVidWcgc29tZXRoaW5nIGVsc2UuCj4KPiBUaGUgd2Fy
bmluZyByZWZlcmVuY2VkIGluIDAwMzZiYzczY2NiZSByZXByZXNlbnRzIHNvbWV0aGluZyBiZWlu
Zwo+IHVubWFwcGVkIHdoaWNoIGRpZG4ndCBtYXRjaCBhIGNvcnJlc3BvbmRpbmcgbWFwIC0gZnJv
bSB3aGF0IEkgY2FuIG1ha2UKPiBvZiBnZXRfcGFnZXMoKS9wdXRfcGFnZXMoKSBpdCBsb29rcyBs
aWtlIHRoYXQgd291bGQgbmVlZCBtc21fb2JqLT5mbGFncwo+IG9yIG1zbV9vYmotPnNndCB0byBj
aGFuZ2UgZHVyaW5nIHRoZSBsaWZldGltZSBvZiB0aGUgb2JqZWN0LCBuZWl0aGVyIG9mCj4gd2hp
Y2ggc291bmRzIGxpa2UgYSB0aGluZyB0aGF0IHNob3VsZCBsZWdpdGltYXRlbHkgaGFwcGVuLiBB
cmUgeW91IHN1cmUKPiB0aGlzIGlzbid0IGFsbCBqdXN0IGhpZGluZyBhIHN1YnRsZSBidWcgZWxz
ZXdoZXJlPyBBZnRlciBhbGwsIGlmIHdoYXQKPiB3YXMgYmVpbmcgdW5tYXBwZWQgd2Fzbid0IHJp
Z2h0LCB3aG8gc2F5cyB0aGF0IHdoYXQncyBub3cgYmVpbmcgc3luY2VkIGlzPwo+CgpDb3JyZWN0
LCBtc21fb2JqLT5mbGFncy9zZ3Qgc2hvdWxkIG5vdCBjaGFuZ2UuCgpJIHJldmVydGVkIHRoZSB2
YXJpb3VzIHBhdGNoZXMsIGFuZCB3ZW50IGJhY2sgdG8gdGhlIG9yaWdpbmFsIHNldHVwCnRoYXQg
dXNlZCBkbWFfe21hcCx1bm1hcH1fc2coKSB0byByZXByb2R1Y2UgdGhlIG9yaWdpbmFsIGlzc3Vl
IHRoYXQKcHJvbXB0ZWQgdGhlIGNoYW5nZSBpbiB0aGUgZmlyc3QgcGxhY2UuICBJdCBpcyBhIHBy
ZXR0eSBtYXNzaXZlIGZsb29kCm9mIHNwbGF0cywgd2hpY2ggcHJldHR5IHF1aWNrbHkgb3ZlcmZs
b3dlZCB0aGUgZG1lc2cgcmluZyBidWZmZXIsIHNvIEkKbWlnaHQgYmUgbWlzc2luZyBzb21lIHRo
aW5ncywgYnV0IEknbGwgcG9rZSBhcm91bmQgc29tZSBtb3JlLgoKVGhlIG9uZSB0aGluZyBJIHdv
bmRlciBhYm91dCwgd2hhdCB3b3VsZCBoYXBwZW4gaWYgdGhlIGJ1ZmZlciBpcwphbGxvY2F0ZWQg
YW5kIGRtYV9tYXBfc2coKSBjYWxsZWQgYmVmb3JlIGRybS9tc20gYXR0YWNoZXMgaXQncyBvd24K
aW9tbXVfZG9tYWlucywgYW5kIHRoZW4gZG1hX3VubWFwX3NnKCkgYWZ0ZXJ3YXJkcy4gIFdlIGFy
ZW4ndCBhY3R1YWxseQpldmVyIHVzaW5nIHRoZSBpb21tdSBkb21haW4gdGhhdCBETUEgQVBJIGlz
IGNyZWF0aW5nIGZvciB0aGUgZGV2aWNlLApzbyBhbGwgdGhlIGV4dHJhIGlvbW11X21hcC91bm1h
cCAoYW5kIHRsYiBmbHVzaCkgaXMgYXQgYmVzdAp1bm5lY2Vzc2FyeS4gIEJ1dCBJJ20gbm90IHN1
cmUgaWYgaXQgY291bGQgYmUgaGF2aW5nIHNvbWUgdW5pbnRlbmRlZApzaWRlIGVmZmVjdHMgdGhh
dCBjYXVzZSB0aGlzIHNvcnQgb2YgcHJvYmxlbS4KCkJSLAotUgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
