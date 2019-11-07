Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FB9F2461
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 02:38:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7703E6EE61;
	Thu,  7 Nov 2019 01:38:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 75BEF6EE61
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 01:38:37 +0000 (UTC)
X-UUID: d668e1e4134941a0970ca57a3c3bb828-20191107
X-UUID: d668e1e4134941a0970ca57a3c3bb828-20191107
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1196598728; Thu, 07 Nov 2019 09:38:34 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 7 Nov 2019 09:38:32 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 7 Nov 2019 09:38:32 +0800
Message-ID: <1573090713.30408.3.camel@mtksdaap41>
Subject: Re: [PATCH v2 7/7] drm/mediatek: Support 180 degree rotation
From: CK Hu <ck.hu@mediatek.com>
To: Sean Paul <sean@poorly.run>
Date: Thu, 7 Nov 2019 09:38:33 +0800
In-Reply-To: <CAMavQKJ+_+fytidjp4WvMwSrytJO_aU+57a54h1ACAqPHp3e7A@mail.gmail.com>
References: <20191105211034.123937-1-sean@poorly.run>
 <20191105211034.123937-8-sean@poorly.run>
 <1573031243.15410.2.camel@mtksdaap41>
 <CAMavQKJ+_+fytidjp4WvMwSrytJO_aU+57a54h1ACAqPHp3e7A@mail.gmail.com>
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
Cc: Daniele Castagna <dcastagna@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Fritz
 Koenig <frkoenig@chromium.org>, Miguel Casas <mcasas@chromium.org>,
 "moderated list:ARM/Mediatek
 SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFNlYW46CgpPbiBXZWQsIDIwMTktMTEtMDYgYXQgMDk6NDIgLTA1MDAsIFNlYW4gUGF1bCB3
cm90ZToKPiBPbiBXZWQsIE5vdiA2LCAyMDE5IGF0IDQ6MDcgQU0gQ0sgSHUgPGNrLmh1QG1lZGlh
dGVrLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGksIFNlYW46Cj4gPgo+ID4gT24gVHVlLCAyMDE5LTEx
LTA1IGF0IDE2OjEwIC0wNTAwLCBTZWFuIFBhdWwgd3JvdGU6Cj4gPiA+IEZyb206IFNlYW4gUGF1
bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+ID4gPgo+ID4gPiBOb3cgdGhhdCB3ZSBzdXBwb3J0
IGJvdGggcmVmbGVjdGlvbnMsIHdlIGNhbiBleHBvc2UgMTgwIGRlZ3JlZSByb3RhdGlvbgo+ID4g
PiBhbmQgcmVseSBvbiB0aGUgc2ltcGxpZnkgcm91dGluZSB0byBjb252ZXJ0IHRoYXQgaW50byBS
RUZMRUNUX1ggfAo+ID4gPiBSRUZMRUNUX1kKPiA+ID4KPiA+Cj4gPiBQYXRjaCAxIH4gNiBvZiB0
aGlzIHNlcmllcyBsb29rcyBnb29kIHRvIG1lLgo+ID4gRm9yIHRoaXMgb25lLCBJIHRoaW5rIHRo
ZSByb3RhdGlvbiBjaGVjayBpbiBtdGtfb3ZsX2xheWVyX2NoZWNrKCkgc2hvdWxkCj4gPiBiZSBt
b2RpZmllZC4KPiA+Cj4gCj4gVGhhbmtzIGZvciB0aGUgcXVpY2sgcmV2aWV3cywgQ0shCj4gCj4g
SW4gd2hhdCB3YXkgd291bGQgeW91IGxpa2UgdGhlIGNoZWNrIHRvIGJlIG1vZGlmaWVkPyBJJ20g
Z3Vlc3NpbmcKPiB5b3UncmUgYXNraW5nIHRoYXQgSSBhZGQgaXQgdG8gdGhlIGJpdG1hc2sgcGFz
c2VkIHRvIHRoZQo+IHNpbXBsaWZ5X3JvdGF0aW9uIGZ1bmN0aW9uPwo+IAo+IElmIHRoYXQncyB0
aGUgY2FzZSwgd2UgZG9uJ3QgYWN0dWFsbHkgd2FudCB0byBtb2RpZnkgdGhlCj4gc2ltcGxpZnlf
cm90YXRpb24gYml0bWFzayBzaW5jZSB0aGF0IGJpdG1hc2sgaXMgc3VwcG9zZWQgdG8gYmUgb25s
eQo+IHRoZSByb3RhdGlvbnMgdGhhdCB0aGUgaGFyZHdhcmUgY2FuIGFjaGlldmUuIFNvIGlmIHlv
dSBwYXNzIFJPVEFURV8xODAKPiBpbnRvIHNpbXBsaWZ5X3JvdGF0aW9uLCBpdCB3aWxsIHJldHVy
biBSRUZMRUNUX1ggfCBSRUZMRUNUX1ksIHdoaWNoIGlzCj4gd2hhdCB3ZSB3YW50LiBEb2VzIHRo
YXQgbWFrZSBzZW5zZSwgb3IgYW0gSSBtaXNzaW5nIHNvbWV0aGluZz8KCmRybV9yb3RhdGlvbl9z
aW1wbGlmeSgpIGlzIHJlYWxseSBoYXJkIHRvIHVuZGVyc3RhbmQuIFlvdSdyZSByaWdodCwgc28K
YXBwbHkgdGhpcyBzZXJpZXMgdG8gbWVkaWF0ZWstZHJtLW5leHQtNS41LTIgWzFdLCB0aGFua3Mu
CgpbMV0KaHR0cHM6Ly9naXRodWIuY29tL2NraHUtbWVkaWF0ZWsvbGludXguZ2l0LXRhZ3MvY29t
bWl0cy9tZWRpYXRlay1kcm0tbmV4dC01LjUtMgoKUmVnYXJkcywKQ0sKCj4gCj4gVGhhbmtzLAo+
IAo+IFNlYW4KPiAKPiA+IFJlZ2FyZHMsCj4gPiBDSwo+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTog
U2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jIHwgNCArKy0tCj4gPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jIGIvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jCj4gPiA+IGluZGV4IGY0YzRkM2ZlZGM1
Zi4uNGE1NWJiNmUyMjEzIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2Rpc3Bfb3ZsLmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kaXNwX292bC5jCj4gPiA+IEBAIC0xNDMsOCArMTQzLDggQEAgc3RhdGljIHVuc2lnbmVkIGlu
dCBtdGtfb3ZsX2xheWVyX25yKHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXApCj4gPiA+Cj4gPiA+
ICBzdGF0aWMgdW5zaWduZWQgaW50IG10a19vdmxfc3VwcG9ydGVkX3JvdGF0aW9ucyhzdHJ1Y3Qg
bXRrX2RkcF9jb21wICpjb21wKQo+ID4gPiAgewo+ID4gPiAtICAgICByZXR1cm4gRFJNX01PREVf
Uk9UQVRFXzAgfCBEUk1fTU9ERV9SRUZMRUNUX1kgfAo+ID4gPiAtICAgICAgICAgICAgRFJNX01P
REVfUkVGTEVDVF9YOwo+ID4gPiArICAgICByZXR1cm4gRFJNX01PREVfUk9UQVRFXzAgfCBEUk1f
TU9ERV9ST1RBVEVfMTgwIHwKPiA+ID4gKyAgICAgICAgICAgIERSTV9NT0RFX1JFRkxFQ1RfWCB8
IERSTV9NT0RFX1JFRkxFQ1RfWTsKPiA+ID4gIH0KPiA+ID4KPiA+ID4gIHN0YXRpYyBpbnQgbXRr
X292bF9sYXllcl9jaGVjayhzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wLCB1bnNpZ25lZCBpbnQg
aWR4LAo+ID4KPiA+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
