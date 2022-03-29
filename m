Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4123A4EB1ED
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 18:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFE6410F136;
	Tue, 29 Mar 2022 16:41:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E6610F136
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 16:41:12 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1nZEu2-0005cv-G0; Tue, 29 Mar 2022 18:41:06 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1nZEtw-003pAh-DT; Tue, 29 Mar 2022 18:41:03 +0200
Received: from pza by lupine with local (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1nZEty-000AjW-6r; Tue, 29 Mar 2022 18:41:02 +0200
Message-ID: <f42752b8814bf02ed33dbd597d60fa8e07070bfb.camel@pengutronix.de>
Subject: Re: [PATCH v2] drm/imx: Fix memory leak in imx_pd_connector_get_modes
From: Philipp Zabel <p.zabel@pengutronix.de>
To: =?ISO-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>, 
 LW@karo-electronics.de
Date: Tue, 29 Mar 2022 18:41:02 +0200
In-Reply-To: <20220108165230.44610-1-jose.exposito89@gmail.com>
References: <20220108165230.44610-1-jose.exposito89@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: airlied@linux.ie, shawnguo@kernel.org, s.hauer@pengutronix.de,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2EsIDIwMjItMDEtMDggYXQgMTc6NTIgKzAxMDAsIEpvc8OpIEV4cMOzc2l0byB3cm90ZToK
PiBBdm9pZCBsZWFraW5nIHRoZSBkaXNwbGF5IG1vZGUgdmFyaWFibGUgaWYgb2ZfZ2V0X2RybV9k
aXNwbGF5X21vZGUKPiBmYWlscy4KPiAKPiBGaXhlczogNzZlY2Q5YzlmYjI0ICgiZHJtL2lteDog
cGFyYWxsZWwtZGlzcGxheTogY2hlY2sgcmV0dXJuIGNvZGUKPiBmcm9tIG9mX2dldF9kcm1fZGlz
cGxheV9tb2RlKCkiKQo+IEFkZHJlc3Nlcy1Db3Zlcml0eS1JRDogMTQ0Mzk0MyAoIlJlc291cmNl
IGxlYWsiKQo+IFNpZ25lZC1vZmYtYnk6IEpvc8OpIEV4cMOzc2l0byA8am9zZS5leHBvc2l0bzg5
QGdtYWlsLmNvbT4KPiAKPiAtLS0KPiAKPiB2MjogSW1wcm92ZSBjb21taXQgbWVzc2FnZQo+IC0t
LQo+IMKgZHJpdmVycy9ncHUvZHJtL2lteC9wYXJhbGxlbC1kaXNwbGF5LmMgfCA0ICsrKy0KPiDC
oDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2lteC9wYXJhbGxlbC1kaXNwbGF5LmMKPiBiL2RyaXZl
cnMvZ3B1L2RybS9pbXgvcGFyYWxsZWwtZGlzcGxheS5jCj4gaW5kZXggYThhYmEwMTQxY2U3Li4z
YmY4ZTBhNDgwM2EgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2lteC9wYXJhbGxlbC1k
aXNwbGF5LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaW14L3BhcmFsbGVsLWRpc3BsYXkuYwo+
IEBAIC03NSw4ICs3NSwxMCBAQCBzdGF0aWMgaW50IGlteF9wZF9jb25uZWN0b3JfZ2V0X21vZGVz
KHN0cnVjdAo+IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHJldCA9IG9mX2dldF9kcm1fZGlzcGxheV9tb2RlKG5wLCAmaW14cGQtPm1v
ZGUsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZpbXhwZC0+YnVzX2ZsYWdz
LAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBPRl9VU0VfTkFUSVZFX01PREUp
Owo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAocmV0KQo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAocmV0KSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkcm1fbW9kZV9kZXN0cm95KGNvbm5lY3Rvci0+ZGV2LCBt
b2RlKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBy
ZXR1cm4gcmV0Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4gwqAKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRybV9tb2RlX2NvcHkobW9kZSwgJmlteHBkLT5t
b2RlKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG1vZGUtPnR5cGUgfD0gRFJN
X01PREVfVFlQRV9EUklWRVIgfAo+IERSTV9NT0RFX1RZUEVfUFJFRkVSUkVEOwoKVGhhbmsgeW91
LCBhcHBsaWVkIHRvIGlteC1kcm0vZml4ZXMuCgpyZWdhcmRzClBoaWxpcHAK

