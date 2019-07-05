Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84429606A8
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 15:37:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 674466E4C1;
	Fri,  5 Jul 2019 13:37:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 283576E4C1
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 13:37:03 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id x15so8902176wmj.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2019 06:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+bjvEZBdy6+xUSKD43A4ZHbyMtIGuvaGpR1zC7s3iwk=;
 b=H4BzJLr8RAjmAhWxqGopEkEnATezD4UOR1mjZ0pMjqePwl/M4NVwSDQQ3RQAixHJEL
 B8WHE7vztYnLUODhMeSYrYurBEupwhtReEEqwCvbt0+3IROfMcvRgUIuF2jpxGTau8Hm
 nxdHzab4SG3eriEFcAxqtBvUk3MI0nKmlu7XKikduk4Q/hwGWj9Tv+U8gdqw0144KZTp
 WIK5fI+7vOP2nKVYVv6IYTVMMiilAaQ/4IHi2Dnr5ODXlEFfokyNYC0uNzWI/c5u3nUi
 f3r+pMlojseIZRrMz7Ymp0VyVcFCX7Z+kE0oH4aArVn8dDIPxrIH2/Zn4CpjOFfziXpj
 Xz2g==
X-Gm-Message-State: APjAAAWvjuLLa0HzDA5TiZQG0ZOf7Fd+Zhr7QK2yaHcduTnol/K5ZbUg
 OnIRLVDaLlZgO8XPY/ULm8zlPFRXCz306QR6yOjiF7Ss
X-Google-Smtp-Source: APXvYqz69AsOTyIIaMLrLAgetY0u4G69Pje0sHUfV2YEQx9QQmk3xOkwDkQRKPv1caiRFwhSl4EbJcYmaOkfcXOjaBs=
X-Received: by 2002:a05:600c:20d:: with SMTP id
 13mr3608042wmi.141.1562333821717; 
 Fri, 05 Jul 2019 06:37:01 -0700 (PDT)
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
In-Reply-To: <eee4eea0-ad27-9d05-192d-c1207da5d0bc@daenzer.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 5 Jul 2019 09:36:49 -0400
Message-ID: <CADnq5_PHyGcjeOygwnuXgR_DpS4_c2G=KgykRaBHj6PZcEmP7g@mail.gmail.com>
Subject: Re: Why is Thunderbolt 3 limited to 2.5 GT/s on Linux?
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+bjvEZBdy6+xUSKD43A4ZHbyMtIGuvaGpR1zC7s3iwk=;
 b=Waawiav40hqltnF+5roi6rW+Q/jMFkg+8LrNFMVXqtXsdNVv2s+yB54EA6qwYNfdtQ
 buPvWyXHi/zyE9qIwFs0XAJ9xhOLILLIolfRRhceeimmSusfk+6BJqqe1ONueIobiuN3
 u0q/kXWVGGslxtIvmklJLZH97/69YTMV6iI5FYK9Lfsk9+KhJWa6RXEIUy562Gn9KO0/
 qgovIcmFIo4o2V+ulRqT+doRv2x1SXiuQ3HZCWKxKUEm0j/eD4V6W7N+F+2VqhFJrWQ9
 o+N/0Oa+efL/LFXEHiyj1RV6YB5BNig4v4XyEozLhLZ1T1D9hSfLSRDgpfPeHJqqm//H
 Tvag==
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgNCwgMjAxOSBhdCA2OjU1IEFNIE1pY2hlbCBEw6RuemVyIDxtaWNoZWxAZGFl
bnplci5uZXQ+IHdyb3RlOgo+Cj4gT24gMjAxOS0wNy0wMyAxOjA0IHAubS4sIFRpbXVyIEtyaXN0
w7NmIHdyb3RlOgo+ID4KPiA+Pj4gVGhlcmUgbWF5IGJlIG90aGVyIGZhY3RvcnMsIHllcy4gSSBj
YW4ndCBvZmZlciBhIGdvb2QgZXhwbGFuYXRpb24KPiA+Pj4gb24KPiA+Pj4gd2hhdCBleGFjdGx5
IGlzIGhhcHBlbmluZywgYnV0IGl0J3MgcHJldHR5IGNsZWFyIHRoYXQgYW1kZ3B1IGNhbid0Cj4g
Pj4+IHRha2UKPiA+Pj4gZnVsbCBhZHZhbnRhZ2Ugb2YgdGhlIFRCMyBsaW5rLCBzbyBpdCBzZWVt
ZWQgbGlrZSBhIGdvb2QgaWRlYSB0bwo+ID4+PiBzdGFydAo+ID4+PiBpbnZlc3RpZ2F0aW5nIHRo
aXMgZmlyc3QuCj4gPj4KPiA+PiBZZWFoLCBhY3R1YWxseSBpdCB3b3VsZCBiZSBjb25zaXN0ZW50
IHdpdGggfjE2LTMyIEtCIGdyYW51bGFyaXR5Cj4gPj4gdHJhbnNmZXJzIGJhc2VkIG9uIHlvdXIg
bWVhc3VyZW1lbnRzIGFib3ZlLCB3aGljaCBpcyBwbGF1c2libGUuIFNvCj4gPj4gbWFraW5nIHN1
cmUgdGhhdCB0aGUgZHJpdmVyIGRvZXNuJ3QgYXJ0aWZpY2lhbGx5IGxpbWl0IHRoZSBQQ0llCj4g
Pj4gYmFuZHdpZHRoIG1pZ2h0IGluZGVlZCBoZWxwLgo+ID4KPiA+IENhbiB5b3UgcG9pbnQgbWUg
dG8gdGhlIHBsYWNlIHdoZXJlIGFtZGdwdSBkZWNpZGVzIHRoZSBQQ0llIGxpbmsgc3BlZWQ/Cj4g
PiBJJ2QgbGlrZSB0byB0cnkgdG8gdHdlYWsgaXQgYSBsaXR0bGUgYml0IHRvIHNlZSBpZiB0aGF0
IGhlbHBzIGF0IGFsbC4KPgo+IEknbSBub3Qgc3VyZSBvZmZoYW5kLCBBbGV4IG9yIGFueW9uZT8K
CmFtZGdwdV9kZXZpY2VfZ2V0X3BjaWVfaW5mbygpIGluIGFtZGdwdV9kZXZpY2UuYy4KCj4KPgo+
ID4+IE9UT0ggdGhpcyBhbHNvIGluZGljYXRlcyBhIHNpbWlsYXIgcG90ZW50aWFsIGZvciBpbXBy
b3ZlbWVudCBieSB1c2luZwo+ID4+IGxhcmdlciB0cmFuc2ZlcnMgaW4gTWVzYSBhbmQvb3IgdGhl
IGtlcm5lbC4KPiA+Cj4gPiBZZXMsIHRoYXQgc291bmRzIGxpa2UgaXQgd291bGQgYmUgd29ydGgg
bG9va2luZyBpbnRvLgo+ID4KPiA+IE91dCBvZiBjdXJpb3NpdHksIGlzIHRoZXJlIGEgcGVyZm9y
bWFjZSBkZWNyZWFzZSB3aXRoIHNtYWxsIHRyYW5zZmVycwo+ID4gb24gYSAibm9ybWFsIiBQQ0ll
IHBvcnQgdG9vLCBvciBpcyB0aGlzIHNwZWNpZmljIHRvIFRCMz8KPgo+IEl0J3Mgbm90IFRCMyBz
cGVjaWZpYy4gV2l0aCBhICJub3JtYWwiIDggR1QvcyB4MTYgcG9ydCwgSSBnZXQgYmV0d2Vlbgo+
IH4yNTYgTUIvcyBmb3IgNCBLQiB0cmFuc2ZlcnMgYW5kIH4xMiBHQi9zIGZvciA0IE1CIHRyYW5z
ZmVycyAoZXZlbgo+IGxhcmdlciB0cmFuc2ZlcnMgc2VlbSBzbGlnaHRseSBzbG93ZXIgYWdhaW4p
LiBUaGlzIGFsc28gbG9va3MgY29uc2lzdGVudAo+IHdpdGggeW91ciBtZWFzdXJlbWVudHMgaW4g
dGhhdCB0aGUgcHJhY3RpY2FsIGxpbWl0IHNlZW1zIHRvIGJlIGFyb3VuZAo+IDc1JSBvZiB0aGUg
dGhlb3JldGljYWwgYmFuZHdpZHRoLgo+Cj4KPiAtLQo+IEVhcnRobGluZyBNaWNoZWwgRMOkbnpl
ciAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgIGh0dHBzOi8vd3d3LmFtZC5jb20KPiBMaWJy
ZSBzb2Z0d2FyZSBlbnRodXNpYXN0ICAgICAgICAgICAgIHwgICAgICAgICAgICAgTWVzYSBhbmQg
WCBkZXZlbG9wZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
