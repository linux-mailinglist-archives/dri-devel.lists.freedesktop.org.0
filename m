Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A89210527F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 13:57:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D16E6EE59;
	Thu, 21 Nov 2019 12:57:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17556EE42
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 12:57:12 +0000 (UTC)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-5ZDyLEwvMcOSnXN7ISFipw-1; Thu, 21 Nov 2019 07:57:10 -0500
Received: by mail-qt1-f197.google.com with SMTP id 6so2202640qtu.7
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 04:57:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QH9raaSEy0ZT3Ng+Xr/UbfMvZg5iClSyjL5MYEeeB0o=;
 b=twh1WbGxhfkNXvZ9g2C3LedVc+fHGvhjbNd5zRHZ0StybdBtjNgRjzULZjjT6siifZ
 UEFGQ8XciH25byldUDQkbWcTxYQvjrwFHGpuwxcXFwzKcGNtre4Gc/iGGI9b1hsyIb53
 8DalgsR3ebPLnu/lywMmw+hcjD6Ep53whh1eAWwX3HpaU6WCWDDJHwmTkCW2ybBX0AHB
 9fzmqHns01DIbZWYtVhmkEBZMD+mNnXHJnlM3KYwR2brcfLPK0y+aRbXsVneGgPZl85v
 9dVQhIfIg+33mX1rTPsniIIpnVMV4BkSyxLpKcMp++8ckWoN3hwIaYaacCWhCcvS8VzA
 3WDQ==
X-Gm-Message-State: APjAAAWHk/8PBLzElRbw2OTY+HfeOC4aywJ5a8Yh/f5ZnjQixoyEPYLX
 Nbudm2I5vEsfeDlCoPXQkDSZOH6dkJhXfgrb3/AgAQX+G0n+Eh/Vc+5QuR8QXwTKNML5i0ztj+a
 ysGP/GajpMgDGGyap1Y0vfCDNnQ3bqMeeQ9FX//VFTexv
X-Received: by 2002:ac8:7550:: with SMTP id b16mr8247878qtr.286.1574341029748; 
 Thu, 21 Nov 2019 04:57:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqzCB3+oy9LxTLupf+9fIdsK0rCf/DUfxOcnQaIfyPvrUsIjLHSyzhlMj9XMgXerrNXcdpm7ZYcN/G4r6b/xReI=
X-Received: by 2002:ac8:7550:: with SMTP id b16mr8247859qtr.286.1574341029535; 
 Thu, 21 Nov 2019 04:57:09 -0800 (PST)
MIME-Version: 1.0
References: <CACO55tsHy6yZQZ8PkdW8iPA7+uc5rdcEwRJwYEQ3iqu85F8Sqg@mail.gmail.com>
 <20191120151542.GH11621@lahna.fi.intel.com>
 <CACO55tvo3rbPtYJcioEgXCEQqVXcVAm-iowr9Nim=bgTdMjgLw@mail.gmail.com>
 <20191120155301.GL11621@lahna.fi.intel.com>
 <CAJZ5v0hkT-fHFOQKzp2qYPyR+NUa4c-G-uGLPZuQxqsG454PiQ@mail.gmail.com>
 <CACO55ttTPi2XpRRM_NYJU5c5=OvG0=-YngFy1BiR8WpHkavwXw@mail.gmail.com>
 <CAJZ5v0h=7zu3A+ojgUSmwTH0KeXmYP5OKDL__rwkkWaWqcJcWQ@mail.gmail.com>
 <20191121112821.GU11621@lahna.fi.intel.com>
 <CAJZ5v0hQhj5Wf+piU11abC4pF26yM=XHGHAcDv8Jsgdx04aN-w@mail.gmail.com>
 <20191121114610.GW11621@lahna.fi.intel.com>
 <20191121125236.GX11621@lahna.fi.intel.com>
In-Reply-To: <20191121125236.GX11621@lahna.fi.intel.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 21 Nov 2019 13:56:57 +0100
Message-ID: <CACO55ttOgx=jyCh_uZLH4t8C5SW0f2u3BSrw93vPmusM98p0Mg@mail.gmail.com>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
To: Mika Westerberg <mika.westerberg@intel.com>
X-MC-Unique: 5ZDyLEwvMcOSnXN7ISFipw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574341031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nVnuS3G07UEp6AIL04Xz4q+Tzbj4PQPwyBSCk9uHGkw=;
 b=IJjLyLmfUKo+7eHjcuvWWSQBr+5Vu6Tpmpx4vcIwd+0hY6t5kNQX+CA54HCeKDy6MR0pL6
 GN2MBCFVGnbVSvBlJTiRq8fm3j8rkwWvuDBl9ok4te1Bv6m7Kstt00CZg2yZYEk1X9mTM/
 q/Y8JlQvSelYzr5dPBXkUv3iK06KN20=
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
 Linux PCI <linux-pci@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Mario Limonciello <Mario.Limonciello@dell.com>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMTo1MiBQTSBNaWthIFdlc3RlcmJlcmcKPG1pa2Eud2Vz
dGVyYmVyZ0BpbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMDE6
NDY6MTRQTSArMDIwMCwgTWlrYSBXZXN0ZXJiZXJnIHdyb3RlOgo+ID4gT24gVGh1LCBOb3YgMjEs
IDIwMTkgYXQgMTI6MzQ6MjJQTSArMDEwMCwgUmFmYWVsIEouIFd5c29ja2kgd3JvdGU6Cj4gPiA+
IE9uIFRodSwgTm92IDIxLCAyMDE5IGF0IDEyOjI4IFBNIE1pa2EgV2VzdGVyYmVyZwo+ID4gPiA8
bWlrYS53ZXN0ZXJiZXJnQGludGVsLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBXZWQs
IE5vdiAyMCwgMjAxOSBhdCAxMToyOTozM1BNICswMTAwLCBSYWZhZWwgSi4gV3lzb2NraSB3cm90
ZToKPiA+ID4gPiA+ID4gbGFzdCB3ZWVrIG9yIHNvIEkgZm91bmQgc3lzdGVtcyB3aGVyZSB0aGUg
R1BVIHdhcyB1bmRlciB0aGUgIlBDSQo+ID4gPiA+ID4gPiBFeHByZXNzIFJvb3QgUG9ydCIgKG5h
bWUgZnJvbSBsc3BjaSkgYW5kIG9uIHRob3NlIHN5c3RlbXMgYWxsIG9mIHRoYXQKPiA+ID4gPiA+
ID4gc2VlbXMgdG8gd29yay4gU28gSSBhbSB3b25kZXJpbmcgaWYgaXQncyBpbmRlZWQganVzdCB0
aGUgMHgxOTAxIG9uZSwKPiA+ID4gPiA+ID4gd2hpY2ggYWxzbyBleHBsYWlucyBNaWthcyBjYXNl
IHRoYXQgVGh1bmRlcmJvbHQgc3R1ZmYgd29ya3MgYXMgZGV2aWNlcwo+ID4gPiA+ID4gPiBuZXZl
ciBnZXQgcG9wdWxhdGVkIHVuZGVyIHRoaXMgcGFydGljdWxhciBicmlkZ2UgY29udHJvbGxlciwg
YnV0IHVuZGVyCj4gPiA+ID4gPiA+IHRob3NlICJSb290IFBvcnQicwo+ID4gPiA+ID4KPiA+ID4g
PiA+IEl0IGFsd2F5cyBpcyBhIFBDSWUgcG9ydCwgYnV0IGl0cyBsb2NhdGlvbiB3aXRoaW4gdGhl
IFNvQyBtYXkgbWF0dGVyLgo+ID4gPiA+Cj4gPiA+ID4gRXhhY3RseS4gSW50ZWwgaGFyZHdhcmUg
aGFzIFBDSWUgcG9ydHMgb24gQ1BVIHNpZGUgKHRoZXNlIGFyZSBjYWxsZWQKPiA+ID4gPiBQRUcs
IFBDSSBFeHByZXNzIEdyYXBoaWNzLCBwb3J0cyksIGFuZCB0aGUgUENIIHNpZGUuIEkgdGhpbmsg
dGhlIElQIGlzCj4gPiA+ID4gc3RpbGwgdGhlIHNhbWUuCj4gPiA+ID4KPiA+ID4gPiA+IEFsc28g
c29tZSBjdXN0b20gQU1MLWJhc2VkIHBvd2VyIG1hbmFnZW1lbnQgaXMgaW52b2x2ZWQgYW5kIHRo
YXQgbWF5Cj4gPiA+ID4gPiBiZSBtYWtpbmcgc3BlY2lmaWMgYXNzdW1wdGlvbnMgb24gdGhlIGNv
bmZpZ3VyYXRpb24gb2YgdGhlIFNvQyBhbmQgdGhlCj4gPiA+ID4gPiBHUFUgYXQgdGhlIHRpbWUg
b2YgaXRzIGludm9jYXRpb24gd2hpY2ggdW5mb3J0dW5hdGVseSBhcmUgbm90IGtub3duIHRvCj4g
PiA+ID4gPiB1cy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBIb3dldmVyLCBpdCBsb29rcyBsaWtlIHRo
ZSBBTUwgaW52b2tlZCB0byBwb3dlciBkb3duIHRoZSBHUFUgZnJvbQo+ID4gPiA+ID4gYWNwaV9w
Y2lfc2V0X3Bvd2VyX3N0YXRlKCkgZ2V0cyBjb25mdXNlZCBpZiBpdCBpcyBub3QgaW4gUENJIEQw
IGF0Cj4gPiA+ID4gPiB0aGF0IHBvaW50LCBzbyBpdCBsb29rcyBsaWtlIHRoYXQgQU1MIHRyaWVz
IHRvIGFjY2VzcyBkZXZpY2UgbWVtb3J5IG9uCj4gPiA+ID4gPiB0aGUgR1BVIChiZXlvbmQgdGhl
IFBDSSBjb25maWcgc3BhY2UpIG9yIHNpbWlsYXIgd2hpY2ggaXMgbm90Cj4gPiA+ID4gPiBhY2Nl
c3NpYmxlIGluIFBDSSBwb3dlciBzdGF0ZXMgYmVsb3cgRDAuCj4gPiA+ID4KPiA+ID4gPiBPciB0
aGUgUENJIGNvbmZpZyBzcGFjZSBvZiB0aGUgR1BVIHdoZW4gdGhlIHBhcmVudCByb290IHBvcnQg
aXMgaW4gRDNob3QKPiA+ID4gPiAoYXMgaXQgaXMgdGhlIGNhc2UgaGVyZSkuIEFsc28gdGhlbiB0
aGUgR1BVIGNvbmZpZyBzcGFjZSBpcyBub3QKPiA+ID4gPiBhY2Nlc3NpYmxlLgo+ID4gPgo+ID4g
PiBXaHkgd291bGQgdGhlIHBhcmVudCBwb3J0IGJlIGluIEQzaG90IGF0IHRoYXQgcG9pbnQ/ICBX
b3VsZG4ndCB0aGF0IGJlCj4gPiA+IGEgc3VzcGVuZCBvcmRlcmluZyB2aW9sYXRpb24/Cj4gPgo+
ID4gTm8uIFdlIHB1dCB0aGUgR1BVIGludG8gRDNob3QgZmlyc3QsIHRoZW4gdGhlIHJvb3QgcG9y
dCBhbmQgdGhlbiB0dXJuCj4gPiBvZmYgdGhlIHBvd2VyIHJlc291cmNlICh3aGljaCBpcyBhdHRh
Y2hlZCB0byB0aGUgcm9vdCBwb3J0KSByZXN1bHRpbmcKPiA+IHRoZSB0b3BvbG9neSBlbnRlcmlu
ZyBEM2NvbGQuCj4KPiBJIGRvbid0IHNlZSB0aGF0IGhhcHBlbmluZyBpbiB0aGUgQU1MIHRob3Vn
aC4KPgo+IEJhc2ljYWxseSB0aGUgZGlmZmVyZW5jZSBpcyB0aGF0IHdoZW4gV2luZG93cyA3IG9y
IExpbnV4ICh0aGUgX1JFVj09NQo+IGNoZWNrKSB0aGVuIHdlIGRpcmVjdGx5IGRvIGxpbmsgZGlz
YWJsZSB3aGVyZWFzIGluIFdpbmRvd3MgOCsgd2UgaW52b2tlCj4gTEtEUygpIG1ldGhvZCB0aGF0
IHB1dHMgdGhlIGxpbmsgaW50byBMMi9MMy4gTm9uZSBvZiB0aGUgZmllbGRzIHRoZXkKPiBhY2Nl
c3Mgc2VlbSB0byB0b3VjaCB0aGUgR1BVIGl0c2VsZi4KPgo+IExLRFMoKSBmb3IgdGhlIGZpcnN0
IFBFRyBwb3J0IGxvb2tzIGxpa2UgdGhpczoKPgo+ICAgIFAwTDIgPSBPbmUKPiAgICBTbGVlcCAo
MHgxMCkKPiAgICBMb2NhbDAgPSBaZXJvCj4gICAgV2hpbGUgKFAwTDIpCj4gICAgewo+ICAgICAg
ICAgSWYgKChMb2NhbDAgPiAweDA0KSkKPiAgICAgICAgIHsKPiAgICAgICAgICAgICBCcmVhawo+
ICAgICAgICAgfQo+Cj4gICAgICAgICBTbGVlcCAoMHgxMCkKPiAgICAgICAgIExvY2FsMCsrCj4g
ICAgfQo+Cj4gT25lIHRoaW5nIHRoYXQgY29tZXMgdG8gbWluZCBpcyB0aGF0IHRoZSBsb29wIGNh
biBlbmQgZXZlbiBpZiBQMEwyIGlzCj4gbm90IGNsZWFyZWQgYXMgaXQgZG9lcyBvbmx5IDUgaXRl
cmF0aW9ucyB3aXRoIDE2IG1zIHNsZWVwIGJldHdlZW4uIE1heWJlCj4gU2xlZXAoKSBpcyBpbXBs
ZW1lbnRlZCBkaWZmZXJlbnRseSBpbiBXaW5kb3dzPyBJIG1lYW4gTGludXggbWF5IGJlCj4gImZh
c3RlciIgaGVyZSBhbmQgcmV0dXJuIHByZW1hdHVyZWx5IGFuZCBpZiB3ZSBsZWF2ZSB0aGUgcG9y
dCBpbnRvIEQwCj4gdGhpcyBkb2VzIG5vdCBoYXBwZW4sIG9yIHNvbWV0aGluZy4gSSdtIGp1c3Qg
dGhyb3dpbmcgb3V0IGlkZWFzIDopCj4KCmtlZXAgaW4gbWluZCwgdGhhdCBJIGFtIGFibGUgdG8g
aGl0IHRoaXMgYnVnIHdpdGggbXkgcHl0aG9uIHNjcmlwdDoKaHR0cHM6Ly9yYXcuZ2l0aHVidXNl
cmNvbnRlbnQuY29tL2thcm9saGVyYnN0L3BjaS1zdHViLXJ1bnBtL21hc3Rlci9udl9ydW5wbV9i
dWdfdGVzdC5weQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
