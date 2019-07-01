Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 369885BE47
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 16:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C0989C05;
	Mon,  1 Jul 2019 14:28:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D072A89C05
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 14:28:25 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id p11so2915885wro.5
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2019 07:28:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=v2x2eTbBFAgXSgk8odO1q2PzmDkeNTWJHHyw5STfXso=;
 b=ghuT+4oGdwPCHdwZpT6Wy8QURSFO/F74GM5ZAemrBval3HDBscL7EBlXzDtildJ8Wf
 HnVFoOqNGMfF9WwTAaCx9nwT0WKSRukrck2zzSqDvtAU9RX0B1kHfXUOu1OANXWqZjAF
 C77/YwAyEKRRg+ytd7pl/s1YIZUEg0Z/+cGKZ8VviJEKzbcXPij+D5pDzakV8dhRovZr
 Hi260+L6avYtGeAARmo2G5NZY2LCE5Rrm0MQHw+FXAsTc+yzCukVs8gHTCraPWBWHO4R
 U6l/Qa1/VpEWN2+uUHKJYY0MsAqQBUJjSfbf674YqufodjGo8EMQ/BJY1I+e6OvlebmM
 u1Iw==
X-Gm-Message-State: APjAAAU9cHBZfNXOm4HKLl/BsJDjOZKuWKU57qihlNiQWftVkzXShxBX
 pubEjdb6pE6cV7DNaQWtwmaqMFQ+JvaHM3ExwG4=
X-Google-Smtp-Source: APXvYqwnmiO4E1G16KVFldab3T5TaIqf9OVUQgi3VFCYxxytDL9vB+MxKjYF30lcUc/o0Lqn4b/rX1NO9jtsagoG6a0=
X-Received: by 2002:a5d:6b11:: with SMTP id v17mr5613854wrw.323.1561991304398; 
 Mon, 01 Jul 2019 07:28:24 -0700 (PDT)
MIME-Version: 1.0
References: <91de711591780e83c70e8f61747725855f6dee99.camel@gmail.com>
 <20190628103204.GJ2640@lahna.fi.intel.com>
 <f550f4a25a7ee7fecd80f7213c3be127ed0323e7.camel@gmail.com>
 <20190628113415.GL2640@lahna.fi.intel.com>
 <ecebae84c91fa31a1207c30c0fe4ed907642dbb9.camel@gmail.com>
In-Reply-To: <ecebae84c91fa31a1207c30c0fe4ed907642dbb9.camel@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 1 Jul 2019 10:28:12 -0400
Message-ID: <CADnq5_NSCqbPkfA-7Z-tjBP8ffiw0ZvEdDxRXpZ-LioNApr8Hw@mail.gmail.com>
Subject: Re: Why is Thunderbolt 3 limited to 2.5 GT/s on Linux?
To: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=v2x2eTbBFAgXSgk8odO1q2PzmDkeNTWJHHyw5STfXso=;
 b=C0GD736aXEgEqTaqBVWX6n4RrJxSvLiZnOfuGvsSmTQW6mwfJidQGNJaeGW1UJfD1+
 +3ZXquS1PW+t02N4RoRf2O94JSGe21134hAyNuQKOqJhOkw3hT4vj/7ViycIf358C4Ac
 Ox2moZLeiuL2IIQSFdT+6QNBUzQWB15jC5PQFoafw/4WsuCzjU01CcN7SFSd3HqhjVGu
 qCEQwJwWGwBytPfOWkDrNV4t/SVRape/iBF9Ai/vyxZ4bUB/9P305r1xsTQOQiVc32Jb
 qMm+/xsHTYH32yi575H5O+9UsnclGc//vBZmN95Oja1TUSRIkKDDgAA1wvrQkRjG+ld6
 ol9Q==
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
Cc: "michael.jamet@intel.com" <michael.jamet@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKdW4gMzAsIDIwMTkgYXQgMjoyNyBQTSBUaW11ciBLcmlzdMOzZiA8dGltdXIua3Jp
c3RvZkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4KPiA+ID4gU3VyZSwgdGhvdWdoIGluIHRoaXMgY2Fz
ZSAzIG9mIHRob3NlIGRvd25zdHJlYW0gcG9ydHMgYXJlIG5vdAo+ID4gPiBleHBvc2VkCj4gPiA+
IGJ5IHRoZSBoYXJkd2FyZSwgc28gaXQncyBhIGJpdCBzdXJwcmlzaW5nIHRvIHNlZSB0aGVtIHRo
ZXJlLgo+ID4KPiA+IFRoZXkgbGVhZCB0byBvdGhlciBwZXJpcGhlcmFscyBvbiB0aGUgVEJUIGhv
c3Qgcm91dGVyIHN1Y2ggYXMgdGhlIFRCVAo+ID4gY29udHJvbGxlciBhbmQgeEhDSS4gQWxzbyB0
aGVyZSBhcmUgdHdvIGRvd25zdHJlYW0gcG9ydHMgZm9yCj4gPiBleHRlbnNpb24KPiA+IGZyb20g
d2hpY2ggeW91IGVHUFUgaXMgdXNpbmcgb25lLgo+Cj4gSWYgeW91IGxvb2sgYXQgdGhlIGRldmlj
ZSB0cmVlIGZyb20gbXkgZmlyc3QgZW1haWwsIHlvdSBjYW4gc2VlIHRoYXQKPiBib3RoIHRoZSBH
UFUgYW5kIHRoZSBYSENJIHVzZXMgdGhlIHNhbWUgcG9ydDogMDQ6MDQuMCAtIGluIGZhY3QgSSBj
YW4KPiBldmVuIHJlbW92ZSB0aGUgb3RoZXIgMyBwb3J0cyBmcm9tIHRoZSBzeXN0ZW0gd2l0aG91
dCBhbnkgY29uc2VxdWVuY2VzLgo+Cj4gPiA+IExpa2UgSSBzYWlkIHRoZSBkZXZpY2UgcmVhbGx5
IGlzIGxpbWl0ZWQgdG8gMi41IEdUL3MgZXZlbiB0aG91Z2ggaXQKPiA+ID4gc2hvdWxkIGJlIGFi
bGUgdG8gZG8gOCBHVC9zLgo+ID4KPiA+IFRoZXJlIGlzIFRodW5kZXJib2x0IGxpbmsgYmV0d2Vl
biB0aGUgaG9zdCByb3V0ZXIgKHlvdXIgaG9zdCBzeXN0ZW0pCj4gPiBhbmQKPiA+IHRoZSBlR1BV
IGJveC4gVGhhdCBsaW5rIGlzIG5vdCBsaW1pdGVkIHRvIDIuNSBHVC9zIHNvIGV2ZW4gaWYgdGhl
Cj4gPiBzbG90Cj4gPiBjbGFpbXMgaXQgaXMgUENJIGdlbjEgdGhlIGFjdHVhbCBiYW5kd2lkdGgg
Y2FuIGJlIG11Y2ggaGlnaGVyIGJlY2F1c2UKPiA+IG9mCj4gPiB0aGUgdmlydHVhbCBsaW5rLgo+
Cj4gTm90IHN1cmUgSSB1bmRlcnN0YW5kIGNvcnJlY3RseSwgYXJlIHlvdSBzYXlpbmcgdGhhdCBU
QjMgY2FuIGRvIDQwCj4gR2JpdC9zZWMgZXZlbiB0aG91Z2ggdGhlIGtlcm5lbCB0aGlua3MgaXQg
Y2FuIG9ubHkgZG8gOCBHYml0IC8gc2VjPwo+Cj4gSSBoYXZlbid0IGZvdW5kIGEgZ29vZCB3YXkg
dG8gbWVhc3VyZSB0aGUgbWF4aW11bSBQQ0llIHRocm91Z2hwdXQKPiBiZXR3ZWVuIHRoZSBDUFUg
YW5kIEdQVSwgYnV0IEkgZGlkIHRha2UgYSBsb29rIGF0IEFNRCdzIHN5c2ZzIGludGVyZmFjZQo+
IGF0IC9zeXMvY2xhc3MvZHJtL2NhcmQxL2RldmljZS9wY2llX2J3IHdoaWNoIHdoaWxlIHJ1bm5p
bmcgdGhlCj4gYm90dGxlbmVja2VkIGdhbWUuIFRoZSBoaWdoZXN0IHRocm91Z2hwdXQgSSBzYXcg
dGhlcmUgd2FzIG9ubHkgMi40Mwo+IEdiaXQgL3NlYy4KPgo+IE9uZSBtb3JlIHRob3VnaHQuIEkn
dmUgYWxzbyBsb29rZWQgYXQKPiAvc3lzL2NsYXNzL2RybS9jYXJkMS9kZXZpY2UvcHBfZHBtX3Bj
aWUgLSB3aGljaCB0ZWxscyBtZSB0aGF0IGFtZGdwdQo+IHRoaW5rcyBpdCBpcyBydW5uaW5nIG9u
IGEgMi41R1QvcyB4OCBsaW5rIChhcyBvcHBvc2VkIHRvIHRoZSBleHBlY3RlZCA4Cj4gR1QvcyB4
NCkuIENhbiB0aGlzIGJlIGEgcHJvYmxlbT8KCldlIGxpbWl0IHRoZSBzcGVlZCBvZiB0aGUgbGlu
ayB0aGUgdGhlIGRyaXZlciB0byB0aGUgbWF4IHNwZWVkIG9mIGFueQp1cHN0cmVhbSBsaW5rcy4g
IFNvIGlmIHRoZXJlIGFyZSBhbnkgbGlua3MgdXBzdHJlYW0gbGltaXRlZCB0byAyLjUKR1Qvcywg
aXQgZG9lc24ndCBtYWtlIHNlbnNlIHRvIGNsb2NrIHRoZSBsb2NhbCBsaW5rIHVwIHRvIGZhc3Rl
cgpzcGVlZHMuCgpBbGV4Cgo+Cj4gPgo+ID4gPiA+ID4gMy4gSXMgaXQgcG9zc2libGUgdG8gbWFu
dWFsbHkgc2V0IHRoZW0gdG8gOCBHVC9zPwo+ID4gPiA+Cj4gPiA+ID4gTm8gaWRlYS4KPiA+ID4g
Pgo+ID4gPiA+IEFyZSB5b3UgYWN0dWFsbHkgc2VlaW5nIHNvbWUgcGVyZm9ybWFuY2UgaXNzdWUg
YmVjYXVzZSBvZiB0aGlzIG9yCj4gPiA+ID4gYXJlCj4gPiA+ID4geW91IGp1c3QgY3VyaW91cz8K
PiA+ID4KPiA+ID4gWWVzLCBJIHNlZSBhIG5vdGljYWJsZSBwZXJmb3JtYW5jZSBoaXQ6IHNvbWUg
Z2FtZXMgaGF2ZSB2ZXJ5IGxvdwo+ID4gPiBmcmFtZQo+ID4gPiByYXRlIHdoaWxlIG5laXRoZXIg
dGhlIENQVSBub3IgdGhlIEdQVSBhcmUgZnVsbHkgdXRpbGl6ZWQuCj4gPgo+ID4gSXMgdGhhdCBw
cm9ibGVtIGluIExpbnV4IG9ubHkgb3IgZG8geW91IHNlZSB0aGUgc2FtZSBpc3N1ZSBpbiBXaW5k
b3dzCj4gPiBhcwo+ID4gd2VsbD8KPgo+Cj4gSSBhZG1pdCBJIGRvbid0IGhhdmUgV2luZG93cyBv
biB0aGlzIGNvbXB1dGVyIG5vdyBhbmQgaXQgaGFzIGJlZW4gc29tZQo+IHRpbWUgc2luY2UgSSBs
YXN0IHRyaWVkIGl0LCBidXQgd2hlbiBJIGRpZCwgSSBkaWRuJ3Qgc2VlIHRoaXMgcHJvYmxlbS4K
Pgo+IEJlc3QgcmVnYXJkcywKPiBUaW0KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
