Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C9F566ED
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 12:38:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 871226E37C;
	Wed, 26 Jun 2019 10:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 103FC6E377
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 10:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 9F0B2FB06;
 Wed, 26 Jun 2019 12:37:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wWQJtkj0v59K; Wed, 26 Jun 2019 12:37:53 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 9CEEE48EB1; Wed, 26 Jun 2019 12:37:51 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 "Paul E. McKenney" <paulmck@linux.ibm.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Purism Kernel Team <kernel@puri.sm>
Subject: [PATCH v2 3/4] dt-bindings: display/panel: jh057n00900: Document
 power supply properties
Date: Wed, 26 Jun 2019 12:37:50 +0200
Message-Id: <ec5ee11786036dc8826a3f8555cbb1dce4dbca25.1561542477.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1561542477.git.agx@sigxcpu.org>
References: <cover.1561542477.git.agx@sigxcpu.org>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG9jdW1lbnQgdGhlIHZjYy1zdXBwbHkgYW5kIGlvdmNjLXN1cHBseSBwcm9wZXJ0aWVzIG9mIHRo
ZSBSb2NrdGVjaApqaDA1N24wMDkwMCBwYW5lbC4KClNpZ25lZC1vZmYtYnk6IEd1aWRvIEfDvG50
aGVyIDxhZ3hAc2lneGNwdS5vcmc+ClJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZu
Ym9yZy5vcmc+Ci0tLQogLi4uL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcm9ja3RlY2gsamgwNTdu
MDA5MDAudHh0ICAgICAgICAgIHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L3BhbmVsL3JvY2t0ZWNoLGpoMDU3bjAwOTAwLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3JvY2t0ZWNoLGpoMDU3bjAwOTAwLnR4dAppbmRl
eCAxYjU3NjMyMDBjZjYuLmEzNzJjNWQ4NDY5NSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcm9ja3RlY2gsamgwNTduMDA5MDAudHh0
CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3Jv
Y2t0ZWNoLGpoMDU3bjAwOTAwLnR4dApAQCAtNSw2ICs1LDkgQEAgUmVxdWlyZWQgcHJvcGVydGll
czoKIC0gcmVnOiBEU0kgdmlydHVhbCBjaGFubmVsIG9mIHRoZSBwZXJpcGhlcmFsCiAtIHJlc2V0
LWdwaW9zOiBwYW5lbCByZXNldCBncGlvCiAtIGJhY2tsaWdodDogcGhhbmRsZSBvZiB0aGUgYmFj
a2xpZ2h0IGRldmljZSBhdHRhY2hlZCB0byB0aGUgcGFuZWwKKy0gdmNjLXN1cHBseTogcGhhbmRs
ZSBvZiB0aGUgcmVndWxhdG9yIHRoYXQgcHJvdmlkZXMgdGhlIHZjYyBzdXBwbHkgdm9sdGFnZS4K
Ky0gaW92Y2Mtc3VwcGx5OiBwaGFuZGxlIG9mIHRoZSByZWd1bGF0b3IgdGhhdCBwcm92aWRlcyB0
aGUgaW92Y2Mgc3VwcGx5CisgIHZvbHRhZ2UuCiAKIEV4YW1wbGU6CiAKQEAgLTE0LDUgKzE3LDcg
QEAgRXhhbXBsZToKIAkJCXJlZyA9IDwwPjsKIAkJCWJhY2tsaWdodCA9IDwmYmFja2xpZ2h0PjsK
IAkJCXJlc2V0LWdwaW9zID0gPCZncGlvMyAxMyBHUElPX0FDVElWRV9MT1c+OworCQkJdmNjLXN1
cHBseSA9IDwmcmVnXzJ2OF9wPjsKKwkJCWlvdmNjLXN1cHBseSA9IDwmcmVnXzF2OF9wPjsKIAkJ
fTsKIAl9OwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
