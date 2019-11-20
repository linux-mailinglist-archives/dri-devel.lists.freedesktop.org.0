Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2958C10469B
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 23:29:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214E36EA5D;
	Wed, 20 Nov 2019 22:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E020D6EA5D;
 Wed, 20 Nov 2019 22:29:45 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id m15so1105163otq.7;
 Wed, 20 Nov 2019 14:29:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DGzPyxLr5Ay6yfeJ4SIhL2wKpa5Cl6ARb+65yasor8Y=;
 b=gWVI+kl9SSYV4c0EEb9MGNK+AEAX2mV1Lz01517/RZvY5rcWIPpXDQqH5PXkQosh6C
 ifWai8r0A0Cr35DS9A1MpnDbjGygUI37frWfQrrIJ1t5enZgTTGjC3nno/cArlI4Qc5m
 G8M3USO0OSDp0K6lORDK1G//L4NMzx98UQsjRlMJDT9lW9csu6A8nlHHZ5XcPD+2+RoZ
 eKZdIV7W33y5aM1/gN6HAgl5I/Tcd2D2yrXb24le7v26gV+FQO5ngPI8v1FP0P2LmmBD
 /UtPpMxq2GJxRivoFkm9kttl71Sb2xCAjPj/5z7O4C9DNJnTY2X+ojFf1WxE8crWfKYu
 l5cA==
X-Gm-Message-State: APjAAAVt28xLXvILvb3YOOX2pC3vznPZeH03lypFzmp/Wkp0kYEXh6GN
 JF2WYrx0xDhJpQv2PF7FSRhgpRLREvmPGY5Sw9HYVMdC
X-Google-Smtp-Source: APXvYqy+5B1uMvfcEzRSenoFSNtJMDeccEusFuvVsseAsLdM74Z0KG8lam60Ak6v61O2xJDRNnmZ4TlH+5v6N8Y9Z1k=
X-Received: by 2002:a05:6830:232a:: with SMTP id
 q10mr4003045otg.262.1574288985011; 
 Wed, 20 Nov 2019 14:29:45 -0800 (PST)
MIME-Version: 1.0
References: <20191120101816.GX11621@lahna.fi.intel.com>
 <CAJZ5v0g4vp1C+zHU5nOVnkGsOjBvLaphK1kK=qAT6b=mK8kpsA@mail.gmail.com>
 <20191120112212.GA11621@lahna.fi.intel.com>
 <20191120115127.GD11621@lahna.fi.intel.com>
 <CACO55tsfNOdtu5SZ-4HzO4Ji6gQtafvZ7Rm19nkPcJAgwUBFMw@mail.gmail.com>
 <CACO55tscD_96jUVts+MTAUsCt-fZx4O5kyhRKoo4mKoC84io8A@mail.gmail.com>
 <20191120120913.GE11621@lahna.fi.intel.com>
 <CACO55tsHy6yZQZ8PkdW8iPA7+uc5rdcEwRJwYEQ3iqu85F8Sqg@mail.gmail.com>
 <20191120151542.GH11621@lahna.fi.intel.com>
 <CACO55tvo3rbPtYJcioEgXCEQqVXcVAm-iowr9Nim=bgTdMjgLw@mail.gmail.com>
 <20191120155301.GL11621@lahna.fi.intel.com>
 <CAJZ5v0hkT-fHFOQKzp2qYPyR+NUa4c-G-uGLPZuQxqsG454PiQ@mail.gmail.com>
 <CACO55ttTPi2XpRRM_NYJU5c5=OvG0=-YngFy1BiR8WpHkavwXw@mail.gmail.com>
In-Reply-To: <CACO55ttTPi2XpRRM_NYJU5c5=OvG0=-YngFy1BiR8WpHkavwXw@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 20 Nov 2019 23:29:33 +0100
Message-ID: <CAJZ5v0h=7zu3A+ojgUSmwTH0KeXmYP5OKDL__rwkkWaWqcJcWQ@mail.gmail.com>
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

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMTA6NDAgUE0gS2Fyb2wgSGVyYnN0IDxraGVyYnN0QHJl
ZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMTA6MzcgUE0gUmFm
YWVsIEouIFd5c29ja2kgPHJhZmFlbEBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQs
IE5vdiAyMCwgMjAxOSBhdCA0OjUzIFBNIE1pa2EgV2VzdGVyYmVyZwo+ID4gPG1pa2Eud2VzdGVy
YmVyZ0BpbnRlbC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBXZWQsIE5vdiAyMCwgMjAxOSBh
dCAwNDozNzoxNFBNICswMTAwLCBLYXJvbCBIZXJic3Qgd3JvdGU6Cj4gPiA+ID4gT24gV2VkLCBO
b3YgMjAsIDIwMTkgYXQgNDoxNSBQTSBNaWthIFdlc3RlcmJlcmcKPiA+ID4gPiA8bWlrYS53ZXN0
ZXJiZXJnQGludGVsLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gT24gV2VkLCBOb3Yg
MjAsIDIwMTkgYXQgMDE6MTE6NTJQTSArMDEwMCwgS2Fyb2wgSGVyYnN0IHdyb3RlOgo+ID4gPiA+
ID4gPiBPbiBXZWQsIE5vdiAyMCwgMjAxOSBhdCAxOjA5IFBNIE1pa2EgV2VzdGVyYmVyZwo+ID4g
PiA+ID4gPiA8bWlrYS53ZXN0ZXJiZXJnQGludGVsLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+ID4K
PiA+ID4gPiA+ID4gPiBPbiBXZWQsIE5vdiAyMCwgMjAxOSBhdCAxMjo1ODowMFBNICswMTAwLCBL
YXJvbCBIZXJic3Qgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gPiBvdmVyYWxsLCB3aGF0IEkgcmVhbGx5
IHdhbnQgdG8ga25vdyBpcywgX3doeV8gZG9lcyBpdCB3b3JrIG9uIHdpbmRvd3M/Cj4gPiA+ID4g
PiA+ID4KPiA+ID4gPiA+ID4gPiBTbyBkbyBJIDstKQo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
ID4gPiBPciB3aGF0IGFyZSB3ZSBkb2luZyBkaWZmZXJlbnRseSBvbiBMaW51eCBzbyB0aGF0IGl0
IGRvZXNuJ3Qgd29yaz8gSWYKPiA+ID4gPiA+ID4gPiA+IGFueWJvZHkgaGFzIGFueSBpZGVhIG9u
IGhvdyB3ZSBjb3VsZCBkaWcgaW50byB0aGlzIGFuZCBmaWd1cmUgaXQgb3V0Cj4gPiA+ID4gPiA+
ID4gPiBvbiB0aGlzIGxldmVsLCB0aGlzIHdvdWxkIHByb2JhYmx5IGFsbG93IHVzIHRvIGdldCBj
bG9zZXIgdG8gdGhlIHJvb3QKPiA+ID4gPiA+ID4gPiA+IGNhdXNlPyBubz8KPiA+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiA+IEhhdmUgeW91IHRyaWVkIHRvIHVzZSB0aGUgYWNwaV9yZXZfb3ZlcnJp
ZGUgcGFyYW1ldGVyIGluIHlvdXIgc3lzdGVtIGFuZAo+ID4gPiA+ID4gPiA+IGRvZXMgaXQgaGF2
ZSBhbnkgZWZmZWN0Pwo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gQWxzbyBkaWQgeW91IHRy
eSB0byB0cmFjZSB0aGUgQUNQSSBfT04vX09GRigpIG1ldGhvZHM/IEkgdGhpbmsgdGhhdAo+ID4g
PiA+ID4gPiA+IHNob3VsZCBob3BlZnVsbHkgcmV2ZWFsIHNvbWV0aGluZy4KPiA+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBJIHRoaW5rIEkgZGlkIGluIHRoZSBwYXN0IGFuZCBp
dCBzZWVtZWQgdG8gaGF2ZSB3b3JrZWQsIHRoZXJlIGlzIGp1c3QKPiA+ID4gPiA+ID4gb25lIGJp
ZyBpc3N1ZSB3aXRoIHRoaXM6IGl0J3MgYSBEZWxsIHNwZWNpZmljIHdvcmthcm91bmQgYWZhaWss
IGFuZAo+ID4gPiA+ID4gPiB0aGlzIGlzc3VlIHBsYWd1ZXMgbm90IGp1c3QgRGVsbCwgYnV0IHdl
J3ZlIHNlZW4gaXQgb24gSFAgYW5kIExlbm92bwo+ID4gPiA+ID4gPiBsYXB0b3BzIGFzIHdlbGws
IGFuZCBJJ3ZlIGhlYXJkIGFib3V0IHVzZXJzIGhhdmluZyB0aGUgc2FtZSBpc3N1ZXMgb24KPiA+
ID4gPiA+ID4gQXN1cyBhbmQgTVNJIGxhcHRvcHMgYXMgd2VsbC4KPiA+ID4gPiA+Cj4gPiA+ID4g
PiBNYXliZSBpdCBpcyBub3QgYSB3b3JrYXJvdW5kIGF0IGFsbCBidXQgaW5zdGVhZCBpdCBzaW1w
bHkgZGV0ZXJtaW5lcwo+ID4gPiA+ID4gd2hldGhlciB0aGUgc3lzdGVtIHN1cHBvcnRzIFJURDMg
b3Igc29tZXRoaW5nIGxpa2UgdGhhdCAoSUlSQyBXaW5kb3dzIDgKPiA+ID4gPiA+IHN0YXJ0ZWQg
c3VwcG9ydGluZyBpdCkuIE1heWJlIERlbGwgYWRkZWQgY2hlY2sgZm9yIExpbnV4IGJlY2F1c2Ug
YXQgdGhhdAo+ID4gPiA+ID4gdGltZSBMaW51eCBkaWQgbm90IHN1cHBvcnQgaXQuCj4gPiA+ID4g
Pgo+ID4gPiA+Cj4gPiA+ID4gdGhlIHBvaW50IGlzLCBpdCdzIG5vdCBjaGVja2luZyBpdCBieSBk
ZWZhdWx0LCBzbyBieSBkZWZhdWx0IHlvdSBzdGlsbAo+ID4gPiA+IHJ1biBpbnRvIHRoZSB3aW5k
b3dzIDggY29kZXBhdGguCj4gPiA+Cj4gPiA+IFdlbGwgeW91IGNhbiBhZGQgdGhlIHF1aXJrIHRv
IGFjcGlfcmV2X2RtaV90YWJsZVtdIHNvIGl0IGdvZXMgdG8gdGhhdAo+ID4gPiBwYXRoIGJ5IGRl
ZmF1bHQuIFRoZXJlIGFyZSBhIGJ1bmNoIG9mIHNpbWlsYXIgZW50cmllcyBmb3IgRGVsbCBtYWNo
aW5lcy4KPiA+Cj4gPiBPSywgc28gdGhlICJMaW51eCBwYXRoIiB3b3JrcyBhbmQgdGhlIG90aGVy
IGRvZXNuJ3QuCj4gPgo+ID4gSSB0aG91Z2h0IHRoYXQgdGhpcyB3YXMgdGhlIG90aGVyIHdheSBh
cm91bmQsIHNvcnJ5IGZvciB0aGUgY29uZnVzaW9uLgo+ID4KPiA+ID4gT2YgY291cnNlIHRoaXMg
ZG9lcyBub3QgaGVscCB0aGUgbm9uLURlbGwgdXNlcnMgc28gd2Ugd291bGQgc3RpbGwgbmVlZAo+
ID4gPiB0byBmaWd1cmUgb3V0IHRoZSByb290IGNhdXNlLgo+ID4KPiA+IFJpZ2h0Lgo+ID4KPiA+
IFdoYXRldmVyIGl0IGlzLCB0aG91Z2gsIEFNTCBhcHBlYXJzIHRvIGJlIGludm9sdmVkIGluIGl0
IGFuZCBBRkFJQ1MKPiA+IHRoZXJlJ3Mgbm8gZXZpZGVuY2UgdGhhdCBpdCBhZmZlY3RzIGFueSBy
b290IHBvcnRzIHRoYXQgYXJlIG5vdAo+ID4gcG9wdWxhdGVkIHdpdGggTlZpZGlhIEdQVXMuCj4g
Pgo+Cj4gbGFzdCB3ZWVrIG9yIHNvIEkgZm91bmQgc3lzdGVtcyB3aGVyZSB0aGUgR1BVIHdhcyB1
bmRlciB0aGUgIlBDSQo+IEV4cHJlc3MgUm9vdCBQb3J0IiAobmFtZSBmcm9tIGxzcGNpKSBhbmQg
b24gdGhvc2Ugc3lzdGVtcyBhbGwgb2YgdGhhdAo+IHNlZW1zIHRvIHdvcmsuIFNvIEkgYW0gd29u
ZGVyaW5nIGlmIGl0J3MgaW5kZWVkIGp1c3QgdGhlIDB4MTkwMSBvbmUsCj4gd2hpY2ggYWxzbyBl
eHBsYWlucyBNaWthcyBjYXNlIHRoYXQgVGh1bmRlcmJvbHQgc3R1ZmYgd29ya3MgYXMgZGV2aWNl
cwo+IG5ldmVyIGdldCBwb3B1bGF0ZWQgdW5kZXIgdGhpcyBwYXJ0aWN1bGFyIGJyaWRnZSBjb250
cm9sbGVyLCBidXQgdW5kZXIKPiB0aG9zZSAiUm9vdCBQb3J0InMKCkl0IGFsd2F5cyBpcyBhIFBD
SWUgcG9ydCwgYnV0IGl0cyBsb2NhdGlvbiB3aXRoaW4gdGhlIFNvQyBtYXkgbWF0dGVyLgoKQWxz
byBzb21lIGN1c3RvbSBBTUwtYmFzZWQgcG93ZXIgbWFuYWdlbWVudCBpcyBpbnZvbHZlZCBhbmQg
dGhhdCBtYXkKYmUgbWFraW5nIHNwZWNpZmljIGFzc3VtcHRpb25zIG9uIHRoZSBjb25maWd1cmF0
aW9uIG9mIHRoZSBTb0MgYW5kIHRoZQpHUFUgYXQgdGhlIHRpbWUgb2YgaXRzIGludm9jYXRpb24g
d2hpY2ggdW5mb3J0dW5hdGVseSBhcmUgbm90IGtub3duIHRvCnVzLgoKSG93ZXZlciwgaXQgbG9v
a3MgbGlrZSB0aGUgQU1MIGludm9rZWQgdG8gcG93ZXIgZG93biB0aGUgR1BVIGZyb20KYWNwaV9w
Y2lfc2V0X3Bvd2VyX3N0YXRlKCkgZ2V0cyBjb25mdXNlZCBpZiBpdCBpcyBub3QgaW4gUENJIEQw
IGF0CnRoYXQgcG9pbnQsIHNvIGl0IGxvb2tzIGxpa2UgdGhhdCBBTUwgdHJpZXMgdG8gYWNjZXNz
IGRldmljZSBtZW1vcnkgb24KdGhlIEdQVSAoYmV5b25kIHRoZSBQQ0kgY29uZmlnIHNwYWNlKSBv
ciBzaW1pbGFyIHdoaWNoIGlzIG5vdAphY2Nlc3NpYmxlIGluIFBDSSBwb3dlciBzdGF0ZXMgYmVs
b3cgRDAuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
