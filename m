Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E24620E9D
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 20:26:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8209489798;
	Thu, 16 May 2019 18:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16EBE89798
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 18:26:31 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id w144so3238242oie.12
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 11:26:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0QOmJrz3t+ssW/c0JNL75BVKUs3lWPdi+hPwpLLqj0Y=;
 b=tuU2MEnRxfEebEAW9GZpdMYrC15uqd6MtGz1dFw+uJAViUF3UBml9ikPusdpSNv8ne
 v46qb1lDh2Hhefj9SIX6wkd5dtu6XQ/CfaX5ScaPzjHGXK9nH54LXfv29WAMlj8QS8Ta
 zjLR+rC98gp+Lomq9wIAWcxOxV10jD0vSQYfao4ocglTHeKGQ6+SxK6ImZc6Qs2w69C5
 ZQMAcAmde59rB5Ko3StInYrhhrGySnxZeeEkrXgEq1NMXJMHKH4gKvmp3iXRDH5W0rId
 6QoufvMrRXlN8we8ZMCP16EbgKGyXLE7lxi+TaIs/KQtD+usphFhGqHoYDtXvr3uR+ua
 evRA==
X-Gm-Message-State: APjAAAUkqKoyYBuOgzRTFhF6rNm0b2VfwO3k9kuuVtZvVS38BGLA+c0Y
 xqJb6HB6vBq6toQxNMGEXOP95wcRzz5bgyNQ9yI=
X-Google-Smtp-Source: APXvYqxtsCkbedLuyoFQPMGbJweEX/2iUWRBGnKBlpw9mcsocW3dkMpvyrQjOnc7DiWR1WpZ0EsRJpTfOtCCQLhwvOE=
X-Received: by 2002:aca:240d:: with SMTP id n13mr11043400oic.145.1558031190251; 
 Thu, 16 May 2019 11:26:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190514155911.6C0AC68B05@newverein.lst.de>
 <20190514160241.9EAC768C7B@newverein.lst.de>
 <CA+E=qVfuKBzWK7dpM_eabjU8mLdzOw3zCnYk6Tc1oXdavH7CNA@mail.gmail.com>
 <20190515093141.41016b11@blackhole.lan>
 <CA+E=qVf6K_0T0x2Hsfp6EDqM-ok6xiAzeZPvp6SRg0yt010pKA@mail.gmail.com>
 <20190516154820.GA10431@lst.de>
 <CA+E=qVe5NkAvHXPvVc7iTbZn5sKeoRm0166zPW_s83c2gk7B+g@mail.gmail.com>
 <20190516164859.GB10431@lst.de>
In-Reply-To: <20190516164859.GB10431@lst.de>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Thu, 16 May 2019 11:26:45 -0700
Message-ID: <CA+E=qVdxvU5t9MB447Zd+-MO7rw+qBxxaZApjp4fgDx=W47r-g@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: DTS: allwinner: a64: enable ANX6345 bridge on
 Teres-I
To: Torsten Duwe <duwe@lst.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=0QOmJrz3t+ssW/c0JNL75BVKUs3lWPdi+hPwpLLqj0Y=;
 b=ZEpH+0epLMFSR18nfhuqzs+K3+pk1JK7FHLTbOUTQfU/wEjw2yw/OkaWvsmN+8euDm
 cpxhsPk10kP23ZWlHRbBYyqjuoOHCWxMJYUnlvztrx4pNOws3OHeTj/IEaoU3s72GxOH
 ZcjXTqYUWFIOQDh+ZtpROhV0KGHV+fHYmUSE8TdQHu2i3iO3sFJONBSJSOM6xSXnUWKp
 hZn1rCsMsGLLa2ctsLGmADOdhQ5tfUOZK5wdYIsBayPnaCHAzt7K37ipbtogV3WTG26v
 ctxFxluxhtaiN6LA+jEIcXU5x0lQQF1ok0OOcPaZ0wDldQf1BqXMRGl42fbGcfGQ66Cn
 YqOg==
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, Sean Paul <seanpaul@chromium.org>,
 arm-linux <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgOTo0OSBBTSBUb3JzdGVuIER1d2UgPGR1d2VAbHN0LmRl
PiB3cm90ZToKPgo+IE9uIFRodSwgTWF5IDE2LCAyMDE5IGF0IDA5OjA2OjQxQU0gLTA3MDAsIFZh
c2lseSBLaG9ydXpoaWNrIHdyb3RlOgo+ID4KPiA+IERyaXZlciBjYW4gdGFsayB0byB0aGUgcGFu
ZWwgb3ZlciBBVVggY2hhbm5lbCBvbmx5IGFmdGVyIHQxK3QzLCB0MSBpcwo+ID4gdXAgdG8gMTBt
cywgdDMgaXMgdXAgdG8gMjAwbXMuCj4KPiBUaGlzIGlzIGFmdGVyIHBvd2VyLW9uLiBUaGUgYm9v
dCBsb2FkZXIgbmVlZHMgdG8gZGVhbCB3aXRoIHRoaXMuCgpBY3R1YWxseSBwYW5lbCBkcml2ZXIg
aGFzIHRvIGRlYWwgd2l0aCBpdCBhbmQgbm90IGJvb3Rsb2FkZXIuCgo+ID4gSXQgd29ya3Mgd2l0
aCBvbGRlciB2ZXJzaW9uIG9mIGRyaXZlcgo+ID4gdGhhdCBrZWVwcyBwYW5lbCBhbHdheXMgb24g
YmVjYXVzZSBpdCB0YWtlcyBhIHdoaWxlIGJldHdlZW4gZHJpdmVyCj4gPiBwcm9iZSBhbmQgcGlw
ZWxpbmUgc3RhcnQuCj4KPiBObyBsaWQgc3dpdGNoLCBubyBVU0IsIG5vIFdpRmksIG5vIE1NQy4g
SWYgeW91IGRpc2FibGUgRENEQzEgeW91J2xsCj4gcnVuIG91dCBvZiB3YWtldXAtc291cmNlcyA7
LSkgSU9XOiBJIHNlZSBubyBwcmFjdGljYWwgd2F5IGFueSBPUwo+IGRyaXZlciBjYW4gc3dpdGNo
IHRoaXMgcGFuZWwgdm9sdGFnZSBvZmYgYW5kIHN1cnZpdmUuLi4KCk91Y2gsIGxvb2tzIGxpa2Ug
c29tZW9uZSBtYWRlIGEgaHVnZSBtaXN0YWtlIGluIEhXIGRlc2lnbj8KCj4gPiBBbGwgaW4gYWxs
IC0geW91IGRvbid0IG5lZWQgcGFuZWwgdGltaW5ncyBzaW5jZSB0aGVyZSdzIEVESUQgYnV0IHlv
dQo+ID4gc3RpbGwgbmVlZCBwYW5lbCBkZWxheXMuIEFueXdheSwgaXQncyB1cCB0byB5b3UgYW5k
IG1haW50YWluZXJzLgo+Cj4gTGV0J3MgZ2l2ZSBpdCBhIHRyeS4KPgo+ICAgICAgICAgVG9yc3Rl
bgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
