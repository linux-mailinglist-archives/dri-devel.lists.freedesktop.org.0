Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64528DFB84
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 04:18:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFEDB6E301;
	Tue, 22 Oct 2019 02:17:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A51336E2FF;
 Tue, 22 Oct 2019 02:17:58 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id f5so15413860ljg.8;
 Mon, 21 Oct 2019 19:17:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MraK4u57RJBUKhYEs1NPbGkccD4ngJE+o6f7WpMKm0g=;
 b=A9ANlWWTX0K1/eS2h8OhQreOlmmQ/RnxH0CmSH5+cF/WAsCSidKr4vhsScaZBVS5WT
 rHE4smsdfzHJxkKOMLCm7u/lnw/Py1Y7rOjfOLje7hsVFMRFZo1Hk204Sz9C0YRYLRvu
 xK6KFGhMW/o9SMJTHA1/wwO1HLj2IlVBCRQCQV9CnppFxzcMMKr9nkxJv4s5jok6VhS0
 Re8NE7Zysr0d8lnguUCEfjhyrCm0cGRukv0AnWKhNIb6WRP5SQLfBZ8UVh9uu4aJBH5i
 ZRE3bC7nqetmLcSoDEzXEdi0NqUD0ec+JnMj41gxE45QfCZvwqjATPPieo/cLDTvM2v9
 vbFA==
X-Gm-Message-State: APjAAAXdkRs8G0Obisc6jNkD/l98z5VnlUU+842SdSzHNkCcFrVWfWcG
 cuoKVFFdtA3IIgljyhm8je1vF2R2SREC+pwwj2k=
X-Google-Smtp-Source: APXvYqwamTBUsvhBGdH06oKaxwTn4XXiJKJuT/fyYzbt5FonDPECVtDRumC56YKpqJ8UZl/nsB/3Vuw8dLVyp9lQisU=
X-Received: by 2002:a05:651c:201:: with SMTP id
 y1mr2088520ljn.189.1571710676565; 
 Mon, 21 Oct 2019 19:17:56 -0700 (PDT)
MIME-Version: 1.0
References: <20191017192601.GA215957@art_vandelay>
 <febda9e7-d62b-128c-819a-71c57d9c001d@ti.com>
 <CAMavQKKBUk+tXYE3Z4Q7mh+tRqQEZ+vsJaLYEhT95=e3i31AdQ@mail.gmail.com>
 <6dd06a02-b28f-d6a9-da23-f1eb0ce70fca@ti.com>
 <CAMavQK+vNihFv_LKPqpUgBwXh_LCQ8=g=_zyTDe08+pKiVTOGw@mail.gmail.com>
In-Reply-To: <CAMavQK+vNihFv_LKPqpUgBwXh_LCQ8=g=_zyTDe08+pKiVTOGw@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 22 Oct 2019 12:17:44 +1000
Message-ID: <CAPM=9txA+24bz37Xu6ro5RZThV4HTL+niKL6s=TOEq+J7V3F+g@mail.gmail.com>
Subject: Re: [Intel-gfx] [PULL] drm-misc-next
To: Sean Paul <sean@poorly.run>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=MraK4u57RJBUKhYEs1NPbGkccD4ngJE+o6f7WpMKm0g=;
 b=hvD204WU7CT5T4pIEhgl04Rzt015xGJQUqY6mtBbWXy01FYAZUyTQnVwqZ44Z6Amm9
 Hbg3EqM4GVTBhKTf6ond0CA7xRTk66PcFBNRLchhQDI1zGmcBACvQ1jISdLKGgdcDrvm
 DGyqDa3OJ14bs5GDnLZjmG2D4CtschRDNEEHusm5KOJm+1sxg8l0HGnnnaj2j3hTHKE7
 FeVSw4OMWWY2911WRA0MXwY/ZsFHNuJnKD0Kv5yhkQVuJI6UTziqIyDtY4tcoAMXYatm
 jRLRe5EXCmXDI8P7l8RrcvgA1Tkhw/OGLeFAZmezNOn0ISzGKP1m7sbFzjfeesYG839s
 BWqA==
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
Cc: Wen He <wen.he_1@nxp.com>, Qiang Yu <yuq825@gmail.com>,
 "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jonas Karlman <jonas@kwiboo.se>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Oleg Vasilev <omrigann@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Robert Chiras <robert.chiras@nxp.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Lowry Li <Lowry.Li@arm.com>,
 Ezequiel Garcia <ezequiel@collabora.com>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMiBPY3QgMjAxOSBhdCAwMTo0OSwgU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+
IHdyb3RlOgo+Cj4gT24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgNDoxMSBBTSBUb21pIFZhbGtlaW5l
biA8dG9taS52YWxrZWluZW5AdGkuY29tPiB3cm90ZToKPiA+Cj4gPiBIaSwKPiA+Cj4gPiBPbiAx
OC8xMC8yMDE5IDIzOjExLCBTZWFuIFBhdWwgd3JvdGU6Cj4gPiA+IE9uIEZyaSwgT2N0IDE4LCAy
MDE5IGF0IDk6NDYgQU0gVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4gd3Jv
dGU6Cj4gPiA+Pgo+ID4gPj4gSGkgU2VhbiwKPiA+ID4+Cj4gPiA+PiBPbiAxNy8xMC8yMDE5IDIy
OjI2LCBTZWFuIFBhdWwgd3JvdGU6Cj4gPiA+Pgo+ID4gPj4+IGNvbmNlcm4gZm9yIHRob3NlLiBU
aGUgb21hcCBPTUFQX0JPX01FTV8qIGNoYW5nZXMgdGhvdWdoIEkgZG9uJ3QgdGhpbmsgaGF2ZQo+
ID4gPj4+IHJlYWxseSByZWFjaGVkIG5vbi1USSBleWVzLiBUaGVyZSdzIG5vIGxpbmsgaW4gdGhl
IGNvbW1pdCBtZXNzYWdlIHRvIGEgVUFQSQo+ID4gPj4+IGltcGxlbWVudGF0aW9uIGFuZCB0aGUg
b25seSByZWZlcmVuY2UgSSBjb3VsZCBmaW5kIGlzIGxpYmttc3h4IHdoaWNoIGNhbiBzZXQKPiA+
ID4+PiB0aGVtIHRocm91Z2ggdGhlIHB5dGhvbiBiaW5kaW5ncy4gU2luY2UgdGhpcyBpcyBUSS1z
cGVjaWZpYyBndW5rIGluIFRJLXNwZWNpZmljCj4gPiA+Pj4gaGVhZGVycyBJJ20gaW5jbGluZWQg
dG8gbGV0IGl0IHBhc3MsIGJ1dCBJIHdvdWxkIGhhdmUgbGlrZWQgdG8gaGF2ZSB0aGlzCj4gPiA+
Pj4gY29udmVyc2F0aW9uIHVwZnJvbnQuIEkgZmlndXJlZCBJJ2QgY2FsbCB0aGlzIG91dCBzbyB5
b3UgaGF2ZSBmaW5hbCBzYXkuCj4gPiA+Pgo+ID4gPj4gVGhlcmUgd2FzIHNvbWUgZGlzY3Vzc2lv
biBhYm91dCB0aGF0IGEgZmV3IHllYXJzIGJhY2sgd2hlbiBJIGluaXRpYWxseQo+ID4gPj4gc2Vu
dCB0aGUgcGF0Y2hlcywgYnV0IG5vdyB0aGF0IEkgbG9vaywgdGhlIGRpc2N1c3Npb24gZGllZCBi
ZWZvcmUgcmVhbGx5Cj4gPiA+PiBldmVuIHN0YXJ0aW5nLgo+ID4gPj4KPiA+ID4+IFRoaXMgaXMg
d2hhdCBJIHNhaWQgYWJvdXQgdXNlcnNwYWNlIGltcGxlbWVudGF0aW9uOgo+ID4gPj4KPiA+ID4+
PiBZZXMsIHVuZm9ydHVuYXRlbHkgdGhhdCBpcyBub3QgZ29pbmcgdG8gaGFwcGVuLiBJIGRvbid0
IHNlZSBob3cgdGhpcwo+ID4gPj4+IGNvdWxkIGJlIHVzZWQgaW4gYSBnZW5lcmljIHN5c3RlbSBs
aWtlIFdlc3RvbiBvciBYLiBJdCdzIG1lYW50IGZvciB2ZXJ5Cj4gPiA+Pj4gc3BlY2lmaWMgdXNl
IGNhc2VzLCB3aGVyZSB5b3Uga25vdyBleGFjdGx5IHRoZSByZXF1aXJlbWVudHMgb2YgeW91cgo+
ID4gPj4+IGFwcGxpY2F0aW9uIGFuZCB0aGUgY2FwYWJpbGl0aWVzIG9mIHRoZSB3aG9sZSBzeXN0
ZW0sIGFuZCBvcHRpbWl6ZSBiYXNlZAo+ID4gPj4+IG9uIHRoYXQuCj4gPiA+Cj4gPiA+IFRoYW5r
cyBmb3IgdGhlIGNvbnRleHQsIFRvbWkuCj4gPiA+Cj4gPiA+IEluZGVlZCBpdCBsb29rcyBsaWtl
IHRoZSBkaXNjdXNzaW9uIGRpZWQsIGJ1dCBMYXVyZW50IHN0aWxsIGJyb3VnaHQgdXAKPiA+ID4g
dGhlIHUvcyByZXF1aXJlbWVudCBhbmQgdGhlIHBhdGNoIHdhcyBlZmZlY3RpdmVseSBkZWFkIHVu
dGlsIERhbmllbCBvcgo+ID4gPiBEYXZlIHdlaWdoZWQgaW4uIEknZCBleHBlY3QgYXQgbGVhc3Qg
c29tZSBvdXRyZWFjaCBiZWZvcmUgcHVzaGluZyB0aGUKPiA+ID4gcGF0Y2ggZGlyZWN0bHkgMisg
eWVhcnMgbGF0ZXIuIEhhcyBhbnl0aGluZyBjaGFuZ2VkIHNpbmNlIHRoZW4/Cj4gPgo+ID4gVGhl
cmUgd2VyZSBuZXcgcmV2aWV3IHJvdW5kcyBmb3IgdGhlIHNlcmllcyB0aGlzIHN1bW1lciAmIGF1
dHVtbiwgYnV0Cj4gPiBubywgbm90aGluZyBlbHNlLiBJIGhhdmVuJ3Qgc3BlY2lmaWNhbGx5IHBp
bmdlZCBhbnlvbmUgYWJvdXQgdGhlIFVBUEkKPiA+IGNoYW5nZXMuCj4gPgo+ID4gVGhpcyBzZXJp
ZXMgaW50cm9kdWNlcyB0aHJlZSBuZXcgZmxhZ3MgdG8gYW4gYWxyZWFkeSBleGlzdGluZyBVQVBJ
LCBhbmQsCj4gPiBmb3Igd2hhdGV2ZXIgcmVhc29uLCB0aGlzIGRpZG4ndCByZWdpc3RlciB0byBt
ZSBhcyBhIG5ldyBVQVBJLCBldmVuIGlmCj4gPiBMYXVyZW50IGFza2VkIGFib3V0IGl0IHNvbWUg
eWVhcnMgYmFjay4KPiA+Cj4gPiBTbywgbXkgbWlzdGFrZS4KPiA+Cj4gPiBUaGUgZmxhZ3MgYXJl
IGFkZGVkIGluIGEgc2luZ2xlIHBhdGNoLCBzbyBJIGNhbiBlYXNpbHkgcHVzaCBhIHJldmVydCBm
b3IKPiA+IHRoYXQgaWYgdGhpcyBwYXRjaCBpcyBub3QgYWNjZXB0YWJsZS4gVGhlIHJlc3Qgb2Yg
dGhlIHNlcmllcyBpcyBjbGVhbnVwLgo+ID4KPgo+IEknbGwgd2FpdCBmb3IgRGF2ZSBvciBEYW5p
ZWwgdG8gd2VpZ2ggaW4gb24gd2hldGhlciB0aGV5IHdhbnQgdG8gdGFrZQo+IHRoaXMsIG90aGVy
d2lzZSBJJ2xsIHJldmVydCBiZWZvcmUgc2VuZGluZyB0aGUgbmV4dCBwdWxsIGFuZCB3ZSBjYW4K
PiBoYXZlIHRoaXMgY29udmVyc2F0aW9uIG9uIHRoZSByZXZpZXcuCgpJJ2QgcmF0aGVyIHdlIHJl
dmVydCBpdCwganVzdCB0byBzdGljayB0byBzb21lIHNlbWJsYW5jZSBvZiB0aGUgcnVsZXMsCm90
aGVyd2lzZSBpZiB3ZSBtYWtlIGV4ZWNwdGlvbnMgb3RoZXIgcGVvcGxlIHdpbGwgZHJpdmUgdHJ1
Y2tzIHRocm91Z2gKdGhlbS4KCkRhdmUuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
