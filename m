Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CA1CB565
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 09:40:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 775E96EAEC;
	Fri,  4 Oct 2019 07:39:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from haggis.mythic-beasts.com (haggis.mythic-beasts.com
 [IPv6:2a00:1098:0:86:1000:0:2:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B50897B4
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 03:59:44 +0000 (UTC)
Received: from [199.195.250.187] (port=48410 helo=hermes.aosc.io)
 by haggis.mythic-beasts.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92.3)
 (envelope-from <icenowy@aosc.io>)
 id 1iFsH9-0002Ea-GO; Thu, 03 Oct 2019 04:59:39 +0100
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender:
 icenowy@aosc.io)
 by hermes.aosc.io (Postfix) with ESMTPSA id 418CA82E31;
 Thu,  3 Oct 2019 03:59:24 +0000 (UTC)
Message-ID: <cf49bbf518b10b0f5b27b0d5e866b60e174fec4a.camel@aosc.io>
Subject: Re: [PATCH 0/3] drm/sun4i: dsi: misc timing fixes
From: Icenowy Zheng <icenowy@aosc.io>
To: Maxime Ripard <mripard@kernel.org>
Date: Thu, 03 Oct 2019 11:58:42 +0800
In-Reply-To: <20191002103642.jlbs44v4kwnxhrge@gilmour>
References: <20191001080253.6135-1-icenowy@aosc.io>
 <20191002103642.jlbs44v4kwnxhrge@gilmour>
Organization: Anthon Open-Source Community
MIME-Version: 1.0
X-BlackCat-Spam-Score: 0
X-Spam-Status: No, score=-0.1
X-Mailman-Approved-At: Fri, 04 Oct 2019 07:38:50 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

5ZyoIDIwMTktMTAtMDLkuInnmoQgMTI6MzYgKzAyMDDvvIxNYXhpbWUgUmlwYXJk5YaZ6YGT77ya
Cj4gSGksCj4gCj4gT24gVHVlLCBPY3QgMDEsIDIwMTkgYXQgMDQ6MDI6NTBQTSArMDgwMCwgSWNl
bm93eSBaaGVuZyB3cm90ZToKPiA+IFRoaXMgcGF0Y2hzZXQgZml4ZXMgc29tZSBwb3J0aW9uIG9m
IHRpbWluZyBjYWxjdWxhdGlvbiBpbgo+ID4gc3VuNmlfbWlwaV9kc2kKPiA+IGRyaXZlciBhY2Nv
cmRpbmcgdG8gdGhlIEJTUCBkcml2ZXIuCj4gPiAKPiA+IFR3byBvZiB0aGUgcGF0Y2hlcyBhcmUg
cmV2ZXJ0aW5nLCBvbmUgaXMgZml4aW5nIHNvbWUgbWlzcmVhZCBvZiB0aGUKPiA+IEJTUAo+ID4g
c291cmNlIGNvZGUsIGFub3RoZXIgaXMgZml4aW5nIGEgd3JvbmcgcmVmYWN0b3IgdGhhdCBhY3R1
YWxseQo+ID4gYnJlYWtzIHRoZQo+ID4gZm9ybXVsYS4KPiA+IAo+ID4gVGhlIG90aGVyIG5vbi1y
ZXZlcnRpbmcgcGF0Y2ggaXMgZml4aW5nIGEgcG9yY2ggZXJyb3Igd2hpY2ggaXMKPiA+IHVzdWFs
bHkKPiA+IHNlZW4gaW4gdGhlIG9yaWdpbmFsIGRyaXZlciBjb21taXQuIE1vc3Qgb2YgcG9yY2gg
ZXJyb3JzIGFyZSB0aGVuCj4gPiBmaXhlZCwKPiA+IGJ1dCB0aGlzIG9uZSBnZXRzIGlnbm9yZWQu
Cj4gPiAKPiA+IEJ5IGFwcGx5aW5nIHRoZXNlIHBhdGNoZXMsIHNldmVyYWwgRFNJIHBhbmVscyBh
cmUgdGVzdGVkIHRvIGJlCj4gPiBkcml2ZW4KPiA+IHByb3Blcmx5IGJ5IHRoZSB0aW1pbmcgcHJv
dmlkZWQgYnkgdGhlIHZlbmRvciwgaW5jbHVkaW5nIHRoZSBMQ0QKPiA+IHBhbmVsCj4gPiBvZiBQ
aW5lUGhvbmUgIkRvbid0IEJlIEV2aWwiIERldktpdCwgdGhlIGZpbmFsIFBpbmVQaG9uZSBwYW5l
bCBhbmQKPiA+IHRoZQo+ID4gcGFuZWwgb24gUGluZVRhYi4gV2l0aG91dCB0aGVzZSBwYXRjaGVz
IHRoZXkgbmVlZCBkaXJ0eSB0aW1pbmcKPiA+IGhhY2tzIHRvCj4gPiB3b3JrLgo+IAo+IFRoYW5r
cyBmb3IgZ29pbmcgYWZ0ZXIgdGhhdCBpc3N1ZS4gQ2FuIHlvdSBwcm92aWRlIHJlZmVyZW5jZXMg
dG8gdGhlCj4gQlNQIG9uIHRoZSB2YXJpb3VzIHBhdGNoZXM/CgpGb3IgcGF0Y2ggMTogWzFdIGZv
ciBzZXR0aW5nIGRlbGF5IDEgaW4gRFNJIGNvbnRyb2xsZXIsIFsyXSBmb3Igc2V0dGluZwpyZWFs
IGRlbGF5IGluIFRDT04gY29udHJvbGxlci4KCkZvciBwYXRjaCAyOiBbM10KClBhdGNoIDMgaXMg
cmV2ZXJ0aW5nIGEgYnJlYWtpbmcgY2hhbmdlLCBzbyBJIGRpZG4ndCBjaGVjayBpdCBpbiB0aGUK
QlNQLiBJdCBjYW4gYmUgdmVyaWZpZWQgYnkgbWF0aG1hdGljYWwgY2FsY3VsYXRpb24uCgpbMV0g
Cmh0dHBzOi8vZ2l0aHViLmNvbS9heXVmYW4tcGluZTY0L2xpbnV4LXBpbmU2NC9ibG9iL215LWhh
Y2tzLTEuMi13aXRoLWRybS9kcml2ZXJzL3ZpZGVvL3N1bnhpL2Rpc3AyL2Rpc3AvZGUvbG93bGV2
ZWxfc3VuNTBpdzEvZGVfZHNpLmMjTDczMAoKWzJdIApodHRwczovL2dpdGh1Yi5jb20vYXl1ZmFu
LXBpbmU2NC9saW51eC1waW5lNjQvYmxvYi9teS1oYWNrcy0xLjItd2l0aC1kcm0vZHJpdmVycy92
aWRlby9zdW54aS9kaXNwMi9kaXNwL2RlL2xvd2xldmVsX3N1bjUwaXcxL2RlX2xjZC5jI0wzNjkK
ClszXSAKaHR0cHM6Ly9naXRodWIuY29tL2F5dWZhbi1waW5lNjQvbGludXgtcGluZTY0L2Jsb2Iv
bXktaGFja3MtMS4yLXdpdGgtZHJtL2RyaXZlcnMvdmlkZW8vc3VueGkvZGlzcDIvZGlzcC9kZS9s
b3dsZXZlbF9zdW41MGl3MS9kZV9kc2kuYyNMNzgwCgo+IAo+IElkZWFsbHksIGhhdmluZyB0aGUg
cGFuZWwgZHJpdmVycywgYW5kIHRoZSBwYW5lbCBkYXRhc2hlZXQgd291bGQKPiBoZWxwLgo+IAo+
IFRoYW5rcyEKPiBNYXhpbWUKPiAKPiBQUzogd2hlcmUgY2FuIHdlIGdldCBvbmUgb2YgdGhvc2Ug
ZGV2aWNlcz8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
