Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A19DEC1F3A
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 12:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691966E247;
	Mon, 30 Sep 2019 10:38:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F8A36E247
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 10:38:52 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8UAcmlA100884;
 Mon, 30 Sep 2019 05:38:48 -0500
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8UAcmDF038301
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 30 Sep 2019 05:38:48 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 30
 Sep 2019 05:38:48 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 30 Sep 2019 05:38:39 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UAck1u011864;
 Mon, 30 Sep 2019 05:38:47 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Subject: [PATCHv2 0/7] drm/omap: misc improvements
Date: Mon, 30 Sep 2019 13:38:33 +0300
Message-ID: <20190930103840.18970-1-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1569839928;
 bh=xZT43RdNQR8Fo1u3mlF6VHceKl536LDFkLx46SkLseU=;
 h=From:To:CC:Subject:Date;
 b=MATh9pZ4+a2Nl3fNboDgWVHATLcS+Y6P/OoOsrlgJ3Qg3bLS9bVBYe48HePEr77E/
 LlVvNcn+N4HtfXo0IOaus11YmdgLPP7O5PSX2AqRd72pHRB6fqV0YNL7Yb6jcWdgil
 pMbktKxj/3vBthc3iPhA2GLt9YNg6GfmtsHD0u70=
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

SGksCgpUaGlzIGlzIHYyIG9mIHRoZSBzZXJpZXMuIENoYW5nZXMgY29tcGFyZWQgdG8gdjE6CgpE
cm9wcGVkIChKeXJpIHdpbGwgd29yayBvbiB0aGVtKToKIC0gZHJtL29tYXA6IEltcGxlbWVudCBD
VE0gcHJvcGVydHkgZm9yIENSVEMgdXNpbmcgT1ZMIG1hbmFnZXJzIENQUiBtYXRyaXgKIC0gZHJt
L29tYXA6IEVuYWJsZSBDT0xPUl9FTkNPRElORyBhbmQgQ09MT1JfUkFOR0UgcHJvcGVydGllcyBm
b3IgcGxhbmVzCgpBZGRlZDoKIC0gZHJtL29tYXA6IGF2b2lkIGNvcHkgaW4gbWdyX2ZsZF9yZWFk
L3dyaXRlCiAtIGRybS9vbWFwOiBoZG1pNDogZml4IHVzZSBvZiB1bmluaXRpYWxpemVkIHZhcgoK
Rml4ZWQgdGhlIGlzc3VlcyBwb2ludGVkIG91dCBieSBMYXVyZW50LgoKIFRvbWkKCkFsZWphbmRy
byBIZXJuYW5kZXogKDEpOgogIGRybS9vbWFwOiB0d2VhayBIRE1JIEREQyB0aW1pbmdzCgpKeXJp
IFNhcmhhICgxKToKICBkcm0vb21hcDogZHNzOiBtb3ZlIHBsYXRmb3JtX3JlZ2lzdGVyX2RyaXZl
cnMoKSB0byBkc3MuYyBhbmQgcmVtb3ZlCiAgICBjb3JlLmMKClRvbWkgVmFsa2VpbmVuICg1KToK
ICBkcm0vb21hcDogZHJvcCB1bm5lZWRlZCBsb2NraW5nIGZyb20gbWdyX2ZsZF93cml0ZSgpCiAg
ZHJtL29tYXA6IGF2b2lkIGNvcHkgaW4gbWdyX2ZsZF9yZWFkL3dyaXRlCiAgZHJtL29tYXA6IGZp
eCBtaXNzaW5nIHNjYWxlciBwaXhlbCBmbXQgbGltaXRhdGlvbnMKICBkcm0vb21hcDogaGRtaTU6
IGF1dG9tYXRpY2FsbHkgY2hvb3NlIGxpbWl0ZWQvZnVsbCByYW5nZSBvdXRwdXQKICBkcm0vb21h
cDogaGRtaTQ6IGZpeCB1c2Ugb2YgdW5pbml0aWFsaXplZCB2YXIKCiBkcml2ZXJzL2dwdS9kcm0v
b21hcGRybS9kc3MvTWFrZWZpbGUgICAgIHwgICAyICstCiBkcml2ZXJzL2dwdS9kcm0vb21hcGRy
bS9kc3MvY29yZS5jICAgICAgIHwgIDU1IC0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9vbWFw
ZHJtL2Rzcy9kaXNwYy5jICAgICAgfCAgNDYgKysrKysrLS0tCiBkcml2ZXJzL2dwdS9kcm0vb21h
cGRybS9kc3MvZHNzLmMgICAgICAgIHwgIDM3ICsrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9vbWFw
ZHJtL2Rzcy9oZG1pNF9jb3JlLmMgfCAgIDUgKy0KIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rz
cy9oZG1pNV9jb3JlLmMgfCAxMjUgKysrKysrKysrKysrLS0tLS0tLS0tLS0KIDYgZmlsZXMgY2hh
bmdlZCwgMTM3IGluc2VydGlvbnMoKyksIDEzMyBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvY29yZS5jCgotLSAKVGV4YXMgSW5zdHJ1
bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVu
bnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtp
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
