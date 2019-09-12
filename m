Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2465B0AD8
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 11:04:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 873226EC7B;
	Thu, 12 Sep 2019 09:04:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 18E166EC7A
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 09:04:13 +0000 (UTC)
X-UUID: 68894de430da47989fae04bea9139ecb-20190912
X-UUID: 68894de430da47989fae04bea9139ecb-20190912
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 2104157100; Thu, 12 Sep 2019 17:04:08 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 12 Sep 2019 17:04:06 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Thu, 12 Sep 2019 17:04:05 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/3] add panel driver for innolux,p097pfg with ssd2825 bridge
Date: Thu, 12 Sep 2019 17:04:01 +0800
Message-ID: <20190912090404.89822-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7750BE36942D4B8614D9DC6650D110B6A4CA3516067561C7C1C9FF4D7C3336762000:8
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
 stonea168@163.com, cawa.cheng@mediatek.com, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGRyaXZlciB0byBzdXBwb3J0IHBhbmVsIGlubm9sdXgscDA5N3BmZyB3aXRoIGJyaWRnZSBz
c2QyODU4LgpTU0QyODU4IGNhbiBzcGlsdCBkc2kgNCBsYW5lcyB0byA4IGxhbmVzLgoKSml0YW8g
U2hpICgzKToKICBkcm0vcGFuZWw6IHBhbmVsLWlubm9sdXg6IEFsbG93IDIgcmVzZXQgcGlucyBm
b3IgcGFuZWwKICBkdC1iaW5kaW5nczogZGlzcGxheTogQWRkIGRvY3VtZW50YXRpb24gZm9yIGlu
bm9sdXgscDA5N3BmZ19zc2QyODU4CiAgICBwYW5lbAogIGRybS9wYW5lbDogcGFuZWwtaW5ub2x1
eDogQWRkIHN1cHBvcnQgZm9yIFAwOTdQRlogYmVoaW5kIFNTRDI4NTgKCiAuLi4vZGlzcGxheS9w
YW5lbC9pbm5vbHV4LHAwOTdwZmdfc3NkMjg1OC50eHQgfCAgMzkgKysrKysKIGRyaXZlcnMvZ3B1
L2RybS9wYW5lbC9wYW5lbC1pbm5vbHV4LXAwNzl6Y2EuYyB8IDE0MCArKysrKysrKysrKysrKysr
LS0KIDIgZmlsZXMgY2hhbmdlZCwgMTY0IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQog
Y3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L3BhbmVsL2lubm9sdXgscDA5N3BmZ19zc2QyODU4LnR4dAoKLS0gCjIuMjEuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
