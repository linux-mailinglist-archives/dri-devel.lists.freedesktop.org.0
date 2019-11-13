Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CA5FC128
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 09:08:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E32AC6E2E3;
	Thu, 14 Nov 2019 08:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5D9266ED6B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 15:57:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,300,1569250800"; d="scan'208";a="31380916"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 14 Nov 2019 00:52:36 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id B808A400EE6B;
 Thu, 14 Nov 2019 00:52:31 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v4 11/13] ARM: shmobile_defconfig: Enable support for panels
 from EDT
Date: Wed, 13 Nov 2019 15:51:30 +0000
Message-Id: <1573660292-10629-12-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailman-Approved-At: Thu, 14 Nov 2019 08:07:50 +0000
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Simon Horman <horms@verge.net.au>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Peter Rosin <peda@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGl3ZzIwZCBjb21lcyB3aXRoIGFuIExDRCBwYW5lbCBmcm9tIEVtZXJnaW5nIERpc3BsYXkK
VGVjaG5vbG9naWVzIENvcnBvcmF0aW9uIChFRFQpLCB0aGVyZWZvcmUgZW5hYmxlIHdoYXQncwpy
ZXF1aXJlZCB0byBzdXBwb3J0IGl0LgoKU2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxm
YWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+CgotLS0KdjMtPnY0OgoqIE5vIGNoYW5nZQp2
Mi0+djM6CiogTm8gY2hhbmdlCnYxLT52MjoKKiBObyBjaGFuZ2UKLS0tCiBhcmNoL2FybS9jb25m
aWdzL3NobW9iaWxlX2RlZmNvbmZpZyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vY29uZmlncy9zaG1vYmlsZV9kZWZjb25maWcg
Yi9hcmNoL2FybS9jb25maWdzL3NobW9iaWxlX2RlZmNvbmZpZwppbmRleCBjNmM3MDM1Li5hYjQx
NmE1IDEwMDY0NAotLS0gYS9hcmNoL2FybS9jb25maWdzL3NobW9iaWxlX2RlZmNvbmZpZworKysg
Yi9hcmNoL2FybS9jb25maWdzL3NobW9iaWxlX2RlZmNvbmZpZwpAQCAtNjYsNiArNjYsNyBAQCBD
T05GSUdfSU5QVVRfRVZERVY9eQogQ09ORklHX0tFWUJPQVJEX0dQSU89eQogIyBDT05GSUdfSU5Q
VVRfTU9VU0UgaXMgbm90IHNldAogQ09ORklHX0lOUFVUX1RPVUNIU0NSRUVOPXkKK0NPTkZJR19U
T1VDSFNDUkVFTl9FRFRfRlQ1WDA2PXkKIENPTkZJR19UT1VDSFNDUkVFTl9TVDEyMzI9eQogQ09O
RklHX0lOUFVUX01JU0M9eQogQ09ORklHX0lOUFVUX0FEWEwzNFg9eQpAQCAtMTI1LDcgKzEyNiw5
IEBAIENPTkZJR19WSURFT19BRFY3NjA0PXkKIENPTkZJR19WSURFT19NTDg2Vjc2Njc9eQogQ09O
RklHX0RSTT15CiBDT05GSUdfRFJNX1JDQVJfRFU9eQorQ09ORklHX0RSTV9QQU5FTF9TSU1QTEU9
eQogQ09ORklHX0RSTV9EVU1CX1ZHQV9EQUM9eQorQ09ORklHX0RSTV9MVkRTX0NPREVDPXkKIENP
TkZJR19EUk1fU0lJOTAyWD15CiBDT05GSUdfRFJNX0kyQ19BRFY3NTExPXkKIENPTkZJR19EUk1f
STJDX0FEVjc1MTFfQVVESU89eQotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
