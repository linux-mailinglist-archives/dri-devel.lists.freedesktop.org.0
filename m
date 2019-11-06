Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 200FAF11B3
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 10:07:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0100E6EC57;
	Wed,  6 Nov 2019 09:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3E98E6EC57
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 09:07:30 +0000 (UTC)
X-UUID: d43d6fa3526f41d5bdcf13d18f2948f2-20191106
X-UUID: d43d6fa3526f41d5bdcf13d18f2948f2-20191106
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1421962282; Wed, 06 Nov 2019 17:07:24 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkexhb01.mediatek.inc (172.21.101.102) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 6 Nov 2019 17:07:20 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 6 Nov 2019 17:07:20 +0800
Message-ID: <1573031243.15410.2.camel@mtksdaap41>
Subject: Re: [PATCH v2 7/7] drm/mediatek: Support 180 degree rotation
From: CK Hu <ck.hu@mediatek.com>
To: Sean Paul <sean@poorly.run>
Date: Wed, 6 Nov 2019 17:07:23 +0800
In-Reply-To: <20191105211034.123937-8-sean@poorly.run>
References: <20191105211034.123937-1-sean@poorly.run>
 <20191105211034.123937-8-sean@poorly.run>
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
Cc: dcastagna@chromium.org, dri-devel@lists.freedesktop.org,
 frkoenig@chromium.org, mcasas@chromium.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, Sean Paul <seanpaul@chromium.org>,
 linux-arm-kernel@lists.infradead.org, markyacoub@google.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFNlYW46CgpPbiBUdWUsIDIwMTktMTEtMDUgYXQgMTY6MTAgLTA1MDAsIFNlYW4gUGF1bCB3
cm90ZToKPiBGcm9tOiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KPiAKPiBOb3cg
dGhhdCB3ZSBzdXBwb3J0IGJvdGggcmVmbGVjdGlvbnMsIHdlIGNhbiBleHBvc2UgMTgwIGRlZ3Jl
ZSByb3RhdGlvbgo+IGFuZCByZWx5IG9uIHRoZSBzaW1wbGlmeSByb3V0aW5lIHRvIGNvbnZlcnQg
dGhhdCBpbnRvIFJFRkxFQ1RfWCB8Cj4gUkVGTEVDVF9ZCj4gCgpQYXRjaCAxIH4gNiBvZiB0aGlz
IHNlcmllcyBsb29rcyBnb29kIHRvIG1lLgpGb3IgdGhpcyBvbmUsIEkgdGhpbmsgdGhlIHJvdGF0
aW9uIGNoZWNrIGluIG10a19vdmxfbGF5ZXJfY2hlY2soKSBzaG91bGQKYmUgbW9kaWZpZWQuCgpS
ZWdhcmRzLApDSwoKPiBTaWduZWQtb2ZmLWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVt
Lm9yZz4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jIHwg
NCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwu
YyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYwo+IGluZGV4IGY0YzRk
M2ZlZGM1Zi4uNGE1NWJiNmUyMjEzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZGlzcF9vdmwuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZGlzcF9vdmwuYwo+IEBAIC0xNDMsOCArMTQzLDggQEAgc3RhdGljIHVuc2lnbmVkIGludCBtdGtf
b3ZsX2xheWVyX25yKHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXApCj4gIAo+ICBzdGF0aWMgdW5z
aWduZWQgaW50IG10a19vdmxfc3VwcG9ydGVkX3JvdGF0aW9ucyhzdHJ1Y3QgbXRrX2RkcF9jb21w
ICpjb21wKQo+ICB7Cj4gLQlyZXR1cm4gRFJNX01PREVfUk9UQVRFXzAgfCBEUk1fTU9ERV9SRUZM
RUNUX1kgfAo+IC0JICAgICAgIERSTV9NT0RFX1JFRkxFQ1RfWDsKPiArCXJldHVybiBEUk1fTU9E
RV9ST1RBVEVfMCB8IERSTV9NT0RFX1JPVEFURV8xODAgfAo+ICsJICAgICAgIERSTV9NT0RFX1JF
RkxFQ1RfWCB8IERSTV9NT0RFX1JFRkxFQ1RfWTsKPiAgfQo+ICAKPiAgc3RhdGljIGludCBtdGtf
b3ZsX2xheWVyX2NoZWNrKHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXAsIHVuc2lnbmVkIGludCBp
ZHgsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
