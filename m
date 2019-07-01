Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0685BE99
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 16:46:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE218968D;
	Mon,  1 Jul 2019 14:46:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F18C8968D
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 14:46:48 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id f9so14149888wre.12
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2019 07:46:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TuL26ob94WIi3E29VO9un8XE6dSHc+RmO3Y3/zyuTII=;
 b=PntoM8dUKXQ048mzI5pkY0m77ckZ4nbRkNbDOSBWIfcUi5/LQLMoDz1yU6/pPTbn3r
 OYYvm/Y3ztKSMEXNEuxw7pkemqhu0vHArgWvAnV7KMeFyKQd1By9VDfElWXPRiLBXdvS
 mIjAP1AqTGaAAs8O/H9l0OOs3mgD7yuyjgB6g0boD7wgMk9rd3QVGvk2F0LI06r1ib4k
 pAD0Y61Mb/Hn3Dw84cegI7YUFLWe7I6vwf1odG9uqPkWTKQ5bCHXlfARgd+8OYOL4AHu
 pW214klxxyWRh5rxdu8qbJB/6LVbMIfJ4SxoEgb/xz6b6pQgd3E4beL4wDqqm8OBxzdw
 lyEg==
X-Gm-Message-State: APjAAAWgzV1DD2JofgPiVi+8F9j2ThLcTOPgZHt8abkqR+9Wyhia7opw
 OzSD0nLrkXL85yvp/Va+SqGyZC1Jc8oVnnMEj44=
X-Google-Smtp-Source: APXvYqw4aTyHGA6aB1DUekUjc3C/Je+xZ9gXe+NWzJmYsauwwE/OO95z99aOqmB7eo8PGQgtnz6rG+WEO3S9WJ6i5/U=
X-Received: by 2002:adf:dec3:: with SMTP id i3mr8027211wrn.74.1561992406937;
 Mon, 01 Jul 2019 07:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <91de711591780e83c70e8f61747725855f6dee99.camel@gmail.com>
 <20190628103204.GJ2640@lahna.fi.intel.com>
 <f550f4a25a7ee7fecd80f7213c3be127ed0323e7.camel@gmail.com>
 <20190628113415.GL2640@lahna.fi.intel.com>
 <ecebae84c91fa31a1207c30c0fe4ed907642dbb9.camel@gmail.com>
 <CADnq5_NSCqbPkfA-7Z-tjBP8ffiw0ZvEdDxRXpZ-LioNApr8Hw@mail.gmail.com>
 <0bfd8ba5abb9288fe1f1ee1d9d7265885b8c8c94.camel@gmail.com>
In-Reply-To: <0bfd8ba5abb9288fe1f1ee1d9d7265885b8c8c94.camel@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 1 Jul 2019 10:46:34 -0400
Message-ID: <CADnq5_NKB1F61kJ_VJEXHPPVO1o_tkuUmOuoFdw3xpmNnGG97A@mail.gmail.com>
Subject: Re: Why is Thunderbolt 3 limited to 2.5 GT/s on Linux?
To: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TuL26ob94WIi3E29VO9un8XE6dSHc+RmO3Y3/zyuTII=;
 b=UYKxjj7R51xl9AHO6aSlhi1KeBSPddlPqdFGcXhH9cR3QO8JcIwscTEbS4rNAkEoMh
 77fDcolKBEMIFimGir8OGtGD9bmgZnLM67cgqvRPKHKA2hix+bTryBlNLSVe6Kl5BeqK
 oA7tqN540hkQ88htd0NCpdjNRi7uzXqbHVHWI4EXa/MIejvmCH+QHJOzQG336U6pj98f
 Nam4fCDMkL+9kh8/N0NofslgsGpQRiLaXAKeOoEtu82E29Wgv4xjebbtqmr8d5jBeORz
 jgcyYTWiMjGEH+4PPCz/WdWePQ3+6W5kFRlb5NJFIXUn/JquWIqBK323xNPLLwUE6obL
 cnIw==
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

T24gTW9uLCBKdWwgMSwgMjAxOSBhdCAxMDozOCBBTSBUaW11ciBLcmlzdMOzZiA8dGltdXIua3Jp
c3RvZkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiA+ID4gPiBMaWtlIEkgc2FpZCB0aGUgZGV2aWNl
IHJlYWxseSBpcyBsaW1pdGVkIHRvIDIuNSBHVC9zIGV2ZW4KPiA+ID4gPiA+IHRob3VnaCBpdAo+
ID4gPiA+ID4gc2hvdWxkIGJlIGFibGUgdG8gZG8gOCBHVC9zLgo+ID4gPiA+Cj4gPiA+ID4gVGhl
cmUgaXMgVGh1bmRlcmJvbHQgbGluayBiZXR3ZWVuIHRoZSBob3N0IHJvdXRlciAoeW91ciBob3N0
Cj4gPiA+ID4gc3lzdGVtKQo+ID4gPiA+IGFuZAo+ID4gPiA+IHRoZSBlR1BVIGJveC4gVGhhdCBs
aW5rIGlzIG5vdCBsaW1pdGVkIHRvIDIuNSBHVC9zIHNvIGV2ZW4gaWYgdGhlCj4gPiA+ID4gc2xv
dAo+ID4gPiA+IGNsYWltcyBpdCBpcyBQQ0kgZ2VuMSB0aGUgYWN0dWFsIGJhbmR3aWR0aCBjYW4g
YmUgbXVjaCBoaWdoZXIKPiA+ID4gPiBiZWNhdXNlCj4gPiA+ID4gb2YKPiA+ID4gPiB0aGUgdmly
dHVhbCBsaW5rLgo+ID4gPgo+ID4gPiBOb3Qgc3VyZSBJIHVuZGVyc3RhbmQgY29ycmVjdGx5LCBh
cmUgeW91IHNheWluZyB0aGF0IFRCMyBjYW4gZG8gNDAKPiA+ID4gR2JpdC9zZWMgZXZlbiB0aG91
Z2ggdGhlIGtlcm5lbCB0aGlua3MgaXQgY2FuIG9ubHkgZG8gOCBHYml0IC8gc2VjPwo+ID4gPgo+
ID4gPiBJIGhhdmVuJ3QgZm91bmQgYSBnb29kIHdheSB0byBtZWFzdXJlIHRoZSBtYXhpbXVtIFBD
SWUgdGhyb3VnaHB1dAo+ID4gPiBiZXR3ZWVuIHRoZSBDUFUgYW5kIEdQVSwgYnV0IEkgZGlkIHRh
a2UgYSBsb29rIGF0IEFNRCdzIHN5c2ZzCj4gPiA+IGludGVyZmFjZQo+ID4gPiBhdCAvc3lzL2Ns
YXNzL2RybS9jYXJkMS9kZXZpY2UvcGNpZV9idyB3aGljaCB3aGlsZSBydW5uaW5nIHRoZQo+ID4g
PiBib3R0bGVuZWNrZWQgZ2FtZS4gVGhlIGhpZ2hlc3QgdGhyb3VnaHB1dCBJIHNhdyB0aGVyZSB3
YXMgb25seSAyLjQzCj4gPiA+IEdiaXQgL3NlYy4KPiA+ID4KPiA+ID4gT25lIG1vcmUgdGhvdWdo
dC4gSSd2ZSBhbHNvIGxvb2tlZCBhdAo+ID4gPiAvc3lzL2NsYXNzL2RybS9jYXJkMS9kZXZpY2Uv
cHBfZHBtX3BjaWUgLSB3aGljaCB0ZWxscyBtZSB0aGF0Cj4gPiA+IGFtZGdwdQo+ID4gPiB0aGlu
a3MgaXQgaXMgcnVubmluZyBvbiBhIDIuNUdUL3MgeDggbGluayAoYXMgb3Bwb3NlZCB0byB0aGUK
PiA+ID4gZXhwZWN0ZWQgOAo+ID4gPiBHVC9zIHg0KS4gQ2FuIHRoaXMgYmUgYSBwcm9ibGVtPwo+
ID4KPiA+IFdlIGxpbWl0IHRoZSBzcGVlZCBvZiB0aGUgbGluayB0aGUgdGhlIGRyaXZlciB0byB0
aGUgbWF4IHNwZWVkIG9mIGFueQo+ID4gdXBzdHJlYW0gbGlua3MuICBTbyBpZiB0aGVyZSBhcmUg
YW55IGxpbmtzIHVwc3RyZWFtIGxpbWl0ZWQgdG8gMi41Cj4gPiBHVC9zLCBpdCBkb2Vzbid0IG1h
a2Ugc2Vuc2UgdG8gY2xvY2sgdGhlIGxvY2FsIGxpbmsgdXAgdG8gZmFzdGVyCj4gPiBzcGVlZHMu
Cj4gPgo+ID4gQWxleAo+Cj4gSGkgQWxleCwKPgo+IEkgaGF2ZSB0d28gY29uY2VybnMgYWJvdXQg
aXQ6Cj4KPiAxLiBXaHkgZG9lcyBhbWRncHUgdGhpbmsgdGhhdCB0aGUgbGluayBoYXMgOCBsYW5l
cywgd2hlbiBpdCBvbmx5IGhhcyA0PwoKTm90IHN1cmUuICBXZSB1c2UgcGNpZV9iYW5kd2lkdGhf
YXZhaWxhYmxlKCkgb24ga2VybmVsIDUuMyBhbmQgbmV3ZXIKdG8gZGV0ZXJtaW5lIHRoZSBtYXgg
c3BlZWQgYW5kIGxpbmtzIHdoZW4gd2Ugc2V0IHVwIHRoZSBHUFUuICBGb3IKb2xkZXIga2VybmVs
cyB1c2UgdXNlIGFuIG9wZW4gY29kZWQgdmVyc2lvbiBvZiBpdCBpbiB0aGUgZHJpdmVyLgoKPgo+
IDIuIEFzIGZhciBhcyBJIHVuZGVyc3Rvb2Qgd2hhdCBNaWthIHNhaWQsIHRoZXJlIGlzbid0IHJl
YWxseSBhIDIuNSBHVC9zCj4gbGltaXRhdGlvbiB0aGVyZSwgc2luY2UgdGhlIHZpcnR1YWwgbGlu
ayBzaG91bGQgYmUgcnVubmluZyBhdCA0MCBHYi9zCj4gcmVnYXJkbGVzcyBvZiB0aGUgcmVwb3J0
ZWQgc3BlZWQgb2YgdGhhdCBkZXZpY2UuIFdvdWxkIGl0IGJlIHBvc3NpYmxlCj4gdG8gcnVuIHRo
ZSBBTUQgR1BVIGF0IDggR1QvcyBpbiB0aGlzIGNhc2U/CgpJZiB0aGVyZSBpcyByZWFsbHkgYSBm
YXN0ZXIgbGluayBoZXJlIHRoZW4gd2UgbmVlZCBzb21lIHdheSB0byBwYXNzCnRoYXQgaW5mb3Jt
YXRpb24gdG8gdGhlIGRyaXZlcnMuICBXZSByZWx5IG9uIHRoZSBpbmZvcm1hdGlvbiBmcm9tIHRo
ZQp1cHN0cmVhbSBicmlkZ2VzIGFuZCB0aGUgcGNpZSBjb3JlIGhlbHBlciBmdW5jdGlvbnMuCgpB
bGV4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
