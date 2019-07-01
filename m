Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7855B333
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 06:00:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9FB489C56;
	Mon,  1 Jul 2019 04:00:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 300 seconds by postgrey-1.36 at gabe;
 Mon, 01 Jul 2019 04:00:38 UTC
Received: from mailgw01.mediatek.com (mailgw01.mediatek.com [216.200.240.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1EEE89C56
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 04:00:38 +0000 (UTC)
X-UUID: e1d7852b40184f43b704b28d2b031933-20190630
X-UUID: e1d7852b40184f43b704b28d2b031933-20190630
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2113796546; Sun, 30 Jun 2019 19:55:34 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 30 Jun 2019 20:55:31 -0700
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 1 Jul 2019 11:55:17 +0800
Message-ID: <1561953318.25914.9.camel@mtksdaap41>
Subject: Re: [PATCH v5 08/12] dt-bindings: mediatek: Change the binding for
 mmsys clocks
From: CK Hu <ck.hu@mediatek.com>
To: Matthias Brugger <mbrugger@suse.com>
Date: Mon, 1 Jul 2019 11:55:18 +0800
In-Reply-To: <a229bfc7-683f-5b0d-7b71-54f934de6214@suse.com>
References: <20181116125449.23581-1-matthias.bgg@kernel.org>
 <20181116125449.23581-9-matthias.bgg@kernel.org>
 <20181116231522.GA18006@bogus>
 <2a23e407-4cd4-2e2b-97a5-4e2bb96846e0@gmail.com>
 <CAL_JsqKJQwfDJbpmwW+oCxiDkSp5+6mG-uoURmCQVEMP_jFOEg@mail.gmail.com>
 <154281878765.88331.10581984256202566195@swboyd.mtv.corp.google.com>
 <458178ac-c0fc-9671-7fc8-ed2d6f61424c@suse.com>
 <154356023767.88331.18401188808548429052@swboyd.mtv.corp.google.com>
 <a229bfc7-683f-5b0d-7b71-54f934de6214@suse.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Sean Wang <Sean.Wang@mediatek.com>, "moderated list:ARM/FREESCALE IMX /
 MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Sean Wang <sean.wang@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David
 Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 "matthias.bgg@kernel.org" <matthias.bgg@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIE1hdHRoaWFzOgoKT24gRnJpLCAyMDE4LTExLTMwIGF0IDE2OjU5ICswODAwLCBNYXR0aGlh
cyBCcnVnZ2VyIHdyb3RlOgo+IAo+IE9uIDMwLzExLzIwMTggMDc6NDMsIFN0ZXBoZW4gQm95ZCB3
cm90ZToKPiA+IFF1b3RpbmcgTWF0dGhpYXMgQnJ1Z2dlciAoMjAxOC0xMS0yMSAwOTowOTo1MikK
PiA+Pgo+ID4+Cj4gPj4gT24gMjEvMTEvMjAxOCAxNzo0NiwgU3RlcGhlbiBCb3lkIHdyb3RlOgo+
ID4+PiBRdW90aW5nIFJvYiBIZXJyaW5nICgyMDE4LTExLTE5IDExOjE1OjE2KQo+ID4+Pj4gT24g
U3VuLCBOb3YgMTgsIDIwMTggYXQgMTE6MTIgQU0gTWF0dGhpYXMgQnJ1Z2dlcgo+ID4+Pj4gPG1h
dHRoaWFzLmJnZ0BnbWFpbC5jb20+IHdyb3RlOgo+ID4+Pj4+IE9uIDExLzE3LzE4IDEyOjE1IEFN
LCBSb2IgSGVycmluZyB3cm90ZToKPiA+Pj4+Pj4gT24gRnJpLCBOb3YgMTYsIDIwMTggYXQgMDE6
NTQ6NDVQTSArMDEwMCwgbWF0dGhpYXMuYmdnQGtlcm5lbC5vcmcgd3JvdGU6Cj4gPj4+Pj4+PiAt
ICAgICNjbG9jay1jZWxscyA9IDwxPjsKPiA+Pj4+Pj4+ICsKPiA+Pj4+Pj4+ICsgICAgbW1zeXNf
Y2xrOiBjbG9jay1jb250cm9sbGVyQDE0MDAwMDAwIHsKPiA+Pj4+Pj4+ICsgICAgICAgICAgICBj
b21wYXRpYmxlID0gIm1lZGlhdGVrLG10MjcxMi1tbXN5cy1jbGsiOwo+ID4+Pj4+Pj4gKyAgICAg
ICAgICAgICNjbG9jay1jZWxscyA9IDwxPjsKPiA+Pj4+Pj4KPiA+Pj4+Pj4gVGhpcyBnb2VzIGFn
YWluc3QgdGhlIGdlbmVyYWwgZGlyZWN0aW9uIG9mIG5vdCBkZWZpbmluZyBzZXBhcmF0ZSBub2Rl
cwo+ID4+Pj4+PiBmb3IgcHJvdmlkZXJzIHdpdGggbm8gcmVzb3VyY2VzLgo+ID4+Pj4+Pgo+ID4+
Pj4+PiBXaHkgZG8geW91IG5lZWQgdGhpcyBhbmQgd2hhdCBkb2VzIGl0IGJ1eSBpZiB5b3UgaGF2
ZSB0byBjb250aW51ZSB0bwo+ID4+Pj4+PiBzdXBwb3J0IHRoZSBleGlzdGluZyBjaGlwcz8KPiA+
Pj4+Pj4KPiA+Pj4+Pgo+ID4+Pj4+IEl0IHdvdWxkIHNob3cgZXhwbGljaXRseSB0aGF0IHRoZSBt
bXN5cyBibG9jayBpcyB1c2VkIHRvIHByb2JlIHR3bwo+ID4+Pj4+IGRyaXZlcnMsIG9uZSBmb3Ig
dGhlIGdwdSBhbmQgb25lIGZvciB0aGUgY2xvY2tzLiBPdGhlcndpc2UgdGhhdCBpcwo+ID4+Pj4+
IGhpZGRlbiBpbiB0aGUgZHJtIGRyaXZlciBjb2RlLiBJIHRoaW5rIGl0IGlzIGNsZWFuZXIgdG8g
ZGVzY3JpYmUgdGhhdCBpbgo+ID4+Pj4+IHRoZSBkZXZpY2UgdHJlZS4KPiA+Pj4+Cj4gPj4+PiBO
bywgdGhhdCdzIG1heWJlIGNsZWFuZXIgZm9yIHRoZSBkcml2ZXIgaW1wbGVtZW50YXRpb24gaW4g
dGhlIExpbnV4Cj4gPj4+PiBrZXJuZWwuIFdoYXQgYWJvdXQgb3RoZXIgT1MncyBvciB3aGVuIExp
bnV4IGRyaXZlcnMgYW5kIHN1YnN5c3RlbXMKPiA+Pj4+IG5lZWRzIGNoYW5nZT8gQ2xlYW5lciBm
b3IgRFQgaXMgZGVzaWduIGJpbmRpbmdzIHRoYXQgcmVmbGVjdCB0aGUgaC93Lgo+ID4+Pj4gSGFy
ZHdhcmUgaXMgc29tZXRpbWVzIGp1c3QgbWVzc3kuCj4gPj4+Pgo+ID4+Pgo+ID4+PiBJIGFncmVl
LiBJIGZhaWwgdG8gc2VlIHdoYXQgdGhpcyBwYXRjaCBzZXJpZXMgaXMgZG9pbmcgYmVzaWRlcyBj
aGFuZ2luZwo+ID4+PiBkcml2ZXIgcHJvYmUgYW5kIGRldmljZSBjcmVhdGlvbiBtZXRob2RzIGFu
ZCBtYWtpbmcgYSBiYWNrd2FyZHMKPiA+Pj4gaW5jb21wYXRpYmxlIGNoYW5nZSB0byBEVC4gSXMg
dGhlcmUgYW55IG90aGVyIGJlbmVmaXQgaGVyZT8KPiA+Pj4KPiA+Pgo+ID4+IFlvdSBhcmUgcmVm
ZXJyaW5nIHdob2xlIHNlcmllcz8KPiA+PiBDaXRpbmcgdGhlIGNvdmVyIGxldHRlcjoKPiA+PiAi
TU1TWVMgaW4gTWVkaWF0ZWsgU29DcyBoYXMgc29tZSByZWdpc3RlcnMgdG8gY29udHJvbCBjbG9j
ayBnYXRlcyAod2hpY2ggaXMKPiA+PiB1c2VkIGluIHRoZSBjbGsgZHJpdmVyKSBhbmQgc29tZSBy
ZWdpc3RlcnMgdG8gc2V0IHRoZSByb3V0aW5nIGFuZCBlbmFibGUKPiA+PiB0aGUgZGlmZmVybmV0
IChzaWMhKSBibG9ja3Mgb2YgdGhlIGRpc3BsYXkgc3Vic3lzdGVtLgo+ID4+Cj4gPj4gVXAgdG8g
bm93IGJvdGggZHJpdmVycywgY2xvY2sgYW5kIGRybSBhcmUgcHJvYmVkIHdpdGggdGhlIHNhbWUg
ZGV2aWNlIHRyZWUKPiA+PiBjb21wYXRpYmxlLiBCdXQgb25seSB0aGUgZmlyc3QgZHJpdmVyIGdl
dCBwcm9iZWQsIHdoaWNoIGluIGVmZmVjdCBicmVha3MKPiA+PiBncmFwaGljcyBvbiBtdDgxNzMg
YW5kIG10MjcwMS4KPiA+IAo+ID4gT3VjaCEKPiA+IAo+IAo+IFllcyA6KQo+IAo+ID4+Cj4gPj4g
VGhpcyBwYXRjaCB1c2VzIGEgcGxhdGZvcm0gZGV2aWNlIHJlZ2lzdHJhdGlvbiBpbiB0aGUgRFJN
IGRyaXZlciwgd2hpY2gKPiA+PiB3aWxsIHRyaWdnZXIgdGhlIHByb2JlIG9mIHRoZSBjb3JyZXNw
b25kaW5nIGNsb2NrIGRyaXZlci4gSXQgd2FzIHRlc3RlZCBvbiB0aGUKPiA+PiBiYW5hbmFwaS1y
MiBhbmQgdGhlIEFjZXIgUjEzIENocm9tZWJvb2suIgo+ID4gCj4gPiBBbHJpZ2h0LCBwbGVhc2Ug
ZG9uJ3QgYWRkIG5vZGVzIGluIERUIGp1c3QgdG8gbWFrZSBkZXZpY2UgZHJpdmVycyBwcm9iZS4K
PiA+IEluc3RlYWQsIHJlZ2lzdGVyIGNsa3MgZnJvbSB0aGUgZHJtIGRyaXZlciBvciBjcmVhdGUg
YSBjaGlsZCBwbGF0Zm9ybQo+ID4gZGV2aWNlIGZvciB0aGUgY2xrIGJpdHMgcHVyZWx5IGluIHRo
ZSBkcm0gZHJpdmVyIGFuZCBoYXZlIHRoYXQgcHJvYmUgdGhlCj4gPiBhc3NvY2lhdGVkIGNsayBk
cml2ZXIgZnJvbSB0aGVyZS4KPiA+IAo+IAo+IEknbGwgbWFrZSB0aGUgb3RoZXIgU29DcyBwcm9i
ZSB2aWEgYSBjaGlsZCBwbGF0Zm9ybSBkZXZpY2UgZnJvbSB0aGUgZHJtIGRyaXZlciwKPiBhcyBh
bHJlYWR5IGRvbmUgaW4gMi8xMiBhbmQgMy8xMi4KClRoaXMgc2VyaWVzIGhhdmUgYmVlbiBwZW5k
aW5nIGZvciBoYWxmIGFuIHllYXIsIHdvdWxkIHlvdSBrZWVwIGdvaW5nIG9uCnRoaXMgc2VyaWVz
PyBJZiB5b3UncmUgYnVzeSwgSSBjb3VsZCBjb21wbGV0ZSB0aGlzIHNlcmllcywgYnV0IEkgbmVl
ZCB0bwprbm93IHdoYXQgeW91IGhhdmUgcGxhbiB0byBkby4KCkkgZ3Vlc3MgdGhhdCAxLzEyIH4g
NS8xMiBpcyBmb3IgTVQyNzAxL01UODE3MyBhbmQgdGhhdCBwYXRjaGVzIG1lZXQgdGhpcwpkaXNj
dXNzaW9uLiA2LzEyIH4gMTIvMTIgaXMgZm9yIE1UMjcxMi9NVDY3OTcgYnV0IHRoYXQgcGF0Y2hl
cyBkb2VzIG5vdAptZWV0IHRoaXMgZGlzY3Vzc2lvbi4gU28gdGhlIHVuZmluaXNoZWQgd29yayBp
cyB0byBtYWtlIE1UMjcxMi9NVDY3OTcgdG8KYWxpZ24gTVQyNzAxL01UODE3MywgaXMgdGhpcyBy
aWdodD8KClJlZ2FyZHMsCkNLCgo+IAo+IFJlZ2FyZHMsCj4gTWF0dGhpYXMKPiAKPiA+Pgo+ID4+
IERUIGlzIGJyb2tlbiByaWdodCBub3csIGJlY2F1c2UgdHdvIGRyaXZlcnMgcmVseSBvbiB0aGUg
c2FtZSBub2RlLCB3aGljaCBnZXRzCj4gPj4gY29uc3VtZWQganVzdCBvbmNlLiBUaGUgbmV3IERU
IGludHJvZHVjZWQgZG9lcyBub3QgYnJlYWsgYW55dGhpbmcgYmVjYXVzZSBpdCBpcwo+ID4+IG9u
bHkgdXNlZCBmb3IgYm9hcmRzIHRoYXQ6ICJbLi5dIGFyZSBub3QgYXZhaWxhYmxlIHRvIHRoZSBn
ZW5lcmFsIHB1YmxpYwo+ID4+IChtdDI3MTJlKSBvciBvbmx5IGhhdmUgdGhlIG1tc3lzIGNsb2Nr
IGRyaXZlciBwYXJ0IGltcGxlbWVudGVkIChtdDY3OTcpLiIKPiA+IAo+ID4gT2ssIHNvIGJhY2t3
YXJkcyBjb21wYXRpYmlsaXR5IGlzIGlycmVsZXZhbnQgdGhlbi4gU291bmRzIGZpbmUgdG8gbWUu
Cj4gPiAKPiA+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Cj4gTGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbWVkaWF0ZWsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
