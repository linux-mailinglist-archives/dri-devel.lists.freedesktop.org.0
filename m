Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 471C7EA94A
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 03:41:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC5E6EBD3;
	Thu, 31 Oct 2019 02:41:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 50C4C6EBD3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 02:41:20 +0000 (UTC)
X-UUID: 93333fb3b0a844d2b11ab8b8d3697eeb-20191031
X-UUID: 93333fb3b0a844d2b11ab8b8d3697eeb-20191031
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1250025582; Thu, 31 Oct 2019 10:41:15 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 31 Oct 2019 10:41:13 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 31 Oct 2019 10:41:12 +0800
Message-ID: <1572489673.25108.2.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: Add RGB[A] variants to published plane
 formats
From: CK Hu <ck.hu@mediatek.com>
To: Sean Paul <sean@poorly.run>
Date: Thu, 31 Oct 2019 10:41:13 +0800
In-Reply-To: <20191023195129.165775-1-sean@poorly.run>
References: <20191023195129.165775-1-sean@poorly.run>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Daniele Castagna <dcastagna@chromium.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Miguel Casas <mcasas@chromium.org>,
 Sean Paul <seanpaul@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFNlYW46CgpPbiBXZWQsIDIwMTktMTAtMjMgYXQgMTU6NTEgLTA0MDAsIFNlYW4gUGF1bCB3
cm90ZToKPiBGcm9tOiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KPiAKPiBUaGVz
ZSBmb3JtYXRzIGFyZSBoYW5kbGVkIGluIHRoZSByZG1hIGNvZGUsIGJ1dCBmb3Igc29tZSByZWFz
b24gdGhleSdyZQo+IG5vdCBwdWJsaXNoZWQgYXMgc3VwcG9ydGVkIGZvcm1hdHMgZm9yIHRoZSBw
bGFuZXMuIFNvIGFkZCB0aGVtIHRvIHRoZQo+IGxpc3QuCgpBcHBsaWVkIHRvIG1lZGlhdGVrLWRy
bS1maXhlcy01LjQgWzFdLCB0aGFua3MuCgpbMV0KaHR0cHM6Ly9naXRodWIuY29tL2NraHUtbWVk
aWF0ZWsvbGludXguZ2l0LXRhZ3MvY29tbWl0cy9tZWRpYXRlay1kcm0tZml4ZXMtNS40CgpSZWdh
cmRzLApDSwoKPiAKPiBDYzogTmljb2xhcyBCb2ljaGF0IDxkcmlua2NhdEBjaHJvbWl1bS5vcmc+
Cj4gQ2M6IERhbmllbGUgQ2FzdGFnbmEgPGRjYXN0YWduYUBjaHJvbWl1bS5vcmc+Cj4gQ2M6IE1p
Z3VlbCBDYXNhcyA8bWNhc2FzQGNocm9taXVtLm9yZz4KPiBUZXN0ZWQtYnk6IE1pZ3VlbCBDYXNh
cyA8bWNhc2FzQGNocm9taXVtLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBTZWFuIFBhdWwgPHNlYW5w
YXVsQGNocm9taXVtLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fcGxhbmUuYyB8IDYgKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fcGxhbmUu
YyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX3BsYW5lLmMKPiBpbmRleCA1ODRh
OWVjYWRjZTYuLjQ5ZDU5NDcwY2MxMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9wbGFuZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fcGxhbmUuYwo+IEBAIC0yMCw2ICsyMCwxMiBAQAo+ICBzdGF0aWMgY29uc3QgdTMyIGZv
cm1hdHNbXSA9IHsKPiAgCURSTV9GT1JNQVRfWFJHQjg4ODgsCj4gIAlEUk1fRk9STUFUX0FSR0I4
ODg4LAo+ICsJRFJNX0ZPUk1BVF9CR1JYODg4OCwKPiArCURSTV9GT1JNQVRfQkdSQTg4ODgsCj4g
KwlEUk1fRk9STUFUX0FCR1I4ODg4LAo+ICsJRFJNX0ZPUk1BVF9YQkdSODg4OCwKPiArCURSTV9G
T1JNQVRfUkdCODg4LAo+ICsJRFJNX0ZPUk1BVF9CR1I4ODgsCj4gIAlEUk1fRk9STUFUX1JHQjU2
NSwKPiAgCURSTV9GT1JNQVRfVVlWWSwKPiAgCURSTV9GT1JNQVRfWVVZViwKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
