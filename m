Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4667E49BA3
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 09:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A966E114;
	Tue, 18 Jun 2019 07:59:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52B5E6E113
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 07:59:46 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id j19so13065652otq.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 00:59:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=576dHOlQtl37PxomePcFWO9cP10OXYYGTL9TbI5uP04=;
 b=boOL+SNDoVawzT2Ghg/fTU53L7SY0I0BpyP3ANKTgS9JTRj0L8u8027ZHPDqJlplZp
 6XYQg9WP2bAeCTXlPUkQWTR5I+BayUCogn8huzATyYxPClojnZDOYyHnuVaKVpfC5Y0B
 fgAAFphdiFNBK1ON17RpliD+LNMrHmjQXxO/wdwY3drX2BLt3RtmchJmyAczfaPjtjIl
 yVnn00f5UOD4A9SctM9lO5WT7h+hnz1XNcf+lmN1eN/MZg+uAUN2dKOa1sVLcUGA5/KI
 oIUZWClXTySki991/K3FVO0f2H+7Sozq6alfU8aKcYo29MJ0lBvlZYVWl0eD88+BEEAi
 bT1A==
X-Gm-Message-State: APjAAAUs6B311yFBoXOX8Y1NqHGRmzIC7V1z9jIamm1hs2KG/sV+WPYY
 6wXAHjibeBVfSDUaeE7pnsY2byS1huTj5B/6VAvuLA==
X-Google-Smtp-Source: APXvYqxS/JOh5d78roAzg1AwxnIIkcyLfudsquq/HJmHHzPgxgop9uj3dMkvEWPLVnLqOwkdGAOulDrBVMNpKNIW0X8=
X-Received: by 2002:a9d:6644:: with SMTP id q4mr49316360otm.308.1560844785556; 
 Tue, 18 Jun 2019 00:59:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-41-daniel.vetter@ffwll.ch>
 <20190617082438.s5eypq5lf6s33nyz@sirius.home.kraxel.org>
 <20190617135912.GB12905@phenom.ffwll.local>
 <20190618044925.qljngiypdch4wdsw@sirius.home.kraxel.org>
In-Reply-To: <20190618044925.qljngiypdch4wdsw@sirius.home.kraxel.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 18 Jun 2019 09:59:33 +0200
Message-ID: <CAKMK7uGzO-r5MtU+EPWiqq=J_XuF5mRo8t_br2k++Uwd0+E2Zw@mail.gmail.com>
Subject: Re: [PATCH 40/59] drm/vram-helper: Drop drm_gem_prime_export/import
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=576dHOlQtl37PxomePcFWO9cP10OXYYGTL9TbI5uP04=;
 b=ZP/TBBaYnwUapEzP7p203N4A7CXVEPU6O2L9iAfzJ064/4QiTQO7G2BeuXAtt5msg+
 IYfQZzxFGHrIubOb5nqZppe7Ney/CUEGwc/VBKisDUSxRFjNvCYHEduqcNqqyGo6xzlD
 43cH+n0Ure0vAcPx5Rp2v9F53su/S7kru7Z4E=
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
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgNjo0OSBBTSBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiAgIEhpLAo+Cj4gPiA+IFdoaWxlIG1vc3QgY2FsbGJhY2tzIGFy
ZSBwcmV0dHkgc3RyYWlnaHQgZm9yd2FyZCAoanVzdCBob29rIHRoZSBzYW1lCj4gPiA+IGNhbGxi
YWNrcyBpbnRvIHRoZSBkcm1fZ2VtX29iamVjdF9mdW5jcy4gc3RydWN0KSB0aGUgbW1hcCBiaXRz
IGFyZSBhCj4gPiA+IGJpdCBtb3JlIG9ic2N1cmUuCj4gPiA+Cj4gPiA+IEZpcnN0LCB0aGVyZSBz
ZWVtIHRvIGJlIHR3byB3YXlzIHRvIG1tYXAgYSBnZW0gYnVmZmVyOgo+ID4gPgo+ID4gPiAgICgx
KSBkcm1fZHJpdmVyLT5mb3BzLT5tbWFwLCBhbmQKPiA+ID4gICAoMikgZHJtX2RyaXZlci0+Z2Vt
X3ByaW1lX21tYXAuCj4gPiA+Cj4gPiA+IGRybV9nZW1fb2JqZWN0X2Z1bmNzIGhhcyBqdXN0IGEg
c2luZ2xlIHZtX29wcyAuLi4KPiA+ID4KPiA+ID4gQWxzbyBpdCBpcyBub3Qgb2J2aW91cyBob3cg
b25lIHdvdWxkIGNvbnZlcnQgc29tZXRoaW5nIHdoaWNoIGJhc2ljYWxseQo+ID4gPiBjYWxscyB0
dG1fYm9fbW1hcCgpIGluIGRybV9kcml2ZXItPmZvcHMtPm1tYXAgdG8gdGhlIG5ldyBpbnRlcmZh
Y2UuCj4gPgo+ID4gWWVhaCB0aGUgbW1hcCBzaWRlIGlzIHN0aWxsIGEgbWVzcywgYnV0IG15IHNl
cmllcyBoZXJlIHdhcyBnZXR0aW5nIGEgYml0Cj4gPiB0b28gbG9uZyBhbHJlYWR5LiBUaGVyZSdz
IGEgYnVuY2ggb2YgcHJvYmxlbXMgaGVyZToKPiA+Cj4gPiBkcm1fZHJpdmVyLT5nZW1fcHJpbWVf
bW1hcCBjb3VsZCBiZSBudWtlZCBhbmQgaW5zdGVhZCB3ZSB1c2UKPiA+IGRybV9nZW1fcHJpbWVf
bW1hcCBldmVyeXdoZXJlLiBFc3BlY2lhbGx5IHRoZSB2YXJpb3VzIHZlcnNpb25zIGluIGhlbHBl
cnMKPiA+IHJlYWxseSBkb24ndCBhZGQgbXVjaC4KPgo+IFdlbGwsIGV2ZXJ5dGhpbmcgdXNpbmcg
dHRtIGhhcyB0aGUgcHJvYmxlbSB0aGF0IHdlIGhhdmUgYW5vdGhlcgo+IGR1cGxpY2F0aW9uIGhl
cmU6IGJvdGggZ2VtIGFuZCB0dG0gaGF2ZSBhIHZtYV9ub2RlIC4uLgo+Cj4gU28gKGZvciBleGFt
cGxlKSBkcm1fZ2VtX3ZyYW1fZHJpdmVyX2dlbV9wcmltZV9tbWFwKCkgaXMgYSB0aGluIHdyYXBw
ZXIKPiB3aGljaCBkb2VzIChhKSBjb3B5IHZtX25vZGUuc3RhcnQgZnJvbSB0dG0gdG8gZ2VtIHZt
YV9ub2RlIGFuZCAoYikgY2FsbHMKPiBkcm1fZ2VtX3ByaW1lX21tYXAoKS4KCkhtIC4uLiBtYXli
ZSB3ZSBzaG91bGQgZGl0Y2ggdGhlIHR0bSB2bWEgb2Zmc2V0IHN0dWZmIGFuZCBmb2xkIHRoYXQK
b3ZlciBlbnRpcmVseSB0byB0aGUgZ2VtIHdheSBvZiBkb2luZyB0aGluZ3MuIFRoZSBvbmx5IHRo
aW5nIHlvdSdyZQpnb2luZyB0byBsb29zZSBpcyB0aGUgLT52ZXJpZnlfYWNjZXNzIGNhbGxiYWNr
LCB3aGljaCBhZ2FpbiBpcyBqdXN0IHRvCmdldCBiYWNrIHRvIGdlbSBJIHRoaW5rLiBZb3Ugd291
bGQgbmVlZCBhIHNsaWdodGx5IGRpZmZlcnJlbnQgdm1fb3BzCnN0cnVjdHVyZSB0aG91Z2gsIHNp
bmNlIHRoZSB0dG0gdm0gb3BzIGV4cGVjdCBhIHR0bV9idWZmZXJfb2JqZWN0LAp3aGVyZWFzIGdl
bSBnaXZlcyB5b3UgYSBkcm1fZ2VtX2J1ZmZlcl9vYmplY3QuIFNvIGVpdGhlciBuZWVkIHRvCm92
ZXJ3cml0ZSBhbGwgdGhvc2UsIG9yIG1heWJlIGl0J3MgaW5kZWQgdGltZSB0byBqdXN0IG1ha2Ug
dHRtX2JvIGEKc3ViY2xhc3Mgb2YgZ2VtX2JvLgoKPiA+IFNlY29uZCBvbmUgaXMgZHJtX2RyaXZl
ci0+Zm9wcy0+bW1hcC4gVGhhdCBvbmUgd2UgbmVlZCB0byBrZWVwLCBidXQgdGhpcwo+ID4gaXNu
J3QgbW1hcCBvbiBhIGJ1ZmZlciwgYnV0IG1tYXAgb24gdGhlIGVudGlyZSBkcm1fZGV2aWNlLiBU
aGUgb25lIHdoaWNoCj4gPiBzaG91bGQgYmUgcmVwbGFjZWQgYnkgZHJtX2dlbV9vYmplY3RfZnVu
Y3Mudm1fb3BzIGlzCj4gPiBkcm1fZHJpdmVyLT5nZW1fdm1fb3BzLgo+Cj4gSG1tLCBzZWVtcyB0
dG0gaGFzbid0IHNvbWV0aGluZyBJIGNhbiBob29rIGludG8gZHJtX2RyaXZlci0+Z2VtX3ZtX29w
cyAuLi4KCnR0bV9ib192bV9vcHMgc2VlbXMgdG8gYmUgdGhlIHRoaW5nIHlvdSB3YW50LgoKQ2hl
ZXJzLCBEYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENv
cnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
