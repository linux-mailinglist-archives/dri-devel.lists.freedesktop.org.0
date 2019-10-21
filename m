Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7B0DE72C
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 10:55:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE16388784;
	Mon, 21 Oct 2019 08:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A705A88784;
 Mon, 21 Oct 2019 08:55:00 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id d140so6068519oib.5;
 Mon, 21 Oct 2019 01:55:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P/ILjmf9K7qy+5ndurAox0KwdPha8scfK03vxEE4NRY=;
 b=hJDHAncJ3pAT1lNewOQhJ+mXAJfaXdTf4kghIUDYG6qDXEwLMZULEYKEwwp38GGx2W
 g4X8wCl4dEkAuCEOHsGTolkHgWG8dg6fK2ucss6KaLIwkbRSz1S/62cJszIO6QRZZMxT
 SxUqRbYoIgqtMtbqYqZX2XE2k2zkwAFmqwAQODmK/4MACjGeeVVzxXvPeodtI+xU9RnJ
 B9aB5HepLqAvZh+FeAsL7HCgmwCNRY4hoYDVKkb6RNpPWGdQUIqGN+dOSTvbnVEygHV+
 GKTkQ4bQTjLjx1SWTjZ7UADHw8A1nGXTthQzVrcXbzS+aazXTmvPXIH9zFOwaEQArCdm
 fbDg==
X-Gm-Message-State: APjAAAVj8Pu876pMIaDJ/pIKASBA3rowLAC7oTt2ldczOa2ue3vvVCKZ
 2h1+E1TLPq0wDwy3hIRgXZ9OCfpEOl3AkK1iWyI=
X-Google-Smtp-Source: APXvYqxjzY5Z9AlzOzvJ1XuK2u9xTXSln0v5M1CtCTChjomBuQeW7TgO9aX3S6FSb4eoCSqoL9ysnO+NpbIvsAV6Oss=
X-Received: by 2002:aca:5885:: with SMTP id
 m127mr18881140oib.110.1571648099816; 
 Mon, 21 Oct 2019 01:54:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190814213118.28473-1-kherbst@redhat.com>
 <2215840.qs0dBhReda@kreacher>
 <CACO55ttC-o9bKU7nHNcfjm2YnffiupQ7UHUt7BYL3fu+yEyTbw@mail.gmail.com>
 <5228680.jBuKzensJx@kreacher>
 <CAJ=jquZLU2=yxayGCs=XGghxdMMre6qAWRY0Q4VErjBGqeWdjQ@mail.gmail.com>
 <CAJZ5v0hogSM3OgfJ0GFn7+BYwxR05Hb5ZMLo=NiB2wmpu=qeug@mail.gmail.com>
 <CACO55tvAyE1t2Bm8J=Yb_Gi5PDAgof=mRsJAKHFxOvEZpV-qGg@mail.gmail.com>
In-Reply-To: <CACO55tvAyE1t2Bm8J=Yb_Gi5PDAgof=mRsJAKHFxOvEZpV-qGg@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 21 Oct 2019 10:54:48 +0200
Message-ID: <CAJZ5v0hedXR13mw2FANuMNNOx0XmXiUUTus5C14Y-ADGteM4hA@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 1/7] Revert "ACPI / OSI: Add OEM _OSI string to
 enable dGPU direct output"
To: Karol Herbst <kherbst@redhat.com>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 nouveau <nouveau@lists.freedesktop.org>,
 Mario Limonciello <mario.limonciello@dell.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ACPI <linux-acpi@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMTA6NDggQU0gS2Fyb2wgSGVyYnN0IDxraGVyYnN0QHJl
ZGhhdC5jb20+IHdyb3RlOgo+Cj4gZnlpOiBJIGRlY2lkZWQgdG8gZ28gZm9yIGEgZGlmZmVyZW50
IHdvcmthcm91bmQgdG8gZml4IHRoZSBydW5wbQo+IGlzc3VlcyBvYnNlcnZlZCB3aXRoIG52aWRp
YSBncHVzIHdpdGggbm91dmVhdSBpbiB0aGUgInBjaTogcHJldmVudAo+IHB1dHRpbmcgbnZpZGlh
IEdQVXMgaW50byBsb3dlciBkZXZpY2Ugc3RhdGVzIG9uIGNlcnRhaW4gaW50ZWwgYnJpZGdlcyIK
PiB0aHJlYWQKCk9LLCBJJ3ZlIHNlZW4gdGhhdC4KCj4gdGhhdCdzIG9uIHRoZSBwY2kgYW5kIHBt
IG1haWxpbmcgbGlzdC4gTWF5YmUgaXQgbWFrZXMgc2Vuc2UgdG8gd2FpdAo+IGZvciB0aGF0IHRv
IGxhbmQgYmVmb3JlIGFjdHVhbGx5IHJlbW92aW5nIHRoZSBBQ1BJIHdvcmthcm91bmRzIGhlcmU/
CgpTb3VuZHMgcmVhc29uYWJsZS4KCj4gVGhlIHdvcmthcm91bmQgSSBoYWQgaW4gdGhpcyBzZXJp
ZXMgZGlkbid0IHNlZW0gdG8gYmUgcmVsaWFibGUgZW5vdWdoLAo+IHNvIEkgZGl0Y2hlZCB0aGF0
IGFwcHJvYWNoZWQuCgpPSywgcGxlYXNlIGxldCBtZSBrbm93IHdoZW4gdGhlIF9PU0kgc3RyaW5n
IGluIHF1ZXN0aW9uIGNhbiBiZSBkcm9wcGVkLgoKPiBPbiBNb24sIE9jdCAyMSwgMjAxOSBhdCAx
MDoxNCBBTSBSYWZhZWwgSi4gV3lzb2NraSA8cmFmYWVsQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4K
PiA+IE9uIE1vbiwgT2N0IDIxLCAyMDE5IGF0IDQ6MTQgQU0gQWxleCBIdW5nIDxhbGV4Lmh1bmdA
Y2Fub25pY2FsLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IFdlIGhhdmUgZG9uZSBzb21lIHRlc3Rz
IG9uIHRocmVlIG9mIEludGVsICsgblZpZGlhIGNvbmZpZ3VyYXRpb24KPiA+ID4gc3lzdGVtcyB3
aXRoIE9FTSBfT1NJIHN0cmluZ3MgcmVtb3ZlZCAtIHdoaWxlIHNvbWUgYnVncyBhcmUgc3RpbGwK
PiA+ID4gb2JzZXJ2ZWQsIGV4LiBvbmUgb3V0IG9mIHRocmVlIGhhcyBzdXNwZW5kL3Jlc3VtZSBp
c3N1ZXMsIG5vIHN5c3RlbQo+ID4gPiBjcmFzaGVzIHdlcmUgb2JzZXJ2ZWQgLSB0aGUgYmlnZ2Vz
dCBpc3N1ZSB0aGF0IHdvcnJpZXMgdXMuCj4gPiA+Cj4gPiA+IFRoZSBwb3NpdGl2ZSByZXN1bHRz
IGdpdmUgdXMgY29uZmlkZW50IHRvIGFjayB0aGUgcmVtb3ZhbCBvZiB0aGUgT0VNCj4gPiA+IF9P
U0kgc3RyaW5ncy4gV2hpbGUgb3VyIHRlc3RzIHdlcmUgbm90IGFibGUgdG8gY292ZXIgYWxsIHBv
c3NpYmxlIEkrTgo+ID4gPiBzeXN0ZW1zLCB3ZSBhcmUgc3VyZSB3ZSBjYW4gZml4IGlzc3VlcyBh
bG9uZyB0aGUgd2F5LiBJZiB0aGVyZSBhcmVuJ3QKPiA+ID4gc3lzdGVtcyB0aGF0IGNhbm5vdCBi
ZSBmaXhlZCB3aXRob3V0IHRoZXNlIE9FTSBfT1NJIHN0cmluZ3MsIHRoZXNlCj4gPiA+IHN0cmlu
Z3Mgc2hvdWxkIHByb2JhYmx5IGVuYWJsZSB3aXRoIERNSSBxdWlya3MgKHBvc3NpYmxlIGZ1dHVy
ZQo+ID4gPiBwYXRjaGVzKSBzbyB0aGV5IHdvbid0IGFmZmVjdCBvdGhlcnMuCj4gPiA+Cj4gPiA+
IEFja2VkLWJ5OiBBbGV4IEh1bmcgPGFsZXguaHVuZ0BjYW5vbmljYWwuY29tPgo+ID4KPiA+IE9L
LCB0aGFua3MhCj4gPgo+ID4gSSBjYW4gcXVldWUgdGhpcyB1cCBvciBpZiBpdCdzIGJldHRlciB0
byByb3V0ZSBpdCB0aHJvdWdoIHRoZSBEUk0KPiA+IHRyZWUsIHBsZWFzZSBkbyB0aGF0IChhbmQg
bGV0IG1lIGtub3cpLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
