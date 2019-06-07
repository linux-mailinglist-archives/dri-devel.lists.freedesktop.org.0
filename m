Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E15395CE
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 21:35:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F2189B9E;
	Fri,  7 Jun 2019 19:35:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2123789B62
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 19:35:36 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x57JZSrR112098;
 Fri, 7 Jun 2019 14:35:28 -0500
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x57JZRRk090496
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 7 Jun 2019 14:35:27 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 7 Jun
 2019 14:35:27 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 7 Jun 2019 14:35:27 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
 [128.247.22.53])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x57JZR71130539;
 Fri, 7 Jun 2019 14:35:27 -0500
Received: from localhost ([10.250.68.219])
 by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id x57JZPm20290; 
 Fri, 7 Jun 2019 14:35:26 -0500 (CDT)
From: "Andrew F. Davis" <afd@ti.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Will Deacon <will.deacon@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Tero Kristo <t-kristo@ti.com>,
 William Mills <wmills@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, John Stultz
 <john.stultz@linaro.org>
Subject: [RFC PATCH 1/2] dt-bindings: soc: ti: Add TI PAT bindings
Date: Fri, 7 Jun 2019 15:35:22 -0400
Message-ID: <20190607193523.25700-2-afd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190607193523.25700-1-afd@ti.com>
References: <20190607193523.25700-1-afd@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1559936128;
 bh=g/jVvEBoDnB0yS/VyPCCLSyiDgGI0r1pNYFm7Vgh5W4=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=ftUO1GiCyMTWmcL2PBwG2RJapxbBdl7GV8N01lcMV1Q/+PAZhZLqqX8pocF3jvANE
 sLspZHpNTm3zo3S14BbDc7Yjsd2RLarzjjXcfnWwaQdO4wdzMqGMR8GoxYIZIhw21s
 mZTmIen92OIBxpNPM1bFK2qXlLmvs1yTD29cwoBk=
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Andrew F . Davis" <afd@ti.com>,
 linaro-mm-sig@lists.linaro.org, iommu@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBhZGRzIHRoZSBiaW5kaW5ncyBmb3IgdGhlIFBhZ2UtYmFzZWQgQWRkcmVzcyBU
cmFuc2xhdG9yIChQQVQpCnByZXNlbnQgb24gdmFyaW91cyBUSSBTb0NzLiBBIFBhZ2UtYmFzZWQg
QWRkcmVzcyBUcmFuc2xhdG9yIChQQVQpIGRldmljZQpwZXJmb3JtcyBhZGRyZXNzIHRyYW5zbGF0
aW9uIHVzaW5nIHRhYmxlcyBzdG9yZWQgaW4gYW4gaW50ZXJuYWwgU1JBTS4KRWFjaCBQQVQgc3Vw
cG9ydHMgYSBzZXQgbnVtYmVyIG9mIHBhZ2VzLCBlYWNoIG9jY3VweWluZyBhIHByb2dyYW1tYWJs
ZQo0S0IsIDE2S0IsIDY0S0IsIG9yIDFNQiBvZiBhZGRyZXNzZXMgaW4gYSB3aW5kb3cgZm9yIHdo
aWNoIGFuIGluY29taW5nCnRyYW5zYWN0aW9uIHdpbGwgYmUgdHJhbnNsYXRlZC4KClNpZ25lZC1v
ZmYtYnk6IEFuZHJldyBGLiBEYXZpcyA8YWZkQHRpLmNvbT4KLS0tCiAuLi4vZGV2aWNldHJlZS9i
aW5kaW5ncy9taXNjL3RpLHBhdC50eHQgICAgICAgfCAzNCArKysrKysrKysrKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9taXNjL3RpLHBhdC50eHQKCmRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWlzYy90aSxwYXQudHh0IGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21pc2MvdGkscGF0LnR4dApuZXcgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLmZhYzIwZDQ1YWQ0YwotLS0gL2Rldi9udWxs
CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9taXNjL3RpLHBhdC50eHQK
QEAgLTAsMCArMSwzNCBAQAorVGV4YXMgSW5zdHJ1bWVudHMgUGFnZS1iYXNlZCBBZGRyZXNzIFRy
YW5zbGF0b3IgKFBBVCkgZHJpdmVyIGJpbmRpbmcKKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisKK0EgUGFnZS1iYXNl
ZCBBZGRyZXNzIFRyYW5zbGF0b3IgKFBBVCkgZGV2aWNlIHBlcmZvcm1zIGFkZHJlc3MgdHJhbnNs
YXRpb24KK3VzaW5nIHRhYmxlcyBzdG9yZWQgaW4gYW4gaW50ZXJuYWwgU1JBTS4gRWFjaCBQQVQg
c3VwcG9ydHMgYSBzZXQgbnVtYmVyIG9mCitwYWdlcywgZWFjaCBvY2N1cHlpbmcgYSBwcm9ncmFt
bWFibGUgNEtCLCAxNktCLCA2NEtCLCBvciAxTUIgb2YgYWRkcmVzc2VzCitpbiBhIHdpbmRvdyBm
b3Igd2hpY2ggYW4gaW5jb21pbmcgdHJhbnNhY3Rpb24gd2lsbCBiZSB0cmFuc2xhdGVkLgorCitU
SS1QQVQgY29udHJvbGxlciBEZXZpY2UgTm9kZQorPT09PT09PT09PT09PT09PT09PT09PT09PT09
PT0KKworVGhlIFRJLVBBVCBub2RlIGRlc2NyaWJlcyB0aGUgVGV4YXMgSW5zdHJ1bWVudCdzIFBh
Z2UtYmFzZWQgQWRkcmVzcworVHJhbnNsYXRvciAoUEFUKS4KKworUmVxdWlyZWQgcHJvcGVydGll
czoKKy0tLS0tLS0tLS0tLS0tLS0tLS0KKy0gY29tcGF0aWJsZTogc2hvdWxkIGJlICJ0aSxqNzIx
ZS1wYXQiCistIHJlZy1uYW1lczoKKwltbXJzIC0gTWVtb3J5IG1hcHBlZCByZWdpc3RlcnMgcmVn
aW9uCisJdGFibGUgLSBMb2NhdGlvbiBvZiB0aGUgdGFibGUgb2YgdHJhbnNsYXRpb24gcGFnZXMK
Kwl3aW5kb3cgLSBXaW5kb3cgb2YgbWVtb3J5IGFkZHJlc3NlcyB0cmFuc2xhdGVkIGJ5IHRoaXMg
UEFUCistIHJlZzogcmVnaXN0ZXIgYWRkcmVzc2VzIGNvcnJlc3BvbmRpbmcgdG8gdGhlIGFib3Zl
CisKK0V4YW1wbGU6CisKK25hdnNzX3BhdDA6IHBhdEAzMTAxMDAwMCB7CisJY29tcGF0aWJsZSA9
ICJ0aSxqNzIxZS1wYXQiOworCXJlZyA9IDwweDAwIDB4MzEwMTAwMDAgMHgwMCAweDAwMDAwMTAw
PiwKKwkgICAgICA8MHgwMCAweDM2NDAwMDAwIDB4MDAgMHgwMDA0MDAwMD4sCisJICAgICAgPDB4
NDggMHgwMDAwMDAwMCAweDAwIDB4NDAwMDAwMDA+OworCXJlZy1uYW1lcyA9ICJtbXJzIiwKKwkg
ICAgICAgICAgICAidGFibGUiLAorCSAgICAgICAgICAgICJ3aW5kb3ciOworfTsKLS0gCjIuMTcu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
