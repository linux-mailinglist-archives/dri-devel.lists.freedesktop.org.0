Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A934A116636
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 06:22:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F4B6E320;
	Mon,  9 Dec 2019 05:22:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (mailgw02.mediatek.com [216.200.240.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 314656E320
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 05:22:43 +0000 (UTC)
X-UUID: 7818660cc7c544d8a7f98f1cfeb7855b-20191208
X-UUID: 7818660cc7c544d8a7f98f1cfeb7855b-20191208
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1206621328; Sun, 08 Dec 2019 21:17:36 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 8 Dec 2019 21:13:55 -0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 9 Dec 2019 13:12:23 +0800
Message-ID: <1575868373.7013.4.camel@mtksdaap41>
Subject: Re: [resend PATCH v6 01/12] dt-bindings: display: mediatek: Add
 mmsys binding description
From: CK Hu <ck.hu@mediatek.com>
To: <matthias.bgg@kernel.org>
Date: Mon, 9 Dec 2019 13:12:53 +0800
In-Reply-To: <20191207224740.24536-2-matthias.bgg@kernel.org>
References: <20191207224740.24536-1-matthias.bgg@kernel.org>
 <20191207224740.24536-2-matthias.bgg@kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=mediatek.com; s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ButzdGv9wS4vEWD4n7bWNCvee+jF/m3iYcDfT63Gb/M=; 
 b=K+xbjE4zxHlsimO89ardVwvWMdR/92+p/ZkgGAM1A89rtS6hWOhjVHROk99RMBrzso3vDBkSEuo/nzrhxIREb4A0GnazQcCZDgLOpAYwQJ2Gw2ItgxVyFCF6GjYt1C5l6JnKtHdw9fVAAMCfO313R5bzAFn39cjN6fxNjO9tBjk=;
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
Cc: mark.rutland@arm.com, rdunlap@infradead.org, airlied@linux.ie,
 mturquette@baylibre.com, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, ulrich.hecht+renesas@gmail.com,
 linux-clk@vger.kernel.org, drinkcat@chromium.org, wens@csie.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 frank-w@public-files.de, sean.wang@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 linux-arm-kernel@lists.infradead.org, mbrugger@suse.com, sboyd@kernel.org,
 sean.wang@kernel.org, linux-kernel@vger.kernel.org,
 enric.balletbo@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIE1hdHRoaWFzOg0KDQpPbiBTYXQsIDIwMTktMTItMDcgYXQgMjM6NDcgKzAxMDAsIG1hdHRo
aWFzLmJnZ0BrZXJuZWwub3JnIHdyb3RlOg0KPiBGcm9tOiBNYXR0aGlhcyBCcnVnZ2VyIDxtYnJ1
Z2dlckBzdXNlLmNvbT4NCj4gDQo+IFRoZSBNZWRpYVRlayBEUk0gaGFzIGEgYmxvY2sgY2FsbGVk
IG1tc3lzLCB3aGljaCBzZXRzDQo+IHRoZSByb3V0aW5nIGFuZCBlbmFsYmVzIHRoZSBkaWZmZXJl
bnQgYmxvY2tzLg0KPiBUaGlzIHBhdGNoIGFkZHMgb25lIGxpbmUgZm9yIHRoZSBtbXN5cyBiaW5k
aW5ncyBkZXNjcmlwdGlvbi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hdHRoaWFzIEJydWdnZXIg
PG1icnVnZ2VyQHN1c2UuY29tPg0KPiAtLS0NCj4gIC4uLi9kaXNwbGF5L21lZGlhdGVrL21lZGlh
dGVrLGRpc3AudHh0ICAgICAgICB8IDI4ICsrKysrKysrKystLS0tLS0tLS0NCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9t
ZWRpYXRlayxkaXNwLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0DQo+IGluZGV4IDg0NjlkZTUxMDAwMS4uYzcx
YzhhNGI3M2ZmIDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dA0KPiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4
dA0KPiBAQCAtMjcsMjAgKzI3LDIyIEBAIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRwaS50eHQuDQo+ICANCj4gIFJlcXVpcmVkIHBy
b3BlcnRpZXMgKGFsbCBmdW5jdGlvbiBibG9ja3MpOg0KPiAgLSBjb21wYXRpYmxlOiAibWVkaWF0
ZWssPGNoaXA+LWRpc3AtPGZ1bmN0aW9uPiIsIG9uZSBvZg0KPiAtCSJtZWRpYXRlayw8Y2hpcD4t
ZGlzcC1vdmwiICAgLSBvdmVybGF5ICg0IGxheWVycywgYmxlbmRpbmcsIGNzYykNCj4gLQkibWVk
aWF0ZWssPGNoaXA+LWRpc3AtcmRtYSIgIC0gcmVhZCBETUEgLyBsaW5lIGJ1ZmZlcg0KPiAtCSJt
ZWRpYXRlayw8Y2hpcD4tZGlzcC13ZG1hIiAgLSB3cml0ZSBETUENCj4gLQkibWVkaWF0ZWssPGNo
aXA+LWRpc3AtY29sb3IiIC0gY29sb3IgcHJvY2Vzc29yDQo+IC0JIm1lZGlhdGVrLDxjaGlwPi1k
aXNwLWFhbCIgICAtIGFkYXB0aXZlIGFtYmllbnQgbGlnaHQgY29udHJvbGxlcg0KPiAtCSJtZWRp
YXRlayw8Y2hpcD4tZGlzcC1nYW1tYSIgLSBnYW1tYSBjb3JyZWN0aW9uDQo+IC0JIm1lZGlhdGVr
LDxjaGlwPi1kaXNwLW1lcmdlIiAtIG1lcmdlIHN0cmVhbXMgZnJvbSB0d28gUkRNQSBzb3VyY2Vz
DQo+IC0JIm1lZGlhdGVrLDxjaGlwPi1kaXNwLXNwbGl0IiAtIHNwbGl0IHN0cmVhbSB0byB0d28g
ZW5jb2RlcnMNCj4gLQkibWVkaWF0ZWssPGNoaXA+LWRpc3AtdWZvZSIgIC0gZGF0YSBjb21wcmVz
c2lvbiBlbmdpbmUNCj4gLQkibWVkaWF0ZWssPGNoaXA+LWRzaSIgICAgICAgIC0gRFNJIGNvbnRy
b2xsZXIsIHNlZSBtZWRpYXRlayxkc2kudHh0DQo+IC0JIm1lZGlhdGVrLDxjaGlwPi1kcGkiICAg
ICAgICAtIERQSSBjb250cm9sbGVyLCBzZWUgbWVkaWF0ZWssZHBpLnR4dA0KPiAtCSJtZWRpYXRl
ayw8Y2hpcD4tZGlzcC1tdXRleCIgLSBkaXNwbGF5IG11dGV4DQo+IC0JIm1lZGlhdGVrLDxjaGlw
Pi1kaXNwLW9kIiAgICAtIG92ZXJkcml2ZQ0KPiArCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1vdmwi
CQktIG92ZXJsYXkgKDQgbGF5ZXJzLCBibGVuZGluZywgY3NjKQ0KDQpUaGlzIHBhdGNoIGNvbmZs
aWN0cyB3aXRoIDUuNS1yYywgcGxlYXNlIHJlc2VuZCB0aGlzIHBhdGNoIGJhc2Ugb24NCjUuNS1y
YzEuDQoNCj4gKwkibWVkaWF0ZWssPGNoaXA+LWRpc3AtcmRtYSIJCS0gcmVhZCBETUEgLyBsaW5l
IGJ1ZmZlcg0KPiArCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC13ZG1hIgkJLSB3cml0ZSBETUENCj4g
KwkibWVkaWF0ZWssPGNoaXA+LWRpc3AtY29sb3IiCQktIGNvbG9yIHByb2Nlc3Nvcg0KPiArCSJt
ZWRpYXRlayw8Y2hpcD4tZGlzcC1hYWwiCQktIGFkYXB0aXZlIGFtYmllbnQgbGlnaHQgY29udHJv
bGxlcg0KPiArCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1nYW1tYSIJCS0gZ2FtbWEgY29ycmVjdGlv
bg0KPiArCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1tZXJnZSIJCS0gbWVyZ2Ugc3RyZWFtcyBmcm9t
IHR3byBSRE1BIHNvdXJjZXMNCj4gKwkibWVkaWF0ZWssPGNoaXA+LWRpc3Atc3BsaXQiCQktIHNw
bGl0IHN0cmVhbSB0byB0d28gZW5jb2RlcnMNCj4gKwkibWVkaWF0ZWssPGNoaXA+LWRpc3AtdWZv
ZSIJCS0gZGF0YSBjb21wcmVzc2lvbiBlbmdpbmUNCj4gKwkibWVkaWF0ZWssPGNoaXA+LWRzaSIJ
CQktIERTSSBjb250cm9sbGVyLCBzZWUgbWVkaWF0ZWssZHNpLnR4dA0KPiArCSJtZWRpYXRlayw8
Y2hpcD4tZHBpIgkJCS0gRFBJIGNvbnRyb2xsZXIsIHNlZSBtZWRpYXRlayxkcGkudHh0DQo+ICsJ
Im1lZGlhdGVrLDxjaGlwPi1kaXNwLW11dGV4IgkJLSBkaXNwbGF5IG11dGV4DQo+ICsJIm1lZGlh
dGVrLDxjaGlwPi1kaXNwLW9kIgkJLSBvdmVyZHJpdmUNCj4gKwkibWVkaWF0ZWssPGNoaXA+LW1t
c3lzIiwgInN5c2NvbiIJLSBwcm92aWRlIGNsb2NrcyBhbmQgY29tcG9uZW50cyBtYW5hZ2VtZW50
DQo+ICAgIHRoZSBzdXBwb3J0ZWQgY2hpcHMgYXJlIG10MjcwMSwgbXQyNzEyIGFuZCBtdDgxNzMu
DQoNClRoZSBvcmlnaW5hbCBiaW5kaW5nIGRvY3VtZW50IGZvciBtbXN5cyBpcyBpbiBbMV0sIEkg
dGhpbmsgd2Ugc2hvdWxkIG5vdA0KZGVmaW5lIGl0IGluIGR1cGxpY2F0ZS4gTWF5YmUgeW91IGNv
dWxkIHJlbW92ZSB0aGUgb3JpZ2luYWwgZG9jdW1lbnQuDQoNClsxXQ0KaHR0cHM6Ly93d3cua2Vy
bmVsLm9yZy9kb2MvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9tZWRpYXRl
ay9tZWRpYXRlayUyQ21tc3lzLnR4dA0KDQpSZWdhcmRzLA0KQ0sNCg0KPiArDQo+ICAtIHJlZzog
UGh5c2ljYWwgYmFzZSBhZGRyZXNzIGFuZCBsZW5ndGggb2YgdGhlIGZ1bmN0aW9uIGJsb2NrIHJl
Z2lzdGVyIHNwYWNlDQo+ICAtIGludGVycnVwdHM6IFRoZSBpbnRlcnJ1cHQgc2lnbmFsIGZyb20g
dGhlIGZ1bmN0aW9uIGJsb2NrIChyZXF1aXJlZCwgZXhjZXB0IGZvcg0KPiAgICBtZXJnZSBhbmQg
c3BsaXQgZnVuY3Rpb24gYmxvY2tzKS4NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
