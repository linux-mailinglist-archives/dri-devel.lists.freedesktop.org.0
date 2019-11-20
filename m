Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADFA1045EC
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 22:40:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 049CC6EA3F;
	Wed, 20 Nov 2019 21:40:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 776266EA30
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 21:40:46 +0000 (UTC)
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-_bRp8I-UMgK6zEkJcwIPYA-1; Wed, 20 Nov 2019 16:40:43 -0500
Received: by mail-qk1-f199.google.com with SMTP id p68so619584qkf.9
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 13:40:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EU4N8GpbC4c7LlzThQCdmuVdlky1o8wM503FH5Pe0D4=;
 b=UqaRCK39zRfDHVc9GZHoRhk/EjnVN51pv2/VBC+QQR3oNuFeKZATvry14QKNmzVfIH
 ds9QRbP3l1F/A7RtQQgyczwF6Qg6cDUZEyVdVwTyL2iiJl3KdvVolrxFOliW6B6ij7qM
 RS2Ni3mOkJAEeW0DALJGOva4Px6LrLbjQDGA1QghMr/VFd909k+wd0TYNkwu7yZfyiRq
 xr5AcE2fRU0uNWCShbnYJPei6vZ4XhcuwQcxb4Cl5gn64Aq6cq+lFpiUqqVb3FHiBjBk
 qvUXC3aXXF6s19AbvImhAevmnv5KJQ2Yi/YuYX6r8gsK7FOfhWPh+7oyWZwve8wPWW+Y
 nX2w==
X-Gm-Message-State: APjAAAX6BTRov3yn22V6NZiIkHnrlaPHW7MVJ7m4grtKH5ZCkfJb9Uzq
 N40nZKkpH5rlpFmGGp2a+MwJDyfp8CMNmjlmPRG6No+n2doVOszBJuNOFOAU4N7rc15tPLwYye0
 RPr+hSTC0cx1UbYInGl3yqokou2LU/fq1tX2rkOW25KIQ
X-Received: by 2002:ac8:5557:: with SMTP id o23mr5052347qtr.378.1574286043265; 
 Wed, 20 Nov 2019 13:40:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqw5XTIwl9ODy32VuneMOt1E61xccRRZ15L75RSP9d7Zx2Qa1IB4KTIGuXzijkXHVfuff9mnLwrRh/jCuBCSby4=
X-Received: by 2002:ac8:5557:: with SMTP id o23mr5052335qtr.378.1574286043027; 
 Wed, 20 Nov 2019 13:40:43 -0800 (PST)
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
In-Reply-To: <CAJZ5v0hkT-fHFOQKzp2qYPyR+NUa4c-G-uGLPZuQxqsG454PiQ@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 20 Nov 2019 22:40:31 +0100
Message-ID: <CACO55ttTPi2XpRRM_NYJU5c5=OvG0=-YngFy1BiR8WpHkavwXw@mail.gmail.com>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
To: "Rafael J. Wysocki" <rafael@kernel.org>
X-MC-Unique: _bRp8I-UMgK6zEkJcwIPYA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574286045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m0UeIrv+uB8K82TvFxL5crQCuye0zjRqSJxGE7ek3js=;
 b=Ry1ay44cvy9lfL0lzSb+IrbRAiCNEJ9CDXNKrdnl9qYXdWYIhuf9+EkIr3zKyyefjGYyJw
 NblIk4XzZzj8rrU25pXWjE/FIPU8L8ctTjMSEVTxwnM4oXUVQaKRco3M4eB1xenF+mK0yq
 CfuxididmllBp79sYwp898Sm5eQoWmM=
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
Cc: Linux PM <linux-pm@vger.kernel.org>, Linux PCI <linux-pci@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@intel.com>,
 Mario Limonciello <Mario.Limonciello@dell.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMTA6MzcgUE0gUmFmYWVsIEouIFd5c29ja2kgPHJhZmFl
bEBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgTm92IDIwLCAyMDE5IGF0IDQ6NTMgUE0g
TWlrYSBXZXN0ZXJiZXJnCj4gPG1pa2Eud2VzdGVyYmVyZ0BpbnRlbC5jb20+IHdyb3RlOgo+ID4K
PiA+IE9uIFdlZCwgTm92IDIwLCAyMDE5IGF0IDA0OjM3OjE0UE0gKzAxMDAsIEthcm9sIEhlcmJz
dCB3cm90ZToKPiA+ID4gT24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgNDoxNSBQTSBNaWthIFdlc3Rl
cmJlcmcKPiA+ID4gPG1pa2Eud2VzdGVyYmVyZ0BpbnRlbC5jb20+IHdyb3RlOgo+ID4gPiA+Cj4g
PiA+ID4gT24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMDE6MTE6NTJQTSArMDEwMCwgS2Fyb2wgSGVy
YnN0IHdyb3RlOgo+ID4gPiA+ID4gT24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMTowOSBQTSBNaWth
IFdlc3RlcmJlcmcKPiA+ID4gPiA+IDxtaWthLndlc3RlcmJlcmdAaW50ZWwuY29tPiB3cm90ZToK
PiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gT24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMTI6NTg6MDBQ
TSArMDEwMCwgS2Fyb2wgSGVyYnN0IHdyb3RlOgo+ID4gPiA+ID4gPiA+IG92ZXJhbGwsIHdoYXQg
SSByZWFsbHkgd2FudCB0byBrbm93IGlzLCBfd2h5XyBkb2VzIGl0IHdvcmsgb24gd2luZG93cz8K
PiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gU28gZG8gSSA7LSkKPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gPiBPciB3aGF0IGFyZSB3ZSBkb2luZyBkaWZmZXJlbnRseSBvbiBMaW51eCBzbyB0aGF0IGl0
IGRvZXNuJ3Qgd29yaz8gSWYKPiA+ID4gPiA+ID4gPiBhbnlib2R5IGhhcyBhbnkgaWRlYSBvbiBo
b3cgd2UgY291bGQgZGlnIGludG8gdGhpcyBhbmQgZmlndXJlIGl0IG91dAo+ID4gPiA+ID4gPiA+
IG9uIHRoaXMgbGV2ZWwsIHRoaXMgd291bGQgcHJvYmFibHkgYWxsb3cgdXMgdG8gZ2V0IGNsb3Nl
ciB0byB0aGUgcm9vdAo+ID4gPiA+ID4gPiA+IGNhdXNlPyBubz8KPiA+ID4gPiA+ID4KPiA+ID4g
PiA+ID4gSGF2ZSB5b3UgdHJpZWQgdG8gdXNlIHRoZSBhY3BpX3Jldl9vdmVycmlkZSBwYXJhbWV0
ZXIgaW4geW91ciBzeXN0ZW0gYW5kCj4gPiA+ID4gPiA+IGRvZXMgaXQgaGF2ZSBhbnkgZWZmZWN0
Pwo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBBbHNvIGRpZCB5b3UgdHJ5IHRvIHRyYWNlIHRoZSBB
Q1BJIF9PTi9fT0ZGKCkgbWV0aG9kcz8gSSB0aGluayB0aGF0Cj4gPiA+ID4gPiA+IHNob3VsZCBo
b3BlZnVsbHkgcmV2ZWFsIHNvbWV0aGluZy4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4g
PiBJIHRoaW5rIEkgZGlkIGluIHRoZSBwYXN0IGFuZCBpdCBzZWVtZWQgdG8gaGF2ZSB3b3JrZWQs
IHRoZXJlIGlzIGp1c3QKPiA+ID4gPiA+IG9uZSBiaWcgaXNzdWUgd2l0aCB0aGlzOiBpdCdzIGEg
RGVsbCBzcGVjaWZpYyB3b3JrYXJvdW5kIGFmYWlrLCBhbmQKPiA+ID4gPiA+IHRoaXMgaXNzdWUg
cGxhZ3VlcyBub3QganVzdCBEZWxsLCBidXQgd2UndmUgc2VlbiBpdCBvbiBIUCBhbmQgTGVub3Zv
Cj4gPiA+ID4gPiBsYXB0b3BzIGFzIHdlbGwsIGFuZCBJJ3ZlIGhlYXJkIGFib3V0IHVzZXJzIGhh
dmluZyB0aGUgc2FtZSBpc3N1ZXMgb24KPiA+ID4gPiA+IEFzdXMgYW5kIE1TSSBsYXB0b3BzIGFz
IHdlbGwuCj4gPiA+ID4KPiA+ID4gPiBNYXliZSBpdCBpcyBub3QgYSB3b3JrYXJvdW5kIGF0IGFs
bCBidXQgaW5zdGVhZCBpdCBzaW1wbHkgZGV0ZXJtaW5lcwo+ID4gPiA+IHdoZXRoZXIgdGhlIHN5
c3RlbSBzdXBwb3J0cyBSVEQzIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQgKElJUkMgV2luZG93cyA4
Cj4gPiA+ID4gc3RhcnRlZCBzdXBwb3J0aW5nIGl0KS4gTWF5YmUgRGVsbCBhZGRlZCBjaGVjayBm
b3IgTGludXggYmVjYXVzZSBhdCB0aGF0Cj4gPiA+ID4gdGltZSBMaW51eCBkaWQgbm90IHN1cHBv
cnQgaXQuCj4gPiA+ID4KPiA+ID4KPiA+ID4gdGhlIHBvaW50IGlzLCBpdCdzIG5vdCBjaGVja2lu
ZyBpdCBieSBkZWZhdWx0LCBzbyBieSBkZWZhdWx0IHlvdSBzdGlsbAo+ID4gPiBydW4gaW50byB0
aGUgd2luZG93cyA4IGNvZGVwYXRoLgo+ID4KPiA+IFdlbGwgeW91IGNhbiBhZGQgdGhlIHF1aXJr
IHRvIGFjcGlfcmV2X2RtaV90YWJsZVtdIHNvIGl0IGdvZXMgdG8gdGhhdAo+ID4gcGF0aCBieSBk
ZWZhdWx0LiBUaGVyZSBhcmUgYSBidW5jaCBvZiBzaW1pbGFyIGVudHJpZXMgZm9yIERlbGwgbWFj
aGluZXMuCj4KPiBPSywgc28gdGhlICJMaW51eCBwYXRoIiB3b3JrcyBhbmQgdGhlIG90aGVyIGRv
ZXNuJ3QuCj4KPiBJIHRob3VnaHQgdGhhdCB0aGlzIHdhcyB0aGUgb3RoZXIgd2F5IGFyb3VuZCwg
c29ycnkgZm9yIHRoZSBjb25mdXNpb24uCj4KPiA+IE9mIGNvdXJzZSB0aGlzIGRvZXMgbm90IGhl
bHAgdGhlIG5vbi1EZWxsIHVzZXJzIHNvIHdlIHdvdWxkIHN0aWxsIG5lZWQKPiA+IHRvIGZpZ3Vy
ZSBvdXQgdGhlIHJvb3QgY2F1c2UuCj4KPiBSaWdodC4KPgo+IFdoYXRldmVyIGl0IGlzLCB0aG91
Z2gsIEFNTCBhcHBlYXJzIHRvIGJlIGludm9sdmVkIGluIGl0IGFuZCBBRkFJQ1MKPiB0aGVyZSdz
IG5vIGV2aWRlbmNlIHRoYXQgaXQgYWZmZWN0cyBhbnkgcm9vdCBwb3J0cyB0aGF0IGFyZSBub3QK
PiBwb3B1bGF0ZWQgd2l0aCBOVmlkaWEgR1BVcy4KPgoKbGFzdCB3ZWVrIG9yIHNvIEkgZm91bmQg
c3lzdGVtcyB3aGVyZSB0aGUgR1BVIHdhcyB1bmRlciB0aGUgIlBDSQpFeHByZXNzIFJvb3QgUG9y
dCIgKG5hbWUgZnJvbSBsc3BjaSkgYW5kIG9uIHRob3NlIHN5c3RlbXMgYWxsIG9mIHRoYXQKc2Vl
bXMgdG8gd29yay4gU28gSSBhbSB3b25kZXJpbmcgaWYgaXQncyBpbmRlZWQganVzdCB0aGUgMHgx
OTAxIG9uZSwKd2hpY2ggYWxzbyBleHBsYWlucyBNaWthcyBjYXNlIHRoYXQgVGh1bmRlcmJvbHQg
c3R1ZmYgd29ya3MgYXMgZGV2aWNlcwpuZXZlciBnZXQgcG9wdWxhdGVkIHVuZGVyIHRoaXMgcGFy
dGljdWxhciBicmlkZ2UgY29udHJvbGxlciwgYnV0IHVuZGVyCnRob3NlICJSb290IFBvcnQicwoK
PiBOb3csIG9uZSB0aGluZyBpcyBzdGlsbCBub3QgY2xlYXIgdG8gbWUgZnJvbSB0aGUgZGlzY3Vz
c2lvbiBzbyBmYXI6IGlzCj4gdGhlIF9QUjMgbWV0aG9kIHlvdSBtZW50aW9uZWQgZGVmaW5lZCB1
bmRlciB0aGUgR1BVIGRldmljZSBvYmplY3Qgb3IKPiB1bmRlciB0aGUgcG9ydCBkZXZpY2Ugb2Jq
ZWN0Pwo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
