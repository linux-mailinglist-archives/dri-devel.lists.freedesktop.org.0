Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 464B489146
	for <lists+dri-devel@lfdr.de>; Sun, 11 Aug 2019 12:40:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692B389CDB;
	Sun, 11 Aug 2019 10:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1B08A89CDB
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2019 10:40:32 +0000 (UTC)
X-UUID: 9504157131724bf1871e2df9da07d3bb-20190811
X-UUID: 9504157131724bf1871e2df9da07d3bb-20190811
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 308937542; Sun, 11 Aug 2019 18:40:28 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Sun, 11 Aug 2019 18:40:22 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Sun, 11 Aug 2019 18:40:21 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, "Mark
 Rutland" <mark.rutland@arm.com>, Ian Campbell
 <ijc+devicetree@hellion.org.uk>, <linux-pwm@vger.kernel.org>, David Airlie
 <airlied@linux.ie>, "Matthias Brugger" <matthias.bgg@gmail.com>
Subject: [PATCH v6 0/7] Support dsi for mt8183
Date: Sun, 11 Aug 2019 18:40:01 +0800
Message-ID: <20190811104008.53372-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1684-8.5.1010-24840.000
X-TM-AS-Result: No-5.718800-8.000000-10
X-TMASE-MatchedRID: PCFkxA7eE66hZP7w7B20aBIRh9wkXSlFNV9S7O+u3KadzjX37VUcWqEG
 Khm9baaNNopdIl2CpsDdUKRFRakaQnimQCA94R1WLbjXqdzdtCX3/H7adAffkmu9/l5WAy7sO9Z
 u2UZqoB4haUDpkJbehghuCIQJ30DP0Gz/Cfu4aZIaLqFbxdotGfG6GRFYrbYYHWtVZN0asTiBE9
 XLgD84RgQiZjW65EMBAdXPD0156qGvvxILmKK/HBRFJJyf5BJe3QfwsVk0UbtuRXh7bFKB7pXkZ
 x4nnABf5ZwGcBkyiq7xZlyRTC5yty9XGqRRih6PS4W/MRhJ1X4=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.718800-8.000000
X-TMASE-Version: SMEX-12.5.0.1684-8.5.1010-24840.000
X-TM-SNTS-SMTP: F80B6B3FC6BAC26A8837D7BF87385F3155E757CEC496A3054F68F3063D8FE6672000:8
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
Cc: stonea168@163.com, dri-devel@lists.freedesktop.org,
 Andy Yan <andy.yan@rock-chips.com>, Ajay Kumar <ajaykumar.rs@samsung.com>,
 Vincent Palatin <vpalatin@chromium.org>, cawa.cheng@mediatek.com,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org,
 Jitao Shi <jitao.shi@mediatek.com>, linux-mediatek@lists.infradead.org,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, Rahul Sharma <rahul.sharma@samsung.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Sascha Hauer <kernel@pengutronix.de>, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2hhbmdlIHNpbmNlIHY1OgogLSBmaW5lIHR1bmUgZHBoeSB0aW1pbmcuCgpDaGFuZ2Ugc2luY2Ug
djQ6CiAtIG1vdmUgbWlwaV9kc2lfaG9zdF91bnJlZ2l0ZXIoKSB0byAucmVtb3ZlKCkKIC0gZmlu
ZSB0dW5lIGFkZCBmcmFtZSBzaXplIGNvbnRyb2wgY29kaW5nIHN0eWxlCiAtIGNoYW5nZSB0aGUg
ZGF0YSB0eXBlIG9mIGRhdGFfcmF0ZSBhcyB1MzIsIGFuZCBhZGQgRElWX1JPVU5EX1VQX1VMTAog
LSB1c2UgZGl2X3U2NCB3aGVuIDgwMDAwMDAwMDBVTEwgLyBkc2ktPmRhdGFfcmF0ZS4KCkNoYW5n
ZXMgc2luY2UgdjMKIC0gYWRkIG9uZSBtb3JlICd0YWInIGZvciBiaXR3aXNlIGRlZmluZS4KIC0g
YWRkIFRlc3RlZC1ieTogUnlhbiBDYXNlIDxyeWFuZGNhc2VAY2hyb21pdW0ub3JnPgoJYW5kIFJl
dmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPi4KIC0gcmVtb3ZlIGNvbXBhcmUg
ZGFfaHNfemVybyB0byBkYV9oc19wcmVwYXJlLgoKQ2hhbmdlcyBzaW5jZSB2MjoKIC0gY2hhbmdl
IHRoZSB2aWRlbyB0aW1pbmcgY2FsYyBtZXRob2QKIC0gZmluZSB0aGUgZHNpIGFuZCBtaXBpdHgg
aW5pdCBzZXF1ZW5jZQogLSBmaW5lIHR1bmUgY29tbWl0IG1zZwoKQ2hhbmdlcyBzaW5jZSB2MToK
IC0gc2VwYXJhdGUgZnJhbWUgc2l6ZSBhbmQgcmVnIGNvbW1pdCBjb250cm9sIGluZGVwZW5kZW50
IHBhdGNoZXMuCiAtIGZpeCBzb21lIHJldHVybiB2YWx1ZXMgaW4gcHJvYmUKIC0gcmVtb3ZlIERT
SV9DTURXMCBpbiAiQ01EUSByZWcgYWRkcmVzcyBvZiBtdDgxNzMgaXMgZGlmZmVyZW50IHdpdGgg
bXQyNzAxIiAKCkppdGFvIFNoaSAoNyk6CiAgZHJtL21lZGlhdGVrOiBtb3ZlIG1pcGlfZHNpX2hv
c3RfcmVnaXN0ZXIgdG8gcHJvYmUKICBkcm0vbWVkaWF0ZWs6IGZpeGVzIENNRFEgcmVnIGFkZHJl
c3Mgb2YgbXQ4MTczIGlzIGRpZmZlcmVudCB3aXRoCiAgICBtdDI3MDEKICBkcm0vbWVkaWF0ZWs6
IGFkZCBkc2kgcmVnIGNvbW1pdCBkaXNhYmxlIGNvbnRyb2wKICBkcm0vbWVkaWF0ZWs6IGFkZCBm
cmFtZSBzaXplIGNvbnRyb2wKICBkcm0vbWVkaWF0ZWs6IGFkZCBtdDgxODMgZHNpIGRyaXZlciBz
dXBwb3J0CiAgZHJtL21lZGlhdGVrOiBjaGFuZ2UgdGhlIGRzaSBwaHl0aW1pbmcgY2FsY3VsYXRl
IG1ldGhvZAogIGRybTogbWVkaWF0ZWs6IGFkanVzdCBkc2kgYW5kIG1pcGlfdHggcHJvYmUgc2Vx
dWVuY2UKCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyB8ICAgMiArLQog
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyAgICAgfCAyMjQgKysrKysrKysrKysr
KysrKysrLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAxNjEgaW5zZXJ0aW9ucygrKSwgNjUgZGVs
ZXRpb25zKC0pCgotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
