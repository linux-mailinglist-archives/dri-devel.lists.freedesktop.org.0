Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0872C14F
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 10:29:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4EBB89DEC;
	Tue, 28 May 2019 08:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDADF89DBF
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 08:29:07 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4S8T30n036873;
 Tue, 28 May 2019 03:29:03 -0500
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4S8T32w083489
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 May 2019 03:29:03 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 28
 May 2019 03:29:03 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 28 May 2019 03:29:03 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4S8Rxus125039;
 Tue, 28 May 2019 03:29:00 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Lucas Stach
 <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Andrey Smirnov
 <andrew.smirnov@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Jyri
 Sarha <jsarha@ti.com>, Benoit Parrot <bparrot@ti.com>
Subject: [PATCHv4 24/24] dt-bindings: tc358767: add HPD support
Date: Tue, 28 May 2019 11:27:47 +0300
Message-ID: <20190528082747.3631-25-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528082747.3631-1-tomi.valkeinen@ti.com>
References: <20190528082747.3631-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1559032143;
 bh=ie89C1JN/2hoK4jNI1tfsDdl8ZlnIPT+HjtwaWZJjJ8=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=S4VTC7jKRDuVDofCOLuH14uvPZd1MRyBcQw853PBQWRShGgRDRqbb+ANLHKhO8m1u
 /3iAsnhZOcF96JoOdjUXIk+JfgHYDuUTYPiXgnL4mpa4LxZXztxRpNYJy2vSW0swQF
 pJOBm70kR5tKOuDlfYezTdPz7w4R46u/UmZ21lcA=
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
Cc: devicetree@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIERUIHByb3BlcnR5IGZvciBkZWZpbmluZyB0aGUgcGluIHVzZWQgZm9yIEhQRC4KClNpZ25l
ZC1vZmYtYnk6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+CkNjOiBkZXZp
Y2V0cmVlQHZnZXIua2VybmVsLm9yZwpDYzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4K
UmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Ci0tLQogLi4uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvdG9zaGliYSx0YzM1ODc2Ny50eHQgICAgICB8
IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3Rvc2hpYmEsdGMzNTg3
NjcudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdl
L3Rvc2hpYmEsdGMzNTg3NjcudHh0CmluZGV4IGUzZjZhYTZhMjE0ZC4uNTgzYzVlOWRiZTZiIDEw
MDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlk
Z2UvdG9zaGliYSx0YzM1ODc2Ny50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3Rvc2hpYmEsdGMzNTg3NjcudHh0CkBAIC0xMiw2ICsxMiw3
IEBAIE9wdGlvbmFsIHByb3BlcnRpZXM6CiAgICAgICAgICAgICAgICAgICAgKGFjdGl2ZSBoaWdo
IHNodXRkb3duIGlucHV0KQogIC0gcmVzZXQtZ3Bpb3M6IE9GIGRldmljZS10cmVlIGdwaW8gc3Bl
Y2lmaWNhdGlvbiBmb3IgUlNUWCBwaW4KICAgICAgICAgICAgICAgICAoYWN0aXZlIGxvdyBzeXN0
ZW0gcmVzZXQpCisgLSB0b3NoaWJhLGhwZC1waW46IFRDMzU4NzY3IEdQSU8gcGluIG51bWJlciB0
byB3aGljaCBIUEQgaXMgY29ubmVjdGVkIHRvICgwIG9yIDEpCiAgLSBwb3J0czogdGhlIHBvcnRz
IG5vZGUgY2FuIGNvbnRhaW4gdmlkZW8gaW50ZXJmYWNlIHBvcnQgbm9kZXMgdG8gY29ubmVjdAog
ICAgdG8gYSBEUEkvRFNJIHNvdXJjZSBhbmQgdG8gYW4gZURQL0RQIHNpbmsgYWNjb3JkaW5nIHRv
IFsxXVsyXToKICAgICAtIHBvcnRAMDogRFNJIGlucHV0IHBvcnQKLS0gClRleGFzIEluc3RydW1l
bnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51
cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
