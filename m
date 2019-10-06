Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9B7CDC12
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 09:02:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E38666E45F;
	Mon,  7 Oct 2019 07:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from balrog.mythic-beasts.com (balrog.mythic-beasts.com
 [IPv6:2a00:1098:0:82:1000:0:2:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3381E6E400
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2019 16:04:16 +0000 (UTC)
Received: from [199.195.250.187] (port=38197 helo=hermes.aosc.io)
 by balrog.mythic-beasts.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92.3)
 (envelope-from <icenowy@aosc.io>)
 id 1iH912-0004ET-8f; Sun, 06 Oct 2019 17:04:12 +0100
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender:
 icenowy@aosc.io)
 by hermes.aosc.io (Postfix) with ESMTPSA id B0BE18289D;
 Sun,  6 Oct 2019 16:04:06 +0000 (UTC)
From: Icenowy Zheng <icenowy@aosc.io>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jagan Teki <jagan@amarulasolutions.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 0/3] drm/sun4i: dsi: misc fixes
Date: Mon,  7 Oct 2019 00:02:59 +0800
Message-Id: <20191006160303.24413-1-icenowy@aosc.io>
MIME-Version: 1.0
X-BlackCat-Spam-Score: 50
X-Spam-Status: No, score=5.0
X-Mailman-Approved-At: Mon, 07 Oct 2019 07:01:51 +0000
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
Cc: linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.io>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaHNldCBjb250YWlucyBzZXZlcmFsIGZpeGVzIHRvIHRoZSBzdW42aV9taXBpX2Rz
aSBkcml2ZXIuCgpGaXJzdCwgaXQncyBhIHJlYmFzZWQgdmVyc2lvbiBvZiB2aWRlbyBzdGFydCBk
ZWxheSBwb3JjaCBmaXggZnJvbSBKYWdhbgpUZWtpLgoKVGhlIG5leHQgcGF0Y2ggZml4ZXMgdGhl
IG92ZXJoZWFkIG9mIEhGUCBwYWNrZXQsIGFjY29yZGluZyB0byB0aGUgc291cmNlCmNvZGUgb2Yg
QlNQIFsxXS4KClRoZSBmaW5hbCBwYXRjaCBmaXhlcyBEQ1MgbG9uZyB3cml0ZSwgd2hpY2ggZml4
ZXMgaW5pdGlhbGl6YXRpb24gaXNzdWUKd2l0aCBhIHBhbmVsIHdpdGggU1Q3NzAzIGNvbnRyb2xs
ZXIgKFhCRDU5OSBwYW5lbCB1c2VkIGJ5IFBpbmVQaG9uZSkuClRoaXMgc2VlbXMgdG8gYmUgYSBt
aXNyZWFkIG9mIFsyXS4gKFRoZSBmb3JtdWxhIGluIFsyXSBpcyBwYXJhX251bSsxLAphbmQgdGhl
IGNvZGUgb2YgdGhlIHN1bjZpX21pcGlfZHNpIGRyaXZlciB1c2VzIHR4X2xlbiwgd2hpY2ggaXMg
dGhlCmxlbmd0aCBpbmNsdWRpbmcgdGhlIGNvbW1hbmQ7IHRodXMgdHhfbGVuIGlzIGVxdWFsIHRv
IHBhcmFfbnVtKzEsIHNvIGl0CnNob3VsZG4ndCBiZSBhZGRlZCB3aXRoIDEgZm9yIGFub3RoZXIg
dGltZS4pCgpJY2Vub3d5IFpoZW5nICgyKToKICBkcm0vc3VuNGk6IGRzaTogZml4IHRoZSBvdmVy
aGVhZCBvZiB0aGUgaG9yaXpvbnRhbCBmcm9udCBwb3JjaAogIGRybS9zdW40aTogc3VuNmlfbWlw
aV9kc2k6IGZpeCBEQ1MgbG9uZyB3cml0ZSBwYWNrZXQgbGVuZ3RoCgpKYWdhbiBUZWtpICgxKToK
ICBkcm0vc3VuNGk6IGRzaTogRml4IHZpZGVvIHN0YXJ0IGRlbGF5IGNvbXB1dGF0aW9uCgpbMV0g
aHR0cHM6Ly9naXRodWIuY29tL2F5dWZhbi1waW5lNjQvbGludXgtcGluZTY0L2Jsb2IvbXktaGFj
a3MtMS4yLXdpdGgtZHJtL2RyaXZlcnMvdmlkZW8vc3VueGkvZGlzcDIvZGlzcC9kZS9sb3dsZXZl
bF9zdW41MGl3MS9kZV9kc2kuYyNMOTIwCgpbMl0gaHR0cHM6Ly9naXRodWIuY29tL2F5dWZhbi1w
aW5lNjQvbGludXgtcGluZTY0L2Jsb2IvbXktaGFja3MtMS4yLXdpdGgtZHJtL2RyaXZlcnMvdmlk
ZW8vc3VueGkvZGlzcDIvZGlzcC9kZS9sb3dsZXZlbF9zdW41MGl3MS9kZV9kc2kuYyNMMjI3Cgog
ZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmMgfCAxNSArKysrKysrKy0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgotLSAK
Mi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
