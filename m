Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F719A3170
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 09:46:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB8F6E28A;
	Fri, 30 Aug 2019 07:46:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 26F5B6E287
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2019 07:46:10 +0000 (UTC)
X-UUID: f3c10d97fafc4736a9ddd3c83fd1ab3b-20190830
X-UUID: f3c10d97fafc4736a9ddd3c83fd1ab3b-20190830
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by
 mailgw02.mediatek.com (envelope-from <bibby.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 229470610; Fri, 30 Aug 2019 15:41:06 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 30 Aug 2019 15:41:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 30 Aug 2019 15:41:10 +0800
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: David Airlie <airlied@linux.ie>, Matthias Brugger
 <matthias.bgg@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 0/2] Support CMDQ interface and control flow
Date: Fri, 30 Aug 2019 15:41:01 +0800
Message-ID: <20190830074103.16671-1-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
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
Cc: drinkcat@chromium.org, linux-kernel@vger.kernel.org, tfiga@chromium.org,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIENNRFEgKENvbW1hbmQgUXVldWUpIGluIE1UODE4MyBpcyB1c2VkIHRvIGhlbHAKdXBkYXRl
IGFsbCByZWxldmFudCBkaXNwbGF5IGNvbnRyb2xsZXIgcmVnaXN0ZXJzCndpdGggY3JpdGljYWwg
dGltZSBsaW1hdGlvbi4KClRoZXNlIHBhdGNoZWQgYWRkIENNRFEgaW50ZXJmYWNlIGluIGRkcF9j
b21wIGludGVyZmFjZQphbmQgYWRkIENNRFEgY29udHJvbCBmbG93LgoKVGhpcyBwYXRjaCBkZXBl
bmRzIG9uIHB0YWNoOgpkcm0vbWVkaWF0ZWs6IGZpeHVwIGN1cnNvciBtb3ZpbmcgdW5zbW9vdGgg
aXNzdWUKKGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvY292ZXIvMTExMjMxMTkvKQphZGQg
ZHJtIHN1cHBvcnQgZm9yIE1UODE4MwooaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9jb3Zl
ci8xMTEyMTUxOS8pCnN1cHBvcnQgZ2NlIG9uIG10ODE4MyBwbGF0Zm9ybQooaHR0cHM6Ly9wYXRj
aHdvcmsua2VybmVsLm9yZy9jb3Zlci8xMTEyMDE1My8pCgpCaWJieSBIc2llaCAoMik6CiAgZHJt
L21lZGlhdGVrOiBTdXBwb3J0IENNRFEgaW50ZXJmYWNlIGluIGRkcCBjb21wb25lbnQKICBkcm0v
bWVkaWF0ZWs6IEFwcGx5IENNRFEgY29udHJvbCBmbG93CgogZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kaXNwX2NvbG9yLmMgICB8ICAgNyArLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kaXNwX292bC5jICAgICB8ICA3OCArKysrLS0tLQogZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kaXNwX3JkbWEuYyAgICB8ICA2NiArKystLS0tCiBkcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9jcnRjLmMgICAgIHwgMTkwICsrKysrKysrKysrKysrKysrLS0tCiBkcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmggICAgIHwgICAyICsKIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMgfCAxNDQgKysrKysrKysrKystLS0t
CiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5oIHwgIDU1ICsrKyst
LQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fcGxhbmUuYyAgICB8ICAgNCArCiA4
IGZpbGVzIGNoYW5nZWQsIDM5MyBpbnNlcnRpb25zKCspLCAxNTMgZGVsZXRpb25zKC0pCgotLSAK
Mi4xOC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
