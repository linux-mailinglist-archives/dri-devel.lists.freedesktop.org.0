Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B1ADFDF2
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 09:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D15F6E3EE;
	Tue, 22 Oct 2019 07:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08F4D6E3EE
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 07:02:00 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id g81so13265564oib.8
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 00:01:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l70a/aYM/ctJi3VqLPa7sJG/NMEQKC0MpDDSMP5Acto=;
 b=hV7AZ4wIo0+1mi4Oob50rgPua1tF4rDciYyby+jeTbAn7U3OvvyL8Y6oZLSOxySZW8
 3ZR6cU77V7IUY/1kr/SwgkBxtcIVUXXXffktcZFZSxzGb784PmfCxVNNJls+ZSAc2/4L
 xN6GzDDEIVDABMrPopQ/XhOPQzAGlVp0eYjrVLYdAXd1UOFYqiNH0YS6CXjPpO6mquIM
 iz2wlklpGvskK3aAxMgcW5ptc22KibcWGM9AaPKvsjuo4mM0bF7k3H65jf8gw8VDEg73
 tKeBYNQup6ncrXJXJCimbikS8u4FvY1eHq6x8AjM5BLzKYt+y7UiUYfX6dfWTBvM9KKV
 92Dw==
X-Gm-Message-State: APjAAAXXM3qOWFQCJxd7M9pNgfMLd3DPyCOFDisQbn2r2TIx/flIyN3V
 0VN3EybSA5jdS+1viekOx4vlZZU4ZzdMMWn3Z1sV0A==
X-Google-Smtp-Source: APXvYqyLGDSdCtouQQlqqUftGYSFIiRvDfDxH4jr7K89WYA0GhOe6+egeCddNRR4ZEVPFP6ZhrnVjqEIHIW5GDb/+Ko=
X-Received: by 2002:aca:e046:: with SMTP id x67mr1536700oig.101.1571727719051; 
 Tue, 22 Oct 2019 00:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <20191017192601.GA215957@art_vandelay>
 <febda9e7-d62b-128c-819a-71c57d9c001d@ti.com>
 <CAMavQKKBUk+tXYE3Z4Q7mh+tRqQEZ+vsJaLYEhT95=e3i31AdQ@mail.gmail.com>
 <6dd06a02-b28f-d6a9-da23-f1eb0ce70fca@ti.com>
 <CAMavQK+vNihFv_LKPqpUgBwXh_LCQ8=g=_zyTDe08+pKiVTOGw@mail.gmail.com>
 <CAPM=9txA+24bz37Xu6ro5RZThV4HTL+niKL6s=TOEq+J7V3F+g@mail.gmail.com>
In-Reply-To: <CAPM=9txA+24bz37Xu6ro5RZThV4HTL+niKL6s=TOEq+J7V3F+g@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 22 Oct 2019 09:01:47 +0200
Message-ID: <CAKMK7uEg38TqUiCQY_KBCVkeA5Z5WB+NawifS34k57NKBVap6g@mail.gmail.com>
Subject: Re: [Intel-gfx] [PULL] drm-misc-next
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=l70a/aYM/ctJi3VqLPa7sJG/NMEQKC0MpDDSMP5Acto=;
 b=IqykTmElCPEI1evrJ/Wky+Z7t234btogb5HdYbRv05BhucyZaqHS7dkZYFvLJJZtO6
 511lprED4/EcDyyJKFLqjMYjwKKyB5I1usx3Z+yAZKAg3j9b328JvuR4Is2QdcL/UOmm
 P05uOUI2TfosmBp61DwJ5Z+LZ5ERY8nlBp3U0=
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
 Sean Paul <sean@poorly.run>,
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

T24gVHVlLCBPY3QgMjIsIDIwMTkgYXQgNDoxNyBBTSBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCAyMiBPY3QgMjAxOSBhdCAwMTo0OSwgU2VhbiBQYXVs
IDxzZWFuQHBvb3JseS5ydW4+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwgT2N0IDIxLCAyMDE5IGF0
IDQ6MTEgQU0gVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4gd3JvdGU6Cj4g
PiA+Cj4gPiA+IEhpLAo+ID4gPgo+ID4gPiBPbiAxOC8xMC8yMDE5IDIzOjExLCBTZWFuIFBhdWwg
d3JvdGU6Cj4gPiA+ID4gT24gRnJpLCBPY3QgMTgsIDIwMTkgYXQgOTo0NiBBTSBUb21pIFZhbGtl
aW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPiB3cm90ZToKPiA+ID4gPj4KPiA+ID4gPj4gSGkg
U2VhbiwKPiA+ID4gPj4KPiA+ID4gPj4gT24gMTcvMTAvMjAxOSAyMjoyNiwgU2VhbiBQYXVsIHdy
b3RlOgo+ID4gPiA+Pgo+ID4gPiA+Pj4gY29uY2VybiBmb3IgdGhvc2UuIFRoZSBvbWFwIE9NQVBf
Qk9fTUVNXyogY2hhbmdlcyB0aG91Z2ggSSBkb24ndCB0aGluayBoYXZlCj4gPiA+ID4+PiByZWFs
bHkgcmVhY2hlZCBub24tVEkgZXllcy4gVGhlcmUncyBubyBsaW5rIGluIHRoZSBjb21taXQgbWVz
c2FnZSB0byBhIFVBUEkKPiA+ID4gPj4+IGltcGxlbWVudGF0aW9uIGFuZCB0aGUgb25seSByZWZl
cmVuY2UgSSBjb3VsZCBmaW5kIGlzIGxpYmttc3h4IHdoaWNoIGNhbiBzZXQKPiA+ID4gPj4+IHRo
ZW0gdGhyb3VnaCB0aGUgcHl0aG9uIGJpbmRpbmdzLiBTaW5jZSB0aGlzIGlzIFRJLXNwZWNpZmlj
IGd1bmsgaW4gVEktc3BlY2lmaWMKPiA+ID4gPj4+IGhlYWRlcnMgSSdtIGluY2xpbmVkIHRvIGxl
dCBpdCBwYXNzLCBidXQgSSB3b3VsZCBoYXZlIGxpa2VkIHRvIGhhdmUgdGhpcwo+ID4gPiA+Pj4g
Y29udmVyc2F0aW9uIHVwZnJvbnQuIEkgZmlndXJlZCBJJ2QgY2FsbCB0aGlzIG91dCBzbyB5b3Ug
aGF2ZSBmaW5hbCBzYXkuCj4gPiA+ID4+Cj4gPiA+ID4+IFRoZXJlIHdhcyBzb21lIGRpc2N1c3Np
b24gYWJvdXQgdGhhdCBhIGZldyB5ZWFycyBiYWNrIHdoZW4gSSBpbml0aWFsbHkKPiA+ID4gPj4g
c2VudCB0aGUgcGF0Y2hlcywgYnV0IG5vdyB0aGF0IEkgbG9vaywgdGhlIGRpc2N1c3Npb24gZGll
ZCBiZWZvcmUgcmVhbGx5Cj4gPiA+ID4+IGV2ZW4gc3RhcnRpbmcuCj4gPiA+ID4+Cj4gPiA+ID4+
IFRoaXMgaXMgd2hhdCBJIHNhaWQgYWJvdXQgdXNlcnNwYWNlIGltcGxlbWVudGF0aW9uOgo+ID4g
PiA+Pgo+ID4gPiA+Pj4gWWVzLCB1bmZvcnR1bmF0ZWx5IHRoYXQgaXMgbm90IGdvaW5nIHRvIGhh
cHBlbi4gSSBkb24ndCBzZWUgaG93IHRoaXMKPiA+ID4gPj4+IGNvdWxkIGJlIHVzZWQgaW4gYSBn
ZW5lcmljIHN5c3RlbSBsaWtlIFdlc3RvbiBvciBYLiBJdCdzIG1lYW50IGZvciB2ZXJ5Cj4gPiA+
ID4+PiBzcGVjaWZpYyB1c2UgY2FzZXMsIHdoZXJlIHlvdSBrbm93IGV4YWN0bHkgdGhlIHJlcXVp
cmVtZW50cyBvZiB5b3VyCj4gPiA+ID4+PiBhcHBsaWNhdGlvbiBhbmQgdGhlIGNhcGFiaWxpdGll
cyBvZiB0aGUgd2hvbGUgc3lzdGVtLCBhbmQgb3B0aW1pemUgYmFzZWQKPiA+ID4gPj4+IG9uIHRo
YXQuCj4gPiA+ID4KPiA+ID4gPiBUaGFua3MgZm9yIHRoZSBjb250ZXh0LCBUb21pLgo+ID4gPiA+
Cj4gPiA+ID4gSW5kZWVkIGl0IGxvb2tzIGxpa2UgdGhlIGRpc2N1c3Npb24gZGllZCwgYnV0IExh
dXJlbnQgc3RpbGwgYnJvdWdodCB1cAo+ID4gPiA+IHRoZSB1L3MgcmVxdWlyZW1lbnQgYW5kIHRo
ZSBwYXRjaCB3YXMgZWZmZWN0aXZlbHkgZGVhZCB1bnRpbCBEYW5pZWwgb3IKPiA+ID4gPiBEYXZl
IHdlaWdoZWQgaW4uIEknZCBleHBlY3QgYXQgbGVhc3Qgc29tZSBvdXRyZWFjaCBiZWZvcmUgcHVz
aGluZyB0aGUKPiA+ID4gPiBwYXRjaCBkaXJlY3RseSAyKyB5ZWFycyBsYXRlci4gSGFzIGFueXRo
aW5nIGNoYW5nZWQgc2luY2UgdGhlbj8KPiA+ID4KPiA+ID4gVGhlcmUgd2VyZSBuZXcgcmV2aWV3
IHJvdW5kcyBmb3IgdGhlIHNlcmllcyB0aGlzIHN1bW1lciAmIGF1dHVtbiwgYnV0Cj4gPiA+IG5v
LCBub3RoaW5nIGVsc2UuIEkgaGF2ZW4ndCBzcGVjaWZpY2FsbHkgcGluZ2VkIGFueW9uZSBhYm91
dCB0aGUgVUFQSQo+ID4gPiBjaGFuZ2VzLgo+ID4gPgo+ID4gPiBUaGlzIHNlcmllcyBpbnRyb2R1
Y2VzIHRocmVlIG5ldyBmbGFncyB0byBhbiBhbHJlYWR5IGV4aXN0aW5nIFVBUEksIGFuZCwKPiA+
ID4gZm9yIHdoYXRldmVyIHJlYXNvbiwgdGhpcyBkaWRuJ3QgcmVnaXN0ZXIgdG8gbWUgYXMgYSBu
ZXcgVUFQSSwgZXZlbiBpZgo+ID4gPiBMYXVyZW50IGFza2VkIGFib3V0IGl0IHNvbWUgeWVhcnMg
YmFjay4KPiA+ID4KPiA+ID4gU28sIG15IG1pc3Rha2UuCj4gPiA+Cj4gPiA+IFRoZSBmbGFncyBh
cmUgYWRkZWQgaW4gYSBzaW5nbGUgcGF0Y2gsIHNvIEkgY2FuIGVhc2lseSBwdXNoIGEgcmV2ZXJ0
IGZvcgo+ID4gPiB0aGF0IGlmIHRoaXMgcGF0Y2ggaXMgbm90IGFjY2VwdGFibGUuIFRoZSByZXN0
IG9mIHRoZSBzZXJpZXMgaXMgY2xlYW51cC4KPiA+ID4KPiA+Cj4gPiBJJ2xsIHdhaXQgZm9yIERh
dmUgb3IgRGFuaWVsIHRvIHdlaWdoIGluIG9uIHdoZXRoZXIgdGhleSB3YW50IHRvIHRha2UKPiA+
IHRoaXMsIG90aGVyd2lzZSBJJ2xsIHJldmVydCBiZWZvcmUgc2VuZGluZyB0aGUgbmV4dCBwdWxs
IGFuZCB3ZSBjYW4KPiA+IGhhdmUgdGhpcyBjb252ZXJzYXRpb24gb24gdGhlIHJldmlldy4KPgo+
IEknZCByYXRoZXIgd2UgcmV2ZXJ0IGl0LCBqdXN0IHRvIHN0aWNrIHRvIHNvbWUgc2VtYmxhbmNl
IG9mIHRoZSBydWxlcywKPiBvdGhlcndpc2UgaWYgd2UgbWFrZSBleGVjcHRpb25zIG90aGVyIHBl
b3BsZSB3aWxsIGRyaXZlIHRydWNrcyB0aHJvdWdoCj4gdGhlbS4KCkltbyB3ZSBoYXZlIGRyaXZl
biBhIHRydWNrIHRocm91Z2ggdGhlICJpdCdzIG5vdCByZWFsbHkgbmV3IHVhcGksIG9ubHkKYSBu
ZXcgZmxhZy9maWVsZC90eXBlIGFkZGVkIHRvIGV4aXN0aW5nIHVhcGkiICsgIml0J3Mgb2J2aW91
cyB0aGlzIGlzCnRoZSByaWdodCB0aGluZyIsIGl0J3MgaG93IHdlIGdvdCBhIG1ldHJpYyB0b24g
b2YgcXVlc3Rpb25hYmxlIGttcwpwcm9wZXJ0aWVzLgoKQWxzbyBmb3IgdGhpcyBjYXNlIHNwZWNp
ZmljYWxseSwgSSdtIG5vdCBzZWVpbmcgd2h5IHdlIGNhbid0IGZvbGxvdwp0aGUgdXN1YWwgcnVs
ZXM6Ci0gbG90cyBvZiBnZW0gZHJpdmVycyBoYXZlIGJ1ZmZlciBhbGxvY2F0aW9uL3BsYWNlbWVu
dCBoaW50cyAoaXQncwpraW5kYSB0aGUgdGhpbmcgdHRtIGlzIGZvciAuLi4pLCBhbmQgdGhleSBh
bGwgZm91bmQgc29tZSB1c2Vyc3BhY2UgZm9yCml0Ci0gX1BJTiBsb29rcyBzdXNwaWNpb3VzLCBp
bW8gdGhlIHByb3BlciBhcHByb2FjaCBpcyBzb21ldGhpbmcgbGlrZQphbWRncHUncyBwZXItY3R4
IHBlcnNpc3RlbnQgd29ya2luZyBzZXQsIHdoaWNoIGdpdmVzIHlvdSB0aGUgImxvb2sgbm8KcGlu
IiBmYXN0cGF0aCB3aGlsZSBzdGlsbCBiZWluZyBhYmxlIHRvIG1hbmFnZSBidWZmZXJzIGZvciBy
ZWFsLiBUaGF0Cm9uZSBhbHNvIHllbGxzIGF0IHlvdSB3aXRoIEVOT01FTSBpZiB0aGUgbWVtb3J5
IGRvZXNuJ3QgZXhpc3QsIGF0CmFsbG9jIHRpbWUuCgp0bGRyOyBJIGNvbmN1cgoKQ2hlZXJzLCBE
YW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0
aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
