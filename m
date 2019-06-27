Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADE457FCE
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 12:00:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE9266E0B6;
	Thu, 27 Jun 2019 09:59:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4B26E02A
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 09:59:57 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id t76so1141636oih.4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 02:59:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HnsXgfxcjWi4hblx1h0bG7dR5iKqxCLhNnfG59YxPfE=;
 b=nvA+lijiP7Ws08NmOc7mr72YJOIKZ6h0XM9iAP/S1ra5/r/2P8tzX2mfQQHk6h3XIX
 SKhJVsvlSMDYEcj8aUlWUTO465yEjwyXy7H/kDnuzbr1TEA2nA9+gCgTlSIfxdRF4k8g
 q1X9mIipnH6LIQG9MiPbRFQsK7K2xgSOO+xpF90Cl/FyBE11LqtepHBrmzeQ5cG6zuzG
 LSxsFw91KW9l7vh5BJll2IS5TcMgwBl/oSA/I2iIk+4Dil1c00Jlujg8BRDKNCEEfyfl
 D6mf20DCb4tcGWbA49rRVTWT9hoEX2yvKbyx2O6kB9D0JYu1+eGMTuhFRpn0kTeR1Nqm
 BU1A==
X-Gm-Message-State: APjAAAVSelQSW0YJuKsDdukanW2pGyF0cjHIdi675U6+R67aDQHFpTuK
 FOPLo0IdEZMZYJdLnJGyZ0i0JbaqoDF8PfSG8rNnsA==
X-Google-Smtp-Source: APXvYqxwPA7lfuWhmgDoMHstICy0MQ10+hJkZa+U3UC4SDoyzaujLlpcTw2w4ozcw+7JxzrWIge9MaNDhllhfoB8Ua0=
X-Received: by 2002:aca:b104:: with SMTP id a4mr1701404oif.14.1561629596539;
 Thu, 27 Jun 2019 02:59:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-41-daniel.vetter@ffwll.ch>
 <20190617082438.s5eypq5lf6s33nyz@sirius.home.kraxel.org>
 <20190617135912.GB12905@phenom.ffwll.local>
 <e51754b0-542c-b1bb-9d5b-e53daf6d92eb@suse.de>
In-Reply-To: <e51754b0-542c-b1bb-9d5b-e53daf6d92eb@suse.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 27 Jun 2019 11:59:44 +0200
Message-ID: <CAKMK7uE=9DDLuP4CujX3vF8TBEbYQofLu7rgPs+-s+oKx19M8g@mail.gmail.com>
Subject: Re: [PATCH 40/59] drm/vram-helper: Drop drm_gem_prime_export/import
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HnsXgfxcjWi4hblx1h0bG7dR5iKqxCLhNnfG59YxPfE=;
 b=fZ/ywY077uTDDZIRlhM83Nf0w/6BZHqKRFQVY/TkXwIp7IooHkMLGp08N7EW8+JhJ6
 IsDcg03sbLTOL1ejm6AC6NAyNicxteiSrCVwDQEp4W87B+4kjeChA7uKAqmFv5YgxcyB
 hdzTxoxOd2Z+Doyuj36d2uAgIgP1RT8xD8z10=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMTA6MjcgQU0gVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+IHdyb3RlOgo+Cj4gSGkKPgo+IEFtIDE3LjA2LjE5IHVtIDE1OjU5IHNj
aHJpZWIgRGFuaWVsIFZldHRlcjoKPiA+IE9uIE1vbiwgSnVuIDE3LCAyMDE5IGF0IDEwOjI0OjM4
QU0gKzAyMDAsIEdlcmQgSG9mZm1hbm4gd3JvdGU6Cj4gPj4gICBIaSwKPiA+Pgo+ID4+PiBBc2lk
ZTogV291bGQgYmUgcmVhbGx5IG5pY2UgdG8gc3dpdGNoIHRoZSBvdGhlcnMgb3ZlciB0bwo+ID4+
PiBkcm1fZ2VtX29iamVjdF9mdW5jcy4KPiA+Pgo+ID4+IFdoaWxlIG1vc3QgY2FsbGJhY2tzIGFy
ZSBwcmV0dHkgc3RyYWlnaHQgZm9yd2FyZCAoanVzdCBob29rIHRoZSBzYW1lCj4gPj4gY2FsbGJh
Y2tzIGludG8gdGhlIGRybV9nZW1fb2JqZWN0X2Z1bmNzLiBzdHJ1Y3QpIHRoZSBtbWFwIGJpdHMg
YXJlIGEKPiA+PiBiaXQgbW9yZSBvYnNjdXJlLgo+ID4+Cj4gPj4gRmlyc3QsIHRoZXJlIHNlZW0g
dG8gYmUgdHdvIHdheXMgdG8gbW1hcCBhIGdlbSBidWZmZXI6Cj4gPj4KPiA+PiAgICgxKSBkcm1f
ZHJpdmVyLT5mb3BzLT5tbWFwLCBhbmQKPiA+PiAgICgyKSBkcm1fZHJpdmVyLT5nZW1fcHJpbWVf
bW1hcC4KPiA+Pgo+ID4+IGRybV9nZW1fb2JqZWN0X2Z1bmNzIGhhcyBqdXN0IGEgc2luZ2xlIHZt
X29wcyAuLi4KPiA+Pgo+ID4+IEFsc28gaXQgaXMgbm90IG9idmlvdXMgaG93IG9uZSB3b3VsZCBj
b252ZXJ0IHNvbWV0aGluZyB3aGljaCBiYXNpY2FsbHkKPiA+PiBjYWxscyB0dG1fYm9fbW1hcCgp
IGluIGRybV9kcml2ZXItPmZvcHMtPm1tYXAgdG8gdGhlIG5ldyBpbnRlcmZhY2UuCj4gPgo+ID4g
WWVhaCB0aGUgbW1hcCBzaWRlIGlzIHN0aWxsIGEgbWVzcywgYnV0IG15IHNlcmllcyBoZXJlIHdh
cyBnZXR0aW5nIGEgYml0Cj4gPiB0b28gbG9uZyBhbHJlYWR5LiBUaGVyZSdzIGEgYnVuY2ggb2Yg
cHJvYmxlbXMgaGVyZToKPiA+Cj4gPiBkcm1fZHJpdmVyLT5nZW1fcHJpbWVfbW1hcCBjb3VsZCBi
ZSBudWtlZCBhbmQgaW5zdGVhZCB3ZSB1c2UKPiA+IGRybV9nZW1fcHJpbWVfbW1hcCBldmVyeXdo
ZXJlLiBFc3BlY2lhbGx5IHRoZSB2YXJpb3VzIHZlcnNpb25zIGluIGhlbHBlcnMKPiA+IHJlYWxs
eSBkb24ndCBhZGQgbXVjaC4KPiA+Cj4gPiBUaGUgdHJvdWJsZSBpcyB0aGF0IHJlbW92aW5nIHRo
ZSBob29rIG91dHJpZ2h0IGlzbid0IHF1aXRlIHJpZ2h0LCBiZWNhdXNlCj4gPiBpdCBhbHNvIHNp
Z25hbHMgImlzIG1tYXAgYWxsb3dlZCBvbiB0aGlzIGRtYS1idWYiLiBJJ20ga2luZGEgdGVtcHRl
ZCB0bwo+ID4ganVzdCBtYWtlIHRoYXQgYSBoYXJkIHJlcXVpcmVtZW50LCBhbmQgZm9yY2UgcGVv
cGxlIHdobyBjYW4ndCBzdXBwb3J0IG1tYXAKPiA+IG9uIHRoZSBkbWEtYnVmIChvciB3aG8gbmVl
ZCBiZWdpbi9lbmRfY3B1X2FjY2VzcyBob29rcykgdG8gc3VwcGx5IHRoZWlyCj4gPiBvd24gc2V0
IG9mIGRtYV9idWZfb3BzLgo+ID4KPiA+IFNlY29uZCBvbmUgaXMgZHJtX2RyaXZlci0+Zm9wcy0+
bW1hcC4gVGhhdCBvbmUgd2UgbmVlZCB0byBrZWVwLCBidXQgdGhpcwo+ID4gaXNuJ3QgbW1hcCBv
biBhIGJ1ZmZlciwgYnV0IG1tYXAgb24gdGhlIGVudGlyZSBkcm1fZGV2aWNlLiBUaGUgb25lIHdo
aWNoCj4gPiBzaG91bGQgYmUgcmVwbGFjZWQgYnkgZHJtX2dlbV9vYmplY3RfZnVuY3Mudm1fb3Bz
IGlzCj4gPiBkcm1fZHJpdmVyLT5nZW1fdm1fb3BzLgo+Cj4gRnJvbSB3aGF0IEkndmUgc2VlbiBp
biBmYmRldiBkcml2ZXJzLCBpdCdzIGFuIG1tYXAgb2YgdGhlIGZyYW1lYnVmZmVyCj4gbWVtb3J5
LCB3aGljaCB0eXBpY2FsbHkgaXMgdGhlIHNhbWUgYXMgdGhlIGRldmljZSdzIG1lbW9yeSBidXQg
ZG9lc24ndAo+IGhhdmUgdG8uIEFuZCBpdCdzIG9ubHkgdmFsaWQgZm9yL3doaWxlIHRoZSBjdXJy
ZW50IGRpc3BsYXkgbW9kZSAoZS5nLiwKPiBtZ2FmYiBkb2Vzbid0IHNldCBmaXhlcy5zbWVtX2xl
bmd0aCB1bnRpbCB5b3UgY29uZmlndXJlIGEgbW9kZSkuCj4KPiBJIGd1ZXNzIGl0IHNob3VsZCBi
ZSBsZWdhbCB0byBqdXN0IG1tYXAgdGhlIHNoYWRvdyBGQiBmcm9tIHRoZSBmYmNvbgo+IGVtdWxh
dGlvbi4KCmZiZGV2IG1tYXAgaXMgYW4gZW50aXJlbHkgZGlmZmVyZW50IGJlYXN0IC4uLiBidXQg
eWVhaCBtYXliZSB3ZSBzaG91bGQKcmV3b3JrIHRoYXQgb25lIHRvby4gUHJvYmxlbSB0aGVyZSBp
cyB0aGF0IGl0IGludGVyZWFjdHMgYmFkbHkgd2l0aApkZWZpbywgc28gZm9yIGF0IGxlYXN0IHNv
bWUgZHJpdmVycyB5b3UgY2FuJ3QgZG8gdGhlIHN0cmFpZ2h0Zm9yd2FyZAp0aGluZyBhdCBhbGwu
Ci1EYW5pZWwKCj4KPiBCZXN0IHJlZ2FyZHMKPiBUaG9tYXMKPgo+ID4gSG9wZSB0aGF0IGV4cGxh
aW5zIGEgYml0IGJldHRlciB3aGF0J3MgZ29pbmcgb24gaGVyZS4gU3RlcCBvbmUgaGVyZSBmb3IK
PiA+IG1tYXAgaXMgZGVmaW5pdGVseSB0byByb2xsIG91dCBkcm1fZ2VtX3ByaW1lX21tYXAgYXMg
ZmFyIGFzIHBvc3NpYmxlLCBzbwo+ID4gaXQncyBlYXNpZXIgdG8gdW5kZXJzdGFuZCB3aGVyZSB0
aGUgZXhjZXB0aW9ucyBhcmUuCj4gPgo+ID4gQ2hlZXJzLCBEYW5pZWwKPiA+Cj4KPiAtLQo+IFRo
b21hcyBaaW1tZXJtYW5uCj4gR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcgo+IFNVU0UgTGludXgg
R21iSCwgTWF4ZmVsZHN0cmFzc2UgNSwgOTA0MDkgTnVlcm5iZXJnLCBHZXJtYW55Cj4gR0Y6IEZl
bGl4IEltZW5kw7ZyZmZlciwgTWFyeSBIaWdnaW5zLCBTcmkgUmFzaWFoCj4gSFJCIDIxMjg0IChB
RyBOw7xybmJlcmcpCj4KCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50
ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5j
aApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
