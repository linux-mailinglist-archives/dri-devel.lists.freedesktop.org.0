Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 121A941E3D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 09:51:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 766A18922B;
	Wed, 12 Jun 2019 07:51:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9F2968922B
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 07:51:19 +0000 (UTC)
X-UUID: b092410acb6440748b34d91446ef32a9-20190612
X-UUID: b092410acb6440748b34d91446ef32a9-20190612
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1454407557; Wed, 12 Jun 2019 15:51:09 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 12 Jun 2019 15:51:08 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 12 Jun 2019 15:51:08 +0800
Message-ID: <1560325868.3259.6.camel@mtksdaap41>
Subject: [GIT,PULL] mediatek drm fixes for 5.2
From: CK Hu <ck.hu@mediatek.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>, 
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>
Date: Wed, 12 Jun 2019 15:51:08 +0800
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
Cc: Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwgRGFuaWVsOgoKVGhpcyBpbmNsdWRlIHVuYmluZCBlcnJvciBmaXgsIGNsb2NrIGNv
bnRyb2wgZmxvdyByZWZpbmVtZW50LCBhbmQgUFJJTUUKbW1hcCB3aXRoIHBhZ2Ugb2Zmc2V0LgoK
UmVnYXJkcywKQ0sKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQKYTE4ODMzOWNh
NWEzOTZhY2M1ODhlNTg1MWVkN2UxOWY2NmIwZWJkOToKCiAgTGludXggNS4yLXJjMSAoMjAxOS0w
NS0xOSAxNTo0NzowOSAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5
IGF0OgoKICBodHRwczovL2dpdGh1Yi5jb20vY2todS1tZWRpYXRlay9saW51eC5naXQtdGFncy5n
aXQKbWVkaWF0ZWstZHJtLWZpeGVzLTUuMgoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRv
IDI0NThkOWQ2ZDk0YmU5ODJiOTE3ZTkzYzYxYTg5YjQ0MjZmMzJlMzE6CgogIGRybS9tZWRpYXRl
azogY2FsbCBtdGtfZHNpX3N0b3AoKSBhZnRlciBtdGtfZHJtX2NydGNfYXRvbWljX2Rpc2FibGUo
KQooMjAxOS0wNi0wNCAwOTo1NDo0MiArMDgwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KSHNpbi1ZaSBXYW5nICg1KToK
ICAgICAgZHJtL21lZGlhdGVrOiBmaXggdW5iaW5kIGZ1bmN0aW9ucwogICAgICBkcm0vbWVkaWF0
ZWs6IHVuYmluZCBjb21wb25lbnRzIGluIG10a19kcm1fdW5iaW5kKCkKICAgICAgZHJtL21lZGlh
dGVrOiBjYWxsIGRybV9hdG9taWNfaGVscGVyX3NodXRkb3duKCkgd2hlbiB1bmJpbmRpbmcKZHJp
dmVyCiAgICAgIGRybS9tZWRpYXRlazogY2xlYXIgbnVtX3BpcGVzIHdoZW4gdW5iaW5kIGRyaXZl
cgogICAgICBkcm0vbWVkaWF0ZWs6IGNhbGwgbXRrX2RzaV9zdG9wKCkgYWZ0ZXIKbXRrX2RybV9j
cnRjX2F0b21pY19kaXNhYmxlKCkKCllvbmdxaWFuZyBOaXUgKDIpOgogICAgICBkcm0vbWVkaWF0
ZWs6IGFkanVzdCBkZHAgY2xvY2sgY29udHJvbCBmbG93CiAgICAgIGRybS9tZWRpYXRlazogcmVz
cGVjdCBwYWdlIG9mZnNldCBmb3IgUFJJTUUgbW1hcCBjYWxscwoKIGRyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2NydGMuYyB8IDMwCisrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMgIHwgIDggKysrLS0tLS0K
IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dlbS5jICB8ICA3ICsrKysrKy0KIGRy
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgICAgICB8IDEyICsrKysrKysrKysrLQog
NCBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAzMSBkZWxldGlvbnMoLSkKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
