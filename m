Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8226C1037D9
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 11:47:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D116E174;
	Wed, 20 Nov 2019 10:46:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 215DF6E19B
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 10:46:58 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id q15so14734600wrw.7
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 02:46:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=f25MFDtJ7QsPAjdYr3TyjWZssTof0IPDIbycDMJaX2w=;
 b=EaEWWciLlw9cD8zFI/Ql150Erafdk9ArrFzSpva2vCPQq+75CClN6dMFgtbpa+IgMR
 PjLpDdk9F2tsIhlL3BS1p7T6TiyddgLgk3CupN3raqyPBzGLlzmE9l5qzMHGvyHpFlUF
 Ff5y2tQxL7WtGgxWKspn1ydQYaCWAoW1CxqbS8ZoOiSRH4ygFdAVSD2myWawzrsJpVmP
 1hf5eV+HQ+CPOKfsjgKgB/Aasgshvz0tt4GFhR2LLEWIg64dc7PPnD7sNlbwBcIpLyOi
 jGZOzuytOhjZ3zM5UGNSl2t6hsRYuIzxSBL/6N+GFtXTRfelqjijsVWnX2mCwzecvX6J
 skhA==
X-Gm-Message-State: APjAAAUXll4Ztd+nZLmUjnFJdC4hPn4hwCAyc40KOri96tHpC/BS1toF
 gcw/8/pMNblR5fWrXAyX8mSingNYxmQ=
X-Google-Smtp-Source: APXvYqzO379IqF3dGJDOwS67e7IMp4EJr1ZtBClB6e98QJw1IxyRAvGK55Q94GnFiM+f+l8POEJueQ==
X-Received: by 2002:a5d:6550:: with SMTP id z16mr2424139wrv.66.1574246816437; 
 Wed, 20 Nov 2019 02:46:56 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id 189sm6609908wmc.7.2019.11.20.02.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 02:46:55 -0800 (PST)
Date: Wed, 20 Nov 2019 11:46:53 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 8/8] drm/todo: Add entry for fb funcs related cleanups
Message-ID: <20191120104653.GI30416@phenom.ffwll.local>
References: <20191115092120.4445-1-daniel.vetter@ffwll.ch>
 <20191115092120.4445-9-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191115092120.4445-9-daniel.vetter@ffwll.ch>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=f25MFDtJ7QsPAjdYr3TyjWZssTof0IPDIbycDMJaX2w=;
 b=Mv1WiLrueUV22i68UPKxoac0yMrZbnBb8ESPetRh5FD60LzrmzpDjctSxWd9h8nllJ
 +RX/MAkyVtZWYjbEk900PlofytQz45E791L0S+gKA1Q9N2ohnBkpJJY/9ace8URPuXrL
 /JqrYfa8tYEG+4O0ip1ytVrfMWmPQg1gds3kI=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMTUsIDIwMTkgYXQgMTA6MjE6MjBBTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBXZSdyZSBkb2luZyBhIGdyZWF0IGpvYiBmb3IgcmVhbGx5IHNpbXBsZSBkcml2ZXJz
IHJpZ2h0IG5vdywgYnV0IHN0aWxsCj4gYSBsb3Qgb2YgYm9pbGVycGxhdGUgZm9yIHRoZSBiaWdn
ZXIgb25lcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVy
QGludGVsLmNvbT4KClBpbmcgZm9yIHNvbWUgcmV2aWV3L2Fja3Mgb24gdGhpcyBhbmQgdGhlIGVh
cmxpZXIgZHJpdmVyIHBhdGNoZXMgKG5vdApwYXRjaCAxLCB0aGF0IG9uZSBpcyBiYWQpLgoKVGhh
bmtzLCBEYW5pZWwKCj4gLS0tCj4gIERvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0IHwgMjYgKysr
KysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMo
KykKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QgYi9Eb2N1bWVu
dGF0aW9uL2dwdS90b2RvLnJzdAo+IGluZGV4IDNlYzUwOTM4MWZjNS4uMmQ4NWYzNzI4NGExIDEw
MDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0Cj4gKysrIGIvRG9jdW1lbnRh
dGlvbi9ncHUvdG9kby5yc3QKPiBAQCAtMTgyLDYgKzE4MiwzMiBAQCBDb250YWN0OiBNYWludGFp
bmVyIG9mIHRoZSBkcml2ZXIgeW91IHBsYW4gdG8gY29udmVydAo+ICAKPiAgTGV2ZWw6IEludGVy
bWVkaWF0ZQo+ICAKPiArZHJtX2ZyYW1lYnVmZmVyX2Z1bmNzIGFuZCBkcm1fbW9kZV9jb25maWdf
ZnVuY3MuZmJfY3JlYXRlIGNsZWFudXAKPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiArCj4gK0EgbG90IG1vcmUgZHJp
dmVycyBjb3VsZCBiZSBzd2l0Y2hlZCBvdmVyIHRvIHRoZSBkcm1fZ2VtX2ZyYW1lYnVmZmVyIGhl
bHBlcnMuCj4gK1ZhcmlvdXMgaG9sZC11cHM6Cj4gKwo+ICstIE5lZWQgdG8gc3dpdGNoIG92ZXIg
dG8gdGhlIGdlbmVyaWMgZGlydHkgdHJhY2tpbmcgY29kZSB1c2luZwo+ICsgIGRybV9hdG9taWNf
aGVscGVyX2RpcnR5ZmIgZmlyc3QgKGUuZy4gcXhsKS4KPiArCj4gKy0gTmVlZCB0byBzd2l0Y2gg
dG8gZHJtX2ZiZGV2X2dlbmVyaWNfc2V0dXAoKSwgb3RoZXJ3aXNlIGEgbG90IG9mIHRoZSBjdXN0
b20gZmIKPiArICBzZXR1cCBjb2RlIGNhbid0IGJlIGRlbGV0ZWQuCj4gKwo+ICstIE1hbnkgZHJp
dmVycyB3cmFwIGRybV9nZW1fZmJfY3JlYXRlKCkgb25seSB0byBjaGVjayBmb3IgdmFsaWQgZm9y
bWF0cy4gRm9yCj4gKyAgYXRvbWljIGRyaXZlcnMgd2UgY291bGQgY2hlY2sgZm9yIHZhbGlkIGZv
cm1hdHMgYnkgY2FsbGluZwo+ICsgIGRybV9wbGFuZV9jaGVja19waXhlbF9mb3JtYXQoKSBhZ2Fp
bnN0IGFsbCBwbGFuZXMsIGFuZCBwYXNzIGlmIGFueSBwbGFuZQo+ICsgIHN1cHBvcnRzIHRoZSBm
b3JtYXQuIEZvciBub24tYXRvbWljIHRoYXQncyBub3QgcG9zc2libGUgc2luY2UgbGlrZSB0aGUg
Zm9ybWF0Cj4gKyAgbGlzdCBmb3IgdGhlIHByaW1hcnkgcGxhbmUgaXMgZmFrZSBhbmQgd2UnZCB0
aGVyZWZvciByZWplY3QgdmFsaWQgZm9ybWF0cy4KPiArCj4gKy0gTWFueSBkcml2ZXJzIHN1YmNs
YXNzIGRybV9mcmFtZWJ1ZmZlciwgd2UnZCBuZWVkIGEgZW1iZWRkaW5nIGNvbXBhdGlibGUKPiAr
ICB2ZXJzaW9uIG9mIHRoZSB2YXJpb3MgZHJtX2dlbV9mYl9jcmVhdGUgZnVuY3Rpb25zLiBNYXli
ZSBjYWxsZWQKPiArICBkcm1fZ2VtX2ZiX2NyZWF0ZS9fd2l0aF9kaXJ0eS9fd2l0aF9mdW5jcyBh
cyBuZWVkZWQuCj4gKwo+ICtDb250YWN0OiBEYW5pZWwgVmV0dGVyCj4gKwo+ICtMZXZlbDogSW50
ZXJtZWRpYXRlCj4gKwo+ICBDbGVhbiB1cCBtbWFwIGZvcndhcmRpbmcKPiAgLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCj4gIAo+IC0tIAo+IDIuMjQuMAo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29m
dHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
