Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFDD41D04
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 08:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21BFE8938F;
	Wed, 12 Jun 2019 06:55:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB0189023
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 22:25:42 +0000 (UTC)
Date: Wed, 12 Jun 2019 00:25:39 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 4/6] dt-bindings: display: hdmi-connector: Support DDC
 bus enable
Message-ID: <20190611222539.msviqrbptjd5vdji@core.my.home>
Mail-Followup-To: Rob Herring <robh@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 devicetree@vger.kernel.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-sunxi@googlegroups.com, Jose Abreu <joabreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20190527162237.18495-1-megous@megous.com>
 <20190527162237.18495-5-megous@megous.com>
 <20190611215206.GA17759@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190611215206.GA17759@bogus>
X-Mailman-Approved-At: Wed, 12 Jun 2019 06:53:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=megous.com; s=mail; 
 t=1560291939; bh=u1xRqcipnjQfdrJT1iMxqmCOWzuFT5iSpjmBJ/NwAng=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iUogNK2F3RyjngMx4djQtjKewbxnn+Nvf/e84Jaqj+b4bz0KfhOo3Ucmsc62ArP91
 AnN9RXuB+r50eNOnii91OJYHduVuqj5nTyOUHPDIYkXghBU6tFTYtNYz9GqOvxApED
 F0Y3GKdyuZXdNlSiqbjhmi4AahsEzFRbhTeWdtDA=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, netdev@vger.kernel.org,
 linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>,
 David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
 Jose Abreu <joabreu@synopsys.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMDM6NTI6MDZQTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gTW9uLCAyNyBNYXkgMjAxOSAxODoyMjozNSArMDIwMCwgbWVnb3VzQG1lZ291cy5j
b20gd3JvdGU6Cj4gPiBGcm9tOiBPbmRyZWogSmlybWFuIDxtZWdvdXNAbWVnb3VzLmNvbT4KPiA+
IAo+ID4gU29tZSBBbGx3aW5uZXIgU29DIHVzaW5nIGJvYXJkcyAoT3JhbmdlIFBpIDMgZm9yIGV4
YW1wbGUpIG5lZWQgdG8gZW5hYmxlCj4gPiBvbi1ib2FyZCB2b2x0YWdlIHNoaWZ0aW5nIGxvZ2lj
IGZvciB0aGUgRERDIGJ1cyB1c2luZyBhIGdwaW8gdG8gYmUgYWJsZQo+ID4gdG8gYWNjZXNzIERE
QyBidXMuIFVzZSBkZGMtZW4tZ3Bpb3MgcHJvcGVydHkgb24gdGhlIGhkbWktY29ubmVjdG9yIHRv
Cj4gPiBtb2RlbCB0aGlzLgo+ID4gCj4gPiBBZGQgYmluZGluZyBkb2N1bWVudGF0aW9uIGZvciBv
cHRpb25hbCBkZGMtZW4tZ3Bpb3MgcHJvcGVydHkuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IE9u
ZHJlaiBKaXJtYW4gPG1lZ291c0BtZWdvdXMuY29tPgo+ID4gLS0tCj4gPiAgLi4uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9jb25uZWN0b3IvaGRtaS1jb25uZWN0b3IudHh0ICAgICB8IDEg
Kwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4gCj4gCj4gUGxlYXNlIGFk
ZCBBY2tlZC1ieS9SZXZpZXdlZC1ieSB0YWdzIHdoZW4gcG9zdGluZyBuZXcgdmVyc2lvbnMuIEhv
d2V2ZXIsCj4gdGhlcmUncyBubyBuZWVkIHRvIHJlcG9zdCBwYXRjaGVzICpvbmx5KiB0byBhZGQg
dGhlIHRhZ3MuIFRoZSB1cHN0cmVhbQo+IG1haW50YWluZXIgd2lsbCBkbyB0aGF0IGZvciBhY2tz
IHJlY2VpdmVkIG9uIHRoZSB2ZXJzaW9uIHRoZXkgYXBwbHkuCj4gCj4gSWYgYSB0YWcgd2FzIG5v
dCBhZGRlZCBvbiBwdXJwb3NlLCBwbGVhc2Ugc3RhdGUgd2h5IGFuZCB3aGF0IGNoYW5nZWQuCgpT
b3JyeSwgaXQgd2FzIHNvbWUgbWlzdGFrZS4gVGhhbmtzIGZvciB0aGUgbm90ZS4KCnJlZ2FyZHMs
CglPbmRyZWoKCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdAo+IGxpbnV4LWFybS1rZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYXJtLWtlcm5lbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
