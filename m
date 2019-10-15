Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F692D7ACA
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 18:05:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269F3897C3;
	Tue, 15 Oct 2019 16:05:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA2B1897C3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 16:05:28 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id m19so17421802otp.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 09:05:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WRAte9IapI8HLyw8EXEWZMHE5vsQdc//1QiMKLS804Q=;
 b=NpzkODPuxMt0eZtKy+TqYI1XqGoJFLMc7Pli0xZ0YQefWQFYBFpGHgjLQT8x+qB52W
 K+ca+eMce2BiMYQrz06Y+TnAossEFE2Xxg0Y4aw/q28PC5W0biu18tZGMJsbDG+VkIa1
 PMP5gbA36+L3wjZz9RtvSh20WHfI5EPh/Jg6AHMNz8aAEPglztOJ4fGL7b8ZElTWShx3
 7B77iGvqcndIi/mqcwXak9UL1vGOuJNrKRrTG/eI5iVRGqy+i05OvlCooiO8jK2njtu/
 bV00mbmr2V3R1RhKuJTAYbdA4VD51mvg6OepPDfSHM06CXzeqQYtH5OV5paoC6UFN4oT
 uEVg==
X-Gm-Message-State: APjAAAVjfjZcqRs9uVoyKUtyY9t7PIwk56/YlLkhf7RsfuDpIBD5SfV+
 W4dJ21tikChbuIlf27UQf9RiNmTlXMDExYw3f3A4Vg==
X-Google-Smtp-Source: APXvYqw4w4gtLPRyqAMzNuJ2F7B+bWp3uX3RHjqcB3fWkNynldqiGTIrmyuGDX8LLM1iEFaa+zVQ+mu2UHa8NPjp70c=
X-Received: by 2002:a9d:6343:: with SMTP id y3mr5247738otk.106.1571155527754; 
 Tue, 15 Oct 2019 09:05:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190719155916.62465-1-noralf@tronnes.org>
 <20190719155916.62465-6-noralf@tronnes.org>
 <20191015143236.GA5363@smile.fi.intel.com>
 <253aec49-e51c-b35b-4e7d-53a8a948655d@tronnes.org>
 <20191015155911.GM32742@smile.fi.intel.com>
In-Reply-To: <20191015155911.GM32742@smile.fi.intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 15 Oct 2019 18:05:16 +0200
Message-ID: <CAKMK7uEW83M0G8TuSMsVysGLc6eK27sGgUvYq=kr8mBgNuAoSg@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] drm/tinydrm: Remove
 tinydrm_spi_max_transfer_size()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WRAte9IapI8HLyw8EXEWZMHE5vsQdc//1QiMKLS804Q=;
 b=V2cqI1xt6+OAzVDSsO9oMq6MHMPHzZDI/2lJ/CsYaOdzx11O4bvV/lmZLHAOLnL3e/
 Zf2RQY1Qq1/Jjb4pMjEtAJRgHJObEwCs2fieSLuTIIkx4BUfnKCgqMMe0YmUE02nD3oU
 gOWxkWPTkmSO+4faqOZYxmtNRrZazPGvdT8x4=
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
Cc: Sam Ravnborg <sam@ravnborg.org>, David Lechner <david@lechnology.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgNTo1OSBQTSBBbmR5IFNoZXZjaGVua28KPGFuZHJpeS5z
aGV2Y2hlbmtvQGludGVsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIE9jdCAxNSwgMjAxOSBhdCAw
NTo0MTo1M1BNICswMjAwLCBOb3JhbGYgVHLDuG5uZXMgd3JvdGU6Cj4gPiBEZW4gMTUuMTAuMjAx
OSAxNi4zMiwgc2tyZXYgQW5keSBTaGV2Y2hlbmtvOgo+ID4gPiBPbiBGcmksIEp1bCAxOSwgMjAx
OSBhdCAwNTo1OToxMFBNICswMjAwLCBOb3JhbGYgVHLDuG5uZXMgd3JvdGU6Cj4gPiA+PiBzcGkt
YmNtMjgzNSBjYW4gaGFuZGxlID42NGtCIGJ1ZmZlcnMgbm93IHNvIHRoZXJlIGlzIG5vIG5lZWQg
dG8gY2hlY2sKPiA+ID4+IC0+bWF4X2RtYV9sZW4uIFRoZSB0aW55ZHJtX3NwaV9tYXhfdHJhbnNm
ZXJfc2l6ZSgpIG1heF9sZW4gYXJndW1lbnQgaXMKPiA+ID4+IG5vdCB1c2VkIGJ5IGFueSBjYWxs
ZXJzLCBzbyBub3QgbmVlZGVkLgo+ID4gPj4KPiA+ID4+IFRoZW4gd2UgaGF2ZSB0aGUgc3BpX21h
eCBtb2R1bGUgcGFyYW1ldGVyLiBJdCB3YXMgYWRkZWQgYmVjYXVzZQo+ID4gPj4gc3RhZ2luZy9m
YnRmdCBoYXMgc3VwcG9ydCBmb3IgaXQgYW5kIHRoZXJlIHdhcyBhIHJlcG9ydCB0aGF0IHNvbWVv
bmUgdXNlZAo+ID4gPj4gaXQgdG8gc2V0IGEgc21hbGwgYnVmZmVyIHNpemUgdG8gYXZvaWQgcG9w
cGluZyBvbiBhIFVTQiBzb3VuZGNhcmQgb24gYQo+ID4gPj4gUmFzcGJlcnJ5IFBpLiBJbiBoaW5k
c2lnaHQgaXQgc2hvdWxkbid0IGhhdmUgYmVlbiBhZGRlZCwgSSBzaG91bGQgaGF2ZQo+ID4gPj4g
d2FpdGVkIGZvciBpdCB0byBiZWNvbWUgYSBwcm9ibGVtIGZpcnN0LiBJIGRvbid0IGtub3cgaXQg
YW55b25lIGlzCj4gPiA+PiBhY3R1YWxseSB1c2luZyBpdCwgYnV0IHNpbmNlIHRpbnlkcm1fc3Bp
X3RyYW5zZmVyKCkgaXMgYmVpbmcgbW92ZWQgdG8KPiA+ID4+IG1pcGktZGJpLCBJJ20gdGFraW5n
IHRoZSBvcHBvcnR1bml0eSB0byByZW1vdmUgaXQuIEknbGwgYWRkIGl0IGJhY2sgdG8KPiA+ID4+
IG1pcGktZGJpIGlmIHNvbWVvbmUgY29tcGxhaW5zLgo+ID4gPj4KPiA+ID4+IFdpdGggdGhhdCBv
dXQgb2YgdGhlIHdheSwgc3BpX21heF90cmFuc2Zlcl9zaXplKCkgY2FuIGJlIHVzZWQgaW5zdGVh
ZC4KPiA+ID4+Cj4gPiA+PiBUaGUgY2hvc2VuIDE2a0IgYnVmZmVyIHNpemUgZm9yIFR5cGUgQyBP
cHRpb24gMSAoOS1iaXQpIGludGVyZmFjZSBpcwo+ID4gPj4gc29tZXdoYXQgYXJiaXRyYXJ5LCBi
dXQgYSBiaWdnZXIgYnVmZmVyIHdpbGwgaGF2ZSBhIG1pbmlzY3VsZSBpbXBhY3Qgb24KPiA+ID4+
IHRyYW5zZmVyIHNwZWVkLCBzbyBpdCdzIHByb2JhYmx5IGZpbmUuCj4gPiA+Cj4gPiA+IFRoaXMg
YnJlYWtzIHRoZSBTUEkgUFhBMnh4IGNhc2UgSSdtIHVzaW5nLiBUaGUgd29ybGQgaXMgbm90IGEg
UGk6ZS4KPiA+ID4KPiA+ID4gWyAgMzg4LjQ0NTc1Ml0gbWkwMjgzcXQgc3BpLVBSUDAwMDE6MDE6
IERNQSBkaXNhYmxlZCBmb3IgdHJhbnNmZXIgbGVuZ3RoIDE1MzYwMCBncmVhdGVyIHRoYW4gNjU1
MzYKPiA+ID4gWyAgMzg4LjYzNDQzN10gbWkwMjgzcXQgc3BpLVBSUDAwMDE6MDE6IERNQSBkaXNh
YmxlZCBmb3IgdHJhbnNmZXIgbGVuZ3RoIDE1MzYwMCBncmVhdGVyIHRoYW4gNjU1MzYKPiA+ID4g
WyAgMzg4LjgyMjkzM10gbWkwMjgzcXQgc3BpLVBSUDAwMDE6MDE6IERNQSBkaXNhYmxlZCBmb3Ig
dHJhbnNmZXIgbGVuZ3RoIDE1MzYwMCBncmVhdGVyIHRoYW4gNjU1MzYKPiA+ID4KPiA+ID4gVGhl
IGNydWNpYWwgdGhpbmcgaXMgdG8gY2hlY2sgdGhlIHRyYW5zZmVyIHNpemUgYWdhaW5zdCBtYXhp
bXVtIERNQSBsZW5ndGgKPiA+ID4gb2YgdGhlIG1hc3Rlci4KPiA+ID4KPiA+Cj4gPiBJc24ndCB0
aGlzIGEgc3BpIGNvbnRyb2xsZXIgZHJpdmVyIHByb2JsZW0/Cj4KPiBJdCBkb2Vzbid0IG1hdHRl
ci4gVGhpcyBwYXRjaCBtYWRlIGEgcmVncmVzc2lvbi4gQmVmb3JlIGl0IHdvcmtlZCwKPiBub3cg
aXQgZG9lc24ndC4KClllcyB0aGlzIGlzIGNsZWFyLgoKPiA+IHNwaV9tYXhfdHJhbnNmZXJfc2l6
ZSgpIHRlbGxzIHRoZSBjbGllbnQgd2hhdCB0aGUgbWF4aW11bSB0cmFuc2Zlcgo+ID4gbGVuZ3Ro
IGlzLiBUaGUgY29udHJvbGxlciBkcml2ZXIgY2FuIHVzZSBjdGxyLT5tYXhfdHJhbnNmZXJfc2l6
ZSBpZiBpdAo+ID4gaGFzIHJlc3RyaWN0aW9ucy4KPgo+IEl0IG1pZ2h0IGJlIGEgcHJvYmxlbSBv
ZiB0aGUgU1BJIGNvcmUuCj4KPiA+IEFGQUlVSSBtYXhfZG1hX2xlbiBpcyB1c2VkIHdoZW4gc3Bs
aXR0aW5nIHVwIHRoZSBidWZmZXIgZm9yIHRoZSBzZyB0YWJsZQo+ID4gaW4gc3BpX21hcF9idWYo
KS4KPgo+ID4gPiBQbGVhc2UsIGZpeC4KPgo+IFNob3VsZCBJIHNlbmQgdGhlIHJldmVydD8KCkNh
biB3ZSBwbGVhc2Ugbm90IHJvbGwgaW4gd2l0aCB0aGUgY2F2YWxyeSBiZWZvcmUgZXZlcnlvbmUg
aGFkIGEKY2hhbmNlIHRvIHdha2UgdXAgYW5kIGxvb2sgYXQgdGhpcyBwcm9wZXJseT8gSXQncyBs
ZXNzIHRoYW4gMWggc2luY2UKeW91ciBpbml0aWFsIGJ1ZyByZXBvcnQuCgpBbHNvLCB5b3UgX2Rv
XyBoYXZlIGEgdGVzdCBwYXRjaCBpbiB5b3VyIGluYm94IC4uLgoKU2VyaW91c2x5LgotRGFuaWVs
Ci0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgor
NDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
