Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0B0AE423
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 08:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 181486E820;
	Tue, 10 Sep 2019 06:57:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6724F89E1A
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 21:07:58 +0000 (UTC)
Received: from mail-io1-f70.google.com ([209.85.166.70])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <alex.hung@canonical.com>) id 1i7Qt9-0000hV-F5
 for dri-devel@lists.freedesktop.org; Mon, 09 Sep 2019 21:07:55 +0000
Received: by mail-io1-f70.google.com with SMTP id z12so19112509iop.17
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Sep 2019 14:07:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LH+uWheH+pNq+IGQq8MSCBunzHNQ2Gt4vqh/uMjSZaM=;
 b=sa0T5taGbOAfbs/D01Fw7X5VjWvYlJQYHLzhFxURw9sg5JPb6Y6lGle6BtpK8hd1Ac
 lGdhKtr5jwyLf99ckgcPEmplGKBMi8bFvqi3fr+HC9NYUmtgnAyFfxRFbaFESO3k5yFg
 ysKQzmxxNK9lKF5R+ll/WD7gfF/x3XmPUYW649mOFX4fcpF/n969lfE0rzJ/Y89yGimL
 Ylso1YkDePMpMERayxLIk1JCTlCPdQgUoTW6L9FLrKSivols/033zpvPhC60Nf7l1061
 E1GRvqClDgRUPdiOwH0a8nm2fllz5/hzYv58QoZ2GhuBdDE5KdAT4jzBJ38K9nQq2JXa
 ADGA==
X-Gm-Message-State: APjAAAWJP3b3syjsqJMJsmQpE6D9gVwP032i9OJ1YtnrdgB1n9lt6V3o
 XWtDOp7VboXuqs44H0A0qmo1LJzAVVDCcH439VlO6DaaO//YNWZaqhY2Au7LvU84Se+iAEMU3ed
 1RMrTcoKGRxXv87fmfY7/+M0mnKl2QXs0A4b/xnq41vHitdxs4ujLDfBBn/7GLg==
X-Received: by 2002:a6b:c903:: with SMTP id z3mr16805275iof.204.1568063274537; 
 Mon, 09 Sep 2019 14:07:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxKNWzQ0qeqd46TPzcljhuQDj1lX4oa7QzaJ3YBpbWvIApG/65YcNAjmq5SCNk2sgQ90kAmSPWN8hgTzP4YqYw=
X-Received: by 2002:a6b:c903:: with SMTP id z3mr16805248iof.204.1568063274320; 
 Mon, 09 Sep 2019 14:07:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190814213118.28473-1-kherbst@redhat.com>
 <2215840.qs0dBhReda@kreacher>
 <CACO55ttC-o9bKU7nHNcfjm2YnffiupQ7UHUt7BYL3fu+yEyTbw@mail.gmail.com>
 <5228680.jBuKzensJx@kreacher>
In-Reply-To: <5228680.jBuKzensJx@kreacher>
From: Alex Hung <alex.hung@canonical.com>
Date: Mon, 9 Sep 2019 22:07:42 +0100
Message-ID: <CAJ=jquaLthK556Lqk-zc3GCOus90HoGs66tA=d9a1aju7iNpPw@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 1/7] Revert "ACPI / OSI: Add OEM _OSI string to
 enable dGPU direct output"
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
X-Mailman-Approved-At: Tue, 10 Sep 2019 06:57:58 +0000
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
Cc: Karol Herbst <kherbst@redhat.com>,
 Mario Limonciello <mario.limonciello@dell.com>,
 nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ACPI <linux-acpi@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgNSwgMjAxOSBhdCA1OjI2IFBNIFJhZmFlbCBKLiBXeXNvY2tpIDxyandAcmp3
eXNvY2tpLm5ldD4gd3JvdGU6Cj4KPiBPbiBUaHVyc2RheSwgU2VwdGVtYmVyIDUsIDIwMTkgNTo1
MToyMyBQTSBDRVNUIEthcm9sIEhlcmJzdCB3cm90ZToKPiA+IGlzIHRoZXJlIGFueSB1cGRhdGUg
b24gdGhlIHRlc3Rpbmcgd2l0aCBteSBwYXRjaGVzPyBPbiB0aGUgaGFyZHdhcmUgSQo+ID4gaGFk
IGFjY2VzcyB0byB0aG9zZSBwYXRjaGVzIGhlbHBlZCwgYnV0IEkgY2FuJ3Qga25vdyBpZiBpdCBh
bHNvIGhlbHBlZAo+ID4gb24gdGhlIGhhcmR3YXJlIGZvciB3aGljaCB0aG9zZSB3b3JrYXJvdW5k
cyB3aGVyZSBhY3R1YWxseSBhZGRlZC4KPgo+IEFsZXggSHVuZyBhbmQgTWFyaW8gbmVlZCB0byBh
bnN3ZXIgdGhpcyBxdWVzdGlvbiBJIHRoaW5rLgoKU29ycnkgZm9yIHRha2luZyBhIGxvbmcgdGlt
ZS4gSSBkb24ndCBoYXZlIGZ1bGwgdGVzdGluZyByZXN1bHRzIHlldApidXQgd2UgZm91bmQgYXQg
bGVhc3QgYSByZWdyZXNzaW9uIG9jY3VycmVkIHdpdGggX09TSSBzdHJpbmcgcmVtb3ZlZCAtCml0
IGlzIG5vdCBvbiBuVmlkaWEgaGFyZHdhcmUgYnV0IG9uIEFNRCBQWCBvbmUuCgpJIHdpbGwgdHJ5
IHRvIGNvbGxlY3QgYW5kIHNoYXJlIG1vcmUgZGV0YWlscy4KCj4KPiA+IE9uIE1vbiwgQXVnIDE5
LCAyMDE5IGF0IDExOjUyIEFNIFJhZmFlbCBKLiBXeXNvY2tpIDxyandAcmp3eXNvY2tpLm5ldD4g
d3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFRodXJzZGF5LCBBdWd1c3QgMTUsIDIwMTkgMTI6NDc6MzUg
QU0gQ0VTVCBEYXZlIEFpcmxpZSB3cm90ZToKPiA+ID4gPiBPbiBUaHUsIDE1IEF1ZyAyMDE5IGF0
IDA3OjMxLCBLYXJvbCBIZXJic3QgPGtoZXJic3RAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiA+ID4g
Pgo+ID4gPiA+ID4gVGhpcyByZXZlcnRzIGNvbW1pdCAyODU4NmE1MWVlYTY2NmQ1NTMxYmNhZWYy
ZjY4ZTRhYmJkODcyNDJjLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoZSBvcmlnaW5hbCBjb21taXQg
bWVzc2FnZSBkaWRuJ3QgZXZlbiBtYWtlIHNlbnNlLiBBTUQgX2RvZXNfIHN1cHBvcnQgaXQgYW5k
Cj4gPiA+ID4gPiBpdCB3b3JrcyB3aXRoIE5vdXZlYXUgYXMgd2VsbC4KPiA+ID4gPiA+Cj4gPiA+
ID4gPiBBbHNvIHdoYXQgd2FzIHRoZSBpc3N1ZSBiZWluZyBzb2x2ZWQgaGVyZT8gTm8gcmVmZXJl
bmNlcyB0byBhbnkgYnVncyBhbmQgbm90Cj4gPiA+ID4gPiBldmVuIGV4cGxhaW5pbmcgYW55IGlz
c3VlIGF0IGFsbCBpc24ndCB0aGUgd2F5IHdlIGRvIHRoaW5ncy4KPiA+ID4gPiA+Cj4gPiA+ID4g
PiBBbmQgZXZlbiBpZiBpdCBtZWFucyBhIG11eGVkIGRlc2lnbiwgdGhlbiB0aGUgZml4IGlzIHRv
IG1ha2UgaXQgd29yayBpbnNpZGUgdGhlCj4gPiA+ID4gPiBkcml2ZXIsIG5vdCBhZGRpbmcgc29t
ZSBoYWNreSB3b3JrYXJvdW5kIHRocm91Z2ggQUNQSSB0cmlja3MuCj4gPiA+ID4gPgo+ID4gPiA+
ID4gQW5kIHdoYXQgb3V0IG9mIHRyZWUgZHJpdmVycyBkbyBvciBkbyBub3Qgc3VwcG9ydCB3ZSBk
b24ndCBjYXJlIG9uZSBiaXQgYW55d2F5Lgo+ID4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+IEkgdGhp
bmsgdGhlIHJldmVydHMgc2hvdWxkIGJlIG1lcmdlZCB2aWEgUmFmYWVsJ3MgdHJlZSBhcyB0aGUg
b3JpZ2luYWwKPiA+ID4gPiBwYXRjaGVzIHdlbnQgaW4gdmlhIHRoZXJlLCBhbmQgd2Ugc2hvdWxk
IGdldCB0aGVtIGluIGFzYXAuCj4gPiA+ID4KPiA+ID4gPiBBY2tlZC1ieTogRGF2ZSBBaXJsaWUg
PGFpcmxpZWRAcmVkaGF0LmNvbT4KPiA+ID4KPiA+ID4gVGhlIF9PU0kgc3RyaW5ncyBhcmUgdG8g
YmUgZHJvcHBlZCB3aGVuIGFsbCBvZiB0aGUgbmVlZGVkIHN1cHBvcnQgaXMgdGhlcmUgaW4KPiA+
ID4gZHJpdmVycywgc28gdGhleSBzaG91bGQgZ28gYXdheSBhbG9uZyB3aXRoIHRoZSByZXF1aXNp
dGUgZHJpdmVyIGNoYW5nZXMuCj4gPiA+Cj4gPgo+ID4gdGhhdCBnb2VzIGJlc2lkZSB0aGUgcG9p
bnQuIGZpcm13YXJlIGxldmVsIHdvcmthcm91bmRzIGZvciBHUFUgZHJpdmVyCj4gPiBpc3N1ZXMg
d2VyZSBwdXNoZWQgd2l0aG91dCBjb25zdWx0aW5nIHdpdGggdXBzdHJlYW0gR1BVIGRldmVsb3Bl
cnMuCj4gPiBUaGF0J3Mgc29tZXRoaW5nIHdoaWNoIHNob3VsZG4ndCBoYXZlIGhhcHBlbmVkIGlu
IHRoZSBmaXJzdCBwbGFjZS4gQW5kCj4gPiB5ZXMsIEkgYW0gcGVyc29uYWxseSBhbm5veWVkIGJ5
IHRoZSBmYWN0LCB0aGF0IHBlb3BsZSBrbm93IGFib3V0Cj4gPiBpc3N1ZXMsIGJ1dCBpbnN0ZWFk
IG9mIGNvbnRhY3RpbmcgdGhlIHByb3BlciBwZXJzb25zIGFuZCB3b3JraW5nIG9uIGEKPiA+IHBy
b3BlciBmaXgsIHdlIGVuZCB1cCB3aXRoIHN0dXBpZCBmaXJtd2FyZSBsZXZlbCB3b3JrYXJvdW5k
cy4gSSBjYW4ndAo+ID4gc2VlIHdoeSB3ZSBldmVyIHdvdWxkIGhhdmUgd2FudGVkIHN1Y2ggd29y
a2Fyb3VuZHMgaW4gdGhlIGZpcnN0IHBsYWNlLgo+ID4KPiA+IEFuZCBJIHdvdWxkIGJlIG11Y2gg
aGFwcGllciBpZiB0aGUgbmV4dCB0aW1lIHNvbWV0aGluZyBsaWtlIHRoYXQgY29tZXMKPiA+IHVw
LCB0aGF0IHRoZSBkcm0gbWFpbGluZyBsaXN0IHdpbGwgYmUgY29udGFjdGVkIGFzIHdlbGwgb3Ig
c29tZWJvZHkKPiA+IGludm9sdmVkLgo+ID4KPiA+IFdlIGNvdWxkIGhhdmUgYWxzbyBqdXN0IGRp
c2FibGUgdGhlIGZlYXR1cmUgaW5zaWRlIHRoZSBkcml2ZXIgKGFuZAo+ID4gcHJvYmFibHkgd2Ug
c2hvdWxkIGhhdmUgZG9uZSB0aGF0IGEgbG9uZyB0aW1lIGFnbywgc28gdGhhdCBpcwo+ID4gZXNz
ZW50aWFsbHkgb3VyIGZhdWx0LCBidXQgc3RpbGwuLi4uKQo+ID4KPiA+ID4gSSdtIGFsbCBmb3Ig
ZHJvcHBpbmcgdGhlbiB3aGVuIHRoYXQncyB0aGUgY2FzZSwgc28gcGxlYXNlIGZlZWwgZnJlZSB0
byBhZGQgQUNLcwo+ID4gPiBmcm9tIG1lIHRvIHRoZSBwYXRjaGVzIGluIHF1ZXN0aW9uIGF0IHRo
YXQgcG9pbnQuCj4gPiA+Cj4gPiA+IENoZWVycywKPiA+ID4gUmFmYWVsCj4gPiA+Cj4gPiA+Cj4g
PiA+Cj4gPgo+Cj4KPgo+CgoKLS0gCkNoZWVycywKQWxleCBIdW5nCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
