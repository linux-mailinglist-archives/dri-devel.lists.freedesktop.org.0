Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5600655F33
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 04:54:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 243AD8845B;
	Wed, 26 Jun 2019 02:54:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id CA84C6E207
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 02:54:13 +0000 (UTC)
X-UUID: 91b24f43722d466ebd4250b00f9cf19f-20190626
X-UUID: 91b24f43722d466ebd4250b00f9cf19f-20190626
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1962422911; Wed, 26 Jun 2019 10:54:08 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 26 Jun 2019 10:54:05 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Wed, 26 Jun 2019 10:54:02 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, "Mark
 Rutland" <mark.rutland@arm.com>, Ian Campbell
 <ijc+devicetree@hellion.org.uk>, <linux-pwm@vger.kernel.org>, David Airlie
 <airlied@linux.ie>, "Matthias Brugger" <matthias.bgg@gmail.com>
Subject: [v3 0/4] Add drivers for auo, kd101n80-45na and boe,
 tv101wum-nl6 panels
Date: Wed, 26 Jun 2019 10:53:56 +0800
Message-ID: <20190626025400.109567-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1684-8.5.1010-24712.003
X-TM-AS-Result: No-4.859500-8.000000-10
X-TMASE-MatchedRID: JnF/j4RbQ0Fu7xCoxCPC8hIRh9wkXSlFSWg+u4ir2NNTbQ95zRbWVhxC
 hMoIsTT1MqqNAwlLCF39K011C4bEh/I1YbpS1+av5venhychcY1MkOX0UoduuWq646qiEnRzcDY
 BtqUkx7xsyJ8A0M3MsXATsg8MODVIHxPMjOKY7A8LbigRnpKlKZx+7GyJjhAUUFn54I1MIrlC6E
 qbEQibuD9Tqrncq1QsXNx4nPRgrzTasMMyBIaxyKGPwUaNZCakygr2f8iu4/h3q397Kle3JbVW6
 8qWjN+ZP3dLjnWr1vEPbJpLSCH/cqQVCHnxhZ/op8zfhMu4/LNfCOKFKuVYGg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.859500-8.000000
X-TMASE-Version: SMEX-12.5.0.1684-8.5.1010-24712.003
X-TM-SNTS-SMTP: 4C1F9099359D9BA0D664A342062213656D6B4A1AA8DA41A10CE1E24C40B910DF2000:8
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

Q2hhbmdlcyBzaW5jZSB2MjoKIC0gY29ycmVjdCB0aGUgcGFuZWwgc2l6ZQogLSByZW1vdmUgYmxh
bmsgbGluZSBpbiBLY29uZmlnCiAtIG1vdmUgYXVvLGtkMTAxbjgwLTQ1bmEgcGFuZWwgZHJpdmVy
IGluIHRoaXMgc2VyaWVzLgoKQ2hhbmdlcyBzaW5jZSB2MToKCiAtIHVwZGF0ZSB0eXBvIG5sNiAt
PiBuMTYuCiAtIHVwZGF0ZSBuZXcgcGFuZWwgY29uZmlnIGFuZCBtYWtlZmlsZSBhcmUgYWRkZWQg
aW4gYWxwaGFiZXRpY2FsbHkgb3JkZXIuCiAtIGFkZCB0aGUgcGFuZWwgbW9kZSBhbmQgcGFuZWwg
aW5mbyBpbiBkcml2ZXIgZGF0YS4KIC0gbWVyZ2UgYXVvLGtkMTAxbjgwLTQ1YSBhbmQgYm9lLHR2
MTAxd3VtLW5sNiBpbiBvbmUgZHJpdmVyCgpKaXRhbyBTaGkgKDQpOgogIGR0LWJpbmRuZ3M6IGRp
c3BsYXk6IHBhbmVsOiBBZGQgQk9FIHR2MTAxd3VtLW4xNiBwYW5lbCBiaW5kaW5ncwogIGRybS9w
YW5lbDogc3VwcG9ydCBmb3IgQk9FIHR2MTAxd3VtLW5sNiB3dXhnYSBkc2kgdmlkZW8gbW9kZSBw
YW5lbAogIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBwYW5lbDogYWRkIGF1byBrZDEwMW44MC00NW5h
IHBhbmVsIGJpbmRpbmdzCiAgZHJtL3BhbmVsOiBzdXBwb3J0IGZvciBhdW8sa2QxMDFuODAtNDVu
YSB3dXhnYSBkc2kgdmlkZW8gbW9kZSBwYW5lbAoKIC4uLi9kaXNwbGF5L3BhbmVsL2F1byxrZDEw
MW44MC00NW5hLnR4dCAgICAgICB8ICAzNCArCiAuLi4vZGlzcGxheS9wYW5lbC9ib2UsdHYxMDF3
dW0tbmw2LnR4dCAgICAgICAgfCAgMzQgKwogZHJpdmVycy9ncHUvZHJtL3BhbmVsL0tjb25maWcg
ICAgICAgICAgICAgICAgIHwgICA5ICsKIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9NYWtlZmlsZSAg
ICAgICAgICAgICAgICB8ICAgMSArCiAuLi4vZ3B1L2RybS9wYW5lbC9wYW5lbC1ib2UtdHYxMDF3
dW0tbmw2LmMgICAgfCA3NTMgKysrKysrKysrKysrKysrKysrCiA1IGZpbGVzIGNoYW5nZWQsIDgz
MSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYXVvLGtkMTAxbjgwLTQ1bmEudHh0CiBjcmVhdGUg
bW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFu
ZWwvYm9lLHR2MTAxd3VtLW5sNi50eHQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9k
cm0vcGFuZWwvcGFuZWwtYm9lLXR2MTAxd3VtLW5sNi5jCgotLSAKMi4yMS4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
