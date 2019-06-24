Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD140524B2
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:29:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9FE66E036;
	Tue, 25 Jun 2019 07:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E52889D99
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 17:46:40 +0000 (UTC)
Date: Mon, 24 Jun 2019 19:46:37 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v7 0/6] Add support for Orange Pi 3
Message-ID: <20190624174637.6sznc5ifiuh4c3sm@core.my.home>
Mail-Followup-To: David Miller <davem@davemloft.net>,
 linux-sunxi@googlegroups.com, maxime.ripard@bootlin.com,
 wens@csie.org, robh+dt@kernel.org, jernej.skrabec@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com,
 peppe.cavallaro@st.com, alexandre.torgue@st.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20190620134748.17866-1-megous@megous.com>
 <20190624.102927.1268781741493594465.davem@davemloft.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190624.102927.1268781741493594465.davem@davemloft.net>
X-Mailman-Approved-At: Tue, 25 Jun 2019 07:27:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=megous.com; s=mail; 
 t=1561398397; bh=l26+171beDHOxmBA8VQOvSCiteWk45rGxm72YTM5O5M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pegVqKhp8mz968SWeU+w2vKRP6a4dc5+dBNm3nxwjuqAnevGGPHI4ZwfoFTXH8rjC
 thu7zSl6O4mdMXvGt7ZiNDk2BDZdMjeXRx4UwQIv7JVVJa+Df0sZPc6ZKAo7frELlZ
 9z4OGEpcrYnbZdEHdsuYFHIY74nf+gLab1TwBX54=
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
Cc: mark.rutland@arm.com, joabreu@synopsys.com, alexandre.torgue@st.com,
 devicetree@vger.kernel.org, maxime.ripard@bootlin.com, netdev@vger.kernel.org,
 wens@csie.org, jernej.skrabec@gmail.com, linux-kernel@vger.kernel.org,
 airlied@linux.ie, linux-sunxi@googlegroups.com, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMTA6Mjk6MjdBTSAtMDcwMCwgRGF2aWQgTWlsbGVyIHdy
b3RlOgo+IEZyb206IG1lZ291c0BtZWdvdXMuY29tCj4gRGF0ZTogVGh1LCAyMCBKdW4gMjAxOSAx
NTo0Nzo0MiArMDIwMAo+IAo+ID4gRnJvbTogT25kcmVqIEppcm1hbiA8bWVnb3VzQG1lZ291cy5j
b20+Cj4gPiAKPiA+IFRoaXMgc2VyaWVzIGltcGxlbWVudHMgc3VwcG9ydCBmb3IgWHVubG9uZyBP
cmFuZ2UgUGkgMyBib2FyZC4KPiA+IAo+ID4gLSBldGhlcm5ldCBzdXBwb3J0IChwYXRjaGVzIDEt
MykKPiA+IC0gSERNSSBzdXBwb3J0IChwYXRjaGVzIDQtNikKPiA+IAo+ID4gRm9yIHNvbWUgcGVv
cGxlLCBldGhlcm5ldCBkb2Vzbid0IHdvcmsgYWZ0ZXIgcmVib290IChidXQgd29ya3Mgb24gY29s
ZAo+ID4gYm9vdCksIHdoZW4gdGhlIHN0bW1hYyBkcml2ZXIgaXMgYnVpbHQgaW50byB0aGUga2Vy
bmVsLiBJdCB3b3JrcyB3aGVuCj4gPiB0aGUgZHJpdmVyIGlzIGJ1aWx0IGFzIGEgbW9kdWxlLiBJ
dCdzIGVpdGhlciBzb21lIHRpbWluZyBpc3N1ZSwgb3IgcG93ZXIKPiA+IHN1cHBseSBpc3N1ZSBv
ciBhIGNvbWJpbmF0aW9uIG9mIGJvdGguIE1vZHVsZSBidWlsZCBpbmR1Y2VzIGEgcG93ZXIKPiA+
IGN5Y2xpbmcgb2YgdGhlIHBoeS4KPiA+IAo+ID4gSSBlbmNvdXJhZ2UgcGVvcGxlIHdpdGggdGhp
cyBpc3N1ZSwgdG8gYnVpbGQgdGhlIGRyaXZlciBpbnRvIHRoZSBrZXJuZWwsCj4gPiBhbmQgdHJ5
IHRvIGFsdGVyIHRoZSByZXNldCB0aW1pbmdzIGZvciB0aGUgcGh5IGluIERUUyBvcgo+ID4gc3Rh
cnR1cC1kZWxheS11cyBhbmQgcmVwb3J0IHRoZSBmaW5kaW5ncy4KPiAKPiBUaGlzIGlzIGEgbWl4
dHVyZSBvZiBuZXR3b3JraW5nIGFuZCBub24tbmV0d29ya2luZyBjaGFuZ2VzIHNvIGl0IHJlYWxs
eQo+IGNhbid0IGdvIHRocm91Z2ggbXkgdHJlZS4KPiAKPiBJIHdvbmRlciBob3cgeW91IGV4cGVj
dCB0aGlzIHNlcmllcyB0byBiZSBtZXJnZWQ/Cj4gCj4gVGhhbmtzLgoKVGhpcyBzZXJpZXMgd2Fz
IGV2ZW4gbG9uZ2VyIGJlZm9yZSwgd2l0aCBwYXRjaGVzIGFsbCBhcm91bmQgZm9yIHZhcmlvdXMK
bWFpbnRhaW5lcnMuIEknZCBleHBlY3QgdGhhdCByZWxldmFudCBtYWludGFpbmVycyBwaWNrIHRo
ZSByYW5nZSBvZiBwYXRjaGVzCm1lYW50IGZvciB0aGVtLiBJIGRvbid0IGtub3cgd2hvJ3MgZXhh
Y3RseSByZXNwb25zaWJsZSBmb3Igd2hhdCwgYnV0IEkgdGhpbmssCnRoaXMgc2hvdWxkIHdvcms6
CgotIDIgc3RtbWFjIHBhdGNoZXMgc2hvdWxkIGdvIHRvZ2V0aGVyIHZpYSBzb21lIG5ldHdvcmtp
bmcgdHJlZSAoaXMgdGhlcmUKICBzb21ldGhpbmcgc3BlY2lmaWMgZm9yIHN0bW1hYz8pCi0gYWxs
IERUUyBwYXRjaGVzIHNob3VsZCBnbyB2aWEgc3VueGkKLSBoZG1pIHBhdGNoZXMgdmlhIHNvbWUg
ZHJtIHRyZWUKCnRoYW5rIHlvdSBhbmQgcmVnYXJkcywKCW8uCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
