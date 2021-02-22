Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83797322189
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 22:38:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E431F898E1;
	Mon, 22 Feb 2021 21:38:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76662898E1;
 Mon, 22 Feb 2021 21:38:35 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id l5so3333251ooj.7;
 Mon, 22 Feb 2021 13:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BdA4QMTkvcuLnrvRLDVtBXvNd3HImh3DqClB8gl/vNc=;
 b=jV8vA8ffi1Ah+DtRGWB7+I7T3WuB40v2z1tztQc7a5uWHrAuMzNGfroESOSWu0WcZ2
 dBrkXBgxKWwtmiOZid6iaruXrpyvamrAQGEO9dDUhjpWN1ZcsDJwHgKjoQ9NYAdRKnSi
 RPFBYbriX9O6Zxs0SJq1zO9hktkIwTJGeil6WNtGvDu9KaKcjIX9rY6Qu2nBRLyrD1cV
 lZYzZK+F/92Bsm0yG5chEGmK3ONt3oPcv6Xg95Clm3ck5D+p0EAXk2ePe42QTWZ4eGCR
 K/p/1HqvxqQpebi+I2zdi33AFxdpKZsSXJajhWuoFgx4mVJuRNv4Ot5f7zxbw1uXnqgi
 G+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BdA4QMTkvcuLnrvRLDVtBXvNd3HImh3DqClB8gl/vNc=;
 b=s0Qkg9xOVjwiH9JOV70qKx/uya7z3FzRHqmMgdaoTuxq9rXKzAm87qhynU2jEEX9cL
 yn1TQyGUb9+XcgNzZFEE/s+VggUgSyAeFmvdgDc+HGQqyKjQn2aR9SuljTQbC+m14Eny
 yNgxubDTob8C4z0xBwwGk8w0qFxvxaP0VUnrLhk9haqrb6aHQi9BpEXr/JvCcc5fevvu
 Da3iT33Xu/2PyJDrTcM56mw6D3SolWaBmPWc/TVdPPBlLcIbW3wvk28EDpgR6014l+BK
 Xp+AuhayDA0tLWNXcw1BVnRRNVu+L0CkTkTf+3YfuZlE/eg9ZBxk7E+USUIWbl5kOYPy
 KRTw==
X-Gm-Message-State: AOAM533/h6Y3ySn1mWCZfMj6COVd84g1Ga+sAUK67wIyqHAXXlQAgqMH
 VueUR0+vnuJpxl6b4Z/ExF5ts2qKvRwbmDU5nZU=
X-Google-Smtp-Source: ABdhPJyd9vTXp2zxAjtj+Zjzb2HSfrL+MuU1Fsvdy/rwyJVFvzuRT76sJTKVRtzMZefb1N/9hBKBE8vhI8oxnNNVJyw=
X-Received: by 2002:a4a:9801:: with SMTP id y1mr1728430ooi.90.1614029914834;
 Mon, 22 Feb 2021 13:38:34 -0800 (PST)
MIME-Version: 1.0
References: <20210218224849.5591-1-nathan@kernel.org>
 <DE2DF569-7545-41C2-AF18-400D6BD73215@amd.com>
In-Reply-To: <DE2DF569-7545-41C2-AF18-400D6BD73215@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 22 Feb 2021 16:38:23 -0500
Message-ID: <CADnq5_Oc5U9-bPzr4vNiF=BvxSfQHKCvGmSjJjKh=6OUbxmZ0g@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm/swsmu: Avoid using structure_size
 uninitialized in smu_cmn_init_soft_gpu_metrics
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
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
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Nathan Chancellor <nathan@kernel.org>,
 "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIFRodSwgRmViIDE4LCAyMDIxIGF0IDY6MTIgUE0g
V2FuZywgS2V2aW4oWWFuZykgPEtldmluMS5XYW5nQGFtZC5jb20+IHdyb3RlOgo+Cj4gdGhhbmtz
LAo+Cj4gUmV2aWV3ZWQtYnk6IEtldmluIFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+Cj4KPiBS
ZWdhcmRzLAo+IEtldmluCj4KPiA+IOWcqCAyMDIx5bm0MuaciDE55pel77yMMDY6NDnvvIxOYXRo
YW4gQ2hhbmNlbGxvciA8bmF0aGFuQGtlcm5lbC5vcmc+IOWGmemBk++8mgo+ID4KPiA+IO+7v0Ns
YW5nIHdhcm5zOgo+ID4KPiA+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3BtL3N3c211
L3NtdV9jbW4uYzo3NjQ6Mjogd2FybmluZzoKPiA+IHZhcmlhYmxlICdzdHJ1Y3R1cmVfc2l6ZScg
aXMgdXNlZCB1bmluaXRpYWxpemVkIHdoZW5ldmVyIHN3aXRjaCBkZWZhdWx0Cj4gPiBpcyB0YWtl
biBbLVdzb21ldGltZXMtdW5pbml0aWFsaXplZF0KPiA+ICAgICAgICBkZWZhdWx0Ogo+ID4gICAg
ICAgIF5+fn5+fn4KPiA+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3BtL3N3c211L3Nt
dV9jbW4uYzo3NzA6MjM6IG5vdGU6Cj4gPiB1bmluaXRpYWxpemVkIHVzZSBvY2N1cnMgaGVyZQo+
ID4gICAgICAgIG1lbXNldChoZWFkZXIsIDB4RkYsIHN0cnVjdHVyZV9zaXplKTsKPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fgo+ID4gZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvLi4vcG0vc3dzbXUvc211X2Ntbi5jOjc1MzoyNTogbm90ZToKPiA+IGluaXRp
YWxpemUgdGhlIHZhcmlhYmxlICdzdHJ1Y3R1cmVfc2l6ZScgdG8gc2lsZW5jZSB0aGlzIHdhcm5p
bmcKPiA+ICAgICAgICB1aW50MTZfdCBzdHJ1Y3R1cmVfc2l6ZTsKPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIF4KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA9IDAK
PiA+IDEgd2FybmluZyBnZW5lcmF0ZWQuCj4gPgo+ID4gUmV0dXJuIGluIHRoZSBkZWZhdWx0IGNh
c2UsIGFzIHRoZSBzaXplIG9mIHRoZSBoZWFkZXIgd2lsbCBub3QgYmUga25vd24uCj4gPgo+ID4g
Rml4ZXM6IGRlNGI3Y2Q4Y2I4NyAoImRybS9hbWQvcG0vc3dzbXU6IHVuaWZ5IHRoZSBpbml0IHNv
ZnQgZ3B1IG1ldHJpY3MgZnVuY3Rpb24iKQo+ID4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL0Ns
YW5nQnVpbHRMaW51eC9saW51eC9pc3N1ZXMvMTMwNAo+ID4gU2lnbmVkLW9mZi1ieTogTmF0aGFu
IENoYW5jZWxsb3IgPG5hdGhhbkBrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiBkcml2ZXJzL2dwdS9k
cm0vYW1kL3BtL3N3c211L3NtdV9jbW4uYyB8IDIgKy0KPiA+IDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL3BtL3N3c211L3NtdV9jbW4uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dz
bXUvc211X2Ntbi5jCj4gPiBpbmRleCBiYjYyMGZkZDRjZDIuLmJjZWRkNGQ5MmUzNSAxMDA2NDQK
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dzbXUvc211X2Ntbi5jCj4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211L3NtdV9jbW4uYwo+ID4gQEAgLTc2Miw3ICs3
NjIsNyBAQCB2b2lkIHNtdV9jbW5faW5pdF9zb2Z0X2dwdV9tZXRyaWNzKHZvaWQgKnRhYmxlLCB1
aW50OF90IGZyZXYsIHVpbnQ4X3QgY3JldikKPiA+ICAgICAgICBzdHJ1Y3R1cmVfc2l6ZSA9IHNp
emVvZihzdHJ1Y3QgZ3B1X21ldHJpY3NfdjJfMCk7Cj4gPiAgICAgICAgYnJlYWs7Cj4gPiAgICBk
ZWZhdWx0Ogo+ID4gLSAgICAgICAgYnJlYWs7Cj4gPiArICAgICAgICByZXR1cm47Cj4gPiAgICB9
Cj4gPgo+ID4gI3VuZGVmIE1FVFJJQ1NfVkVSU0lPTgo+ID4gLS0KPiA+IDIuMzAuMQo+ID4KPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZngg
bWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
