Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FB41DE96F
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 16:47:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C046E9F9;
	Fri, 22 May 2020 14:47:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E53F6E9F9;
 Fri, 22 May 2020 14:47:02 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id c3so6179762wru.12;
 Fri, 22 May 2020 07:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FJLUjBuFGBG9K6nNrkEm7oIIr33fE1bvy0GPNpUlYiA=;
 b=LkAodB6uqnzUVqkofGVTcncGAHkjfH+tGR+BUicspSJGHkkiBeZZcZKtUcKHS/NDQy
 f+ALuUQxUIyH5lUTCaAZMIhp71CzzbeYECtJ10PaeRCvUX8rwiNvMIeIA2UAC3rLHmPB
 ZRCNhYOuaK0ugqNszE6lzzfMlv4dfpgAGsNQQzomEE1vlAD1s5i5ZeFgp3V07QgqWS+L
 eDTRlpwuu8G81H/Y2K8aGM0NPgyFqGEkRShXrUlxo59OZEgesUlynVHXmmOQDFTxufES
 0Db6fhJhsvOUvuMMBzejregAMWGJIWM9pLuNr/FKrfHY0wZUWjVob5Q/JvxaTlX13HsF
 Frug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FJLUjBuFGBG9K6nNrkEm7oIIr33fE1bvy0GPNpUlYiA=;
 b=Mj6tDtUBQ2C7F70ri2RwrmFT5sh3AsUW9Kbaf1nwZb/EkkTyyQK9YcLKnJ5xzoYjdc
 prfDlFPuACTHQgK0Y5xt3DjK/lcMjxwJpTZXijeqdE7aDR7IfHgyoMFogBQefCrqXcLS
 Gr/oU8/ruKIO5l2kDADyQybxmw/qE5vKj5U+NtzqcPqhJELvpN1dPemqg8oX8pVgBkZx
 x6ZVh9NWZjslh2p8suuRqeWhWsbO0E42cVz/fRU9KQeaMp4tkgH+2xm5Fzsj3LKvpMnS
 gqeBp/vyNdnwQ0rLWddl0Y2B1RgG4pUKwTNQt8P7f4grbnZGve9yNSiRgXQZ/qxCzIYb
 dAaQ==
X-Gm-Message-State: AOAM531D6DBsbZ4nZxcXg+BqyfpV+pay9JoE0RfxRdNwZRBH/2Cf/0tL
 E32QB2FaJBep1IKj7P8DwNhditDIfucJYLHkvgZLiw==
X-Google-Smtp-Source: ABdhPJwZ0Iv4BZM0I8hDBBtF89c0VMMfI+eFiTVnQNDBpzDF1oEwZIeqT+IC3dwns8jbTGf8E8nfKrpKragTMn0LlbE=
X-Received: by 2002:a05:6000:14b:: with SMTP id
 r11mr3980382wrx.124.1590158821059; 
 Fri, 22 May 2020 07:47:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200513110313.12979-1-christian.koenig@amd.com>
 <9d784383-905e-59af-b17c-923c92474ece@gmail.com>
 <CADnq5_PxUD546E852r918xEc=MddzArLDciBKtJRpuoiC4e-qQ@mail.gmail.com>
 <9e87c7db-3129-42fb-e1b3-0b8dfe3bca8f@gmail.com>
In-Reply-To: <9e87c7db-3129-42fb-e1b3-0b8dfe3bca8f@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 22 May 2020 10:46:50 -0400
Message-ID: <CADnq5_PeGnkDoHdpPL6uK_hgih6aNsjYrVaiiDYjD0T43udgGw@mail.gmail.com>
Subject: Re: [RFC] Deprecate AGP GART support for Radeon/Nouveau/TTM
To: Christian Koenig <christian.koenig@amd.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 nouveau <nouveau@lists.freedesktop.org>, debian-powerpc@lists.debian.org,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMjIsIDIwMjAgYXQgNjo0MSBBTSBDaHJpc3RpYW4gS8O2bmlnCjxja29lbmln
LmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBBbSAyMC4wNS4yMCB1bSAxODox
OCBzY2hyaWViIEFsZXggRGV1Y2hlcjoKPiA+IE9uIFdlZCwgTWF5IDIwLCAyMDIwIGF0IDEwOjQz
IEFNIENocmlzdGlhbiBLw7ZuaWcKPiA+IDxja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNv
bT4gd3JvdGU6Cj4gPj4gQW0gMTMuMDUuMjAgdW0gMTM6MDMgc2NocmllYiBDaHJpc3RpYW4gS8O2
bmlnOgo+ID4+PiBVbmZvcnR1bmF0ZWx5IEFHUCBpcyBzdGlsbCB0byB3aWRlbHkgdXNlZCBhcyB3
ZSBjb3VsZCBqdXN0IGRyb3Agc3VwcG9ydCBmb3IgdXNpbmcgaXRzIEdBUlQuCj4gPj4+Cj4gPj4+
IE5vdCB1c2luZyB0aGUgQUdQIEdBUlQgYWxzbyBkb2Vzbid0IG1lYW4gYSBsb3NzIGluIGZ1bmN0
aW9uYWxpdHkgc2luY2UgZHJpdmVycyB3aWxsIGp1c3QgZmFsbGJhY2sgdG8gdGhlIGRyaXZlciBz
cGVjaWZpYyBQQ0kgR0FSVC4KPiA+Pj4KPiA+Pj4gRm9yIG5vdyBqdXN0IGRlcHJlY2F0ZSB0aGUg
Y29kZSBhbmQgZG9uJ3QgZW5hYmxlIHRoZSBBR1AgR0FSVCBpbiBUVE0gZXZlbiB3aGVuIGdlbmVy
YWwgQUdQIHN1cHBvcnQgaXMgYXZhaWxhYmxlLgo+ID4+IFNvIEkndmUgdXNlZCBhbiBhbmNpZW50
IHN5c3RlbSAoMzJiaXQpIHRvIHNldHVwIGEgdGVzdCBib3ggZm9yIHRoaXMuCj4gPj4KPiA+Pgo+
ID4+IFRoZSBmaXJzdCBHUFUgSSBjb3VsZCB0ZXN0IGlzIGFuIFJWMjgwIChSYWRlb24gOTIwMCBQ
Uk8pIHdoaWNoIGlzIGVhc2lseQo+ID4+IDE1IHllYXJzIG9sZC4KPiA+Pgo+ID4+IFdoYXQgaGFw
cGVucyBpbiBBR1AgbW9kZSBpcyB0aGF0IGdseGdlYXJzIHNob3dzIGFydGlmYWN0cyBkdXJpbmcK
PiA+PiByZW5kZXJpbmcgb24gdGhpcyBzeXN0ZW0uCj4gPj4KPiA+PiBJbiBQQ0kgbW9kZSB0aG9z
ZSByZW5kZXJpbmcgYXJ0aWZhY3RzIGFyZSBnb25lIGFuZCBnbHhnZWFycyBzZWVtcyB0bwo+ID4+
IGRyYXcgZXZlcnl0aGluZyBjb3JyZWN0bHkgbm93Lgo+ID4+Cj4gPj4gUGVyZm9ybWFuY2UgaXMg
b2J2aW91c2x5IG5vdCBjb21wYXJhYmxlLCBjYXVzZSBpbiBBR1Agd2UgZG9uJ3QgcmVuZGVyCj4g
Pj4gYWxsIHRyaWFuZ2xlcyBjb3JyZWN0bHkuCj4gPj4KPiA+Pgo+ID4+IFRoZSBzZWNvbmQgR1BV
IEkgY291bGQgdGVzdCBpcyBhbiBSVjYzMCBQUk8gKFJhZGVvbiBIRCAyNjAwIFBSTyBBR1ApCj4g
Pj4gd2hpY2ggaXMgbW9yZSB0aGFuIDEwIHllYXJzIG9sZC4KPiA+Pgo+ID4+IEFzIGZhciBhcyBJ
IGNhbiB0ZWxsIHRoaXMgb25lIHdvcmtzIGluIGJvdGggQUdQIGFuZCBQQ0llIG1vZGUgcGVyZmVj
dGx5Cj4gPj4gZmluZS4KPiA+Pgo+ID4+IFNpbmNlIHRoaXMgaXMgb25seSBhIDMyYml0IHN5c3Rl
bSBJIGNvdWxkbid0IHJlYWxseSB0ZXN0IGFueSBPcGVuR0wgZ2FtZQo+ID4+IHRoYXQgd2VsbC4K
PiA+Pgo+ID4+IEJ1dCBmb3IgZ2x4Z2VhcnMgc3dpdGNoaW5nIGZyb20gQUdQIHRvIFBDSWUgbW9k
ZSBzZWVtcyB0byByZXN1bHQgaW4gYQo+ID4+IHJvdWdobHkgNSUgcGVyZm9ybWFuY2UgZHJvcC4K
PiA+Pgo+ID4+IFRoZSBzdXJwcmlzaW5nIHJlYXNvbiBmb3IgdGhpcyBpcyBub3QgdGhlIGJldHRl
ciBUTEIgcGVyZm9ybWFuY2UsIGJ1dAo+ID4+IHRoZSBsYWNrIG9mIFVTV0Mgc3VwcG9ydCBmb3Ig
dGhlIFBDSWUgR0FSVCBpbiByYWRlb24uCj4gPj4KPiA+Pgo+ID4+IFNvIGlmIGFueWJvZHkgd2Fu
dHMgdG8gZ2V0IGhpcyBoYW5kcyBkaXJ0eSBhbmQgc3F1ZWV6ZSBhIGJpdCBtb3JlCj4gPj4gcGVy
Zm9ybWFuY2Ugb3V0IG9mIHRoZSBvbGQgaGFyZHdhcmUsIHBvcnRpbmcgVVNXQyBmcm9tIGFtZGdw
dSB0byByYWRlb24KPiA+PiBzaG91bGRuJ3QgYmUgdG8gbXVjaCBvZiBhIHByb2JsZW0uCj4gPiBX
ZSBkbyBzdXBwb3J0IFVTV0Mgb24gcmFkZW9uLCBhbHRob3VnaCBJIHRoaW5rIHdlIGhhZCBzZXBh
cmF0ZSBmbGFncwo+ID4gZm9yIGNhY2hlZCBhbmQgV0MuICBUaGF0IHNhaWQgd2UgaGFkIGEgbG90
IG9mIHByb2JsZW1zIHdpdGggV0Mgb24gMzIKPiA+IGJpdCAoc2VlIHJhZGVvbl9ib19jcmVhdGUo
KSkuICBUaGUgb3RoZXIgcHJvYmxlbSBpcyB0aGF0LCBhdCBsZWFzdCBvbgo+ID4gdGhlIHJlYWxs
eSBvbGQgcmFkZW9ucywgdGhlIFBDSSBnYXJ0IGRpZG4ndCBzdXBwb3J0IHNub29wZWQgYW5kCj4g
PiB1bnNub29wZWQuICBJdCB3YXMgYWx3YXlzIHNub29wZWQuICBJdCB3YXNuJ3QgdW50aWwgcGNp
ZSB0aGF0IHRoZSBnYXJ0Cj4gPiBodyBnb3Qgc3VwcG9ydCBmb3IgYm90aC4gIEZvciBBR1AsIHRo
ZSBleHBlY3RhdGlvbiB3YXMgdGhhdCBBR1AKPiA+IHByb3ZpZGVkIHRoZSB1bmNhY2hlZCBtZW1v
cnkuCj4KPiBPaCwgaW5kZWVkLiBJIGRpZG4ndCByZW1lbWJlcmVkIHRoYXQuCj4KPiBJbnRlcmVz
dGluZyBpcyB0aGF0IGluIHRoaXMgY2FzZSBJIGhhdmUgbm8gaWRlYSB3aGVyZSB0aGUgcGVyZm9y
bWFuY2UKPiBkaWZmZXJlbmNlIGlzIGNvbWluZyBmcm9tLgo+Cj4gPgo+ID4+Cj4gPj4gU3VtbWlu
ZyBpdCB1cCBJJ20gc3RpbGwgbGVhbmluZyB0b3dhcmRzIGRpc2FibGluZyBBR1AgY29tcGxldGVs
eSBieQo+ID4+IGRlZmF1bHQgZm9yIHJhZGVvbiBhbmQgZGVwcmVjYXRlIGl0IGluIFRUTSBhcyB3
ZWxsLgo+ID4+Cj4gPj4gVGhvdWdodHM/IEVzcGVjaWFsbHkgQWxleCB3aGF0IGRvIHlvdSB0aGlu
ay4KPiA+IFdvcmtzIGZvciBtZS4KPgo+IEkgd2lsbCB0YWtlIHRoYXQgYXMgYW4gcmIgYW5kIGNv
bW1pdCBhdCBsZWFzdCB0aGUgZmlyc3QgcGF0Y2guCgpZZWFoLCBSZXZpZXdlZC1ieTogQWxleCBE
ZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgoKPgo+IFRoYW5rcywKPiBDaHJpc3Rp
YW4uCj4KPiA+Cj4gPiBBbGV4Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
