Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 815351071C6
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 12:54:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A8C56E2D6;
	Fri, 22 Nov 2019 11:54:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677DC6E29E;
 Fri, 22 Nov 2019 11:54:39 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id 23so4147363otf.2;
 Fri, 22 Nov 2019 03:54:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C4mw3VH3FIHQmO15qFz9D30nizXldnLunLKZhMRaWvs=;
 b=DtY4x/Ttboi+XYZdQd9gIvaaFl2URmNPywwDzHuCCljClOJbRKc5BSoTrGlvdsWkO6
 XeAnOXz8wpsLTmQ0rrYDCg3xY3Q/ByHSQ6hUEmB+fNP27JbAzBnuov2U7TPNdSPpVAS2
 khqppnVwUb9d97Io24x4TmPdjnJ5Ce/yy04DbSRWox60KxEqfvXJxBhClyx+W0tdMnPg
 sPJp55ZVEjDbofiMsgySLR9dg2quVOY34vzOeLOh1hygcCFnC47w4kdwcZmfx6wvzCyw
 KOy7u6nbJlUU1nkLn2XK3r5cowf+bm3CrjNqDkip7JbaJXxlwaHqu0/1cKBVMWj7gJib
 9DBQ==
X-Gm-Message-State: APjAAAXTA1+H6Pbt98ylH4Zx11j88nwbtRHzjedO/2sTtd1d6KWvHsgM
 M/K7P+nn946JTT5MzLTbjaPJIFqzzxD9RBJFltc=
X-Google-Smtp-Source: APXvYqwXetKL36FIRsxPYnOnyYAS3YKHZ/sbHgfrxxTdSkSPdYmAXFC+StyAtNbf4Peqs9hEtloUH7Ir06gvcptDfkE=
X-Received: by 2002:a9d:7d01:: with SMTP id v1mr9895024otn.167.1574423678614; 
 Fri, 22 Nov 2019 03:54:38 -0800 (PST)
MIME-Version: 1.0
References: <CAJZ5v0hkT-fHFOQKzp2qYPyR+NUa4c-G-uGLPZuQxqsG454PiQ@mail.gmail.com>
 <CACO55ttTPi2XpRRM_NYJU5c5=OvG0=-YngFy1BiR8WpHkavwXw@mail.gmail.com>
 <CAJZ5v0h=7zu3A+ojgUSmwTH0KeXmYP5OKDL__rwkkWaWqcJcWQ@mail.gmail.com>
 <20191121112821.GU11621@lahna.fi.intel.com>
 <CAJZ5v0hQhj5Wf+piU11abC4pF26yM=XHGHAcDv8Jsgdx04aN-w@mail.gmail.com>
 <20191121114610.GW11621@lahna.fi.intel.com>
 <20191121125236.GX11621@lahna.fi.intel.com>
 <CAJZ5v0iMwhudB7O0hR-6KfRfa+_iGOY=t0Zzeh6+9OiTzeYJfA@mail.gmail.com>
 <20191121194942.GY11621@lahna.fi.intel.com>
 <CAJZ5v0gyna0b135uxBVfNXgB9v-U9-93EYe0uzsr2BukJ9OtuA@mail.gmail.com>
 <20191122103637.GA11621@lahna.fi.intel.com>
 <CAJZ5v0gifnGZcKr6mgc6C2EfqX13OyJnOac0uDxYNKN=A0cgMg@mail.gmail.com>
 <CACO55tsN_B4Apk1sgMipU5FHRJ1vSPm8HdonrKxqm8Uuo9=6rQ@mail.gmail.com>
In-Reply-To: <CACO55tsN_B4Apk1sgMipU5FHRJ1vSPm8HdonrKxqm8Uuo9=6rQ@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 22 Nov 2019 12:54:26 +0100
Message-ID: <CAJZ5v0igbrDecX=KEfNGKMhAdM=DtDK9D=+VbeHJqWRtUE672w@mail.gmail.com>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
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
 Linux PCI <linux-pci@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@intel.com>,
 Linux PM <linux-pm@vger.kernel.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Mario Limonciello <Mario.Limonciello@dell.com>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMTI6MzQgUE0gS2Fyb2wgSGVyYnN0IDxraGVyYnN0QHJl
ZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMTI6MzAgUE0gUmFm
YWVsIEouIFd5c29ja2kgPHJhZmFlbEBrZXJuZWwub3JnPiB3cm90ZToKPiA+CgpbY3V0XQoKPiA+
Cj4KPiB0aGUgaXNzdWUgaXMgbm90IEFNTCByZWxhdGVkIGF0IGFsbCBhcyBJIGFtIGFibGUgdG8g
cmVwcm9kdWNlIHRoaXMKPiBpc3N1ZSB3aXRob3V0IGhhdmluZyB0byBpbnZva2UgYW55IG9mIHRo
YXQgYXQgYWxsLCBJIGp1c3QgbmVlZCB0byBwb2tlCj4gaW50byB0aGUgUENJIHJlZ2lzdGVyIGRp
cmVjdGx5IHRvIGN1dCB0aGUgcG93ZXIuCgpTaW5jZSB0aGUgcmVnaXN0ZXIgaXMgbm90IGRvY3Vt
ZW50ZWQsIHlvdSBkb24ndCBhY3R1YWxseSBrbm93IHdoYXQKZXhhY3RseSBoYXBwZW5zIHdoZW4g
aXQgaXMgd3JpdHRlbiB0by4KCllvdSBiYXNpY2FsbHkgYXJlIHNheWluZyBzb21ldGhpbmcgbGlr
ZSAiaWYgSSB3cml0ZSBhIHNwZWNpZmljIHZhbHVlCnRvIGFuIHVuZG9jdW1lbnRlZCByZWdpc3Rl
ciwgdGhhdCBtYWtlcyB0aGluZ3MgZmFpbCIuICBBbmQgeWVzLAp3cml0aW5nIHRoaW5ncyB0byB1
bmRvY3VtZW50ZWQgcmVnaXN0ZXJzIGlzIGxpa2VseSB0byBjYXVzZSBmYWlsdXJlIHRvCmhhcHBl
biwgaW4gZ2VuZXJhbC4KClRoZSBwb2ludCBpcyB0aGF0IHRoZSBrZXJuZWwgd2lsbCBuZXZlciB3
cml0ZSBpbnRvIHRoaXMgcmVnaXN0ZXIgYnkgaXRzZWxmLgoKPiBUaGUgcmVnaXN0ZXIgaXMgbm90
IGRvY3VtZW50ZWQsIGJ1dCBlZmZlY3RpdmVseSB3aGF0IHRoZSBBTUwgY29kZSBpcyB3cml0aW5n
IHRvIGFzIHdlbGwuCgpTbyB0aGF0IEFNTCBjb2RlIGlzIHByb2JsZW1hdGljLiAgSXQgZXhwZWN0
cyB0aGUgd3JpdGUgdG8gZG8gc29tZXRoaW5nCnVzZWZ1bCwgYnV0IHRoYXQncyBub3QgdGhlIGNh
c2UuICBXaXRob3V0IHRoZSBBTUwsIHRoZSByZWdpc3RlciB3b3VsZApub3QgaGF2ZSBiZWVuIHdy
aXR0ZW4gdG8gYXQgYWxsLgoKPiBPZiBjb3Vyc2UgaXQgbWlnaHQgYWxzbyBiZSB0aGF0IHRoZSBj
b2RlIEkgd2FzIHRlc3RpbmcgaXQgd2FzIGRvaW5nCj4gdGhpbmdzIGluIGEgbm9uIGNvbmZvcm1h
bnQgd2F5IGFuZCBJIGp1c3QgaGl0IGEgZGlmZmVyZW50IGlzc3VlIGFzCj4gd2VsbCwgYnV0IGlu
IHRoZSBlbmQgSSBkb24ndCB0aGluayB0aGF0IHRoZSBBTUwgY29kZSBpcyB0aGUgcm9vdCBjYXVz
ZQo+IG9mIGFsbCBvZiB0aGF0LgoKSWYgQU1MIGlzIG5vdCBpbnZvbHZlZCBhdCBhbGwsIHRoaW5n
cyB3b3JrLiAgWW91J3ZlIGp1c3Qgc2FpZCBzbyBpbgphbm90aGVyIG1lc3NhZ2UgaW4gdGhpcyB0
aHJlYWQsIHF1b3RpbmcgdmVyYmF0aW06CgoieWVzLiBJbiBteSBwcmV2aW91cyB0ZXN0aW5nIEkg
d2FzIHBva2luZyBpbnRvIHRoZSBQQ0kgcmVnaXN0ZXJzIG9mIHRoZQpicmlkZ2UgY29udHJvbGxl
ciBhbmQgdGhlIEdQVSBkaXJlY3RseSBhbmQgdGhhdCBuZXZlciBjYXVzZWQgYW55Cmlzc3VlcyBh
cyBsb25nIGFzIEkgbGltaXRlZCBpdCB0byBwdXR0aW5nIHRoZSBkZXZpY2VzIGludG8gRDNob3Qu
IgoKWW91IGNhbm5vdCBjbGFpbSBhIGhhcmR3YXJlIGJ1ZyBqdXN0IGJlY2F1c2UgYSB3cml0ZSB0
byBhbgp1bmRvY3VtZW50ZWQgcmVnaXN0ZXIgZnJvbSBBTUwgY2F1c2VzIHRoaW5ncyB0byBicmVh
ay4KCkZpcnN0LCB0aGF0IG1heSBiZSBhIGJ1ZyBpbiB0aGUgQU1MICh3aGljaCBpcyBub3QgdW5o
ZWFyZCBvZikuClNlY29uZCwgYW5kIHRoYXQgaXMgbW9yZSBsaWtlbHksIHRoZSBleHBlY3RhdGlv
bnMgb2YgdGhlIEFNTCBjb2RlIG1heQpub3QgYmUgbWV0IGF0IHRoZSB0aW1lIGl0IGlzIHJ1bi4K
CkFzc3VtaW5nIHRoZSBsYXR0ZXIsIHRoZSByb290IGNhdXNlIGlzIHJlYWxseSB0aGF0IHRoZSBr
ZXJuZWwgZXhlY3V0ZXMKdGhlIEFNTCBpbiBhIGhhcmR3YXJlIGNvbmZpZ3VyYXRpb24gaW4gd2hp
Y2ggdGhlIGV4cGVjdGF0aW9ucyBvZiB0aGF0CkFNTCBhcmUgbm90IG1ldC4KCldlIGFyZSBub3cg
dHJ5aW5nIHRvIHVuZGVyc3RhbmQgd2hhdCB0aG9zZSBleHBlY3RhdGlvbnMgbWF5IGJlIGFuZCBz
bwpob3cgdG8gY2F1c2UgdGhlbSB0byBiZSBtZXQuCgpZb3VyIG9ic2VydmF0aW9uIHRoYXQgdGhl
IGlzc3VlIGNhbiBiZSBhdm9pZGVkIGlmIHRoZSBHUFUgaXMgbm90IHB1dAppbnRvIEQzaG90IGJ5
IGEgUE1DU1Igd3JpdGUgaXMgYSBzdGVwIGluIHRoYXQgZGlyZWN0aW9uIGFuZCBpdCBpcyBhCmdv
b2QgZmluZGluZy4gIFRoZSBpbmZvcm1hdGlvbiBmcm9tIE1pa2EgYmFzZWQgb24gdGhlIEFTTCBh
bmFseXNpcyBpcwpoZWxwZnVsIHRvby4gIExldCdzIG5vdCBqdW1wIHRvIHByZW1hdHVyZSBjb25j
bHVzaW9ucyB0b28gcXVpY2tseSwKdGhvdWdoLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
