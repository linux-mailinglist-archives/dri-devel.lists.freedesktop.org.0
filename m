Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB3AE2AB0
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 09:03:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C36916E0F7;
	Thu, 24 Oct 2019 07:03:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8513A6E0F7
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 07:03:03 +0000 (UTC)
X-UUID: e387ee1ae50643aaade758f71eeed972-20191024
X-UUID: e387ee1ae50643aaade758f71eeed972-20191024
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1934104947; Thu, 24 Oct 2019 15:02:59 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 24 Oct 2019 15:02:56 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 24 Oct 2019 15:02:56 +0800
Message-ID: <1571900577.27203.6.camel@mtksdaap41>
Subject: Re: [PATCH 5/6] drm/mediatek: Convert to use CMA helpers
From: CK Hu <ck.hu@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Thu, 24 Oct 2019 15:02:57 +0800
In-Reply-To: <CAL_JsqJJ2ET2oCCkE=fqk7PWTWp3xiMRiMM_AmxRDws-NaKoOg@mail.gmail.com>
References: <20191021214550.1461-1-robh@kernel.org>
 <20191021214550.1461-6-robh@kernel.org>
 <1cbca96c-19dd-1d15-949c-7fbcc15369b4@gmail.com>
 <CAL_JsqL6G=F45G+-QXF6T1269f9YquXfYtjoUkCpAoNartxM=Q@mail.gmail.com>
 <1571864784.19128.8.camel@mtksdaap41>
 <CAL_JsqJJ2ET2oCCkE=fqk7PWTWp3xiMRiMM_AmxRDws-NaKoOg@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Yannick Fertre <yannick.fertre@st.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Kevin Hilman <khilman@baylibre.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>, "open list:ARM/Rockchip
 SoC..." <linux-rockchip@lists.infradead.org>, Chen-Yu Tsai <wens@csie.org>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>, Ulrich Hecht <uli@fpond.eu>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Chen Feng <puck.chen@hisilicon.com>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Philippe Cornu <philippe.cornu@st.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rongrong Zou <zourongrong@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFJvYjoKCk9uIFdlZCwgMjAxOS0xMC0yMyBhdCAxNzo1NiAtMDUwMCwgUm9iIEhlcnJpbmcg
d3JvdGU6Cj4gT24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgNDowNiBQTSBDSyBIdSA8Y2suaHVAbWVk
aWF0ZWsuY29tPiB3cm90ZToKPiA+Cj4gPiBIaSwgUm9iOgo+ID4KPiA+IE9uIFdlZCwgMjAxOS0x
MC0yMyBhdCAxMjo0MiAtMDUwMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgT2N0
IDIyLCAyMDE5IGF0IDEyOjA3IFBNIE1hdHRoaWFzIEJydWdnZXIKPiA+ID4gPG1hdHRoaWFzLmJn
Z0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gSGkgUm9iLAo+ID4gPiA+Cj4gPiA+
ID4gT24gMjEvMTAvMjAxOSAyMzo0NSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gPiA+ID4gPiBUaGUg
b25seSByZWFzb24gdGhlIE1lZGlhdGVrIGRyaXZlciBkb2Vzbid0IHVzZSB0aGUgQ01BIGhlbHBl
cnMgaXMgaXQKPiA+ID4gPiA+IHNldHMgRE1BX0FUVFJfTk9fS0VSTkVMX01BUFBJTkcgYW5kIGRv
ZXMgYSB2bWFwKCkgb24gZGVtYW5kLiBVc2luZwo+ID4gPiA+ID4gdm1hcCgpIGlzIG5vdCBldmVu
IGd1YXJhbnRlZWQgdG8gd29yayBhcyBETUEgYnVmZmVycyBtYXkgbm90IGhhdmUgYQo+ID4gPiA+
ID4gc3RydWN0IHBhZ2UuIE5vdyB0aGF0IHRoZSBDTUEgaGVscGVycyBzdXBwb3J0IHNldHRpbmcK
PiA+ID4gPiA+IERNQV9BVFRSX05PX0tFUk5FTF9NQVBQSU5HIGFzIG5lZWRlZCBvciBub3QsIGNv
bnZlcnQgTWVkaWF0ZWsgZHJpdmVyIHRvCj4gPiA+ID4gPiB1c2UgQ01BIGhlbHBlcnMuCj4gPiA+
ID4gPgo+ID4gPiA+ID4gQ2M6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+Cj4gPiA+ID4gPiBD
YzogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KPiA+ID4gPiA+IENjOiBE
YXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gPiA+ID4gPiBDYzogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsQGZmd2xsLmNoPgo+ID4gPiA+ID4gQ2M6IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRo
aWFzLmJnZ0BnbWFpbC5jb20+Cj4gPiA+ID4gPiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5p
bmZyYWRlYWQub3JnCj4gPiA+ID4gPiBDYzogbGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9y
Zz4KPiA+ID4gPiA+IC0tLQo+ID4gPiA+Cj4gPiA+ID4gSSB0ZXN0ZWQgdGhpcyBvbiBteSBDaHJv
bWVib29rIHdpdGggc29tZSBwYXRjaGVzIG9uIHRvcCBvZiB2NS40LXJjMSBbMV0sIHdoaWNoCj4g
PiA+ID4gd29yay4gSWYgSSBhZGQgeW91ciBwYXRjaGVzIG9uIHRvcCBvZiB0aGF0LCB0aGUgc3lz
dGVtIGRvZXMgbm90IGJvb3QgdXAuCj4gPiA+ID4gVW5mb3J0dW5hdGVseSBJIGRvbid0IGhhdmUg
YSBzZXJpYWwgY29uc29sZSwgc28gSSB3YXNuJ3QgYWJsZSB0byBzZWUgaWYgdGhlcmUgaXMKPiA+
ID4gPiBhbnkgZXJyb3IgbWVzc2FnZS4KPiA+ID4KPiA+ID4gVGhhbmtzIGZvciB0ZXN0aW5nLiBJ
J20gYmFzZWQgb24gZHJtLW1pc2MtbmV4dCwgYnV0IGRvbid0IHNlZSBhbnl0aGluZwo+ID4gPiBv
YnZpb3VzIHRoZXJlIHRoYXQgd291bGQgbWF0dGVyLiBUaGVyZSBhcmUgc29tZSBtbWFwIGNoYW5n
ZXMsIGJ1dCBJCj4gPiA+IHRoaW5rIHRoZXkgc2hvdWxkbid0IG1hdHRlci4KPiA+ID4KPiA+ID4g
RGlkIHlvdSBoYXZlIGZiY29uIGVuYWJsZWQ/IFRoYXQgbWF5IGdpdmUgbW9yZSBjbHVlcyBhYm91
dCB3aGVyZSB0aGUgcHJvYmxlbSBpcy4KPiA+Cj4gPiBUaGVyZSBhcmUgcHJpdi0+ZG1hX2RldiBm
b3IgZG1hIGRldmljZSwgYnV0IGl0IGlzIG5vdCBkcm0gZGV2aWNlLiBJbgo+ID4gbXQ4MTczLmR0
c2kgWzFdLCB0aGVyZSBhcmUgbW1zeXMgZGV2aWNlIGFuZCBvdmwgZGV2aWNlLCBtbXN5cyBkZXZp
Y2UgaXMKPiA+IGRybSBkZXZpY2UgYW5kIG92bCBkZXZpY2UgaXMgbW1zeXMncyBzdWIgZGV2aWNl
IHdoaWNoIHByb3ZpZGUgZG1hCj4gPiBmdW5jdGlvbiwgc28gb3ZsIGlzIHRoZSBwcml2LT5kbWFf
ZGV2LiBJIHRoaW5rIHlvdXIgcGF0Y2ggZGlyZWN0bHkgdXNlCj4gPiBkcm0gZGV2aWNlIGZvciBk
bWEgb3BlcmF0aW9uIGFuZCB0aGlzIHdvdWxkIGNhdXNlIGRtYSBmdW5jdGlvbiBmYWlsLgo+ID4g
UGxlYXNlIHVzZSBwcml2LT5kbWFfZGV2IGZvciBkbWEgb3BlcmF0aW9uLgo+IAo+IFJpZ2h0LCB0
aGFua3MgZm9yIGNhdGNoaW5nIHRoYXQuIEVpdGhlciB3ZSdsbCBuZWVkIHRvIG1ha2UgQ01BIEdF
TQo+IG9iamVjdCBoYXZlIGEgc3RydWN0IGRldmljZSBwdHIgb3IgYWRqdXN0IHRoZSBkcm1fZGV2
aWNlLmRldiB0byBoYXZlCj4gdGhlIG5lY2Vzc2FyeSBETUEgc2V0dXAuCj4gCj4gT25lIHF1ZXN0
aW9uIHRob3VnaCwgd2h5IGRvIHlvdSB1c2UgQ01BIHdoZW4geW91IGhhdmUgYW4gSU9NTVU/IFRo
YXQncwo+IG5vdCBvcHRpbWFsIGFzIENNQSBzaXplIG1heSBiZSBsaW1pdGVkLiBPciB5b3UgZG9u
J3QgYWx3YXlzIGhhdmUgYW4KPiBJT01NVT8KCkZvciBhbGwgdXBzdHJlYW1lZCBtZWRpYXRlayBT
b0MsIGFsbCBoYXMgSU9NTVUsIHNvIGl0IGRvZXMgbm90IG5lZWQgQ01BLgpJIHRoaW5rIHdlIHVz
ZSBDTUEganVzdCBiZWNhdXNlIHdlIHJlZmVyIHRvIG90aGVyIGRybSBkcml2ZXIgdG8KaW1wbGVt
ZW50IG1lZGlhdGVrIGRybSBkcml2ZXIgYW5kIHdlIG1pc3VzZWQgQ01BIGhlbHBlciBmdW5jdGlv
biBidXQgaXQKd29ya3MuIEkgdGhpbmsgd2Ugc2hvdWxkIGNoYW5nZSB0byBtb3JlIGFjY3VyYXRl
IGltcGxlbWVudGF0aW9uLiBJZiB5b3UKd2FudCwgeW91IGNvdWxkIG1vZGlmeSBpdCBpbiB0aGlz
IHNlcmllcy4KClJlZ2FyZHMsCkNLCgo+IAo+IFJvYgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
