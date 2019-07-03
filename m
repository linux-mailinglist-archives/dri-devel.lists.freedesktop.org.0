Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 744ED5F372
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D956E6E272;
	Thu,  4 Jul 2019 07:25:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BA846E15A
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 15:55:43 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x63FtgSH007274;
 Wed, 3 Jul 2019 10:55:42 -0500
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x63FtgbJ001448
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 3 Jul 2019 10:55:42 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 3 Jul
 2019 10:55:41 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 3 Jul 2019 10:55:41 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x63Ftejn070078;
 Wed, 3 Jul 2019 10:55:41 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <tomi.valkeinen@ti.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 0/8] drm/omap: OMAP_BO flags
Date: Wed, 3 Jul 2019 17:55:28 +0200
Message-ID: <20190703155536.28339-1-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Thu, 04 Jul 2019 07:25:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1562169342;
 bh=V+9dzJimbQJIctuihmoUi+cysBQgHBinz3LBcBsEslw=;
 h=From:To:CC:Subject:Date;
 b=lGGeM0of2erxgrgI5L28ypFLqKKyzT6jFE/XO2jjFqpBqJbwXhRkFZ+bPkyiDEZF/
 ++XABdrC14H9tLhf3wKJRhG0ihhURNYt2xZ6+O+7j7NSX72HvKDIJXvc+jXIOnz/pZ
 Ud1N6YGTEY6ghHnFrPTnvB0z3+89+EtpSai/TVlY=
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
Cc: Jean-Jacques Hiblot <jjhiblot@ti.com>, jsarha@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpUaGUgZmlyc3QgdmVyc2lvbiBvZiB0aGlzIHdvcmsgaGFkIGJlZW4gc2VudCBieSBUb21p
IFZhbGtlaW5lbiBpbiBtYXkgMjAxNyAKKGh0dHBzOi8vd3d3LnNwaW5pY3MubmV0L2xpc3RzL2Ry
aS1kZXZlbC9tc2cxNDA2NjMuaHRtbCkuCgpUaGlzIHNlcmllcyBhZGRzIGEgZmV3IG5ldyBPTUFQ
X0JPIGZsYWdzIHRvIGhlbHAgdGhlIHVzZXJzcGFjZSBtYW5hZ2UKc2l0dWF0aW9ucyB3aGVyZSBp
dCBuZWVkcyB0byB1c2UgbG90cyBvZiBidWZmZXJzLCBhbmQgd291bGQgY3VycmVudGx5IHJ1bgpv
dXQgb2YgVElMRVIgc3BhY2UuCkl0IGlzIGFsc28gdGhlIG9wcG9ydHVuaXR5IHRvIGRvIHNvbWUg
Y2xlYW51cCBpbiB0aGUgZmxhZ3MgYW5kIGltcHJvdmUgdGhlCmNvbW1lbnRzIGRlc2NyaWJpbmcg
dGhlbS4KCkpKCgpKZWFuLUphY3F1ZXMgSGlibG90ICgxKToKICBkcm0vb21hcDogdXNlIHJlZmNv
dW50IEFQSSB0byB0cmFjayB0aGUgbnVtYmVyIG9mIHVzZXJzIG9mIGRtYV9hZGRyCgpUb21pIFZh
bGtlaW5lbiAoNyk6CiAgZHJtL29tYXA6IGFkZCBvbWFwX2dlbV91bnBpbl9sb2NrZWQoKQogIGRy
bS9vbWFwOiBhY2NlcHQgTlVMTCBmb3IgZG1hX2FkZHIgaW4gb21hcF9nZW1fcGluCiAgZHJtL29t
YXA6IGNsZWFudXAgT01BUF9CTyBmbGFncwogIGRybS9vbWFwOiByZW1vdmUgT01BUF9CT19USUxF
RCBkZWZpbmUKICBkcm0vb21hcDogY2xlYW51cCBPTUFQX0JPX1NDQU5PVVQgdXNlCiAgZHJtL29t
YXA6IGFkZCBvbWFwX2dlbV92YWxpZGF0ZV9mbGFncygpCiAgZHJtL29tYXA6IGFkZCBPTUFQX0JP
IGZsYWdzIHRvIGFmZmVjdCBidWZmZXIgYWxsb2NhdGlvbgoKIGRyaXZlcnMvZ3B1L2RybS9vbWFw
ZHJtL29tYXBfZG1tX3RpbGVyLmggIHwgICAyICstCiBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9v
bWFwX2ZiLmMgICAgICAgICB8ICAgNiArLQogZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9n
ZW0uYyAgICAgICAgfCAxNTkgKysrKysrKysrKysrKysrLS0tLS0tLQogZHJpdmVycy9ncHUvZHJt
L29tYXBkcm0vb21hcF9nZW1fZG1hYnVmLmMgfCAgIDIgKy0KIGluY2x1ZGUvdWFwaS9kcm0vb21h
cF9kcm0uaCAgICAgICAgICAgICAgIHwgIDI3ICsrLS0KIDUgZmlsZXMgY2hhbmdlZCwgMTM0IGlu
c2VydGlvbnMoKyksIDYyIGRlbGV0aW9ucygtKQoKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
