Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE16ADCD2
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2019 09:28:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F73891AC;
	Mon, 29 Apr 2019 07:28:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6195489125
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2019 19:01:30 +0000 (UTC)
Date: Sat, 27 Apr 2019 21:01:23 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 6/9] dt-bindings: display: hdmi-connector: Add DDC
 power supply
Message-ID: <20190427190123.6aik7by3fgkyjmq7@core.my.home>
Mail-Followup-To: Rob Herring <robh@kernel.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Mark Rutland <mark.rutland@arm.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 devicetree@vger.kernel.org,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <20190413165418.27880-1-megous@megous.com>
 <20190413165418.27880-7-megous@megous.com>
 <20190426182337.GA22245@bogus>
 <20190426192031.wtoaxctjo2qxxquq@core.my.home>
 <CAL_Jsq+o1j6AGL9UnhN1tV150DsFug6pg+UPEJ9EKqBc6rgq_w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+o1j6AGL9UnhN1tV150DsFug6pg+UPEJ9EKqBc6rgq_w@mail.gmail.com>
X-Mailman-Approved-At: Mon, 29 Apr 2019 07:28:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=megous.com; s=mail; 
 t=1556391687; bh=1k0KSGJbvVlz3bAl3os5LWwpFDV2ca8mHPbTDpXh5AI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oEf5axQHLSAKGWixMf6339L/blKLRClp75iCuuRnhZeZGG5PXXXOpKhxCr8hb0mtn
 E8h6myV5BEH46kzLXQEt9S8mUWOoJGCzdW94kyP5svV9TxeQ26KykrpejyWLcimAVi
 lwQUlEvtRs9vSEZqkJpG1JXzyQbGNMdUP2BnPesA=
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
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, netdev <netdev@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Chen-Yu Tsai <wens@csie.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, linux-sunxi <linux-sunxi@googlegroups.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBcHIgMjYsIDIwMTkgYXQgMDM6MDI6NTBQTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gRnJpLCBBcHIgMjYsIDIwMTkgYXQgMjoyMCBQTSBPbmTFmWVqIEppcm1hbiA8bWVn
b3VzQG1lZ291cy5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIEZyaSwgQXByIDI2LCAyMDE5IGF0IDAx
OjIzOjM3UE0gLTA1MDAsIFJvYiBIZXJyaW5nIHdyb3RlOgo+ID4gPiBPbiBTYXQsIEFwciAxMywg
MjAxOSBhdCAwNjo1NDoxNVBNICswMjAwLCBtZWdvdXNAbWVnb3VzLmNvbSB3cm90ZToKPiA+ID4g
PiBGcm9tOiBPbmRyZWogSmlybWFuIDxtZWdvdXNAbWVnb3VzLmNvbT4KPiA+ID4gPgo+ID4gPiA+
IFNvbWUgQWxsd2lubmVyIFNvQyB1c2luZyBib2FyZHMgKE9yYW5nZSBQaSAzIGZvciBleGFtcGxl
KSBuZWVkIHRvIGVuYWJsZQo+ID4gPiA+IG9uLWJvYXJkIHZvbHRhZ2Ugc2hpZnRpbmcgbG9naWMg
Zm9yIHRoZSBEREMgYnVzIHRvIGJlIHVzYWJsZS4gVXNlCj4gPiA+ID4gZGRjLXN1cHBseSBvbiB0
aGUgaGRtaS1jb25uZWN0b3IgdG8gbW9kZWwgdGhpcy4KPiA+ID4gPgo+ID4gPiA+IEFkZCBiaW5k
aW5nIGRvY3VtZW50YXRpb24gZm9yIG9wdGlvbmFsIGRkYy1zdXBwbHkgcHJvcGVydHkuCj4gPiA+
ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBPbmRyZWogSmlybWFuIDxtZWdvdXNAbWVnb3VzLmNv
bT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9j
b25uZWN0b3IvaGRtaS1jb25uZWN0b3IudHh0ICAgICB8IDEgKwo+ID4gPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKykKPiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9jb25uZWN0b3IvaGRtaS1jb25uZWN0
b3IudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvY29ubmVj
dG9yL2hkbWktY29ubmVjdG9yLnR4dAo+ID4gPiA+IGluZGV4IDUwOGFlZTQ2MWUwZC4uMzMwODVh
ZWIwYmI5IDEwMDY0NAo+ID4gPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L2Nvbm5lY3Rvci9oZG1pLWNvbm5lY3Rvci50eHQKPiA+ID4gPiArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9jb25uZWN0b3IvaGRtaS1j
b25uZWN0b3IudHh0Cj4gPiA+ID4gQEAgLTksNiArOSw3IEBAIE9wdGlvbmFsIHByb3BlcnRpZXM6
Cj4gPiA+ID4gIC0gbGFiZWw6IGEgc3ltYm9saWMgbmFtZSBmb3IgdGhlIGNvbm5lY3Rvcgo+ID4g
PiA+ICAtIGhwZC1ncGlvczogSFBEIEdQSU8gbnVtYmVyCj4gPiA+ID4gIC0gZGRjLWkyYy1idXM6
IHBoYW5kbGUgbGluayB0byB0aGUgSTJDIGNvbnRyb2xsZXIgdXNlZCBmb3IgRERDIEVESUQgcHJv
YmluZwo+ID4gPiA+ICstIGRkYy1zdXBwbHk6IHRoZSBwb3dlciBzdXBwbHkgZm9yIHRoZSBEREMg
YnVzCj4gPiA+Cj4gPiA+IEl0J3Mgbm90IGp1c3QgZm9yIEREQy4gSXQgcG93ZXJzIHRoZSBjaGlw
cyBpbiBicmlkZ2UgZG9uZ2xlcyBmb3IKPiA+ID4gZXhhbXBsZS4gUHJldHR5IG11Y2ggZXZlcnkg
ZGlhZ3JhbSBJIGZpbmQganVzdCBjYWxscyBpdCA1ViBvciArNVYuCj4gPiA+Cj4gPiA+IFNvIGhv
dyBhYm91dCAnNVYtc3VwcGx5JyBvciAndjVWLXN1cHBseSc/Cj4gPgo+ID4gSnVzdCB0byBiZSBz
dXJlLCB0aGUgc2NoZW1hdGljIHRoYXQgaW5zcGlyZWQgdGhpcyBjaGFuZ2UgbG9va3MgbGlrZSB0
aGlzOgo+ID4KPiA+IGh0dHBzOi8vbWVnb3VzLmNvbS9kbC90bXAvMzNiMjk3MWRlNjk0M2U5ZC5w
bmcKPiA+Cj4gPiBIRE1JLTVWIGlzIGFsd2F5cyBvbiwgYW5kIHdoYXQgaXMgcmVhbGx5IGJlaW5n
IGVuYWJsZWQgaGVyZSBhcmUgbW9zZmV0cwo+ID4gY29ubmVjdGVkIHRvIEREQ19DRUNfRU4gYW5k
IG5vdCB0aGUgSERNSS01ViBwb3dlciBzdXBwbHkuIFNvIGluIHRoaXMgY2FzZSBpdAo+ID4gcmVh
bGx5IGlzIGp1c3QgZm9yIEREQy4gSXQgaXMgY29uY2VpdmFibGUgdGhhdCBzb21lIGJvYXJkcyBt
YXkgbmVlZCBib3RoIHRvCj4gPiBlbmFibGUgNVYgZm9yIEhETUkgY2lyY3VpdHJ5IGFuZCBzb21l
IHNlcGFyYXRlIHBvd2VyIHNoaWZ0aW5nIGxvZ2ljIGZvcgo+ID4gRERDIGJ1cy4KPiAKPiBPa2F5
LCBub3Qgd2hhdCBJIHRob3VnaHQgeW91IHdlcmUgZGVmaW5pbmcuIEREQ19DRUNfRU4gaXMgYSBH
UElPIGxpbmU/Cj4gSSB3b3VsZG4ndCBjaGFyYWN0ZXJpemUgdGhpcyBhcyBhIHZvbHRhZ2UgcmFp
bCwgc28gSSBkb24ndCB0aGluayBpdAo+IHNob3VsZCBiZSBhIHN1cHBseS4gUGVyaGFwcyAnZGRj
LWVuLWdwaW9zJz8KClllcyBpdCdzIEdQSU8uIEknbGwgaW1wbGVtZW50IGl0IGFzIEdQSU8uCgo+
IFdlIGNlcnRhaW5seSB3YW50IHRvIG1ha2UgaXQgY2xlYXIgdGhpcyBpcyBub3QgdGhlIDVWIHN1
cHBseS4KClJpZ2h0LiBUaGFuayB5b3UgZm9yIHJldmlldy4KCnJlZ2FyZHMsCglPbmRyZWoKCj4g
Um9iCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdAo+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMu
aW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYXJtLWtlcm5lbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
