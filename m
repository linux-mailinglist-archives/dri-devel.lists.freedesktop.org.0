Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D99F210B344
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 17:31:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F346E33E;
	Wed, 27 Nov 2019 16:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 968926E33A
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 16:31:06 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id d202so11722233qkb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 08:31:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BW8Iv3F/t56rMQHhfpUtEUowOT8/SKG2l+YOWV4ch3Q=;
 b=NavV2gaLE5NcO4Vc4fCxr/YJash921tW4suRuaRore++S5CCBJ46Zg++t6uZp5iE7W
 aHL/tnKrX3e5RIOjrKy32DWcZGBMv1z7LwCQK9Obozln1JKxFACF9gc+YQBSrtW/jrGV
 ZyEu65H8VpU18NZoZMZx5UZkH6n4niZOtSQDKWe4sJuTRwl+iS88mi8mePXe7c1iXVnT
 tusmm7vfrCYtfEbZ2oRRB4wInQ/zCDsWF4zg7/9HlRrztuPqICbf2svGcse+fObHJkqy
 id0bZN2taoGa90C9xXrwBPDaZjeBkK+Ysflx91SBnALUTRpnHyMoFJsXTx2kli0Cw2cX
 PdEQ==
X-Gm-Message-State: APjAAAWaAAnii5gWXexIvHA0XfbC5urNZ3/G82vusIWzIMiJbPvRC3pD
 1g2/3pV3NFMiChGX2LQoux1Ar+bSi3axuZ9Ozox+ow==
X-Google-Smtp-Source: APXvYqwdJ1XE2muy3vyx4R8AKGSK9LqACjb+OkAbWKhSS1EzFIwSHnHXkEHGgdc4XKpW8iSqXpPRgCxd+W7JrLtsQVY=
X-Received: by 2002:a37:7f45:: with SMTP id a66mr4762213qkd.427.1574872265669; 
 Wed, 27 Nov 2019 08:31:05 -0800 (PST)
MIME-Version: 1.0
References: <20191126131541.47393-1-mihail.atanassov@arm.com>
 <20191126131541.47393-29-mihail.atanassov@arm.com>
 <20191126193740.GC2044@ravnborg.org>
 <2161383.jsAorMfJJG@e123338-lin> <20191127161907.GA17176@ravnborg.org>
In-Reply-To: <20191127161907.GA17176@ravnborg.org>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Wed, 27 Nov 2019 17:30:54 +0100
Message-ID: <CA+M3ks43CrCqXiQzs=Y2hd6_Z7TK36h98tGHSOGi3BPoWMX9WQ@mail.gmail.com>
Subject: Re: [PATCH 28/30] drm/sti: sti_vdo: Use drm_bridge_init()
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BW8Iv3F/t56rMQHhfpUtEUowOT8/SKG2l+YOWV4ch3Q=;
 b=DZLPCoWWf9i/wY3MVP1zzdkriDFBGt6cV8bQnsF+Ln3QBVp1IbVekkQm8L9+zFtkEW
 o4qxi+keC9Zj/naaZlTlxv41GMTcEbr4c0G2Yw8BC73boBIr5mGPfij0xc7zy2x/b6Yq
 TofhfxOi84OqqmAaK+XbdfgBfkhRGEkQpHi3Y6CydRTaMYbdZvo4A/X3Grcoat5DuzOi
 +0sGaBUgWV1EnHawe3Nf+HZFTnl0zLFQq/q4bbvdb2wb5KZkNr9ydFffZsVxwE/bXxnT
 eJbYQqkAJoeRbaDeOsJJDLwBnt+n/YNg0hYZBv9/IcyW6Aegaxgu1GXv4g0qKt+qyT5y
 Qd4g==
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 nd <nd@arm.com>, Vincent Abriou <vincent.abriou@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgbWVyLiAyNyBub3YuIDIwMTkgw6AgMTc6MTksIFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3Jn
Lm9yZz4gYSDDqWNyaXQgOgo+Cj4gSGkgTWloYWlsLgo+Cj4gPiA+Cj4gPiA+IEkgY2FuIHNlZSBm
cm9tIGdyZXBwaW5nIHRoYXQgYnJpZGdlLmRyaXZlcl9wcml2YXRlIGlzIHVzZWQKPiA+ID4gaW4g
YSBjb3VwbGUgb2Ygb3RoZXIgZmlsZXMgaW4gc3RpLwo+ID4gPgo+ID4gPiBMaWtlIHN0aV9oZG1p
LmM6Cj4gPiA+ICAgICAgICAgYnJpZGdlLT5kcml2ZXJfcHJpdmF0ZSA9IGhkbWk7Cj4gPiA+ICAg
ICAgICAgYnJpZGdlLT5mdW5jcyA9ICZzdGlfaGRtaV9icmlkZ2VfZnVuY3M7Cj4gPiA+ICAgICAg
ICAgZHJtX2JyaWRnZV9hdHRhY2goZW5jb2RlciwgYnJpZGdlLCBOVUxMKTsKPiA+ID4KPiA+ID4K
PiA+ID4gSSB3b25kZXIgaWYgYSBkcm1fYnJpZGdlX2luaXQoKSBzaG91bGQgYmUgYWRkZWQgdGhl
cmUuCj4gPiA+IEkgZGlkIG5vdCBsb29rIGNsb3NlbHkgLSBidXQgaXQgbG9va2VkIHN1c3Bpc2lv
dXNseS4KPiA+Cj4gPiBNeSBnb2FsIHdpdGggZHJtX2JyaWRnZV9pbml0KCkgd2FzIHRvIGdldCBk
ZXZsaW5rcyBzb3J0ZWQgb3V0IGZvcgo+ID4gY3Jvc3MtbW9kdWxlIHVzZXMgb2YgYSBkcm1fYnJp
ZGdlICh2aWEgb2ZfZHJtX2ZpbmRfYnJpZGdlKCkpLCBzbyBJIG9ubHkKPiA+IGNvbnNpZGVyZWQg
bG9jYXRpb25zIHdoZXJlIGRybV9icmlkZ2VfYWRkL3JlbW92ZSgpIHdlcmUgdXNlZC4KPiA+Cj4g
PiBXb3VsZCB5b3UgYmUgb2theSB3aXRoIGEgcHJvbWlzZSB0byBwdXNoIGEgY2xlYW51cCBvZiB0
aGlzIG9uZSBhbmQgdGhlCj4gPiBvbmUgaW4gc3RpX2hkYS5jIGFmdGVyIHBhdGNoIDEvMzAgbGFu
ZHMgaW4gc29tZSBmb3JtPyBJJ2QgcmF0aGVyIG5vdAo+ID4gbWFrZSB0aGlzIHNlcmllcyBtdWNo
IGxvbmdlciwgaXQncyBhbHJlYWR5IHB1c2hpbmcgaXQgYXQgMzAgOikuCj4KPiBBYnNvbHV0ZWx5
IC0gbXkgZHJpdmUtYnkgY29tbWVudCB3YXMgbW9yZSBvdXQgb2YgY29uY2VybiBpZiB0aGlzCj4g
d2FzIG1pc3NpbmcuIEEgY2xlYW4tdXAgbGF0ZXIgc291bnMgZ29vZC4KCk9yIHlvdSBjYW4ganVz
dCBkbyB0aGUgY2hhbmdlcyBmb3Igc3RpX2hkbWkgYW5kIHN0aV9oZGEgaW4gdGhpcyBwYXRjaCB0
b28uCgpCZW5qYW1pbgoKPgo+ICAgICAgICAgU2FtCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
