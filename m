Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20933B7398
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 08:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27B4D6F77A;
	Thu, 19 Sep 2019 06:58:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 07CDF6F76E
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 06:58:23 +0000 (UTC)
X-UUID: 2e5c475d449e48829af3e5306207e18a-20190919
X-UUID: 2e5c475d449e48829af3e5306207e18a-20190919
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 411866299; Thu, 19 Sep 2019 14:58:14 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 19 Sep 2019 14:58:10 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Thu, 19 Sep 2019 14:58:09 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 0/9] Support dsi for mt8183
Date: Thu, 19 Sep 2019 14:57:57 +0800
Message-ID: <20190919065806.111016-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: D62ABCF55B85138BF60811A1B649122AB907DE58EFCC9D9BE31F9CBE4AB89AD62000:8
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, srv_heupstream@mediatek.com,
 stonea168@163.com, cawa.cheng@mediatek.com, sj.huang@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2hhbmdlcyBzaW5jZSB2NjoKIC0gYWRkIGRwaHkgcmVzZXQgdG8gYXZvaWQgZHBoeSBmaWZvIGVy
cm9yIGFmdGVyIGxpbmVzIG51bWJlciBzZXR0aW5nCiAtIHNlcGFyYXRlIGRzaSBjbWQgcmVnIHNl
dHRpbmcgZnJvbSAiZml4ZXMgQ01EUSByZWcgYWRkcmVzcyBvZiBtdDgxNzMKICAgaXMgZGlmZmVy
ZW50IHdpdGggbXQyNzAxIgoKQ2hhbmdlcyBzaW5jZSB2NToKIC0gZmluZSB0dW5lIGRwaHkgdGlt
aW5nLgoKQ2hhbmdlcyBzaW5jZSB2NDoKIC0gbW92ZSBtaXBpX2RzaV9ob3N0X3VucmVnaXRlcigp
IHRvIC5yZW1vdmUoKQogLSBmaW5lIHR1bmUgYWRkIGZyYW1lIHNpemUgY29udHJvbCBjb2Rpbmcg
c3R5bGUKIC0gY2hhbmdlIHRoZSBkYXRhIHR5cGUgb2YgZGF0YV9yYXRlIGFzIHUzMiwgYW5kIGFk
ZCBESVZfUk9VTkRfVVBfVUxMCiAtIHVzZSBkaXZfdTY0IHdoZW4gODAwMDAwMDAwMFVMTCAvIGRz
aS0+ZGF0YV9yYXRlLgoKQ2hhbmdlcyBzaW5jZSB2MwogLSBhZGQgb25lIG1vcmUgJ3RhYicgZm9y
IGJpdHdpc2UgZGVmaW5lLgogLSBhZGQgVGVzdGVkLWJ5OiBSeWFuIENhc2UgPHJ5YW5kY2FzZUBj
aHJvbWl1bS5vcmc+CglhbmQgUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+
LgogLSByZW1vdmUgY29tcGFyZSBkYV9oc196ZXJvIHRvIGRhX2hzX3ByZXBhcmUuCgpDaGFuZ2Vz
IHNpbmNlIHYyOgogLSBjaGFuZ2UgdGhlIHZpZGVvIHRpbWluZyBjYWxjIG1ldGhvZAogLSBmaW5l
IHRoZSBkc2kgYW5kIG1pcGl0eCBpbml0IHNlcXVlbmNlCiAtIGZpbmUgdHVuZSBjb21taXQgbXNn
CgpDaGFuZ2VzIHNpbmNlIHYxOgogLSBzZXBhcmF0ZSBmcmFtZSBzaXplIGFuZCByZWcgY29tbWl0
IGNvbnRyb2wgaW5kZXBlbmRlbnQgcGF0Y2hlcy4KIC0gZml4IHNvbWUgcmV0dXJuIHZhbHVlcyBp
biBwcm9iZQogLSByZW1vdmUgRFNJX0NNRFcwIGluICJDTURRIHJlZyBhZGRyZXNzIG9mIG10ODE3
MyBpcyBkaWZmZXJlbnQgd2l0aCBtdDI3MDEiIAoKSml0YW8gU2hpICg5KToKICBkcm0vbWVkaWF0
ZWs6IG1vdmUgbWlwaV9kc2lfaG9zdF9yZWdpc3RlciB0byBwcm9iZQogIGRybS9tZWRpYXRlazog
Zml4ZXMgQ01EUSByZWcgYWRkcmVzcyBvZiBtdDgxNzMgaXMgZGlmZmVyZW50IHdpdGgKICAgIG10
MjcwMQogIGRybS9tZWRpYXRlazogcmVwbGFjZSB3cml0ZWIoKSB3aXRoIG10a19kc2lfbWFzaygp
CiAgZHJtL21lZGlhdGVrOiBhZGQgZHNpIHJlZyBjb21taXQgZGlzYWJsZSBjb250cm9sCiAgZHJt
L21lZGlhdGVrOiBhZGQgZnJhbWUgc2l6ZSBjb250cm9sCiAgZHJtL21lZGlhdGVrOiBhZGQgbXQ4
MTgzIGRzaSBkcml2ZXIgc3VwcG9ydAogIGRybS9tZWRpYXRlazogY2hhbmdlIHRoZSBkc2kgcGh5
dGltaW5nIGNhbGN1bGF0ZSBtZXRob2QKICBkcm06IG1lZGlhdGVrOiBhZGp1c3QgZHNpIGFuZCBt
aXBpX3R4IHByb2JlIHNlcXVlbmNlCiAgZHJtL21lZGlhdGVrOiBhZGQgZHBoeSByZXNldCBhZnRl
ciBzZXR0aW5nIGxhbmVzIG51bWJlcgoKIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2Rydi5jIHwgICAyICstCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jICAgICB8
IDIzMyArKysrKysrKysrKysrKysrKystLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDE3MCBpbnNl
cnRpb25zKCspLCA2NSBkZWxldGlvbnMoLSkKCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
