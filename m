Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A430F71287
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:15:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C85976E02C;
	Tue, 23 Jul 2019 07:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8717C89A72
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 09:39:35 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id x15so34442995wmj.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 02:39:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=VB/OFU53WK7TIxz7CcHL9a991QL7w7I3x/JF+4krN2g=;
 b=Uok3yKxhBvqkFaCqpSxXleh9gLwBsCVLJWTe3wdonDpkSxjvjyP26gchfeJPlBVw2Y
 pGKXKNlci4auuVuw61bZHW5auRCof2fjULEf7JpTaNfxaGrYPXk4zr/aNeKaqPk3Z6Hc
 GCheDIeVhZAw/RXZL3h1sYXrnuw4NGIb/pgeaN3eHNsBPEzzPXZTuKCYe70El32ncYbR
 9gceaqn/LvbnDcZG9xmBrZvjkw0fF5K+w1KHoPpVe5bbs5YQ4TD0e/4ZfrIu+QcDUec4
 D+yBjsE6Tk7j8wQD39HqbSp1voT2skb9TUD5doXilxfHOSRBAQB8eAp/4kbOQ4TlY7Gu
 CkMw==
X-Gm-Message-State: APjAAAVFz1j3fHrBYFI5ryFa+MHsRhU3iRrS9CB2NsO4POTqXCuPxxYn
 LsJY3h2asZYnYBCwMrVUYSO+YPYx
X-Google-Smtp-Source: APXvYqx26RkUH44QH2TCBDy3j5Dsnfxe5zo5Is+T05fhHl6SZ5p5GmB7UQulbfv8iJiM+67ok46rOg==
X-Received: by 2002:a7b:ce83:: with SMTP id q3mr65566323wmj.116.1563788374195; 
 Mon, 22 Jul 2019 02:39:34 -0700 (PDT)
Received: from Timur-XPS (catv-80-99-228-232.catv.broadband.hu.
 [80.99.228.232])
 by smtp.gmail.com with ESMTPSA id e3sm34867946wrs.37.2019.07.22.02.39.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 02:39:33 -0700 (PDT)
Message-ID: <f59f00d64c23ec74d44e5cf4ce126be2b8b42922.camel@gmail.com>
Subject: Re: Why is Thunderbolt 3 limited to 2.5 GT/s on Linux?
From: Timur =?ISO-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
To: Michel =?ISO-8859-1?Q?D=E4nzer?= <michel@daenzer.net>, Marek
 =?UTF-8?Q?Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>
Date: Mon, 22 Jul 2019 11:39:32 +0200
In-Reply-To: <9d3e2499-e55d-c095-e73e-392440e2bf47@daenzer.net>
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
 <CAAxE2A4hgaJ6+AoOGz=b+1aRQEb+eKB88N82KGkcU1w_dnffOQ@mail.gmail.com>
 <ba05faee86fd702f0ba9baa2322a5e32c27432d7.camel@gmail.com>
 <CAAxE2A6K-oaZqOJr+k0fZfwCmrPO+tfygu8EjDwk9PNgk4qU=Q@mail.gmail.com>
 <8f0c2d7780430d40dd1e17a82484d236eae3f981.camel@gmail.com>
 <9d3e2499-e55d-c095-e73e-392440e2bf47@daenzer.net>
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=VB/OFU53WK7TIxz7CcHL9a991QL7w7I3x/JF+4krN2g=;
 b=nv7hXXu5Zbat0hGCXFSC02VdcglFgnco5rFuSKtHpHjNN7fx4T+k+WkYtT0iE2jzY+
 zZlMeX/NeGO2QzvIDj7rf795/xzgjMwA32fOAmhbzylSbBpuLDPJSuVWZYUrO8ZdL9H/
 R6IsWBH7tNTV5x5H7MZ6SoYmqINxhhZtqiXSWjGkFAArz7qBzC8EPHD1e3IyhXK1oMIg
 QDpXUTKchB+AuQhBqweoPfWJx/IIFQYW68lDRCoLKNuZlUVVieyYpmgBnP0InXrB9sUt
 HZQEmaqhYWvcW7uRsynre/VBhZuG2Zge+3GTb79B9xstZkVb+q2VdNiXt2etE7l+LbNC
 RRJA==
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

Cj4gPiAKPiA+IDEuIFdoeSBpcyB0aGUgR1RULT5WUkFNIGNvcHkgc28gbXVjaCBzbG93ZXIgdGhh
biB0aGUgVlJBTS0+R1RUCj4gPiBjb3B5Pwo+ID4gCj4gPiAyLiBXaHkgaXMgdGhlIGJ1cyBsaW1p
dGVkIHRvIDI0IEdiaXQvc2VjPyBJIHdvdWxkIGV4cGVjdCB0aGUKPiA+IFRodW5kZXJib2x0IHBv
cnQgdG8gZ2l2ZSBtZSBhdCBsZWFzdCAzMiBHYml0L3NlYyBmb3IgUENJZSB0cmFmZmljLgo+IAo+
IFRoYXQncyB1bnJlYWxpc3RpYyBJJ20gYWZyYWlkLiBBcyBJIHNhaWQgb24gSVJDLCBmcm9tIHRo
ZSBHUFUgUE9WCj4gdGhlcmUncyBhbiA4IEdUL3MgeDQgUENJZSBsaW5rLCBzbyB+MjkuOCBHYml0
L3MgKD0gMzIgYmlsbGlvbiBiaXQvczsKPiBJCj4gbWlzc2VkIHRoaXMgbnVhbmNlIG9uIElSQykg
aXMgdGhlIHRoZW9yZXRpY2FsIHJhdyBiYW5kd2lkdGguIEhvd2V2ZXIsCj4gaW4KPiBwcmFjdGlj
ZSB0aGF0J3Mgbm90IGFjaGlldmFibGUgZHVlIHRvIHZhcmlvdXMgb3ZlcmhlYWRbMF0sIGFuZCBJ
J20KPiBvbmx5Cj4gc2VlaW5nIHVwIHRvIH45MCUgdXRpbGl6YXRpb24gb2YgdGhlIHRoZW9yZXRp
Y2FsIGJhbmR3aWR0aCB3aXRoIGEKPiAibm9ybWFsIiB4MTYgbGluayBhcyB3ZWxsLiBJIHdvdWxk
bid0IGV4cGVjdCBoaWdoZXIgdXRpbGl6YXRpb24KPiB3aXRob3V0Cj4gc2VlaW5nIHNvbWUgZXZp
ZGVuY2UgdG8gc3VnZ2VzdCBpdCdzIHBvc3NpYmxlLgo+IAo+IAo+IFswXSBBY2NvcmRpbmcgdG8K
PiBodHRwczovL3d3dy50ZXN0ZWQuY29tL3RlY2gvNDU3NDQwLXRoZW9yZXRpY2FsLXZzLWFjdHVh
bC1iYW5kd2lkdGgtcGNpLWV4cHJlc3MtYW5kLXRodW5kZXJib2x0Lwo+ICwgUENJZSAzLjAgdXNl
cyAxLjU0JSBvZiB0aGUgcmF3IGJhbmR3aWR0aCBmb3IgaXRzIGludGVybmFsIGVuY29kaW5nLgo+
IEFsc28ga2VlcCBpbiBtaW5kIGFsbCBDUFU8LT5HUFUgY29tbXVuaWNhdGlvbiBoYXMgdG8gZ28g
dGhyb3VnaCB0aGUKPiBQQ0llCj4gbGluaywgZS5nLiBmb3IgcHJvZ3JhbW1pbmcgdGhlIHRyYW5z
ZmVycywgaW4tYmFuZCBzaWduYWxsaW5nIGZyb20gdGhlCj4gR1BVIHRvIHRoZSBQQ0llIHBvcnQg
d2hlcmUgdGhlIGRhdGEgaXMgYmVpbmcgdHJhbnNmZXJyZWQgdG8vZnJvbSwgLi4uCgpHb29kIHBv
aW50LCBJIHVzZWQgMTAyNCBhbmQgbm90IDEwMDAuIE15IG1pc3Rha2UuCgpUaGVyZSBpcyBzb21l
dGhpbmcgZWxzZToKSW4gdGhlIHNhbWUgYmVuY2htYXJrIHRoZXJlIGlzIGEgImZpbGwtPkdUVCAg
LFNETUEiIHJvdyB3aGljaCBoYXMgYQo0MDM1IE1CL3MgbnVtYmVyLiBJZiB0aGF0IHRyYWZmaWMg
Z29lcyB0aHJvdWdoIHRoZSBUQjMgaW50ZXJmYWNlIHRoZW4Kd2UganVzdCBmb3VuZCBvdXIgMzIg
R2JpdC9zZWMuCgpOb3cgdGhlIHF1ZXN0aW9uIGlzLCBpZiBJIHVuZGVyc3RhbmQgdGhpcyBjb3Jy
ZWN0bHkgYW5kIHRoZSBTRE1BIGNhbgppbmRlZWQgZG8gMzIgR2JpdC9zZWMgZm9yICJmaWxsLT5H
VFQiLCB0aGVuIHdoeSBjYW4ndCBpdCBkbyB0aGUgc2FtZQp3aXRoIG90aGVyIGtpbmRzIG9mIHRy
YW5zZmVycz8gTm90IHN1cmUgaWYgdGhlcmUgaXMgYSBnb29kIGFuc3dlciB0bwp0aGF0IHF1ZXN0
aW9uIHRob3VnaC4KCkFsc28gSSBzdGlsbCBkb24ndCBmdWxseSB1bmRlcnN0YW5kIHdoeSBHVFQt
PlZSQU0gaXMgc2xvd2VyIHRoYW4gVlJBTS0KPkdUVCwgd2hlbiB0aGUgYmFuZHdpZHRoIGlzIGNs
ZWFybHkgYXZhaWxhYmxlLgoKQmVzdCByZWdhcmRzLApUaW0KCgoKU2lkZSBub3RlOiB3aXRoIHJl
Z2FyZHMgdG8gdGhhdCAxLjUlIGZpZ3VyZSwgdGhlIFRCMyB0ZWNoIGJyaWVmWzBdCmV4cGxpY2l0
bHkgbWVudGlvbnMgdGhpcyBhbmQgc2F5cyB0aGF0IGl0IGlzbid0IGNhcnJpZWQgb3ZlcjogInRo
ZQp1bmRlcmx5aW5nIHByb3RvY29sIHVzZXMgc29tZSBkYXRhIHRvIHByb3ZpZGUgZW5jb2Rpbmcg
b3ZlcmhlYWQgd2hpY2gKaXMgbm90IGNhcnJpZWQgb3ZlciB0aGUgVGh1bmRlcmJvbHQgMyBsaW5r
IHJlZHVjaW5nIHRoZSBjb25zdW1lZApiYW5kd2lkdGggYnkgcm91Z2hseSAyMCBwZXJjZW50IChE
aXNwbGF5UG9ydCkgb3IgMS41IHBlcmNlbnQgKFBDSQpFeHByZXNzIEdlbiAzKSIKClswXSBodHRw
czovL3RodW5kZXJib2x0dGVjaG5vbG9neS5uZXQvc2l0ZXMvZGVmYXVsdC9maWxlcy9UaHVuZGVy
Ym9sdDNfVGVjaEJyaWVmX0ZJTkFMLnBkZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
