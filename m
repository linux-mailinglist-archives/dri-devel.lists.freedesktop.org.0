Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D2CD4C52
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2019 05:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594226ECAD;
	Sat, 12 Oct 2019 03:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 12F676ECAD
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2019 03:08:13 +0000 (UTC)
X-UUID: 54c2f0a3d5644b70a36fdbcfc4daadc9-20191012
X-UUID: 54c2f0a3d5644b70a36fdbcfc4daadc9-20191012
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 364434644; Sat, 12 Oct 2019 11:08:06 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Sat, 12 Oct 2019 11:08:04 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Sat, 12 Oct 2019 11:08:03 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 8/8] drm/panel: support for auo,
 b101uan08.3 wuxga dsi video mode panel
Date: Sat, 12 Oct 2019 11:07:20 +0800
Message-ID: <20191012030720.27127-9-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191012030720.27127-1-jitao.shi@mediatek.com>
References: <20191012030720.27127-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1684-8.5.1010-24970.000
X-TM-AS-Result: No-4.454300-8.000000-10
X-TMASE-MatchedRID: EVs8mp2+703QIwAe9yDqC/3HILfxLV/9NV9S7O+u3KYBqgK2otzLQvDR
 cRAxsuj7oODj/ed0fo3GVaDBoTrnxixppiUy9o4cGjzBgnFZvQ7gXnxE81iysY5JUK9UdYknKKq
 yc9Qq8XoheBVUjnjCL4RjXy3Ro697sx/x3O663xdJkkUW0nPbN4iuaoNXJrK/rE4sEA01Jmn71G
 pSv+DMDC5Oh8YnEjIhgDLqnrRlXrZ8nn9tnqel2MZW5ai5WKlyfvfWIOIOReAvQUAvxRoIc1Ily
 ofhlFGqt1AsXGB1Oo9+/5H10DkP9/YLSq9KVORy7ZYS8ohwyHLD/8sPERd/m8UMBmUZEDya+F1u
 QrHm3kVAHJVliJsXGmmscOV/NgBtJ4Kg2QL3UZ5Qb0W4rFkT0Q==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.454300-8.000000
X-TMASE-Version: SMEX-12.5.0.1684-8.5.1010-24970.000
X-TM-SNTS-SMTP: 6209DB2CA8B971A409A3F37904A7B71790A4D62E4B46137F4B78B181A30C48142000:8
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
 stonea168@163.com, cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXVvLGF1byxiMTAxdWFuMDguMydzIGNvbm5lY3RvciBpcyBzYW1lIGFzIGJvZSx0djEwMXd1bS1u
bDYuClRoZSBtb3N0IGNvZGVzIGNhbiBiZSByZXVzZS4KU28gYXVvLGIxMDF1YW4wOC4zIGFuZCBi
b2UsdHYxMDF3dW0tbmw2IHVzZSBvbmUgZHJpdmVyIGZpbGUuCkFkZCB0aGUgZGlmZmVyZW50IHBh
cnRzIGluIGRyaXZlciBkYXRhLgoKU2lnbmVkLW9mZi1ieTogSml0YW8gU2hpIDxqaXRhby5zaGlA
bWVkaWF0ZWsuY29tPgotLS0KIC4uLi9ncHUvZHJtL3BhbmVsL3BhbmVsLWJvZS10djEwMXd1bS1u
bDYuYyAgICB8IDc4ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3OCBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWJvZS10
djEwMXd1bS1ubDYuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1ib2UtdHYxMDF3dW0t
bmw2LmMKaW5kZXggN2I0NzYxOTY3NWY1Li5lMjQ5NmEzMzRhYjYgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1ib2UtdHYxMDF3dW0tbmw2LmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL3BhbmVsL3BhbmVsLWJvZS10djEwMXd1bS1ubDYuYwpAQCAtMzgyLDYgKzM4Miw1MyBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2luaXRfY21kIGF1b19rZDEwMW44MF80NW5hX2lu
aXRfY21kW10gPSB7CiAJe30sCiB9OwogCitzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2luaXRf
Y21kIGF1b19iMTAxdWFuMDhfM19pbml0X2NtZFtdID0geworCV9JTklUX0RFTEFZX0NNRCgyNCks
CisJX0lOSVRfRENTX0NNRCgweEIwLCAweDAxKSwKKwlfSU5JVF9EQ1NfQ01EKDB4QzAsIDB4NDgp
LAorCV9JTklUX0RDU19DTUQoMHhDMSwgMHg0OCksCisJX0lOSVRfRENTX0NNRCgweEMyLCAweDQ3
KSwKKwlfSU5JVF9EQ1NfQ01EKDB4QzMsIDB4NDcpLAorCV9JTklUX0RDU19DTUQoMHhDNCwgMHg0
NiksCisJX0lOSVRfRENTX0NNRCgweEM1LCAweDQ2KSwKKwlfSU5JVF9EQ1NfQ01EKDB4QzYsIDB4
NDUpLAorCV9JTklUX0RDU19DTUQoMHhDNywgMHg0NSksCisJX0lOSVRfRENTX0NNRCgweEM4LCAw
eDY0KSwKKwlfSU5JVF9EQ1NfQ01EKDB4QzksIDB4NjQpLAorCV9JTklUX0RDU19DTUQoMHhDQSwg
MHg0RiksCisJX0lOSVRfRENTX0NNRCgweENCLCAweDRGKSwKKwlfSU5JVF9EQ1NfQ01EKDB4Q0Ms
IDB4NDApLAorCV9JTklUX0RDU19DTUQoMHhDRCwgMHg0MCksCisJX0lOSVRfRENTX0NNRCgweENF
LCAweDY2KSwKKwlfSU5JVF9EQ1NfQ01EKDB4Q0YsIDB4NjYpLAorCV9JTklUX0RDU19DTUQoMHhE
MCwgMHg0RiksCisJX0lOSVRfRENTX0NNRCgweEQxLCAweDRGKSwKKwlfSU5JVF9EQ1NfQ01EKDB4
RDIsIDB4NDEpLAorCV9JTklUX0RDU19DTUQoMHhEMywgMHg0MSksCisJX0lOSVRfRENTX0NNRCgw
eEQ0LCAweDQ4KSwKKwlfSU5JVF9EQ1NfQ01EKDB4RDUsIDB4NDgpLAorCV9JTklUX0RDU19DTUQo
MHhENiwgMHg0NyksCisJX0lOSVRfRENTX0NNRCgweEQ3LCAweDQ3KSwKKwlfSU5JVF9EQ1NfQ01E
KDB4RDgsIDB4NDYpLAorCV9JTklUX0RDU19DTUQoMHhEOSwgMHg0NiksCisJX0lOSVRfRENTX0NN
RCgweERBLCAweDQ1KSwKKwlfSU5JVF9EQ1NfQ01EKDB4REIsIDB4NDUpLAorCV9JTklUX0RDU19D
TUQoMHhEQywgMHg2NCksCisJX0lOSVRfRENTX0NNRCgweERELCAweDY0KSwKKwlfSU5JVF9EQ1Nf
Q01EKDB4REUsIDB4NEYpLAorCV9JTklUX0RDU19DTUQoMHhERiwgMHg0RiksCisJX0lOSVRfRENT
X0NNRCgweEUwLCAweDQwKSwKKwlfSU5JVF9EQ1NfQ01EKDB4RTEsIDB4NDApLAorCV9JTklUX0RD
U19DTUQoMHhFMiwgMHg2NiksCisJX0lOSVRfRENTX0NNRCgweEUzLCAweDY2KSwKKwlfSU5JVF9E
Q1NfQ01EKDB4RTQsIDB4NEYpLAorCV9JTklUX0RDU19DTUQoMHhFNSwgMHg0RiksCisJX0lOSVRf
RENTX0NNRCgweEU2LCAweDQxKSwKKwlfSU5JVF9EQ1NfQ01EKDB4RTcsIDB4NDEpLAorCV9JTklU
X0RFTEFZX0NNRCgxNTApLAorCXt9LAorfTsKKwogc3RhdGljIGlubGluZSBzdHJ1Y3QgYm9lX3Bh
bmVsICp0b19ib2VfcGFuZWwoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpCiB7CiAJcmV0dXJuIGNv
bnRhaW5lcl9vZihwYW5lbCwgc3RydWN0IGJvZV9wYW5lbCwgYmFzZSk7CkBAIC02NTIsNiArNjk5
LDM0IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGFuZWxfZGVzYyBib2VfdHYxMDF3dW1fbjUzX2Rl
c2MgPSB7CiAJLmluaXRfY21kcyA9IGJvZV9pbml0X2NtZCwKIH07CiAKK3N0YXRpYyBjb25zdCBz
dHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBhdW9fYjEwMXVhbjA4XzNfZGVmYXVsdF9tb2RlID0gewor
CS5jbG9jayA9IDE1OTY2NywKKwkuaGRpc3BsYXkgPSAxMjAwLAorCS5oc3luY19zdGFydCA9IDEy
MDAgKyA2MCwKKwkuaHN5bmNfZW5kID0gMTIwMCArIDYwICsgNCwKKwkuaHRvdGFsID0gMTIwMCAr
IDYwICsgNCArIDgwLAorCS52ZGlzcGxheSA9IDE5MjAsCisJLnZzeW5jX3N0YXJ0ID0gMTkyMCAr
IDM0LAorCS52c3luY19lbmQgPSAxOTIwICsgMzQgKyAyLAorCS52dG90YWwgPSAxOTIwICsgMzQg
KyAyICsgMjQsCisJLnZyZWZyZXNoID0gNjAsCisJLnR5cGUgPSBEUk1fTU9ERV9UWVBFX0RSSVZF
UiB8IERSTV9NT0RFX1RZUEVfUFJFRkVSUkVELAorfTsKKworc3RhdGljIGNvbnN0IHN0cnVjdCBw
YW5lbF9kZXNjIGF1b19iMTAxdWFuMDhfM19kZXNjID0geworCS5tb2RlcyA9ICZhdW9fYjEwMXVh
bjA4XzNfZGVmYXVsdF9tb2RlLAorCS5icGMgPSA4LAorCS5zaXplID0geworCQkud2lkdGhfbW0g
PSAxMzUsCisJCS5oZWlnaHRfbW0gPSAyMTYsCisJfSwKKwkubGFuZXMgPSA0LAorCS5mb3JtYXQg
PSBNSVBJX0RTSV9GTVRfUkdCODg4LAorCS5tb2RlX2ZsYWdzID0gTUlQSV9EU0lfTU9ERV9WSURF
TyB8IE1JUElfRFNJX01PREVfVklERU9fU1lOQ19QVUxTRSB8CisJCSAgICAgIE1JUElfRFNJX01P
REVfTFBNLAorCS5pbml0X2NtZHMgPSBhdW9fYjEwMXVhbjA4XzNfaW5pdF9jbWQsCit9OworCiBz
dGF0aWMgaW50IGJvZV9wYW5lbF9nZXRfbW9kZXMoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpCiB7
CiAJc3RydWN0IGJvZV9wYW5lbCAqYm9lID0gdG9fYm9lX3BhbmVsKHBhbmVsKTsKQEAgLTc4Miw2
ICs4NTcsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBib2Vfb2ZfbWF0Y2hb
XSA9IHsKIAl7IC5jb21wYXRpYmxlID0gImJvZSx0djEwMXd1bS1uNTMiLAogCSAgLmRhdGEgPSAm
Ym9lX3R2MTAxd3VtX241M19kZXNjCiAJfSwKKwl7IC5jb21wYXRpYmxlID0gImF1byxiMTAxdWFu
MDguMyIsCisJICAuZGF0YSA9ICZhdW9fYjEwMXVhbjA4XzNfZGVzYworCX0sCiAJeyAvKiBzZW50
aW5lbCAqLyB9CiB9OwogTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgYm9lX29mX21hdGNoKTsKLS0g
CjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
