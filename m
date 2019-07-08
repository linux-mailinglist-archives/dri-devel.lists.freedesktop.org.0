Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C5563165
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 09:02:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B332989A83;
	Tue,  9 Jul 2019 07:02:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB1389B99
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 22:34:28 +0000 (UTC)
X-UUID: 9746c81f570443e392cef4f8b2837654-20190709
X-UUID: 9746c81f570443e392cef4f8b2837654-20190709
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by
 mailgw01.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 335479482; Tue, 09 Jul 2019 06:34:22 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 9 Jul 2019 06:34:21 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 9 Jul 2019 06:34:20 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4, 00/33] add drm support for MT8183
Date: Tue, 9 Jul 2019 06:33:40 +0800
Message-ID: <1562625253-29254-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Tue, 09 Jul 2019 07:01:45 +0000
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
bWVkaWF0ZWsgU09DIE1UODE4MwoKQ2hhbmdlIHNpbmNlIHYzCi0gZml4IHJldmlld2VkIGlzc3Vl
IGluIHYzCi0gZml4IHR5cGUgZXJyb3IgaW4gdjMKLSBmaXggY29uZmxpY3Qgd2l0aCBpb21tdSBw
YXRjaAoKWW9uZ3FpYW5nIE5pdSAoMzMpOgogIGR0LWJpbmRpbmdzOiBtZWRpYXRlazogYWRkIGJp
bmRpbmcgZm9yIG10ODE4MyBkaXNwbGF5CiAgZHQtYmluZGluZ3M6IG1lZGlhdGVrOiBhZGQgb3Zs
XzJsIGRlc2NyaXB0aW9uIGZvciBtdDgxODMgZGlzcGxheQogIGR0LWJpbmRpbmdzOiBtZWRpYXRl
azogYWRkIGNjb3JyIGRlc2NyaXB0aW9uIGZvciBtdDgxODMgZGlzcGxheQogIGR0LWJpbmRpbmdz
OiBtZWRpYXRlazogYWRkIGRpdGhlciBkZXNjcmlwdGlvbiBmb3IgbXQ4MTgzIGRpc3BsYXkKICBk
dC1iaW5kaW5nczogbWVkaWF0ZWs6IGFkZCBSRE1BMSBkZXNjcmlwdGlvbiBmb3IgbXQ4MTgzIGRp
c3BsYXkKICBkdC1iaW5kaW5nczogbWVkaWF0ZWs6IGFkZCBtdXRleCBkZXNjcmlwdGlvbiBmb3Ig
bXQ4MTgzIGRpc3BsYXkKICBhcm02NDogZHRzOiBhZGQgZGlzcGxheSBub2RlcyBmb3IgbXQ4MTgz
CiAgZHJtL21lZGlhdGVrOiBhZGQgbXV0ZXggbW9kIGludG8gZGRwIHByaXZhdGUgZGF0YQogIGRy
bS9tZWRpYXRlazogYWRkIG11dGV4IG1vZCByZWdpc3RlciBvZmZzZXQgaW50byBkZHAgcHJpdmF0
ZSBkYXRhCiAgZHJtL21lZGlhdGVrOiBhZGQgbXV0ZXggc29mIGludG8gZGRwIHByaXZhdGUgZGF0
YQogIGRybS9tZWRpYXRlazogYWRkIG11dGV4IHNvZiByZWdpc3RlciBvZmZzZXQgaW50byBkZHAg
cHJpdmF0ZSBkYXRhCiAgZHJtL21lZGlhdGVrOiBzcGxpdCBESVNQX1JFR19DT05GSUdfRFNJX1NF
TCBzZXR0aW5nIGludG8gYW5vdGhlciB1c2UKICAgIGNhc2UKICBkcm0vbWVkaWF0ZWs6IGFkZCBt
bXN5cyBwcml2YXRlIGRhdGEgZm9yIGRkcCBwYXRoIGNvbmZpZwogIGRybS9tZWRpYXRlazogbW92
ZSByZG1hIHNvdXQgZnJvbSBtdGtfZGRwX21vdXRfZW4gaW50bwogICAgbXRrX2RkcF9zb3V0X3Nl
bAogIGRybS9tZWRpYXRlazogYWRkIGRkcCBjb21wb25lbnQgQ0NPUlIKICBkcm0vbWVkaWF0ZWs6
IGFkZCBjb21tcG9uZW50IE9WTF8yTDAKICBkcm0vbWVkaWF0ZWs6IGFkZCBjb21wb25lbnQgT1ZM
XzJMMQogIGRybS9tZWRpYXRlazogYWRkIGNvbXBvbmVudCBESVRIRVIKICBkcm0vbWVkaWF0ZWs6
IGFkZCBnbWNfYml0cyBmb3Igb3ZsIHByaXZhdGUgZGF0YQogIGRybS9tZWRhaXRlazogYWRkIGxh
eWVyX25yIGZvciBvdmwgcHJpdmF0ZSBkYXRhCiAgZHJtL21lZGlhdGVrOiBhZGQgZnVuY3Rpb24g
dG8gYmFja2dyb3VuZCBjb2xvciBpbnB1dCBzZWxlY3QgZm9yCiAgICBvdmwvb3ZsXzJsIGRpcmVj
dCBsaW5rCiAgZHJtL21lZGlhdGVrOiBhZGQgYmFja2dyb3VuZCBjb2xvciBpbnB1dCBzZWxlY3Qg
ZnVuY3Rpb24gZm9yCiAgICBvdmwvb3ZsXzJsCiAgZHJtL21lZGlhdGVrOiBhZGQgb3ZsMC9vdmxf
MmwwIHVzZWNhc2UKICBkcm0vbWVkaWF0ZWs6IGRpc3Rpbmd1aXNoIG92bCBhbmQgb3ZsXzJsIGJ5
IGxheWVyX25yCiAgZHJtL21lZGlhdGVrOiBhZGQgY2xvY2sgcHJvcGVydHkgY2hlY2sgYmVmb3Jl
IGdldCBpdAogIGRybS9tZWRpYXRlazogYWRkIGNvbm5lY3Rpb24gZnJvbSBPVkwwIHRvIE9WTF8y
TDAKICBkcm0vbWVkaWF0ZWs6IGFkZCBjb25uZWN0aW9uIGZyb20gUkRNQTAgdG8gQ09MT1IwCiAg
ZHJtL21lZGlhdGVrOiBhZGQgY29ubmVjdGlvbiBmcm9tIFJETUExIHRvIERTSTAKICBkcm0vbWVk
aWF0ZWs6IGFkZCBjb25uZWN0aW9uIGZyb20gT1ZMXzJMMCB0byBSRE1BMAogIGRybS9tZWRpYXRl
azogYWRkIGNvbm5lY3Rpb24gZnJvbSBPVkxfMkwxIHRvIFJETUExCiAgZHJtL21lZGlhdGVrOiBh
ZGQgY29ubmVjdGlvbiBmcm9tIERJVEhFUjAgdG8gRFNJMAogIGRybS9tZWRpYXRlazogYWRkIGNv
bm5lY3Rpb24gZnJvbSBSRE1BMCB0byBEU0kwCiAgZHJtL21lZGlhdGVrOiBhZGQgc3VwcG9ydCBm
b3IgbWVkaWF0ZWsgU09DIE1UODE4MwoKIC4uLi9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21l
ZGlhdGVrLGRpc3AudHh0ICAgIHwgIDMxICstCiAuLi4vYmluZGluZ3MvZGlzcGxheS9tZWRpYXRl
ay9tZWRpYXRlayxkaXNwbGF5LnR4dCB8ICAyMSArKwogYXJjaC9hcm02NC9ib290L2R0cy9tZWRp
YXRlay9tdDgxODMuZHRzaSAgICAgICAgICAgfCAxMDkgKysrKysrCiBkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgICAgICAgICAgICB8ICA3OSArKystCiBkcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcmRtYS5jICAgICAgICAgICB8ICAxMiArCiBkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgICAgICAgICAgICB8ICA0MiArKy0KIGRy
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jICAgICAgICAgICAgIHwgNDEwICsr
KysrKysrKysrKysrKystLS0tLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRw
LmggICAgICAgICAgICAgfCAgIDYgKwogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
ZGRwX2NvbXAuYyAgICAgICAgfCAgNjcgKysrKwogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fZGRwX2NvbXAuaCAgICAgICAgfCAgMjEgKysKIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHJtX2Rydi5jICAgICAgICAgICAgIHwgIDUwICsrKwogZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcm1fZHJ2LmggICAgICAgICAgICAgfCAgIDMgKwogMTIgZmlsZXMgY2hhbmdl
ZCwgNzMwIGluc2VydGlvbnMoKyksIDEyMSBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRp
YXRlayxkaXNwbGF5LnR4dAoKLS0gCjEuOC4xLjEuZGlydHkKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
