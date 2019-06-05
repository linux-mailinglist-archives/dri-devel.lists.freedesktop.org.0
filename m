Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1589336CE9
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 09:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 088D98982E;
	Thu,  6 Jun 2019 07:04:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Wed, 05 Jun 2019 11:48:27 UTC
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED63B898A4
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 11:48:27 +0000 (UTC)
X-UUID: 51816b59e12a44a795963106a2bc9b79-20190605
X-UUID: 51816b59e12a44a795963106a2bc9b79-20190605
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1953206414; Wed, 05 Jun 2019 19:43:22 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 5 Jun 2019 19:43:21 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 5 Jun 2019 19:43:20 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3, 00/27] add drm support for MT8183
Date: Wed, 5 Jun 2019 19:42:39 +0800
Message-ID: <1559734986-7379-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Thu, 06 Jun 2019 07:03:45 +0000
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
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+CgpUaGlzIHNl
cmllcyBhcmUgYmFzZWQgb24gNS4yLXJjMSBhbmQgcHJvdmlkIDI3IHBhdGNoCnRvIHN1cHBvcnQg
bWVkaWF0ZWsgU09DIE1UODE4MwoKQ2hhbmdlIHNpbmNlIHYyCi0gZml4IHJldmlld2VkIGlzc3Vl
IGluIHYyCi0gYWRkIG11dGV4IG5vZGUgaW50byBkdHMgZmlsZQoKWW9uZ3FpYW5nIE5pdSAoMjcp
OgogIGR0LWJpbmRpbmdzOiBtZWRpYXRlazogYWRkIGJpbmRpbmcgZm9yIG10ODE4MyBkaXNwbGF5
CiAgZHQtYmluZGluZ3M6IG1lZGlhdGVrOiBhZGQgb3ZsXzJsIGRlc2NyaXB0aW9uIGZvciBtdDgx
ODMgZGlzcGxheQogIGR0LWJpbmRpbmdzOiBtZWRpYXRlazogYWRkIGNjb3JyIGRlc2NyaXB0aW9u
IGZvciBtdDgxODMgZGlzcGxheQogIGR0LWJpbmRpbmdzOiBtZWRpYXRlazogYWRkIGRpdGhlciBk
ZXNjcmlwdGlvbiBmb3IgbXQ4MTgzIGRpc3BsYXkKICBhcm02NDogZHRzOiBhZGQgZGlzcGxheSBu
b2RlcyBmb3IgbXQ4MTgzCiAgZHJtL21lZGlhdGVrOiBhZGQgbXV0ZXggbW9kIGludG8gZGRwIHBy
aXZhdGUgZGF0YQogIGRybS9tZWRpYXRlazogYWRkIG11dGV4IG1vZCByZWdpc3RlciBvZmZzZXQg
aW50byBkZHAgcHJpdmF0ZSBkYXRhCiAgZHJtL21lZGlhdGVrOiBhZGQgbXV0ZXggc29mIGludG8g
ZGRwIHByaXZhdGUgZGF0YQogIGRybS9tZWRpYXRlazogYWRkIG11dGV4IHNvZiByZWdpc3RlciBv
ZmZzZXQgaW50byBkZHAgcHJpdmF0ZSBkYXRhCiAgZHJtL21lZGlhdGVrOiBzcGxpdCBESVNQX1JF
R19DT05GSUdfRFNJX1NFTCBzZXR0aW5nIGludG8gYW5vdGhlciB1c2UKICAgIGNhc2UKICBkcm0v
bWVkaWF0ZWs6IGFkZCBtbXN5cyBwcml2YXRlIGRhdGEgZm9yIGRkcCBwYXRoIGNvbmZpZwogIGRy
bS9tZWRpYXRlazogbW92ZSByZG1hIHNvdXQgZnJvbSBtdGtfZGRwX21vdXRfZW4gaW50bwogICAg
bXRrX2RkcF9zb3V0X3NlbAogIGRybS9tZWRpYXRlazogYWRkIGRkcCBjb21wb25lbnQgQ0NPUlIK
ICBkcm0vbWVkaWF0ZWs6IGFkZCBjb21tcG9uZW50IE9WTF8yTDAKICBkcm0vbWVkaWF0ZWs6IGFk
ZCBjb21wb25lbnQgT1ZMXzJMMQogIGRybS9tZWRpYXRlazogYWRkIGNvbXBvbmVudCBESVRIRVIK
ICBkcm0vbWVkaWF0ZWs6IGFkZCBnbWNfYml0cyBmb3Igb3ZsIHByaXZhdGUgZGF0YQogIGRybS9t
ZWRhaXRlazogYWRkIGxheWVyX25yIGZvciBvdmwgcHJpdmF0ZSBkYXRhCiAgZHJtL21lZGlhdGVr
OiBhZGQgZnVuY3Rpb24gdG8gYmFja2dyb3VuZCBjb2xvciBpbnB1dCBzZWxlY3QgZm9yCiAgICBv
dmwvb3ZsXzJsIGRpcmVjdCBsaW5rCiAgZHJtL21lZGlhdGVrOiBhZGQgYmFja2dyb3VuZCBjb2xv
ciBpbnB1dCBzZWxlY3QgZnVuY3Rpb24gZm9yCiAgICBvdmwvb3ZsXzJsCiAgZHJtL21lZGlhdGVr
OiBhZGQgb3ZsMC9vdmxfMmwwIHVzZWNhc2UKICBkcm0vbWVkaWF0ZWs6IGRpc3Rpbmd1aXNoIG92
bCBhbmQgb3ZsXzJsIGJ5IGxheWVyX25yCiAgZHJtL21lZGlhdGVrOiBhZGQgY29ubmVjdGlvbiBm
cm9tIG92bDAgdG8gb3ZsXzJsMAogIGRybS9tZWRpYXRlazogYWRkIGNvbm5lY3Rpb24gZnJvbSBS
RE1BMCB0byBDT0xPUjAKICBkcm0vbWVkaWF0ZWs6IGFkZCBjb25uZWN0aW9uIGZyb20gUkRNQTEg
dG8gRFNJMAogIGRybS9tZWRpYXRlazogYWRkIGNsb2NrIHByb3BlcnR5IGNoZWNrIGJlZm9yZSBn
ZXQgaXQKICBkcm0vbWVkaWF0ZWs6IGFkZCBzdXBwb3J0IGZvciBtZWRpYXRlayBTT0MgTVQ4MTgz
CgogLi4uL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQgICAgfCAg
MzcgKy0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLmR0c2kgICAgICAgICAg
IHwgMTE0ICsrKysrKwogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jICAg
ICAgICAgICAgfCAgODAgKysrLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX3Jk
bWEuYyAgICAgICAgICAgfCAgMTIgKwogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
Y3J0Yy5jICAgICAgICAgICAgfCAgNDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX2RkcC5jICAgICAgICAgICAgIHwgNDI5ICsrKysrKysrKysrKysrKystLS0tLQogZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmggICAgICAgICAgICAgfCAgIDYgKwogZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYyAgICAgICAgfCAgNjggKysr
KwogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuaCAgICAgICAgfCAg
MjMgKysKIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jICAgICAgICAgICAg
IHwgIDUyICsrKwogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmggICAgICAg
ICAgICAgfCAgIDQgKwogMTEgZmlsZXMgY2hhbmdlZCwgNzQ1IGluc2VydGlvbnMoKyksIDEyMiBk
ZWxldGlvbnMoLSkKCi0tIAoxLjguMS4xLmRpcnR5CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
