Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF1B6E757
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 16:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F33A56E83F;
	Fri, 19 Jul 2019 14:29:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF1A6E83F
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 14:29:44 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id u25so18874097wmc.4
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 07:29:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ngXBtjsCRIgE8pbsy3+JLt/bZc82kHegW7UTM5Zb59Q=;
 b=JN+COx4QZ0wJaPisvomnAAJZBwmXxLM5z4DpETyJ+kZTFBH96yAJo86zeyt2Mu4TyH
 ZQaQIPKBlF+tNM2SsZ6XxO2I019FabkBZkQ0yQqAg0ZUTkorKSMamJo+g8f9XACcVkS9
 2/VHBeRQWCFmpT4xKqxphNZAxftxWlHraas9jq36bHvuZNcRNPbladRt15Mf7+7k35Wh
 IdSG0+efLa0HixZcUd226AIMQdcH6r0ASqgnuEX82yhJkocedNDq07tL8HZdNm93zteh
 99iWSGF1w51ZXjl7Esmbv9SSxkLGezxgSjIRojGUmzMOirCO/AFV6pjMtWwHiuyKLJOQ
 LGug==
X-Gm-Message-State: APjAAAVE1ZhxsQ54LCeRsoBXEasKJT9v0q+QRPMXDkUDPQoE70vUEAJb
 jz/M/Sul2JQSg0Bcvk0E9pmJDqQPC0di1YDRDc8=
X-Google-Smtp-Source: APXvYqxZsv4+NgGdAQps7arIgqrNen4x9XbSPnyFivObiqWtN9A1DrsZy43vyaWIDeZJ9x1TppcluCj0NY1znbSgeq8=
X-Received: by 2002:a05:600c:20d:: with SMTP id
 13mr48735390wmi.141.1563546583211; 
 Fri, 19 Jul 2019 07:29:43 -0700 (PDT)
MIME-Version: 1.0
References: <91de711591780e83c70e8f61747725855f6dee99.camel@gmail.com>
 <20190628103204.GJ2640@lahna.fi.intel.com>
 <f550f4a25a7ee7fecd80f7213c3be127ed0323e7.camel@gmail.com>
 <20190628113415.GL2640@lahna.fi.intel.com>
 <ecebae84c91fa31a1207c30c0fe4ed907642dbb9.camel@gmail.com>
 <c3b38b60-7c1a-730d-8de0-e3c880902003@daenzer.net>
 <627b7fff64edcba0f8d8b5ced79a351821c419c7.camel@gmail.com>
 <792d0f36-b8ae-bef9-3b07-95677637ba00@daenzer.net>
 <f986d6687e2b1f1fc8a93f86cbc8fd1ab971663a.camel@gmail.com>
 <d1dfe289-8501-8848-6324-c43d6e66a77f@daenzer.net>
 <4ee5439cb01e355436d618f5d6f2e109410dc35e.camel@gmail.com>
 <eee4eea0-ad27-9d05-192d-c1207da5d0bc@daenzer.net>
 <CADnq5_PHyGcjeOygwnuXgR_DpS4_c2G=KgykRaBHj6PZcEmP7g@mail.gmail.com>
 <1061c44a462961e3d67b075b81a14eb6155a12fd.camel@gmail.com>
 <CADnq5_Ndi9P9R6nyRkmYi0xjBAtCqUUxjTRP-MzSMU6OuqOXsA@mail.gmail.com>
 <172a41d97d383a8989ebd213bb4230a2df4d636d.camel@gmail.com>
In-Reply-To: <172a41d97d383a8989ebd213bb4230a2df4d636d.camel@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 19 Jul 2019 10:29:30 -0400
Message-ID: <CADnq5_N++5zcrDM6=NGaMp-CSymfmLw67n2XhEM2g-i4iMg6fw@mail.gmail.com>
Subject: Re: Why is Thunderbolt 3 limited to 2.5 GT/s on Linux?
To: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ngXBtjsCRIgE8pbsy3+JLt/bZc82kHegW7UTM5Zb59Q=;
 b=k7xPCuxKdEnpsyjb2W2+g83QHS/AvygVKDmbD9N99meWyCb3eroUibQSv3XDBKE2XS
 VaQQbx11mYWzcHWFurkXYsFfCUEdPawPSCPNPDXcKhR+S4S9Tm1oMk4rnfk5a7N6v40W
 Hiu2Jy/i91phGHHwGTRS1ZovsTrt6MNQDFxi7FpgCzryz1+xUa+8mxypRJcA6nP4wP4i
 Ebd07XZbDM9YstIlAMp/ECZD02VO7Km/U25K5UQy0VXeeR/rMPbom4FY5HZ3kF3cNi3s
 pnTKpfATi+jJ3cZezgXDJHu65ZkP8ZeB71Lf4z4a4FXsDnRJnP9gRSvbaEmJHxeAutjx
 G1iA==
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
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgMTA6MzggQU0gVGltdXIgS3Jpc3TDs2YgPHRpbXVyLmty
aXN0b2ZAZ21haWwuY29tPiB3cm90ZToKPgo+Cj4gPiA+Cj4gPiA+IEkgdG9vayBhIGxvb2sgYXQg
YW1kZ3B1X2RldmljZV9nZXRfcGNpZV9pbmZvKCkgYW5kIGZvdW5kIHRoYXQgaXQKPiA+ID4gdXNl
cwo+ID4gPiBwY2llX2JhbmR3aWR0aF9hdmFpbGFibGUgdG8gZGV0ZXJtaW5lIHRoZSBjYXBhYmls
aXRpZXMgb2YgdGhlIFBDSWUKPiA+ID4gcG9ydC4gSG93ZXZlciwgcGNpZV9iYW5kd2lkdGhfYXZh
aWxhYmxlIGdpdmVzIHlvdSBvbmx5IHRoZSBjdXJyZW50Cj4gPiA+IGJhbmR3aWR0aCBhcyBzZXQg
YnkgdGhlIFBDSWUgbGluayBzdGF0dXMgcmVnaXN0ZXIsIG5vdCB0aGUgbWF4aW11bQo+ID4gPiBj
YXBhYmlsaXR5Lgo+ID4gPgo+ID4gPiBJIHRoaW5rIHNvbWV0aGluZyBhbG9uZyB0aGVzZSBsaW5l
cyB3b3VsZCBmaXggaXQ6Cj4gPiA+IGh0dHBzOi8vcGFzdGViaW4uY29tL0xzY0VNS01jCj4gPiA+
Cj4gPiA+IEl0IHNlZW1zIHRvIG1lIHRoYXQgdGhlIFBDSWUgY2FwYWJpbGl0aWVzIGFyZSBvbmx5
IHVzZWQgaW4gYSBmZXcKPiA+ID4gcGxhY2VzCj4gPiA+IGluIHRoZSBjb2RlLCBzbyB0aGlzIHBh
dGNoIGZpeGVzIHBwX2RwbV9wY2llLiBIb3dldmVyIGl0IGRvZXNuJ3QKPiA+ID4gYWZmZWN0Cj4g
PiA+IHRoZSBhY3R1YWwgcGVyZm9ybWFuY2UuCj4gPiA+Cj4gPiA+IFdoYXQgZG8geW91IHRoaW5r
Pwo+ID4KPiA+IEkgdGhpbmsgd2Ugd2FudCB0aGUgY3VycmVudCBiYW5kd2lkdGguICBUaGUgR1BV
IGNhbiBvbmx5IGNvbnRyb2wgdGhlCj4gPiBzcGVlZCBvZiBpdHMgbG9jYWwgbGluay4gIElmIHRo
ZXJlIGFyZSB1cHN0cmVhbSBsaW5rcyB0aGF0IGFyZSBzbG93ZXIKPiA+IHRoYW4gaXRzIGxvY2Fs
IGxpbmssIGl0IGRvZXNuJ3QgbWFrZSBzZW5zZSB0byBydW4gdGhlIGxvY2FsIGxpbmsgYXQKPiA+
IGZhc3RlciBzcGVlZHMgYmVjYXVzZSBpdCB3aWxsIGJ1cm4gZXh0cmEgcG93ZXIgaXQgd2lsbCBq
dXN0IHJ1biBpbnRvCj4gPiBhCj4gPiBib3R0bGVuZWNrIGF0IHRoZSBuZXh0IGxpbmsuICBJbiBn
ZW5lcmFsLCBtb3N0IHN5c3RlbXMgbmVnb3RpYXRlIHRoZQo+ID4gZmFzdGVzdCBsaW5rIHNwZWVk
IHN1cHBvcnRlZCBieSBib3RoIGVuZHMgYXQgcG93ZXIgdXAuCj4gPgo+ID4gQWxleAo+Cj4gQ3Vy
cmVudGx5LCBpZiB0aGUgR1BVIGNvbm5lY3RlZCB0byBhIFRCMyBwb3J0LCB0aGUgZHJpdmVyIHRo
aW5rcyB0aGF0Cj4gMi41IEdUL3MgaXMgdGhlIGJlc3Qgc3BlZWQgdGhhdCBpdCBjYW4gdXNlLCBl
dmVuIHRob3VnaCB0aGUgaGFyZHdhcmUKPiBpdHNlbGYgdXNlcyA4IEdUL3MuIFNvIHdoYXQgdGhl
IGRyaXZlciB0aGlua3MgaXMgaW5jb25zaXN0ZW50IHdpdGggd2hhdAo+IHRoZSBoYXJkd2FyZSBk
b2VzLiBUaGlzIG1lc3NlcyB1cCBwcF9kcG1fcGNpZS4KPgo+IEFzIGZhciBhcyBJIHVuZGVyc3Rh
bmQsIFBDSWUgYnJpZGdlIGRldmljZXMgY2FuIGNoYW5nZSB0aGVpciBsaW5rIHNwZWVkCj4gaW4g
cnVudGltZSBiYXNlZCBvbiBob3cgdGhleSBhcmUgdXNlZCBvciB3aGF0IHBvd2VyIHN0YXRlIHRo
ZXkgYXJlIGluLAo+IHNvIGl0IG1ha2VzIHNlbnNlIGhlcmUgdG8gcmVxdWVzdCB0aGUgYmVzdCBz
cGVlZCB0aGV5IGFyZSBjYXBhYmxlIG9mLiBJCj4gbWlnaHQgYmUgd3JvbmcgYWJvdXQgdGhhdC4K
CkkgZG9uJ3Qga25vdyBvZiBhbnkgYnJpZGdlcyBvZmYgaGFuZCB0aGF0IGNoYW5nZSB0aGVpciBs
aW5rIHNwZWVkcyBvbgpkZW1hbmQuICBUaGF0IHNhaWQsIEknbSBjZXJ0YWlubHkgbm90IGEgUENJ
IGV4cGVydC4gIE91ciBHUFVzIGZvcgppbnN0YW5jZSBoYXZlIGEgbWljcm8tY29udHJvbGxlciBv
biB0aGVtIHdoaWNoIGNoYW5nZXMgdGhlIHNwZWVkIG9uCmRlbWFuZC4gIFByZXN1bWFibHkgb3Ro
ZXIgZGV2aWNlcyB3b3VsZCBuZWVkIHNvbWV0aGluZyBzaW1pbGFyLgoKPgo+IElmIHlvdSB0aGlu
ayB0aGlzIGNoYW5nZSBpcyB1bmRlc2lyZWFibGUsIHRoZW4gbWF5YmUgaXQgd291bGQgYmUgd29y
dGgKPiB0byBmb2xsb3cgTWlrYSdzIHN1Z2dlc3Rpb24gYW5kIGFkZCBzb21ldGhpbmcgYWxvbmcg
dGhlIGxpbmVzIG9mCj4gZGV2LT5pc190aHVuZGVyYm9sdCBzbyB0aGF0IHRoZSBjb3JyZWN0IGF2
YWlsYWJsZSBiYW5kd2lkdGggY291bGQgc3RpbGwKPiBiZSBkZXRlcm1pbmVkLgoKSWRlYWxseSwg
aXQgd291bGQgYmUgYWRkZWQgdG8gdGhlIGNvcmUgcGNpIGhlbHBlcnMgc28gdGhhdCBlYWNoIGRy
aXZlcgp0aGF0IHVzZXMgdGhlbSBkb2Vzbid0IGhhdmUgdG8gZHVwbGljYXRlIHRoZSBzYW1lIGZ1
bmN0aW9uYWxpdHkuCgpBbGV4CgoKPgo+IFRpbQo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
