Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF296FC2C8
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 10:40:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C22026E158;
	Thu, 14 Nov 2019 09:40:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90FF06E155
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 09:40:08 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAE9e3dj060084;
 Thu, 14 Nov 2019 03:40:03 -0600
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAE9e2XD035592
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 14 Nov 2019 03:40:03 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 14
 Nov 2019 03:40:02 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 14 Nov 2019 03:40:02 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAE9dtjp085959;
 Thu, 14 Nov 2019 03:40:00 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>, Thierry
 Reding <thierry.reding@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 2/3] ARM: dts: am437x-gp/epos-evm: drop unused panel timings
Date: Thu, 14 Nov 2019 11:39:49 +0200
Message-ID: <20191114093950.4101-3-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191114093950.4101-1-tomi.valkeinen@ti.com>
References: <20191114093950.4101-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1573724403;
 bh=J6WQnf08jE29+k+Z+wJAETstTtd+Nns4dCt3g2mlorQ=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=ZgDFJ/1FAIgtMzS2ZkkBB7p7Jgt3v9Zi7UxXT1n8awaNOoR4mVwQyGsGxu1A7NOPR
 T10TvQrJNXQiOtUuCRLCN78Drs/2GLyePdmlKZuau89wEN8ZNwTvRn0O/zy53RQ0mT
 FkFFuaH0WB1M4raYRUDgrFDxSqPMqW1XgUbCGl8I=
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
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cGFuZWwtc2ltcGxlIG5vdyBoYW5kbGVkIHBhbmVsIG9zZDA3MHQxNzE4LTE5dHMsIGFuZCB3ZSBu
byBsb25nZXIgbmVlZAp0aGUgcGFuZWwgdGltaW5ncyBpbiB0aGUgRFQgZmlsZS4gU28gcmVtb3Zl
IHRoZW0uCgpTaWduZWQtb2ZmLWJ5OiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGku
Y29tPgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL2FtNDM3eC1ncC1ldm0uZHRzICB8IDE2IC0tLS0t
LS0tLS0tLS0tLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL2FtNDN4LWVwb3MtZXZtLmR0cyB8IDE2IC0t
LS0tLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMzIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvYW00Mzd4LWdwLWV2bS5kdHMgYi9hcmNoL2FybS9ib290
L2R0cy9hbTQzN3gtZ3AtZXZtLmR0cwppbmRleCA4MTFjOGNhZTMxNWIuLjA0MDQwMzA0OWNlYSAx
MDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvYW00Mzd4LWdwLWV2bS5kdHMKKysrIGIvYXJj
aC9hcm0vYm9vdC9kdHMvYW00Mzd4LWdwLWV2bS5kdHMKQEAgLTkxLDIyICs5MSw2IEBACiAKIAkJ
YmFja2xpZ2h0ID0gPCZsY2RfYmw+OwogCi0JCXBhbmVsLXRpbWluZyB7Ci0JCQljbG9jay1mcmVx
dWVuY3kgPSA8MzMwMDAwMDA+OwotCQkJaGFjdGl2ZSA9IDw4MDA+OwotCQkJdmFjdGl2ZSA9IDw0
ODA+OwotCQkJaGZyb250LXBvcmNoID0gPDIxMD47Ci0JCQloYmFjay1wb3JjaCA9IDwxNj47Ci0J
CQloc3luYy1sZW4gPSA8MzA+OwotCQkJdmJhY2stcG9yY2ggPSA8MTA+OwotCQkJdmZyb250LXBv
cmNoID0gPDIyPjsKLQkJCXZzeW5jLWxlbiA9IDwxMz47Ci0JCQloc3luYy1hY3RpdmUgPSA8MD47
Ci0JCQl2c3luYy1hY3RpdmUgPSA8MD47Ci0JCQlkZS1hY3RpdmUgPSA8MT47Ci0JCQlwaXhlbGNs
ay1hY3RpdmUgPSA8MT47Ci0JCX07Ci0KIAkJcG9ydCB7CiAJCQlsY2RfaW46IGVuZHBvaW50IHsK
IAkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JmRwaV9vdXQ+OwpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0v
Ym9vdC9kdHMvYW00M3gtZXBvcy1ldm0uZHRzIGIvYXJjaC9hcm0vYm9vdC9kdHMvYW00M3gtZXBv
cy1ldm0uZHRzCmluZGV4IDA3OGNiNDczZmE3ZC4uMzMwZmNlMDYwZThiIDEwMDY0NAotLS0gYS9h
cmNoL2FybS9ib290L2R0cy9hbTQzeC1lcG9zLWV2bS5kdHMKKysrIGIvYXJjaC9hcm0vYm9vdC9k
dHMvYW00M3gtZXBvcy1ldm0uZHRzCkBAIC00NywyMiArNDcsNiBAQAogCiAJCWJhY2tsaWdodCA9
IDwmbGNkX2JsPjsKIAotCQlwYW5lbC10aW1pbmcgewotCQkJY2xvY2stZnJlcXVlbmN5ID0gPDMz
MDAwMDAwPjsKLQkJCWhhY3RpdmUgPSA8ODAwPjsKLQkJCXZhY3RpdmUgPSA8NDgwPjsKLQkJCWhm
cm9udC1wb3JjaCA9IDwyMTA+OwotCQkJaGJhY2stcG9yY2ggPSA8MTY+OwotCQkJaHN5bmMtbGVu
ID0gPDMwPjsKLQkJCXZiYWNrLXBvcmNoID0gPDEwPjsKLQkJCXZmcm9udC1wb3JjaCA9IDwyMj47
Ci0JCQl2c3luYy1sZW4gPSA8MTM+OwotCQkJaHN5bmMtYWN0aXZlID0gPDA+OwotCQkJdnN5bmMt
YWN0aXZlID0gPDA+OwotCQkJZGUtYWN0aXZlID0gPDE+OwotCQkJcGl4ZWxjbGstYWN0aXZlID0g
PDE+OwotCQl9OwotCiAJCXBvcnQgewogCQkJbGNkX2luOiBlbmRwb2ludCB7CiAJCQkJcmVtb3Rl
LWVuZHBvaW50ID0gPCZkcGlfb3V0PjsKLS0gClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ks
IFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJRDog
MDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
