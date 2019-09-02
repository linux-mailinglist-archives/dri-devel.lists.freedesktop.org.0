Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88764A56B9
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 14:54:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C736E89070;
	Mon,  2 Sep 2019 12:54:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 330D989070
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 12:54:41 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x82CsbSV021043;
 Mon, 2 Sep 2019 07:54:37 -0500
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x82Csbjo088697
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 2 Sep 2019 07:54:37 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 2 Sep
 2019 07:54:36 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 2 Sep 2019 07:54:36 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x82CsYYI126767;
 Mon, 2 Sep 2019 07:54:35 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 0/7] drm/omap: misc improvements
Date: Mon, 2 Sep 2019 15:53:52 +0300
Message-ID: <20190902125359.18001-1-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1567428877;
 bh=8RH5aWjAGfhf3PzwMOR4ob57fChJsx9YE9v8g8DpE2Q=;
 h=From:To:CC:Subject:Date;
 b=roNHDhXb3+MqS+4zMG2DuPLKBZ6nG5o6j0Rh7+18GHXwBbi9VcPA2zSOXNy8X5zSi
 cz+D2LcjCZAZeJvUacfI9ZEAcbXTDRlEB7NNZpVM9lUA1T6I4+DW9syjuOJCFMZqhg
 BK02llyVYJTchLPY3LgHwIrmuHE1RpiWZ2MGJa7s=
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpNaXNjIGltcHJvdmVtZW50cyB0byBvbWFwZHJtIHdoaWNoIGhhdmUgYmVlbiBseWluZyBh
cm91bmQgZm9yIGEgbG9uZwp0aW1lLCBhbmQgSSd2ZSBtaXNzZWQgdXBzdHJlYW1pbmcgdGhlbS4K
CkFuZCBvbmUgbmV3IG9uZSwgd2hpY2ggbWFrZXMgdGhlIERTUzUgSERNSSBwaWNrIHVwIHRoZSBj
b2xvciByYW5nZQphdXRvbWF0aWNhbGx5LgoKIFRvbWkKCkFsZWphbmRybyBIZXJuYW5kZXogKDEp
OgogIGRybS9vbWFwOiB0d2VhayBIRE1JIEREQyB0aW1pbmdzCgpKeXJpIFNhcmhhICgzKToKICBk
cm0vb21hcDogSW1wbGVtZW50IENUTSBwcm9wZXJ0eSBmb3IgQ1JUQyB1c2luZyBPVkwgbWFuYWdl
cnMgQ1BSCiAgICBtYXRyaXgKICBkcm0vb21hcDogRW5hYmxlIENPTE9SX0VOQ09ESU5HIGFuZCBD
T0xPUl9SQU5HRSBwcm9wZXJ0aWVzIGZvciBwbGFuZXMKICBkcm0vb21hcDogZHNzOiBwbGF0Zm9y
bV9yZWdpc3Rlcl9kcml2ZXJzKCkgdG8gZHNzLmMgYW5kIHJlbW92ZSBjb3JlLmMKClRvbWkgVmFs
a2VpbmVuICgzKToKICBkcm0vb21hcDogZHJvcCB1bm5lZWRlZCBsb2NraW5nIGZyb20gbWdyX2Zs
ZF93cml0ZSgpCiAgZHJtL29tYXA6IGZpeCBtaXNzaW5nIHNjYWxlciBwaXhlbCBmbXQgbGltaXRh
dGlvbnMKICBkcm0vb21hcDogaGRtaTU6IGF1dG9tYXRpY2FsbHkgY2hvb3NlIGxpbWl0ZWQvZnVs
bCByYW5nZSBvdXRwdXQKCiBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvTWFrZWZpbGUgICAg
IHwgICAyICstCiBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvY29yZS5jICAgICAgIHwgIDU1
IC0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvZGlzcGMuYyAgICAgIHwgMTYw
ICsrKysrKysrKysrKysrKysrLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvZHNz
LmMgICAgICAgIHwgIDM3ICsrKysrKwogZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2hkbWk1
X2NvcmUuYyB8IDEyNSArKysrKysrKysrLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJt
L2Rzcy9vbWFwZHNzLmggICAgfCAgIDQgKwogZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9j
cnRjLmMgICAgICB8ICAzOSArKysrKy0KIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfcGxh
bmUuYyAgICAgfCAgMzAgKysrKysKIDggZmlsZXMgY2hhbmdlZCwgMjk1IGluc2VydGlvbnMoKyks
IDE1NyBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vb21h
cGRybS9kc3MvY29yZS5jCgotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2th
bGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIx
LTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
