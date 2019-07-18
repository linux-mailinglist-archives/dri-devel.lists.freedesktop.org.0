Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBE96CF25
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 15:51:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B02F6E3C9;
	Thu, 18 Jul 2019 13:50:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FCF06E3C9
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 13:50:58 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id s3so25681852wms.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 06:50:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Buxer4VFJIaoVqe7KI8Fm7pUHfZhZOw03kGmQ7/WqAU=;
 b=sL/PMWm0Fjzwg2EQkKNiTvDJPvW2giK1iXFlfRnLxzEfBLJPSP58nPns5ai1IIWTvT
 xRBbzjAWWRV+Qnsc7Q38VNKKd/xEtbzhmFeCKq9tbPENSq+Cb17K5p4713xl1rX85qzJ
 rE10PfRkqayynJ8p1tjRqFwlaE/t5vr+PtFi0IBvoKtB3HepJQy+f/emvrS4NDXhhswS
 UKcc2Tn3191ffbFT6W3Gng923axi9LhSVvQ+0Vk/L7Khk2Ap/TBYxYCYqthSC4Nifpk6
 J279yG/Ye8GgxZImMq5UMeKDM8mjQ7jzKKNHkOq45p0E79O47XtmsrTwX3oyNm9i4PHt
 asqA==
X-Gm-Message-State: APjAAAWxMbSyGoSVQGkiDErcgvx/ourNnR0aMGj0tmH4WBO8o99yEbJJ
 stV5kL26OWfOafvdoF/rxRGcPrqDrMrQj2247v3dpw==
X-Google-Smtp-Source: APXvYqyb4GLHqm2zvSgLyBopQu9xtCWHdIuu0cNtXudVgSAcAdXG/6a4vM0SQBZza+LJTKAfABXM75iV7aS+XwSLMgY=
X-Received: by 2002:a1c:67c3:: with SMTP id b186mr40308871wmc.34.1563457856912; 
 Thu, 18 Jul 2019 06:50:56 -0700 (PDT)
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
In-Reply-To: <1061c44a462961e3d67b075b81a14eb6155a12fd.camel@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 18 Jul 2019 09:50:44 -0400
Message-ID: <CADnq5_Ndi9P9R6nyRkmYi0xjBAtCqUUxjTRP-MzSMU6OuqOXsA@mail.gmail.com>
Subject: Re: Why is Thunderbolt 3 limited to 2.5 GT/s on Linux?
To: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Buxer4VFJIaoVqe7KI8Fm7pUHfZhZOw03kGmQ7/WqAU=;
 b=HrXBJX0wTTLDFJoPW7Ymqcxr4VCAz22PhS7sg1GXtKnF06zhG1lCusxSxzV2ynQxrp
 gHTW3xNB+JQMfsSqYmljVsptwfMltJrzF/Fqej4DuQCzBH+TjYnJy+ma2KRNcK6vljC0
 Yb3DNvH9TJQm/IduYdJzLmn5KITTetfUFHMPkWSylZgCP0cEfFXxgPut+4PbJ521vDxK
 woPHmlMA6+MmwZy0dPcUOD69Y4L4dqdtxdBBR7vEM+JrLLOInbal9nC2K8R5pTGbb0cF
 Uim4w9Fli6JaYVHmXRYH19rGWsTiSAeIFg+KkTdO3eI0PrnSlXLW7wkx23c0b0PViBN9
 OlNg==
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

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgNToxMSBBTSBUaW11ciBLcmlzdMOzZiA8dGltdXIua3Jp
c3RvZkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCAyMDE5LTA3LTA1IGF0IDA5OjM2IC0w
NDAwLCBBbGV4IERldWNoZXIgd3JvdGU6Cj4gPiBPbiBUaHUsIEp1bCA0LCAyMDE5IGF0IDY6NTUg
QU0gTWljaGVsIETDpG56ZXIgPG1pY2hlbEBkYWVuemVyLm5ldD4KPiA+IHdyb3RlOgo+ID4gPiBP
biAyMDE5LTA3LTAzIDE6MDQgcC5tLiwgVGltdXIgS3Jpc3TDs2Ygd3JvdGU6Cj4gPiA+ID4gPiA+
IFRoZXJlIG1heSBiZSBvdGhlciBmYWN0b3JzLCB5ZXMuIEkgY2FuJ3Qgb2ZmZXIgYSBnb29kCj4g
PiA+ID4gPiA+IGV4cGxhbmF0aW9uCj4gPiA+ID4gPiA+IG9uCj4gPiA+ID4gPiA+IHdoYXQgZXhh
Y3RseSBpcyBoYXBwZW5pbmcsIGJ1dCBpdCdzIHByZXR0eSBjbGVhciB0aGF0IGFtZGdwdQo+ID4g
PiA+ID4gPiBjYW4ndAo+ID4gPiA+ID4gPiB0YWtlCj4gPiA+ID4gPiA+IGZ1bGwgYWR2YW50YWdl
IG9mIHRoZSBUQjMgbGluaywgc28gaXQgc2VlbWVkIGxpa2UgYSBnb29kIGlkZWEKPiA+ID4gPiA+
ID4gdG8KPiA+ID4gPiA+ID4gc3RhcnQKPiA+ID4gPiA+ID4gaW52ZXN0aWdhdGluZyB0aGlzIGZp
cnN0Lgo+ID4gPiA+ID4KPiA+ID4gPiA+IFllYWgsIGFjdHVhbGx5IGl0IHdvdWxkIGJlIGNvbnNp
c3RlbnQgd2l0aCB+MTYtMzIgS0IKPiA+ID4gPiA+IGdyYW51bGFyaXR5Cj4gPiA+ID4gPiB0cmFu
c2ZlcnMgYmFzZWQgb24geW91ciBtZWFzdXJlbWVudHMgYWJvdmUsIHdoaWNoIGlzIHBsYXVzaWJs
ZS4KPiA+ID4gPiA+IFNvCj4gPiA+ID4gPiBtYWtpbmcgc3VyZSB0aGF0IHRoZSBkcml2ZXIgZG9l
c24ndCBhcnRpZmljaWFsbHkgbGltaXQgdGhlIFBDSWUKPiA+ID4gPiA+IGJhbmR3aWR0aCBtaWdo
dCBpbmRlZWQgaGVscC4KPiA+ID4gPgo+ID4gPiA+IENhbiB5b3UgcG9pbnQgbWUgdG8gdGhlIHBs
YWNlIHdoZXJlIGFtZGdwdSBkZWNpZGVzIHRoZSBQQ0llIGxpbmsKPiA+ID4gPiBzcGVlZD8KPiA+
ID4gPiBJJ2QgbGlrZSB0byB0cnkgdG8gdHdlYWsgaXQgYSBsaXR0bGUgYml0IHRvIHNlZSBpZiB0
aGF0IGhlbHBzIGF0Cj4gPiA+ID4gYWxsLgo+ID4gPgo+ID4gPiBJJ20gbm90IHN1cmUgb2ZmaGFu
ZCwgQWxleCBvciBhbnlvbmU/Cj4gPgo+ID4gYW1kZ3B1X2RldmljZV9nZXRfcGNpZV9pbmZvKCkg
aW4gYW1kZ3B1X2RldmljZS5jLgo+Cj4KPiBIaSBBbGV4LAo+Cj4gSSB0b29rIGEgbG9vayBhdCBh
bWRncHVfZGV2aWNlX2dldF9wY2llX2luZm8oKSBhbmQgZm91bmQgdGhhdCBpdCB1c2VzCj4gcGNp
ZV9iYW5kd2lkdGhfYXZhaWxhYmxlIHRvIGRldGVybWluZSB0aGUgY2FwYWJpbGl0aWVzIG9mIHRo
ZSBQQ0llCj4gcG9ydC4gSG93ZXZlciwgcGNpZV9iYW5kd2lkdGhfYXZhaWxhYmxlIGdpdmVzIHlv
dSBvbmx5IHRoZSBjdXJyZW50Cj4gYmFuZHdpZHRoIGFzIHNldCBieSB0aGUgUENJZSBsaW5rIHN0
YXR1cyByZWdpc3Rlciwgbm90IHRoZSBtYXhpbXVtCj4gY2FwYWJpbGl0eS4KPgo+IEkgdGhpbmsg
c29tZXRoaW5nIGFsb25nIHRoZXNlIGxpbmVzIHdvdWxkIGZpeCBpdDoKPiBodHRwczovL3Bhc3Rl
YmluLmNvbS9Mc2NFTUtNYwo+Cj4gSXQgc2VlbXMgdG8gbWUgdGhhdCB0aGUgUENJZSBjYXBhYmls
aXRpZXMgYXJlIG9ubHkgdXNlZCBpbiBhIGZldyBwbGFjZXMKPiBpbiB0aGUgY29kZSwgc28gdGhp
cyBwYXRjaCBmaXhlcyBwcF9kcG1fcGNpZS4gSG93ZXZlciBpdCBkb2Vzbid0IGFmZmVjdAo+IHRo
ZSBhY3R1YWwgcGVyZm9ybWFuY2UuCj4KPiBXaGF0IGRvIHlvdSB0aGluaz8KCkkgdGhpbmsgd2Ug
d2FudCB0aGUgY3VycmVudCBiYW5kd2lkdGguICBUaGUgR1BVIGNhbiBvbmx5IGNvbnRyb2wgdGhl
CnNwZWVkIG9mIGl0cyBsb2NhbCBsaW5rLiAgSWYgdGhlcmUgYXJlIHVwc3RyZWFtIGxpbmtzIHRo
YXQgYXJlIHNsb3dlcgp0aGFuIGl0cyBsb2NhbCBsaW5rLCBpdCBkb2Vzbid0IG1ha2Ugc2Vuc2Ug
dG8gcnVuIHRoZSBsb2NhbCBsaW5rIGF0CmZhc3RlciBzcGVlZHMgYmVjYXVzZSBpdCB3aWxsIGJ1
cm4gZXh0cmEgcG93ZXIgaXQgd2lsbCBqdXN0IHJ1biBpbnRvIGEKYm90dGxlbmVjayBhdCB0aGUg
bmV4dCBsaW5rLiAgSW4gZ2VuZXJhbCwgbW9zdCBzeXN0ZW1zIG5lZ290aWF0ZSB0aGUKZmFzdGVz
dCBsaW5rIHNwZWVkIHN1cHBvcnRlZCBieSBib3RoIGVuZHMgYXQgcG93ZXIgdXAuCgpBbGV4Cgo+
Cj4gQmVzdCByZWdhcmRzLAo+IFRpbQo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
