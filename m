Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 484265F37C
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4161C6E273;
	Thu,  4 Jul 2019 07:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A92F36E10C
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 11:04:26 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id v14so2301851wrr.4
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2019 04:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=GwZK6BC+0TnOSsyL00woAZwy/ueTNoablVBgefAAeDM=;
 b=dLdqtwSfy6M4/yT4ktISh6oO0PgDFmFYUQ62u3ZtJ69ta2yX/Gxo/CcAQljXbY2pzW
 oA66zFYEDY1hOJwwcaQWQyznbyNUkkq38u9FQTsGm2VsshDu7F6UiTIbJhbKbLlrsl/M
 fDAdvjbguxR++GdR87b4FD8hxc4TG/I9UkmhFnINvKVAohxfDG6AxyauLif4ee1dw8ui
 MxuI9DI/19yiowaTVfxEZdR2JNPuBFiRnoAcJdACaytPP4ZoOf/kHy+LTebs6U9F+6mL
 KMMXMSGnwJbaI3EEFAZxDoHJ4BufYIMbvX6rmAOb591u8PGAz5idQCg+w0/7+4oKRnya
 oHhA==
X-Gm-Message-State: APjAAAUkQSotzCuqw+bTJERBtXvK1sj2Sqs71I0TiLbTyFDy0PPGIyHJ
 wlF4Wic4vYQHj+JyvqG1b+duLAXs
X-Google-Smtp-Source: APXvYqyO5BaDxNzO+jVoAhhEO/V5bEqDrkXDgUB0FCpr44ULKGTZKx/qRnf9zQW0KXC6/CmXeowoeA==
X-Received: by 2002:adf:fac8:: with SMTP id a8mr5861236wrs.176.1562151865413; 
 Wed, 03 Jul 2019 04:04:25 -0700 (PDT)
Received: from Timur-XPS ([152.66.80.213])
 by smtp.gmail.com with ESMTPSA id x3sm1899295wrp.78.2019.07.03.04.04.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 04:04:24 -0700 (PDT)
Message-ID: <4ee5439cb01e355436d618f5d6f2e109410dc35e.camel@gmail.com>
Subject: Re: Why is Thunderbolt 3 limited to 2.5 GT/s on Linux?
From: Timur =?ISO-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
To: Michel =?ISO-8859-1?Q?D=E4nzer?= <michel@daenzer.net>, Mika Westerberg
 <mika.westerberg@linux.intel.com>
Date: Wed, 03 Jul 2019 13:04:21 +0200
In-Reply-To: <d1dfe289-8501-8848-6324-c43d6e66a77f@daenzer.net>
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
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 04 Jul 2019 07:25:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=GwZK6BC+0TnOSsyL00woAZwy/ueTNoablVBgefAAeDM=;
 b=OdcGIkqVMkMn/Kz18oNEJbAE4lM4nFKG8ASWPxOxJdiRVi0pfElx/9eJSHgV/6WmGM
 k2ltMx6gYLGGlKGi+n8rRD3nLFk5VJpY99UR1Py5WXKpmbPKr5QRXjbzalGz+bSpNaeS
 JhclWawGvyMp+3CkLa56MrOgCp4b69gi86SymvsAPEgw+lYGmElh297yNRVSmxSUYs2L
 lL6bXzb28UIq3OqusBJXU2dJFRGBRS1i7MyW5oOPBGvvAQA5ryzaJ8X+FuGAd+DYMi46
 X7BXgaL7kQX2wmyE8rPKyJJP4ogNeHaN0SBWdu5Nlgjz40yAkB54dG4VHM/Weo189ntA
 UfAg==
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

Cj4gPiBPa2F5LCBzbyBJIGJvb3RlZCBteSBzeXN0ZW0gd2l0aCBhbWRncHUuYmVuY2htYXJrPTMK
PiA+IFlvdSBjYW4gZmluZCB0aGUgZnVsbCBkbWVzZyBsb2cgaGVyZTogaHR0cHM6Ly9wYXN0ZWJp
bi5jb20vek45RllHdzQKPiA+IAo+ID4gVGhlIHJlc3VsdCBpcyBiZXR3ZWVuIDEtNSBHYml0IC8g
c2VjIGRlcGVuZGluZyBvbiB0aGUgdHJhbnNmZXIgc2l6ZQo+ID4gKHRoZSBoaWdoZXIgdGhlIGJl
dHRlciksIHdoaWNoIGNvcnJlc3BvbmRzIHRvIG5laXRoZXIgdGhlIDggR2JpdCAvCj4gPiBzZWMK
PiA+IHRoYXQgdGhlIGtlcm5lbCB0aGlua3MgaXQgaXMgbGltaXRlZCB0bywgbm9yIHRoZSAyMCBH
Yml0IC8gc2VjCj4gPiB3aGljaCBJCj4gPiBtZWFzdXJlZCBlYXJsaWVyIHdpdGggcGNpZV9idy4K
PiAKPiA1IEdiaXQvcyB0aHJvdWdocHV0IGNvdWxkIGJlIGNvbnNpc3RlbnQgd2l0aCA4IEdiaXQv
cyB0aGVvcmV0aWNhbAo+IGJhbmR3aWR0aCwgZHVlIHRvIHZhcmlvdXMgb3ZlcmhlYWQuCgpPa2F5
LCB0aGF0J3MgZ29vZCB0byBrbm93LgoKPiA+IFNpbmNlIHBjaWVfYncgb25seSBzaG93cyB0aGUg
bWF4aW11bSBQQ0llIHBhY2tldCBzaXplIChhbmQgbm90IHRoZQo+ID4gYWN0dWFsIHNpemUpLCBj
b3VsZCBpdCBiZSB0aGF0IGl0J3Mgc28gaW5hY2N1cmF0ZSB0aGF0IHRoZSAyMCBHYml0Cj4gPiAv
Cj4gPiBzZWMgaXMgYSBmbHVrZT8KPiAKPiBTZWVtcyBsaWtlbHkgb3IgYXQgbGVhc3QgcGxhdXNp
YmxlLgoKVGhhbmtzIGZvciB0aGUgY29uZmlybWF0aW9uLiBJdCBhbHNvIGxvb2tzIGxpa2UgaXQg
aXMgdGhlIHNsb3dlc3Qgd2l0aApzbWFsbCB0cmFuc2ZlcnMsIHdoaWNoIEkgYXNzdW1lIG1lc2Eg
aXMgZG9pbmcgZm9yIHRoaXMgZ2FtZS4KCj4gPiAKPiA+IFRoZXJlIG1heSBiZSBvdGhlciBmYWN0
b3JzLCB5ZXMuIEkgY2FuJ3Qgb2ZmZXIgYSBnb29kIGV4cGxhbmF0aW9uCj4gPiBvbgo+ID4gd2hh
dCBleGFjdGx5IGlzIGhhcHBlbmluZywgYnV0IGl0J3MgcHJldHR5IGNsZWFyIHRoYXQgYW1kZ3B1
IGNhbid0Cj4gPiB0YWtlCj4gPiBmdWxsIGFkdmFudGFnZSBvZiB0aGUgVEIzIGxpbmssIHNvIGl0
IHNlZW1lZCBsaWtlIGEgZ29vZCBpZGVhIHRvCj4gPiBzdGFydAo+ID4gaW52ZXN0aWdhdGluZyB0
aGlzIGZpcnN0Lgo+IAo+IFllYWgsIGFjdHVhbGx5IGl0IHdvdWxkIGJlIGNvbnNpc3RlbnQgd2l0
aCB+MTYtMzIgS0IgZ3JhbnVsYXJpdHkKPiB0cmFuc2ZlcnMgYmFzZWQgb24geW91ciBtZWFzdXJl
bWVudHMgYWJvdmUsIHdoaWNoIGlzIHBsYXVzaWJsZS4gU28KPiBtYWtpbmcgc3VyZSB0aGF0IHRo
ZSBkcml2ZXIgZG9lc24ndCBhcnRpZmljaWFsbHkgbGltaXQgdGhlIFBDSWUKPiBiYW5kd2lkdGgg
bWlnaHQgaW5kZWVkIGhlbHAuCgpDYW4geW91IHBvaW50IG1lIHRvIHRoZSBwbGFjZSB3aGVyZSBh
bWRncHUgZGVjaWRlcyB0aGUgUENJZSBsaW5rIHNwZWVkPwpJJ2QgbGlrZSB0byB0cnkgdG8gdHdl
YWsgaXQgYSBsaXR0bGUgYml0IHRvIHNlZSBpZiB0aGF0IGhlbHBzIGF0IGFsbC4KCj4gT1RPSCB0
aGlzIGFsc28gaW5kaWNhdGVzIGEgc2ltaWxhciBwb3RlbnRpYWwgZm9yIGltcHJvdmVtZW50IGJ5
IHVzaW5nCj4gbGFyZ2VyIHRyYW5zZmVycyBpbiBNZXNhIGFuZC9vciB0aGUga2VybmVsLgoKWWVz
LCB0aGF0IHNvdW5kcyBsaWtlIGl0IHdvdWxkIGJlIHdvcnRoIGxvb2tpbmcgaW50by4KCk91dCBv
ZiBjdXJpb3NpdHksIGlzIHRoZXJlIGEgcGVyZm9ybWFjZSBkZWNyZWFzZSB3aXRoIHNtYWxsIHRy
YW5zZmVycwpvbiBhICJub3JtYWwiIFBDSWUgcG9ydCB0b28sIG9yIGlzIHRoaXMgc3BlY2lmaWMg
dG8gVEIzPwoKQmVzdCByZWdhcmRzLApUaW0KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
