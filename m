Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 686695DE8B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 09:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B47E76E0E7;
	Wed,  3 Jul 2019 07:13:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6838D897FD
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 09:49:37 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p11so5807872wro.5
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2019 02:49:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=PGkXq69qYCLgbwn1wgmcaN01A5icF3KwzrbZOPqtKN0=;
 b=rTMSQ20UKR6xnDR4d8SBoZM33JgFwITnyfNQ1a+ocZ7bbYF+OZm8kBATDdLA/I4OhN
 JHRYWnHIR2eGcCy2VgtS/CETKv2Qgz+/Tpu15nE8/jKXXaCtF+aaonwQMNVwaGHuPWTE
 ycp6R5GlZSYRBpJbaxdDQCQsXyK6OeOz2g8qml3vI2wWwWgVyye7K310smndeNc/Q8Nw
 BwZUY2JcbJCWyEwNhlf2LtCgBAGDVQ352sCEfjEjHo3vfu4YTIzzvtdy5iRgfi/nvdLy
 Dkr56hPUStKrPlk+ZnOrHCTZ2nfZ0FcfMh1DLj2EKaLv7zC8isBkLc/jVUWPTYsZv8+d
 D9Xw==
X-Gm-Message-State: APjAAAWlgaE+0JVfx6D+2WvS4Z+HUd0GDCjB5c7cAgO51ApozHs9tGnW
 KyfNGYKrHZassglNSlTr1aA=
X-Google-Smtp-Source: APXvYqxYuowhg610jV6puq+GPtPbcd2cE3wZybIB18M0LBssaqVsWcjceuvNk8+Z4ze4NmEjMb4pUQ==
X-Received: by 2002:adf:e446:: with SMTP id t6mr23548092wrm.115.1562060976069; 
 Tue, 02 Jul 2019 02:49:36 -0700 (PDT)
Received: from Timur-XPS (catv-80-99-228-232.catv.broadband.hu.
 [80.99.228.232])
 by smtp.gmail.com with ESMTPSA id y133sm3003173wmg.5.2019.07.02.02.49.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 02:49:35 -0700 (PDT)
Message-ID: <f986d6687e2b1f1fc8a93f86cbc8fd1ab971663a.camel@gmail.com>
Subject: Re: Why is Thunderbolt 3 limited to 2.5 GT/s on Linux?
From: Timur =?ISO-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
To: Michel =?ISO-8859-1?Q?D=E4nzer?= <michel@daenzer.net>, Mika Westerberg
 <mika.westerberg@linux.intel.com>
Date: Tue, 02 Jul 2019 11:49:34 +0200
In-Reply-To: <792d0f36-b8ae-bef9-3b07-95677637ba00@daenzer.net>
References: <91de711591780e83c70e8f61747725855f6dee99.camel@gmail.com>
 <20190628103204.GJ2640@lahna.fi.intel.com>
 <f550f4a25a7ee7fecd80f7213c3be127ed0323e7.camel@gmail.com>
 <20190628113415.GL2640@lahna.fi.intel.com>
 <ecebae84c91fa31a1207c30c0fe4ed907642dbb9.camel@gmail.com>
 <c3b38b60-7c1a-730d-8de0-e3c880902003@daenzer.net>
 <627b7fff64edcba0f8d8b5ced79a351821c419c7.camel@gmail.com>
 <792d0f36-b8ae-bef9-3b07-95677637ba00@daenzer.net>
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 03 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=PGkXq69qYCLgbwn1wgmcaN01A5icF3KwzrbZOPqtKN0=;
 b=UCErXrgwP+AutauH6NzIv4xinZ1fwoNMf5RKwBXaZInTAgmBW0PKbGHI1/jsXJmh0M
 39vk6CLcNOPCTgJ+NUNAiRUgIpYJdLJ9SKcFAPZ2Zjwq+2fLPfsiXAvAB6wR9MQzA/Rs
 L3KsiOD7luzUyP/AwtGoaLKKgSXUBRrUKz3bpbJRQ/kII3yRJFkYdls/JwqFeSRwwVRi
 zUVAQbpBTsssfBEYi2xDyxyQWwhqpwEhZgVI9caSy4T/IzC1LteoLOTFW2Po4D5OhZdk
 qMcBigA27BAAr94g9v92h9UldTfQyzD5OTnokaqYGw3doeTh0fp2qr3iCaNEQ8jJCgHG
 76/Q==
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDE5LTA3LTAyIGF0IDEwOjA5ICswMjAwLCBNaWNoZWwgRMOkbnplciB3cm90ZToK
PiBPbiAyMDE5LTA3LTAxIDY6MDEgcC5tLiwgVGltdXIgS3Jpc3TDs2Ygd3JvdGU6Cj4gPiBPbiBN
b24sIDIwMTktMDctMDEgYXQgMTY6NTQgKzAyMDAsIE1pY2hlbCBEw6RuemVyIHdyb3RlOgo+ID4g
PiBPbiAyMDE5LTA2LTI4IDI6MjEgcC5tLiwgVGltdXIgS3Jpc3TDs2Ygd3JvdGU6Cj4gPiA+ID4g
SSBoYXZlbid0IGZvdW5kIGEgZ29vZCB3YXkgdG8gbWVhc3VyZSB0aGUgbWF4aW11bSBQQ0llCj4g
PiA+ID4gdGhyb3VnaHB1dAo+ID4gPiA+IGJldHdlZW4gdGhlIENQVSBhbmQgR1BVLAo+ID4gPiAK
PiA+ID4gYW1kZ3B1LmJlbmNobWFyaz0zCj4gPiA+IAo+ID4gPiBvbiB0aGUga2VybmVsIGNvbW1h
bmQgbGluZSB3aWxsIG1lYXN1cmUgdGhyb3VnaHB1dCBmb3IgdmFyaW91cwo+ID4gPiB0cmFuc2Zl
cgo+ID4gPiBzaXplcyBkdXJpbmcgZHJpdmVyIGluaXRpYWxpemF0aW9uLgo+ID4gCj4gPiBUaGFu
a3MsIEkgd2lsbCBkZWZpbml0ZWx5IHRyeSB0aGF0Lgo+ID4gSXMgdGhpcyB0aGUgb25seSB3YXkg
dG8gZG8gdGhpcywgb3IgaXMgdGhlcmUgYSB3YXkgdG8gYmVuY2htYXJrIGl0Cj4gPiBhZnRlciBp
dCBhbHJlYWR5IGJvb3RlZD8KPiAKPiBUaGUgZm9ybWVyLiBBdCBsZWFzdCBpbiB0aGVvcnksIGl0
J3MgcG9zc2libGUgdG8gdW5sb2FkIHRoZSBhbWRncHUKPiBtb2R1bGUgd2hpbGUgbm90aGluZyBp
cyB1c2luZyBpdCwgdGhlbiBsb2FkIGl0IGFnYWluLgoKT2theSwgc28gSSBib290ZWQgbXkgc3lz
dGVtIHdpdGggYW1kZ3B1LmJlbmNobWFyaz0zCllvdSBjYW4gZmluZCB0aGUgZnVsbCBkbWVzZyBs
b2cgaGVyZTogaHR0cHM6Ly9wYXN0ZWJpbi5jb20vek45RllHdzQKClRoZSByZXN1bHQgaXMgYmV0
d2VlbiAxLTUgR2JpdCAvIHNlYyBkZXBlbmRpbmcgb24gdGhlIHRyYW5zZmVyIHNpemUKKHRoZSBo
aWdoZXIgdGhlIGJldHRlciksIHdoaWNoIGNvcnJlc3BvbmRzIHRvIG5laXRoZXIgdGhlIDggR2Jp
dCAvIHNlYwp0aGF0IHRoZSBrZXJuZWwgdGhpbmtzIGl0IGlzIGxpbWl0ZWQgdG8sIG5vciB0aGUg
MjAgR2JpdCAvIHNlYyB3aGljaCBJCm1lYXN1cmVkIGVhcmxpZXIgd2l0aCBwY2llX2J3LiBTaW5j
ZSBwY2llX2J3IG9ubHkgc2hvd3MgdGhlIG1heGltdW0KUENJZSBwYWNrZXQgc2l6ZSAoYW5kIG5v
dCB0aGUgYWN0dWFsIHNpemUpLCBjb3VsZCBpdCBiZSB0aGF0IGl0J3Mgc28KaW5hY2N1cmF0ZSB0
aGF0IHRoZSAyMCBHYml0IC8gc2VjIGlzIGEgZmx1a2U/CgpTaWRlIG5vdGU6IGFmdGVyIGJvb3Rp
bmcgd2l0aCBhbWRncHUuYmVuY2htYXJrPTMgdGhlIGdyYXBoaWNhbCBzZXNzaW9uCndhcyB1c2Vs
ZXNzIGFuZCBzdHJhaWdodCBvdXQgaGFuZ2VkIHRoZSBzeXN0ZW0gYWZ0ZXIgSSBsb2dnZWQgaW4u
IFNvIEkKaGFkIHRvIHJlYm9vdCBpbnRvIHJ1bmxldmVsIDMgdG8gYmUgYWJsZSB0byBzYXZlIHRo
ZSBhYm92ZSBkbWVzZyBsb2cuCgo+IAo+ID4gPiA+IGJ1dCBJIGRpZCB0YWtlIGEgbG9vayBhdCBB
TUQncyBzeXNmcyBpbnRlcmZhY2UgYXQKPiA+ID4gPiAvc3lzL2NsYXNzL2RybS9jYXJkMS9kZXZp
Y2UvcGNpZV9idyB3aGljaCB3aGlsZSBydW5uaW5nIHRoZQo+ID4gPiA+IGJvdHRsZW5lY2tlZAo+
ID4gPiA+IGdhbWUuIFRoZSBoaWdoZXN0IHRocm91Z2hwdXQgSSBzYXcgdGhlcmUgd2FzIG9ubHkg
Mi40MyBHYml0Cj4gPiA+ID4gL3NlYy4KPiA+ID4gCj4gPiA+IFBDSWUgYmFuZHdpZHRoIGdlbmVy
YWxseSBpc24ndCBhIGJvdHRsZW5lY2sgZm9yIGdhbWVzLCBzaW5jZSB0aGV5Cj4gPiA+IGRvbid0
Cj4gPiA+IGNvbnN0YW50bHkgdHJhbnNmZXIgbGFyZ2UgZGF0YSB2b2x1bWVzIGFjcm9zcyBQQ0ll
LCBidXQgc3RvcmUKPiA+ID4gdGhlbSBpbgo+ID4gPiB0aGUgR1BVJ3MgbG9jYWwgVlJBTSwgd2hp
Y2ggaXMgY29ubmVjdGVkIGF0IG11Y2ggaGlnaGVyCj4gPiA+IGJhbmR3aWR0aC4KPiA+IAo+ID4g
VGhlcmUgYXJlIHJlYXNvbnMgd2h5IEkgdGhpbmsgdGhlIHByb2JsZW0gaXMgdGhlIGJhbmR3aWR0
aDoKPiA+IDEuIFRoZSBzYW1lIGlzc3VlcyBkb24ndCBoYXBwZW4gd2hlbiB0aGUgR1BVIGlzIG5v
dCB1c2VkIHdpdGggYSBUQjMKPiA+IGVuY2xvc3VyZS4KPiA+IDIuIEluIGNhc2Ugb2YgcmFkZW9u
c2ksIHRoZSBwcm9ibGVtIHdhcyBtaXRpZ2F0ZWQgb25jZSBNYXJlaydzIFNETUEKPiA+IHBhdGNo
IHdhcyBtZXJnZWQsIHdoaWNoIGh1Z2VseSByZWR1Y2VzIHRoZSBQQ0llIGJhbmR3aWR0aCB1c2Uu
Cj4gPiAzLiBJbiBsZXNzIG9wdGltaXplZCBjYXNlcyAoZm9yIGV4YW1wbGUgRDlWSyksIHRoZSBw
cm9ibGVtIGlzIHN0aWxsCj4gPiB2ZXJ5IG5vdGljYWJsZS4KPiAKPiBIb3dldmVyLCBzaW5jZSB5
b3Ugc2F3IGFzIG11Y2ggYXMgfjIwIEdiaXQvcyB1bmRlciBkaWZmZXJlbnQKPiBjaXJjdW1zdGFu
Y2VzLCB0aGUgMi40MyBHYml0L3MgdXNlZCBieSB0aGlzIGdhbWUgY2xlYXJseSBpc24ndCBhIGhh
cmQKPiBsaW1pdDsgdGhlcmUgbXVzdCBiZSBvdGhlciBsaW1pdGluZyBmYWN0b3JzLgoKVGhlcmUg
bWF5IGJlIG90aGVyIGZhY3RvcnMsIHllcy4gSSBjYW4ndCBvZmZlciBhIGdvb2QgZXhwbGFuYXRp
b24gb24Kd2hhdCBleGFjdGx5IGlzIGhhcHBlbmluZywgYnV0IGl0J3MgcHJldHR5IGNsZWFyIHRo
YXQgYW1kZ3B1IGNhbid0IHRha2UKZnVsbCBhZHZhbnRhZ2Ugb2YgdGhlIFRCMyBsaW5rLCBzbyBp
dCBzZWVtZWQgbGlrZSBhIGdvb2QgaWRlYSB0byBzdGFydAppbnZlc3RpZ2F0aW5nIHRoaXMgZmly
c3QuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
