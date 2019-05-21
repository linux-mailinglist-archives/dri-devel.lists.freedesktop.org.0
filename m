Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7F6265DD
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC5CF89B18;
	Wed, 22 May 2019 14:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA11892AE
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 09:56:33 +0000 (UTC)
Date: Tue, 21 May 2019 11:56:31 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v5 2/6] net: stmmac: sun8i: force select external PHY
 when no internal one
Message-ID: <20190521095631.v5n3qml5ujofufk4@core.my.home>
Mail-Followup-To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 linux-sunxi@googlegroups.com,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Icenowy Zheng <icenowy@aosc.io>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Mark Rutland <mark.rutland@arm.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20190520235009.16734-1-megous@megous.com>
 <20190520235009.16734-3-megous@megous.com>
 <4e031eeb-2819-a97f-73bf-af84b04aa7b2@cogentembedded.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4e031eeb-2819-a97f-73bf-af84b04aa7b2@cogentembedded.com>
X-Mailman-Approved-At: Wed, 22 May 2019 14:35:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=megous.com; s=mail; 
 t=1558432591; bh=1nbvGwWgSb1jI/P1ZT27Mo4T3fhSGGa/u2NrHc/bhEY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aQxlmz+L5OjzAbaGr0IgpRjnbM2RyEQ9ga6eu6t3E1wgEuRsrhjeZ3D6nbtxshUqQ
 EFtz03J7GkN8M0jpVIqGGEF95yxB7bHBJWFoHkXR0AupOG3A5VI/5BhgWHf71ZAzVl
 J10mK1Th7bIsLg6pDXlJsqz4NYBtfHlHzsAteH3k=
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
Cc: Mark Rutland <mark.rutland@arm.com>, Jose Abreu <joabreu@synopsys.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-sunxi@googlegroups.com,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gU2VyZ2VpLAoKT24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgMTI6Mjc6MjRQTSArMDMwMCwg
U2VyZ2VpIFNodHlseW92IHdyb3RlOgo+IEhlbGxvIQo+IAo+IE9uIDIxLjA1LjIwMTkgMjo1MCwg
bWVnb3VzQG1lZ291cy5jb20gd3JvdGU6Cj4gCj4gPiBGcm9tOiBJY2Vub3d5IFpoZW5nIDxpY2Vu
b3d5QGFvc2MuaW8+Cj4gPiAKPiA+IFRoZSBQSFkgc2VsZWN0aW9uIGJpdCBhbHNvIGV4aXN0cyBv
biBTb0NzIHdpdGhvdXQgYW4gaW50ZXJuYWwgUEhZOyBpZiBpdCdzCj4gPiBzZXQgdG8gMSAoaW50
ZXJuYWwgUEhZLCBkZWZhdWx0IHZhbHVlKSB0aGVuIHRoZSBNQUMgd2lsbCBub3QgbWFrZSB1c2Ug
b2YKPiA+IGFueSBQSFkgc3VjaCBTb0NzLgo+ICAgICAgICAgIF4gIm9uIiBvciAid2l0aCIgbWlz
c2luZz8KCkl0J3MgbWlzc2luZyAnb24nLgoKdGhhbmsgeW91LAoJT25kcmVqCgo+ID4gVGhpcyBw
cm9ibGVtIGFwcGVhcnMgd2hlbiBhZGFwdGluZyBmb3IgSDYsIHdoaWNoIGhhcyBubyByZWFsIGlu
dGVybmFsIFBIWQo+ID4gKHRoZSAiaW50ZXJuYWwgUEhZIiBvbiBINiBpcyBub3Qgb24tZGllLCBi
dXQgb24gYSBjby1wYWNrYWdlZCBBQzIwMCBjaGlwLAo+ID4gY29ubmVjdGVkIHZpYSBSTUlJIGlu
dGVyZmFjZSBhdCBHUElPIGJhbmsgQSkuCj4gPiAKPiA+IEZvcmNlIHRoZSBQSFkgc2VsZWN0aW9u
IGJpdCB0byAwIHdoZW4gdGhlIFNPQyBkb2Vzbid0IGhhdmUgYW4gaW50ZXJuYWwgUEhZLAo+ID4g
dG8gYWRkcmVzcyB0aGUgcHJvYmxlbSBvZiBhIHdyb25nIGRlZmF1bHQgdmFsdWUuCj4gPiAKPiA+
IFNpZ25lZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcgPGljZW5vd3lAYW9zYy5pbz4KPiA+IFNpZ25l
ZC1vZmYtYnk6IE9uZHJlaiBKaXJtYW4gPG1lZ291c0BtZWdvdXMuY29tPgo+IFsuLi5dCj4gCj4g
TUJSLCBTZXJnZWkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
